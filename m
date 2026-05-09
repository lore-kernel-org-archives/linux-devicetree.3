Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FE13AC00
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 20:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778357121; cv=none; b=r8d1OnMh2H6UKNanu61ehbUH+usR9P/2wXeD2DYK4102WeCsksJr64ULlsYH4fa55hzBS6IV6Ge4nRXzlOmJQr/zw3GWPP+9XQ7oNVjiSDKXLtKVysJn57FaX0joakhyb9pdC8laJAQqiiVsV7oKvTGdG+poOnx5NTbe1KpVWPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778357121; c=relaxed/simple;
	bh=XGbYBXqTPWOjFwrBI+J0nIQXYH/ePUP819sXtv8o7t8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ahj0Hs1/MDL4kggTD1EyuKbZcdIZ5+W39ANDn9QaM5FKj3jyhLIZWJSx6/WRxkTLAoGg3uu7QO59vGnycbikQD7a8vJK67uJnSgqMj7GrN3blvG+8zh6E8jtoLa92R9et4b1BDolrsD6crnXt4lSvQsAZTU8gHy5kzPWlieMres=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScRC2hEe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScRC2hEe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60926C2BCB2;
	Sat,  9 May 2026 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778357120;
	bh=XGbYBXqTPWOjFwrBI+J0nIQXYH/ePUP819sXtv8o7t8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ScRC2hEesjpD6FaNSE8OiFWk4RVyy7dcQ+q6vuLP+lKQJWWLtoEfCx2xc/QQ1wmmR
	 LPEOGolMfCrdh5pnMu2ldXO6KY0Im/ZB7rGfso6ZYH/pabh6+gWrqHw6db6acwkjNC
	 N1gr8FftHLBk2dHRsxiTztuU4KY+CvL2cE/5Lhg66/cKFd/iXC4RbFhxeoaMeEx7gF
	 yZwbSPVoepyo57PjP1Fjs0k+ZgL6ibn24LPllUJbUiNX81S2F53KuHDAuP/cyAEeo9
	 teimw0GR0XL14xqRl7eKcAeDYfFxdvUMCUZF3M9o8JUywEjPVigyiCXgwiEMHXVlM+
	 /yiGGiWiQ9VYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/8] clk: sunxi-ng: de2: Export register regmap for
 DE33
Reply-To: sashiko@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509190015.79086-3-jernej.skrabec@siol.net>
References: <20260509190015.79086-3-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 20:05:19 +0000
Message-Id: <20260509200520.60926C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Use-after-free and permanent probe failure due to registering =
a devm-managed regmap with syscon.
- [High] Unconditional probe failure if `CONFIG_MFD_SYSCON` is disabled.
--

commit ef866c925d5c9b0231c3dc8c7b9a9590e11b86ec
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

clk: sunxi-ng: de2: Export register regmap for DE33

This commit adds a regmap for DE33 plane mapping registers and registers
it via syscon so the DRM driver can access them.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c

[ ... ]

> @@ -336,13 +368,23 @@ static int sunxi_de2_clk_probe(struct platform_devi=
ce *pdev)
>  	}
> =20
>  	/*
> -	 * The DE33 requires these additional (unknown) registers set
> +	 * The DE33 requires these additional plane mapping registers set
>  	 * during initialisation.
>  	 */
>  	if (of_device_is_compatible(pdev->dev.of_node,
>  				    "allwinner,sun50i-h616-de33-clk")) {
> -		writel(0, reg + 0x24);
> -		writel(0x0000a980, reg + 0x28);
> +		struct regmap *regmap;
> +
> +		regmap =3D devm_regmap_init_mmio(&pdev->dev, reg,
> +					       &sun8i_de2_ccu_regmap_config);
> +		if (IS_ERR(regmap)) {
> +			ret =3D PTR_ERR(regmap);
> +			goto err_assert_reset;
> +		}
> +
> +		ret =3D of_syscon_register_regmap(dev_of_node(&pdev->dev), regmap);
> +		if (ret)
> +			goto err_assert_reset;

If syscon is disabled in the kernel configuration, the inline stub for
of_syscon_register_regmap() returns -EOPNOTSUPP. Will this unconditionally
fail the probe for the core display clock controller on systems without sys=
con
enabled?

Additionally, is it safe to register a devm-managed regmap with syscon?

of_syscon_register_regmap() adds the regmap to a global list but provides no
deregistration mechanism, as syscon assumes permanent mappings.

If the driver module is unbound by a user via sysfs, or if the subsequent
devm_sunxi_ccu_probe() call fails, devres will automatically free the regmap
and unmap the MMIO.

Would this leave a dangling pointer in the global syscon list, leading to a
use-after-free when the DRM driver looks it up? Also, wouldn't a subsequent
attempt to re-bind fail permanently with -EEXIST?

>  	}
> =20
>  	ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509190015.7908=
6-1-jernej.skrabec@siol.net?part=3D2
