Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3993D967D
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327631; cv=none; b=iddAqzleLu2I+Q7V26ZfvoUuGPDLsiQopCFu2gDi17RicAbH+jWOt9K/BG/qs28L8ibzDSJcbc/Yb7FPKVJS/wUjvQxcIXG0ezSy4WUifmuSEu0iHsdICRMexROgYze1YchYW1YZXNlyBy59Glg0jcZKMGXZz7TNKfjiLZhNwh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327631; c=relaxed/simple;
	bh=OCL5m0SOtO+FMsNl52bLfTQoAWFAx2INQrquKdQfcKQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K1DzRWiN34PJ/xjNef6kBMbGsyCF+CXOAXNX0jDYjDoO1N0NYKK8MsMmlZj+paHqNyi7QljxwJ4nbpY2AajJFYoRmUHy1PBDrMrxP/bmRgX+LYR1OcCvMh/lvxdQgSccaL9x7OevchbLd/4MINo6AED65xaLV7t5uwKfY6lvSSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDeUMe7R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDeUMe7R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6FA1F00898;
	Mon,  1 Jun 2026 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780327624;
	bh=9dRhDh1NTli/rxlSsEWuHpP2GBVlNYPqCX5GQ9MYAPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MDeUMe7RGSx1U4XOtQy4HJg0KbvN0USPsS6yGBBXUlVWDgmpVvC81bmdttaqshmJY
	 y26yMHTs3i+MWheu0ScNQFOFpYuru5PRGC4FYqeQPp8mMf7dC4JJK+bweYbcI2dIRh
	 lDjp9JOxRPbGSt/O6Hm/2hJKdHv/8d5tvsp8K3VFjbdJfEXXAzOTEyJ/d0khC+74pm
	 a2dTROWwJlXPuNeZxQcQtrRQ4S2xE7rKMDF8ZPJVP4BM4H60WmmACT8ZjDMWk+gXz2
	 E3JljCYfKDmcuEjFriW3hTFpMAbKEPePSIcrg2DMYdLT+zQJOSUqkrV/4u6X+zopcb
	 dfNaPpc9/toCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/11] mfd: lm3533: Remove driver specific regmap
 wrappers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601151831.76350-3-clamor95@gmail.com>
References: <20260601151831.76350-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:27:03 +0000
Message-Id: <20260601152704.6D6FA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect argument order for `regmap_update_bits` silently prevent=
s disabling interrupts.
--

commit 02ae49c5dba8ff55717ce569312b1ed0ac85b17f
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: lm3533: Remove driver specific regmap wrappers

This commit replaces custom wrapper functions for regmap access with standa=
rd
regmap helpers across the lm3533 MFD driver and its sub-device drivers. The
commit message notes that regmap_update_bits requires the mask and value
arguments to be swapped compared to the old wrappers.

> diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-al=
s.c
> index 99f0b903018cf..fb61904f110f1 100644
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c

[ ... ]

> @@ -280,7 +281,8 @@ static int lm3533_als_set_int_mode(struct iio_dev *in=
dio_dev, int enable)
>  	else
>  		val =3D 0;
> =20
> -	ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, val, mask);
> +	ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INF=
O,
> +				 val, mask);

[Severity: High]
Are the mask and val arguments swapped in this regmap_update_bits() call?

The commit message mentions that regmap_update_bits() has the mask and value
arguments swapped compared to the old wrapper, but in this instance they are
passed as val, then mask.

If enable is false, val is 0. Calling regmap_update_bits() with 0 as the
bitmask will modify zero bits, which fails to clear the interrupt enable bi=
t.
Could this cause an unhandled interrupt storm when the interrupt is disabled
via sysfs, or when the driver is removed and free_irq() is called while the
level-triggered IRQ line remains asserted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601151831.7635=
0-1-clamor95@gmail.com?part=3D2
