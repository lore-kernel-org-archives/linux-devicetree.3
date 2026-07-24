Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D919E3AF66C
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 20:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784925859; cv=none; b=MFgK05SJ6PcGoiap0WRflT1YI67TXTir9zFsziQ4JlWD0qL30zM62heos4c3uI+JsvSVYGwphPXZ0/HPNEO0PIuMeXPCze3Z7oM/HKotJ2k3gKON2jzKMEqN0T7c9DXjs190Xdj/9Lm1q78tznyZ5IUkZYRdKu00Y4e+QVbgvbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784925859; c=relaxed/simple;
	bh=ztICrvADRvO0c5fltSiZM1/haSQ3n8dYS6gSSei3pzM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q6Lr/DSXi9HNHZHdeHHLhPTKDU8IGiafutiIu1aVGoqbFs+6wXoEkChRJ8yvsYQnkR/MPLYTSoXLu71fQ+/6+u1rqelW1UnImxeNgpyeUBFMOXpO/4FAnx8t8ARqT7LiBSqFtCH0lip67mBJtZn9OndNSGl3XVxVieQEuvU5WT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0kSsi2I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0kSsi2I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489E21F000E9;
	Fri, 24 Jul 2026 20:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784925857;
	bh=afbShZUrhCjw8Nfw1v2NKMss0Jr7R+at0Kt+9k5xjfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F0kSsi2Imo1MEK+pRkFv9WxEcIbOpfUQk297mTXHCwBLpxXhk1EEzSuWydiZK1RDs
	 0S98HyP7aUPrqKzC2vRVsnCgqS5tV4O2TPA9BqDRwl+5xWTcaqTeYQydhWECDXSHjt
	 EkGk4h6N66K/BC3pS/LXCBhE3eCpO5K1EEEGaddxkjBybjwIMkjb437W0qhDKtBy3q
	 jf/uvaES5V2DeerlBtZEHVknxoXEmIWGDSWZ+7CUPleUH63L2s03nhrSfrI7wMDHHn
	 OC4LWMAbJpzN+AP1UIAg1Bmu444XTnzKKYuuzKIRVV2f3ZXT0QrijEg+cXrwQTRlAz
	 kZVO2qVw9tMmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] iio: imu: inv_icm42600: warn on whoami mismatch
 instead of failing probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724202708.128267-3-jorijnvdgraaf@catcrafts.net>
References: <20260724202708.128267-1-jorijnvdgraaf@catcrafts.net>
 <20260724202708.128267-3-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 20:44:16 +0000
Message-Id: <20260724204417.489E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Demoting the WHOAMI check to a warning allows the driver to succ=
essfully probe on a disconnected or floating SPI bus, allocating resources =
for a phantom device.

Pre-existing issues:
- [High] The VDDIO regulator enable count is leaked on probe error paths be=
cause the devres cleanup function checks the wrong runtime PM state.
- [High] Devres teardown ordering is incorrect because IIO devices are regi=
stered before Runtime PM is initialized, creating a race condition on drive=
r unbind.
--

--- Patch [2]: [PATCH v2 2/4] iio: imu: inv_icm42600: warn on whoami mismat=
ch instead of failing probe ---
commit 8842cf41876131adceea9740e2e506d7567dcc89
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

iio: imu: inv_icm42600: warn on whoami mismatch instead of failing probe

This changes the inv_icm42600 driver to warn instead of failing the probe
when a WHOAMI mismatch occurs. This allows register-compatible parts=20
described with fallback compatibles to probe successfully. The driver now=20
relies on the devicetree compatible as the authoritative source for the=20
fitted part.

Link: https://lore.kernel.org/all/20260722-creature-volley-0f083b904c1d@spu=
d/

> diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c b/drivers/i=
io/imu/inv_icm42600/inv_icm42600_core.c
> index dc97d8a274e36..f306e3ffca486 100644
> --- a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
> +++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
> @@ -509,11 +509,9 @@ static int inv_icm42600_setup(struct inv_icm42600_st=
ate *st,
>  	ret =3D regmap_read(st->map, INV_ICM42600_REG_WHOAMI, &val);
>  	if (ret)
>  		return ret;
> -	if (val !=3D hw->whoami) {
> -		dev_err(dev, "invalid whoami %#02x expected %#02x (%s)\n",
> -			val, hw->whoami, hw->name);
> -		return -ENODEV;
> -	}
> +	if (val !=3D hw->whoami)
> +		dev_warn(dev, "unexpected whoami %#02x, expected %#02x (%s)\n",
> +			 val, hw->whoami, hw->name);

[Severity: Medium]
Will this allow a disconnected SPI bus to successfully probe a phantom devi=
ce?

If the SPI bus is disconnected, a floating MISO often returns 0xFF for all
reads. With this check demoted to a warning, the driver proceeds to read
the reset status:

drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:inv_icm42600_setup() {
    ...
    ret =3D regmap_read(st->map, INV_ICM42600_REG_INT_STATUS, &val);
    ...
    if (!(val & INV_ICM42600_INT_STATUS_RESET_DONE)) {
        dev_err(dev, "reset error, reset done bit not set\n");
        return -ENODEV;
    }
...

Since 0xFF & INV_ICM42600_INT_STATUS_RESET_DONE evaluates to true, the reset
check passes and the driver allocates IIO devices, IRQs, and memory for a
non-existent device. Could extreme values like 0xFF or 0x00 still be treated
as errors to abort the probe?

[Severity: High]
This is a pre-existing issue, but does a probe failure leak the VDDIO
regulator enable count?

If the probe fails before devm_pm_runtime_set_active_enabled() is called=20
(for instance, during inv_icm42600_setup), devres executes the cleanup=20
function:

drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:inv_icm42600_disable_vddio=
_reg() {
    if (pm_runtime_status_suspended(dev))
        return;

    regulator_disable(st->vddio_supply);
}

Because the device's default PM status is RPM_SUSPENDED before runtime PM is
enabled, won't this incorrectly return early and leave the regulator
permanently enabled?

[Severity: High]
This isn't a bug introduced by this patch, but could there be a race condit=
ion
on driver unbind due to devres teardown ordering?

In inv_icm42600_core_probe(), IIO devices are registered before runtime PM =
is
initialized:

drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:inv_icm42600_core_probe() {
    ...
    st->indio_gyro =3D inv_icm42600_gyro_init(st);
    ...
    ret =3D devm_pm_runtime_set_active_enabled(dev);
    ...
}

On teardown, runtime PM is disabled before the IIO devices are unregistered.
If the device was runtime suspended (VDDIO off) and userspace reads a sysfs
attribute during this window, we can hit this path:

drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c:inv_icm42600_gyro_read_sen=
sor() {
    ...
    pm_runtime_get_sync(dev);
    mutex_lock(&st->lock);
    ...
    ret =3D inv_icm42600_set_gyro_conf(st, &conf, NULL);
    ...
}

Since runtime PM is disabled, pm_runtime_get_sync() fails, but its return
value is ignored. Doesn't this cause the driver to access the regmap while
VDDIO is powered off, potentially leading to bus timeouts or lockups?

>  	st->name =3D hw->name;
> =20
>  	/* reset to make sure previous state are not there */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724202708.1282=
67-1-jorijnvdgraaf@catcrafts.net?part=3D2
