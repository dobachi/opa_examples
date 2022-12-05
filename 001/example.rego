package example

# allow のデフォルト値を false に設定します
default allow = false

# violation の要素数が 0 の場合、 allow を true に設定します
allow = true {
    count(violation) == 0
}

# 生成した集合 public_server の要素 server のうち protocols が "http" である要素の id を集合 violation の要素に追加します
violation[server.id] {
    some server
    public_server[server]
    server.protocols[_] == "http"
}

# 配列 input.servers の要素 server のうち protocols が "telnet" である要素の id を集合 violation の要素に追加します
violation[server.id] {
    server := input.servers[_]
    server.protocols[_] == "telnet"
}

# 配列 input.servers の要素 server のうち以下の条件を満たす要素を集合 public_server の要素に追加します
# 1. 配列 input.ports のうち server.ports のいずれかと id が合致する要素の添字を i とします
# 2. 配列 input.networks のうち input.ports[i].network と id が合致する要素の添字を j とします
# 3. input.networks[j].public が true である場合、 server を集合 public_server の要素に追加します
public_server[server] {
    some i, j
    server := input.servers[_]
    server.ports[_] == input.ports[i].id
    input.ports[i].network == input.networks[j].id
    input.networks[j].public
}
