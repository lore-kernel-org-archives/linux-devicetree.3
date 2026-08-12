Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB0B419304
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528111; cv=none; b=Zma6Uzd1sOgLjWLtYsQpLGM/vmIJtHTz/ZGIy/u1zvr2oi3m1+dbpHTaauDwDNSJpO26IgCzw8ZtwQvSO8vuDBHVudJ7WsArVzFtKFsvgEaj09U7itJ3+NUJwNCUVZfbmoaq30w/Y3uorEznFLyQwuUIwTRmYrIcKBaYoLq3PXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528111; c=relaxed/simple;
	bh=y6xlGRC2lqZqk8D83mSk/rU24vyLFodpu6zsDAXhDeg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vE/c/YbSN6ICM+cgYUvZCQJq0fRRIGdC4/OYVXVoJButvrwSJNL+Xo5XA57IdFLy28JP8i+CajRmu9ag70mEsrAYTwS6lErp5j5RtQc7lSwrUUWJ+BA81wwr1z2GM433krSVC+sLIeRJnmHBWJvt3M3AQIT2b/63I9jOPEW2JDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5QxlxJy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5QxlxJy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0381F000E9;
	Wed, 12 Aug 2026 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528109;
	bh=QNPed445OKU+swuR6Q2dtGqI0FJNzenjZy2DnJNDDY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5QxlxJynCySOKh2IznOjLIOsUZaGHo947ERJqMLfckK6U6GqkLrFJ2MbyC92B7dw
	 RSTY0/65MTCDhRKHfwUoegvomyVB89EpXbbMLYz1buCu/E5EUVfpzh0XgY8sdXB6Kv
	 iEfS5I8EnOfp+VoYqQmmhw0SP4hzUkcfj1jpiB69BpFMVyyn3loW3drZeUn0aQJfh9
	 4XMDEJTsQtvOj+rqy9lJQJuhlhU8in/9dKATKO3s0hRCt7K/fbBiTouGB4C4bYTb5l
	 V220wEfEUUoXZ3Pqp5CW/e7NumPm53Uzi7V1cYmPUsPc6hWvO51TH1e3b1JVoAJSyi
	 z66NEnpKM01nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/14] phy: qcom: Introduce Qualcomm IPQ5332
 Super-Speed USB UNIPHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260812-ipq5018-usb3-v2-2-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-2-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:48:28 +0000
Message-Id: <20260812094829.0A0381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing `platform_set_drvdata()` in the probe function causes a NU=
LL pointer dereference in the remove callback.
- [Medium] Probe failure paths fail to restore the TCSR multiplexer to its =
default hardware state.
- [Medium] The driver fails to `select MFD_SYSCON` in Kconfig, risking a si=
lent probe failure.
--

--- Patch [2]: [PATCH v2 02/14] phy: qcom: Introduce Qualcomm IPQ5332 Super=
-Speed USB UNIPHY driver ---
commit 2ff7b4ffaf9a300ab45c516bb3b192d9f0a5c88e
Author: Praveenkumar I <quic_ipkumar@quicinc.com>

phy: qcom: Introduce Qualcomm IPQ5332 Super-Speed USB UNIPHY driver

Adds Qualcomm 22ull Super-Speed USB UNIPHY driver support which is
present in Qualcomm IPQ5018 & IPQ5332 SoCs.

This PHY is interfaced with SNPS DWC3 USB and SNPS DWC PCIe. Either one
of the interface can use the it and selection is done via mux present in
TCSR register. By default, the PHY is configured for PCIe interface and
needs this driver to configure the mux for USB.

> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 60a0ead127fa9..1ceb04afe1e3a 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -158,6 +158,16 @@ config PHY_QCOM_UNIPHY_PCIE_28LP
>  	  handles PHY initialization, clock management required after
>  	  resetting the hardware and power management.
> =20
> +config PHY_QCOM_UNIPHY_USB_22ULL
> +	tristate "Qualcomm IPQ5332 UNIPHY USB Super-Speed 22ull driver"
> +	depends on USB && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY

[Severity: Medium]
Since this driver uses syscon_regmap_lookup_by_phandle_args(), should it
select MFD_SYSCON to ensure the required syscon utilities are compiled in
and avoid silent probe failures?

> +	help
> +	  Enable this to support the Qualcomm USB Super-Speed UNIPHY transceiver

[ ... ]

> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-usb-ss-22ull.c b/driver=
s/phy/qualcomm/phy-qcom-uniphy-usb-ss-22ull.c
> new file mode 100644
> index 0000000000000..089de7cebef03
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy-usb-ss-22ull.c

[ ... ]

> +static int qcom_uniphy_usb_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	/*
> +	 * Select the USB position of the phy mux before anything comes out
> +	 * of reset. Selecting it later leaves the SuperSpeed pads muxed away
> +	 * while the controller resets, and the SS link doesn't train and is
> +	 * stuck in Rx.Detect (USB2 is unaffected as it isn't muxed).
> +	 */
> +	ret =3D qcom_uniphy_usb_mux_select(uniphy, true);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to select USB mux\n");
> +
> +	uniphy->phy =3D devm_phy_create(dev, NULL, &uniphy_usb_ops);
> +	if (IS_ERR(uniphy->phy)) {
> +		ret =3D PTR_ERR(uniphy->phy);
> +		return dev_err_probe(dev, ret, "failed to create PHY\n");
> +	}

[Severity: Medium]
If devm_phy_create() or phy_pipe_clk_register() fail after the mux has been
selected, the function returns directly without restoring the hardware stat=
e.
Should there be a cleanup action (perhaps via devm_add_action_or_reset())
to restore the multiplexer to its default PCIe state on probe failure?

> +
> +	ret =3D phy_pipe_clk_register(uniphy, uniphy->phy->id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register pipe clk\n");
> +
> +	phy_set_drvdata(uniphy->phy, uniphy);

[Severity: High]
Does this function also need to call platform_set_drvdata(pdev, uniphy)?
Currently qcom_uniphy_usb_remove() relies on platform_get_drvdata(pdev),
which would return NULL if not set here, and cause a NULL pointer dereferen=
ce
when passed to qcom_uniphy_usb_mux_select().

> +
> +	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
> +
> +	ret =3D PTR_ERR_OR_ZERO(phy_provider);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D2
