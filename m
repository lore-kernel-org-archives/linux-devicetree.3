Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADDA399CF5
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429480; cv=none; b=kV19gXCPFqmDXn80xEojFIKoMcdTICvBoxoWnCgAYClJCctCQCoZIU9rofOBN/rsVKJBrK0BLP4R4NQ3Bz5ISW0YrzPFlxKn8OzoGGqFojp+B8r45rs3+F3lbKAOklRFKbsLZhd0K4fxrU1kKBB3Chd3V/k23pd8iWiGJ/NKUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429480; c=relaxed/simple;
	bh=Txl8ZZeqvho2SdGAbaRLRorOnpkzhnSlMNIqadYRfk0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rMx3dEJTQyacWAn0lPEGicn3E+9ju8cVc18gC7sX2enL3ZaFTRVyGv57wD4Nl9uPBr00Hey93bKq2ckg6MlJifQ62Dn4LcMAenZP6+YFXsCc8R4Fk0GXWOcQc57F52jM3MlWXem6Xk+ZKAhW8YutNOxX+KUOUMNwU9CaeVs8pl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxUg4kv8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxUg4kv8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CD21F000E9;
	Thu, 30 Jul 2026 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785429479;
	bh=FnjRE7U4omQjhM0fY0eZtIZzyFZCLoqtzhYNiQphSE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kxUg4kv87ZhhvWgbdulxQXg8wHBUustdbCYJ3DBHK+hiAV8AMwNGVD6JILSkTt0i+
	 MD8ugZNj6QDE9NBHnAMtMbGEiU4Ga6HV3zHbp/BbXZZXLzFiau3XJEgmsRj7HvKB5u
	 FJUOlTCKOpAOnUHLptHvVzRsSbVr8vXsLeJVTJWFdKqr0T8BngLSLedKM4zJkOLWcG
	 pPWPB5mKhZZjX6vwnEVYBf0USNO64J4dBIxPQ/8FitsI97GiNBPnHkk5IF+ObHomiL
	 w2sBuHi3Dlj3SpxY9B2QJR24QEZR4lmIS8MNAcRJbiC1rPXbxwkQYwiEM3E6FazanJ
	 D4jvIod0aX7VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] net: dsa: Add support for SoC-e SDSA tags
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729-devel-vstrassheim-soce-dsa-ml-v1-3-be569dae1b20@linutronix.de>
References: <20260729-devel-vstrassheim-soce-dsa-ml-v1-0-be569dae1b20@linutronix.de>
 <20260729-devel-vstrassheim-soce-dsa-ml-v1-3-be569dae1b20@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:37:58 +0000
Message-Id: <20260730163759.15CD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `sdsa_xmit` and `sdsa_rcv` functions leak the SKB on all error=
 paths by returning `NULL` without freeing the buffer, leading to memory ex=
haustion.
--

--- Patch [3]: [PATCH 3/4] net: dsa: Add support for SoC-e SDSA tags ---
commit d07af353633eb9eecc24042cfdf75f9ecf082368
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

net: dsa: Add support for SoC-e SDSA tags

Adds a DSA tagger for the SoC-e SDSA header format used between
the conduit and SoC-e switch ports.

> diff --git a/net/dsa/tag_sdsa.c b/net/dsa/tag_sdsa.c
> new file mode 100644
> --- /dev/null
> +++ b/net/dsa/tag_sdsa.c

[ ... ]

> +static struct sk_buff *sdsa_xmit(struct sk_buff *skb, struct net_device =
*dev)
> +{
> +	struct dsa_port *dp =3D dsa_user_to_port(dev);
> +	u8 *sdsa_header;
> +
> +	if (skb_cow_head(skb, SDSA_HLEN) < 0)
> +		return NULL;

[Severity: High]
Does this leak the skb when skb_cow_head() fails? The DSA core expects the
tagger to consume and free the skb if it returns NULL on transmission. Shou=
ld
this call kfree_skb() before returning?

[ ... ]

> +static struct sk_buff *sdsa_rcv(struct sk_buff *skb, struct net_device *=
dev)
> +{
> +	u8 *sdsa_header;
> +	int source_port;
> +	u8 frame_type;
> +
> +	if (unlikely(!pskb_may_pull(skb, SDSA_HLEN)))
> +		return NULL;

[Severity: High]
Does this error path leak the skb? If a malformed packet causes
pskb_may_pull() to fail, returning NULL without freeing the buffer could
allow network traffic to cause memory exhaustion.

> +
> +	sdsa_header =3D dsa_etype_header_pos_rx(skb);
> +
> +	/* Check that the frame type is TO_CPU. */
> +	frame_type =3D FIELD_GET(SDSA_TAG_FRAME_TYPE_MASK, sdsa_header[4]);
> +	if (frame_type !=3D 0)
> +		return NULL;

[Severity: High]
Should the skb be freed here when the frame type check fails to avoid a
memory leak?

> +
> +	/* VLAN-tagged traffic is intentionally unsupported yet. */
> +	if (sdsa_header[4] & SDSA_TAG_VLAN_BIT)
> +		return NULL;

[Severity: High]
Could unsupported VLAN-tagged traffic trigger a memory leak here?

> +
> +	/* Determine the source port from the two port fields. */
> +	source_port =3D ((sdsa_header[4] & 0x1f) << 5) |
> +		      ((sdsa_header[5] & 0xf8) >> 3);
> +
> +	skb->dev =3D dsa_conduit_find_user(dev, 0, source_port);
> +	if (!skb->dev)
> +		return NULL;

[Severity: High]
Does this also leak the skb if the conduit cannot find a corresponding user
device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-devel-vstr=
assheim-soce-dsa-ml-v1-0-be569dae1b20@linutronix.de?part=3D3
