Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80B330ACF2
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143890; cv=none; b=fER5uRb2KrgTr/O0esw+LCx5IiejXO2Z9h/sdz1ZQe/KllFNrKBMi0i2ECksXB9hu9fB2kWKNUHKHYVKZbTQe09nuPSGS+8cf1DgETaMIy3CXSEg1UrUv1FgH9IiRrM7qNMnCUkXPeEIOOwguV9yzzAmd8Xj4Ps1pgmdxRb29Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143890; c=relaxed/simple;
	bh=YB3E1SOkZ18DmK/jb7Kc4yGYWpWrwx8aAA0frTL6Xwo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NE2Evk8SDtQR4Xh/tQoY8UM4AtxFlwowq354QNtJxgfZK5VSvkTcUdwmAflTHKj7Bfc2gn+LnRH6xSz2Z1RzXjufP5rg0xXoaeC1Vbo1VW8SsiJIMpqAh7lG5pQbNRPL2KoxYZPVhjNNEPN5BqP4Wzxt2K/kE6DP84XMKHA8BvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=civzAKqJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="civzAKqJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970911F000E9;
	Wed, 19 Aug 2026 12:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787143888;
	bh=vixKYNPo2Yyw/aw4vy9tqNTQjAkAWWlN8+qLxMhEhWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=civzAKqJWHt0TR/PPuuyrt8XyHDyB6qMRvX85BzJC6CjhH7qoLSLUe/piaQjxTLnD
	 QYf6f6As96v3XowPq3UsCDZ67Y0p5x0v9Zqny55rKq9IjlQNfxsVel3sjHdEKJdVm6
	 xPmmC8nipgmSJjP04kZREdVyGWmzFuU9Ifo8luMIb3h+nmqs6UcYjZ3MYiTfdZaw4c
	 VABdmNsu3wnlHFmd+6bnDajjLvNyGkclVOyDdUXK1mOrv30348RWwvKoumhGKhA66x
	 QUgSjGUwXP8mimrJZhytQoYex+Ne+aef18zch9TYtK0c1HIGV1/dEgX3we0ZX1RbsM
	 aZqxihyX9pD7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/9] iio: dac: mcp47feb02: correct false state case
 in store_eeprom_store
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819-mcp47feb02_refactor-v4-3-beb2aa3bfd09@microchip.com>
References: <20260819-mcp47feb02_refactor-v4-0-beb2aa3bfd09@microchip.com>
 <20260819-mcp47feb02_refactor-v4-3-beb2aa3bfd09@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 12:51:28 +0000
Message-Id: <20260819125128.970911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but mcp47feb02_resum=
e incorrectly writes the powerdown mode to the Voltage Reference (VREF) reg=
ister, corrupting the channel's reference voltage setting.
- [High] This problem wasn't introduced by this patch, but mcp47feb02_suspe=
nd and mcp47feb02_resume overwrite the software powerdown state, causing al=
l channels to be forcefully activated on resume regardless of user configur=
ation.
- [High] This problem wasn't introduced by this patch, but mcp47feb02_init_=
ctrl_regs fails to identify the powerdown state when the hardware boots in =
'1kohm_to_gnd' mode.
- [High] This problem wasn't introduced by this patch, but store_eeprom_sto=
re performs a sequence of volatile register reads and EEPROM writes without=
 holding the state mutex, leading to a TOCTOU race condition.
- [High] This problem wasn't introduced by this patch, but mcp47feb02_write=
_raw does not validate the incoming user value against bounds for IIO_CHAN_=
INFO_RAW.
--

--- Patch [3]: [PATCH v4 3/9] iio: dac: mcp47feb02: correct false state cas=
e in store_eeprom_store ---
commit dc6f30f8cc576f94a887f7f0e174caf833ebb683
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: correct false state case in store_eeprom_store
   =20
Return len also when the state is false instead of 0.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index bf78618ac2c89..2ee981393aa1a 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c
> @@ -469,7 +469,7 @@ static ssize_t store_eeprom_store(struct device *dev,=
 struct device_attribute *a
>  		return ret;
> =20
>  	if (!state)
> -		return 0;
> +		return len;
> =20
>  	/*
>  	 * Verify DAC Wiper and DAC Configuration are unlocked. If both are dis=
abled,

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but store_eeprom_store performs
a sequence of volatile register reads and EEPROM writes without holding the
state mutex, leading to a race condition with concurrent state modification=
s.

Can an inconsistent combination of driver states be written to the NV EEPROM
because the data->lock is not held across the snapshot sequence?

drivers/iio/dac/mcp47feb02.c:store_eeprom_store() {
    ...
    ret =3D mcp47feb02_write_to_eeprom(data, NV_REG_ADDR(i),
                                     data->chdata[i].dac_data);
    ...
}

[Severity: High]
This is a pre-existing issue, but mcp47feb02_resume incorrectly writes the
powerdown mode to the Voltage Reference (VREF) register, corrupting the
channel's reference voltage setting.

During system resume, does this corrupt the voltage reference configuration
because it targets MCP47FEB02_VREF_REG_ADDR instead of the powerdown regist=
er?

drivers/iio/dac/mcp47feb02.c:mcp47feb02_resume() {
    ...
    ret =3D regmap_update_bits(data->regmap, MCP47FEB02_VREF_REG_ADDR,
                             DAC_CTRL_MASK(ch), DAC_CTRL_VAL(ch, pd_mode));
    ...
}

[Severity: High]
This is a pre-existing issue, but mcp47feb02_suspend and mcp47feb02_resume
overwrite the software powerdown state, causing all channels to be forceful=
ly
activated on resume regardless of user configuration.

Does this unconditionally wake the channel and destroy the user's previously
configured powerdown preference?

drivers/iio/dac/mcp47feb02.c:mcp47feb02_suspend() {
    ...
    data->chdata[ch].powerdown =3D true;
    ...
}

drivers/iio/dac/mcp47feb02.c:mcp47feb02_resume() {
    ...
    data->chdata[ch].powerdown =3D false;
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but mcp47feb02_init_ctrl_regs
fails to identify the powerdown state when the hardware boots in 1kohm_to_g=
nd
mode.

When pd_tmp is 1, powerdown_mode becomes 0. Does this cause the powerdown
check to evaluate to false even though the hardware is in a powerdown state?

drivers/iio/dac/mcp47feb02.c:mcp47feb02_init_ctrl_regs() {
    ...
    data->chdata[i].powerdown =3D !!(data->chdata[i].powerdown_mode);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but mcp47feb02_write_raw does not
validate the incoming user value against bounds for IIO_CHAN_INFO_RAW.

Can out-of-bounds values be written directly to the DAC data registers since
the user-supplied value is not validated?

drivers/iio/dac/mcp47feb02.c:mcp47feb02_write_raw() {
    ...
    ret =3D regmap_write(data->regmap, REG_ADDR(ch->address), val);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mcp47feb02=
_refactor-v4-0-beb2aa3bfd09@microchip.com?part=3D3
