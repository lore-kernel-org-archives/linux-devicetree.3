Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAD739B963
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 14:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854334; cv=none; b=bC548o7B3b0M3O9GK0eWyVybD4yceZikVzu7ZKgvRBnAFx6oj3M8Oufpcs7szPSzndNiSAFnmfA2LnfmEJramt/0lWs99HG+OdNmjgcAr7ff+DR/Tiy3tIYEQo9h8eY77od2vu7HcEfv8Ak98JLljfsjZlnZ252FtdLQANIuE7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854334; c=relaxed/simple;
	bh=pue/1DshkEdO7CzRdpyxzLYydm2AFudEDLsq/yw3m+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lglvsEqnUJ/0uCH3bX6DHOFzK273jE/oFKBHnyivuPPfzU+bRgNelw9MhFt5vxuwTnotR+vCbfjrgsbyPIArHoWrN/DvUkLmnbTUzapDfUCdMEXUp8ASYu30+kPd1OXmH8r9byjA/YKMYvxEhZIGaM5rlEnZFtHlxLH0xW40vRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8xOUpYm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8xOUpYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B64C2BCB0;
	Fri, 15 May 2026 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778854333;
	bh=pue/1DshkEdO7CzRdpyxzLYydm2AFudEDLsq/yw3m+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=r8xOUpYm99fm7pnlIR8JQ/6LWZA/OrSgoCotXgapG8O2PZl1Drialc7qo0jBrb2fA
	 HKCxm9n69lgkNwY/5DxZrE4AbkDotdVCUEFN0HgWiz/ynEYuUQRAfwbgMnq1prybWE
	 J4vpQwlgjTYk9Hr5KhW9ujGZ4RefFewSxVM398MYErRuApPZf0wu9/qRH2NBed/RS+
	 nnme/PiiQr+opzaOZwRYLZPw4Cu+uEraqvjuUjzsK3HhZ+WvK2vPa4usAxiB67lIAc
	 3cJL3668s790/S/e08LvO5Qgq9xrwnlkkJQbUmVhSMyvGoSh5JMvqhz3w9Ur46WJlw
	 ZWFUKuOZWcO6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/6] iio: adc: ad4691: add initial driver for AD4691
 family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-ad4692-multichannel-sar-adc-driver-v11-2-eab27d852ac2@analog.com>
References: <20260515-ad4692-multichannel-sar-adc-driver-v11-2-eab27d852ac2@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 14:12:12 +0000
Message-Id: <20260515141213.67B64C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing power-on and reset recovery delays before accessing SPI re=
gisters.
--

commit 0154ecf4e1bff3698a674b01e6191a828b294b82
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add initial driver for AD4691 family

Add support for the Analog Devices AD4691 family of high-speed,
low-power multichannel SAR ADCs: AD4691 (16-ch, 500 kSPS),
AD4692 (16-ch, 1 MSPS), AD4693 (8-ch, 500 kSPS) and
AD4694 (8-ch, 1 MSPS).

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> new file mode 100644
> index 0000000000000..ba77e1bfef166
> --- /dev/null
> +++ b/drivers/iio/adc/ad4691.c

[ ... ]

> @@ -0,0 +1,756 @@

[ ... ]

> +static int ad4691_reset(struct ad4691_state *st)
> +{
> +	struct device *dev =3D regmap_get_device(st->regmap);
> +	struct reset_control *rst;
> +
> +	rst =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(rst))
> +		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset\n");
> +
> +	if (rst) {
> +		/*
> +		 * Assert the reset line before sleeping to guarantee a proper
> +		 * reset pulse on every probe, including driver reloads where
> +		 * the line may already be deasserted (reset_control_put() does
> +		 * not re-assert on release).
> +		 * devm_reset_control_get_optional_exclusive_deasserted() cannot
> +		 * be used because it deasserts immediately without delay; the
> +		 * datasheet (Table 5) requires a =E2=89=A5300 =C2=B5s reset pulse wid=
th
> +		 * before deassertion.
> +		 */
> +		reset_control_assert(rst);
> +		fsleep(300);
> +		return reset_control_deassert(rst);

Should there be a delay here after reset_control_deassert() to allow the
device to recover and load OTP trim data before the next SPI accesses?

Without a recovery delay, could subsequent configuration commands in
ad4691_config() be dropped by the hardware, leaving it in an uninitialized
state?

> +	}
> +
> +	/* No hardware reset available, fall back to software reset. */
> +	return regmap_write(st->regmap, AD4691_SPI_CONFIG_A_REG,
> +			    AD4691_SW_RESET);

Similarly, does this software reset require a recovery delay before we start
sending configuration commands to the device?

> +}

[ ... ]

> +static int ad4691_probe(struct spi_device *spi)
> +{
> +	struct device *dev =3D &spi->dev;
> +	struct iio_dev *indio_dev;
> +	struct ad4691_state *st;
> +	int ret;

[ ... ]

> +	ret =3D ad4691_regulator_setup(st);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ad4691_reset(st);

Is a power-on delay necessary here after ad4691_regulator_setup()
and before we attempt the first SPI communication in ad4691_reset()?

If the hardware reset is not available, ad4691_reset() sends a software res=
et
via SPI. If the internal POR circuit is still initializing immediately after
the regulators are enabled, could this initial SPI write be ignored by the
device?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D ad4691_config(st);
> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ad4692-mul=
tichannel-sar-adc-driver-v11-0-eab27d852ac2@analog.com?part=3D2
