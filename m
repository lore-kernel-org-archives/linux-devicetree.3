Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ADD280A56
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789871; cv=none; b=M8FLpNIt4tIyuZz4tVe7BDFFbMG6VzRgd+5GVxfUaOLcfEo0S2uGhmvk0YaxSLJiBI8y8v6Ho24QQW0/qiWCOw5/iZWMYrTbH80qFCp0pzpPIKeZqqTbehxUSRHHrQNw3HukdeGHeP7fGviqmot1qGW0NZoE/Ihy26mUyWv5hLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789871; c=relaxed/simple;
	bh=4+zlDzKksoC6c7xv0Lp9pxfjT2H+zW0xTGg2SkTmApc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mkn0dpVzBWSR2SKq1wW3TxssZIWVopgVi9sPbII6OXpINJahsflC/YyGRbsqC0AVqeTL54Tt/e1h78RljvJQnQj5KNUO6bVvLby6cBvIJPb5//uz8chxCPOLVV9bgMVUaRZAHvUaOgJjT0CDSQeK0cZJBBra9W5j8OqGiJa4mtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MuN7iesl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MuN7iesl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470C31F000E9;
	Thu, 18 Jun 2026 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781789869;
	bh=AUgI9b0a/afZ9GpONd/inMpnrnNwPoRv/96v9jRhWbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MuN7iesl5Mr8XvKXXXQAosuLbCW1dp8vfQ4hSEG1Z1s2H5qKejnYs5SPL4dCuCmXj
	 +iSc12UZQHBlQpo8IaauAbtEtQ0mZam3PcK8hecUbgyLreSlF8KCtl/XisS4nkJhmb
	 Cn50bb2j4mqqZEDZCVCHjmn+YH4kZdZNYRIUgXtmxpZd+iP45WkE7YBzKV6pepOox1
	 jvFd9mhYbZe5mcnbhR4sduMEZUVLQw/9w/+IncaZdM2C4HZmY4TiFxfFLezPqyTN35
	 GdP33s2kFtOYqRrBUmPOZu6rK1NjZ0oDTDnokNOybvo/I76URD/iJxedIQSC7zf7wE
	 rIQqgdRR1S5lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/16] iio: frequency: ad9910: initial driver
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-ad9910-iio-driver-v6-9-79125ffbe430@analog.com>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-9-79125ffbe430@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 13:37:48 +0000
Message-Id: <20260618133749.470C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware sequencing violation: reference clock and GPIO powerdown =
action are initialized before device regulators, causing backpowering.
--

commit 71fb9226243ea37baeab1cd6841703ff6cde346d
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: iio: frequency: ad9910: initial driver implementation

This commit adds the core AD9910 DDS driver infrastructure with single tone
mode support, including SPI register access, profile management via GPIO pi=
ns,
and PLL/DAC configuration from firmware properties.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> new file mode 100644
> index 0000000000000..95b01295e4a0a
> --- /dev/null
> +++ b/drivers/iio/frequency/ad9910.c
[ ... ]
> +static int ad9910_probe(struct spi_device *spi)
> +{
[ ... ]
> +	st->refclk =3D devm_clk_get_enabled(dev, "ref_clk");
> +	if (IS_ERR(st->refclk))
> +		return dev_err_probe(dev, PTR_ERR(st->refclk),
> +				     "Failed to get reference clock\n");
[ ... ]
> +	st->gpio_pwdown =3D devm_gpiod_get_optional(dev, "powerdown",
> +						  GPIOD_OUT_LOW);
> +	if (IS_ERR(st->gpio_pwdown))
> +		return dev_err_probe(dev, PTR_ERR(st->gpio_pwdown),
> +				     "failed to get powerdown gpio\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, ad9910_hw_powerdown_action, st);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to add hw powerdown action\n");
> +
> +	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(supplies), suppl=
ies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");

[Severity: High]
Could this initialization order cause the device to be backpowered?

In ad9910_probe(), the reference clock is enabled and the hardware powerdown
cleanup action is registered before the device's regulators are enabled. Th=
is
might drive an active clock signal into the unpowered IC during the probe
sequence.

Additionally, because devres executes cleanup actions in reverse order (LIF=
O),
if a probe failure occurs later or the driver unbinds, the regulators will =
be
turned off first. The powerdown GPIO would then be driven high and the
reference clock would continue to toggle into an unpowered chip until they
are subsequently disabled.

Driving active digital signals into an unpowered CMOS device forward-biases
its internal ESD protection diodes, which can lead to latch-up or permanent
hardware damage. Should the regulators be enabled prior to applying any
clock or active GPIO signals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-ad9910-iio=
-driver-v6-0-79125ffbe430@analog.com?part=3D9
