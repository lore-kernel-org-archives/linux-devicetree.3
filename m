Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32CF3C062D
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647412; cv=none; b=gKM8CBsoalvDNnOVNkTJTkF5Cc3wpZ31yXnFyOyxz+/xHXMxcX++TrJVFhpkthQ9ryuFlSl0n19r0Su2ns5kuBXl+aCz0JbmCCW3PQFaXvAmRnhryr9TQ7OzliKrl/0K3/EjsRiRj+fYaDwBg/v9ExI2X3sAgwW0ohaHG8MF9Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647412; c=relaxed/simple;
	bh=1MdTFwon4JOk/xjZuVBgQseoutxqvisxz2XLn2wr3E4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NPKeGcB5lWoHz40z6N3Y+7vz//hQhDP9NkhoO76oSoPLTnGL1K3mDYhRX7+SyMbTjZfR1DBGTfisspziAvaNdV8wtppbW4hLmu0CsAFGndQSy/L+5NxJkiNq7qT1VsykIo+z2OIZN8Drlp+F4eNFQfR73+JuwQFnXMIudcR196g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d69+2dcr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d69+2dcr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76251F00893;
	Fri,  5 Jun 2026 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780647410;
	bh=+DG/q+/O7eWR1y+akr6BwSaLvKrOI4jiO5eXL4wrPHo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d69+2dcr78bHU9RCMLUF/XzxOJHEPp/AamFL6xVAY9gjA0B7B49QxafRmrWlnBa6Z
	 VbhyS4lwcDxnmuQW2+xWG4ooQa7/CysqEWuXm1WB/uKVGejmvDApraCkJ819Uffn4A
	 ajqtqNsi9X//2lfvxoC/9QwCsnSg7bqdf2uI1Pt6mIaEM5wdj0qrHjzObAIRwCCwUz
	 8Db1ZYyCXf2nNgu2Fkk1QXDoTQcBVmEp12Ldy3WPTl71pSwjBQiGepiDO2yFQ1hSot
	 18HWGKKa6YSPII8HIpOCDtOeEOwOr0HLQFb7pvwKslPFLz2C0eua89vsu07uep35Of
	 M4mK3uQcE+X+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 3/5] net: dsa: tag_ks8995: Add the KS8995
 tag handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604-ks8995-to-ksz8-v5-3-98baeb45e665@kernel.org>
References: <20260604-ks8995-to-ksz8-v5-3-98baeb45e665@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 08:16:49 +0000
Message-Id: <20260605081649.C76251F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Double free of skb in ks8995_xmit() and ks8995_rcv() on tag al=
location failures.
- [High] ks8995_xmit() fails to clear hardware-accelerated VLAN tags for no=
n-802.1Q protocols (like 802.1ad QinQ), breaking DSA port isolation.
--

commit 69e87755967f9829df353d79046ed354251e2a4a
Author: Linus Walleij <linusw@kernel.org>

net: dsa: tag_ks8995: Add the KS8995 tag handling

This commit adds ingress and egress tagging support for the KS8995 100Mbit
switch in the DSA subsystem. The tag is implemented as a modified 0x8100
ethertype tag.

> diff --git a/net/dsa/tag_ks8995.c b/net/dsa/tag_ks8995.c
> new file mode 100644
> index 0000000000000..5bdb182715827
> --- /dev/null
> +++ b/net/dsa/tag_ks8995.c

[ ... ]

> +static struct sk_buff *ks8995_xmit(struct sk_buff *skb, struct net_devic=
e *dev)
> +{
> +	struct vlan_ethhdr *hdr =3D vlan_eth_hdr(skb);
> +	bool have_hwaccel_tag =3D false;
> +	u16 tci =3D 0, portmask;
> +
> +	/* Prepare the special KS8995 tags */
> +	portmask =3D dsa_xmit_port_mask(skb, dev);
> +
> +	if (skb_vlan_tag_present(skb) && skb->vlan_proto =3D=3D htons(ETH_P_802=
1Q)) {
> +		tci =3D skb_vlan_tag_get(skb);
> +		__vlan_hwaccel_clear_tag(skb);
> +		have_hwaccel_tag =3D true;
> +	}

[Severity: High]
Does this strict check for ETH_P_8021Q fail to clear hardware-accelerated
VLAN tags for other protocols, such as 802.1ad?

If a non-802.1Q hwaccel tag is left intact, the conduit driver might offload
it as the outermost tag on the wire. Since the KS8995 switch expects its
STPID tag to immediately follow the MAC addresses, could seeing the unclear=
ed
tag instead cause it to misinterpret the DSA routing tag and bypass port
isolation?

> +
> +	if (have_hwaccel_tag || hdr->h_vlan_proto !=3D htons(ETH_P_8021Q)) {
> +		skb =3D vlan_insert_tag(skb, KS8995M_STPID(portmask), tci);
> +		if (!skb)
> +			return NULL;

[Severity: Critical]
Can this cause a double-free of the skb on allocation failure?

Looking at vlan_insert_tag(), it unconditionally consumes and frees the skb=
 if
it fails to allocate memory. However, returning NULL from a DSA tagger's xm=
it
routine instructs the caller, dsa_user_xmit(), to explicitly free the origi=
nal
skb again.

> +		hdr =3D vlan_eth_hdr(skb);
> +		netdev_dbg(dev, "%s: inserted VLAN TAG %04x TCI %04x\n",
> +			   __func__, hdr->h_vlan_proto, hdr->h_vlan_TCI);
> +	} else {

[ ... ]

> +static struct sk_buff *ks8995_rcv(struct sk_buff *skb, struct net_device=
 *dev)
> +{
> +	int portmask;
> +	u16 etype;

[ ... ]

> +	/* Move the custom DSA+VLAN tag into the hwaccel area and strip
> +	 * it from the skb head
> +	 */
> +	skb =3D skb_vlan_untag(skb);
> +	if (!skb) {
> +		netdev_err(dev, "%s: unable to untag skb\n", __func__);
> +		return NULL;
> +	}

[Severity: Critical]
Will this result in a double-free of the skb?

Similar to the xmit path, skb_vlan_untag() frees the skb when it encounters=
 an
error. Returning NULL from ks8995_rcv() instructs dsa_switch_rcv() to free =
the
skb a second time.

> +
> +	portmask =3D FIELD_GET(KS8995M_STPID_PORTMASK, etype);
> +	netdev_dbg(dev, "%s: etype %04x portmask %04x (%d)\n",
> +		   __func__, etype, portmask, ilog2(portmask));

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-ks8995-to-=
ksz8-v5-0-98baeb45e665@kernel.org?part=3D3
