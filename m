Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70EA3FADE5
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491375; cv=none; b=B22ORzJR25/ZmV/7qqlBSRzaONri/QwJozMRHsB66oR2IFO5Pl1W1ZhkAsg//4Y6JOGG6wK9igABwH6VTKscVS5ej9snjVqVC6b04kF5St7tAhRv6Uj2YRnyUSqrq4rUgUTmVwebybs440hGFGrmIlkebq/bigQmwntDh2zft1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491375; c=relaxed/simple;
	bh=AaJ5Ow4NVBOcsMgNUEPUqkPBaFN8aWuX99r3PRAHNf4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CUyroIBhQr1X9D3G7SnHGohdmsolHkAdNN50/It2q4yVM46/KxG07rY3qTE+Mw9QgNfZ6FVtsR8be4H8lS2uxBl+KIsoGCBbS+eLsC5xkAYC1L2It+v+YwijQ++uSNcJCq+g/IDjggPsH4Ro8TjXrQloKRn179y/zQ+EGigbzzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=op+7qKnI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="op+7qKnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAD71F00AC4;
	Fri, 26 Jun 2026 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782491374;
	bh=PppnD/+JO8a5dlNXSHWAPl6EdO59wXpp4gR/xt1Dekk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=op+7qKnICjc70ptFS7+tm8UsLAMQKEbc5COUeuOBUikRCcl1EeB9+44HSlCSHHYj1
	 SkXgeqC+O4USm+wRwqW3Lu/5XwbHpmIHLIWbsVv41BIJJIpUW+vURgm4hgUiraa0Ji
	 lGea9DRCfSxPsxDGz2mAASkoMO+RY+BY+99NOhPv5I0hjIzwvnzDy93UjH4UwHgzF5
	 IXITY9NWOlDAYFUTZjpt10l4Ib1G3iI7wXT1aWXDt5baaPeT46GmeP8yiIrxJEdo7X
	 3aGzJ475tnKWwiJr3K2F6WbICEITkJYJV31Hrn+KJZoiFofCBASPYRQ2UsU63qhJGo
	 1sr925irF0AgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V15 8/9] iio: imu: inv_icm42607: Add Temp Support in
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260626161230.93069-9-macroalpha82@gmail.com>
References: <20260626161230.93069-1-macroalpha82@gmail.com>
 <20260626161230.93069-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 16:29:33 +0000
Message-Id: <20260626162934.3EAD71F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The IIO temperature channel advertises support for `IIO_CHAN_INF=
O_SAMP_FREQ` (for read, write, and read_avail), but the `read_avail`, `writ=
e_raw`, and `write_raw_get_fmt` callbacks incorrectly reject the `IIO_TEMP`=
 channel.
--

commit 0961338c1e88a743de08d3a1a83292daf58d5ceb
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Temp Support in icm42607

Add functions for reading temperature sensor data.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> index 8ef9fdae1bc84..5ff6756b95154 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
[ ... ]
> @@ -54,6 +56,7 @@ static const struct iio_chan_spec inv_icm42607_accel_ch=
annels[] =3D {
>  				inv_icm42607_accel_ext_infos),
>  	INV_ICM42607_ACCEL_CHAN(IIO_MOD_Z, INV_ICM42607_ACCEL_SCAN_Z,
>  				inv_icm42607_accel_ext_infos),
> +	INV_ICM42607_TEMP_CHAN(INV_ICM42607_ACCEL_SCAN_TEMP),
>  };

[Severity: Medium]
Since INV_ICM42607_TEMP_CHAN advertises support for IIO_CHAN_INFO_SAMP_FREQ,
will accessing the sampling frequency attributes for the temperature channel
fail?

For example, when reading available frequencies,
inv_icm42607_accel_read_avail() unconditionally rejects non-acceleration
channels:

	if (chan->type !=3D IIO_ACCEL)
		return -EINVAL;

Will the same issue happen for writing SAMP_FREQ in
inv_icm42607_accel_write_raw() and inv_icm42607_accel_write_raw_get_fmt(), =
as
they also check for IIO_ACCEL only?

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
> index c7215b3826adc..4e5db5e19e9f3 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
[ ... ]
> @@ -54,6 +56,7 @@ static const struct iio_chan_spec inv_icm42607_gyro_cha=
nnels[] =3D {
>  			       inv_icm42607_gyro_ext_infos),
>  	INV_ICM42607_GYRO_CHAN(IIO_MOD_Z, INV_ICM42607_GYRO_SCAN_Z,
>  			       inv_icm42607_gyro_ext_infos),
> +	INV_ICM42607_TEMP_CHAN(INV_ICM42607_GYRO_SCAN_TEMP),
>  };

[Severity: Medium]
Similar to the acceleration channels above, will the temperature channel fa=
il
when reading or writing SAMP_FREQ here, since inv_icm42607_gyro_read_avail()
and inv_icm42607_gyro_write_raw() unconditionally return -EINVAL if the
channel type is not IIO_ANGL_VEL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626161230.9306=
9-1-macroalpha82@gmail.com?part=3D8
