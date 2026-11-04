Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812369;
	b=tRNQ/tc7mvlV4n3JL9zyPcBevinXDauz99xzQ8P66LtZ/YHhD02UV0YYg9F1sQprN2SO
	 /O+ZyJIPK2GjLqxyA17+f2mwSS6a6FtxEAla2olG8VFX71MYMt4poGoloQAfsF1qLyLtl
	 VEyi18zAFPFobOizvH1jNdVO2k/+zgeg3LblIbvAPv6ID//a2Er58Ec1BppKwaeYDgvUq
	 KgWnCXViKnzZj3oOpoBON0+RFvjMsC1p2iEiGfRllCFzCvTFcp1U78+GYS2SyOK6z34IP
	 IhMW/oM4FqW1ok2zP7MA5NFQtQQQu/XBXjhgbTYkX79VFNVZOuORkxdNVN+SqRVJ7RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R6xt0mdC75yrurzXizASZlxF9bMkeZWBQh1flS7fMIE=;
	b=OOymSIqiUvsWCxUfRxHyFf4o4kjFJQJZU6v72QtP4AZujD1Y/le8DWfSOZHRNunBAY/9
	 6KzxQ4d8fKKISi+XfOl8uRCQBVNXWh9tAS0I2POicI1lDWfeuETBhgAtBm0GlSNlBpmtf
	 Oyr2NHQxYa7yZYmU7xgKflBiS8nXCBHMIXFr6Dndsdt80BCWTDKFH9QWZ7XMXEeDdxpEZ
	 yUEADuPYIHE8PV4nbBipI7As0P7fciO8UXylVv9WcyApq65eRuTtKR+hoV6hceR3KPMQs
	 aKtorswREnN5XHPWCNnYmFLbrE0dFbE2DmQmB0W8V/rBps4I5QXQpNn/vtbPpSMMqVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ITcCUc4b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F05606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ITcCUc4b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048911F000C1;
	Wed,  4 Nov 2026 17:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793812368;
	bh=R6xt0mdC75yrurzXizASZlxF9bMkeZWBQh1flS7fMIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ITcCUc4bphGM5coAHml72/wpDlHBordCZ2TrvLLGtk3dum/JBFdmu/Y95vn1WE2OG
	 F3ZDTvu/h6hxWjYa77YMcXPJhqlDZx1zcaOon5PZkLNaD+A8+cDzF7CPJZv+zlCnU1
	 HP40zG89I1PA+CrBcnrJV7W7JPw8lGgdnhS6B4FZgTAJhG2ONI8MVCNAoi3QG2CuG+
	 CPiyWCcVybdhO7VnZzc0qG5Yy4/gmPN43rm98kejy67aZxrg9mSBr0t6ommaWUuIU/
	 v9MCA5amYkKNMwx/cYOenN/W7ZALyGFGqSTirjQW2wjpkoRB/AiQ9majbnrh9iUe9d
	 psmzWyJ7gvmHg==
Message-ID: <sashiko-outbox-197723@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] regulator: core: Support regulators where the
 voltage selector spans two registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-paul-lm51772-v4-2-494eab808581@bootlin.com>
References: <20261104-paul-lm51772-v4-0-494eab808581@bootlin.com>
 <20261104-paul-lm51772-v4-2-494eab808581@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 17:12:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] regulator: core: NULL deref on cfg->regmap in regulator_register()
- [High] regulator: core: false -EINVAL when vsel_reg is 0 in regulator_reg=
ister()
--

commit d7169bf1fc7df63ad755917c095641a4d50ecedf
Author: Paul Louvel <paul.louvel@bootlin.com>

regulator: core: Support regulators where the voltage selector spans two re=
gisters

This commit adds the vsel_reg_oversize flag to struct regulator_desc to
support regulators whose voltage selector spans two consecutive 8-bit
registers, reading and writing them in bulk as little-endian 16-bit values.

> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 14422cfe80e2d..31f3d1ac42d09 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -6060,6 +6060,14 @@ regulator_register(struct device *dev,
>  		goto rinse;
>  	}
> =20
> +	if (regulator_desc->vsel_reg_oversize) {
> +		if (regmap_get_val_bytes(cfg->regmap) !=3D 1 ||

[Severity: High]
Can this dereference a NULL pointer when cfg->regmap is not explicitly set =
by
the caller?

In struct regulator_config, regmap is optional when dev_get_regmap() can
provide it, or when regulator_desc->of_parse_cb populates config->regmap
later during regulator_of_get_init_data(). In regulator_register(),
rdev->regmap is only resolved further down:

	if (config->regmap)
		rdev->regmap =3D config->regmap;
	else if (dev_get_regmap(dev, NULL))
		rdev->regmap =3D dev_get_regmap(dev, NULL);
	else if (dev->parent)
		rdev->regmap =3D dev_get_regmap(dev->parent, NULL);

However, regmap_get_val_bytes() unconditionally dereferences its map
argument:

int regmap_get_val_bytes(struct regmap *map)
{
	if (map->format.format_write)
		return -EINVAL;

	return map->format.val_bytes;
}

Should this check be moved after rdev->regmap is initialized, and verify th=
at
rdev->regmap is non-NULL before calling regmap_get_val_bytes(rdev->regmap)?

> +		    regulator_desc->vsel_reg =3D=3D regulator_desc->vsel_range_reg) {
> +			ret =3D -EINVAL;
> +			goto rinse;
> +		}
> +	}

[Severity: High]
Will this reject valid regulators with -EINVAL when pickable ranges are not
used and vsel_reg is at register offset 0?

For regulators using standard regulator_get_voltage_sel_regmap() and
regulator_set_voltage_sel_regmap() rather than pickable ranges,
vsel_range_reg and vsel_range_mask are unused and left zero-initialized in
struct regulator_desc. If such a regulator has vsel_reg_oversize set and its
voltage selector starts at register 0, regulator_desc->vsel_reg =3D=3D
regulator_desc->vsel_range_reg evaluates 0 =3D=3D 0 and fails registration.

Additionally, when pickable ranges are used, an oversized vsel_reg spans bo=
th
vsel_reg and vsel_reg + 1, so vsel_range_reg could also collide with the
second register at vsel_reg + 1.

Should this check be gated on pickable ranges being used (for example,
regulator_desc->vsel_range_mask !=3D 0) and also check for overlap with
vsel_reg + 1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-paul-lm517=
72-v4-0-494eab808581@bootlin.com?part=3D2
