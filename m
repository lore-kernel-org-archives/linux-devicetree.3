Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B278472
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 01:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673926; cv=none; b=AmCeEqTFZffOdjPvERcH8Y9yNGCe6rpztFSHQXM0qzV3nA3+mEC45WbADepia+fqQ17MvweTUXdQXzAtLnwhJsCWiLIdp8HZIG11f9RBKbrE1MfWqO98M4tzKZLeM7ahYxNi1p9kB8F9OPrieEstFJlpKW7hHs8GeRoEo+QJvcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673926; c=relaxed/simple;
	bh=nGyGahDPax1e9tUaMRoHqsg0B/l8ZG1A4qKqZNQUUK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pikAeBsNMvwsLlF4SVuL3sdcViSwSKNKuhHzY9y3fRnBShjcj+nijjbe5UbmToqtw/65VFjfULLqk/EgmOufRm0jT3q1Tu71C/9IjIxAex9INJOuVCHC3XFISQHsyxxfSfV2Pj9NvbqBKmI6SIUYz8GfVgd4weEBVYHhCnbyzMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHjC2/nO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHjC2/nO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DE61F000E9;
	Mon, 25 May 2026 01:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779673924;
	bh=K05Db2tlIovopMJWbbiTbkO6cg/ql8OSHAPpG0cmsfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DHjC2/nOLgUdM5P2NZE+2NuPvHRS8rC8uXQV1IxVFc8vQl8NW0fhk/8KMLkhbAv8l
	 c9HhNpREYd49mvitZShIWMOrql0bO4/EdNSpX2rkjeRlQjRRBZQylfmND2XRm0uFor
	 a2vniJ88hFox0hZ3JjQ3CPOT48dhYnjDH9r4Dkv3ZDAkFxvxDHqPMCuN/pVwevKR9w
	 cr7hx8ZpjvYRJqb9sCbDA3NCEf8oUGS/QmGYJT/JVSlqbdmWLOQGAQHtOpaUcirvb4
	 yYzTEv7pNRBmDhy2qTWPOVz41Z/DleXDPaiXhcBAm3fqK+GCByK+YPN15uShQoJOw1
	 DMMXbPvq9eCGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: syyang@lontium.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525010545.9470-3-syyang@lontium.com>
References: <20260525010545.9470-3-syyang@lontium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 01:52:03 +0000
Message-Id: <20260525015204.60DE61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Dangling pointer created during MIPI DSI host detach if the downst=
ream device is a bridge rather than a panel.
- [High] Firmware upgrade CRC mismatch due to unpadded partial page writes.
- [High] Firmware upgrade workqueue accesses `bridge.dev` without ensuring =
the DRM device is alive, leading to a Use-After-Free.
- [High] Regmap page selector cache desynchronization after device reset ca=
uses firmware upgrade commands to be routed to the wrong register page.
--

commit 43236ff612b99bc861cbbc490c9d4569107b4d46
Author: Sunyun Yang <syyang@lontium.com>
Subject: drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge

This commit adds support for the Lontium LT7911EXC bridge chip, which conve=
rts=20
eDP input to MIPI DSI output. It provides DRM bridge integration, MIPI DSI=
=20
host interfaces, I2C firmware upgrade mechanisms, and GPIO resets.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm=
/bridge/lontium-lt7911exc.c
> new file mode 100644
> index 0000000000000..de6953ed1e3b0
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
[ ... ]
> +static int lt7911exc_write_data(struct lt7911exc *lt7911exc, const struc=
t firmware *fw, u64 addr)
> +{
> +	struct device *dev =3D lt7911exc->dev;
> +	int ret;
> +	int page =3D 0, num =3D 0, page_len =3D 0;
> +	u64 size, offset;
> +	const u8 *data;
> +
> +	data =3D fw->data;
> +	size =3D fw->size;
> +	page =3D (size + LT_PAGE_SIZE - 1) / LT_PAGE_SIZE;
[ ... ]
> +	for (num =3D 0; num < page; num++) {
> +		offset =3D num * LT_PAGE_SIZE;
> +		page_len =3D (offset + LT_PAGE_SIZE <=3D size) ? LT_PAGE_SIZE : (size =
- offset);
> +		ret =3D lt7911exc_prog_init(lt7911exc, addr);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D regmap_raw_write(lt7911exc->regmap, 0xe05d, &data[offset], pag=
e_len);

[Severity: High]
The software CRC in lt7911exc_firmware_upgrade_work() is calculated over a
buffer padded with 0xff up to FW_SIZE - 4. However, this function writes the
original unpadded fw->data.

If fw->size is not a multiple of the 32-byte page size, does the short write
leave residual data in the hardware's internal page buffer? This could cause
a CRC mismatch and firmware upgrade failure since the padded bytes are
actually flashed. Should this function write the padded buffer instead?

[ ... ]
> +static void lt7911exc_firmware_upgrade_work(struct work_struct *work)
> +{
[ ... ]
> +	lt7911exc_reset(lt7911exc);
> +	mutex_lock(&lt7911exc->ocm_lock);
> +	lt7911exc_hw_mcu_halt(lt7911exc);

[Severity: High]
When lt7911exc_reset() asserts the reset GPIO, the physical hardware's page
control register is reset to 0x00.

Does the regmap cache know about this external reset? If not, regmap might
assume the hardware is already on page 0xe0 and omit the page control write
during lt7911exc_hw_mcu_halt().=20

Can this route commands to the wrong page and corrupt hardware state? Should
the regmap cache be synchronized or marked dirty after a reset?

[ ... ]
> +out_unlock:
> +	mutex_lock(&lt7911exc->ocm_lock);
> +	lt7911exc_hw_mcu_run(lt7911exc);
> +	lt7911exc->fw_version =3D lt7911exc_read_version(lt7911exc);
> +	mutex_unlock(&lt7911exc->ocm_lock);
> +
> +	mutex_unlock(&lt7911exc->upgrade_lock);
> +	/* Notify DRM framework that hardware state changed/needs a modeset */
> +	if (lt7911exc->bridge.dev)
> +		drm_kms_helper_hotplug_event(lt7911exc->bridge.dev);

[Severity: High]
Is it possible for lt7911exc->bridge.dev to be a dangling pointer here?

The DRM core does not clear bridge->dev on bridge detachment. Since the sys=
fs
attribute is tied to the I2C device (which remains bound), could a user
trigger a firmware upgrade after the KMS driver unbinds? This would lead to=
 a
use-after-free when drm_kms_helper_hotplug_event() executes.

[ ... ]
> +static int lt7911exc_dsi_host_detach(struct mipi_dsi_host *host, struct =
mipi_dsi_device *dev)
> +{
> +	struct lt7911exc *lt7911exc =3D dsi_host_to_lt7911exc(host);
> +
> +	if (!lt7911exc->output.dev)
> +		return 0;
> +
> +	if (lt7911exc->output.panel && lt7911exc->output.bridge) {
> +		drm_panel_bridge_remove(lt7911exc->output.bridge);
> +		lt7911exc->output.bridge =3D NULL;
> +		lt7911exc->output.panel =3D NULL;
> +	}
> +
> +	lt7911exc->output.dev =3D NULL;
> +
> +	return 0;
> +}

[Severity: High]
If the downstream device is a raw bridge instead of a panel, output.panel
will be NULL, causing this block to be skipped.

Does this leave output.bridge as a dangling pointer? If the bridge is freed
and the display pipeline is re-attached, lt7911exc_bridge_attach() might
dereference this stale pointer and cause a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525010545.9470=
-1-syyang@lontium.com?part=3D2
