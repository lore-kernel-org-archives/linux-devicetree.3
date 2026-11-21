Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290197;
	b=dP7pRyKWJ0QiZJ+8VCS58azpNB4bFh1cXreAxkGxZsAlYLfXdcSshZUIyt7WBQvtAlJ7
	 sHlpSpf1qdkljzlOCkNj9N09eNgIJon6NwHAVJ1bS0fHrBFQJxE4nSLQ73qe/NOan0xHl
	 ZuDS9/TXPk2bbmu/ddGM2K5A6fjMfRWCAMxExuGvjRSN6HkH5l8F6z5bcs7vYKq7lp+g8
	 R0A2ZOxL2Q624nwiPwAp9W3UP1CnbRlxmqFn/WZI2anlhCkEeO7VR9cRsZo1pSGyq4rPR
	 CxM3TV1uN9eNsC6OE1buFGL90SEIzBezjqGcypa1ytOZTQTXMi0/Y+EVG7eAmpbU1Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290197;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ndnh/TEZ+lxNLtCHkCn/UU8fVcS7ajpeDoOxuytt3sA=;
	b=riYduYh7xX+H59kQVKocMIqqRHLQIyzUbbwgVPVLuXz2YgpjmojGbeXEpHAUZ6Sy+aPj
	 tPcMs4y2UjyD2mLAFY5LeXTYJKZCW9BNclGOFRXlsq6MjfaHjIBWUnhYxVmUFhDfKTtw0
	 MrvtoSYcQL0rrHoLa29wVLLVruDo96tsjHKnneatL3cKr0bYmR81xjsISkmPtB6sxTxWY
	 5YTrkhTyvAMPKXSgsYKAVSl9dBy57BulNGJkjrjj7zpJ8/gEm22ET81iJOVnFaoW9lquv
	 BJcVTxB3dxl7WxGJFz+bG5YIKp3+bSDauRzNEMemCOiQkJbK2SHL2Yxjeqb8EQgB0MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HsiL/K9d";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD56606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 19:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HsiL/K9d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12E41F000C4;
	Sat, 21 Nov 2026 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795290197;
	bh=Ndnh/TEZ+lxNLtCHkCn/UU8fVcS7ajpeDoOxuytt3sA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HsiL/K9dEM8Fk5K9FLQEcquPIPr/f5gKKJlXxBALyTnneLN/QENKGzqkBUKRFWtXO
	 IxgGhnGsZPMMnvFP40VuzeaTr3h2f4lq/Nvhx9CLxJc3aOrwA2me0rDOPa5RCzMflE
	 rAUQnCALnwWjRjW9JDQidbhDcK/X/YNYCznbdUDrTCWiygW1wKktthp38YpIow8Wlo
	 Swtqz8G7FunNErgtGPsc1xMFBFZR1ZoVtzh8JpHIP9o40xwuaHZ8TVx5NXFu0JR9sh
	 WMo/ITRaGmzWT9h2E1n+2DaR2hhtNat5hCK7Rfzc7gjQNIOoZ3xLaa6cR0mpR9xipp
	 UmH28ZgUlbOZg==
Message-ID: <sashiko-outbox-227322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/11] phy: amlogic: Add Meson HDMI TX PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261121-meson-drm-create-hdmitx-phy-v3-4-f8f471788076@aliel.fr>
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
 <20261121-meson-drm-create-hdmitx-phy-v3-4-f8f471788076@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 19:43:16 +0000
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
- [Medium] phy: amlogic: phy-meson-hdmi-tx: min_rate 25175000 rejects
  valid DMT modes
--

commit c8d7adccab22985446c5dd65967a17a727629973
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

phy: amlogic: Add Meson HDMI TX PHY driver

This commit adds a generic PHY driver for the Amlogic Meson HDMI TX PHY on
GXBB, GXL, GXM, and G12A SoCs, along with a legacy creation helper for
device trees without a phys property.

> diff --git a/drivers/phy/amlogic/phy-meson-hdmi-tx.c b/drivers/phy/amlogi=
c/phy-meson-hdmi-tx.c
> new file mode 100644
> index 0000000000000..872d244de8fb7
> --- /dev/null
> +++ b/drivers/phy/amlogic/phy-meson-hdmi-tx.c
[ ... ]
> +/* GXBB */
> +static const struct meson_hdmi_phy_rate gxbb_rates[] =3D {
> +	/* 5.94Gbps, 3.7125Gbps */
> +	{ 371250000, 0x33353245, 0x2100115b },
> +	/* 2.97Gbps */
> +	{ 297000000, 0x33634283, 0xb000115b },
> +	/* 1.485Gbps, down to 251.75Mbps */
> +	{ 25175000,  0x33632122, 0x2000115b },
> +};
> +
> +/* GXL / GXM */
> +static const struct meson_hdmi_phy_rate gxl_rates[] =3D {
> +	/* 5.94Gbps, 3.7125Gbps */
> +	{ 371250000, 0x333d3282, 0x2136315b },
> +	/* 2.97Gbps */
> +	{ 297000000, 0x33303382, 0x2036315b },
> +	/* 1.485Gbps */
> +	{ 148500000, 0x33303362, 0x2016315b },
> +	/* 742.5Mbps, down to 251.75Mbps */
> +	{ 25175000,  0x33604142, 0x0016315b },
> +};
> +
> +/* G12A */
> +static const struct meson_hdmi_phy_rate g12a_rates[] =3D {
> +	/* 5.94Gbps, 3.7125Gbps */
> +	{ 371250000, 0x37eb65c4, 0x2ab0ff3b, 0x0000080b },
> +	/* 2.97Gbps */
> +	{ 297000000, 0x33eb6262, 0x2ab0ff3b, 0x00000003 },
> +	/* 1.485Gbps, down to 251.75Mbps */
> +	{ 25175000,  0x33eb4242, 0x2ab0ff3b, 0x00000003 },
> +};
[ ... ]
> +static const struct meson_hdmi_phy_rate *
> +meson_hdmi_phy_find_rate(const struct meson_hdmi_phy_data *data, u64 rat=
e)
> +{
> +	unsigned int i;
> +
> +	if (rate > data->max_rate)
> +		return NULL;
> +
> +	for (i =3D 0; i < data->num_rates; i++)
> +		if (rate >=3D data->rates[i].min_rate)
> +			return &data->rates[i];
> +
> +	return NULL;
> +}

[Severity: Medium]
Does setting min_rate to 25175000 in the lowest entries of gxbb_rates[],
gxl_rates[], and g12a_rates[] cause a regression for valid display modes
below 25.175 MHz?

In drivers/gpu/drm/meson/meson_dw_hdmi.c, meson_hdmi_phy_setup_mode() used
an unconditional else branch with no lower frequency bound for the lowest
band ("742.5Mbps, and below" on GXL/GXM, and "1.485Gbps, and below" on GXBB
and G12A).  Meanwhile, meson_encoder_hdmi_mode_valid() accepts non-VIC DMT
modes down to 15.9 MHz via meson_vclk_dmt_supported_freq() without calling
phy_validate().  Any mode between 15.9 MHz and 25.174 MHz (such as
640x480@60Hz CVT reduced-blanking at 23.75 MHz, or a 640x480 EDID detailed
timing descriptor whose 10 kHz step encodes 25.175 MHz as 25170 kHz) passes
mode validation and atomic_check, then fails with -EINVAL in
dw_hdmi_phy_init() -> phy_configure() during atomic_enable, aborting HDMI
PHY power-on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-meson-drm-=
create-hdmitx-phy-v3-0-f8f471788076@aliel.fr?part=3D4
