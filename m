Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F554A2625
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531962; cv=none; b=dc2BTxubBKOJQGw+6x/3vHozWlvwijd+jasAIh9+TfU79KbN+yicfSajjK6W7Hmwlpwtr8X5hyav4HS7W8RiMijMSW1ER2Yq5DKkyfB+AeyYWPW7kDb99BuEPLO2SRBj/Ws71q5RjdFPRnu9j16+FTkpz1SsCliPuqQeaJLBa1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531962; c=relaxed/simple;
	bh=24IjS/VCzz7mKBU4FrywriDyQdjYrMCl9zAtlOWBtwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r0u8yfh4s1AvgiCl/fK6Kklfh0dVWmD3aOXqoVL8p6/qd5Ue13Bt4OPJ2cMcgvY9epn04dprHyZCtRbMfhbeInzyoMiPR/r/0ShAyHvhMnyOUoPW475cb6oaRxrt1O4EyWZ2UYY0ITA5y0rbOkZ0XyHrsLzh1c5gP0UK0t1+dnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkeEAyRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkeEAyRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6121F00A3D;
	Fri,  4 Sep 2026 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788531960;
	bh=0aqmNbKR0eqzlOBql0dAAw9V0+zdJ4/Awxub7i6Si+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZkeEAyRrV/6AZHsMI1vAPF1K4aKkls8J+O1R2QHBCF7YPNncm3QK0DYv44Q4kjcD7
	 o9HV8X1nzqVFrLEzq81Oc9nFJuOOZNGhSUWJBYO5OG+OrGlroM7+DabaWEABnewwEZ
	 tVlPaW4xhVM3otXo+YcqnEER8TDmtetWnzRoosjz0RYeaaF45LJQHB9FQayl7b9ZMt
	 uOKFCjR/sui7JAXuyj3rIKhWRWPY9a2bLeP3j1dRueoxtNp/T+PxL43o+U2klg66Un
	 oSuX0/T7dvAV9BPqET6WIr9N9zYS6FNXqLznSGT8IDZ49OO9Xoh2CyhHwe/QC+t0dG
	 Eqofa69ukb4QA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/17] iio: adc: ad7768: Add power mode helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-ad7768-driver-v6-7-e4378f946bfb@analog.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-7-e4378f946bfb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 14:25:59 +0000
Message-Id: <20260904142559.DD6121F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Splitting the update of AD7768_REG_POWER_MODE into two separate =
regmap_update_bits calls creates a transient hardware state where the power=
 mode and clock divider are mismatched, and adds redundant SPI bus overhead.
--

commit 9e0a5b0981ecb80ffeddcff0bde57100dda96fba
Author: Janani Sunil <janani.sunil@analog.com>

iio: adc: ad7768: Add power mode helper

Describe each power mode and its internal master-clock divisor in a
table. Replace the open-coded fast-mode setup with a helper that records
the active mode, preparing for dynamic mode selection.

> diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
> index 707f3ae70a95a..71db57a2b9dd6 100644
> --- a/drivers/iio/adc/ad7768.c
> +++ b/drivers/iio/adc/ad7768.c

[ ... ]

> @@ -335,6 +349,36 @@ static int ad7768_sync(struct ad7768_state *st)
>  			       AD7768_DATA_CONTROL_SPI_SYNC);
>  }
> =20
> +static int ad7768_set_power_mode(struct ad7768_state *st,
> +				 unsigned int mode_idx)
> +{
> +	const struct ad7768_power_mode_info *mode_info;
> +	int ret;
> +
> +	mode_info =3D &ad7768_power_modes[mode_idx];
> +	ret =3D regmap_update_bits(st->regmap, AD7768_REG_POWER_MODE,
> +				 AD7768_POWER_MODE_POWER_MODE_MSK,
> +				 FIELD_PREP(AD7768_POWER_MODE_POWER_MODE_MSK,
> +					    mode_info->mode));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(st->regmap, AD7768_REG_POWER_MODE,
> +				 AD7768_POWER_MODE_MCLK_DIV_MSK,
> +				 FIELD_PREP(AD7768_POWER_MODE_MCLK_DIV_MSK,
> +					    mode_info->mode));

[Severity: Medium]
Does splitting this register update into two consecutive read-modify-write
operations to AD7768_REG_POWER_MODE create a problematic transient hardware
state?

Updating the analog power mode first and the digital clock divider second m=
ight
leave them temporarily mismatched. If the analog power mode is updated to a
lower state while the clock divider remains fast, could this violate intern=
al
timing constraints and risk ADC glitches or unpredictable behavior?

Could these two fields be updated in a single regmap_update_bits() call to
avoid both the transient hardware state and the redundant SPI bus overhead?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D ad7768_sync(st);
> +	if (ret)
> +		return ret;
> +
> +	st->power_mode_idx =3D mode_idx;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-ad7768-dri=
ver-v6-0-e4378f946bfb@analog.com?part=3D7
