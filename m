Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1DA473C8D
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555865; cv=none; b=FQODmuhdpbqCHIvvf+xSIJ4aK8KrMk9czfm9mbn6X3Ns6rvc1cPge+lAfSjC48tRsjhFkEnpda4QaYX8F6+kDui8OuMubGe6NiKybRXYDH1YySvZMrR7NFertCjUDospw+6bkGhF8BSux/X9leIV3BZqnsO5DejvlpAQenRKXJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555865; c=relaxed/simple;
	bh=CMkVxPtoZXJPT0BjJvqQZtRYtyGzgZVg0dViro18avI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=H4OshzvnQizoSi+MU5RXrNN8+IwSrhtvjqzfiSODo6XLBia5NtvAzKgH1r6Jv9252XEhh8dKvi1ASWBBE3xOxok35LSjjnVsTMpGddUDJhV3+irMG3snBS9SfHYfvxHEg/A29WhD4O7bzaN+JUzgqequhuBQbWUNZLY8DnIiBk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiHm6Nvq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiHm6Nvq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EB21F00893;
	Fri,  9 Oct 2026 14:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791555863;
	bh=WzbV4J9ddWMWrctg58GGdIOgrYCZhidfP0uP919KxFE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RiHm6Nvq2VR9rCV2eAC9N/7fU5GUZqMs6Or85uTWlYBByp6ju+b48bTUej2PAM0gw
	 a4EGiawFTUdvlcBg1nN2t1fqUwHNxD2ws1+km4103ibvHUcG+PDD5DrHASaSDTnNIS
	 rnCaPJNb4LkioKdV+yxbKbYv0foFhagw0wZRfBrHMLLH67Biif1UtNTyhjgsawWsRr
	 y1fHyyokGp8W5/B32xtEvql4TKCejYGKEbUrm0L+44k//j1hn16zfnc3stbwVmmPT+
	 nnMiVb8fkFHhSVv5nT3AnpSz9UCiHJbWj+gHkPoFYBEsmzzu+jaEyJX0S8wCd7EfH5
	 exOQza3I3wXzA==
Message-ID: <sashiko-outbox-165704@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] iio: imu: inv_icm42607: Initialize gyro based on
 chip_info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-b4-inv_icm42370p-v6-3-e53884f185ff@axis.com>
References: <20261009-b4-inv_icm42370p-v6-0-e53884f185ff@axis.com>
 <20261009-b4-inv_icm42370p-v6-3-e53884f185ff@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 14:24:23 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: imu: inv_icm42607: missing get_pwr_mgmt0() abstraction in t=
emp_read()
--

commit 5fda28961eccacb1192dc6807416c716d0058712
Author: Kanak Shilledar <kanak.shilledar@axis.com>

iio: imu: inv_icm42607: Initialize gyro based on chip_info

This commit updates the chip_info struct with a has_gyro property to
support devices without gyroscope functionality, specifically as a
precursor for the Invensense ICM-42370-P. It updates various operations
to check this boolean before configuring or accessing gyroscope features.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 190e998f7b8ef..46274ecfa7b94 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -160,7 +162,11 @@ int inv_icm42607_get_pwr_mgmt0(struct inv_icm42607_s=
tate *st,
>  	if (ret)
>  		return ret;
> =20
> -	*gyro =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);
> +	if (st->hw->has_gyro)
> +		*gyro =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);
> +	else
> +		*gyro =3D INV_ICM42607_SENSOR_MODE_OFF;
> +
>  	*accel =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, val);
> =20
>  	return 0;

[Severity: Medium]
Does inv_icm42607_temp_read() also need to use this updated wrapper instead
of directly reading the register?

Currently, inv_icm42607_temp_read() in
drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c bypasses
inv_icm42607_get_pwr_mgmt0() and directly reads the register:

    ret =3D regmap_read(st->map, INV_ICM42607_REG_PWR_MGMT0, &val);
    if (ret)
        return ret;

    accel_mode =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, val);
    gyro_mode =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);
    if (!gyro_mode && !accel_mode) {
        /* enable accel sensor */
        ...
    }

If the reserved gyroscope bits on the new accel-only hardware (ICM-42370-P)
return non-zero values, the condition !gyro_mode && !accel_mode will
incorrectly evaluate to false.

This would cause the driver to skip enabling the accelerometer when reading
the temperature, which could lead to invalid reads or timeouts from
powered-off sensors on gyro-less devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-b4-inv_icm=
42370p-v6-0-e53884f185ff@axis.com?part=3D3
