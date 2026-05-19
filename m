Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1430E369D6B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190529; cv=none; b=Zm9Vk51GiXAXXV1ZxnJ8u16uMcaBDdCwpuWzH+T8G98OctxDSlWCiGcwUS0XstlUur3sWGlpuqwgyEgUywkwFjW5Vvf82to0cRJiBETn2U53jTPpcRnSRL1FTGIYvfxqGl7ezX1rpGcP2FCNEfgilN4zdzALPnrDN8QB226LjPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190529; c=relaxed/simple;
	bh=bEsE+psoNcpcDHzxBWF5fTplAyQr6BXDunI79+4nAbY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q/mHnsfdFpjclf7H2ZHJaXTob+wpbSOF6e/ov5ILeS7GCur2EPPiSEldJKwXjnK58K2rkFAezEEZS3fQUaYSlKImUaPA1brTM9rxpa5ZnwT1/JMuyiL+RtRToKhyYwTkkw60vyrudYBcSacX6+sRJGqFgEIivEmTtq7rWRNSjJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmDPBfO6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmDPBfO6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD273C2BCB3;
	Tue, 19 May 2026 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779190528;
	bh=bEsE+psoNcpcDHzxBWF5fTplAyQr6BXDunI79+4nAbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cmDPBfO6tfDd/tpUqCxyu5aQuB2CY5V7CR7J68QuRV8BdReAu5bdNFn8bEtz6BUBE
	 L8zdTUCdG532gR8ewAaI5SuhNvC7C1PQxQ15E5exuc7Zz7yYWqS0sxp3NquGbfroHT
	 W6JZWA3H/8Xc3+KvKZtIhPRF4aR3w3JJgW2wMVoUGfJFEAi6QV5E8CdHXMF5Jd5IaS
	 NXdI/+1DfTyUhPLiFjr9cn+LAqPtf53QdoRFMZz43QuZxTM/E8FOiK1+KzHM72OJRX
	 h29H+Z63ODLTAKb6sK/wdQv5XeZ0Fcn23oRjlFbFaFNd0fB7TpqjyC0pfYyFt2xri8
	 AVIdIs+kdv1hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: syyang@lontium.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519105019.22622-3-syyang@lontium.com>
References: <20260519105019.22622-3-syyang@lontium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:35:19 +0000
Message-Id: <20260519113521.CD273C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] State machine lockup and resource leak on firmware upgrade error p=
aths.
- [High] Missing exclusivity check in `lt7911exc_dsi_host_attach` causes me=
mory leaks and list corruption.
- [High] Data race and hardware state corruption due to lockless access in =
DRM atomic hooks.
- [High] Use-After-Free (UAF) due to sysfs attribute lifetime extending pas=
t driver removal.
- [Medium] Concurrency flaw in `lt7911exc_firmware_store` blocks sysfs writ=
ers and causes redundant upgrades.
--

commit aa1e91d28c6a1d1b9faea6c1c05acd8d8780f392
Author: Sunyun Yang <syyang@lontium.com>

drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge

Add support for the Lontium LT7911EXC bridge chip, which converts eDP input
to MIPI DSI output using an internal firmware-controlled pipeline.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm=
/bridge/lontium-lt7911exc.c
> new file mode 100644
> index 0000000000000..e94188e7987ab
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c

[ ... ]

> +static void lt7911exc_firmware_upgrade_work(struct work_struct *work)
> +{
> +	struct lt7911exc *lt7911exc =3D container_of(work, struct lt7911exc, wo=
rk);
> +	struct device *dev =3D lt7911exc->dev;
> +	const struct firmware *fw;
> +	u8 *buffer;
> +	size_t total_size =3D FW_SIZE - 4;
> +	u32 crc32;
> +	int ret;
> +
> +	ret =3D request_firmware(&fw, FW_FILE, dev);
> +	if (ret) {
> +		dev_err(dev, "failed to load '%s'\n", FW_FILE);
> +		goto out_status_only;
> +	}
> +
> +	if (fw->size > total_size) {
> +		dev_err(dev, "firmware too large (%zu > %zu)\n", fw->size, total_size);
> +		goto out_release_fw;
> +	}
> +
> +	buffer =3D kmalloc(total_size, GFP_KERNEL);
> +	if (!buffer) {
> +		ret =3D -ENOMEM;
> +		goto out_release_fw;
> +	}

Will jumping to out_release_fw leave the upgrade flag permanently set?

If the firmware size is too large or kmalloc() fails, the code jumps to
out_release_fw, which calls release_firmware() and returns without clearing
lt7911exc->upgrade.

Since the flag remains set to true, all subsequent attempts to write to the
sysfs firmware attribute will fail with -EBUSY, and
lt7911exc_atomic_pre_enable() will silently return early without enabling t=
he
MIPI stream.

[ ... ]

> +out_release_fw:
> +	release_firmware(fw);
> +	return;
> +
> +out_status_only:
> +	mutex_lock(&lt7911exc->ocm_lock);
> +	lt7911exc->upgrade =3D false;
> +	mutex_unlock(&lt7911exc->ocm_lock);
> +}
> +
> +static void lt7911exc_atomic_pre_enable(struct drm_bridge *bridge, struc=
t drm_atomic_state *state)
> +{
> +	struct lt7911exc *lt7911exc =3D bridge_to_lt7911exc(bridge);
> +
> +	if (lt7911exc->upgrade)
> +		return;
> +
> +	//enable mipi stream
> +	regmap_write(lt7911exc->regmap, 0xe0b0, 0x01);
> +}

Can this unsynchronized check result in hardware state corruption?

This function checks lt7911exc->upgrade and proceeds to perform I2C
writes without holding ocm_lock. If a display modeset happens
concurrently with a firmware upgrade, the unsynchronized I2C write can
interleave with the firmware flashing sequence (for example, while the MCU
is halted or flash is being erased).=20

The same applies to lt7911exc_atomic_post_disable(). Both hooks likely need
to hold ocm_lock while checking the flag and performing the register access.

[ ... ]

> +static int lt7911exc_dsi_host_attach(struct mipi_dsi_host *host, struct =
mipi_dsi_device *dev)
> +{
> +	struct lt7911exc *lt7911exc =3D dsi_host_to_lt7911exc(host);
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret =3D drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel, &=
bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		bridge =3D drm_panel_bridge_add_typed(panel, DRM_MODE_CONNECTOR_DSI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	}
> +	lt7911exc->output.dev =3D dev;
> +	lt7911exc->output.bridge =3D bridge;
> +	lt7911exc->output.panel =3D panel;
> +
> +	drm_bridge_add(&lt7911exc->bridge);
> +	return 0;
> +}

Is an exclusivity check needed here to prevent memory leaks and list
corruption?

The function unconditionally allocates a new panel bridge via
drm_panel_bridge_add_typed() and calls drm_bridge_add(). If multiple
downstream DSI devices are attached, the previous panel bridge allocation
would be leaked.

Repeatedly calling drm_bridge_add() on the same bridge also re-initializes
its hpd_mutex, which destroys any existing lock state and imbalances the
bridge reference counts.

[ ... ]

> +static ssize_t lt7911exc_firmware_store(struct device *dev, struct devic=
e_attribute *attr,
> +					const char *buf, size_t len)
> +{
> +	struct lt7911exc *lt7911exc =3D dev_get_drvdata(dev);
> +
> +	mutex_lock(&lt7911exc->ocm_lock);
> +	if (lt7911exc->upgrade) {
> +		mutex_unlock(&lt7911exc->ocm_lock);
> +		return -EBUSY;
> +	}
> +
> +	lt7911exc->upgrade =3D true;
> +	mutex_unlock(&lt7911exc->ocm_lock);
> +
> +	schedule_work(&lt7911exc->work);
> +
> +	return len;
> +}

Could this concurrency approach block sysfs writers and cause redundant
upgrades?

The upgrade worker lt7911exc_firmware_upgrade_work() holds ocm_lock for
the entire duration of the firmware flash process. If userspace writes to
this attribute while an upgrade is running, the store function blocks on
mutex_lock() instead of immediately returning -EBUSY.

Once the running upgrade completes, the worker clears the upgrade flag and
releases the lock. The blocked sysfs writer will then acquire the lock, see
the flag is false, set it back to true, and queue a second, redundant
firmware upgrade.

[ ... ]

> +static void lt7911exc_remove(struct i2c_client *client)
> +{
> +	struct lt7911exc *lt7911exc =3D i2c_get_clientdata(client);
> +
> +	mipi_dsi_host_unregister(&lt7911exc->dsi_host);
> +	cancel_work_sync(&lt7911exc->work);
> +	gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
> +}

Does this leave a use-after-free window between driver removal and sysfs
group cleanup?

The lt7911exc_firmware sysfs attribute is registered via the driver's
dev_groups. The driver core removes these groups after this remove callback
returns.

Userspace can still write to the sysfs attribute after cancel_work_sync()
is executed here. If this occurs, lt7911exc_firmware_store() will
successfully call schedule_work() again. When the device's devres resources
are later freed, the workqueue will access the freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519105019.2262=
2-1-syyang@lontium.com?part=3D2
