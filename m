Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856CF35A398
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628593; cv=none; b=f/iTeaNErsn7OAUZGbAZH8t0xthmfBwGeAOWQlEZULLAYunSivL68cd9B8sl7sfCDDMQAXlo9+0Hi97xxIFfCibpoVffT/HAZQtabI1epNycRtBNm25GfdMBX5bxjRhtjrHBwfTg77Hfb6N/TFRSva9zouogpywc3biwveI64LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628593; c=relaxed/simple;
	bh=SAopxXCYHwg9Psv3TEZJVuHOMj1x1CJ9g2BjpkFhkLo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kqs/wS1bzIhJN3AV+rXVGG0sJcCB5O1JzOdW4ztmpHKtXmGV7qNwYhLAdGIH/mhtJSddtCVFmW2J9+9/4SHgvtUa1ko544GMSWsD5ftxklauqur74j4/h0BTC4PXduAiMpjdBvdXglAvD2kKGFsd/vTxJw5s3aGCbfXceNogVuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFKXW41+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFKXW41+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FDEC2BCB0;
	Tue, 12 May 2026 23:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778628593;
	bh=SAopxXCYHwg9Psv3TEZJVuHOMj1x1CJ9g2BjpkFhkLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UFKXW41+vCmJA/qJitPZL6/IzMGTqmPd6D3mMvsgIYH0hwZ9uJjgxD08tsikjOOWE
	 zJ5GYJDvthvonawcBUrs+hthCzqDNu2T1LAIgCMOHPFNHgTEAnhK57hoOYXbp0o2lz
	 Y97Lyp0LfG/yQx6MDaPhFh7QCOV3VJ770CxmCzQOwzIwkYZl4CD9bnctb/gPCABjq7
	 ThWnO344X5PDffwo3wYwM9laY56/dy9sgKq3yAeOxM6q8vL3i9PL6ZVJR7FmbjMMxb
	 nTI/t6jNB/ylfwzTQuZ+dqBYCMu3a0nYeHU6JcBK9HUwvh5ZNbdKCHrq3J9DMjFxRl
	 jgc0Lv0qBLirQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 6/6] phy: tegra: Add support for Nvidia Tegra XMM6260
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com
In-Reply-To: <20260511135703.62470-7-clamor95@gmail.com>
References: <20260511135703.62470-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:29:52 +0000
Message-Id: <20260512232952.D4FDEC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Incorrect error checking of `of_parse_phandle()` leads to arbi=
trary device matching and memory corruption.
- [Critical] Type confusion and NULL pointer dereference due to illegal acc=
ess of an external device's driver data.
- [High] Permanent memory and reference count leak of the USB platform devi=
ce.
- [Medium] Improper usage of `dev_err_probe()` inside runtime execution pat=
hs.
- [Medium] Missing Kconfig dependency on `CONFIG_USB_PHY`.
--

commit c599fd7b5a962e5696a6eb64dff41cd0427d8dde
Author: Svyatoslav Ryhel <clamor95@gmail.com>

phy: tegra: Add support for Nvidia Tegra XMM6260 PHY

Nvidia Tegra XMM6260 PHY is a hardware configuration used in Tegra SoCs
to provide proper interaction between the application processor and the
modem, as well as control over one of the SoC's USB lines for the modem.

> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
> index 342fb736da4b1..41b5ce460f37c 100644
> --- a/drivers/phy/tegra/Kconfig
> +++ b/drivers/phy/tegra/Kconfig
> @@ -18,3 +18,15 @@ config PHY_TEGRA194_P2U
>  	help
>  	  Enable this to support the P2U (PIPE to UPHY) that is part of Tegra 1=
9x
>  	  and 234 SOCs.
> +
> +config PHY_TEGRA_XMM6260
> +	tristate "NVIDIA Tegra XMM6260 PHY driver"
> +	depends on ARCH_TEGRA && USB_NET_XMM6260 && USB_SUPPORT
> +	select GENERIC_PHY

This driver relies on USB PHY APIs like devm_usb_get_phy_by_phandle(), but
doesn't seem to depend on USB_PHY. Could this cause silent probe failures if
CONFIG_USB_PHY is disabled and the stub functions are used?

[ ... ]

> diff --git a/drivers/phy/tegra/phy-tegra-xmm6260.c b/drivers/phy/tegra/ph=
y-tegra-xmm6260.c
> new file mode 100644
> index 0000000000000..7511de1333aaf
> --- /dev/null
> +++ b/drivers/phy/tegra/phy-tegra-xmm6260.c
[ ... ]
> +struct tegra_usb_device {
> +	struct ci_hdrc_platform_data data;
> +	struct platform_device *dev;
> +};
[ ... ]
> +static int tegra_xmm6260_phy_power_on(struct phy *phy)
> +{
> +	struct tegra_xmm6260_phy *mphy =3D phy_get_drvdata(phy);
> +	struct tegra_usb_device *usb =3D platform_get_drvdata(mphy->usb_dev);

Does this rely on the exact memory layout of an external driver's private
structure? The tegra_usb_device struct is defined locally here.

Also, if the external driver hasn't probed yet, platform_get_drvdata()
returns NULL, which could lead to a NULL pointer dereference later when
accessing usb->dev.

> +	int ret;
> +
> +	gpiod_set_value_cansleep(mphy->enable_gpio, 1);
> +
> +	ret =3D usb_phy_init(mphy->usb_phy);
> +	if (ret) {
> +		gpiod_set_value_cansleep(mphy->enable_gpio, 0);
> +		return dev_err_probe(mphy->dev, ret,
> +				     "failed to init USB PHY\n");
> +	}

Is it safe to call dev_err_probe() outside of a probe function? This is a
runtime PHY operation callback, and using dev_err_probe() here might pollute
the deferred probe lists if the error code happens to match -EPROBE_DEFER.

[ ... ]
> +static int tegra_xmm6260_phy_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	usb_node =3D of_parse_phandle(dev->of_node, "nvidia,usb-bus", 0);
> +	if (IS_ERR(usb_node))
> +		return dev_err_probe(dev, PTR_ERR(usb_node),
> +				     "failed to parse modem USB bus\n");

Should this check be if (!usb_node) instead? of_parse_phandle() returns NULL
when a property is missing, not an ERR_PTR.

If usb_node is NULL, this check is bypassed and of_find_device_by_node(NULL)
will be called below, which matches the very first platform device in the
system lacking a device tree node.

> +
> +	mphy->usb_dev =3D of_find_device_by_node(usb_node);
> +	of_node_put(usb_node);
> +	if (!mphy->usb_dev)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to get modem USB bus\n");

Does this leak the reference to the platform_device returned by
of_find_device_by_node()? It increments the reference count via
get_device(), but there doesn't seem to be a corresponding put_device() in
the error paths below or in a remove callback.

> +
> +	mphy->usb_phy =3D devm_usb_get_phy_by_phandle(dev, "nvidia,usb-bus", 1);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511135703.6247=
0-1-clamor95@gmail.com?part=3D6
