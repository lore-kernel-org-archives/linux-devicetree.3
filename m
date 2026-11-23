Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415918;
	b=cm4BJFhKf1gXVqZrueupTTodVKppTAiEGlgVovaYVvwaS/f9yT3PaN/wLEdfJwa8oWWd
	 KE+ge1r2MThrRvcLzWBary3GC+7k0qCKwTx0GV3HfRghm3qPEJ+4hkZ7Z4CxtiIiK+gFu
	 u7aJovnGJhhJfFH/Nctl+EnVxgLEWxDI2ZKDwiPuu44mSuCYxCvVd2N03st3YXzTqvJyH
	 JGPy+4zNit7IxBmlXbr3bY9KUBB90Mz9uX5Vf6f/AkfuSVxuuO90hCaxOtAP2p/eCdsPa
	 Pi+G/oSu8GxhhEucAy89xXItgf8NI8KiMR3mlO4nLUtXJyAovJ1gDGev48N3ci/sdtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415918;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fDtgx4VDKn1bbCHyvl2n/PhCW/zEM0917Bl08KMZ0xg=;
	b=WeKEmq3wugikzPdCn1h5Qqq94TQq8soSzjLILfJ/Xp7F8lYHUvVj3deJOO8mBohWM6KN
	 cwFC9/MOnDseYKyuvyqLQqYKfWVieoywrF5uzggl6lODwRGcgVOgzMKA9Ih+u6yy3hKcS
	 ndCH9XCGJ2V1bSphy32voBlY/FXbB89EN5KkH++qpioXt6t96598wGwlcgyC6lQTcReLG
	 t4OlTjoSxD//qnguU+D0hplEIISvQvpYpQYC+6DaUWGDAuBw9yhc+L/x9LOSIfqu4hSQx
	 3wZa2ucS/6bADyJgrUjO2DpHM+G11H13WQwNzR3p/wbKghrh69ig+UoIgMKfsOblIsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfa66ARy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F01606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfa66ARy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0470B1F00A03;
	Mon, 23 Nov 2026 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795415918;
	bh=fDtgx4VDKn1bbCHyvl2n/PhCW/zEM0917Bl08KMZ0xg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hfa66ARyqBBjIT1m6ygBJcbtCvdtowE1Z91zcan+S348QidwgTXfI/cQVSeQYz6gV
	 lAOpwginA0MVFILqIzbfwtsV03UflbbYtqgaLJu7srjEgF66mbd5bC+IojLZpbCPsJ
	 vSbEcXLFhXvUQ7omQWTzU91Wa1fSp0BtZwCnzVAnCBlpKpPPT9Oai2ousCcB9ugWAt
	 fj6WyzNyOfmtz4lLFXOFPTmbVgCU5tFur68i5vmzjL10KGlsikA59X0SwRQ/mLR/xy
	 NM43oceOKctZ4LAsuTwrd4ThCCKYl02inmF/PXx+pzXIQcXxDpiXkw6dqKQDP/84ai
	 aWFCX6wxSGBRw==
Message-ID: <sashiko-outbox-228772@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI
 DSI to HDMI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: mohit.dsor@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-lt9611c-v7-v19-2-1fbe2b7b5211@oss.qualcomm.com>
References: <20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com>
 <20261123-lt9611c-v7-v19-2-1fbe2b7b5211@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 06:38:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [Medium] drm/bridge: missing bridge.supported_hdmi_ver init in
  lt9611c_probe()
- [Medium] drm/bridge: missing empty-firmware check in
  lt9611c_firmware_upgrade()
- [Medium] drm/bridge: lt9611c: unlinked PM suspend/resume loses bridge
  and HPD state
- [Low] drm/bridge: unlocked reset recovery in lt9611c_bridge_suspend()
- [Low] drm/bridge: u8 packet index overflow in lt9611c_get_edid_block()
- [Low] drm/bridge: missing static qualifier on lt9611c_bridge_pm_ops
- [Low] drm/bridge: dev_err_probe() used in runtime sysfs firmware
  upgrade path
- [Low] drm/bridge: unused write-only hdmi_connected field in struct
  lt9611c
--

commit e4dc76d7da66404497a0938b0ca6f5f1ea01fe2d
Author: Sunyun Yang <syyang@lontium.com>

drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

This commit adds a DRM bridge driver for the Lontium LT9611C, LT9611EX,
and LT9611UXD MIPI DSI to HDMI bridge chips, supporting EDID reading, HPD
handling, I2S HDMI audio, dual-DSI mode, and sysfs firmware upgrades.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/b=
ridge/lontium-lt9611c.c
> new file mode 100644
> index 0000000000000..e7c579cd80d5a
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> @@ -0,0 +1,1406 @@

[ ... ]

> +struct lt9611c {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct drm_bridge bridge;
> +	struct regmap *regmap;
> +	struct mutex mcu_lock;
> +	struct work_struct work;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[2];
> +	int fw_version;
> +	const struct lt9611c_chip_data *cdata;
> +	bool hdmi_connected;
> +	bool dual_dsi;
> +};

[Severity: Low]
This isn't a bug, but hdmi_connected is only ever written in
lt9611c_detect_hpd() and never read.

[ ... ]

> +static int lt9611c_upgrade_result(struct lt9611c *lt9611c, u8 fw_crc)
> +{
> +	struct device *dev =3D lt9611c->dev;
> +	unsigned int crc_result;
> +	int ret;
> +
> +	regmap_write(lt9611c->regmap, LT9611C_MCU_HALT, LT9611C_MCU_HALT_ENABLE=
);
> +	ret =3D regmap_read(lt9611c->regmap, LT9611C_FLASH_CRC, &crc_result);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read firmware crc\n");
> +
> +	if (crc_result !=3D fw_crc) {
> +		dev_err(dev, "lt9611c fw upgrade failed, expected crc=3D0x%02x, read c=
rc=3D0x%02x\n",
> +			fw_crc, crc_result);
> +		return -EIO;
> +	}
> +
> +	dev_info(dev, "lt9611c firmware upgrade success, crc=3D0x%02x\n", crc_r=
esult);
> +	return 0;
> +}
> +
> +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
> +{
> +	struct device *dev =3D lt9611c->dev;
> +	const struct firmware *fw;
> +	const size_t total_size =3D FW_SIZE - 1;
> +	u8 fw_crc;
> +	int ret;
> +
> +	ret =3D request_firmware(&fw, FW_FILE, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to load '%s'\n", FW_FILE);

[Severity: Low]
Should lt9611c_firmware_upgrade() and lt9611c_upgrade_result() use
dev_err() instead of dev_err_probe()?  Both functions are also called at
runtime from the sysfs firmware_store() handler.

> +	if (fw->size > total_size) {
> +		dev_err(dev, "firmware too large (%zu > %zu)\n", fw->size, total_size);
> +		ret =3D -EINVAL;
> +		goto out_release_fw;
> +	}

[Severity: Medium]
What happens if request_firmware() loads an empty (0-byte) firmware file?

Because fw->size =3D=3D 0 is not rejected here, lt9611c_block_erase() erases
both flash blocks to 0xff, lt9611c_write_data() computes npages =3D 0 and
writes nothing, and lt9611c_write_crc() programs the CRC of 65535 bytes of
0xff at 0xffff.  lt9611c_upgrade_result() then sees a matching CRC and
reports a successful upgrade with the SPI flash completely erased.

[ ... ]

> +static int lt9611c_get_edid_block(void *data, u8 *buf,
> +				  unsigned int block, size_t len)
> +{
> +	struct lt9611c *lt9611c =3D data;
> +	struct device *dev =3D lt9611c->dev;
> +	u8 edid_raw[LT9611C_CMD_Y0_SIZE + LT9611C_EDID_BUF_SIZE];
> +	u8 y0;
> +	int ret, i, offset =3D 0;
> +	struct lt9611c_cmd cmd =3D {
> +		.hdr =3D { LT9611C_FUNC_READ, LT9611C_TYPE_HDMI, 0x33, LT9611C_CMD_SEP=
 },
> +	};
> +	struct lt9611c_rsp rsp =3D {
> +		.data =3D edid_raw,
> +		.data_len =3D LT9611C_CMD_Y0_SIZE + LT9611C_EDID_BUF_SIZE,
> +	};
> +
> +	if (len !=3D 128)
> +		return -EINVAL;
> +	guard(mutex)(&lt9611c->mcu_lock);
> +
> +	for (i =3D 0; i < 4; i++) {
> +		y0 =3D block * 4 + i;
> +		cmd.data =3D &y0;
> +		cmd.data_len =3D 1;
> +		ret =3D lt9611c_read_write_flow(lt9611c, &cmd, &rsp);

[Severity: Low]
Can y0 overflow when block >=3D 64?  An EDID can have up to 256 blocks, so
block * 4 + i wraps around in u8 and reads packet (block % 64) * 4 + i
instead of returning -EINVAL.

[ ... ]

> +	lt9611c->bridge.of_node =3D client->dev.of_node;
> +	lt9611c->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
> +			DRM_BRIDGE_OP_EDID |
> +			DRM_BRIDGE_OP_HPD |
> +			DRM_BRIDGE_OP_HDMI |
> +			DRM_BRIDGE_OP_HDMI_AUDIO;
> +	lt9611c->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> +
> +	lt9611c->bridge.vendor =3D "Lontium";
> +	lt9611c->bridge.product =3D "LT9611C";
> +
> +	lt9611c->bridge.hdmi_audio_dev =3D dev;
> +	lt9611c->bridge.hdmi_audio_max_i2s_playback_channels =3D 8;
> +	lt9611c->bridge.hdmi_audio_dai_port =3D 2;
> +
> +	drm_bridge_add(&lt9611c->bridge);

[Severity: Medium]
Should lt9611c_probe() initialize lt9611c->bridge.supported_hdmi_ver before
calling drm_bridge_add()?

Because DRM_BRIDGE_OP_HDMI is set while supported_hdmi_ver is left at
HDMI_VERSION_UNKNOWN, drm_bridge_add() triggers DRM_WARN("HDMI bridge
misses supported HDMI version\n") on every probe, and
drmm_connector_hdmi_init() leaves connector->hdmi.max_tmds_char_rate at 0
and skips the HDMI 2.0 scrambler callback check for CHIP_LT9611UXD.

[ ... ]

> +static int lt9611c_bridge_suspend(struct device *dev)
> +{
> +	struct lt9611c *lt9611c =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	disable_irq(lt9611c->client->irq);
> +	cancel_work_sync(&lt9611c->work);
> +
> +	mutex_lock(&lt9611c->mcu_lock);
> +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> +	ret =3D regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->=
supplies);
> +	mutex_unlock(&lt9611c->mcu_lock);
> +
> +	if (ret) {
> +		dev_err(lt9611c->dev, "regulator bulk disable failed\n");
> +		gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> +		msleep(400);
> +		enable_irq(lt9611c->client->irq);
> +		return ret;
> +	}

[Severity: Low]
If regulator_bulk_disable() fails here, does dropping mcu_lock before
deasserting reset_gpio and waiting 400 ms allow concurrent mcu_lock holders
to talk to the MCU while it is still held in reset or booting?

> +
> +	return 0;
> +}
> +
> +static int lt9611c_bridge_resume(struct device *dev)
> +{
> +	struct lt9611c *lt9611c =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->s=
upplies);
> +	if (ret) {
> +		dev_err(lt9611c->dev, "regulator bulk enable failed\n");
> +		return ret;
> +	}
> +
> +	mutex_lock(&lt9611c->mcu_lock);
> +	lt9611c_reset(lt9611c);
> +	mutex_unlock(&lt9611c->mcu_lock);
> +
> +	enable_irq(lt9611c->client->irq);
> +	return 0;
> +}

[Severity: Medium]
As reported by Dmitry Baryshkov on v7 [1], can system suspend and resume
miss hotplug events or lose the programmed bridge state?

During suspend and resume, the falling-edge client->irq is disabled across
power-off and the 400 ms lt9611c_reset() delay, and drm_bridge_hpd_disable()
clears bridge->hpd_cb until drm_kms_helper_poll_enable() runs, so cable
changes while powered off are never reported unless HPD status is re-read
after resume.  In addition, because cyclic OF graph links between the DSI
host and lt9611c are relaxed to DL_FLAG_SYNC_STATE_ONLY and no device link
orders lt9611c before the DRM device on dpm_list, DRM drivers that call
drm_mode_config_helper_resume() from their .resume callback can run
lt9611c_bridge_atomic_enable() while lt9611c is still powered down, after
which lt9611c_bridge_resume() resets the chip and wipes the video timing,
dual-DSI, and infoframe state.

> +
> +DEFINE_SIMPLE_DEV_PM_OPS(lt9611c_bridge_pm_ops,
> +			 lt9611c_bridge_suspend, lt9611c_bridge_resume);

[Severity: Low]
Should DEFINE_SIMPLE_DEV_PM_OPS() be prefixed with static so
lt9611c_bridge_pm_ops is not exported with external linkage?

[1] https://lore.kernel.org/r/4t3bar2svwex4wojumql2t66ivtj6bsxnt7pgmygnc7og=
4zquh@fs7wdd4k4cjp

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-lt9611c-v7=
-v19-0-1fbe2b7b5211@oss.qualcomm.com?part=3D2
