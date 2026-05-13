Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94B93D093A
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652293; cv=none; b=L4H05wOeahimtpfrBBSeRl2xMgkZUxz5scLZofy6LPK0CcvV9vzhk+zMMc97/YWpPUL8AGv3LYAkJbkh0Ms+LyVSMuIONDhynBRDoOpcPF3s94HDt/7CIfWCF9K4kK0yQg0A2xL2LszUNPSvDLvT/0+mm+GlEvZiT/KAK8vK43U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652293; c=relaxed/simple;
	bh=OrSNaI0h0shQ5d0JKloY8MhLcUc4Rqow+qinxhUmIyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TKHITUNLKg26sXgxnF0omV4+Gboz0VQ832WLZ0lBrUOnf9G/cVImGJNVib/HAC4Fcjm3wkysUVS1C/+t0nDX/IuJ0I7P9P0orLQ1stVXIJ7fr98xdEmEtvnMabtssd81D++mfO0qxewdYhKZoNsi7pWECQQfFKHiYgSwhrOcFhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QavHyASi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QavHyASi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F227DC2BCB7;
	Wed, 13 May 2026 06:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778652293;
	bh=OrSNaI0h0shQ5d0JKloY8MhLcUc4Rqow+qinxhUmIyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QavHyASiNmsy/Qv0+mjb3E+l6i3s3DWh+vCMAXXWDGIoUw1nfs7S9S8hntHpMtK18
	 VwjeZz3ECykObq0FxLsazYiTzAGNYBnwZAs0NfRCF5aYw3Nm8WD4ZcB4nxsLvwEjjq
	 kH794APTmbeoF8Pa8dKJsACTJ/Ky/XeBkUjV8Adf4P6XWYqGt8KcPJJ24KHxrxvhKO
	 aRXSv6C4LsgpYeISEL9IA/rK188/51oZQKAdrfxbuMhCtCM5+HGwqhQp4DL9hSciBY
	 a+cbSaOEp5ypNBn+DvT+yZ3hluX2e1oGSXL7sFRpjA57ILHQVVbqVdw1SmhkzdadHL
	 5+8Ifg9Y6D9yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: syyang@lontium.com
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512064013.40066-3-syyang@lontium.com>
References: <20260512064013.40066-3-syyang@lontium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 06:04:52 +0000
Message-Id: <20260513060452.F227DC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Firmware upgrade via sysfs races with DRM atomic modeset callb=
acks, risking hardware bricking.
- [High] Hardware reset in `remove` callback races with DRM bridge teardown.
- [Medium] Undefined behavior in CRC validation due to integer promotion.
- [Medium] Incomplete display configuration and missing MIPI DSI host regis=
tration.
- [Medium] Unbalanced reset pin state on probe failure creates backpowering=
 risk.
- [Medium] Ignored return values for critical I2C writes during firmware up=
grades.
- [Low] `dev_err_probe()` used outside of `probe` context.
--

commit 0bae053b4ef87003ffe3f7c844f0ddb1092f16bf
Author: Sunyun Yang <syyang@lontium.com>
Date:   Tue May 12 06:40:13 2026 +0000

    drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
   =20
    This commit adds support for the Lontium LT7911EXC eDP to MIPI DSI
    bridge. It implements I2C-based setup, display configuration, and
    provides a firmware update mechanism.

The commit message states:
> It implements I2C-based setup, display configuration, and
> provides a firmware update mechanism.

Is this description completely accurate? Looking at the drm_bridge_funcs
implementation, there are no atomic_enable/disable functions configuring
the display. Additionally, as an eDP to MIPI DSI bridge, should it also
register a mipi_dsi_host so downstream panels can attach?

> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm=
/bridge/lontium-lt7911exc.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
[ ... ]
> +static void lt7911exc_block_erase(struct lt7911exc *lt7911exc)
> +{
[ ... ]
> +	regmap_multi_reg_write(lt7911exc->regmap, seq_write, ARRAY_SIZE(seq_wri=
te));
> +
> +	msleep(200);
> +	dev_dbg(dev, "erase flash done.\n");
> +}

Could this silently fail to erase the flash? If regmap_multi_reg_write()
fails due to hardware communication errors, the driver will continue and
attempt to write new firmware data to an unerased flash segment. Should
the return value be checked here and in lt7911exc_prog_init()?

[ ... ]
> +static int lt7911exc_upgrade_result(struct lt7911exc *lt7911exc, u32 crc=
32)
> +{
[ ... ]
> +	read_hw_crc =3D crc_tmp[0] << 24 | crc_tmp[1] << 16 |
> +				crc_tmp[2] << 8 | crc_tmp[3];

Can this cause a signed integer overflow? In C, u8 values are implicitly
promoted to signed 32-bit integers before shifting. If crc_tmp[0] is 128
or greater, shifting left by 24 bits will shift into the sign bit. Would
explicitly casting to u32 prevent this?

[ ... ]
> +static int lt7911exc_firmware_upgrade(struct lt7911exc *lt7911exc)
> +{
[ ... ]
> +	/*1. load firmware*/
> +	ret =3D request_firmware(&fw, FW_FILE, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to load '%s'\n", FW_FILE);

Is it safe to use dev_err_probe() outside of a probe context? This function
is called exclusively from the sysfs store callback. Calling dev_err_probe()
here might interfere with deferred probe tracking.

[ ... ]
> +static void lt7911exc_atomic_pre_enable(struct drm_bridge *bridge, struc=
t drm_atomic_state *state)
> +{
> +	struct lt7911exc *lt7911exc =3D bridge_to_lt7911exc(bridge);
> +
> +	lt7911exc_reset(lt7911exc);
> +}

[ ... ]

> +static ssize_t lt7911exc_firmware_store(struct device *dev, struct devic=
e_attribute *attr,
> +					const char *buf, size_t len)
> +{
[ ... ]
> +	lt7911exc_lock(lt7911exc);
> +
> +	ret =3D lt7911exc_firmware_upgrade(lt7911exc);

Can a DRM atomic modeset race with a firmware upgrade here?=20

The sysfs attribute protects internal I2C sequences with ocm_lock, but the
DRM bridge callbacks toggle the reset_gpio without acquiring this lock.

If a display modeset occurs concurrently with a firmware flash, could the
hardware reset pin be toggled mid-flash and corrupt the firmware?

[ ... ]
> +static int lt7911exc_probe(struct i2c_client *client)
> +{
[ ... ]
> +	lt7911exc_reset(lt7911exc);
> +
> +	lt7911exc_lock(lt7911exc);
> +
> +	lt7911exc->fw_version =3D lt7911exc_read_version(lt7911exc);
> +
> +	lt7911exc_unlock(lt7911exc);
> +	if (lt7911exc->fw_version < 0)
> +		return dev_err_probe(dev, lt7911exc->fw_version, "failed read version =
of chip\n");

If lt7911exc_read_version() fails, does this leave the reset pin in an
unbalanced state?=20

The lt7911exc_reset() call leaves the reset_gpio low, and as noted in the
remove function, it should be pulled high to prevent backpowering. Should
the error path assert the reset pin high?

[ ... ]
> +	return devm_drm_bridge_add(dev, &lt7911exc->bridge);
> +}
> +
> +static void lt7911exc_remove(struct i2c_client *client)
> +{
> +	struct lt7911exc *lt7911exc =3D i2c_get_clientdata(client);
> +
> +	/* pull reset low to prevent backpowering*/
> +	gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
> +}

Does this teardown sequence race with DRM operations?=20

Because the bridge is registered with devm_drm_bridge_add(), it will be
unregistered during the devres cleanup phase, which happens after the
driver's remove callback has finished.

Since lt7911exc_remove() asserts the reset pin to shut down the hardware,
could concurrent DRM operations attempt to access the disabled hardware
while it is still registered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512064013.4006=
6-1-syyang@lontium.com?part=3D2
