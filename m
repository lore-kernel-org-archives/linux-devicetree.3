Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E310D4746A6
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246409; cv=none; b=Kc8Xzv8w57qUyJrjc8eI3G2jSdHChySUBGBFchnIKcPdpJvM4TV+m3vKm6zETW/UPSg/lFF+38wzusUMfdTvsCk4PspkcDLVndX0uW00Y3Ras6JzVfeDqq5EqBo/ZNg9cGe6JMvQgCLYyTBr9xk3T5uA8bvexjWwyxz1mI6aWMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246409; c=relaxed/simple;
	bh=FP9a2A97f6vclR6/24f8NCM6Vfz+h0UsaLyHLIxJiuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VRFY59FyG08cJEXGy0aqqHUAU0p5NrSv1xKl/Km/R0htQyTwgEaHmxDK1BY/HnI3Yz5F1G6TtZoXsZPXjhVA2G0j2QFju2YorqYQRpf26ppqsV5VV5rKMLkgIQ3R5AjSv53d1sWfaTOcn1cOKY0D/RgQoxUEtlgGAQXHgzaj+F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E392H6y3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E392H6y3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49F31F000FF;
	Thu, 24 Sep 2026 10:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790246404;
	bh=tkHBYqiP3nkej/Cw5wro7Ix4uZGRyISL9CXje00uoZQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E392H6y3gGqTu4px7GQKJEYwhoCKb4XjBrK1m8CufgAJl3r0E1/TdHBvjB3RhbSdH
	 M9FqJ1QMP3HR6I8MwPZoV+OyER8TK0y8iUuSH+3ytP9Dd5u3OCYd4nLmYw3yqMelPb
	 uhhZqRRTtsU0nMKWXuGYW/AI0RqgfOJr3+INJC4BHp8qVLRPHzK1BLI+Yh8UEcc2eY
	 7Iimca7JchwXxzyc0DhWOJfx2MJ7YIsSyi13QLYYLPmn490Gn/ZnEg4XoHEQrRN+/x
	 Xo2/aYGpMg9LHpLuj3/cVb1BmDd8lXUX1vR4Uhj5LduuJPxe6dh/lZAQBdfTXLPtJ+
	 K5j5fzTn3gU6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 4/8] net: dsa: Add tag handling for SoC-e
 switches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-devel-vstrassheim-soce-dsa-ml-v3-4-ddebafcb9ba7@linutronix.de>
References: <20260923-devel-vstrassheim-soce-dsa-ml-v3-0-ddebafcb9ba7@linutronix.de>
 <20260923-devel-vstrassheim-soce-dsa-ml-v3-4-ddebafcb9ba7@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 10:40:03 +0000
Message-Id: <20260924104003.A49F31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: dsa: tag_sdsa: unsupported VLAN tags left in hwaccel metadata
--

commit c9312ab6752036eeab3076e94713c79223982016
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

net: dsa: Add tag handling for SoC-e switches

This commit adds a DSA tag driver for SoC-e switches, which use an 8-byte
SDSA header carrying frame direction, port, and VLAN metadata. The header
is inserted between the source MAC address and the original EtherType on
transmit and receive.

> diff --git a/net/dsa/tag_sdsa.c b/net/dsa/tag_sdsa.c
> new file mode 100644
> index 0000000000000..8cc3fa357be42
> --- /dev/null
> +++ b/net/dsa/tag_sdsa.c

[ ... ]

> +static struct sk_buff *sdsa_xmit(struct sk_buff *skb, struct net_device =
*dev)
> +{
> +	struct dsa_port *dp =3D dsa_user_to_port(dev);
> +	struct sdsa_tag *tag;
> +	u16 vlan_tci;

[ ... ]

> +	/* SDSA carries no TPID, so only encode 802.1Q C-tags. */
> +	if (skb_vlan_tag_present(skb) &&
> +	    skb->vlan_proto =3D=3D htons(ETH_P_8021Q)) {
> +		vlan_tci =3D skb_vlan_tag_get(skb);
> +		__vlan_hwaccel_clear_tag(skb);
> +		tag->frame_type_port_hi |=3D SDSA_TAG_VLAN_BIT;
> +		tag->vlan =3D cpu_to_be16(vlan_tci);
> +	} else {
> +		tag->vlan =3D 0;
> +	}

[Severity: High]
Does this else branch leave unsupported VLAN tags (like 802.1ad) in the=20
skb's hardware accelerated metadata?

If a user configures an unsupported VLAN protocol on a DSA user port, the=20
skb will still have skb_vlan_tag_present(skb) set when reaching sdsa_xmit().
Because this branch does not clear the tag via __vlan_hwaccel_clear_tag(skb=
),
the conduit driver's MAC hardware might subsequently insert the remaining=20
VLAN tag at the MAC boundary.

Could this insertion displace the 8-byte SDSA header just pushed, causing=20
the switch hardware to receive unrecognized frames and drop them?

> +
> +	return skb;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-devel-vstr=
assheim-soce-dsa-ml-v3-0-ddebafcb9ba7@linutronix.de?part=3D4
