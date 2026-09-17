Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE67552922
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653007; cv=none; b=PKctVHWK4FGO8CzJrjgseVDQGXyHuqp5SFwKWJZzuTGNkkW4IPvbAxH5RDjqJPB+mQXshfJdhEEA2ZCsfg533W1NKZDrC86UPKwxTVAY0lyEnh0HIYoZuqD3xjltw8K0wIeG27tbnNAsYe4of57LULjvlbSZJJdCb2AMt6kUWmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653007; c=relaxed/simple;
	bh=1l1Q/iYflwnTSDz+t49vtDhZpNphqyZdsX8HptSg3N4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J17sWHfyjUHTq7iDngcsisswV08Bh5TMXgUyuFw5EwYrHonMjuw/X+B7iQ4S6SoCPAN+mXjibdYph33Vyh0oWlMTS2VxDoI0wWu18K8kLELmPY30X4lcVihdmTRqKYHRQkDr73ersIap7Sr1Y/bGpcG3fMjIqGWslMTP5Y0xeok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKnWidHS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKnWidHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273611F00899;
	Thu, 17 Sep 2026 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789652997;
	bh=Y7R3BUZsHe9IML3JgcGW5qceuSGxgyFUURI3JqxTylI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dKnWidHSdmqCU38pHz2ouuGvoI9hdKjqJvG3/owesbGPrwWKc3g8Im/RKKomIEoPz
	 sI7G8sFPuQR57Db+E30KqXr9OKEVUZz+L1j1CPQ+X/bJ2aelyq+02/hI9UJH8arRXw
	 Yz3FohARt7gs0CzOpIs+OwweIU1Z3sSzrSxFQmlSHiHcMcF8FWzdRJCrxeO9Hy18c8
	 Z8T2+pbW/H6KIjzp69OKmim/R6C0lu/F6u50Oz6ev+5TFRVR5SMlQKkd2qsCyt4rIS
	 +tsQwzF0YO0peiWU3lhXKaCNFmPVKXhMwaKFZYeMDm1jPx0G12NHloLCxXj9ZzGCiq
	 IFi073ncUtYrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] iio: imu: inv_icm42607: Add support for
 ICM-42370-P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917-b4-inv_icm42370p-v4-3-fd9373f123c9@axis.com>
References: <20260917-b4-inv_icm42370p-v4-0-fd9373f123c9@axis.com>
 <20260917-b4-inv_icm42370p-v4-3-fd9373f123c9@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:49:56 +0000
Message-Id: <20260917134957.273611F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: inv_icm42607: writing reserved values to gyro registers on =
accel-only device
--

commit cafef20bbc68d8f84bfd67491344163a59e13b31
Author: Kanak Shilledar <kanak.shilledar@axis.com>

iio: imu: inv_icm42607: Add support for ICM-42370-P

Add support for the Invensense ICM-42370-P MEMS MotionTracking 3-axis
accelerometer with built-in temperature sensor. This device is almost
identical to the existing Invensense ICM-42607-P IMU, but lacks
gyroscope.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 190e998f7b8ef..114e7afcda391 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> @@ -92,10 +92,27 @@ static const struct inv_icm42607_conf inv_icm42607_de=
fault_conf =3D {
>  	},
>  };
> =20
> +static const struct inv_icm42607_conf inv_icm42370_default_conf =3D {
> +	.accel =3D {
> +		.mode =3D INV_ICM42607_SENSOR_MODE_OFF,
> +		.fs =3D INV_ICM42607_ACCEL_FS_4G,
> +		.odr =3D INV_ICM42607_ODR_100HZ,
> +		.filter =3D INV_ICM42607_FILTER_BW_25HZ,
> +	},
> +};

[Severity: Medium]
Does this uninitialized gyro configuration write reserved values to the dev=
ice?

Because the gyro field is not initialized, its subfields default to 0.

During probe, inv_icm42607_setup() calls inv_icm42607_set_init_conf(),
which unconditionally writes the gyro configuration without checking
st->hw->has_gyro:

drivers/iio/imu/inv_icm42607/inv_icm42607_core.c:inv_icm42607_set_init_conf=
() {
    ...
    val =3D FIELD_PREP(INV_ICM42607_GYRO_CONFIG0_FS_SEL_MASK, conf->gyro.fs=
);
    val |=3D FIELD_PREP(INV_ICM42607_GYRO_CONFIG0_ODR_MASK, conf->gyro.odr);
    ret =3D regmap_write(st->map, INV_ICM42607_REG_GYRO_CONFIG0, val);
    ...
}

Writing 0 to the ODR field (which is reserved for values 0-4) could cause
hardware faults or undefined behavior.

Could we add a has_gyro check in inv_icm42607_set_init_conf() or initialize
the gyro field properly to avoid this regression?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-b4-inv_icm=
42370p-v4-0-fd9373f123c9@axis.com?part=3D3
