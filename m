Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7A768EA
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784131361; cv=none; b=NTV6G41KMy3kW+egQTmrQEZa+1cD1JTbX+vPEei+nsXwsCXfL6rFm9qogFGZIH4JrIFeDVtEiRJpV6n8cSDM09iXqN/1CRSiTP9jL73EgCjyJ5CzzxHeE9Ow9xxctq3uddJdqoCkG2e8WcZHRselBGFFewEeaQZRKeM8VEjm5Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784131361; c=relaxed/simple;
	bh=S+YhcAVVSNMXBW6DdXVyKuxTZqVlD4N9f/UIrwbcGeg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Um9byYhfWlL/r3ZbmFnCcHpkLF8YeM5OQ8rizmEBKDWu9wlWAz/Ium3kFcvbz1TmV6DONmEtWpRI7d5zWg65pseL9hiGGs2+m3+REdSEIJmSF6llHyrXvjMfoMj+WjoFC6H/Gqaf6ow4pH3uBhLkk7BWEaYnHNyN6/tQEcOGMZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRCMiPlv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRCMiPlv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26461F000E9;
	Wed, 15 Jul 2026 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784131360;
	bh=20mmGWHoo89Uvc/en6FR3F+cX9OEaeKyAJa+1M4LBrI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KRCMiPlvKbJBIcQz8Jxx/S0HzMMDXBKKAeHevr3/zv+iacjjL/tDdt1lSQLz8P527
	 6m4P4giYOG31T86Rk/nTtUikbmImuvzC9dKKGJ69vCb73qgNPW/uBW8NAGc5zd1bJi
	 qpw9AQyG9P3tt/cKcNX2CpBNO6I5w0RHnhCR4spE3ji4c5Y5jyYwDtM9mz3qhESW2k
	 pc2rxFuChQlDKpg0T1mwl3AQM8K6A67ImKCB4G+QVtQyjJdcFjuePO3vkQco77NGty
	 JumpQKkbpvKpErxkIjjOkdSopIUNHnDdrfjltLMUNO+cTvWUGzb4ZqD4rkyAVPR7cg
	 lit3nt8ckNUvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] regulator: fan53555: Add support for mode
 operations on Silergy devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Victor Krawiec" <victor.krawiec@arturia.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260715155141.128601-5-victor.krawiec@arturia.com>
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
 <20260715155141.128601-5-victor.krawiec@arturia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 16:02:39 +0000
Message-Id: <20260715160239.C26461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `fan53555_set_mode()` writes to `di->vol_reg` instead of `di->mode=
_reg` when setting `REGULATOR_MODE_NORMAL`, causing severe state corruption=
 for several vendors.
--

--- Patch [4]: [PATCH 4/4] regulator: fan53555: Add support for mode operat=
ions on Silergy devices ---
commit f660e0b49b4dfc8b2006ec4509cf598aba57babb
Author: Victor Krawiec <victor.krawiec@arturia.com>

regulator: fan53555: Add support for mode operations on Silergy devices

This patch maps Silergy PMIC device modes via device tree by mapping
SYR82X_REGULATOR_MODE_AUTO to REGULATOR_MODE_NORMAL. It exposes configurable
PWM modes for these regulators.

> diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
> index c282236959b18..8664659f0d809 100644
> --- a/drivers/regulator/fan53555.c
> +++ b/drivers/regulator/fan53555.c

[ ... ]

> @@ -389,6 +390,18 @@ static int rk8602_voltages_setup_rockchip(struct fan=
53555_device_info *di)
>  	return 0;
>  }
> =20
> +static inline unsigned int fan53555_silergy_map_mode(unsigned int mode)
> +{
> +	switch (mode) {
> +	case SYR82X_REGULATOR_MODE_FORCE_PWM:
> +		return REGULATOR_MODE_FAST;
> +	case SYR82X_REGULATOR_MODE_AUTO:
> +		return REGULATOR_MODE_NORMAL;

[Severity: High]
This isn't a bug introduced by this patch, but returning REGULATOR_MODE_NOR=
MAL
here exposes a pre-existing issue in fan53555_set_mode() that affects multi=
ple
vendors (such as FAN53526, TCS, or RK8602).

When an in-kernel PM consumer driver or sysfs interface calls
regulator_set_mode() to set REGULATOR_MODE_NORMAL, it incorrectly updates
di->vol_reg instead of di->mode_reg:

drivers/regulator/fan53555.c:fan53555_set_mode() {
	...
	case REGULATOR_MODE_NORMAL:
		regmap_update_bits(rdev->regmap, di->vol_reg, di->mode_mask, 0);
		break;
	...
}

For RK8602, di->mode_mask is VSEL_MODE (BIT 6), but in vol_reg (e.g.,
RK8602_VSEL1), bit 6 represents a 64-step voltage increment (400mV). Cleari=
ng
this bit inadvertently plummets the physical voltage, which can cause hardw=
are
brownouts, instant kernel panics, or memory corruption.

Is it possible to fix this existing issue in fan53555_set_mode() by using
di->mode_reg instead of di->vol_reg before or alongside this change?

> +	default:
> +		return REGULATOR_MODE_INVALID;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715155141.1286=
01-1-victor.krawiec@arturia.com?part=3D4
