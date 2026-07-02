Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785582459E1
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 20:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783025370; cv=none; b=ZjcyXGCZGDkHNs7Dt9rn3gI2QJU5Upw4UGSRCS/ke97a2sfzWd8mYjUZKzYezAjM273BLPKqFBjRvDb6hc/ifmB1KJqY6rBWjKJJKIdOc2Rdvwk4xumgUmjgnjfbsgsqjGrPaqw6fzSCfa3FNQzD/rmToWd8fenRM0tKdQ++EX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783025370; c=relaxed/simple;
	bh=XGud78ePaq0BvnmFOH31Fgn1bdImKMWr+aBYfjf+5ak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dc3bxgh6+BMN908A6zZjQZKH8AJCWVkvhlyqDpEZi8Ysz5eXve0WJgfOuv3+/9ng7SUFwfndszekMQSqXH6J2FBVxgjKugQHxeUJi08UqH0NpIoxPlSMuDaFqwUWN4+SghnxHT56GUI0SVV8ZCTT5n2uWNEterJNeIJRZ2S2hUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdhKd4f/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdhKd4f/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEF21F000E9;
	Thu,  2 Jul 2026 20:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783025369;
	bh=24umkRYO2VWcpiBTAd74NifJ8YK5wv8ur/GNJ+HE0s0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EdhKd4f/L1sZvR/ZjPrIop7tanSoCAM0AjAA08KxTYLVpCuxPeihPE9FbR8EITkVf
	 moPcHLv6yh4tn+KksUwbpP7t8FiVwkYDGKacB49ctIoCJWN+tIvSrNVdOkphdV36ig
	 3Vi1J6ei3o3CkEfUMoEoL2KGnjmMb6nE4zndIrpbo0yA6//WBWs+ZDfixybMjYSgRC
	 o7IaQTNtGasvGM7wXtja01QPL3Yy+l42g+fB0ev8CtE68+8t089+ryr8hLBepW+mqT
	 lMir3lS2phWHSLzTn9pA/9obS7LNqbgff0TIC0tTWmas+S1fN9g/WBq9l1HhsjZ85J
	 fZqiZmPTozeag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/12] reset: zte: Add a zx297520v3 reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260702-zx29clk-v6-11-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
 <20260702-zx29clk-v6-11-377b704f80c4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 20:49:28 +0000
Message-Id: <20260702204928.CFEF21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The driver registers a platform_driver with an `id_table` but fa=
ils to declare the `MODULE_DEVICE_TABLE` macro, breaking automatic module l=
oading.
- [Medium] The Kconfig entry for RESET_ZTE_ZX297520V3 does not select MFD_S=
YSCON, leading to silent probe failures when syscon is disabled.
--

commit a55000e5fe1a8cfd1c7dc0bc7830d18e5a7d4876
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

reset: zte: Add a zx297520v3 reset driver

This drives the MFD child devices created by the zx297520v3-crm driver
as well as the aux device created by the zx297520v3-lspclk driver.

> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3b..4dca1f89d22b5 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -404,6 +404,16 @@ config RESET_UNIPHIER_GLUE
>  	  on UniPhier SoCs. Say Y if you want to control reset signals
>  	  provided by the glue layer.
> =20
> +config RESET_ZTE_ZX297520V3
> +	tristate "ZTE zx297520v3 Reset Driver"
> +	depends on ZTE_ZX297520V3_CRM || COMPILE_TEST

[Severity: Medium]
Will this cause silent probe failures if CONFIG_MFD_SYSCON is disabled?

When syscon is not enabled, device_node_to_regmap() is stubbed out to return
ERR_PTR(-ENOTSUPP). This means the driver probe will abort when it tries
to acquire the parent syscon regmap in reset_zx297520v3_probe().=20

Should this Kconfig entry use select MFD_SYSCON or depends on MFD_SYSCON to
guarantee the syscon APIs are available?

> +	default SOC_ZX297520V3
> +	help
> +	  This enables the reset controllers for ZTE zx297520v3 SoCs. The reset
> +	  controllers are part of the clock and reset management controllers on

[ ... ]

> diff --git a/drivers/reset/reset-zte-zx297520v3.c b/drivers/reset/reset-z=
te-zx297520v3.c
> new file mode 100644
> index 0000000000000..75a9e6e93cdac
> --- /dev/null
> +++ b/drivers/reset/reset-zte-zx297520v3.c

[ ... ]

> +static const struct platform_device_id reset_zx297520v3_ids[] =3D {
> +	{
> +		.name =3D "zx297520v3-topreset",
> +		.driver_data =3D (kernel_ulong_t)&zx297520v3_topreset_data,
> +	},
> +	{
> +		.name =3D "zx297520v3-matrixreset",
> +		.driver_data =3D (kernel_ulong_t)&zx297520v3_matrixreset_data,
> +	},
> +	{
> +		.name =3D "zx297520v3-lspreset",
> +		.driver_data =3D (kernel_ulong_t)&zx297520v3_lspreset_data,
> +	},
> +	{ }
> +};

[Severity: Medium]
Is a MODULE_DEVICE_TABLE declaration needed for this platform device ID tab=
le?

Without exporting the table, the driver might fail to load automatically wh=
en
built as a module. When the parent MFD core creates the child platform devi=
ces
(such as zx297520v3-topreset), udev relies on the modules.alias file to mat=
ch
the MODALIAS uevent property.

> +
> +static struct platform_driver reset_zx297520v3 =3D {
> +	.probe =3D reset_zx297520v3_probe,
> +	.driver =3D {
> +		.name =3D "reset-zx297520v3",
> +	},
> +	.id_table =3D reset_zx297520v3_ids,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-zx29clk-v6=
-0-377b704f80c4@gmail.com?part=3D11
