Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2B0407588
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835016; cv=none; b=sibDz+Xy6UjTkapXEKIaFL6N6ZQuF5IOkgGNY4tX6C15SSwRq/yAt5FEAh2LvzkDCfixRVP1W12sOpRzzRzLlJNX990cz0z9Lla5Cc2QT35UwcKzMpkLUwjr7sevd8/vsHVafqp89NfMWIDmLMZJiiR3/Y5x1T5RAiPb9Z30QMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835016; c=relaxed/simple;
	bh=G5+5fodb3WGYNhnA47j3X09tsXhL6UFSysN6XJgwc/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uTSP+kWOMd6Dfxg1bxqwTEPvdpGQ4DhsRm3VLpGJ6aYdAb5xxlhwPs2l9O/Q7yIgxVv6aLEidXS3U8oD71GfJLVcrRXF4gLWoGLTJtrnKBLrVbJgQABWgWl4mTnAkGz+hnmj3xi3Bin9B5RIQArow2Yvd4AAPrQMMi/cenoUnfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9BesGAC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9BesGAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4746AC2BCB8;
	Fri, 15 May 2026 08:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778835015;
	bh=G5+5fodb3WGYNhnA47j3X09tsXhL6UFSysN6XJgwc/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=W9BesGACIRRyVMiggwEUhN6THApV/xLFpNrXoEL9ftls40nsUSQV5z/ZrjQX4uQx6
	 YhgguHjnUEYBp1o4SfU3ihQl/fOSKu38YkNlyHdnpJRPsb0w1NDODgMd4guHCObmna
	 e2/taJTbhTusfufKM4WPaxEqbIs0Sz/lK5LcrT5u0T69U62XydX8spxvch4Wl/QTsD
	 vpSVg+FqUl0eDHgesg1e1MFYiYosvbBQ/YT2g7D+taaU/3Tj0MSHpXDN9wmSMyAYG9
	 PCLoKzfIOrxqTHE7aA2WTIDn2Pipnwt4DI6IzdGJk3tDRoMZWa315iNi8AXQuCZCaM
	 4WnNWSxVBRK/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: syyang@lontium.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515080934.9870-3-syyang@lontium.com>
References: <20260515080934.9870-3-syyang@lontium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 08:50:14 +0000
Message-Id: <20260515085015.4746AC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] DSI transfer callback returns success for reads without populating=
 the receive buffer, leaking uninitialized memory.
- [High] DSI transfer callback polls for eDP video readiness before the ups=
tream encoder is enabled, guaranteeing a timeout.
- [High] The driver attempts I2C transfers while the hardware is held in ph=
ysical reset.
- [High] Missing DRM_MIPI_DSI Kconfig dependency causes linker errors.
- [High] request_firmware is called while holding the hardware lock and hal=
ting the MCU, risking a system pipeline stall.
- [High] Sleeping functions are called from atomic context in the DRM bridg=
e callbacks.
- [Medium] lt7911exc_dsi_host_transfer bypasses the required MCU hardware h=
alt sequence.
--

commit ac42b7d6e1a6501b8416d964b8bbfde4d4b376bc
Author: Sunyun Yang <syyang@lontium.com>
Subject: drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge

This commit adds support for the Lontium LT7911EXC bridge chip, converting =
eDP
input to MIPI DSI output. It includes I2C firmware upgrade mechanisms, GPIO
management, and DRM bridge integration.

> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index c3209b0f46786..cb74730c6ef44 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -132,6 +132,21 @@ config DRM_ITE_IT6505
>  	help
>  	  ITE IT6505 DisplayPort bridge chip driver.
> =20
> +config DRM_LONTIUM_LT7911EXC
> +	tristate "Lontium eDP/MIPI DSI bridge"
> +	depends on OF
> +	depends on I2C
> +	select CRC32
> +	select FW_LOADER
> +	select DRM_PANEL
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C

Is a select DRM_MIPI_DSI missing here?=20

The driver unconditionally uses MIPI DSI core APIs such as
mipi_dsi_host_register() and mipi_dsi_host_unregister(), so building without
the MIPI DSI core enabled might result in undefined reference build failure=
s.

[ ... ]
> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm=
/bridge/lontium-lt7911exc.c
> new file mode 100644
> index 0000000000000..e7b8a22b2e29b
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
[ ... ]
> +static int lt7911exc_firmware_upgrade(struct lt7911exc *lt7911exc)
> +{
> +	struct device *dev =3D lt7911exc->dev;
> +	const struct firmware *fw;
> +	u8 *buffer;
> +	size_t total_size =3D FW_SIZE - 4;
> +	u32 crc32;
> +	int ret;
> +
> +	/* 1. load firmware */
> +	ret =3D request_firmware(&fw, FW_FILE, dev);

Could calling request_firmware() here block concurrent DRM atomic commits a=
nd=20
freeze the display pipeline?=20

This function is called by lt7911exc_firmware_store(), which acquires=20
ocm_lock and halts the MCU via lt7911exc_lock() before invoking it. If the=
=20
firmware file is missing or takes time to load, request_firmware() can=20
block waiting for the userspace fallback mechanism while the mutex is held.

[ ... ]
> +static void lt7911exc_atomic_pre_enable(struct drm_bridge *bridge, struc=
t drm_atomic_state *state)
> +{
> +	struct lt7911exc *lt7911exc =3D bridge_to_lt7911exc(bridge);
> +
> +	guard(mutex)(&lt7911exc->ocm_lock);
> +
> +	lt7911exc_reset(lt7911exc);
> +}

Is it safe to use sleeping functions like guard(mutex) and msleep() inside=
=20
lt7911exc_reset(), as well as gpiod_set_value_cansleep() here?=20

The DRM subsystem guide specifies that encoder atomic enable/disable=20
callbacks execute in an atomic context where sleeping is forbidden, which=20
could lead to kernel warnings, system instability, or deadlocks.

> +
> +static void lt7911exc_atomic_disable(struct drm_bridge *bridge, struct d=
rm_atomic_state *state)
> +{
> +	/* Delay after panel is disabled */
> +	msleep(20);
> +}

Similar to the above, does calling msleep() here violate atomic context=20
constraints?

> +
> +static void lt7911exc_atomic_post_disable(struct drm_bridge *bridge, str=
uct drm_atomic_state *state)
> +{
> +	struct lt7911exc *lt7911exc =3D bridge_to_lt7911exc(bridge);
> +
> +	guard(mutex)(&lt7911exc->ocm_lock);
> +
> +	gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
> +}

If the chip is placed in hardware reset here via gpiod_set_value_cansleep()=
,=20
will subsequent I2C transfers in lt7911exc_dsi_host_transfer() fail?

During the next display enable sequence, the panel's pre_enable will=20
likely send DCS commands before the bridge's atomic_pre_enable deasserts=20
the reset, leaving the chip physically in reset during I2C communication.

[ ... ]
> +static ssize_t lt7911exc_dsi_host_transfer(struct mipi_dsi_host *host,
> +					   const struct mipi_dsi_msg *msg)
> +{
> +	struct lt7911exc *lt7911exc =3D dsi_host_to_lt7911exc(host);
> +	unsigned int val;
> +	int ret;
> +
> +	guard(mutex)(&lt7911exc->ocm_lock);

Should this use lt7911exc_lock() instead of guarding ocm_lock directly?

lt7911exc_lock() is explicitly defined to protect register accesses by=20
halting the on-chip MCU. Bypassing this sequence might lead to I2C=20
collisions with the running firmware.

> +
> +	/* ensure eDP input video ready */
> +	ret =3D regmap_read_poll_timeout(lt7911exc->regmap, 0xe084, val, (val &=
 0x01), 5000, 50000);
> +	if (ret) {
> +		dev_warn(lt7911exc->dev, "Video source not ready within 50ms\n");
> +		return -EBUSY;
> +	}

Will this polling loop always time out during panel initialization?

The downstream panel typically sends initialization DCS commands during its=
=20
pre_enable phase, which runs before the upstream eDP encoder's enable=20
callback. Since the eDP video source is inactive at this stage, this=20
might permanently break the display initialization pipeline.

> +
> +	/* enable mipi dsi output stream and firmware will send dcs */
> +	ret =3D regmap_write(lt7911exc->regmap, 0xe0b0, 0x01);
> +	if (ret)
> +		return ret;
> +
> +	return msg->tx_len;
> +}

Could returning msg->tx_len for DCS read operations (where msg->rx_len > 0)=
=20
lead to uninitialized memory being used by the caller?

Because the function returns a positive success value without actually=20
populating msg->rx_buf, the calling panel driver might assume the read was=
=20
successful and consume uninitialized stack or heap memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515080934.9870=
-1-syyang@lontium.com?part=3D2
