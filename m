Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B4A2F260C
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789249872; cv=none; b=fR099Dpm5YWCqOtYs7VFSvqp9qlLx5AkG16NYyBmU0ZGbastMOJCHcijIpVKpstFLUBLPH+JZggqtZ+lBDnODcyMbKWAYdy4NEgNcuxn6D/1d5Rr+vd8u+5LDoXOcp/nMNNhx97fs939fV1Dyxsitkk8HzowLBpBs+cLdLVUhB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789249872; c=relaxed/simple;
	bh=rbT75H1lsy1RaCAet2cgoLZm6xWlqwLvTKYvj+QQlTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GXnwItntdp00KBynih3UG9hNdckAnVST1YdP4Ec5vw5G69buHVXH9EcsvISCTvWOpPgfVJn0VZDFEFjJmNQ+mPtxoiEwjCIzZZXvRkYDdaKkQ+Ud3intfyaDqDldmWtEV10nnqr3/FX6srL/xMUpNO+Fe+N2BoqQoVjtgB0PPNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+KumAr9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+KumAr9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BDF1F000FF;
	Sat, 12 Sep 2026 21:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789249870;
	bh=9jrO3ISx16DPzQFK9jfhtyUZGNd29MvajPGtBZs8QZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i+KumAr9aO5hw94gUoQIvvpojPVlV68MAqmqZR3B9iWrBptQsr3tYKg/yLcyceLRD
	 PeDfVmqQEa4dLS2JCtxgH+39VIHaK8hJic6+J80pN7zZh6ryrNviGlwgNfQ3BSNTlE
	 o2F79oZCYFk97AsKdBq10+/eeOb/Xdwhvh1qyg2SrFtkS0Iw50HLJMOK5y+tzApJov
	 UgsyLk0rCFh8HeciWjd8BGiBTw/Ph0e4IiekyT0Na9uNXl8vJ0eq+NEAxNccRtrqob
	 qqUEtYIkbTAZRIe/UJP/YaiUaO74Ip+ebwSgLQ0lToW5KMDHik+oA0MgiMIE3RY5Sd
	 v3iuyTVctP2gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI
 DSI to HDMI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: mohit.dsor@oss.qualcomm.com
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260913-lt9611c-v7-v14-2-534b43a07662@oss.qualcomm.com>
References: <20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com>
 <20260913-lt9611c-v7-v14-2-534b43a07662@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 21:51:09 +0000
Message-Id: <20260912215110.11BDF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The driver fails to invoke the DRM HDMI state helper to flush info=
frames to the hardware during a modeset.
- [High] Missing polling for flash page program completion before writing t=
he next page.
- [High] Hardware reset causes silent desynchronization of the regmap page =
selector cache, leading to corrupt I2C accesses.
- [High] Incorrect interrupt clear sequence inadvertently asserts clear sig=
nals for other pending interrupts.
- [Medium] The bridge driver completely omits an `atomic_disable` (or `disa=
ble`) callback, preventing the hardware from being powered down during DPMS=
 off.
- [Low] Data race when accessing `lt9611c->fw_version` concurrently.
--

commit 00cae86a0097b37f64f26f28bf0a922224a6461d
Author: Sunyun Yang <syyang@lontium.com>

drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

This commit introduces a DRM bridge driver for the Lontium LT9611C(EX/UXD)
MIPI DSI to HDMI converter chips. The driver supports single or dual MIPI D=
SI
inputs, I2S/SPDIF audio, and handles HDMI infoframes alongside I2C-based
firmware flashing and power management.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/b=
ridge/lontium-lt9611c.c
> new file mode 100644
> index 0000000000000..fbd6209287998
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
[ ... ]
> +static int lt9611c_write_data(struct lt9611c *lt9611c, const struct firm=
ware *fw, size_t addr)
> +{
[ ... ]
> +		for (unsigned int i =3D 0; i < LT_PAGE_SIZE; i++) {
> +			size_t index =3D num * LT_PAGE_SIZE + i;
> +			u8 value =3D (index < size) ? data[index] : 0xff;
> +			int ret;
> +
> +			ret =3D regmap_write(lt9611c->regmap, 0xe059, value);
> +			if (ret < 0) {
> +				dev_err(dev, "write error at page %u, index %u\n", num, i);
> +				return ret;
> +			}
> +		}
> +
> +		lt9611c_wren(lt9611c);
> +		lt9611c_sram_to_flash(lt9611c, addr);
> +
> +		addr +=3D LT_PAGE_SIZE;
> +	}
> +
> +	lt9611c_wrdi(lt9611c);

[Severity: High]
Does this sequence overwrite the SRAM buffer over I2C while the internal SPI
flash controller is still programming the previous page? It appears there i=
s no
delay or polling for the flash program command to complete before looping b=
ack
to write the next page's data to SRAM, which might silently corrupt the fla=
shed
firmware.

[ ... ]
> +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
> +{
[ ... ]
> +	ret =3D lt9611c_write_data(lt9611c, fw, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write firmware data\n");
> +		goto out_unlock;
> +	}
> +
> +	ret =3D lt9611c_write_crc(lt9611c, fw_crc, FW_SIZE - 1);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write firmware crc\n");
> +		goto out_unlock;
> +	}
> +
> +	lt9611c_reset(lt9611c);
> +	ret =3D lt9611c_upgrade_result(lt9611c, fw_crc);

[Severity: High]
Could the hard reset immediately following the CRC flash write command abor=
t the
final write while it is still in-flight? Polling for completion before rese=
tting
might be necessary here as well.

[ ... ]
> +static void lt9611c_reset(struct lt9611c *lt9611c)
> +{
> +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> +	usleep_range(10000, 12000);
> +
> +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> +	msleep(400);
> +}

[Severity: High]
Will the physical reset clear the chip's internal page register back to 0
without updating the regmap cache? Regmap's internal cache of the page
selector could become desynchronized, causing subsequent register accesses =
to
skip setting the page if it matches the cached value, but occurring on the
wrong hardware page. This would affect accesses in probe, firmware_upgrade,
and bridge_resume.

[ ... ]
> +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_id)
> +{
[ ... ]
> +	if (!(irq_status & BIT(0)))
> +		return IRQ_NONE;
> +
> +	/* Clear interrupt: hardware requires two writes with delay */
> +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & BIT(0));
> +	usleep_range(10000, 12000);
> +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & (~BIT(0)));

[Severity: High]
Is the second regmap_write unintentionally asserting clear signals for other
pending interrupts? If other interrupts are pending (for example, BIT(1) is=
 set
in irq_status), irq_status & (~BIT(0)) will write a 1 to those bits in the
clear register. This might permanently assert their clear signals without e=
ver
deasserting them.

[ ... ]
> +static void lt9611c_bridge_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_atomic_commit *state)
> +{
[ ... ]
> +	mode =3D &crtc_state->adjusted_mode;
> +
> +	lt9611c_video_setup(lt9611c, mode);
> +}

[Severity: High]
Should this enable path invoke drm_atomic_helper_connector_hdmi_update_info=
frames
to flush the infoframes to the hardware? Without this call, it seems the
registered infoframe callbacks are never triggered, preventing AVI and other
infoframes from being transmitted during a modeset.

[ ... ]
> +static const struct drm_bridge_funcs lt9611c_bridge_funcs =3D {
> +	.attach =3D lt9611c_bridge_attach,
> +	.detect =3D lt9611c_bridge_detect,
> +	.edid_read =3D lt9611c_bridge_edid_read,
> +	.atomic_enable =3D lt9611c_bridge_atomic_enable,
> +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +	.atomic_create_state =3D drm_atomic_helper_bridge_create_state,

[Severity: Medium]
Is the omission of an atomic_disable (or disable) callback intentional? It
appears this leaves the bridge permanently active and internal PHYs powered
even when the display pipeline is blanked or during DPMS off.

[ ... ]
> +static ssize_t firmware_store(struct device *dev, struct device_attribut=
e *attr,
> +				      const char *buf, size_t len)
> +{
[ ... ]
> +	lt9611c_lock(lt9611c);
> +	lt9611c->fw_version =3D lt9611c_read_version(lt9611c);
> +	lt9611c_unlock(lt9611c);
[ ... ]
> +	return len;
> +}
> +
> +static ssize_t firmware_show(struct device *dev, struct device_attribute=
 *attr, char *buf)
> +{
> +	struct lt9611c *lt9611c =3D dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "0x%04x\n", lt9611c->fw_version);
> +}

[Severity: Low]
Could this result in a data race on lt9611c->fw_version? The variable is wr=
itten
under lt9611c_lock in firmware_store(), but it is read here in firmware_sho=
w()
without any locking.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-lt9611c-v7=
-v14-0-534b43a07662@oss.qualcomm.com?part=3D2
