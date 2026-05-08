Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB933D903C
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275466; cv=none; b=mK1lLJt9nasZFzoSXZrTxtpd2uUFzRLLqOnXMUVpyVJvAsk/nGW3l4XYkPKpF7Wkw+A6NreCjPyp6gVcOMN43NPjl4TdiYOUC2NvaGbxMNgUQRZbknf7bQVJ9CwgQT7piGRcdiLmSfPAytNjRHMICEVpd5tgEEFH3iQSG/zOMN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275466; c=relaxed/simple;
	bh=dHCu9yPgnhxn5B6hjNeDxAd7yAMIFXvI2K5wFBP9m8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DttGHe3k35PVPIyZ0EzjLIDboY9rsdBsw5cfz7JfpbnfpeECrBl1PP7d78yU7tcGPkTaBKjnUDcWeg0dwq4ed0fzOPtihwd8a6sPXgN0g2fGW/rlKREX4D9WWw0lGAxam3iPcxbk9M3CgenskIwkgLO4zcQwqGMmekpCJsZbEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuyKfU+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuyKfU+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD28BC2BCB0;
	Fri,  8 May 2026 21:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778275466;
	bh=dHCu9yPgnhxn5B6hjNeDxAd7yAMIFXvI2K5wFBP9m8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nuyKfU+tEh5JK/lgiXuE/9pmnf5lC2suzHT1paSswYLp/UvZ9gx6DlRcLewaeAyqB
	 PwN+qCk09xkr4OUoRQjUE7rt989dFdzzFzh0S8wGp/0pIttq8sk7Feuz/A461HM79p
	 vcCquQviQat/sDb5UKV6UyBq0lcwlF97hfAYukPHdxl3ER8+AYLm9Jz5LpUqYRNg3D
	 RrI98Y0ONz1LTskLwmGxHyiypKkcrM2X3UwKuDvRtXa6L3Xe1QQOoA78TLN0HCCDX+
	 U0JpO8oEA2Z36yaEdkz+aQwyoQT4fAtizJZCvvsVIlpciHBIJgkBzEHASg3Tp8M757
	 dfl2vktwf1UTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/10] clk: realtek: Introduce a common probe()
Reply-To: sashiko@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508111641.3192177-4-eleanor.lin@realtek.com>
References: <20260508111641.3192177-4-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 21:24:25 +0000
Message-Id: <20260508212425.DD28BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect error checking for `devm_auxiliary_device_create()` caus=
es silent failure of reset controller registration.
- [High] Missing Kconfig dependency on `MFD_SYSCON` causes systematic probe=
 failure.
- [Medium] `RTK_CLK_COMMON` selects `RESET_RTK_COMMON` without inheriting i=
ts dependency on `RESET_CONTROLLER`, leading to unmet dependency warnings a=
nd disabled drivers.
--

commit f56275b75755d51046b72d7894740ba1aaeaf03b
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Introduce a common probe()

This commit adds rtk_clk_probe() to register clock hardware and the clock
provider for Realtek SoCs. It also registers an auxiliary device for the re=
set
controller if the "#reset-cells" property is present.

> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> new file mode 100644
> index 0000000000000..4e042e41f30da
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig

[ ... ]

> +config RTK_CLK_COMMON
> +	tristate "Realtek Clock Common"
> +	select RESET_RTK_COMMON

Will selecting RESET_RTK_COMMON without inheriting its dependency on
RESET_CONTROLLER cause unmet dependency warnings?

In Kconfig, RESET_RTK_COMMON is implicitly dependent on RESET_CONTROLLER.
Selecting it without depends on RESET_CONTROLLER forces the symbol on even
when its dependencies are not met.

Additionally, because drivers/reset/ is only compiled when
CONFIG_RESET_CONTROLLER is enabled, the selected reset driver will silently
not be built if it is disabled.

Could depends on RESET_CONTROLLER be added here?

Should this config also add select MFD_SYSCON?

The driver unconditionally relies on device_node_to_regmap(), which is
provided by the MFD_SYSCON subsystem. If CONFIG_MFD_SYSCON is disabled,
the stub implementation unconditionally returns ERR_PTR(-ENOTSUPP).

Because RTK_CLK_COMMON does not select MFD_SYSCON and ARCH_REALTEK does not
select it either, the clock driver can be built without MFD_SYSCON, leading
to a systematic probe failure.

> +	select AUXILIARY_BUS
> +	help
> +	  Common helper code shared by Realtek clock controller drivers.

[ ... ]

> diff --git a/drivers/clk/realtek/common.c b/drivers/clk/realtek/common.c
> new file mode 100644
> index 0000000000000..56f6ba1af6ef4
> --- /dev/null
> +++ b/drivers/clk/realtek/common.c

[ ... ]

> +static int rtk_reset_controller_register(struct device *dev, const char =
*aux_name,
> +					 struct regmap *map)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	adev =3D devm_auxiliary_device_create(dev, aux_name, (void *)map);
> +
> +	if (IS_ERR(adev))
> +		return PTR_ERR(adev);

Is devm_auxiliary_device_create() returning NULL on failure instead of an
error pointer?

If it returns NULL, the IS_ERR(adev) check will be bypassed and the function
will silently return 0 on failure, leaving the required reset controller
unregistered.

Could this be updated to check for !adev and return -ENOMEM?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508111641.3192=
177-1-eleanor.lin@realtek.com?part=3D3
