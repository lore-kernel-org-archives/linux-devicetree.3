Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682D6303A0D
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737488; cv=none; b=ZZpSSXvmGZZtHYWDU/lMDj8/xki18AveSzXRRU63foM8ejMh3GUzYc9pXAWLCllLWofQG6uGORkB4k+ZvrlaMkn8qRRBDuzFmJGGCGppdF1WpvVIFmCeOD5keEytCIw2wpES6ADmgNgGvQ2xkiWPPcUuxWgW88njA4My3JV+7rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737488; c=relaxed/simple;
	bh=H/+ligJMcqnsftu46EjlCwh92QGuF7zRIdAgI725xe0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=giQgY/8A6XsUTG92wZ2ox1B27Ym04c7bpLlkx3CWIY1cQANdLJnTmUQ9QH41cKGRdtH4Lm94AjrvUlN3H6ZmgWG+RoN0JNUZ9sXoGdqAl6pVVMfZxw0XAG2chGzllpIrqZqbJg1IlPzrvZBDvLHsu1lIrMhdzdZ4wRmc2YksNH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSaNookr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSaNookr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59AFC2BCB7;
	Thu, 14 May 2026 05:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778737488;
	bh=H/+ligJMcqnsftu46EjlCwh92QGuF7zRIdAgI725xe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JSaNookrt/HD3/So/BLwd6sybK9u980Ub22mkOz8+WeEsL5ibSt867CVKnnAaVXQ7
	 PflsChz/JTH0X3oJ1xG1Vs2+l2grgm7ztZviOuFG8unGQ588+eiyb3L0VJwkI1Drtq
	 P61SEuq/N+UbPEm18jjj1HWmzibMOsljFnJGZtaiS8ZjpUigBE7SP0TsNCbk7Gn+FB
	 GEip4c1XmRieIwzsnSBVaUE8JQ7hnm9K0uCpAdm7k/wYUslMm5SRauO6GqjJpUjzB8
	 kitS94jOJ2m4A/LA9Bq3tziU58zgvZUVMLut0fbGkxPzQaJk67jYdlSMZ4cjwqnOL8
	 hPq7VD/bmNyUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] phy: add basic support for NXPs TJA1145 CAN
 transceiver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dimitri Fedrau via B4 Relay" <devnull+dimitri.fedrau.liebherr.com@kernel.org>
Cc: olteanv@gmail.com, krzk+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260513-tja1145-support-v5-2-38720a7ee63e@liebherr.com>
References: <20260513-tja1145-support-v5-2-38720a7ee63e@liebherr.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:44:47 +0000
Message-Id: <20260514054447.A59AFC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver fails to enable the hardware power supplies (`vcc-suppl=
y`, `vio-supply`, `vbat-supply`) before communicating with the device.
- [High] The driver does not observe the required mode transition delay whe=
n powering on the PHY.
- [Medium] Missing rollback to standby mode in the error path of `tja1145_p=
hy_power_on`.
--

commit 288134e179992cb2e690ff7a97502e72f04e9d5a
Author: Dimitri Fedrau <dimitri.fedrau@liebherr.com>

phy: add basic support for NXPs TJA1145 CAN transceiver

This commit adds basic driver support for the NXP TJA1145 CAN transceiver.
It implements the PHY operations to bring the hardware up and down by
switching between normal and standby modes using SPI commands.

> diff --git a/drivers/phy/phy-nxp-tja1145.c b/drivers/phy/phy-nxp-tja1145.c
> new file mode 100644
> index 0000000000000..1e8bd169743ab
> --- /dev/null
> +++ b/drivers/phy/phy-nxp-tja1145.c

[ ... ]

> +static int tja1145_phy_power_on(struct phy *phy)
> +{
> +	struct regmap *map =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	/*
> +	 * Switch operating mode to normal which is the active operating mode.
> +	 * In this mode, the device is fully operational.
> +	 */
> +	ret =3D regmap_update_bits(map, TJA1145_MODE_CTRL, TJA1145_MODE_CTRL_MC,
> +				 TJA1145_MODE_CTRL_NORMAL);
> +	if (ret)
> +		return ret;

According to the hardware datasheet, transitioning the transceiver to normal
mode can take up to 40 us. Does this sequence need a hardware transition
delay before sending the active mode command?

With a fast SPI bus, the next command might arrive before the hardware state
machine finishes transitioning, which could cause the active mode command to
be ignored.

> +
> +	/*
> +	 * Switch to CAN operating mode active where the PHY can transmit and
> +	 * receive data.
> +	 */
> +	return regmap_update_bits(map, TJA1145_CAN_CTRL, TJA1145_CAN_CTRL_CMC,
> +				  TJA1145_CAN_CTRL_ACTIVE);

If this second regmap_update_bits() fails, the function returns an error
without reverting the device to standby mode.

Since the PHY framework keeps the power_count at 0 on an error return,
phy_power_off() will not be called during shutdown or suspend. Could this
leave the hardware permanently stuck in normal mode, drawing power
unintentionally?

> +}

[ ... ]

> +static int tja1145_probe(struct spi_device *spi)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev =3D &spi->dev;
> +	struct regmap *map;
> +	struct phy *phy;
> +	int ret;
> +
> +	map =3D devm_regmap_init_spi(spi, &tja1145_regmap_config);
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map), "failed to init regmap\n");
> +
> +	ret =3D tja1145_check_ident(dev, map);

Will this fail to communicate with the hardware on platforms where power
supplies are dynamically controlled?

The device tree binding defines vcc-supply, vio-supply, and vbat-supply as
power sources, but they do not appear to be requested or enabled in this
function before tja1145_check_ident() is called.

This might leave the PHY unpowered, causing the SPI read to return garbage
data and fail the probe with -ENODEV.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to identify device\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-tja1145-su=
pport-v5-0-38720a7ee63e@liebherr.com?part=3D2
