Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726471;
	b=3s5HNbCw5uidM+YjljrtQN9a23EqvutSJ39dTWup1SI89Bvlb3Ymo14qZqJkPd6JdolP
	 lfCP4Q7jtR8V8FJB9TE5LfRMEH/0J0ELD9lK1ibyzjKbjohDjgEV/o+Ttpp+CXcxtYY6A
	 h3WVZIRTPFgr9094tsiQatZIZSNJuhFo6GA01O90c+Yu+j67OxlYBo/FunH0Hkgqiq5a2
	 cFFIxQJMolaABU2jg+LJXeYJ6Q9rXMe1BTL4tgZQEvE9yr8dsgML4+xWBf31YGsg4NtsH
	 V9riXOGAtqQU3H55WdAYOL89Pl5bCDFMgMmL31gym+8tMu8oUE7PWQp4m/i5rXxoi/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726471;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dnDF3uOWaroiW9XJCk+L2pcTMHI0yoXIhzGgfsVw/8Y=;
	b=IBevy++90r4nk4AjhgwPS4kZeJmNfdle4J5PCZmESp3YVVNJCg/VIN07t28cv+nfZhlm
	 b7OtK4LCq+hA6LVm/lWxxnA39fuRKOQTjpCJohjUkYThlLP0uiWyDwNRrU+gpUvg3npUs
	 gJZgulUpajxqW1lkYyMNBtWKTxi+L4nq54c0QPXq3iHk+Z5TFPNuFxgbzeLV0qOjHBpRd
	 yJQy0yQXDVuIL99YMtHausJv9VkU7YMmvlizC4oW6F4NsZzxxzLhnsZyKSBw+uyuUDZVI
	 LQ/5szPngW/8208oaMj53MYe8VwnIkRPg4M9DevD4cqnMuJIJ6bjl3vEwzgpHuW3iPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TGDcTRaV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47B9606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TGDcTRaV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819FD1F00923;
	Thu, 26 Nov 2026 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726471;
	bh=dnDF3uOWaroiW9XJCk+L2pcTMHI0yoXIhzGgfsVw/8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TGDcTRaVOjkFplZuxzfu3E0EMRah0jwSVc4/7BXQP0hVTl8rPKU5PQ5ls2QdqOvwZ
	 hjSJ+K0zCJI2rlsX9viLNgy3+zrXaR1TytdvX/PR59Q3QjSqy0INR9LO7Z0RqmyW5v
	 gs6uP99nORnlICFnpprARqWbkdwUwlUJVlwqEVQ/EfxnaAk9/FLPTe78dyvHLc0TdT
	 cbgLwKfD04vfS5VY4jDs79Ive+VEBF/BqWW6Pqtcn3SkM2gUtBPTKtvi5YkWzByakF
	 0SG+wUliTgwrJdFEN2+/rAQjVcaAD4ExhQPxpQZrkXzQovKNMY7hnyS6SgzmA620Ru
	 cC5gp+iGHtjOQ==
Message-ID: <sashiko-outbox-236175@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 6/7] net: cortina: connect wired IPv4 NAT
 to nftables hardware flowtables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-almondplus-offload-rfc-v1-6-703175c6340c@gmail.com>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <20261125-almondplus-offload-rfc-v1-6-703175c6340c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:54:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: cortina: native_rule() withdraws active offload rules
  after 2s expiry
--

commit 3485cf5bb03e313d42563aa90d0681cf27485447
Author: Fil Dunsky <filipp.dunsky@gmail.com>

net: cortina: connect wired IPv4 NAT to nftables hardware flowtables

This commit adds an nftables hardware flowtable frontend for the CS7542
forwarding engine, translating established IPv4 TCP and UDP NAT flows
across the QCA8337 DSA switch into checked hardware leases.

> diff --git a/drivers/net/ethernet/cortina/flowtable/cs7542_fw4.c b/driver=
s/net/ethernet/cortina/flowtable/cs7542_fw4.c
> new file mode 100644
> index 0000000000000..d5a132e877b0f
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/flowtable/cs7542_fw4.c
[ ... ]
> +static enum native_reason
> +prepare_request(struct native_binding *b, struct flow_cls_offload *cls,
> +		struct cs7542_fe_native_request *request)
> +{
[ ... ]
> +	tuple =3D (struct cs7542_l4_tuple){
> +		.src =3D facts.rewrite.before.src,
> +		.dst =3D facts.rewrite.before.dst,
> +		.sport =3D facts.rewrite.before.sport,
> +		.dport =3D facts.rewrite.before.dport,
> +		.ip_proto =3D htonl(facts.ip_proto),
> +	};
> +	if (cs7542_rx_path_lookup(b->conduit, in.port, &tuple, &wire))
> +		return NATIVE_WIRE;
> +	if (!fdb_matches(ip, wire.source) ||
> +	    !fdb_matches(op, facts.rewrite.dmac))
> +		return NATIVE_PATH;
[ ... ]
> +}
[ ... ]
> +static int native_rule(void *ctx, u64 id, struct flow_cls_offload *cls)
> +{
[ ... ]
> +	if (!rtnl_trylock()) {
> +		reason =3D NATIVE_PATH;
> +		result =3D cs7542_fe_live_reject(b->owner, b->handle, cls->cookie,
> +					       b->version, -EBUSY);
> +	} else {
> +		reason =3D prepare_request(b, cls, &request);
> +		if (reason =3D=3D NATIVE_OWNER && request.route_mtu &&
> +		    replace_native) {
> +			result =3D native_replace_checked(b, cls, &request,
> +							&reason);
> +		} else {
> +			result =3D cs7542_fe_live_reject(b->owner, b->handle,
> +						       cls->cookie, b->version,
> +						       -EOPNOTSUPP);
> +		}
> +		rtnl_unlock();
> +	}
> +	atomic64_inc(&counts[reason]);
> +	return result;
> +}

[Severity: Medium]
Can a refresh FLOW_CLS_REPLACE tear down an already-installed hardware
rule for cls->cookie once its 2-second CPU observation in paths[] expires?

Once a flow direction is offloaded in hardware, its packets bypass the CPU
ETH_P_XDSA observer and its path_entry expires after PATH_AGE (2 * HZ).
If a packet of the connection later hits the software flowtable path (for
example, because the opposite direction stayed in software after a hash
collision in the 128-slot direct-mapped paths[] table, where remember()
keeps refreshing an active CPU flow's slot), flow_offload_refresh()
re-issues FLOW_CLS_REPLACE for both directions.

prepare_request() then fails in cs7542_rx_path_lookup() with NATIVE_WIRE
before reaching cs_be_replace()'s idempotent check for an existing cookie,
and native_rule() calls cs7542_fe_live_reject() (as it also does on
transient rtnl_trylock() contention), withdrawing the active hardware
lease.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-almondplus=
-offload-rfc-v1-0-703175c6340c@gmail.com?part=3D6
