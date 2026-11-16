Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868003;
	b=4ou3TgAe4cPZlAr9YBgo0oAsQh1DaYlzFCAVj1Q/2/AH8nd0J4rMvueLJ0rQjf1IiweO
	 TKhKHSpkLcjoArgd9KKbYRjJFoXpIdNK/43zUr3BVH1geivahdG9nBehCdYOCw3DksMyT
	 IIIV/chEEtwLl96R8qyBpNPU+JJWy896x5UJABHy0cLh+5PJxremfzZ8G6hJZ5o2dLLg8
	 RIKlP+LcBfObETd1qoyOqp0YWiHhKY69IHrtpogF+Jl753Td/u/zzQKHDx93vQH/OXSz+
	 mkDBlpsc8AcHq31j6Q3jRTMcQdJzA1vMXPy9h7YeXAb7qY3Z7KsZDJpuYg0MX5KTo9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868003;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=42NWJDQZ2EtkvUcsZu/X6ZQPyfzCVmcoYq5gbzwq5uY=;
	b=tHOec2+yOXTx3NUHidLe0yaGpTFIyGPWqbhIISXce2AcG86eAy7hW11Mbl5WcehCy/sB
	 DhGxpOBAWMWvCHoSknReqzunoF+ogNmCf2hJbYkLxStaQs8HNelv2uVZ8KqpDvK51HfHK
	 eUwGk3AeZXqUbtEKrm9YisOHjBF6MJiHLyKdW8uI96unWDS+B/dUBYzEGlUm5/IsJrV3v
	 Rv8hV5p0R2cgYJPRs3W0of9Lze8L59TVIGCmUjL8Fszvb6CR8rNCrMoxZwIL80JrPNcJQ
	 oKfSGnVBgstw6hH+xJc5KuL2DJzicvMANfToKLodoV6Q00K0NNWUvBIew7i3/zdjS3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g1b55Vy4;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575C7606A885
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575C7606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g1b55Vy4
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-9495d543c42so356887685a.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868000; x=1795472800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42NWJDQZ2EtkvUcsZu/X6ZQPyfzCVmcoYq5gbzwq5uY=;
        b=AgXzBrcKvl/IYY2cAOAyW6zxuj5elhOuArWsKb5mGf59rt1VydgOMWrd9jZYvRQxZQ
         8kCgk9QimGAMKqQ7iZ8bzi0k1SX176Dbw/3GBJw6ReqYLZvBIYoiYxWdPnW7+obMIBbH
         qFWJfKzkMD4zHQ3MK/JOxqEkaNyosaWsUIJmubqPbDy6x11tKzOgtqSn9iX3q+qOv8OQ
         qO5v/kLfZRbGOeF264ITXRR3Bumq9p6QjgBakjywygN1jwYtey7db30BR9gmbuEl/fFM
         QbWhqqsVkz6/ISvkL+xgSeHN3zVYWfMh4rPwI4Wr4MnvY/LlJo6zkXG/kF2/savO2a17
         0MAg==
X-Forwarded-Encrypted: i=1; AL+hErEhVj0lZVXz/FdANvwQG9Vv4v6/tpae3uieWNAkxSSy8tkEgra4Z7Lcnrkj4e3HIORCfbcCx9anB8V2@vger.kernel.org
X-Gm-Message-State: APuU4Z8/9PTBYKsQ7ij2VIZLeEZKO/6t1X/ebyNZFKktrQuxlP0k6fxJ
	A2Tx4F3QVwppOZpWLPATcrMOAi7SsyN3J2ajXYK/FgQxF0+cS6E3dnOBh3ORHSQxJwMURJfZKEu
	4/+L97y5BTAXkiQszZXxxHX8kEMXeeTlXjWXEFf98wjnjqMkp6cI3BO0ePtoxou2c1X+BE2AUh/
	On9VTcF/gOt49c53lCyygX6rb3hOnHdOdyO93fv/ee4ZEJjkpUwZ4ohVf9toLafzlh1Mp/cT4Q9
	1CFok9WOmctowfvMHswBQ==
X-Gm-Gg: AYBFou0N+9R95Q3sw1ZbvheU6z+U5jrRYqRsa0he63nvBXbUOe7CeJJtTKR05Az3ms7
	GmTgYxqQOkEDK2BWwnlJopfM79E0nICNixhGrVCqEwlNEEk3Wd75av+9Y+zbhlzehYSjT7jXb1Z
	xBpUnvLFVqv8Xwur5lcMEL9E375m/v8JBZhvDXHUuSifKKMQUrRg/30XJ/7y4rn3sxG9Q0IFAi0
	HU0WKo+K3DNt6tIhxH1RZ34HFn0pTGgIp4klbdqg9M6xPmb1lLCDBPw/hThIiCMoTc/lmXFQhsU
	vNDlvmO/X37F/2nBR+E32VbUXGK3keCnPqYoOFehJHWMiqchO0/8lkI/RX5DAt+4c8qHj6r5RRL
	0fJVh53sgwMuyMzf/pJ0l3UJDiTvC5//fWHaRIJdq0S1XHi+NAlbuFSz4A6aCNmbnwoVIlvUQ3v
	p748yvym7dQ0Tp5V5UivWXsb6O/DHqNnJpyqMRuWeL
X-Received: by 2002:a05:620a:90d0:20b0:949:4e06:bdfc with SMTP id af79cd13be357-9494e06c28emr1370519485a.21.1794868000500;
        Mon, 16 Nov 2026 14:26:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-920f54c2be3sm149806d6.7.2026.11.16.14.26.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so2242735eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867998; x=1795472798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42NWJDQZ2EtkvUcsZu/X6ZQPyfzCVmcoYq5gbzwq5uY=;
        b=g1b55Vy4GK1Siewxd/rgDAzsV5Q/ROCAgEryWCDkR8jpb7VrUTnU6kopTt1lWtahnY
         bQj7vzSoxUJs4aq+yGyfW9qO37Ir0yn+nseFdypXis2KsN+Li1rktx53wOfmdGCAtjvr
         aTXjWRJ0UCP1SQ3uIMeyuJZD7LvnjMRemvq4Q=
X-Forwarded-Encrypted: i=1; AL+hErHrm8rHik7YfS0U/Bo5vXT+CTvleFxc5MWynbOrNglXc/C4/UVIgSgFjYyCAmcZkQbojwkpGssW+G2e@vger.kernel.org
X-Received: by 2002:a05:7301:5401:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-37966f31fddmr10107870eec.19.1794867997689;
        Mon, 16 Nov 2026 14:26:37 -0800 (PST)
X-Received: by 2002:a05:7301:5401:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-37966f31fddmr10107844eec.19.1794867996950;
        Mon, 16 Nov 2026 14:26:36 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:35 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 6/9] net: flow_offload: allow drivers to validate and invalidate cached paths
Date: Mon, 16 Nov 2026 14:25:16 -0800
Message-ID: <20261116222519.1416501-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A classifier does not necessarily contain the mark, DSCP and output-
interface inputs used to select its forwarding path. A partial driver
FIB lookup cannot establish that a cached software route is stale.

Provide optional owner validation and invalidation callbacks. Validation
runs under RCU without sleeping and distinguishes a proven stale path
from unavailable context. Retain direct-path dst references for hardware
flowtables and validate the actual cached routes, cookies and direct
Ethernet neighbours in both directions on demand.

Mark references retained only for driver validation. They must not opt
plain direct flows into packet-path or GC route checks after unrelated
IPv4 generation changes. Keep the existing checks for direct tunnel,
neighbour and XFRM routes. The explicit owner callback bypasses that
policy and validates the retained dst itself. Other hardware users and
tables without a validating driver keep their existing automatic-check
behaviour. Software-only direct flows retain their previous reference
policy. Release retained references with the flow.

Netfilter implements invalidation by marking the owning connection for
teardown. Owners keep cookies valid through an RCU grace period after
DESTROY; drivers stop issuing notifications when their rules are
destroyed.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 include/net/flow_offload.h            | 12 ++++++
 include/net/netfilter/nf_flow_table.h |  8 ++--
 net/netfilter/nf_flow_table_core.c    | 12 +++---
 net/netfilter/nf_flow_table_offload.c | 58 +++++++++++++++++++++++++++
 net/netfilter/nft_flow_offload.c      |  6 ++-
 5 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/include/net/flow_offload.h b/include/net/flow_offload.h
index 70a02ee14308..09301a924014 100644
--- a/include/net/flow_offload.h
+++ b/include/net/flow_offload.h
@@ -697,6 +697,18 @@ struct flow_cls_offload {
 	bool use_act_stats;
 	unsigned long cookie;
 	struct flow_rule *rule;
+	/* Optional owner notification when a rule no longer represents the path.
+	 * Call under RCU; the owner retains the cookie and callback until a
+	 * grace period after DESTROY. Drivers must stop new calls at DESTROY.
+	 * The callback must not sleep or call back into the offload driver.
+	 */
+	void (*invalidate)(unsigned long cookie);
+	/* Optional cached-path validation, called under RCU during REPLACE.
+	 * Return 0 for a valid path, -ESTALE for a demonstrably stale path,
+	 * or -EOPNOTSUPP when validation is unavailable. Do not sleep or
+	 * call back into the driver. The callback does not invalidate its owner.
+	 */
+	int (*validate)(unsigned long cookie);
 	struct flow_stats stats;
 	u32 classid;
 };
diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index 5b22d31cb140..99cb087ff0b2 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -154,7 +154,8 @@ struct flow_offload_tuple {
 					encap_num:2,
 					needs_gso_segment:1,
 					tun_num:2,
-					in_vlan_ingress:2;
+					in_vlan_ingress:2,
+					dst_validation_only:1;
 	u16				mtu;
 	u32				dst_cookie;
 	struct dst_entry		*dst_cache;
@@ -305,7 +306,7 @@ nf_flow_table_offload_del_cb(struct nf_flowtable *flow_table,
 }
 
 void flow_offload_route_init(struct flow_offload *flow,
-			     struct nf_flow_route *route);
+			     struct nf_flow_route *route, bool keep_dst);
 
 int flow_offload_add(struct nf_flowtable *flow_table, struct flow_offload *flow);
 void flow_offload_refresh(struct nf_flowtable *flow_table,
@@ -313,7 +314,8 @@ void flow_offload_refresh(struct nf_flowtable *flow_table,
 
 static inline bool nf_flow_dst_check(struct flow_offload_tuple *tuple)
 {
-	if (!tuple->dst_cache)
+	/* A driver-only reference must not change direct-path/GC semantics. */
+	if (!tuple->dst_cache || tuple->dst_validation_only)
 		return true;
 
 	return dst_check(tuple->dst_cache, tuple->dst_cookie);
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 4c82097cd50b..b16a336101af 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -96,7 +96,7 @@ static struct dst_entry *nft_route_dst_fetch(struct nf_flow_route *route,
 
 static int flow_offload_fill_route(struct flow_offload *flow,
 				   struct nf_flow_route *route,
-				   enum flow_offload_tuple_dir dir)
+				   enum flow_offload_tuple_dir dir, bool keep_dst)
 {
 	struct flow_offload_tuple *flow_tuple = &flow->tuplehash[dir].tuple;
 	struct dst_entry *dst = nft_route_dst_fetch(route, dir);
@@ -127,7 +127,9 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 
 	switch (route->tuple[dir].xmit_type) {
 	case FLOW_OFFLOAD_XMIT_DIRECT:
-		if (route->tuple[!dir].in.num_tuns) {
+		flow_tuple->dst_validation_only = keep_dst &&
+			!route->tuple[!dir].in.num_tuns;
+		if (keep_dst || route->tuple[!dir].in.num_tuns) {
 			flow_tuple->dst_cache = dst;
 			flow_tuple->dst_cookie =
 				flow_offload_dst_cookie(flow_tuple);
@@ -162,10 +164,10 @@ static void nft_flow_dst_release(struct flow_offload *flow,
 }
 
 void flow_offload_route_init(struct flow_offload *flow,
-			     struct nf_flow_route *route)
+			     struct nf_flow_route *route, bool keep_dst)
 {
-	flow_offload_fill_route(flow, route, FLOW_OFFLOAD_DIR_ORIGINAL);
-	flow_offload_fill_route(flow, route, FLOW_OFFLOAD_DIR_REPLY);
+	flow_offload_fill_route(flow, route, FLOW_OFFLOAD_DIR_ORIGINAL, keep_dst);
+	flow_offload_fill_route(flow, route, FLOW_OFFLOAD_DIR_REPLY, keep_dst);
 	flow->type = NF_FLOW_OFFLOAD_ROUTE;
 }
 EXPORT_SYMBOL_GPL(flow_offload_route_init);
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 4365859220e6..1f3adf70f598 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -885,6 +885,62 @@ static int nf_flow_offload_alloc(const struct flow_offload_work *offload,
 	return 0;
 }
 
+static struct flow_offload *nf_flow_offload_cookie_flow(unsigned long cookie)
+{
+	struct flow_offload_tuple *tuple = (struct flow_offload_tuple *)cookie;
+	struct flow_offload_tuple_rhash *tuplehash;
+	struct flow_offload *flow;
+
+	tuplehash = container_of(tuple, struct flow_offload_tuple_rhash, tuple);
+	flow = container_of(tuplehash, struct flow_offload, tuplehash[tuple->dir]);
+	return flow;
+}
+
+static void nf_flow_offload_invalidate(unsigned long cookie)
+{
+	flow_offload_teardown(nf_flow_offload_cookie_flow(cookie));
+}
+
+static int nf_flow_offload_validate(unsigned long cookie)
+{
+	struct flow_offload *flow = nf_flow_offload_cookie_flow(cookie);
+	unsigned int dir;
+
+	for (dir = 0; dir < FLOW_OFFLOAD_DIR_MAX; dir++) {
+		struct flow_offload_tuple *tuple = &flow->tuplehash[dir].tuple;
+		struct flow_offload_tuple *other = &flow->tuplehash[!dir].tuple;
+		struct dst_entry *dst = tuple->dst_cache;
+		struct neighbour *neigh;
+		u8 mac[ETH_ALEN];
+		bool valid;
+
+		if (!dst)
+			return -EOPNOTSUPP;
+		/* This is the actual route selected with the packet's policy
+		 * context, including mark, DSCP and the reverse lookup's oif.
+		 */
+		if (!dst_check(dst, tuple->dst_cookie))
+			return -ESTALE;
+		if (tuple->xmit_type != FLOW_OFFLOAD_XMIT_DIRECT)
+			continue;
+		/* A stacked path may have a different final Ethernet neighbour.
+		 * Do not mistake that unsupported context for a stale owner.
+		 */
+		if (dst->dev->ifindex != tuple->out.ifidx)
+			return -EOPNOTSUPP;
+		neigh = dst_neigh_lookup(dst, &other->src_v4);
+		if (!neigh)
+			return -ESTALE;
+		neigh_ha_snapshot(mac, neigh, dst->dev);
+		valid = (READ_ONCE(neigh->nud_state) & NUD_VALID) &&
+			ether_addr_equal(mac, tuple->out.h_dest);
+		neigh_release(neigh);
+		if (!valid)
+			return -ESTALE;
+	}
+	return 0;
+}
+
 static void nf_flow_offload_init(struct flow_cls_offload *cls_flow,
 				 __be16 proto, int priority,
 				 enum flow_cls_command cmd,
@@ -896,6 +952,8 @@ static void nf_flow_offload_init(struct flow_cls_offload *cls_flow,
 	cls_flow->common.extack = extack;
 	cls_flow->command = cmd;
 	cls_flow->cookie = (unsigned long)tuple;
+	cls_flow->invalidate = nf_flow_offload_invalidate;
+	cls_flow->validate = nf_flow_offload_validate;
 }
 
 static int nf_flow_offload_tuple(struct nf_flowtable *flowtable,
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index d3c5651dd699..05207ca808ee 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -113,7 +113,11 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
 	if (!flow)
 		goto err_flow_alloc;
 
-	flow_offload_route_init(flow, &route);
+	/* Hardware admission may validate the route used to build a direct path.
+	 * Keep its reference and cookie instead of reconstructing a lookup with
+	 * incomplete policy-routing inputs in the driver.
+	 */
+	flow_offload_route_init(flow, &route, nf_flowtable_hw_offload(flowtable));
 	if (tcph)
 		flow_offload_ct_tcp(ct);
 
-- 
2.53.0

