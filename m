Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A6164
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778340598; cv=none; b=GYDOXcIPbeJyY6rwVt4T8wDbRtc3vnaUXsiliYGyel7tlqiUFnu+qMtsEoyAk0ldO/FjhFTqeEsn7JIccbg6/RzyUP5iRwUJaGPRKnKjk4rU6qrNodsh9WOBWZVGmYe4c0RGwmYji+WNBEY0AalA0LPSGLCsPIis7Sepc9q4lcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778340598; c=relaxed/simple;
	bh=WmUY3orrQ/txbjI3bNtc48MLJZCbgUrI0banyWw+Zgk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=URi6a4zpTelLeQD9JIAzHfXDibdXjuVcy0wXyjRMcXf0JllCIaINhriA8Zj1JoGPy4J2nSbA2BwLW3jVMvzZ+mAdc58GJmQeYGGB9gGWj1qIDazxYgLux8FCPp0kuh8Zf+23k3FZ9x5SXVWEeHh4HcIMBlAfhcOC3MdgAu6i81E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kS8PR1MQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kS8PR1MQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18149C2BCB2;
	Sat,  9 May 2026 15:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778340598;
	bh=WmUY3orrQ/txbjI3bNtc48MLJZCbgUrI0banyWw+Zgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kS8PR1MQd+YEU9/f39N2zpR+LBZqYM06JaoV9+49VetD7LgPZlV/zEwliHlbr/gk0
	 uh91v/Uh/qfjj4ChdEiUjtO0x0TXz3vP+JDLXApS1V6CFv57lW5fc4KZQZP/+pdpo9
	 dv9/+h/HNK2oY2tdWMFllRdQyN59ooEq9FdwcOZNjC9Ojs6bl+n0Zkq3o5FhiU2tW6
	 UMZznL/vOPbdY6IGUCfBFxiVYjPv6CKJtPv8wECXFW8bVxCAzNHCH1SkTRaEXbauJ9
	 ZtYcOnTaoalcbTu72heWI2xjWLZCVUB+AOcp7Vo8fJikboZupXJ/urhQmmXEop4aBe
	 3S7gLr6q5pd7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] iio: dac: ad5504: fix scale via
 output-range-microvolt
Reply-To: sashiko@lists.linux.dev
To: "Taha Ed-Dafili" <0rayn.dev@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260509142047.30302-6-0rayn.dev@gmail.com>
References: <20260509142047.30302-6-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 15:29:57 +0000
Message-Id: <20260509152958.18149C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] UAPI/ABI Breakage: existing Device Trees rely on the 'vcc' regul=
ator to configure the IIO scale, but the driver now silently defaults to 60=
V.
- [Medium] Silent error suppression for malformed 'output-range-microvolt' =
device tree properties.
- [Low] Incomplete removal of legacy platform data header.
--

commit b02770a220cb671b4745934fb6d03abfd8d88fd3
Author: Taha Ed-Dafili <0rayn.dev@gmail.com>

iio: dac: ad5504: fix scale via output-range-microvolt

This patch updates the AD5504 driver to read the output-range-microvolt DT
property for setting the scale, rather than querying the vcc regulator. It
also removes legacy pdata support and sets the default scale to 60V if the
property is absent.

> diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
> index 9e95da6e49d61..040f580b82828 100644
> --- a/drivers/iio/dac/ad5504.c
> +++ b/drivers/iio/dac/ad5504.c
> @@ -14,10 +14,12 @@
>  #include <linux/kstrtox.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
> =20
>  #include <linux/iio/dac/ad5504.h>

The commit message states legacy pdata support is removed. Is it intentional
to leave the #include <linux/iio/dac/ad5504.h> header in place, as it appea=
rs
to only contain the unused legacy structs?

[ ... ]

> @@ -285,16 +287,19 @@ static int ad5504_probe(struct spi_device *spi)
> =20
>  	st =3D iio_priv(indio_dev);
> =20
> -	ret =3D devm_regulator_get_enable_read_voltage(dev, "vcc");
> -	if (ret < 0 && ret !=3D -ENODEV)
> +	ret =3D devm_regulator_get_enable(dev, "vcc");
> +	if (ret && ret !=3D -ENODEV)
>  		return ret;
> -	if (ret =3D=3D -ENODEV) {
> -		if (pdata->vref_mv)
> -			st->vref_mv =3D pdata->vref_mv;
> -		else
> -			dev_warn(dev, "reference voltage unspecified\n");
> -	} else {
> -		st->vref_mv =3D ret / 1000;
> +
> +	st->vref_mv =3D 60 * MILLI;

Does dropping the regulator voltage read cause compatibility issues with
existing device trees?

Prior to this patch, existing setups could provide a vcc regulator with a
30V voltage, which would properly configure st->vref_mv. By defaulting
directly to 60V when the new output-range-microvolt property is absent, old=
er
device trees might silently change their exposed scale attribute to userspa=
ce.

Would it be safer to fallback to reading the regulator voltage and issue a
deprecation warning if the new property is missing?

> +	ret =3D device_property_read_u32_array(dev, "output-range-microvolt",
> +					     range, ARRAY_SIZE(range));
> +	if (!ret) {
> +		if (range[0] !=3D 0 || (range[1] !=3D 30 * MICRO && range[1] !=3D 60 *=
 MICRO))
> +			return -EINVAL;
> +
> +		if (range[1] =3D=3D 30 * MICRO)
> +			st->vref_mv =3D 30 * MILLI;
>  	}

If the device tree property exists but is malformed, such as only containing
a single value instead of an array, device_property_read_u32_array() might
return an error code like -EOVERFLOW or -ENODATA.

Since the code only checks if (!ret), does this silently suppress parsing
errors and assume the 60V default?

Should this explicitly check for ret && ret !=3D -EINVAL and return the err=
or
code instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509142047.3030=
2-1-0rayn.dev@gmail.com?part=3D5
