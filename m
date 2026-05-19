Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E1140962B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201368; cv=none; b=NdOyEnMCQ8Q8XgAIrg3o/2iXtqN0sPig/PNhA53hZTajs1yi2SaZkSk1SOK/ADKyaa9ugKJEyOJTM9MBbuQ2AiHbmq+GMsfY9hnEpCXbFW/FhEghxSnLOoojkn6JgWjv6hIu+uKakmipdf9zLgt5QEiRzssUUSSDBTUcD2qBkqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201368; c=relaxed/simple;
	bh=R5GnTgj8YEJianthPLtah8pQF4Hlv5O4FBP6V5SScSw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fSb/BMFCZEQGBl9OF5uCK+aVwYunzEECy7ez747h9rfjd8croI5POvKysLqnjhRupG1ufBysZlg7GAH7KdcZV8LVf8tzteNhi5fOjp8hsg7CPOUWqTjcWYV5ftxGPLDOE82zJ9HN6CFjnOlh69wJDBP/6fH/r6NRlMWqObDg4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKtROcdD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKtROcdD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C421C2BCB3;
	Tue, 19 May 2026 14:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779201367;
	bh=R5GnTgj8YEJianthPLtah8pQF4Hlv5O4FBP6V5SScSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NKtROcdDgiwTx9gbtTcI/KW9J8CYwsEM+2kfXfd9ZR4n3LU5EPEMaWb62mWg0qcpW
	 qCJbo9e7ohS/4JQOsrbmOiaL04RYLv0IAjuZIbWncjtbfreCht/EF637TwzRTxz0t4
	 TRZS8EKzk2ZAy4HHSCmbZ0nWLp9VPQtnsg56tugH+m83rRQ99oibZOrr6iDJjFGaCq
	 gtOIoUT8L6GHFDW1RKI+IW8pYAQ6XMwFr322iiQbrnNDNKuw4GhbywrHfPATCfRztX
	 MiafJRVKdjwbcTseFLJOw/JvKbkzsfxLOd8YWiFsFVu67LxvN9979yqMvGZkWunToT
	 GsNIiLmM2pzcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: syyang@lontium.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519135816.26996-3-syyang@lontium.com>
References: <20260519135816.26996-3-syyang@lontium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 14:36:05 +0000
Message-Id: <20260519143607.6C421C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Hardware backpowering risk due to incorrect reset GPIO power seque=
ncing.
- [High] Use-After-Free vulnerability due to dynamic DRM bridge removal in =
DSI detach callback.
- [High] Use-After-Free of `regmap` during DRM teardown because firmware up=
grade worker defeats removal safeguard.
- [High] Firmware upgrade performs a hardware reset, causing silent loss of=
 DRM state and a blank screen.
- [High] Extended mutex hold during firmware upgrade stalls DRM atomic comm=
its for multiple seconds.
- [Medium] Spurious panel initialization failures due to `mutex_trylock` in=
 DSI transfer.
- [Medium] Use of `kmalloc` for a 64KB software buffer is susceptible to me=
mory fragmentation failures.
- [Medium] MIPI DSI host fakes successful transfers, breaking the panel ini=
tialization contract.
- [Medium] Introduction of a custom sysfs attribute for firmware flashing c=
reates non-standard ABI.
--

commit 26f664545bed69c339feae8f2d3005edbcb54627
Author: Sunyun Yang <syyang@lontium.com>
Subject: drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge

Add support for the Lontium LT7911EXC eDP to MIPI DSI bridge chip. The
driver includes integration for eDP-to-DSI routing, a MIPI DSI host
interface, firmware upgrade via I2C, and GPIO/regulator management. Display
timing and DSI packet generation are managed by internal firmware.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm=
/bridge/lontium-lt7911exc.c
> new file mode 100644
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
> +		goto out_clear_status;
> +	}
> +
> +	if (fw->size > total_size) {
> +		dev_err(dev, "firmware too large (%zu > %zu)\n", fw->size, total_size);
> +		goto out_release_fw;
> +	}
> +
> +	buffer =3D kmalloc(total_size, GFP_KERNEL);

Does this risk memory fragmentation failures? Allocating a 64KB buffer with
kmalloc requires a contiguous order-4 physical allocation, which might fail
with -ENOMEM on a fragmented system. Since this buffer is only used in
software for CRC computation and padding, and is not mapped for DMA, could
this use kvmalloc instead?

> +	if (!buffer) {
> +		ret =3D -ENOMEM;
> +		goto out_release_fw;
> +	}
> +
> +	memset(buffer, 0xff, total_size);
> +	memcpy(buffer, fw->data, fw->size);
> +	crc32 =3D cal_crc32_custom(buffer, total_size);
> +	kfree(buffer);
> +
> +	mutex_lock(&lt7911exc->ocm_lock);

Could this prolonged mutex hold stall DRM atomic commits? The firmware
upgrade sequence holds ocm_lock for multiple seconds while performing flash
erase, a 64KB I2C write, and verification.

Meanwhile, lt7911exc_atomic_pre_enable() and lt7911exc_atomic_post_disable()
use a blocking mutex_lock on the same lock. Any DRM display commit or
teardown occurring during a firmware upgrade might stall for seconds
waiting for this lock.

> +
> +	lt7911exc_reset(lt7911exc);

Will this hardware reset cause a silent loss of DRM state?

The physical chip reset wipes out volatile registers, including the MIPI
stream enable bit configured by lt7911exc_atomic_pre_enable(). After the
upgrade completes, the driver unlocks the mutex without restoring the prior
hardware state or queuing a DRM modeset.

If the display was active during the upgrade, could the screen stay blank
indefinitely while the kernel DRM state still considers the bridge fully
active?

[ ... ]

> +	ret =3D lt7911exc_upgrade_result(lt7911exc, crc32);
> +	if (ret)
> +		dev_err(dev, "firmware verification failed\n");
> +
> +out_unlock:
> +	lt7911exc_hw_mcu_run(lt7911exc);
> +	lt7911exc->fw_version =3D lt7911exc_read_version(lt7911exc);
> +	mutex_unlock(&lt7911exc->ocm_lock);
> +
> +out_release_fw:
> +	release_firmware(fw);
> +
> +out_clear_status:
> +	mutex_lock(&lt7911exc->ocm_lock);
> +	lt7911exc->upgrade =3D false;

Is there a risk of a use-after-free here during module removal?

In lt7911exc_remove(), the driver sets lt7911exc->upgrade =3D true to block
hardware access from late DRM callbacks, then calls cancel_work_sync(). If
the firmware upgrade worker is running, remove() blocks waiting for it.

However, when the worker finishes, it unconditionally sets upgrade =3D fals=
e.
This leaves the upgrade flag as false after remove() completes. When devres
frees the device memory and regmap, could a delayed DRM atomic disable see
that upgrade is false and attempt to call regmap_write, resulting in a
use-after-free?

> +	mutex_unlock(&lt7911exc->ocm_lock);
> +}

[ ... ]

> +static int lt7911exc_dsi_host_detach(struct mipi_dsi_host *host, struct =
mipi_dsi_device *dev)
> +{
> +	struct lt7911exc *lt7911exc =3D dsi_host_to_lt7911exc(host);
> +
> +	if (!lt7911exc->output.dev)
> +		return 0;
> +
> +	drm_bridge_remove(&lt7911exc->bridge);
> +	if (lt7911exc->output.panel)
> +		drm_panel_bridge_remove(lt7911exc->output.bridge);

Does removing the bridge here introduce a use-after-free vulnerability?

When the downstream DSI panel unbinds, drm_panel_bridge_remove() frees the
panel bridge memory via devres. However, if the upstream DRM encoder has
already attached to this bridge, the bridge remains linked in the encoder's
bridge_chain.

Subsequent DRM operations like atomic commits or teardowns will traverse
the chain and dereference the freed panel bridge structure. Should
drm_bridge_add() and panel bridge creation happen in probe() instead?

> +
> +	lt7911exc->output.dev =3D NULL;
> +	lt7911exc->output.bridge =3D NULL;
> +	lt7911exc->output.panel =3D NULL;
> +
> +	return 0;
> +}
> +
> +/*
> + * The internal firmware controls the panel initialization
> + * sequence and handles all MIPI DSI command transmission.
> + */
> +static ssize_t lt7911exc_dsi_host_transfer(struct mipi_dsi_host *host,
> +					   const struct mipi_dsi_msg *msg)
> +{
> +	struct lt7911exc *lt7911exc =3D dsi_host_to_lt7911exc(host);
> +
> +	if (msg->rx_len) {
> +		dev_warn(lt7911exc->dev, "MIPI DSI read is not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	switch (msg->type) {
> +	case MIPI_DSI_DCS_SHORT_WRITE:
> +	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> +	case MIPI_DSI_DCS_LONG_WRITE:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> +	case MIPI_DSI_GENERIC_LONG_WRITE:
> +	break;
> +	default:
> +	return -EOPNOTSUPP;
> +	}
> +
> +	if (!mutex_trylock(&lt7911exc->ocm_lock))
> +		return -EBUSY;

Can this trylock cause spurious panel initialization failures?

The ocm_lock is also acquired for short durations by fast-path operations
like lt7911exc_firmware_show() and lt7911exc_atomic_pre_enable(). If a
panel driver sends a DCS initialization command exactly when a user reads
the sysfs firmware version, mutex_trylock will fail.

Since panel drivers typically do not retry DCS commands, could this race
abort panel initialization and result in a dead display?

> +
> +	if (lt7911exc->upgrade) {
> +		mutex_unlock(&lt7911exc->ocm_lock);
> +		return -EBUSY;
> +	}
> +	mutex_unlock(&lt7911exc->ocm_lock);
> +
> +	return msg->tx_len;

Does faking successful transfers break the panel initialization contract?

This returns msg->tx_len for write commands without actually transmitting
any data to the hardware. Downstream panel drivers might send DCS
initialization commands expecting them to reach the panel, so faking
success means the kernel state and panel state diverge.

While the firmware handles panel init autonomously, could silently dropping
commands mask compatibility issues with panels that require specific
software sequences?

> +}

[ ... ]

> +static ssize_t lt7911exc_firmware_store(struct device *dev, struct devic=
e_attribute *attr,
> +					const char *buf, size_t len)

Does the introduction of this custom sysfs attribute create a non-standard
ABI? The driver adds a custom lt7911exc_firmware sysfs file to trigger
firmware updates, which bypasses standard kernel frameworks. Would it be
better to use standardized interfaces like devlink or the standard firmware
loader during probe or initialization instead of creating a custom
user-space ABI?

> +{
> +	struct lt7911exc *lt7911exc =3D dev_get_drvdata(dev);

[ ... ]

> +static int lt7911exc_probe(struct i2c_client *client)
> +{
> +	struct lt7911exc *lt7911exc;
> +	struct device *dev =3D &client->dev;
> +	struct device_node *np =3D dev->of_node;
> +	int ret;
> +
> +	if (!np)
> +		return -ENODEV;

[ ... ]

> +	/*
> +	 * reset GPIO is defined as active low in device tree.
> +	 * gpiod_set_value_cansleep() uses logical value:
> +	 * 1 -> asserted (active)  -> physical low  -> reset enabled -> chip st=
op
> +	 * 0 -> deasserted (inactive) -> physical high -> reset released -> chi=
p run
> +	 */
> +	lt7911exc->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(lt7911exc->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(lt7911exc->reset_gpio),
> +				     "failed to acquire reset gpio\n");
> +
> +	ret =3D lt7911exc_regulator_enable(lt7911exc);

Is there a hardware backpowering risk due to this reset GPIO power
sequencing?

Here devm_gpiod_get() initializes the reset GPIO to a logical 0. Because
the GPIO is defined as active-low in the device tree, this logical 0
translates to a physical HIGH level. This occurs before the vcc and vdd
regulators are enabled.

Driving a HIGH logic level into an unpowered IC forces current through its
internal ESD protection diodes into the unpowered rails, which risks
latch-up and permanent hardware damage. Should the regulators be enabled
before requesting the GPIO, or should the GPIO be requested with
GPIOD_OUT_HIGH (physical LOW) instead?

> +	if (ret)
> +		return ret;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519135816.2699=
6-1-syyang@lontium.com?part=3D2
