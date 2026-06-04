Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8EC3603F7
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 21:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780607865; cv=none; b=GQuYF0SqXiXTBUXltutBcb8O/2GDQAzmlMTxEsXLmUa+UCxdaVWR2ez8daCO8iTi5E2aiKPBLizlTVcaHGFEhHavPepg7baocKKtVMPCsY46/2GDihYWUcBdrTcTuA6Sh/kDSpD0DuxCuESAvgykFmxheqXpp2o5PSl86cM39kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780607865; c=relaxed/simple;
	bh=WmAbgDluotCCLHVgIaWwE+lEXDA3nNyh/FQR44VbgEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QJCpeEHZMvEkTpxmUvBFnNisrH/Rdp0mh+Tg0YCD/1qcqVguVTXQZvjYl01BWSCdGSR1tySRzYc0SFL924WKb8u1nH4YxJp9h5Vy0SnVY/8x7kSU8Rgr/chx3VmVUeJ/1UVoBCSXyG9BEIE3h8y5g/A45QSxMntnbq8w4/yoHp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKFFrp9/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKFFrp9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896F61F00893;
	Thu,  4 Jun 2026 21:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780607863;
	bh=xJkDbBjbgV8bjvdmfjRf9sYWHhYas3V980Ff2V469TY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eKFFrp9/sFpHGfEtaj58+raltdpR1+KWHD00bTgs6Uxltp7b54IVx0vWXkDLaUPNF
	 Hu3yu9fF1juBE1zeifhAUct/8dlY3Z+cp28DNX3dLdLM3dFo1B53F4nBb7UxaDmeGI
	 6wUEH0lLGx9vwDOS8wKiUJX6ot31/xDSXuszrcrI3tosgNEH02sxaaHcbF9CQGiMri
	 DuLbB1KZ1OBlWTXqASi1NPYYMWdyJMjmNA79LUCRUfSDrVelYXAuClKUZTKvSBUFbh
	 9Hi+L5383rPaUp3UUnkmJAMi59zK28/4YC1aDROg92ulBxxHbfBSEwzbxiGq4b9QOM
	 iel3PndHSwE2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V10 5/9] iio: imu: inv_icm42607: Add PM support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604201832.60656-6-macroalpha82@gmail.com>
References: <20260604201832.60656-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 21:17:43 +0000
Message-Id: <20260604211743.896F61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Missing `dev_set_drvdata()` causes a guaranteed kernel panic o=
n PM transitions.
- [Medium] Unnecessary start-up delays applied when disabling sensors durin=
g power management transitions.
--

commit 095604e6b5564d3e2f59fa7bf159761bbf791c56
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add PM support for icm42607
   =20
Add power management support for the ICM42607 device driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 4448d63e95fd7..39620da92bd43 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -72,6 +73,51 @@ const struct inv_icm42607_hw inv_icm42607p_hw_data =3D=
 {
>  };
>  EXPORT_SYMBOL_NS_GPL(inv_icm42607p_hw_data, "IIO_ICM42607");
> =20
> +static int inv_icm42607_set_pwr_mgmt0(struct inv_icm42607_state *st,
> +				      enum inv_icm42607_sensor_mode gyro,
> +				      enum inv_icm42607_sensor_mode accel,
> +				      bool temp, unsigned int *sleep_ms)
> +{
[ ... ]
> +	sleepval =3D 0;
> +	if (temp && !oldtemp)
> +		sleepval =3D max(sleepval, INV_ICM42607_TEMP_STARTUP_TIME_MS);
> +
> +	if (accel !=3D oldaccel)
> +		sleepval =3D max(sleepval, INV_ICM42607_ACCEL_STARTUP_TIME_MS);
> +
> +	if (gyro !=3D oldgyro)
> +		sleepval =3D max(sleepval, INV_ICM42607_GYRO_STARTUP_TIME_MS);

[Severity: Medium]
Does this unnecessarily delay suspend?

When inv_icm42607_runtime_suspend() turns the sensors off by passing
INV_ICM42607_SENSOR_MODE_OFF, the state changes (accel !=3D oldaccel and
gyro !=3D oldgyro).

Because of this, it seems the function will wait for the maximum startup
time before suspending, rather than only sleeping when the sensors are
actually turning on.

> +
> +	if (sleep_ms)
> +		*sleep_ms =3D sleepval;
> +	else if (sleepval)
> +		fsleep(sleepval * 1000);
> +
> +	return 0;
> +}
[ ... ]
> +static int inv_icm42607_runtime_suspend(struct device *dev)
> +{
> +	struct inv_icm42607_state *st =3D dev_get_drvdata(dev);
> +
> +	guard(mutex)(&st->lock);

[Severity: Critical]
Will this cause a NULL pointer dereference?

The PM callbacks retrieve the driver state using dev_get_drvdata(), but it
doesn't appear that dev_set_drvdata() is ever called during probe to
associate the state with the device.

Since pm_runtime_use_autosuspend() is enabled with a 2000ms delay in probe,
won't this reliably crash the kernel exactly two seconds after the device is
probed?

> +
> +	/* save sensors state */
> +	st->suspended.gyro =3D st->conf.gyro.mode;
> +	st->suspended.accel =3D st->conf.accel.mode;
> +	st->suspended.temp =3D st->conf.temp_en;
> +
> +	return inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
> +					  INV_ICM42607_SENSOR_MODE_OFF, false,
> +					  NULL);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604201832.6065=
6-1-macroalpha82@gmail.com?part=3D5
