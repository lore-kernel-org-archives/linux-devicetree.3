Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A423749E5
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642645; cv=none; b=of9ovwHC62qJoy1Gz6tnbtTvIyNlFmOhKeM8VlPXaYQpAowcDDS+qyGniwNV42XAuebD+1L6bfQiPr4OVoATQE/uib488EKgKB30BXt8BYZ7AOBexZWew9Y8yHd1dyBf/d1p2LyvUrhsCmt/QFIAU27CxRetX4rwgc6oZiU1vbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642645; c=relaxed/simple;
	bh=UyBUYX9DZ6L6MFcOSRrtbu2XLKzzwKunaJnE34oH/jA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VaExaF5pyfumbcuAnotC1YeSqfmKHheww9Dq2Xqco7T4wV2WCYftCjYfbvhVHF3YlYkNgnonGmpYHAcs9sBIvGVVhGHp0dz/JGoNxOceUjDhe6R7ZhuIndqnaOJLdVcm+QHmEKu6nDPPmAmmgJ16KIt09liX/Ih2ddJuuggbLgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePLWsiLp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePLWsiLp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D94C1F00A3A;
	Tue, 21 Jul 2026 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642644;
	bh=mV82Jldzs81dcYlb0cxz2vVTzGMgk1hl+l83VYFQYTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ePLWsiLpnjbPI2jJYKNNfWTs1FnEp+BiO/Ch2ubXMwVjr4XZE3CXNr7tcKBXoEmfE
	 jhc4npXrxhoppRypNYOoHcj8L/YMzSP9dbSw7x/KjVtFBiXsEAibssCyqRRt6jUvJC
	 /2WLEMXyiF6HFHJiKU0QowBUbwAe5i8MZRy01MpY8u40XZlV8tXyPirwtXteZuWwAm
	 7r74NGB97vKyzAn4scslj3EceLlNZG1YCyKybgsG+IlrRND+cPb94uj/z+72Jp0CQ2
	 hqUqlpKvgDObdjRIpwzHRH/wqUQ3Ft5XzO5mykGtdPlJWwYIt5ovLJjZp3jtPJOCc5
	 RO7vmp4n86X5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: magnetometer: add support for QST QMC6308
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721134843.7484-3-jorijnvdgraaf@catcrafts.net>
References: <20260721134843.7484-1-jorijnvdgraaf@catcrafts.net>
 <20260721134843.7484-3-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 14:04:03 +0000
Message-Id: <20260721140404.1D94C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Potential hardware initialization race condition during soft res=
et deassertion.
--

--- Patch [2]: [PATCH v2 2/2] iio: magnetometer: add support for QST QMC630=
8 ---
commit 50ae109e19c53c095dd871b420a64fb846f258d5
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

iio: magnetometer: add support for QST QMC6308

This commit adds support for the QST QMC6308 3-axis anisotropic
magnetoresistive magnetometer on I2C. It implements raw readings, output
data rate, field range, filter oversampling ratio, mount matrix, and
runtime PM.

> diff --git a/drivers/iio/magnetometer/qmc6308.c b/drivers/iio/magnetomete=
r/qmc6308.c
> new file mode 100644
> index 0000000000000..7d4df846bbc54
> --- /dev/null
> +++ b/drivers/iio/magnetometer/qmc6308.c
[ ... ]
> +static int qmc6308_init(struct qmc6308_data *data)
> +{
[ ... ]
> +	/* The SOFT_RST bit is not auto-cleared and must be written back 0 */
> +	ret =3D regmap_write(map, QMC6308_REG_CTRL2, QMC6308_SOFT_RST);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The datasheet gives no soft-reset completion figure; reuse the
> +	 * power-on time as a conservative bound.
> +	 */
> +	fsleep(QMC6308_POR_US);
> +
> +	data->range =3D QMC6308_RNG_30G;
> +	data->odr =3D QMC6308_ODR_50HZ;
> +	data->osr =3D QMC6308_OSR1_8;
> +
> +	ret =3D regmap_write(map, QMC6308_REG_CTRL2,
> +			   FIELD_PREP(QMC6308_SET_RESET_MASK,
> +				      QMC6308_SET_RESET_ON) |
> +			   FIELD_PREP(QMC6308_RNG_MASK, data->range));
> +	if (ret)
> +		return ret;
> +
> +	/* OSR2 (second-stage filter) set to its power-on default of 0 */
> +	return regmap_write(map, QMC6308_REG_CTRL1,

[Severity: Medium]
If the soft reset logic is level-sensitive and holds the chip in reset while
the bit is 1, the initialization occurs only after the bit is cleared to 0 =
by
the second write to QMC6308_REG_CTRL2.

Can the hardware reliably accept this immediate subsequent write to
QMC6308_REG_CTRL1 without any delay, or does it need time to initialize aft=
er
the reset is deasserted?

> +			    FIELD_PREP(QMC6308_MODE_MASK,
> +				       QMC6308_MODE_NORMAL) |
> +			    FIELD_PREP(QMC6308_ODR_MASK, data->odr) |
> +			    FIELD_PREP(QMC6308_OSR1_MASK, data->osr) |
> +			    FIELD_PREP(QMC6308_OSR2_MASK, 0));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721134843.7484=
-1-jorijnvdgraaf@catcrafts.net?part=3D2
