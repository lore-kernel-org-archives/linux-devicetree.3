Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D277441B8D7
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547550; cv=none; b=I9XUP9jfT9PsjqN+ShJnG3eKTaQ8JFAXQbkwujPbZUrH6S3VR52G0CPnVurvzT7GQE+nLusr9SuoYnVFVCO5BuNLcYaFShMlXSKZUzzYPKxncvjd2BpQnVbYYHGcV7LCNv3B5bDp0QF1mZt4VV/cnxgv1NQFdX5KtDjCl4DhVaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547550; c=relaxed/simple;
	bh=Gsz5HUouxBBltAEUpStJXvFM6safPf0uYSRe1VvzpO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l5Hx6nfsXD+kfz1uRIRkaZzC/BiKMg7EV2QFYiB9Fx1Fe98SkP2wunzTZ4s39mSJF9IyiEJToHGCV2IqNRePGyEcXCR8a+utkoXIU9eEBmjMQ1hv3RMOBRkIRFPB0bFeamQSp9Vcqkfw2mUVyetV2g+C97qmXi+YrTxKtOTKyjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rgbl59uN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rgbl59uN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C84E1F000E9;
	Wed, 12 Aug 2026 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786547548;
	bh=t2w+TMS605+VfushjYUWL6Uy2zg9urt3BqFPg369oPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rgbl59uNVBNVeqQWno9WeFW3b89lnFxapOhBmAB2Zu+0bDCUgLmzh6OBrNZMNqqAu
	 QsVSTyixwkDhJAUJLA3pfJbRGlczDE1e+7W3Wq587jojznsBHz4Uou0Ifk/xD6HxiO
	 zBYbZLEd4LirHkl5ncm8/7F1rFKSr1D+heDrAcB8c0m2ftKR9uuUnow3guuHuM9dpU
	 dKsDvWtHfdp7Uu4hzlP1EZDb2TltbNLaXAHvFk7j1cFS9tY2KZOy4osujhCxHU3SIX
	 sw1ekgHMru9YvozG0WMntX59GMxdn2ZYB8UKFhIZvc5QwegHbWmKYV4NFk3ABPcPYQ
	 iO3BSt1RE0jhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] iio: accel: mma8452: Optimize struct mm8452_data
 member orders
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260812-mma8452-open-drain-v4-2-bfca15d02b59@geanix.com>
References: <20260812-mma8452-open-drain-v4-0-bfca15d02b59@geanix.com>
 <20260812-mma8452-open-drain-v4-2-bfca15d02b59@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:12:28 +0000
Message-Id: <20260812151228.7C84E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] AB-BA deadlock between the driver's data->lock and the PM runtime =
core synchronization.
- [High] Short I2C reads leak uninitialized kernel stack memory to userspac=
e.
--

--- Patch [2]: [PATCH v4 2/6] iio: accel: mma8452: Optimize struct mm8452_d=
ata member orders ---
commit 6be65aa63f260fa43ab647c9d5c94e2ecf3e69dd
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Optimize struct mm8452_data member orders

Reorder struct mma8452_data members to avoid holes.

> iio: accel: mma8452: Optimize struct mm8452_data member orders

This isn't a bug, but there's a typo (mm8452) in the subject line.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 7d683686dd9d6..f645a5c6fd1c2 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -106,10 +106,7 @@ struct mma8452_data {
>  	struct i2c_client *client;
>  	struct mutex lock;

[Severity: High]
This is a pre-existing issue, but is there an AB-BA deadlock between the
driver's lock and the PM runtime core synchronization?

If a sysfs read calls mma8452_read_raw(), which acquires the lock:

mma8452_read_raw()
    mutex_lock(&data->lock);
    ret =3D mma8452_read(data, buffer);

And then mma8452_read() attempts to acquire a PM runtime reference by calli=
ng
pm_runtime_resume_and_get(), it blocks waiting for a suspend operation to
complete if the device is auto-suspending.

Concurrently, if the PM autosuspend timer expires, the PM core executes the
driver's suspend callback:

mma8452_runtime_suspend()
    mutex_lock(&data->lock);
    ret =3D mma8452_standby(data);
    mutex_unlock(&data->lock);

Could this result in a permanent deadlock if the sysfs read thread holds the
lock while waiting for the PM core, which is in turn waiting for the lock in
mma8452_runtime_suspend()?

>  	struct iio_mount_matrix orientation;
> -	u8 ctrl_reg1;
> -	u8 data_cfg;
>  	const struct mma_chip_info *chip_info;
> -	int sleep_val;
>  	struct regulator *vdd_reg;
>  	struct regulator *vddio_reg;
> =20
> @@ -118,6 +115,10 @@ struct mma8452_data {
>  		__be16 channels[3];
>  		aligned_s64 ts;
>  	} buffer;

[Severity: High]
This isn't a bug introduced by this patch, but do short I2C reads leak
uninitialized kernel stack memory to userspace here?

In mma8452_read_raw(), an uninitialized buffer is allocated on the stack and
passed to mma8452_read():

mma8452_read_raw()
    __be16 buffer[3];
    ...
    ret =3D mma8452_read(data, buffer);

In mma8452_read(), an I2C read is performed:

mma8452_read()
    ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
                                        3 * sizeof(__be16), (u8 *)buf);
    if (ret < 0)
        return ret;

    ret =3D mma8452_set_runtime_pm_state(data->client, false);

    return ret;

If the I2C device returns fewer bytes than expected (a short read),
i2c_smbus_read_i2c_block_data() returns a positive integer less than 6.

The code only checks for ret < 0, and then overwrites the short read length=
 by
returning the result of mma8452_set_runtime_pm_state(), which is 0 on succe=
ss.

Does this hide the short read from the caller, causing mma8452_read_raw() to
extract a value from uninitialized stack memory and return it to userspace =
via
the sysfs interface?

> +
> +	int sleep_val;
> +	u8 ctrl_reg1;
> +	u8 data_cfg;
>  };
> =20
>   /**

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-mma8452-op=
en-drain-v4-0-bfca15d02b59@geanix.com?part=3D2
