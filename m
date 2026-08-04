Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881D2468C1D
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851177; cv=none; b=N53iodBiDqb0tf8tIxbNzGgG9Fmk7AIfebvVXaTuejP2hBF+snl1tZ1Qf//6r8ohP0OXGSE04zf4LpgmKbHi0weJK53Gcw/WPxuMlGffmzGcGbJwoIpjIJfNFn9oWn8d8fmvxDE2xqDWyqU5qtuCqgLs76Yu8qclVhwkDIlCUFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851177; c=relaxed/simple;
	bh=fSRzgDqztTQeG9Xkxb2EaV/SX3i0uOoLFD3om/pVPPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IyASekGx4senKxQa6xa9xL7wg5W+TlYoqMq/YPqJtPhG0BWurIlYiaEhlOOE8eSHsu5ftNHNye4gV1kVQ8emHicZUN+io+v/rnHOOmGmEpXPiXm1gilyooHBWQ3ysb5fPwMHu7bTM4Ju07R9S6OiTHlzmZd9ixTZ16khfyUPlyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw2AGBx5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qw2AGBx5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8A21F00A3E;
	Tue,  4 Aug 2026 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785851176;
	bh=bXbuVMz6+Ey5k3SI+GFb0Pd/GYQZL/YGfrz3BnlbOQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qw2AGBx5/rsxwpCwNMQfDkXsLYVcTL0EjpDDJCYW4Y8hb66Z7w3jJfTuDN4UpMD09
	 kq/6JDunaKyE+TTVSKCGjnOO06//AYAIxJbAo36/rAwEQoVO/jXP264aDZ+EkN1xEj
	 F+I0cc+xHnnMra84YVJr4GwmHT6fhLmTaIzDMXo2kCGUD52kcIsr2KHDGt1F9CV1Ga
	 5rdakmtdov29i4vkCdeuImQJfIxfaBsuKY7Y3NEZRyYPcykZYZN0WpWBcI9pOUI7jW
	 fYbgZIRyLeHhn9/RHSLrfaJaqGgEIKOimmRoq4cRhGya3hQBKWwdoyumfbLxJ+i6jK
	 cZ9Kst1z73jzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C
 driver into two modules
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804-mcp47feb02_refactor-v3-1-97f8b81f3628@microchip.com>
References: <20260804-mcp47feb02_refactor-v3-0-97f8b81f3628@microchip.com>
 <20260804-mcp47feb02_refactor-v3-1-97f8b81f3628@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 13:46:14 +0000
Message-Id: <20260804134616.1D8A21F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Renaming the user-visible Kconfig symbol from `MCP47FEB02` to `MCP=
47FEB02_I2C` breaks existing kernel configurations.

Pre-existing issues:
- [High] Failure to initialize `dac_data` during probe causes `store_eeprom=
` and system suspend to permanently clobber the DAC hardware output state.
- [High] System suspend and resume clobbers the user-configured channel pow=
erdown state.
- [High] Incorrect bitwise shift in hardware gain parsing causes it to alwa=
ys evaluate to 0.
- [High] The sysfs store function `store_eeprom_store` returns 0 when given=
 a false value, causing an infinite loop in userspace.
- [High] The driver unconditionally fails to probe if a channel node in the=
 Device Tree lacks the optional `label` property.
- [High] Incorrect logic when parsing the hardware powerdown mode desynchro=
nizes the software state from the hardware.
--

--- Patch [1]: [PATCH v3 1/3] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C=
 driver into two modules ---
commit 899388ec468a06591c301218099420c047b4404b
Author: Ariana Lazar <ariana.lazar@microchip.com>
Subject: iio: dac: mcp47feb02: refactor MCP47FEB02 I2C driver into two modu=
les

This commit prepares the driver for bus-specific code by refactoring the
MCP47FEB02 driver into separate files. It splits the driver into
mcp47feb02-core.c and mcp47feb02-i2c.c to support the upcoming SPI
implementation.

> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index 657c68e75542e..cc10d43ffd1e8 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -550,8 +550,13 @@ config MCP4728
>  	  will be called mcp4728.
> =20
>  config MCP47FEB02
> -	tristate "MCP47F(E/V)B01/02/04/08/11/12/14/18/21/22/24/28 DAC driver"
> +	tristate

[Severity: High]
Will removing the prompt from MCP47FEB02 break existing kernel configuratio=
ns?

When users upgrade their kernel and run make oldconfig, their previous
selection for this symbol will be discarded because it no longer has a prom=
pt,
and the new MCP47FEB02_I2C will default to n. This could silently remove the
DAC driver from existing configurations. The original symbol should probably
retain the prompt to preserve backward compatibility.

[ ... ]
> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02-co=
re.c
> similarity index 72%
> rename from drivers/iio/dac/mcp47feb02.c
> rename to drivers/iio/dac/mcp47feb02-core.c
[ ... ]
> @@ -471,6 +264,8 @@ static ssize_t store_eeprom_store(struct device *dev,=
 struct device_attribute *a
>  	if (!state)
>  		return 0;

[Severity: High]
This is a pre-existing issue, but does returning 0 here trap userspace in an
infinite loop?

When a sysfs store function returns 0, it signals to the VFS that 0 bytes w=
ere
consumed. This causes standard userspace tools like echo to continuously re=
try
the write in a tight loop, which could lead to a local CPU denial of servic=
e.

[Severity: High]
This is also a pre-existing issue, but does this function corrupt the DAC
hardware output state?=20

During driver probe in mcp47feb02_init_ctrl_regs(), the hardware DAC output
registers are not read into the driver's software cache, leaving=20
data->chdata[i].dac_data as 0. If a user writes to store_eeprom (or if the
system suspends), this function will unconditionally write this uninitializ=
ed 0
to both the EEPROM and volatile DAC registers, permanently overwriting
legitimate defaults.

> =20
> +	guard(mutex)(&data->lock);
> +
>  	/*
>  	 * Verify DAC Wiper and DAC Configuration are unlocked. If both are dis=
abled,
>  	 * writing to EEPROM is available.

[ ... ]
> @@ -577,18 +372,17 @@ static int mcp47feb02_resume(struct device *dev)
>  	guard(mutex)(&data->lock);
> =20
>  	for_each_set_bit(ch, &data->active_channels_mask, data->phys_channels) {
> -		u8 pd_mode;
>  		int ret;
> =20
>  		data->chdata[ch].powerdown =3D false;

[Severity: High]
This is a pre-existing issue, but does system resume clobber the user-confi=
gured
powerdown state?

By forcing powerdown to false here and writing normal operation mode to the
hardware, it seems to forcefully wake up all channels. This would silently
override the user's previously configured sysfs powerdown state for channels
that were meant to remain off.

> =20
>  		ret =3D regmap_write(data->regmap, REG_ADDR(ch), data->chdata[ch].dac_=
data);

[ ... ]
> @@ -1022,7 +816,7 @@ static int mcp47feb02_init_ctrl_regs(struct mcp47feb=
02_data *data)
>  		struct device *dev =3D regmap_get_device(data->regmap);
>  		unsigned int pd_tmp;
> =20
> -		data->chdata[i].ref_mode =3D (vref_ch >> (2 * i)) & MCP47FEB02_DAC_CTR=
L_MASK;
> +		data->chdata[i].ref_mode =3D (vref_ch >> (2 * i)) & MCP47FEB02_CMD_MAS=
K;
>  		data->chdata[i].use_2x_gain =3D (gain_ch >> i)  & MCP47FEB02_GAIN_BIT_=
MASK;

[Severity: High]
This is a pre-existing issue, but is the bitwise shift for use_2x_gain
evaluating the correct bits?

Earlier in this function, gain_ch is masked to clear the lower bits, but th=
is
evaluates it by shifting by i (0 to 7) instead of 8 + i. Since the LSB is
evaluated from the explicitly cleared lower byte, won't this cause use_2x_g=
ain
to always incorrectly initialize to 0 for all channels?

[ ... ]
> @@ -1066,7 +860,7 @@ static int mcp47feb02_init_ctrl_regs(struct mcp47feb=
02_data *data)
>  			break;
>  		}
> =20
> -		pd_tmp =3D (pd_ch >> (2 * i)) & MCP47FEB02_DAC_CTRL_MASK;
> +		pd_tmp =3D (pd_ch >> (2 * i)) & MCP47FEB02_CMD_MASK;
>  		data->chdata[i].powerdown_mode =3D pd_tmp ? (pd_tmp - 1) : pd_tmp;
>  		data->chdata[i].powerdown =3D !!(data->chdata[i].powerdown_mode);

[Severity: High]
This is a pre-existing issue, but does this boolean cast incorrectly assume
the device is not in powerdown?

When parsing the hardware state, if the DAC is in 1kOhm powerdown mode (whe=
re
pd_tmp is 1), powerdown_mode computes to 0. The driver then sets powerdown =
to
!!0, evaluating to false. Won't this incorrectly initialize the channel's s=
tate
as powered on when it is actually powered down?

>  	}

[ ... ]
> @@ -1091,10 +885,10 @@ static int mcp47feb02_init_ch_scales(struct mcp47f=
eb02_data *data, int vdd_uV,
>  	return 0;
>  }
> =20
> -static int mcp47feb02_probe(struct i2c_client *client)
> +int mcp47feb02_common_probe(const struct mcp47feb02_features *chip_featu=
res,
> +			    struct regmap *regmap)
>  {

[Severity: High]
This is a pre-existing issue, but does the driver unconditionally fail to p=
robe
if a channel node in the device tree lacks a label property?

In the probe call chain:

mcp47feb02_common_probe()
  mcp47feb02_parse_fw()
    fwnode_property_read_string(child, "label", ...)

The driver queries the label property and aborts probe if it is missing. Si=
nce
label is canonically an optional property in IIO device tree bindings, enfo=
rcing
its presence breaks compatibility and prevents the driver from loading on v=
alid
device trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mcp47feb02=
_refactor-v3-0-97f8b81f3628@microchip.com?part=3D1
