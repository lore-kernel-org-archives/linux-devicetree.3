Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE733A70E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227791; cv=none; b=HFXTHvo/A0JhsuRVVu1NEr0zftOf40xGULis0p0zvMktF9xXpjRbE3nrkFqC/cJTfnoJy27jPmrG99p6tWOHHu3jNyzn2T3S/h+NMqEZMjp74FD+DkE2azmVI+xvyKIqmTQzSTU/mli9BgaZRWJH7Ry2cPukH+QVb71CAQ21Sz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227791; c=relaxed/simple;
	bh=FsVVhGtDGfI3KxwMs3RkqNbn1rFuiObjYUEa1MoPKUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HIq/ccop7Khutozd8BU5Le/SUgNeX80JiIHwNt2lF7OjKJa9qEV1V0ztS41oK2cO7MshoXLDnge70Wyme8n1vJnIvBldpjytExpOE4gaETaZOCYt8GR7rOHTpKUghUSUVTHS/6ES/sS5xNbz54TRxXgkqV3T+0GkT618zbImBqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Syvw6gm3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Syvw6gm3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6000F1F000E9;
	Thu, 16 Jul 2026 18:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784227789;
	bh=4hcZm/q+BbatT5WKLuAxVOgM5kmmB1KCBOUeuu2gOC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Syvw6gm3PUL5mUuOJvBJwnIt2Huvo5zh86qzqO8zWVLWywZaAccgRmkLeYdrbL3Mb
	 1Oud4BqzJpaj8mMIveYUkN/TS/fU71b9HvW7s9AAQrmDg9bTJcB/7ho9zXYWJmSWbs
	 5It6tzexpEMhYFqiFtssidAhimokgbghu2/b5Vf/lEBkYOAfBqYkfouyXRQAE6os8F
	 rE1Yw6gcyYAejQ28n7JOG9lXA+N5QI0tKulO1G6iAXv8wC33JO+EUU7NaB4Y8s8gMU
	 REE4ir8gbyXqoKXJ7tNM7FSohG8r5SfvywjKD6vEMJX8rtkkEtnVGJ2/9Yq7k08+k9
	 fk77E8MRTmobw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V17 9/9] arm64: dts: rockchip: Add icm42607p IMU for
 RG-DS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716182637.24310-10-macroalpha82@gmail.com>
References: <20260716182637.24310-1-macroalpha82@gmail.com>
 <20260716182637.24310-10-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 18:49:48 +0000
Message-Id: <20260716184949.6000F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing register cache synchronization and device re-initializatio=
n on system resume causes the device to operate with incorrect hardware con=
figurations after a power loss.
- [Medium] Temperature channel scale and offset read requests are improperl=
y intercepted and rejected, returning -EINVAL.
--

--- Patch [9]: [PATCH V17 9/9] arm64: dts: rockchip: Add icm42607p IMU for =
RG-DS ---
commit 71c9a85a61febe0138b79e4a249c5aff0b95a564
Author: Chris Morgan <macromorgan@hotmail.com>

arm64: dts: rockchip: Add icm42607p IMU for RG-DS

This commit adds the Invensense ICM42607P IMU for the Anbernic RG-DS.
It sets the compatible string, reg address, and mount-matrix.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arc=
h/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
> index 8d906ab02c5fb..b770bfd5268d8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
> @@ -871,7 +871,13 @@ aw87391_pa_r: audio-codec@5b {
>  		sound-name-prefix =3D "Right Amp";
>  	};
> =20
> -	/* invensense,icm42607p at 0x68 */
> +	icm42607p: imu@68 {
> +		compatible =3D "invensense,icm42607p";
> +		reg =3D <0x68>;
> +		mount-matrix =3D "-1", "0", "0",
> +			       "0", "1", "0",
> +			       "0", "0", "-1";
> +	};
>  };

[Severity: High]
Does this system resume handler in the icm42607p driver need to explicitly
mark the regmap cache dirty and sync it?

drivers/iio/imu/inv_icm42607/inv_icm42607_core.c:inv_icm42607_resume() {
    static int inv_icm42607_resume(struct device *dev)
    {
        struct inv_icm42607_state *st =3D dev_get_drvdata(dev);
        int ret;

        ret =3D inv_icm42607_enable_vddio_reg(st);
        if (ret)
            return ret;

        return pm_runtime_force_resume(dev);
    }
}

If the IMU loses power during system suspend (e.g., VDD is cut by the PM
domain), its internal registers reset to hardware defaults.

Because the regmap cache is not marked dirty on resume, subsequent writes
might skip configuration registers since the cached values match the desired
values.

This could leave the device operating with default, unconfigured reset valu=
es
(e.g., incorrect endianness, incorrect scale/ODR), corrupting sensor data.

[Severity: Medium]
Do these read functions improperly intercept and reject temperature channel
scale and offset read requests?

drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c:inv_icm42607_accel_read_r=
aw() {
        switch (mask) {
        case IIO_CHAN_INFO_RAW:
            if (chan->type =3D=3D IIO_TEMP)
                return inv_icm42607_temp_read_raw(indio_dev, chan,
                                                  val, val2, mask);
            ret =3D inv_icm42607_read_sensor(indio_dev, chan, &data);
            if (ret)
                return ret;
            *val =3D data;
            return IIO_VAL_INT;
        case IIO_CHAN_INFO_SCALE:
            if (chan->type !=3D IIO_ACCEL)
                return -EINVAL;
            return inv_icm42607_accel_read_scale(indio_dev, val, val2);
}

drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c:inv_icm42607_gyro_read_raw=
() {
        case IIO_CHAN_INFO_SCALE:
            if (chan->type !=3D IIO_ANGL_VEL)
                return -EINVAL;
            return inv_icm42607_gyro_read_scale(indio_dev, val, val2);
}

This scopes the IIO_TEMP delegation to only IIO_CHAN_INFO_RAW, causing
IIO_CHAN_INFO_SCALE and IIO_CHAN_INFO_OFFSET queries for the temperature
channel to fall through and fail.

Userspace applications attempting to read the temperature scale or offset f=
rom
sysfs will receive an -EINVAL error. This could prevent userspace from
correctly interpreting the raw temperature readings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716182637.2431=
0-1-macroalpha82@gmail.com?part=3D9
