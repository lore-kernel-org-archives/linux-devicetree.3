Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474FF175A80
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274053; cv=none; b=t80aq6vrKkPHhngCdnWbctLizrMGtiO12EF9j+rFcwXZwj3hj/t7NQUeQutakD7f5Yg8lQQ9JoPi1PyXIpw8QePU+MTg4wNCBn2tffjo2b/vu1ZGS8YPNUIkwz/8CZUA2QsYDoL6KDTcVtFTQon569abIt2uEE9j83oOia1WNCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274053; c=relaxed/simple;
	bh=FZ1QbCP0ls/0+YTZlTSHHSAnlM5T+to81T1NKHO8tlw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LZwyMBAcuJS6ALUHPYjLzyAbUElyeqvDVJzZssamvpTp+6tu65F/E1KiTiQt5pZYi28FHOVTgPNDqfDbJ1X7oB6wk+bB0jKBYfX510xTZ5Phs7PGZiz11kqhhkpAWJCcrd/U3yF+CvHiuNycH1qZB9JWuU6efqfc0kr29lzbO38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZvrXd36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZvrXd36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA53A1F000E9;
	Tue,  1 Sep 2026 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788274051;
	bh=XG3MCz1nXIuSQjI1EnH9/6htKdbmucRjpDEVn4FXGtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZvrXd363SxDHwT5Zx75wCy0CRHpXM0G9B9Gx2cO1LcAxA+t/ckWVK1/FoD4qssgQ
	 h72sgCSDOS6YeJlf09QqCKnfKy7YRGiTiqo2VCJJpC18PpeZpjf8k0EFWw/lba9yH9
	 zfdnKo27GjC1NKO+v6XINP5jckWhzOIpF5L2R1By8W4quVxcH9825uGNzAQp946PFz
	 Hs8qMA8jk8jMcLkofqrqusATMvgBJ0R62eQVNGjhYQa2N7vdmY6ibqmgPtNai+tC8R
	 usxlBpfQ7PNxgOyWt0IIvdnxxbbXoW/5t1LNq+tXz9XFgNzTpUNWBPQELxblzQVAmF
	 kOJQVqiQ/oOQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] iio: imu: inv_icm42607: Implement MREGx register
 access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-b4-inv_icm42370p-v3-6-77cc31642115@axis.com>
References: <20260901-b4-inv_icm42370p-v3-0-77cc31642115@axis.com>
 <20260901-b4-inv_icm42370p-v3-6-77cc31642115@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 14:47:31 +0000
Message-Id: <20260901144731.AA53A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Resource leak: The RC oscillator is forced on for MREG access bu=
t never explicitly turned off.
- [Medium] Unintended power state regression: default accelerometer mode fo=
r ICM42370 changed to LOW_POWER.
--

commit 5e054b5c4e067c471755e5889343bfd30cf9d57a
Author: Kanak Shilledar <kanak.shilledar@axis.com>

iio: imu: inv_icm42607: Implement MREGx register access

This commit implements indirect register access to different banks (MREGx)
for the inv_icm42607 IMU driver. This allows accessing registers configured
via the user and implementing buffer support. It also alters the default
accelerometer configuration for the ICM42370.

Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
Datasheet: https://www.lcsc.com/product-detail/C5129967.html

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index e77d72e0f7bc6..6e514b8682a0e 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -96,7 +99,7 @@ static const struct inv_icm42607_conf inv_icm42607_defa=
ult_conf =3D {
>  static const struct inv_icm42607_conf inv_icm42370_default_conf =3D {
>  	.gyro =3D { },
>  	.accel =3D {
> -		.mode =3D INV_ICM42607_SENSOR_MODE_OFF,
> +		.mode =3D INV_ICM42607_SENSOR_MODE_LOW_POWER,

[Severity: Medium]
Does this unintentionally cause the accelerometer to consume power immediat=
ely
upon probe?

During driver probe, inv_icm42607_set_init_conf() writes this initial state
to the hardware. This undocumented change forces the accelerometer to turn =
on
immediately at boot.=20

While runtime PM will eventually suspend the device and turn it off after a
2-second delay, it introduces an unnecessary power spike at boot and leaves
the software defaults in an inconsistent state.

>  		.fs =3D INV_ICM42607_ACCEL_FS_4G,
>  		.odr =3D INV_ICM42607_ODR_100HZ,
>  		.filter =3D INV_ICM42607_FILTER_BW_25HZ,
[ ... ]
> @@ -352,6 +355,107 @@ int inv_icm42607_set_sensor_conf(struct inv_icm4260=
7_state *st,
>  	}
>  }
> =20
> +static int inv_icm42607_mreg_check(struct inv_icm42607_state *st)
> +{
> +	struct regmap *map =3D st->map;
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(map, INV_ICM42607_REG_MCLK_RDY, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val & INV_ICM42607_MCLK_RDY_BIT)
> +		return 0;
> +
> +	/*
> +	 * Clock isn't running: we're either in Sleep mode or Accel LP
> +	 * mode with WUOSC. Force the RC oscillator on via IDLE, then
> +	 * wait for MCLK_RDY.
> +	 */
> +	ret =3D regmap_set_bits(map, INV_ICM42607_REG_PWR_MGMT0,
> +			       INV_ICM42607_PWR_MGMT0_IDLE);

[Severity: Medium]
Does this code leak power by leaving the RC oscillator running indefinitely?

inv_icm42607_mreg_check() sets the INV_ICM42607_PWR_MGMT0_IDLE bit to force
the RC oscillator on when accessing MREGs while the sensor is in OFF or
LOW_POWER mode. The datasheet explicitly requires this bit to be cleared
after MREG access is complete to save power.

Neither inv_icm42607_mreg_check() nor the read/write sequences clear this
bit. Although runtime PM autosuspend (after a 2-second delay) will
coincidentally overwrite PWR_MGMT0 and clear the bit, this still leaves the
oscillator running needlessly for 2 seconds per access, or indefinitely if
runtime PM is disabled, causing a persistent power leak.

> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * After setting the IDLE bit to 1 in PWR_MGMT0 register, wait for anyw=
here between
> +	 * 10us to 200us which are the ACCEL_STARTUP time and accelerometer tra=
nsition time
> +	 * from OFF respectively.
> +	 */
> +	return regmap_read_poll_timeout(map, INV_ICM42607_REG_MCLK_RDY, val,
> +			val & INV_ICM42607_MCLK_RDY_BIT, 10, 200);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-b4-inv_icm=
42370p-v3-0-77cc31642115@axis.com?part=3D6
