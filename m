Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726469;
	b=RXMU8YPHTiJ0xPlWEda8e7jqeK8vRZ19RyaI7OPt+bBdQLylQHTuMC49l9XHgHTZv5Ni
	 /xgRgsVL0ykn355/IeieJSD4z+JwDWC7dTJv4YdESlv9tNme4gUmmntOHU+cDU7bwVlpw
	 6XzWRB6JW3C+seZJMVuAAtGjrRxqs5lMhX6Q7S3yp6eblUuNwcmibDQCfPG6rwASZv6QU
	 gN9aEY+ZuV/XVYos/naORZ+rqifVZR5vJozumvVWcfj/ZUvzVKh/7y84WBBUKPJCZAv5o
	 13ERSdT+fVvtJvpy55x//3tjVcxuJ175paIdyaMJM5QTywlslpkGRZHXpjgtM/V8zsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726469;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QiGK3cDCRFMuZgQyDeTMc15p+ve+/au1DRqJ4RyKd2Y=;
	b=TtiuFAReYjjvGIugyr9Px1zpa7KewO1nYijvevS8uFHfsgoIBi+5ZQkcY4sD8AcemGx5
	 yGBHlXNBw+ZKgqmr0vmFQR5jjuYW7AP8OdiX8ivT4uvY9+VrbQiuuONasW2eBRbJru5rB
	 +6aHxDeVwEiQJjtkrS0LiX5UWCl0AP4qm2P/KejYhHBBpSOcBEbdZNoKlBmrh2sSUeTOY
	 Zz48PlHWP5HR+aay6T++rKX2YWfWngebfxAdFtKq78R+OHyegHdp5UffnWU8RZxa25p0/
	 L2ym6YA8zzjnRx4F1Sipvk9si7Pc0716ZO/GE52ucow4BfX+8NVREdAK6TQXwqJKLhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jFzcPi0t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A349606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jFzcPi0t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030AA1F00896;
	Thu, 26 Nov 2026 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726469;
	bh=QiGK3cDCRFMuZgQyDeTMc15p+ve+/au1DRqJ4RyKd2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jFzcPi0tdoYIh2z0rlXM596siRYz6mmUfEwufx7tT5n+tRjNJdfv5nB5FR/XZoQr2
	 1OKl50aO/sx6H79ehQv8tMrZrHILxPfdGSt05k0BqwgiOGd//xuSJpAgEjTvWnTUQU
	 BobA0hYh5S5CNmANH9OPfU2tIKCfcONpinZ4liwnbuxQcWCGZOzdZbzJ/bJbngpl4G
	 GJh5MmhEapBVZ8yjGpw5a6X2VM6NERrr4nIQbPvk0OwZUnH9EZUgxHv/0ELrREbhsC
	 UdTyzrtOKQyNQFkWkNTvqxpUund5H847eQvii7V9+6tdLEHUicq/HrF+WPjvjkSyqI
	 /ZM/rifcDWKDw==
Message-ID: <sashiko-outbox-236171@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 2/7] net: dsa: add a QCA four-byte CPU
 tagger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-almondplus-offload-rfc-v1-2-703175c6340c@gmail.com>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <20261125-almondplus-offload-rfc-v1-2-703175c6340c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:54:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] net: dsa: qca4_private_parse() drops or misparses RX hwaccel
  VLAN frames
- [Medium] net: dsa: qca4_private_flow_dissect() underflows hlen on
  short skbs
- [Low] net: dsa: NULL pointer dereference in qca4_test_exit() on init
  failure
--

commit c8cea6af2b64b5e0ce96ccaac0aca53bdfc162fa
Author: Fil Dunsky <filipp.dunsky@gmail.com>

net: dsa: add a QCA four-byte CPU tagger

This commit adds a four-byte QCA DSA tag driver using the 0x8100
identifier and two-byte QCA metadata, along with KUnit tests for sk_buff
handling.

> diff --git a/net/dsa/tag_qca4.c b/net/dsa/tag_qca4.c
> new file mode 100644
> index 0000000000000..41375667978b2
> --- /dev/null
> +++ b/net/dsa/tag_qca4.c
[ ... ]
> +static int qca4_private_parse(struct sk_buff *skb, u16 *metadata)
> +{
> +	unsigned int reason;
> +	u8 *tag;
> +	u16 hdr;
> +
> +	if (skb_headroom(skb) < ETH_HLEN ||
> +	    !pskb_may_pull(skb, QCA4_PRIVATE_LEN)) {
> +		return -EINVAL;
> +	}
> +	if (skb_cow_head(skb, 0))
> +		return -ENOMEM;
> +	tag =3D dsa_etype_header_pos_rx(skb);
> +	if (get_unaligned_be16(tag) !=3D QCA4_PRIVATE_IDENTIFIER)
> +		return -EPROTO;
> +	hdr =3D get_unaligned_be16(tag + 2);
> +	if (FIELD_GET(QCA_HDR_RECV_VERSION, hdr) !=3D QCA_HDR_VERSION)
> +		return -EPROTO;
> +	reason =3D FIELD_GET(QCA_HDR_RECV_TYPE, hdr);
> +	/*
> +	 * These fixed14-byte pseudo-Ethernet formats are disabled in private4 =
mode.
> +	 * Never dispatch them into legacy MDIO/MIB callbacks with the wrong la=
yout.
> +	 * Other normal/trap reasons remain valid, including observed flooding0=
x19.
> +	 */
> +	if (reason =3D=3D QCA_HDR_RECV_TYPE_MIB ||
> +	    reason =3D=3D QCA_HDR_RECV_TYPE_RW_REG_ACK) {
> +		return -EOPNOTSUPP;
> +	}
> +	*metadata =3D hdr;
> +	return 0;
> +}
> +
> +static struct sk_buff *qca4_private_rcv(struct sk_buff *skb,
> +					struct net_device *conduit)
> +{
> +	struct net_device *user;
> +	u16 metadata;
> +	int port;
> +
> +	if (qca4_private_parse(skb, &metadata))
> +		goto drop;
> +	port =3D FIELD_GET(QCA_HDR_RECV_SOURCE_PORT, metadata);
> +	user =3D dsa_conduit_find_user(conduit, 0, port);
> +	if (!user)
> +		goto drop;
> +
> +	skb->dev =3D user;
> +	skb_pull_rcsum(skb, QCA4_PRIVATE_LEN);
> +	dsa_strip_etype_header(skb, QCA4_PRIVATE_LEN);

[Severity: High]
Because QCA4_PRIVATE_IDENTIFIER is 0x8100 (ETH_P_8021Q), a conduit NIC
with NETIF_F_HW_VLAN_CTAG_RX enabled strips the four-byte QCA4 tag into
skb->vlan_proto and skb->vlan_tci before passing the frame to the stack.

When skb_vlan_tag_present(skb) is true on receive, does
qca4_private_parse() read the inner EtherType at tag instead of the
stripped QCA4 tag?  Untagged ingress frames will fail the 0x8100 check
and be dropped with -EPROTO, while 802.1Q VLAN-tagged frames will have
their customer VLAN TCI parsed as the QCA4 header (allowing a crafted
VLAN tag to select the source port) before qca4_private_rcv() strips the
customer VLAN tag from the packet and leaves the raw QCA4 metadata in
skb->vlan_tci.

Other 0x8100-based taggers (such as lan9303_rcv(), ks8995_rcv() and
dsa_8021q_rcv()) check skb_vlan_tag_present(skb) on receive or push the
hardware-accelerated tag back inline before parsing.

> +
> +	/*
> +	 * DSA core pushes ETH_HLEN and invokes user eth_type_trans, exposing o=
nly
> +	 * the real inner EtherType/VLAN after the complete four-byte tag is go=
ne.
> +	 */
> +	return skb;
> +drop:
> +	kfree_skb(skb);
> +	return NULL;
> +}
> +
> +/*
> + * Called before rcv(): do not assume the metadata or inner EtherType is
> + * linear or even present. Keep the const skb and its layout unchanged.
> + */
> +static void qca4_private_flow_dissect(const struct sk_buff *skb, __be16 =
*proto,
> +				      int *offset)
> +{
> +	__be16 temporary;
> +	const void *inner;
> +
> +	*offset =3D QCA4_PRIVATE_LEN;
> +	*proto =3D 0;
> +	inner =3D skb_header_pointer(skb, 2, sizeof(temporary), &temporary);
> +	if (inner)
> +		*proto =3D get_unaligned((const __be16 *)inner);
> +}

[Severity: Medium]
When a frame is truncated (skb->len < QCA4_PRIVATE_LEN) or has fewer than
four linear bytes (skb_headlen(skb) < QCA4_PRIVATE_LEN), does setting
*offset =3D QCA4_PRIVATE_LEN unconditionally cause __skb_flow_dissect() to
underflow hlen and advance nhoff past the linear data?

net/core/flow_dissector.c:__skb_flow_dissect() {
    ...
		if (unlikely(netdev_uses_dsa(skb->dev))) {
			const struct dsa_device_ops *ops;
			int offset =3D 0;

			ops =3D skb->dev->dsa_ptr->tag_ops;
			if (ops->flow_dissect)
				ops->flow_dissect(skb, &proto, &offset);
			else
				dsa_tag_generic_flow_dissect(skb, &proto,
							     &offset);
			hlen -=3D offset;
			nhoff +=3D offset;
		}
    ...
}

When a BPF flow dissector is attached, __skb_flow_dissect() then passes a
negative hlen to bpf_flow_dissect(), where clamp_t(u16, flow_keys->nhoff,
nhoff, hlen) casts hlen to 65532..65535.  Like ks8995_flow_dissect(),
*offset should stay 0 when the tag header cannot be read (and
qca4_test_flow_dissect() updated accordingly).

> diff --git a/net/dsa/tag_qca4_kunit.h b/net/dsa/tag_qca4_kunit.h
> new file mode 100644
> index 0000000000000..cc520b7fb154b
> --- /dev/null
> +++ b/net/dsa/tag_qca4_kunit.h
[ ... ]
> +static int qca4_test_init(struct kunit *test)
> +{
> +	struct qca4_test_context *c =3D
> +		kunit_kzalloc(test, sizeof(*c), GFP_KERNEL);
> +	struct dsa_user_priv *p;
> +
> +	if (!c)
> +		return -ENOMEM;
> +	c->conduit =3D alloc_etherdev(0);
> +	c->netdev =3D alloc_etherdev(sizeof(*p));
> +	if (!c->conduit || !c->netdev) {
> +		if (c->conduit)
> +			free_netdev(c->conduit);
> +		if (c->netdev)
> +			free_netdev(c->netdev);
> +		return -ENOMEM;
> +	}
[ ... ]
> +	test->priv =3D c;
> +	return 0;
> +}
> +
> +static void qca4_test_exit(struct kunit *test)
> +{
> +	struct qca4_test_context *c =3D test->priv;
> +
> +	free_netdev(c->netdev);
> +	free_netdev(c->conduit);
> +}

[Severity: Low]
Can qca4_test_exit() hit a NULL pointer dereference if an allocation in
qca4_test_init() fails?  KUnit still invokes suite->exit(test) via
kunit_run_case_cleanup() when suite->init(test) returns an error, at
which point test->priv is NULL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-almondplus=
-offload-rfc-v1-0-703175c6340c@gmail.com?part=3D2
