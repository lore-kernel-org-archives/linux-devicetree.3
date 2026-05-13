Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9163EDE7F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651199; cv=none; b=LOZr38OAbMs8ppQ6rUMO6QQIok6gq1As+nty1WlBnmrNaYtrFGG4EIzUGyrOH0299aVz1Ia3JRc6w0cslXFn0P1cnzhGu2c3B6fnN5mWEis7NxY0RrNP3X8nVZqizCSgger/lYK8cMtujOs1H0gkogStWskKBLHTeLl7H+jIpXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651199; c=relaxed/simple;
	bh=DFRnabQjv9Iu3XVX6/snP4d5a/7iLDQBkB67wfU15gQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZuiWQOM4gNjyY9cqjAV32Fh5OdGE4pdlx+0n/Rb8KGM+2ibchv44LNmeRjyvPU8GZAQFhaTseZX888ezGBf2Dh1G7EIt5bf/V5XSz4o2GBY0OfpZufanEgESly0/l5PV93Za706j/MdtgjdZTrzgh3x3Jk/jkw9r7KGiYHNi+0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=He+dmy71; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="He+dmy71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85576C2BCB7;
	Wed, 13 May 2026 05:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778651198;
	bh=DFRnabQjv9Iu3XVX6/snP4d5a/7iLDQBkB67wfU15gQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=He+dmy71Oja2Zpz896oJArCLwxi4R6ANnmu/tNTpG7UGXSSLnAT8KXRVqXfWQlrI3
	 /eIynYEbKYHFGtfJ2uxzEnJl7k8bP5i0mXRd2cZGBFqs0ReJlmmzaUEUGTuMz/Ysub
	 4Rbo5cndVhgbAshy/3d9yZPfA5h+RM3HE5zQul860HX9lwG2kyGE3mEqjKoz4YKbzx
	 ldp9b2X8uTRFvvGHNZLJathxoA9AwSF/1JfRGkWE1NPSlEvRg7NyeLCHU0xkYsr7ND
	 YwgK/MA8QToaCiwTszBcLYowvCxlz/bb0CnoQ3Th4mB6ccWEJHJVvaj9paHyqmfqT3
	 8fY//bypjgPJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/16] iio: adc: mediatek: add mt6323 PMIC AUXADC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 05:46:38 +0000
Message-Id: <20260513054638.85576C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware initialization uses inverted logic, powering down the ADC=
 clock and disabling its voltage reference.
--

commit a9bbb1136cb8fc7a5d965b8e9d48f405b0c7b4fa
Author: Roman Vivchar <rva333@protonmail.com>

iio: adc: mediatek: add mt6323 PMIC AUXADC driver

This commit adds a new driver for the 15-bit AUXADC found in the MediaTek
mt6323 PMIC. It provides support for reading channels like battery voltage,
temperatures, and accessory detection.

> diff --git a/drivers/iio/adc/mt6323-auxadc.c b/drivers/iio/adc/mt6323-aux=
adc.c
> new file mode 100644
> index 0000000000000..2c2b495e3d382
> --- /dev/null
> +++ b/drivers/iio/adc/mt6323-auxadc.c

[ ... ]

> +static int mt6323_auxadc_init(struct mt6323_auxadc *auxadc)
> +{
> +	struct regmap *map =3D auxadc->regmap;
> +	int ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_STRUP_CON10,
> +			      AUXADC_RSTB_SW | AUXADC_RSTB_SEL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_TOP_CKPDN2, AUXADC_CTL_CK);

Is it intentional to set AUXADC_CTL_CK here? In MediaTek PMICs, CKPDN
typically stands for Clock Power Down, meaning a value of 1 powers off the
clock. Should this use regmap_clear_bits() instead to enable the ADC clock?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_AUXADC_CON10,
> +			      AUXADC_TRIM_CH2 | AUXADC_TRIM_CH4 |
> +				      AUXADC_TRIM_CH5 | AUXADC_TRIM_CH6);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_AUXADC_CON27,
> +			      AUXADC_VREF18_ENB_MD | AUXADC_MD_STATUS);

Does setting AUXADC_VREF18_ENB_MD disable the 1.8V analog voltage reference?

The _ENB suffix usually indicates an active-low enable signal. If setting
this bit to 1 disables the reference voltage, it might leave the hardware
functionally offline.

Could regmap_clear_bits() be the correct operation for the active-low enable
bar signal?

> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-mt6323-v2-=
0-3efcba579e88@protonmail.com?part=3D5
