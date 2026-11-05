Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895825;
	b=GvSpG8s7ydqPFNSpeV7Wa/IUKB/ayFKA10+Clm3HEfi8q2LEPOHoTNxFgFJt7YsF6Ok3
	 3/7teZ77y1DXfLPcyxQwDgSRw6fhSbgZ03DiME04uL3kP0m+ICMF3dtvVKbyE5B32WPUi
	 rJYSYNubR8YbPH9wES9yydcOjEgN4zveIf/IIZzDHoX5mrzzn90V8vZxQ9av+ifttF1g6
	 sP5JKOqBL7rux2UQiJD26aypVBYwegkSLl7IJtrKs/SA/E8YQqVu54u6b7b/BmMU+pxso
	 CqRC/8NE7ogaHTBCm18oO2/C1EAgEIqtl4h2P+Iqr2lzpYlIs8DwZMeIm0gbRaM+HaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895825;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K1e2dOjqRBfUKuAGafPvzfKLxQYNFmTRPRHpViH+AXc=;
	b=hhewfaucJ+qg+wCrwLcDNEvNSBR0xh16vG3gD5e/bHXwoyxy7oK09b/LEnKMGoXDKE4n
	 fdnBQJujMZAdlbxESfNDxidZmt3y9N28eIQTDG9Ch2vb/umdE9KHJyq6RLGHtXZG3Dhxe
	 N4l180nah5aXCb7D6WPG3/+O9oGFORMW0/fyoXK/TXsl5GW1tO7sVBK3K5rQ57kQ87XMf
	 p9cIQXJX9X/q4NXjarEaSO4v3fBrffLNZ3tEH4PpHBFcjN6mtpX5Mhx6f7SRUo4J6x00/
	 oCu94xCBFQ6leoczlMytjcJUqSFSW+vscPUy1TOdIPkcuqEDJtGXG8BWk2fsFa8EFOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8tYPuGT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6DC606A32C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8tYPuGT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1362B1F000C1;
	Thu,  5 Nov 2026 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895825;
	bh=K1e2dOjqRBfUKuAGafPvzfKLxQYNFmTRPRHpViH+AXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8tYPuGTQeD+ElOraCAehxXbv/kpnSrkY3WEq12r8APH+NgS5mlftI1eQUKg1GvUE
	 m4dMHpqcSoAMNnysZtMUntbsPX/NDAIH1BuCgQ5D4XNK6kX2XqvVhwSGVqWW9ciY5S
	 7blZc88H7Am6zUgpmmrFP0rpbU1vPb4daDaj4+dyEAclS2ME6Nrhxj1ufhf7xVaDYB
	 aWXm59/qfaBJBQo6dCw8EHQTRQkHtDXv/8UXWC2YGLc5zIUrBltcZLc8fRy2MUkNUb
	 Fan16fEHtBPURSJpcMyXULe5BrQNIu/9g8IfSFb5vyi1yRopNe6tGIKJTW4E7Bde4q
	 p9PQQMItc0CPA==
Message-ID: <sashiko-outbox-199478@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/7] iio: imu: inv_icm42607: Initialize gyro based on
 chip_info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-b4-inv_icm42370p-v8-4-b44eb96020b6@axis.com>
References: <20261105-b4-inv_icm42370p-v8-0-b44eb96020b6@axis.com>
 <20261105-b4-inv_icm42370p-v8-4-b44eb96020b6@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:23:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: imu: inv_icm42607: missing has_gyro check in inv_icm42607_t=
emp_read()
--

commit bf4e9cd0c7e66bdca94f78eae37c6d71ba866c11
Author: Kanak Shilledar <kanak.shilledar@axis.com>

iio: imu: inv_icm42607: Initialize gyro based on chip_info

This commit adds a has_gyro boolean to struct inv_icm42607_hw to guard
gyroscope register accesses and initialization on accelerometer-only device=
s.
It also replaces implicit sensor mode boolean checks with explicit comparis=
ons
against INV_ICM42607_SENSOR_MODE_OFF.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index f4ef75da22c76..84a7a7718dc2e 100644
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
Should inv_icm42607_temp_read() in drivers/iio/imu/inv_icm42607/inv_icm4260=
7_temp.c
also use inv_icm42607_get_pwr_mgmt0() and explicit comparisons against
INV_ICM42607_SENSOR_MODE_OFF?

Currently, inv_icm42607_temp_read() open-codes reading INV_ICM42607_REG_PWR=
_MGMT0
and unconditionally extracts INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK without
checking st->hw->has_gyro:

drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c:inv_icm42607_temp_read() {
	...
	ret =3D regmap_read(st->map, INV_ICM42607_REG_PWR_MGMT0, &val);
	if (ret)
		return ret;

	accel_mode =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, val);
	gyro_mode =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);
	if (!gyro_mode && !accel_mode) {
		/* enable accel sensor */
		conf.mode =3D INV_ICM42607_SENSOR_MODE_LOW_NOISE;
		ret =3D inv_icm42607_set_sensor_conf(st, &conf, IIO_ACCEL);
		if (ret)
			return ret;
	}
	...
}

When reading the temperature channel via inv_icm42607_accel_read_raw() ->
inv_icm42607_temp_read_raw() -> inv_icm42607_temp_read() on an
accelerometer-only device where st->hw->has_gyro is false, if the reserved
gyro mode bits in INV_ICM42607_REG_PWR_MGMT0 read as non-zero while the
accelerometer is off, inv_icm42607_temp_read() would skip enabling the
accelerometer and fail with -EINVAL when INV_ICM42607_REG_TEMP_DATA1 returns
INV_ICM42607_DATA_INVALID.

Could inv_icm42607_temp_read() call inv_icm42607_get_pwr_mgmt0() instead of
open-coding the register read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-b4-inv_icm=
42370p-v8-0-b44eb96020b6@axis.com?part=3D4
