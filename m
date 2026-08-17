Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D693AE1AD
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001702; cv=none; b=CsRv+u7ttjfncCsoM7Em8MlsuBjHyKVTooj0eo0LKJELpyZIo8sX0MklSEIBtklJNdhMEwfbykBzlag6vVB1vqiSNLeJ7D5UaKmrkHFbeauoWb5W7GDq0m5yqQhahPpzvCjfod67YHW78+OKFTwcJ0s5EY+cM2GpY0+uRG1jpY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001702; c=relaxed/simple;
	bh=3LUHVUxAekjVxZNAzPiyW72T1r2LpF0c1WM7qQEp4wI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EmCdsYkPtQ+Pu6iealzytbothlYvufKCs/zJMEnWKtx5xKbXHGRVhYU98YAn43rGtxu/ODHixmE+amHUuvCm6g5r1ATXau8+CHsJEmBN+1LL5e3sgnGoCwiUkTKO52BVVqLIXYcYZtjDnX7rwCH/z7Mu1K+fkPPsOMDoIFAJvZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HszOQFkc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HszOQFkc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C84B1F000E9;
	Mon, 17 Aug 2026 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787001700;
	bh=Cqh2YXDhH4wjTYQeKEBx5ZxdEHov9y/KbpIEbDaabDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HszOQFkcXZJ3gx7ceH0X9aMYLEo1qTM0CLbI5YwssKPVjEdVD17ukJRSurMFZs+pP
	 PkYq+oBsMJCCyzDm0AxVpMcgY9PiZpoE8uaf8tTzSKLuLp3wR3LtLrkcEqVcOvcnje
	 BdrxCa5YjygCnPbtV9wxDq7nL4vhLA4VfXZQz0puNaiFmh1UN1dXyBGpdhFwGwzAX2
	 hSzdw/UQUywdb4ToL6500VfU6z6Clf5U3ZK9bAtwGwc7wVqmcWp8aW0G8sp+yvvG/d
	 YNgWDIOSvGQqFAHPwg2N+ONdvU1VGXYsmGVFOYV9u4+xunXPWm5W7aW42Oc0a+F9LZ
	 LeRtY0uPF3DKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] iio: dac: ad5504: strictly separate ACPI and DT
 probe paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taha Ed-Dafili" <0rayn.dev@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817211118.21833-6-0rayn.dev@gmail.com>
References: <20260817211118.21833-1-0rayn.dev@gmail.com>
 <20260817211118.21833-6-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 21:21:39 +0000
Message-Id: <20260817212140.7C84B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Bypassing the regulator framework on ACPI platforms breaks PRP00=
01-based configurations.
- [Low] Missing inclusion of `<linux/acpi.h>` for `ACPI_COMPANION`.
--

--- Patch [5]: [PATCH v4 5/6] iio: dac: ad5504: strictly separate ACPI and =
DT probe paths ---
commit 6ac93c8870295bc478f5b446654ca1771bdebc78
Author: Taha Ed-Dafili <0rayn.dev@gmail.com>

iio: dac: ad5504: strictly separate ACPI and DT probe paths

Refactor the ad5504_probe() function to explicitly separate the ACPI
and Device Tree execution paths.

> diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
> index 7b52ec95150de..e124e7804f3fb 100644
> --- a/drivers/iio/dac/ad5504.c
> +++ b/drivers/iio/dac/ad5504.c
> @@ -19,6 +19,7 @@
>  #include <linux/spi/spi.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> +#include <linux/units.h>

[Severity: Low]
This isn't a bug, but should <linux/acpi.h> be explicitly included here to
satisfy the 'Include What You Use' (IWYU) principle for the ACPI_COMPANION
macro used below? Building under configurations where it is not transitively
included could lead to a build failure.

>  #include <linux/iio/events.h>
>  #include <linux/iio/iio.h>

[ ... ]

> @@ -300,11 +305,16 @@ static int ad5504_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D devm_regulator_get_enable_read_voltage(dev, "vcc");
> -	if (ret < 0)
> -		return ret;
> +	if (ACPI_COMPANION(dev)) {

[Severity: Medium]
Does bypassing the regulator framework on ACPI platforms break PRP0001-based
configurations?

On ACPI systems that use standard PRP0001 (Device Tree bindings wrapped in
ACPI) to provide a vcc regulator, this unconditional branch skips enabling
the regulator and reading its voltage. The device might remain unpowered or
use an incorrect hardcoded reference voltage.

Before this patch, ad5504_probe() attempted to fetch the regulator and fell
back to defaults only if it returned -ENODEV. Should the regulator fetch
be preserved for ACPI platforms to avoid defeating the unified device
property frameworks?

> +		st->vref_mv =3D AD5504_VA_MV_ACPI_DEFAULT;
> +	} else {
> +		ret =3D devm_regulator_get_enable_read_voltage(dev, "vcc");
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to get vcc regulator\n");
> =20
> -	st->vref_mv =3D ret / 1000;
> +		st->vref_mv =3D ret / MILLI;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817211118.2183=
3-1-0rayn.dev@gmail.com?part=3D5
