Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C564263F5E
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701096; cv=none; b=QCQqYxrDVAf2kbIymRXnwV+DbLpBcQw/Xve6hZ6UPFrnvd+AXjqS8ot3zRRSh2LSJxCZf52KikisXI2o4nyOugAQ0Tc56V62n0apQBQb77TW9CcVIO+rTdlCWwtwiHbH8/l5LXZd3r/nyClPIDmtin4SVvNeh+P6/cG/MQC8s/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701096; c=relaxed/simple;
	bh=Ieh39goyFjNT1YLS3Uf9ZIS5QHUztceP+uTzi6O2EDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XsR8spu0v3TDujxPCzWHRrrFBFClEpH8x0z7od7uHVMfzFTy9z2pyjFjDaQqYqTL06YZvNLPC/K1JPKkGT2p37xdxI1lZbj3IKLuW2KP3sTFbCnDsSl4nNYg+NZvUnYrKRaI+OK410M6b1+XaEu+W/Q2N97TnxJN7hVE1bb7ehs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgjQQyxB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgjQQyxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880CF1F000E9;
	Fri, 10 Jul 2026 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783701094;
	bh=mmFnee8oQw1HZQPztE5AR60IquTPwA9hPooiGUmoWaQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PgjQQyxBEUaFa9uxxvk3QjbfYrcH3CPTTcYGacbcGHPGWvvTeJYY+j0AMvrhy5WGH
	 f5Rb9aeYkQa2Jt8lc+dFycqGM8DKdtWFhi9hLF/Q8VE67xQR+KfMg8wApxcBUe0+uQ
	 nTz6EVezhyj17iTC3y5NofXAq8KEKPyy+6a3fMLB+Zk3k0yFIFmD3SeKFiMGCkereh
	 oW3YpxsQfsTECGEutQ3fbhSxdwaEz/kiumlB7KfRP9Zen+EBWABjXVlawXNc09eQHx
	 x8mWKPXN51bABLnh2358ChuZCOTNyjJdiSt61zzjQCrmqYCRl9OPXCc0XyGeTvUZsV
	 xKS3f4hBzIdZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mfd: axp20x: Add support for AXP318W PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260710-axp318-regulator-v2-2-ee5f1c56b49f@baylibre.com>
References: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
 <20260710-axp318-regulator-v2-2-ee5f1c56b49f@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 16:31:34 +0000
Message-Id: <20260710163134.880CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The Power Key (PEK) MFD cell is incorrectly named `axp318w-pek`, w=
hich has no corresponding platform driver, resulting in a dead device.
- [High] The `axp20x-regulator` driver does not handle `AXP318_ID`, causing=
 the regulator probe to unconditionally fail.
- [Low] The newly added MFD cell array `axp318_cells` is not declared as `s=
tatic const`, violating MFD subsystem guidelines.
- [Low] The `axp20x-regulator` cell uses a hard-coded ID instead of `PLATFO=
RM_DEVID_AUTO`, violating MFD subsystem guidelines.
--

--- Patch [2]: [PATCH v2 2/3] mfd: axp20x: Add support for AXP318W PMIC ---
commit 1a5eb1e56ed118dbcf34674ba079b5c5e2ba9f27
Author: Andre Przywara <andre.przywara@arm.com>

mfd: axp20x: Add support for AXP318W PMIC

The AXP318W is a PMIC chip produced by X-Powers, it can be connected to
an I2C bus. It adds support for regulators, interrupts and power key device=
s.

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 679364189ea58..956a0370e6a5e 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c

[ ... ]

> @@ -1061,6 +1134,11 @@ static struct mfd_cell axp313a_cells[] =3D {
>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>  };
> =20
> +static struct mfd_cell axp318_cells[] =3D {

[Severity: Low]
Does this array need to be declared as static const?

The MFD subsystem guidelines recommend using static const for mfd_cell
arrays to prevent dynamic amendments and keep the array in immutable memory.

> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),

[Severity: Low]
Should this cell use PLATFORM_DEVID_AUTO instead of a hard-coded ID?

Using a hard-coded ID of 1 instead of PLATFORM_DEVID_AUTO might lead to
device naming collisions in sysfs if multiple PMICs are present.

[Severity: High]
Will the axp20x-regulator driver probe successfully for this device?

It appears the axp20x-regulator driver's axp20x_regulator_probe() in
drivers/regulator/axp20x-regulator.c is missing a switch case for AXP318_ID.
Would this cause the probe to fall through to the default case, log an
unsupported variant error, and return -EINVAL unconditionally?

> +	MFD_CELL_RES("axp318w-pek", axp318_pek_resources),

[Severity: High]
Is there a matching platform driver for axp318w-pek?

Looking at the child driver's ID match table axp_pek_id_match in
drivers/input/misc/axp20x-pek.c, it seems to only contain axp20x-pek and
axp221-pek. Will assigning this specific name cause the power key device
to silently fail to bind to a driver?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-axp318-reg=
ulator-v2-0-ee5f1c56b49f@baylibre.com?part=3D2
