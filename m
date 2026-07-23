Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0CF284880
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784815262; cv=none; b=f+kT4ZTbLRFuIob8Bc55hAsvTomfVAkYdPIRfrLGVarVpGcGU7tDcz7mrsDtD2yPEjrx2o7UqdgDeTdSX+gFCAzT6n2M99krS/ppHkp3vr7dFOtyJszStXZzJzd4GnXUKcoMoBphfpY6tPJJRClbxKVRchoGIp9r49Ad7VWLXKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784815262; c=relaxed/simple;
	bh=lIo5SChBFEfv7AtF0EE1/txn2JNtU2YitvCwJumT3UE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GQ+81uQ/1RFmJL2kLj9QNB2m3v8rF0ZFKJJGv40AsPVMYh/EFnZ+ssyd+nsr0uuZS65XPaBxEmo7+ZqZr3u1MVPpoJONict0oxVKT918627YiGskR0Cm95QlyYCQxNQ3z80fY9EU0PU/isfVUaYEdMJsoUZZqWDu/cEfQBaSp/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAC7PAXB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAC7PAXB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2788D1F000E9;
	Thu, 23 Jul 2026 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784815261;
	bh=BUlh2FDNLX7Ucu8luLrHKlhGqNLqy8G44RR5/4FsWNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VAC7PAXBj4ULA9xIIXJZFsZcXwMb3GovGygYv5RUB71pBXcHPbKf6YTMKWQdCYqSB
	 3jPyC1SZlHrAEm6/1aE7a2ZwKhKK5qN5upDGseoiD3zBholavFEUXfw4FzsIw6qkq3
	 MKzb1ppEdWNEdynkrQLcM/QxIf8af7d1vNkpJLHcm6j4fQB1KulGTvi2uLQGMNwofA
	 22aJ0S4BFRKPW/IeJv1jH3khQa1bDapZ8Lxzsds5MYpxi4G5QFKOpHks56ajkFKy1p
	 ykMXnfiUUUsZIAyhXeJ9DsX8ImX/D+xjsyfSUYzv3gE2eXEDpQlNnT7KLaaqK9uDiq
	 fXIeSckLMTKww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C
 driver into two modules
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-mcp47feb02_refactor-v1-1-ee59e63672bc@microchip.com>
References: <20260723-mcp47feb02_refactor-v1-0-ee59e63672bc@microchip.com>
 <20260723-mcp47feb02_refactor-v1-1-ee59e63672bc@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 14:01:00 +0000
Message-Id: <20260723140101.2788D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] I2C Subsystem Guideline Violation: Positional Initializers

Pre-existing issues:
- [High] NULL Pointer Dereference in power management callbacks due to miss=
ing driver data
- [High] Hardware register corruption in `mcp47feb02_resume` due to a copy-=
paste error updating VREF
- [High] Resume path unconditionally overrides user's manual power-down con=
figuration
--

--- Patch [1]: [PATCH 1/3] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C dr=
iver into two modules ---
commit bb66896c21fa2d6229e950c6190b3d83baedb5ad
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: refactor MCP47FEB02 I2C driver into two modules

This commit refactors the MCP47FEB02 driver into a core module and an
I2C-specific module to prepare for future SPI support. It separates the
bus-specific code from the common DAC functionality.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02-co=
re.c
> similarity index 64%
> rename from drivers/iio/dac/mcp47feb02.c
> rename to drivers/iio/dac/mcp47feb02-core.c
> index a823c2a673a26..6c86fa40e6eb2 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02-core.c

[ ... ]

> @@ -666,7 +357,7 @@ static ssize_t mcp47feb02_write_powerdown(struct iio_=
dev *indio_dev, uintptr_t p
>  	return len;
>  }
> =20
> -static DEFINE_SIMPLE_DEV_PM_OPS(mcp47feb02_pm_ops, mcp47feb02_suspend, m=
cp47feb02_resume);
> +EXPORT_SIMPLE_DEV_PM_OPS(mcp47feb02_pm_ops, mcp47feb02_suspend, mcp47feb=
02_resume);

[Severity: High]
This is a pre-existing issue, but does mcp47feb02_resume() write pd_mode
to the VREF register instead of the expected reference mode?

Looking at mcp47feb02_resume() in the core module:

    ret =3D regmap_update_bits(data->regmap, MCP47FEB02_VREF_REG_ADDR,
                             DAC_CTRL_MASK(ch), DAC_CTRL_VAL(ch, pd_mode));

This writes the power-down mode to the voltage reference register, leading
to incorrect analog output voltages upon system resume.

[Severity: High]
This isn't a bug introduced by this patch, but does mcp47feb02_resume()
also unconditionally clear the powerdown state and force normal operation?

Looking at mcp47feb02_resume() in the core module:

    data->chdata[ch].powerdown =3D false;

This completely wipes out any explicit channel power-down state previously
configured by the user via sysfs.

[ ... ]

> @@ -1175,75 +857,7 @@ static int mcp47feb02_probe(struct i2c_client *clie=
nt)
> =20
>  	return devm_iio_device_register(dev, indio_dev);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does mcp47feb02_common_probe=
()
miss a call to dev_set_drvdata() before returning?

Without setting the driver data, dev_get_drvdata(dev) in
mcp47feb02_suspend() and mcp47feb02_resume() returns NULL:

    struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
    struct mcp47feb02_data *data =3D iio_priv(indio_dev);

This causes a NULL pointer dereference when passed to iio_priv() during
system power state transitions.

> diff --git a/drivers/iio/dac/mcp47feb02-i2c.c b/drivers/iio/dac/mcp47feb0=
2-i2c.c
> new file mode 100644
> index 0000000000000..808c51d0afdf5
> --- /dev/null
> +++ b/drivers/iio/dac/mcp47feb02-i2c.c

[ ... ]

> +static const struct i2c_device_id mcp47feb02_i2c_id[] =3D {
> +	{ "mcp47feb01", (kernel_ulong_t)&mcp47feb01_chip_features },
> +	{ "mcp47feb02", (kernel_ulong_t)&mcp47feb02_chip_features },

[Severity: Low]
Does this array need to use named initializers to align with I2C subsystem
guidelines?

The refactored mcp47feb02_i2c_id array uses positional initializers,
dropping the named initializers present in the original code.

> +	{ "mcp47feb04", (kernel_ulong_t)&mcp47feb04_chip_features },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mcp47feb02=
_refactor-v1-0-ee59e63672bc@microchip.com?part=3D1
