Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698CE34DB46
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778362302; cv=none; b=SCdJQWgkl5/Jpg7aER7Dx39cVzYU0uR2nD1spxI7CBHImr0vwpcGQ6hQ7BZDSlN4kmWI75ioNPTQKlqwgri+ToCVJqwy3NxXwtXHKRnRr0L3zBdc9gJZ3pJbIoGW+q6p3SaQt7k/MjuiwI8QlqVgb2B3SyFExzng5AAtLGy98/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778362302; c=relaxed/simple;
	bh=iIiFwhV8b+47B2yWzX/rdLJz20C4xklxYwvwAvBpvmg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L7o5TvRvrFmesbLU5lUYtxU8POmE+5KHYowW/Qxc77BMaeqjV4g6hQ9eN6iMpJGMgTMpX30uFIM7tOEyZiqxLTDjOvBMDs7Hh42gIzuR7p3NojnIZQZBqTvOtalqQzZfP8O17U9ak/X94xZH2CTAdWgRzlHT+xUvNJEdM+8oSyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GecC0mHL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GecC0mHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF026C2BCB2;
	Sat,  9 May 2026 21:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778362302;
	bh=iIiFwhV8b+47B2yWzX/rdLJz20C4xklxYwvwAvBpvmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GecC0mHL2ojfSwDJnWzUqo/1noATu0I5TUuGCZPjugOrjdNGeD8sUGQFThi3+y0DJ
	 g0KzjOSwFyyOsQpyiVoTE15GjXQk5qFSAmozmPvEsGLdkI+V/6GPzdWvhSSUJAvgia
	 9SEVln2+0pSI9TB37cuI4o+zBWCbyvf5XziHWscD1VfcM9Kku06ZhEgDY6UOfGev0g
	 ZMuGCWw/lcsfmg4Ok+2ykEpYFQQr6PEp6y4qmMH04gI1tAte+r5oNnIy8lG/BHURWD
	 agIk4uSET+IHCaKGTA1Tm8ZYbJarjohn0DptktU+t91UJA2QB8z0vQhalvTx7Ed8Sl
	 XUSd+EGaKyUoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] drm/sun4i: Add planes driver
Reply-To: sashiko@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509190015.79086-7-jernej.skrabec@siol.net>
References: <20260509190015.79086-7-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 21:31:41 +0000
Message-Id: <20260509213141.BF026C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Use-After-Free vulnerability when the `sun50i-planes` driver is un=
bound via sysfs.
- [Medium] Race condition during probe exposing uninitialized hardware stat=
e.
- [Low] Multiple definition build failure due to duplicate `module_platform=
_driver()` in the same module.
--

commit 19bad84553b057724d61d90ba01ff45aacdcaa90
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

drm/sun4i: Add planes driver

This driver serves just as planes sharing manager, needed for Display Engine
3.3 and newer.

> diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makef=
ile
> index bad7497a0d11e..501e3d8679185 100644
> --- a/drivers/gpu/drm/sun4i/Makefile
> +++ b/drivers/gpu/drm/sun4i/Makefile
> @@ -16,7 +16,8 @@ sun8i-drm-hdmi-y		+=3D sun8i_hdmi_phy_clk.o
> =20
>  sun8i-mixer-y			+=3D sun8i_mixer.o sun8i_ui_layer.o \
>  				   sun8i_vi_layer.o sun8i_ui_scaler.o \
> -				   sun8i_vi_scaler.o sun8i_csc.o
> +				   sun8i_vi_scaler.o sun8i_csc.o \
> +				   sun50i_planes.o

[ ... ]

> diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/sun4=
i/sun50i_planes.c
> new file mode 100644
> index 0000000000000..6469de1baf030
> --- /dev/null
> +++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
> @@ -0,0 +1,201 @@

[ ... ]

> +static int sun50i_planes_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sun50i_planes *planes;
> +	void __iomem *regs;
> +
> +	planes =3D devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
> +	if (!planes)
> +		return -ENOMEM;
> +
> +	planes->quirks =3D of_device_get_match_data(&pdev->dev);
> +	if (!planes->quirks)
> +		return dev_err_probe(dev, -EINVAL, "Unable to get quirks\n");
> +
> +	planes->mapping =3D syscon_regmap_lookup_by_phandle(dev->of_node,
> +							  "allwinner,plane-mapping");
> +	if (IS_ERR(planes->mapping))
> +		return dev_err_probe(dev, PTR_ERR(planes->mapping),
> +				     "Unable to get mapping\n");
> +
> +	regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	planes->regs =3D devm_regmap_init_mmio(dev, regs, &sun50i_planes_regmap=
_config);

If the sun50i-planes driver is unbound via sysfs, devres will clean up this
regmap. Since the driver doesn't seem to integrate with the component
framework or establish device links with the DRM master, could the active D=
RM
device dereference the freed regmap pointer during atomic plane updates and
cause a use-after-free?

> +	if (IS_ERR(planes->regs))
> +		return PTR_ERR(planes->regs);
> +
> +	dev_set_drvdata(dev, planes);
> +
> +	sun50i_planes_init_mapping(planes);

Is there a potential race condition here? If the DRM mixer driver checks for
the availability of this driver data to determine if the planes driver has
finished probing, it might proceed to use the DRM planes while the hardware=
's
channel-to-core mapping is still uninitialized.

Should dev_set_drvdata() be called after sun50i_planes_init_mapping()?

> +
> +	return 0;
> +}
> +
> +static struct platform_driver sun50i_planes_platform_driver =3D {
> +	.probe		=3D sun50i_planes_probe,
> +	.driver		=3D {
> +		.name		=3D "sun50i-planes",
> +		.of_match_table	=3D sun50i_planes_of_table,
> +	},
> +};
> +module_platform_driver(sun50i_planes_platform_driver);

Since sun50i_planes.o is added to sun8i-mixer-y in the Makefile, it will be
linked into the same module as sun8i_mixer.o. Will invoking
module_platform_driver() here cause a multiple definition linker error for
init_module and cleanup_module?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509190015.7908=
6-1-jernej.skrabec@siol.net?part=3D6
