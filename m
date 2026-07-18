Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B430A1BD9C9
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 00:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784334552; cv=none; b=nioTliWkQWXZ0zgBzcQVy8SoFW3qrW8sKV9UyHfC8+uQchtRH5MpFFIUrlsLf71CCssm9tTnVyd6EyFbI4/vUeD4hkJVo0kF/uMa9jfAo1EemoRRJweVXsQBXbPk7yL8BSQjsH1x03slpB8oCX5Fh/xwLSX+7RC7ZIZxLKQlFpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784334552; c=relaxed/simple;
	bh=owl//JImKANHFm8f83LBdTCi8IMfLgZqTMhK1VKcZEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dklVi+6zSzytnM/kC3dxp1tcfR/7rKg+pTFXL672ukAhKA48M6+QhNPYPKKrE3ZgkbOU23JMLgp5x7TXvLF9c7DFqZaG7nF1kOEisJeT97uTOixC52eA+S7c7kEpUuPKvZwOTaL4SmRAodupOjf1l9KPl6nX/mi9Ylileu0f6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qt/oFY5O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qt/oFY5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0941F00A3A;
	Sat, 18 Jul 2026 00:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784334551;
	bh=jsFFAqYqiWtHBJUkiFmS6vOQMOq3ElhsZBuQiGsCZ4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qt/oFY5OsBjrQmP8QHReftnvXnJy9UhR3QHkciAYFr6e94VQ7sYTS0dYcpbRD6zPV
	 Tq8ig92pnMsvBu2tW4WHtDBQ8yxRXzxWYPWMbGArRUukHwfkWNvyO6DXkeun/8i4k7
	 Zyz/qGaiqOevg2XuCPL83jE2+4O0qxXAFnbbKgiWeJ+mUd1NFcDQMvFKXITZ741dM7
	 XSA0G/gixjSe77ZJjQT8P6VqDY6KPCrVbyBRC7/M72xR1fgkvb7pLpQduS6d6rhAeb
	 YNFFdkyJXsFn+ZL31JiX7Nga1s5idcYxVi+KGx+cKPhw/Ss0BmL7WP/BDso8dilo2Z
	 svNLwWeDjxuTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Add Tegra210B01 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717-t210b01-pmc-v1-2-bf776be8b3a7@gmail.com>
References: <20260717-t210b01-pmc-v1-0-bf776be8b3a7@gmail.com>
 <20260717-t210b01-pmc-v1-2-bf776be8b3a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 00:29:10 +0000
Message-Id: <20260718002911.1A0941F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unnecessary code duplication of identical pad and pin description a=
rrays for Tegra210B01.
--

--- Patch [2]: [PATCH 2/2] soc/tegra: pmc: Add Tegra210B01 support ---
commit 79bca764e8d02b78b29f77c96575489573ae132e
Author: Azkali Manad <a.ffcc7@gmail.com>

soc/tegra: pmc: Add Tegra210B01 support

This commit adds support for the Tegra210B01 SoC to the Tegra PMC driver.
It introduces new powergates, IO pads, voltage controls, and pin descriptio=
ns
specifically for this variant.

> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index f419a5395545f..4d77aa66d690c 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
[ ... ]
> @@ -3897,6 +3923,139 @@ static const struct tegra_pmc_soc tegra210_pmc_so=
c =3D {
>  	.has_single_mmio_aperture =3D true,
>  };
> =20
> +static const struct tegra_io_pad_soc tegra210b01_io_pads[] =3D {

[Severity: Low]
Are these IO pad arrays identical to the existing tegra210 versions?

Looking at tegra210_io_pads, tegra210_io_pad_vctrls, and tegra210_pin_descs,
it seems this code duplicates them exactly. Could tegra210b01_pmc_soc direc=
tly
reference the existing tegra210 arrays instead of duplicating these structu=
res
to reduce binary size?

> +	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x1b8, 0x1bc, "audio"),
> +	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, 29, 0x1c0, 0x1c4, "audio-hv"),
[ ... ]
> +	TEGRA_IO_PAD(TEGRA_IO_PAD_USB_BIAS, 12, 0x1b8, 0x1bc, "usb-bias"),
> +};
> +
> +static const struct tegra_io_pad_vctrl tegra210b01_io_pad_vctrls[] =3D {
> +	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AUDIO, PMC_PWR_DET_VALUE, 5),
[ ... ]
> +	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_UART, PMC_PWR_DET_VALUE, 2),
> +};
> +
> +static const struct pinctrl_pin_desc tegra210b01_pin_descs[] =3D {
> +	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_AUDIO, "audio"),
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-t210b01-pm=
c-v1-0-bf776be8b3a7@gmail.com?part=3D2
