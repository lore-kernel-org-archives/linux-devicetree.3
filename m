Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D793E51EC
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647227; cv=none; b=hyY4mYA48dSokxblexnrkYFowySYcEuQfVn3ciEakuYyfikjKQ/+j2dVOwtJIopUaAToJVIMhnNAIHOAWzjzG45dA5hKRbPzfA9VyF0+ugWdVixQWaxBrxklB/6vHd8c5KDbwmwCD4bA6+FFLbvKqqzyc4F2ZWHkDgn2/SeXcB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647227; c=relaxed/simple;
	bh=BPXo65DE44KL3OkSHyYbBuBuUGNiDU7H1wK6raUEo2M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IGs5950ysDrU2u7XUY4C/TIfU7s+V9idftnYrU3UipLfhcFdlPX9jz0ZGuAXUs+xJdZCu7yiQLCR23MaQk9XNc5rc7nImcIhrtd+NYOf89YHsohYvWqX2YbAFtIiEzVCkWt0Z4C+zSUT3vNt4bXUpNVz2W4TYJ1B75n9AdbdmjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEF4FpX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEF4FpX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1861F000E9;
	Tue, 25 Aug 2026 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787647224;
	bh=oUD7AqgC4UxDQurSvbvQ6nQv5aI0/yhu9Wm3UsaArv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UEF4FpX6Y+7OkPi09surInXQEe+vXNVERJVChif9uVFvqkxnaZqO6fU00YvTgkZMK
	 yYCa8tpRdwb7pm4BsJ3zPnmFRGRCSzopGdahH67bU6Nfxf/EjsedSiNmVfjbFekUTb
	 QIt8o9jbIDTbeMzs/q8qFTFKRVjGL3MZZ3k6Guzq1mEuASPn08DKdFa60FKUVbEqKw
	 6J2rmYdNeZWdyuhdYQHaAtpfK7jBAO6/lUKAkKgFdF8SNMgOrRP4Hphcjyrf/oArb6
	 AlxnzDsZfQFCSAVH6PtUqQQqPe/cTV6DFKoQmgP7i/lHAnqwj/mvxQ/cDf6DpL68L+
	 S86jJk2znci/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 9/9] iio: accel: mma8452: Use proper error code when
 missing device model
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825-mma8452-open-drain-v6-9-9b252804ee80@geanix.com>
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
 <20260825-mma8452-open-drain-v6-9-9b252804ee80@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 08:40:24 +0000
Message-Id: <20260825084024.9A1861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `mma8452_remove` function fails to wake up the device before i=
nteracting with it, leading to I2C timeouts and unbalanced regulator disabl=
es if the device is currently runtime-suspended.
- [High] Numerous sysfs accessor callbacks perform I2C operations without e=
nsuring the device is runtime active, leading to I2C errors when the device=
 is suspended.
--

--- Patch [9]: [PATCH v6 9/9] iio: accel: mma8452: Use proper error code wh=
en missing device model ---
commit 1a9b4790dc03b13bece48bd3facb79fda0b2f907
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Use proper error code when missing device model

The device is there, but we don't have data describing how to use it.
This patch updates the error code returned during probe from -ENODEV to
-ENODATA when the device model is unknown.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 4a1eb196589ab..42e3371cdb1d7 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1595,7 +1595,7 @@ static int mma8452_probe(struct i2c_client *client)
> =20
>  	data->chip_info =3D i2c_get_match_data(client);
>  	if (!data->chip_info)
> -		return dev_err_probe(dev, -ENODEV, "unknown device model\n");
> +		return dev_err_probe(dev, -ENODATA, "unknown device model\n");

[Severity: High]
This isn't a bug introduced by this patch, but the mma8452_remove function
fails to wake up the device before interacting with it, which can cause I2C
timeouts and unbalanced regulator disables if the device is currently
runtime-suspended.

drivers/iio/accel/mma8452.c:mma8452_remove() {
	...
	pm_runtime_disable(&client->dev);
	pm_runtime_set_suspended(&client->dev);
	...
	mma8452_standby(iio_priv(indio_dev));

	regulator_disable(data->vddio_reg);
	regulator_disable(data->vdd_reg);
}

Should mma8452_remove() wake up the device via pm_runtime_get_sync() before
disabling runtime PM and issuing I2C writes to the powered-off chip in
mma8452_standby()?

Does disabling regulators here cause a regulator use-count underflow since
the regulators are already disabled when the device is autosuspended?

[Severity: High]
This is a pre-existing issue, but numerous sysfs accessor callbacks perform
I2C operations without ensuring the device is runtime active.

drivers/iio/accel/mma8452.c:mma8452_read() {
	...
	int ret =3D mma8452_drdy(data);

	if (ret < 0)
		return ret;

	ret =3D mma8452_set_runtime_pm_state(data->client, true);
	...
}

Will this cause I2C transaction failures when userspace attempts to read or
write sysfs attributes while the device is suspended?

The data ready check in mma8452_read() performs an I2C read before the devi=
ce
is resumed from runtime suspend. Direct I2C reads and writes are similarly
issued in mma8452_read_raw() for calibration bias and in __mma8452_write_ra=
w()
via mma8452_change_config() without resuming the device.

> =20
>  	ret =3D iio_read_mount_matrix(dev, &data->orientation);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-op=
en-drain-v6-0-9b252804ee80@geanix.com?part=3D9
