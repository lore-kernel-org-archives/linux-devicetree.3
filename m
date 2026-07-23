Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4146C419315
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800288; cv=none; b=Aa2MD5aOegcMPW36a85FWw5X1TSJrAyGu2pk1wfITgvhLaOa0KXH6Gf8CohANkZABIVq+s5kZLIqPkjJJ4oDv+5dz0zpGlSrcA1fvrPpA1cZpDJxVudYTziKo6rIHpwrLRr1fMFthgmo9GILu/2vOMsjrAdgham8CvAxUaMTZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800288; c=relaxed/simple;
	bh=ZGjgfFygTR5yKswfCzMTp1ex4BIyR6PqMTjg3USxnGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CtWTW936hwXungJ9x4xstGRYtjZhtZ/MmX5w2lcqW0kOgrtMRmN4Rm+Giyz7mv1cD5liV5NGmmO41r3sBlwKaUsVB3qB2DoTXnMfQ6LqlW5afM89yQsQZXTUDyXUcDDFVkva/asMW28pQ8ZTSpUKmhpW17bSC/avcFgMYnDQe1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cT1TKUxF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cT1TKUxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6EE1F000E9;
	Thu, 23 Jul 2026 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784800287;
	bh=D6sgjTWkOufOusGJzCvakv6djsi6rfR6UZGLN5P6D5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cT1TKUxF5MB8mx3XAR3blSTgHUjoMPhfP3pDzgtPYyEvCsgQZPsOsSUjIbIJfbPGV
	 mpfzI/s0qOqLj9bmug9+62nDqB0HVOVGI3CdsHQAFhbboqB5BfylzBCsW/jn+XwAKa
	 4b3KNH2vFaeNioBtd42RXMn7JKHfm1PMCAxIlGpBhYuJ2jsJgZedC361v7bwQ3ae0g
	 N8paM7/aVor3X9MUM7pUgqWMZ6dcuG5b4/LacGaH3LDksv+PM1Vm+SeAxBSWl+nMyJ
	 FotOlMalVlodjxPbCkNVXHiJyEZEk6tQZZE+Y2zTrPIJVD1AmDLWWgvVdsRQ33Ge8i
	 tUV/ftg9a7SEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] regulator: fan53555: Add support for mode
 operations on Silergy devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Victor Krawiec" <victor.krawiec@arturia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723094001.120264-5-victor.krawiec@arturia.com>
References: <20260723094001.120264-1-victor.krawiec@arturia.com>
 <20260723094001.120264-5-victor.krawiec@arturia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:51:26 +0000
Message-Id: <20260723095126.EA6EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The function `fan53555_set_mode` unconditionally returns 0 and ign=
ores the error return value from `regmap_update_bits`, falsely informing th=
e regulator core that mode changes were successful even when underlying I2C=
 transfers fail.
--

--- Patch [4]: [PATCH v3 4/4] regulator: fan53555: Add support for mode ope=
rations on Silergy devices ---
commit 0810cb3eb74c80e6af381ca179af7f69456b49a8
Author: Victor Krawiec <victor.krawiec@arturia.com>

    regulator: fan53555: Add support for mode operations on Silergy devices
   =20
    Make the PWM mode configurable from devicetree. Some boards require for=
ced
    PWM mode to keep the supply ripple within acceptable limits under light
    load conditions
   =20
    Support is restricted to Silergy manufacturer as it is the only one
    currently tested.

> diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
> index c282236959b18..85f46874eb49d 100644
> --- a/drivers/regulator/fan53555.c
> +++ b/drivers/regulator/fan53555.c

[ ... ]

> @@ -389,6 +390,18 @@ static int rk8602_voltages_setup_rockchip(struct fan=
53555_device_info *di)
>  	return 0;
>  }
> =20
> +static inline unsigned int fan53555_map_mode(unsigned int mode)
> +{
> +	switch (mode) {
> +	case FAN53555_REGULATOR_MODE_FORCE_PWM:
> +		return REGULATOR_MODE_FAST;
> +	case FAN53555_REGULATOR_MODE_AUTO:
> +		return REGULATOR_MODE_NORMAL;
> +	default:
> +		return REGULATOR_MODE_INVALID;
> +	}
> +}
> +

[Severity: High]
This is a pre-existing issue, but since this patch enables setting the
mode from the device tree via fan53555_map_mode(), should fan53555_set_mode=
()
check the return value of regmap_update_bits()?

Looking at fan53555_set_mode() in drivers/regulator/fan53555.c, it
unconditionally returns 0 and ignores the error return value from
regmap_update_bits():

drivers/regulator/fan53555.c:fan53555_set_mode() {
    ...
	switch (mode) {
	case REGULATOR_MODE_FAST:
		regmap_update_bits(rdev->regmap, di->mode_reg,
				   di->mode_mask, di->mode_mask);
		break;
	case REGULATOR_MODE_NORMAL:
		regmap_update_bits(rdev->regmap, di->vol_reg, di->mode_mask, 0);
		break;
	default:
		return -EINVAL;
	}
	return 0;
}

If an I2C transfer fails here, the regulator hardware could remain in
auto mode while the kernel core falsely believes it was successfully set to
forced PWM mode. Could this lead to the unacceptable voltage ripple under
light load conditions mentioned in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723094001.1202=
64-1-victor.krawiec@arturia.com?part=3D4
