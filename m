Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39EF197A7D
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280413; cv=none; b=hPTYDZJd4OFkx4qJbBUuZnlxuvT41k+H+YHrVw8e+yVDpF2oAxsPNlFM7aoB8XxFk13WJQHe/njT8ARfdIEJuMZtNYrStdw11f0V2iJhlbj8vvMfjWuT07H76Z09eyn2oaNbCqU+s4ozpd8qvX1LLMHy/bwJezFDxiQy5Awg2ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280413; c=relaxed/simple;
	bh=4l+I6qoRsOtEoO4+N8koCTmjb6ot5wXbtYUGjB/R02Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bIgggW3hbAWqDE6CWubtAYyrZ3YuSiP3YerLsVcyRUoKSsCGcAGxlUO/oBYJWBLQJ77iYwgapA7ivKrvE0Yivzpr03qCyP1/48c7QRHcbhmoVMx+rUXG+go6weeCBuIrM7IdAOvueh7O1OxaGe0s4OJC6peeHsTgQRkFtBpUfy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QspWO1M2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QspWO1M2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBB31F000E9;
	Sun,  5 Jul 2026 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783280412;
	bh=/5egO2Qe30wnwB1AvbddC8d9nWx17nEtHDzOJdAlpfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QspWO1M2aXT3o/NykqsP3boss0uROpqgmMK4JKIj2+yJOkAy/7BLMND50wQhuYoWg
	 95nkwjAWInkHQDr9OiumwLctBH56aRQEcX9P8DgOCkYWPR4uEE8uAMBgHf/pTpSwzO
	 kxHYwbTjPHwJ7VxtxYXuwKXDMLnjcpghWEWMAVf4YJOFQ2KIhu3zxErIq6XkQfdNf/
	 6mnzHHuhgMqvy15u8tOGDgjFIEAicA5O71P5Dj6NLEIdnwnyaLCTiHcBETbk6Ck1fT
	 A4OH5UB8tyqmgKUf8iCjL0/t8A+hXTs6zcqbPZjVQAppoZ2UuD2c7DOUm7K9obGVGz
	 NlgHFv8DLATow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 3/5] net: dsa: tag_ks8995: Add the KS8995
 tag handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260704-ks8995-to-ksz8-v7-3-2af0eaa545a8@kernel.org>
References: <20260704-ks8995-to-ksz8-v7-0-2af0eaa545a8@kernel.org>
 <20260704-ks8995-to-ksz8-v7-3-2af0eaa545a8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:40:12 +0000
Message-Id: <20260705194012.6FBB31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware-accelerated non-802.1Q VLAN tags (e.g., 802.1ad) are impr=
operly retained in the SKB, resulting in outer hardware insertion that brea=
ks KS8995 tag offset requirements.
--

commit e468dc8fd143415f68c52754f1aefda21e1be71b
Author: Linus Walleij <linusw@kernel.org>

net: dsa: tag_ks8995: Add the KS8995 tag handling

This commit adds the ingress and egress KS8995 tag handling code for the
KS8995 100Mbit switch. The tag uses a modified 0x8100 ethertype to encode
the target ports.

> diff --git a/net/dsa/tag_ks8995.c b/net/dsa/tag_ks8995.c
> new file mode 100644
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

[Severity: High]
Will this drop or misroute packets with non-802.1Q hardware-accelerated VLAN
tags (such as 802.1ad)?

By strictly checking for ETH_P_8021Q, other hardware-accelerated tags are
left in the SKB metadata. When the master network interface transmits the
packet, it might insert this hardware VLAN tag outside the payload.

This insertion would shift the KS8995 DSA tag away from offset 12, which
is where the switch hardware strictly expects it to be. Should the driver
push all hardware-accelerated tags into the payload (for example, by using
__vlan_hwaccel_push_inside()) before inserting the DSA switch tag?

> +		tci =3D skb_vlan_tag_get(skb);
> +		__vlan_hwaccel_clear_tag(skb);
> +		have_hwaccel_tag =3D true;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704-ks8995-to-=
ksz8-v7-0-2af0eaa545a8@kernel.org?part=3D3
