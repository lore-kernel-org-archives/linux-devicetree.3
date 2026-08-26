Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5FF47044E
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767415; cv=none; b=mmM/ckwvEvVud1CUmtwUblowglKXSkSIKFbddr3owLZa7bPLYQcQBAi3GavlMq95Z/DVDfzfinwd1DmuZ3vAZ5G5hghiHY8lfgaWqP/3bxODX9Ut1fFsTAqIPnxLc1wMrRjRJV4R3I/ooASpmjAa4i/U7hrVIbSc3obCA9RWFTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767415; c=relaxed/simple;
	bh=T8zF5ReS4Nc97xzJ4cwOfDbPuJjwpThugL8tWX/L2go=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H1Sh3g7znQ7RnJH9tJ8dwJNsnJf6MlwdhPjR/hwPS8loLzYUAY9RNZpA33w4P9XVm2/sBOM5A23Awbe4dFyuKS8i5nzb+OzXXxC3n8t00R20qABcaRMf9ISG1mjx4OEYvLHNeSlpuDpL8pzY32c75uXMKkYJNXE3yMNpebLs+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlV6Li1T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlV6Li1T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8D31F000E9;
	Wed, 26 Aug 2026 18:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787767406;
	bh=g2uYWV0xM1fJMVUs21MNuiVCC5QWAjTDN28vMODtzjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VlV6Li1TSb0ZXkow1osWifvYept0vuHjyJU7BayiOxhJfeZhSc3A2nfOHLmi4T0b0
	 Be8rCCp9iEh7mJaCgA4EZBwebUHSa6ObrGC4X+TFfGPaf6VDXc8zChDYA7qiSEWFfu
	 A7SIBOh22Z2RsvYIlFV+PGfWMRk/Ergq8Mckohez76qvDl4RR1vLu4tyxeKSC/qvyp
	 Epw/O6gLkY1peDTBEt9HduQFf0U//cs4nmW+QkWpbHx/2E7Pg2edpdFw/WuyDj/f0K
	 RRyq9SgK0qdRx8NX+pUKLNESLegK3NgY0yAv3vUFHxSsV/gqLFFF48B+Je7mkRrkZD
	 Ax6EdwJdLE3Mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] iio: light: stk3310: lower-case the i2c device
 ID names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260826175409.326131-2-jorijnvdgraaf@catcrafts.net>
References: <20260826175409.326131-1-jorijnvdgraaf@catcrafts.net>
 <20260826175409.326131-2-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 18:03:26 +0000
Message-Id: <20260826180326.AC8D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing the upper-case I2C device IDs breaks backwards compatib=
ility for devices instantiated from userspace via sysfs.
--

commit 7889e08011ff4fb9c503926c95b3280c1405b42a
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

iio: light: stk3310: lower-case the i2c device ID names

This commit replaces the upper-case I2C device IDs with lower-case versions
to match conventional devicetree compatible suffixes. This allows clients
without a firmware node to correctly match the driver, but it prevents sysfs
clients instantiated under the previous capital names from binding.

> diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
> --- a/drivers/iio/light/stk3310.c
> +++ b/drivers/iio/light/stk3310.c
> @@ -766,10 +766,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(stk3310_pm_ops, stk=
3310_suspend,
>  				stk3310_resume);
> =20
>  static const struct i2c_device_id stk3310_i2c_id[] =3D {
> -	{ .name =3D "STK3013" },
> -	{ .name =3D "STK3310" },
> -	{ .name =3D "STK3311" },
> -	{ .name =3D "STK3335" },

[Severity: Medium]
Does removing the upper-case I2C device IDs break backwards compatibility f=
or
devices instantiated from userspace via sysfs?

Userspace scripts that previously instantiated the device using a command
like "echo STK3310 0x48 > new_device" will fail to bind to the driver, as
the device name will no longer match the I2C device ID table.

Should the upper-case IDs be retained alongside the new lower-case IDs to
preserve ABI backwards compatibility?

> +	{ .name =3D "stk3013" },
> +	{ .name =3D "stk3310" },
> +	{ .name =3D "stk3311" },
> +	{ .name =3D "stk3335" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, stk3310_i2c_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826175409.3261=
31-1-jorijnvdgraaf@catcrafts.net?part=3D1
