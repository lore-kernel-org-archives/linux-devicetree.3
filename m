Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EC43CF039
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212694; cv=none; b=sd0PsABf0zjgvP+aFK/iHttai3vUcH+zLUgteSzP7TollnbfHODxlFcRSzaqt4332KXZuyZPX2Bko5Q1+Vtyqj3N9FSxM0c5IvByUrRda7roEtUTByMtar1UZI/8QkUReSfqE2rgOa6yR7Jd6LZbOoZlO7f2EQdwgJS/MQhSjQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212694; c=relaxed/simple;
	bh=RAcG6u1nk81hJjbd+TKdh+hFbUeAhX4bnFMuawEybD4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lDGBqfAEwxKSsEvCHJ1sww9iB5Hf9n4eIDzICHWuX2DCuoFZLO6J2WFIkQEaArJ3Gg2OjO/iJZ5G5FLCixyU55+Gd2/yBLb1l+TWIUr0zc+KwJmJ+ui1+FNFT46bqGzehamsBqnFFbE+Kq1C+XdI189Hb+nrwwL5zIrUx6RIKsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hl/mlp5r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hl/mlp5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B731F000E9;
	Thu, 20 Aug 2026 07:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787212692;
	bh=A7/0axbMNp0Hc4E021vxFXzIk+IxGzh9RFEpr8iRrEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hl/mlp5rh88sRRIR4xQoRB3ZV8RHWF9QSrHPNiqxT0pvpM6wIkaia/uiHta9nFaz8
	 HVUmjbU0/8lfQ31Cqg/V+tQw11BzVfzWD45BUGLQMN6bAdVTbp2cA5n1eA82h7dAUt
	 9bIb1icK5XijyIcTblzjM8Z7cS/5sns3itvlpZ6/nBevLVNOmWy+OxixsiFMI2gKid
	 k9SOsIUphHrdBcU4i8YLAN06w4xudPg8MSaH0bISfjmunFJe1zfgOw7t/lUPnyPdAQ
	 UAH3O3FQUI72K0GMOICjgbUAj6l/J80DPv4BCuCd0pB0coglmerewqgKn/aBCIC7Lp
	 l7+1fDcJ9mqRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260820-ti-ads112c04-driver-v6-2-0e8f0aacce9b@gmail.com>
References: <20260820-ti-ads112c04-driver-v6-0-0e8f0aacce9b@gmail.com>
 <20260820-ti-ads112c04-driver-v6-2-0e8f0aacce9b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 07:58:11 +0000
Message-Id: <20260820075812.65B731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Interrupt storm (hard lockup) if DRDY is configured as level-trigg=
ered.
--

--- Patch [2]: [PATCH v6 2/2] iio: adc: ti-ads112c04: Add support for TI AD=
S112C04 ---
commit 88f1a4a634251e87a5f5b33f385ea979bcaa7f17
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

iio: adc: ti-ads112c04: Add support for TI ADS112C04

Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
delta-sigma ADCs. The driver implements single-shot conversions, dynamic
parsing of channels, hardware interrupts via the DRDY pin, and per-channel
reference source selection.

> diff --git a/drivers/iio/adc/ti-ads112c04.c b/drivers/iio/adc/ti-ads112c0=
4.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c04.c
[ ... ]
> +static irqreturn_t ads112c04_irq_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	struct ads112c04_state *st =3D iio_priv(indio_dev);
> +
> +	complete(&st->completion);
> +
> +	return IRQ_HANDLED;
> +}
[ ... ]
> +static int ads112c04_probe(struct i2c_client *client)
> +{
[ ... ]
> +	if (client->irq > 0) {
> +		ret =3D devm_request_irq(dev, client->irq, ads112c04_irq_handler, 0,
> +				       indio_dev->name, indio_dev);

[Severity: High]
Since the hardware DRDY pin stays low until data is read, could an interrupt
storm occur here if the device tree configures the interrupt as
level-triggered?

By passing 0 for the irqflags, the driver accepts the device tree's default
trigger type. If it is set to a level trigger, ads112c04_irq_handler() will
fire, call complete(), and return IRQ_HANDLED without doing any I2C reads to
clear the device-side interrupt.

Because the interrupt source isn't cleared, the interrupt controller will
immediately re-trigger the hardirq. Won't this create an infinite loop that
starves the process context, preventing ads112c04_read_data() from ever
executing to clear the condition?

Should this request enforce an edge trigger, or use a threaded interrupt
handler with IRQF_ONESHOT so the interrupt is masked until the data is read?

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-ti-ads112c=
04-driver-v6-0-0e8f0aacce9b@gmail.com?part=3D2
