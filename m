Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806C830674D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 01:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780103645; cv=none; b=cV1dKiQ4QF9tJZ+q1qsuzsHJwglnXCkNf5UhP9LK7x3BnS5ePHycdRL/+pdwdErGHDlgrQlOuhIQ0t/H7Bx0sFSNy+5FsSnq5a2GDitrZwKA5ceuwGXmTd3FIHZ0ZZ08tiBzSt537NL4OkWl5r0U+Bf+COsVqz68aQeWE/2+bAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780103645; c=relaxed/simple;
	bh=yDFaWWINWk9XI5X140QPDJZDnug3N+qh+QQt3whYLL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J77SpJeuhTcE+GnygdMnqXbEJ4laVr/Y3UscY4P+r5J62zmYvuuwCvuCxELuwyM8orwXGLbEQZj3IUCWRwlNiDTtA1Q4zcGj5/bsLsgW5UDIGE0J9ng+1JreiEIthwFuaRJbOIqzWLrrHEZ4eWDXbcnP2kutQW2sSyXj4ajM4dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFwp6m3H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFwp6m3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0E11F00893;
	Sat, 30 May 2026 01:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780103644;
	bh=8gtnooibfgvsdEBYXfr1GLnsHNQF7Ph/RbIYsB9JTEs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BFwp6m3HMY4RkqIu2kF/L3mMRFiCTh+qOo9WZ0nWqwsabpomXzoqHfBWBMeOQdqme
	 Z7Y0IwhduqVsnf6/HHWfDlNPuavlvfySGxtwMQshiy019cRi6l8PArTAhBfbazxBZO
	 NC4l5uhEyEU257oROeycQ9koz+A4zeQTObzN8rDLaCwQ+6QXImJvLlzYxjlArZTNTB
	 e+eFefSqsroU204mjK+qWMyHRu+HgLYW/Y55eDu5fuI/MF/RKemRuHIIxAsTIn6uf3
	 MMuLzBIzv08FanqNhE2j7pYTmZWxzrXMFBFjZIvGB1byH2ZMJhBrnnnO7MDyhG/lmU
	 IiIvTPaaPIBGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: syyang@lontium.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529112928.873766-3-syyang@lontium.com>
References: <20260529112928.873766-3-syyang@lontium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 01:14:03 +0000
Message-Id: <20260530011403.EE0E11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Using devm_drm_panel_bridge_add_typed() in the DSI host attach cal=
lback leaks memory and leaves dangling pointers when the downstream panel u=
nbinds.
- [High] Potential use-after-free of the drm_device pointer in the firmware=
 upgrade worker when the DRM display driver is unloaded.
- [High] Using stack buffers for I2C regmap bulk reads violates DMA mapping=
 rules and can cause memory corruption.
--

commit a175e14df601fd080297e05f4671c7c7284dc3f0
Author: Sunyun Yang <syyang@lontium.com>

drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge

Add support for the Lontium LT7911EXC bridge chip, which converts
eDP input to MIPI DSI output using an internal firmware-controlled
pipeline.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm=
/bridge/lontium-lt7911exc.c
> new file mode 100644
> index 0000000000000..f7cd89bcc8119
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
[ ... ]
> +static int lt7911exc_read_version(struct lt7911exc *lt7911exc)
> +{
> +	struct device *dev =3D lt7911exc->dev;
> +	u8 buf[3];
> +	int ret;
> +
> +	ret =3D regmap_write(lt7911exc->regmap, LT7911EXC_PAGE_CONTROL, 0xe0);
> +	if (ret) {
> +		dev_err(dev, "Failed to switch to page 0xe0\n");
> +		return ret;
> +	}
> +
> +	/* no need to halt MCU for this register access */
> +	ret =3D regmap_bulk_read(lt7911exc->regmap, 0x81, buf, ARRAY_SIZE(buf));

[Severity: High]
Can using a stack buffer for I2C regmap bulk reads cause memory corruption?

If the underlying I2C adapter uses DMA, the DMA API will attempt to map this
stack memory. The kernel forbids doing DMA on stack variables as it can sha=
re
cache lines with other data, resulting in memory corruption.

Should buf be dynamically allocated?

[ ... ]
> +static int lt7911exc_upgrade_result(struct lt7911exc *lt7911exc, u32 crc=
32)
> +{
> +	struct device *dev =3D lt7911exc->dev;
> +	u32 read_hw_crc =3D 0;
> +	u8 crc_tmp[4];
> +	int ret;
> +
> +	ret =3D regmap_write(lt7911exc->regmap, LT7911EXC_PAGE_CONTROL, 0xe0);
> +	if (ret) {
> +		dev_err(dev, "Failed to switch to page 0xe0 in prog_init: %d\n", ret);
> +		return ret;
> +	}
> +	ret =3D regmap_write(lt7911exc->regmap, 0xee, 0x01);
> +	if (ret)
> +		return ret;
> +	ret =3D regmap_write(lt7911exc->regmap, 0x7b, 0x60);
> +	if (ret)
> +		return ret;
> +	ret =3D regmap_write(lt7911exc->regmap, 0x7b, 0x40);
> +	if (ret)
> +		return ret;
> +
> +	msleep(150);
> +
> +	ret =3D regmap_bulk_read(lt7911exc->regmap, 0x22, crc_tmp, ARRAY_SIZE(c=
rc_tmp));

[Severity: High]
Can this stack buffer also cause memory corruption if the I2C adapter uses =
DMA?
It looks like crc_tmp should be dynamically allocated as well.

[ ... ]
> +static void lt7911exc_firmware_upgrade_work(struct work_struct *work)
> +{
> +	struct lt7911exc *lt7911exc =3D container_of(work, struct lt7911exc, wo=
rk);
> +	struct device *dev =3D lt7911exc->dev;
> +	const struct firmware *fw;
> +	struct drm_device *drm_dev =3D NULL;
[ ... ]
> +	mutex_lock(&lt7911exc->ocm_lock);
> +	lt7911exc_hw_mcu_run(lt7911exc);
> +	lt7911exc->fw_version =3D lt7911exc_read_version(lt7911exc);
> +	if (lt7911exc->bridge.dev)
> +		drm_dev =3D lt7911exc->bridge.dev;
> +
> +	mutex_unlock(&lt7911exc->ocm_lock);
> +
> +	/* Notify DRM framework that hardware state changed/needs a modeset */
> +	if (drm_dev)
> +		drm_kms_helper_hotplug_event(drm_dev);

[Severity: High]
Can this sequence lead to a use-after-free of the drm_dev pointer?

The drm_dev pointer is extracted under ocm_lock, but the lock is released
before calling drm_kms_helper_hotplug_event(drm_dev) without taking a refer=
ence.
If the main DRM display driver is unbound concurrently right after the lock=
 is
released, the drm_device could be destroyed before this worker finishes.

Should the worker acquire a reference with drm_dev_get() under the lock and
drop it after the hotplug event?

[ ... ]
> +static int lt7911exc_dsi_host_attach(struct mipi_dsi_host *host, struct =
mipi_dsi_device *dev)
> +{
> +	struct lt7911exc *lt7911exc =3D dsi_host_to_lt7911exc(host);
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	if (lt7911exc->output.dev)
> +		return -EBUSY;
> +
> +	ret =3D drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel, &=
bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		bridge =3D devm_drm_panel_bridge_add_typed(lt7911exc->dev, panel,
> +							 DRM_MODE_CONNECTOR_DSI);

[Severity: High]
Does this devm allocation cause a memory leak when the downstream panel unb=
inds?

The allocated bridge is tied to the lifetime of the host device rather than=
 the
panel. If the panel driver is unbound, lt7911exc_dsi_host_detach() clears t=
he
local pointer, but the bridge remains registered and the memory is not free=
d.
If the panel binds again, a new bridge is allocated.

Should this use drm_panel_bridge_add_typed() instead?

> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	}
> +	lt7911exc->output.dev =3D dev;
> +	lt7911exc->output.bridge =3D bridge;
> +	lt7911exc->output.panel =3D panel;
> +
> +	return 0;
> +}
> +
> +static int lt7911exc_dsi_host_detach(struct mipi_dsi_host *host, struct =
mipi_dsi_device *dev)
> +{
> +	struct lt7911exc *lt7911exc =3D dsi_host_to_lt7911exc(host);
> +
> +	if (!lt7911exc->output.dev)
> +		return 0;
> +
> +	lt7911exc->output.bridge =3D NULL;

[Severity: High]
Should this explicitly remove the bridge if it is allocated in attach?

Currently this clears the pointer but leaves the bridge registered in the D=
RM
core's global bridge list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529112928.8737=
66-1-syyang@lontium.com?part=3D2
