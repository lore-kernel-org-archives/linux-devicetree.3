Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC74E360EC9
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 23:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724449; cv=none; b=SvUSTuzjV7LOrdMey5YZyoJWQ4rLWo1LRb1albVCc+/yV4SiE6BMwhcejUxLYAbHm5YXEZtJk7DRh8TrQGcmJV/PFkDpfU5DhtH0C01ipKq+4tSrAV1ThqM1xkMieATdiJn6BtLHCh5z9SRtITVt+24VyPQluYfBCXFX4tuByCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724449; c=relaxed/simple;
	bh=Dfo6U05ujz2t3fKBinUdN6VXsL2iw/n70h6/qYo+thA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MZwA1oJzp6ds+niihvkCTVYHE1HlEu8sqwJLDvueOyVCyZo9sm0BCQu+pZGRiAqT9509arfpfGj0VZQLlqPCptD23RP2Cz8Ti1TdRErltWmCQO1d8seriK0p77/gGN2LluOzv8YqMTSUDEdEHH3UHkleje6dbaiosa8cFy2XHk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8uPP9MI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8uPP9MI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8781F000E9;
	Fri, 10 Jul 2026 23:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783724447;
	bh=bTs4JSmUsarQu5KDPTOWTiGRgcAsGpYEC0XC8Rm3Jto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H8uPP9MIMzQXOaL7Ap2EXySP50Z3vaVMhYkZQRzx35yV+o2BHUePq+aS5RLPVwTEr
	 /KMhhAjY8JrSxB7xqPqNl813LP6NqUeMdblHSAcnfdrItml2SDkRPg9gJqPKSq3DlE
	 ElXEBk+E1rlKBNhBmcXTpHXGIXCOV4wGQouplwpWXhFHLm3FeaexODYkuW3umKH6LQ
	 D7GKXIto8e1Gi5UlHjpiaTbEXjFrv7TzfLsN85WH15Gs9lX9QX9bUDzBNatcq4b4eA
	 /G2nvb/8GSGplBpiVEfVFo04JqEXz8WqAwa9VxvHdoB3SF4HGN6YGvTyByYkxMajrA
	 ZrBwDrgmOXhgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] iio: adc: add ti-ads112c14 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2aWQgTGVjaG5lciAoVEkp?= <dlechner@baylibre.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260710-iio-adc-ti-ads122c14-v3-6-746d52cbf1d0@baylibre.com>
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
 <20260710-iio-adc-ti-ads122c14-v3-6-746d52cbf1d0@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 23:00:46 +0000
Message-Id: <20260710230047.5F8781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ADC is incorrectly configured in continuous conversion mode inst=
ead of single-shot mode.
- [Low] Typographical error in device ID mismatch format string.
--

--- Patch [6]: [PATCH v3 6/8] iio: adc: add ti-ads112c14 driver ---
commit 38cae330f1112ca57db5aaa7a3a80adecc45b5cb
Author: David Lechner (TI) <dlechner@baylibre.com>

iio: adc: add ti-ads112c14 driver

Add a new driver for the TI ADS112C14/ADS122C14 ADC chips, adding basic
support for power on/reset and reading the system monitor channels.

> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c1=
4.c
> new file mode 100644
> index 0000000000000..4d2e7d37be829
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c14.c

[ ... ]

> +	ret =3D regmap_read(data->regmap, ADS112C14_REG_DEVICE_ID, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	if (FIELD_GET(ADS112C14_DEVICE_ID_BITS, reg_val) !=3D info->device_id)

[Severity: Low]
This isn't a bug, but there is a typo in the format string (0xX%X) which wi=
ll
cause malformed log output like "0xX0E".

> +		dev_info(dev, "device ID mismatch, expected 0xX%X, got 0x%lX\n",
> +			 info->device_id,
> +			 FIELD_GET(ADS112C14_DEVICE_ID_BITS, reg_val));
> +

[Severity: Medium]
The comment here says "Place in single-shot conversion mode", but does using
regmap_set_bits() actually place the device in continuous mode instead?

Setting the ADS112C14_DEVICE_CFG_CONV_MODE bit to 1 enables continuous
conversion mode on these chips.

Could this cause race conditions in ads112c14_single_conversion() where a D=
RDY
signal is asserted for a previous conversion while we expect a result for a
newly selected channel?

> +	/* Place in single-shot conversion mode to make ready for raw read. */
> +	ret =3D regmap_set_bits(data->regmap, ADS112C14_REG_DEVICE_CFG,
> +			      ADS112C14_DEVICE_CFG_CONV_MODE);
> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-iio-adc-ti=
-ads122c14-v3-0-746d52cbf1d0@baylibre.com?part=3D6
