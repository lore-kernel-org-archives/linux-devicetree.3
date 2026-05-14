Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551122083
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787121; cv=none; b=TwMNIbSXUOrd062tOfWdtr5H/KsyAuwakcgc24OLkN4JH7mQ3zC/yv7WGG9bmitnvcweoioTTEgzYaSnsAfuT2bfWX9BNyDtKuazx1VCiw0oMsOVtl9SRKmF7vGYES5tf2MCOdgpy23+GLjOHrCIhhJW8uwNs36ScTXKPxNFx90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787121; c=relaxed/simple;
	bh=KDXEQQ6aj9Vw3DIsJhPOMdSRteYgEddGvrem3paG0iw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V4Fqlaja84Hj2fy74z8+zzNxCgKlwZqUiAAZDoQpRVIHvVD13ltd886Gjoky/r9Xofa2DHLlIQynRGW86Dm896JTPnfMDq6V4m/X2FjJ7tP442MSX6gghdX+gN4YcRLh2YzVX7LUblHOkCbvxEvMwGhHxTuR4DZWDEo39Oj804Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQL7Dxes; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQL7Dxes"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D25C2BCC7;
	Thu, 14 May 2026 19:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778787121;
	bh=KDXEQQ6aj9Vw3DIsJhPOMdSRteYgEddGvrem3paG0iw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DQL7Dxes9L26K19UzZd+qzR4NVhK61khubHhOH1m6H7MU+d/95c9r3cEWDJim4KeO
	 L7uoq3tm53KccCLhAjyh9SPNfdsdLRBAzCEz9nynPldI2cwcOolqBlN8M2mPO5XJ6M
	 mZpEB4riGcxO3RlOxFi8JjvSg66QO5Fxr6BizHcw3TemheLGDSuM8ghd3Vt6qByzhA
	 M620FWrv2hBKiSbFrv/CAME8ssY5l9Y3lsO97/yAgoxjrq/+M6tzm2KU+24ufK5k6x
	 lwNz5I6cRV6JH5nr1Pxqix7Hqey0zLUtorWEPAJyHuVHBqC2lXvtJHMsLVKKz6hxg4
	 TzGLD72YOLzSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] iio: temperature: ltc2983: Fix macro
 parenthesization and rename
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Stan" <liviu.stan@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514144712.64374-2-liviu.stan@analog.com>
References: <20260514144712.64374-2-liviu.stan@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:32:00 +0000
Message-Id: <20260514193200.F1D25C2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Undocumented API change: addition of the `base` parameter to the=
 `LTC2983_RESULT_ADDR` macro.
- [Low] Compilation failure in `ltc2983_chan_read()` due to undeclared iden=
tifier `base_reg`.
--

commit 24bf0bfe00d6f9aa08599e0c812d5f43a2500269
Author: Liviu Stan <liviu.stan@analog.com>

iio: temperature: ltc2983: Fix macro parenthesization and rename

This commit adds parentheses around the chan parameter in macro definitions
to prevent expansion issues and renames the macros to better reflect the
datasheet names.

>     Wrap the 'chan' parameter in LTC2983_CHAN_START_ADDR() and
>     LTC2983_CHAN_RES_ADDR() with parentheses to prevent potential
>     macro argument expansion issues. Also rename LTC2983_CHAN_START_ADDR
>     to LTC2983_CHAN_ASSIGN_ADDR and LTC2983_CHAN_RES_ADDR to
>     LTC2983_RESULT_ADDR, to better reflect the datasheet names and avoid
>     them being confused as related.

Could the commit message be updated to mention the addition of the base
parameter to LTC2983_RESULT_ADDR?

The commit message describes renaming the macro and adding parentheses, but
fails to mention that the macro was also modified to take a new base
parameter. This undocumented change obscures the intent behind the
refactoring.

> diff --git a/drivers/iio/temperature/ltc2983.c b/drivers/iio/temperature/=
ltc2983.c
> index 38e6f8dfd3b80..a292274e6ff07 100644
> --- a/drivers/iio/temperature/ltc2983.c
> +++ b/drivers/iio/temperature/ltc2983.c
> @@ -56,10 +56,10 @@
>  #define LTC2983_EEPROM_WRITE_TIME_MS		2600
>  #define LTC2983_EEPROM_READ_TIME_MS		20
> =20
> -#define LTC2983_CHAN_START_ADDR(chan) \
> -			(((chan - 1) * 4) + LTC2983_CHAN_ASSIGN_START_REG)
> -#define LTC2983_CHAN_RES_ADDR(chan) \
> -			(((chan - 1) * 4) + LTC2983_TEMP_RES_START_REG)
> +#define LTC2983_CHAN_ASSIGN_ADDR(chan) \
> +			((((chan) - 1) * 4) + LTC2983_CHAN_ASSIGN_START_REG)
> +#define LTC2983_RESULT_ADDR(chan, base) \
> +			((((chan) - 1) * 4) + (base))
>  #define LTC2983_THERMOCOUPLE_DIFF_MASK		BIT(3)
>  #define LTC2983_THERMOCOUPLE_SGL(x) \
>  				FIELD_PREP(LTC2983_THERMOCOUPLE_DIFF_MASK, x)

[ ... ]

> @@ -1197,7 +1197,7 @@ static int ltc2983_chan_read(struct ltc2983_data *s=
t,
>  	}
> =20
>  	/* read the converted data */
> -	ret =3D regmap_bulk_read(st->regmap, LTC2983_CHAN_RES_ADDR(sensor->chan=
),
> +	ret =3D regmap_bulk_read(st->regmap, LTC2983_RESULT_ADDR(sensor->chan, =
base_reg),
>  			       &st->temp, sizeof(st->temp));
>  	if (ret)
>  		return ret;

Does this cause a compilation failure because base_reg is undeclared in
ltc2983_chan_read()?

It appears the fix is introduced later in the series in commit 7aff450fb9c7b
("iio: temperature: ltc2983: Add support for ADT7604"), which adds base_reg=
 as
a function parameter. However, each patch in a series must compile
independently.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514144712.6437=
4-1-liviu.stan@analog.com?part=3D1
