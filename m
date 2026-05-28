Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDA78F4A
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957594; cv=none; b=chPJnm7cnTViTNKDEBOF6HI5NBk6iHFZ2tjnGiqJB8qVr2GS1ACUbcsG7sOBNR+XKAvuP7exXcmmMHM5RqRVZztBmKIBMhRCqT/QC1izjVraQzAA/qZgBHCUbfqaaXFzNX+LGIAeK9aqwe9nDDOBGaCW4u3JyxddelZwyBuCi+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957594; c=relaxed/simple;
	bh=88teVG0vVemQhQVDPE7WQCjSlUFqhhd4xA1aaUIyl6M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RYweIvo58cxCGd2cIDVtKCYADuC2I8q/rw0WWBE6pSRoQcyXvd5rmjGifrjJiplxEwqlz2FwhnV/IMYblh0PI3rDJFefBqLDmMTWn5E7BxWD6waa/qSZlZ9xr4tGDpLry7DzL2ch4Mua/6gQhdNSWS+GG5OasHnay3ZXj0k6Yd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWi+rSUr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWi+rSUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1781F000E9;
	Thu, 28 May 2026 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779957593;
	bh=76Ai/ZcGDLSB7fU1iMLje8Nq3n3WAuYohPAuC89Vh6s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aWi+rSUrx3ZdcdY+BBAlzKE40LQeF487M05nsF8wCUnzeH6e6kCipm1AzuqvIb0vj
	 nljDP11e82cTL8QXr7AyteLrE+X7NkxcUUf+E3Fg4Mi6eQu0O1KgRFXDtkKK7DclFJ
	 0SF0CdG4vX6jHoihLt1K5fW0ufrrJZmXSe59ILSNQ4EZ6kxaecINRhyDG7hKp3g3RF
	 5uOISv4/0llq/OpnKUXuUEpfYFUko65qd+FSrowxf4UJFEhaz/jlX6Z4uhFIGcn3VG
	 Le5XoMIQYizA5rFUkuNQchhW5oOT6NSngnSSGXDO6/q3YWylv6esHo5KFwF7utDnB0
	 NKen++8QaHi+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] iio: adc: add Axiado SARADC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260528-axiado-ax3000-ax3005-saradc-v1-2-345dd5f6608a@axiado.com>
References: <20260528-axiado-ax3000-ax3005-saradc-v1-2-345dd5f6608a@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 08:39:52 +0000
Message-Id: <20260528083952.BF1781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The SARADC hardware block is enabled during probe but is never e=
xplicitly disabled on driver unbind or probe failure.
- [Medium] The power-down (PD) bit is toggled with no delay, resulting in a=
n ineffective reset or power cycle pulse.
- [Medium] The IIO device name is initialized with `dev_name()`, which viol=
ates the IIO sysfs ABI.
--

commit 14677b4fe42ae6002d14ca13458223da2d275626
Author: Petar Stepanovic <pstepanovic@axiado.com>

iio: adc: add Axiado SARADC driver

Add support for the SARADC controller found on Axiado AX3000 and AX3005 SoC=
s.
The driver supports single-shot voltage reads through the IIO subsystem,
dynamically selecting the number of available channels from SoC match data.

> diff --git a/drivers/iio/adc/axiado_saradc.c b/drivers/iio/adc/axiado_sar=
adc.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/adc/axiado_saradc.c

[ ... ]

> +static int axiado_saradc_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	mutex_init(&info->lock);
> +	reg =3D FIELD_PREP(AX_SARADC_CH_EN_MASK,
> +			 GENMASK(soc_data->num_channels - 1, 0)) |
> +	      AX_SARADC_SAMPLE_16 | AX_SARADC_MODE | AX_SARADC_ENABLE;
> +
> +	iowrite32(AX_SARADC_PD, info->regs + AX_SARADC_GLOBAL_CTRL);
> +	iowrite32(reg, info->regs + AX_SARADC_GLOBAL_CTRL);

[Severity: Medium]
Is this reset or power cycle sequence effective without a delay?

The power-down (PD) bit is toggled with no delay between writes, and without
a read-back to flush the write buffer. This typically results in a
zero-width pulse that hardware might not register.

Does the hardware require a short sleep or a dummy read here to ensure the
analog components properly reset?

> +
> +	indio_dev->name =3D dev_name(&pdev->dev);

[Severity: Medium]
Will this name format break the IIO sysfs ABI?

The driver initializes the IIO device name using dev_name(). For device tree
nodes, this usually includes the bus address and a dot, such as
12340000.saradc.

The IIO sysfs ABI dictates that the device name attribute must not contain
whitespace, dashes, or dots. Could a hardcoded driver string or the
compatible string be used instead to avoid breaking userspace applications?

> +	indio_dev->dev.parent =3D &pdev->dev;
> +	indio_dev->info =3D &axiado_saradc_iio_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->channels =3D axiado_saradc_iio_channels;
> +	indio_dev->num_channels =3D soc_data->num_channels;
> +
> +	ret =3D devm_iio_device_register(&pdev->dev, indio_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to register IIO device\n");
> +
> +	return 0;
> +}

[Severity: Medium]
Is there a missing cleanup step to disable the SARADC hardware block?

During probe, the hardware is enabled by writing AX_SARADC_ENABLE to the
global control register. However, the driver does not seem to register a
devm action or provide a remove callback to clear this bit and power down
the ADC.

When the driver unbinds or probe fails, standard devres will gate the clock
and disable the regulator while the ADC block is still logically active.
Does disabling clocks on active hardware lead to system bus lockups or power
leaks on these SoCs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-axiado-ax3=
000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com?part=3D2
