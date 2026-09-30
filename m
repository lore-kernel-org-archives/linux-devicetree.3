Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF383B3C1A
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754615; cv=none; b=hdwtoFCjefMRJMXvT37lIgLACV21kfJz0K6sFZBrn7q40JantmOixelnxvp9BdNWifu1dFPAWFclxg/4SVYeoYKQqZAqEom6BehiIBBSM4s1ZyqkFfI7xVknsmgalnJFUDtxLFws8dNbTFvDRBTFZnxOtewCBGzRZz6Hf2wv0g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754615; c=relaxed/simple;
	bh=P3dGCACctEFsbMtRjDD8oecud1nYK5JWG5phxyVrt30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GtB4bBqiyT60+K392oU5YwtFILBuy+9Q5nlUyz9uq3S3bBHRdDMx4I04F9b2Q69xyjhVWcJltMgY21iSEY4dpxI6EK7nQ8p8OJTB2kRDtRXq2QqMQ6FCwcJXFgJyagNGeeSEMweaWUYMHA6oFbfGSjo5rRtIMSS7l5r1amdPV+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XojeAhyt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XojeAhyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004D61F00893;
	Wed, 30 Sep 2026 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754610;
	bh=Uj4AuatUA3uxFxO9ANtSJATMd9fraxjFbqQpyk8vmdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XojeAhytQ8cHbkykSxckiepQ5N31Nd3lE5jo+XdAhNha5NsRo7kn11el9Ya4NXoaM
	 vkHF+zPS9LmQL9xeT+HcOmDGg0qnniPI212A38JinHgpd8Q0q3Bo5AUlHcl3vNRRuo
	 HbERa0QhhrPL9j0VqnOJWa7qOJ0TO+AKfjs5t54OkdSsiDFPDj8M8Gx+++bWt2O0q0
	 hkCA3ExYYxqQKtiRG9Wl11czyeQ427EblaTZJOAbkuL5/e+Ljk78wAy3R9wwewUi7Q
	 +41L7KTjxaePwr8GeCmjpNnINJF16/KOmBonqZ8oHoxjFuQH1CT2/bypO8rttEJaR4
	 C3mbaTan6yVmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 1/9] net: dsa: add tag driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929-dsa_lan9645x_switch_driver_base-v13-1-827c2d3617f2@microchip.com>
References: <20260929-dsa_lan9645x_switch_driver_base-v13-0-827c2d3617f2@microchip.com>
 <20260929-dsa_lan9645x_switch_driver_base-v13-1-827c2d3617f2@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:50:09 +0000
Message-Id: <20260930075010.004D61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] net: dsa: lan9645x: VLAN hopping via fragmented in-band VLAN t=
ags
--

commit f7552b4bce99ac2975ea8145332463c0a3772965
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: add tag driver for LAN9645X

This commit adds a DSA tag driver for LAN9645x switches using an NPI port.
It implements asymmetric prefix configurations, using a long prefix for
extraction and an internal frame header (IFH) for both extraction and
injection.

> diff --git a/net/dsa/tag_lan9645x.c b/net/dsa/tag_lan9645x.c
> new file mode 100644
> index 0000000000000..f54646d4b3947
> --- /dev/null
> +++ b/net/dsa/tag_lan9645x.c

[ ... ]

> +static struct sk_buff *lan9645x_xmit_get_vlan_info(struct sk_buff *skb,
> +						   struct net_device *br,
> +						   u32 *vlan_tci,
> +						   u32 *tag_type)
> +{
> +	struct vlan_ethhdr *hdr;
> +	u16 proto, tci;

[ ... ]

> +	if (skb_headlen(skb) >=3D VLAN_ETH_HLEN &&
> +	    ntohs(hdr->h_vlan_proto) =3D=3D proto) {
> +		vlan_remove_tag(skb, &tci);
> +		*vlan_tci =3D tci;
> +	} else {

[Severity: Critical]
Does this logic allow VLAN isolation bypass for fragmented in-band VLAN tag=
s?=20

If a user with raw socket access constructs a frame where the 14-byte MAC
header is linear, but the in-band 802.1Q VLAN tag is placed in paged
fragments, skb_headlen(skb) >=3D VLAN_ETH_HLEN will evaluate to false.

Instead of linearizing the header to securely process the VLAN tag using
pskb_may_pull(), the code takes this else branch. This misclassifies the
packet as untagged and assigns it the bridge's PVID, leaving the original
spoofed 802.1Q tag untouched in the payload.

When the frame is later injected into the switch, the hardware rewriter won=
't
pop the payload tag since the switch believes the frame is untagged. The
packet would then be transmitted on the wire retaining the user's spoofed
802.1Q tag, completely bypassing the bridge's VLAN filtering and isolation.

> +		rcu_read_lock();
> +		br_vlan_get_pvid_rcu(br, &tci);
> +		rcu_read_unlock();
> +		*vlan_tci =3D tci;
> +	}
> +
> +	*tag_type =3D (proto !=3D ETH_P_8021Q) ? LAN9645X_IFH_TAG_TYPE_S :
> +					     LAN9645X_IFH_TAG_TYPE_C;
> +
> +	return skb;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-dsa_lan964=
5x_switch_driver_base-v13-0-827c2d3617f2@microchip.com?part=3D1
