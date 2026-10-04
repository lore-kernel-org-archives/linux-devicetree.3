Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7307B3C1404
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 17:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791133510; cv=none; b=QMsZnMX8YvGxG30TPK7voY15xoFDpKM38nHjfWgxnPMiV/0N8WsPBLB4LizwzvY9C9C1/50W+AYxuxDjgNUDVd0m3NVEpDwnk9l+jr1s0RKooHc4HYdOKIlrc2A/B5/1SXrXFN8oDztIy0xGCov0e2/fMhQT9dROQlU5qi9w+O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791133510; c=relaxed/simple;
	bh=K5EX71jeQ3j9go5r/j75E8s96pMz5xm19vA5/t4HX/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F2WoP+69XmauVeP1YkyWf0/ekb5gX17ECWi3UF37yDhYyWt8LktKekYFAvutToF5thLkGXkYKtgaS0JPUhwTNxfINA22AmEPQdayWeK3BWZpLFAGjDTQgEuijf38/wR6WZlq3VZuq1e0vM+Z7AMzLcPdjN79h9CwCDlCAsa+I0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bobLZTO6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bobLZTO6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87D91F000FF;
	Sun,  4 Oct 2026 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791133509;
	bh=parIaP3yx5owx2ZBwc/89/m2eHUL1lngZn1hiFVdWFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bobLZTO6Ynlt4Q1SM4w+9RKVuJfR/xMw4Sm3D77qQtSWwgbXREsj41gc661re4dgc
	 OhTPDykxZo25nmMb8DS8kpq/GGO8Jm5yWJeCbZm70O5D8bUv6+cbcdBuaCuQdAQqip
	 3FT5gHZn7BRzcNgQeTrprKU8GcAnykSwQZfdDxwIkcNJ3hpVFT8ExMtndqJvR+1HIy
	 NmhMUivdCwk2n1hDdVKtoe9rse1SmA5X8D5SfnVVSSUAHbDfkFvwqcSgzfxjLy9+nz
	 MywdN86RcRNZrIY5UfoTnGC28CvlhmW6wbgjaPEya4xNxapXgKQRW75R8uEI4op59m
	 xmFUDFKmw+8yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] usb: phy: tegra: Disable internal USB sensing if
 extcon is used
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261004165204.205660-3-clamor95@gmail.com>
References: <20261004165204.205660-1-clamor95@gmail.com>
 <20261004165204.205660-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 17:05:08 +0000
Message-Id: <20261004170508.B87D91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] usb: phy: tegra: spurious wakeups due to re-enabled floating VBUS =
sensor
- [High] usb: phy: tegra: unhandled extcon parsing for peripheral-only mode
- [Medium] usb: phy: tegra: brittle DT parsing via hardcoded absolute path
- [Medium] usb: phy: tegra: unconditional 100ms timeout delay on power-off =
due to active SW override
- [Low] usb: phy: tegra: unnecessary devm allocation for temporary string
--

commit 4cd162cd45681e0cd98b5676b09fbcbe3368c0d1
Author: Jordan Viknar <jordanviknar@gmail.com>

usb: phy: tegra: Disable internal USB sensing if extcon is used

This commit adds extcon parsing from the linked USB controller. If an extcon
property exists, it switches VBUS sensors to software mode and sets their
values to SET, allowing boards with extcon chips to function properly witho=
ut
conflicting with Tegra's native mechanism.

> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-=
usb.c
> index 00443a7beaeb0..b5660910dfc7b 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c

[ ... ]

> @@ -727,6 +741,12 @@ static int utmi_phy_power_off(struct tegra_usb_phy *=
phy)
>  					   val, !(val & VBUS_WAKEUP_STS),
>  					   5000, 100000);
> =20

[Severity: Medium]
Does this code introduce an unconditional 100ms delay during power-off?

Since readl_relaxed_poll_timeout() executes before VBUS_SENSORS_SW_OVERRIDE
is disabled in the code below, the software override forces VBUS to 1. Will
this cause the status bit to never clear and the loop to hit the 100ms
timeout limit on extcon-enabled boards?

> +	if (phy->has_extcon) {
> +		val =3D readl_relaxed(base + USB_PHY_VBUS_SENSORS);
> +		val &=3D ~VBUS_SENSORS_SW_OVERRIDE;
> +		writel_relaxed(val, base + USB_PHY_VBUS_SENSORS);
> +	}

[Severity: High]
Can this clearing of the software override cause spurious system wakeups?

By clearing VBUS_SENSORS_SW_OVERRIDE here, the disconnected hardware sensors
are exposed. Later in utmi_phy_power_off(), if wakeup_enabled is true, the
code sets A_VBUS_VLD_WAKEUP_EN:

    val =3D readl_relaxed(base + USB_PHY_VBUS_SENSORS);
    val |=3D A_VBUS_VLD_WAKEUP_EN;
    writel_relaxed(val, base + USB_PHY_VBUS_SENSORS);

Because the physical pin is disconnected or floating on extcon-based design=
s,
will re-enabling this hardware sensor trigger spurious wakeups during system
suspend?

> +
>  	utmi_phy_clk_disable(phy);
> =20
>  	/* PHY won't resume if reset is asserted */

[ ... ]

> @@ -1456,6 +1476,34 @@ static int tegra_usb_phy_parse_pmc(struct device *=
dev,
>  	return 0;
>  }
> =20
> +static int tegra_usb_phy_parse_controller(struct device *dev,
> +					  struct tegra_usb_phy *phy)
> +{
> +	struct device_node *usb_node;
> +	char *node_path;
> +	u64 addr;
> +	int ret;
> +
> +	ret =3D of_property_read_reg(dev->of_node, 0, &addr, NULL);
> +	if (ret) {
> +		dev_err(dev, "Failed to read reg entry 0: %d\n", ret);
> +		return ret;
> +	}
> +
> +	node_path =3D devm_kasprintf(dev, GFP_KERNEL, "/usb@%08llx", addr);

[Severity: Low]
Is it necessary to use devm_kasprintf() for this temporary string?

Since node_path is only used once for of_find_node_by_path(), allocating it
with devm_kasprintf() binds the string to the device lifetime, unnecessarily
keeping it in heap memory until the device is unbound.

[Severity: Medium]
Will this hardcoded absolute path break if the device tree topology changes?

Using a hardcoded format string "/usb@%08llx" requires the controller node
to be named exactly "usb", placed at the root of the device tree, and its
address zero-padded to exactly 8 characters. If the node is moved under
"/soc/" or "/amba/", or if the address requires fewer than 8 hex digits
(as leading zeroes are prohibited for smaller addresses by the DT spec),
will this fail to find the node and break USB functionality?

> +	if (!node_path)
> +		return -ENOMEM;
> +
> +	usb_node =3D of_find_node_by_path(node_path);
> +	if (!usb_node)
> +		return -ENODEV;
> +
> +	phy->has_extcon =3D of_property_present(usb_node, "extcon");
> +	of_node_put(usb_node);
> +
> +	return 0;
> +}

[ ... ]

> @@ -1552,6 +1600,13 @@ static int tegra_usb_phy_probe(struct platform_dev=
ice *pdev)
>  		return err;
>  	}
> =20
> +	if (tegra_phy->mode =3D=3D USB_DR_MODE_OTG) {
> +		err =3D tegra_usb_phy_parse_controller(&pdev->dev, tegra_phy);
> +		if (err)
> +			return dev_err_probe(&pdev->dev, err,
> +					     "Failed to get controller\n");
> +	}

[Severity: High]
Does this prevent extcon parsing for USB_DR_MODE_PERIPHERAL?

If dr_mode is "peripheral", the parser never runs and has_extcon remains
false. Since the software override (VBUS_SENSORS_SW_OVERRIDE) is not applied
during utmi_phy_power_on() without has_extcon, will peripheral-only
extcon-based designs fail to detect connections because they read the
disconnected hardware sensor instead?

> +
>  	tegra_phy->phy_type =3D of_usb_get_phy_mode(np);
>  	switch (tegra_phy->phy_type) {
>  	case USBPHY_INTERFACE_MODE_UTMI:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004165204.2056=
60-1-clamor95@gmail.com?part=3D2
