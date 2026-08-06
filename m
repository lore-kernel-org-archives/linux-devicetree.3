Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92517422532
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008244; cv=none; b=eIgb5QSrLMqcu9qccZt6NfheJKNJa/l/wvXPCHxKo49rzCeN2fqV+SnA4qmXoTAvE50z0YdPZLL9n3OOYNPxlmbEO+jDUIFdEmsYPPPm8WKGzNqIq4T3VjZfuO6a4NFnlq31t+3cM5TAcLJUzajB/vhdYsFkHX4Hd1Khyi5GL2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008244; c=relaxed/simple;
	bh=qWzHaKmBLUIdEKC7zoWet7RbdDHTq3T9tldbx99FYVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f5EC1IfKnpYAqa3k2QMSb++fkDPNe1EN2+zsbCsAaG5Oe5GY4luj7yZqgxDeO6R0Ktqr89HMbu3eedm1YBoaxN6fdviA4eIFUhD9zHnqDLkl5gHY5Ru3WrDcDAuxze/p8mtH1xtJoU2/yCS9xemLSL+rmUb89TPyhlcjs80p/tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Km7Y9cBf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Km7Y9cBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99EA1F000E9;
	Thu,  6 Aug 2026 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786008243;
	bh=up11rVXLx75AiQsr8W6lfkI9GdtNtLi1dz7x1W6CiqY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Km7Y9cBfw6LK11k1QtQ5z3s8eO4mm1NiVmr+Xfx+/hf/RXcVzIiiBSwpXYd8hZ8YV
	 sRbEMzvrlcvxG8OkL6CRGtubR0ImpTFY6u4wXHPnTH805a34AkD6Xvdj05UrIgtcHZ
	 BlNRHEkiOgl7XHpnAge8LRQcJgOaSeNrMOShTfMGyUF6IWhQ/5nyuW5dImKry9vkH1
	 SLDh/TCW2UfENXFTRzBH0wMioIIiqKT1YMGm496FQG5lq9ef1SyAI0VJD0tAQJ0Y3A
	 KctMu1TvFPOBLohu9YVs04VPsb/TpJwHDYEkZFWD2ARalxPVsVOlN48HQFdgl/wRyd
	 IPo0/bbytgHsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] phy: ti: ti-pipe3: allow configuring ACSPCIe
 TX/RX mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Oberhollenzer" <david.oberhollenzer@sigma-star.at>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806091112.164695-3-david.oberhollenzer@sigma-star.at>
References: <20260806091112.164695-1-david.oberhollenzer@sigma-star.at>
 <20260806091112.164695-3-david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:24:02 +0000
Message-Id: <20260806092402.C99EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver mishandles errors from the `ti,syscon-acspcie-tx-rx` pr=
operty lookup, breaking probe deferral and silently swallowing configuratio=
n failures.
--

--- Patch [2]: [PATCH v2 2/2] phy: ti: ti-pipe3: allow configuring ACSPCIe =
TX/RX mode ---
commit 1cbf4349932708c2c097de105a5c13d7baeaeb61
Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode

This commit allows configuring the ACSPCIe TX/RX mode for PCIe PHYs.
It reads the syscon property from the device tree and updates the mode
selection bits in the specified register.

> --- a/drivers/phy/ti/phy-ti-pipe3.c
> +++ b/drivers/phy/ti/phy-ti-pipe3.c

[ ... ]

> @@ -785,6 +788,24 @@ static int ti_pipe3_get_pll_base(struct ti_pipe3 *ph=
y)
>  	return PTR_ERR_OR_ZERO(phy->pll_ctrl_base);
>  }
> =20
> +static int ti_pipe3_acspcie_tx_rx_mode(struct ti_pipe3 *phy)
> +{
> +	struct device_node *np =3D phy->dev->of_node;
> +	struct regmap *regmap;
> +	unsigned int args[2];
> +
> +	regmap =3D syscon_regmap_lookup_by_phandle_args(np,
> +						      "ti,syscon-acspcie-tx-rx",
> +						      2, args);
> +	if (IS_ERR(regmap)) {
> +		dev_warn(phy->dev, "can't get ti,syscon-acspcie-tx-rx\n");
> +		return -EINVAL;
> +	}

[Severity: High]
Does converting all syscon lookup errors to -EINVAL break probe deferral?

If syscon_regmap_lookup_by_phandle_args() returns -EPROBE_DEFER because the
syscon driver probes later, this converts the error to -EINVAL and prevents
the driver from deferring properly.

Additionally, if this property is optional on older device trees, would an
-ENOENT return cause spurious warnings in the kernel log?

> +
> +	return regmap_update_bits(regmap, args[0], PCIE_TX_RX_CTRL_MASK,
> +				  args[1] << PCIE_TX_RX_CTRL_SHIFT);
> +}
> +
>  static int ti_pipe3_probe(struct platform_device *pdev)
>  {
>  	struct ti_pipe3 *phy;

[ ... ]

> @@ -807,6 +828,12 @@ static int ti_pipe3_probe(struct platform_device *pd=
ev)
>  	phy->dpll_map =3D data->dpll_map;
>  	phy->settings =3D data->settings;
> =20
> +	if (phy->mode =3D=3D PIPE3_MODE_PCIE) {
> +		ret =3D ti_pipe3_acspcie_tx_rx_mode(phy);
> +		if (ret)
> +			dev_warn(dev, "failed to set ACSPCIe TX/RX mode\n");
> +	}
> +
>  	ret =3D ti_pipe3_get_pll_base(phy);
>  	if (ret)
>  		return ret;

[Severity: High]
Does this sequence silently swallow the configuration failure?

The error code from ti_pipe3_acspcie_tx_rx_mode() is captured in ret and
logged, but probe execution continues.

Because ti_pipe3_get_pll_base() unconditionally returns 0 for PCIe mode
right after this check, the value in ret is immediately overwritten, and the
probe will not abort.

Could this leave the PCIe bus in a non-functional state without explicitly
failing the driver probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806091112.1646=
95-1-david.oberhollenzer@sigma-star.at?part=3D2
