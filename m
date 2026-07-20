Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7F83D75DF
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542593; cv=none; b=udyUGbOsKItqJbgpAQnHe8FXQv3B29Nt+8uDrDx+uwNaSivmysu5uToNCwRya1pKGTW2nJPlGbriPykeFHR2G0+uzUxYl6LOxwoAeoHfZ4Fg9fbZ6t+QIQeBrLzursGUOg5ej6f0ZerFu9z4GZB5qj0YDqQ+FAgBLvAU+teTOeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542593; c=relaxed/simple;
	bh=F+ANIWlP5jBXMnxlF7+KGuKcbvPJr7MtqhL3TUKQWEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AV+KeYsIdG0gE2B3Rr4iXgMi/eUkl8LfgJSpcPkBf/QoPCKNOtCDvNsw713Xn2HX6bkNvUQt/KOIq6x61HMvuMfdbxfSyFpuNWKgNuArXemoKT1qy4SWFRMJrFNUxX9nslXN/8Os77R4mJrKVL2QkmRS7UgLEYDpXtLYYZkWo5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y05+Gz2l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y05+Gz2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018E41F00A3A;
	Mon, 20 Jul 2026 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784542587;
	bh=lOXUcMbEhso0eCLCJWJ6AA+NHqA+y5iaI6UE3SAv+6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y05+Gz2lT9R/PU+MdGo+/GCZRSvXH1y+tGPM5Wen6gMjD9RCaj6fdJdcFZsraUJVJ
	 AXEI1n4u8dpct7Hb2roO5Em0iWVe/CuMA92hggxY64QF3vtvyfhHRy2JZq9jqIz6Lh
	 eNY5nMjEMUZ7+1bai0xVr8dIzfBcFiHAhhBAbFBR3cH4fL+nyRJvjeRb1T4Hc8f/2t
	 bcaGEubcKLgn2/SEnJgl3oWLIR/5m9kllK1guczEQYkAwcPrHArp2+RdogFfSZ5dLb
	 6UoFWpZgtYkop6hLcn1h6MQ3cV9Hzb6zDo2oPM73H3SDwPHQsWTQW4BtlC5sucrKb6
	 VuB5Z5/p7Jy9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] regulator: fan53555: Add support for mode
 operations on Silergy devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Victor Krawiec" <victor.krawiec@arturia.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720100336.62004-5-victor.krawiec@arturia.com>
References: <20260720100336.62004-1-victor.krawiec@arturia.com>
 <20260720100336.62004-5-victor.krawiec@arturia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:16:26 +0000
Message-Id: <20260720101627.018E41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] fan53555_set_mode() incorrectly updates the voltage register inste=
ad of the mode register when setting REGULATOR_MODE_NORMAL, causing severe =
voltage corruption on chips where these registers are distinct.
--

--- Patch [4]: [PATCH v2 4/4] regulator: fan53555: Add support for mode ope=
rations on Silergy devices ---
commit 4b739645e4ed09b01a00b9bb826b1cf9a4da63a8
Author: Victor Krawiec <victor.krawiec@arturia.com>

regulator: fan53555: Add support for mode operations on Silergy devices

This commit makes the PWM mode configurable from devicetree for Silergy
devices. It adds a mapping function for devicetree mode flags to regulator
modes, allowing boards to force PWM mode to manage supply ripple.

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

[Severity: High]
This isn't a bug introduced by this patch, but mapping to REGULATOR_MODE_NO=
RMAL
exposes a pre-existing issue in fan53555_set_mode().

When REGULATOR_MODE_NORMAL is selected, fan53555_set_mode() updates di->vol=
_reg
instead of di->mode_reg:

fan53555_set_mode() {
	...
	case REGULATOR_MODE_NORMAL:
		regmap_update_bits(rdev->regmap, di->vol_reg, di->mode_mask, 0);
		break;
	...
}

On chips where the mode register and voltage register are distinct (such as
RK8602, FAN53526, or TCS), clearing di->mode_mask inside di->vol_reg corrup=
ts
the voltage selection bits. This can cause a sudden, unintended drop in out=
put
voltage leading to a system lockup.

Is it possible to correct the register used in fan53555_set_mode() before
enabling this mode mapping?

> +	default:
> +		return REGULATOR_MODE_INVALID;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720100336.6200=
4-1-victor.krawiec@arturia.com?part=3D4
