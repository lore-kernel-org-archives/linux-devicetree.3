Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.52.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973985;
	b=yczPJWIrlEFoD9NN+eoiCQnBabCnYAJaqAH+a9I4VcrjEh6aywaiXDkAHp9l4xHJxih2
	 7xPiB9b8ZsAQ+iqdzd+f/3BYaz+1Vzq9EQzBM0xmyX2YxMW6Abq2IvPhJRpg8WAzXNLxS
	 SNGPRvXbctwr7V8pim+LCAhoP7ZejTprHSttvqNQ5NRM5FuS319mJByoLKPbISqsl7y2B
	 Uh4I/DV5ow2DFwxwbxPmoPPq8+55ELIz5y5TmB+QCEeBZROkUOsqUMdSlcAOU+c/UHXnR
	 Zdc7gxUsrnEhqRacL4ZzUqOyNfR9f+XeojwflrNq1Oodzeivw8ZZOdKQIJFbdKsFsIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973985;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=FFbYvwJylowvATKKMyhGAeQ1YJ7gYnu+kU9DLvDCkGU=;
	b=M0pNAzdI5LVsziF57VnXseg9/Tuh0Ha6ZQaIebt/Yc+poYSqVHpI+JHb6IvDg4eL2qaf
	 QEWYYulaypOoipZCIvVGshvtXnxwBBApbdm/rZgnmri524fia4MbQU777OeghWUfAJ5Oe
	 ydC/dK2+GhtniKEshVIG+rw6k4k6ysNZLJpcefgnWvSZzwOOLC8zuNHSFcq/eu27fBwsV
	 +oTx2DZ7Gw3lep+TU6ic8v7wTzi7wRlMnTY/EupHIQdWS0YPeHGKK/Pj2noL6gr5cMd7v
	 NDSpCI06b578D1Zw6THdJCHCFk5Z7IHVZrxNB/cBOVFFPwRmt7xa4bayhB6ZhEvp1BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=QQB35mp6;
	arc=none smtp.remote-ip=160.236.52.227
Received: from mail-m16023652227.xmail.ntesmail.com (mail-m16023652227.xmail.ntesmail.com [160.236.52.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D72A606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D72A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=QQB35mp6
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5513be7dc;
	Wed, 18 Nov 2026 11:52:51 +0800 (GMT+08:00)
Message-ID: <538ff4a1-b50a-47a7-a3ba-ecb0ec3c0666@rock-chips.com>
Date: Wed, 18 Nov 2026 11:52:49 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/cix: add Sky1 DisplayPort transmitter driver
To: Luo Liu <Luo.Liu@cixtech.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, wuyi.shen@cixtech.com,
 cix-kernel-upstream@cixtech.com
References: <20261117064552.85256-1-Luo.Liu@cixtech.com>
 <20261117064552.85256-3-Luo.Liu@cixtech.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261117064552.85256-3-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1ecc934f703a7kunm9194bfba6181c2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGE8dVkIdT0pOSElMHkIZHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QQB35mp6g1xmfPP/VDFMCjMHDqFzBueNW5lapXcf3/g5KiCtGSKyvReiiy14o+WgE8AKKqTjLONDA4iB7Cx7spGwOQv0C7EVygQxsmB9k9wqZgL+dZAiK7RefKI4Ggt9GcOKQScujqOUWDBJFCvxkq8LJLQjPgBiFmQibnvk1M0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=FFbYvwJylowvATKKMyhGAeQ1YJ7gYnu+kU9DLvDCkGU=;
	h=date:mime-version:subject:message-id:from;

Hi,

On 11/17/2026 2:45 PM, Luo Liu wrote:
> Add a DRM bridge driver for the CIX Sky1 DisplayPort transmitter. The
> controller implements the DP link training and the source side of the
> DisplayPort protocol, and is fed by one of the SoC display pipelines.
> 
> The transmitter is exposed as a DRM bridge. The Komeda display pipeline
> (ARM Mali DPU on Sky1) that feeds these outputs is not part of this
> series. Komeda calls drm_bridge_attach() with attach flags 0 and does
> not register a connector, so this driver registers a DisplayPort
> drm_connector from .attach(). That matches how Sky1 is integrated today
> and gives userspace a connector on the encoder.
> 
> The connector reads EDID, validates modes against link bandwidth,
> supports YCbCr 4:2:0 and signals hotplug through
> drm_helper_hpd_irq_event().
> 
> The DisplayPort PHY is driven through the generic PHY API: link-rate and
> voltage-swing updates are forwarded to the PHY and the link is retrained
> when the sink requests it. Audio and DSC are not supported yet.
> 
> Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
> ---
>  MAINTAINERS                             |    1 +
>  drivers/gpu/drm/Kconfig                 |    1 +
>  drivers/gpu/drm/Makefile                |    1 +
>  drivers/gpu/drm/cix/Kconfig             |    3 +
>  drivers/gpu/drm/cix/Makefile            |    3 +
>  drivers/gpu/drm/cix/dptx/Kconfig        |   17 +
>  drivers/gpu/drm/cix/dptx/Makefile       |    4 +
>  drivers/gpu/drm/cix/dptx/cix_dptx.c     | 2434 +++++++++++++++++++++++
>  drivers/gpu/drm/cix/dptx/cix_dptx.h     |  408 ++++
>  drivers/gpu/drm/cix/dptx/cix_dptx_drm.c |  771 +++++++
>  drivers/gpu/drm/cix/dptx/cix_dptx_drm.h |   16 +
>  11 files changed, 3659 insertions(+)
>  create mode 100644 drivers/gpu/drm/cix/Kconfig
>  create mode 100644 drivers/gpu/drm/cix/Makefile
>  create mode 100644 drivers/gpu/drm/cix/dptx/Kconfig
>  create mode 100644 drivers/gpu/drm/cix/dptx/Makefile
>  create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx.c
>  create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx.h
>  create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx_drm.c
>  create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx_drm.h

This patch is too large. At least consider splitting it into two parts: 
cix_dptx_drm.c and cix_dptx.c.

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e3557e931c94..3cc8c8865793 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6529,6 +6529,7 @@ R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> +F:	drivers/gpu/drm/cix/dptx/
> +
> +/*

[...]

> +/*
> + * USB-C combo PHY only. Its HPD pin is not wired to this controller, so a
> + * sink that was plugged in before the connector existed never raises
> + * HPD_EVENT. Replay that plug once the PHY is already in DP mode and AUX
> + * answers.
> + *
> + * A native DP port wires HPD to the controller and leaves the PHY mode at
> + * PHY_MODE_INVALID, so the checks below skip it. That port is reported by
> + * the HPD interrupt instead.
> + */
> +static void cix_dp_replay_deferred_hotplug(struct cix_dp *dp)
> +{
> +	struct phy *phy = dp->phy;
> +	union phy_configure_opts opts = { 0 };
> +	u8 dpcd_rev;
> +	ssize_t ret;
> +	bool hpd;
> +
> +	cix_dp_session_lock(dp);
> +	if (!cix_dp_regs_accessible(dp) ||
> +	    dp->force_hpd != connector_status_unknown) {
> +		cix_dp_session_unlock(dp);
> +		return;
> +	}
> +	hpd = cix_dp_get_hpd_state(dp);
> +	cix_dp_session_unlock(dp);
> +	if (hpd) {
> +		/*
> +		 * Native HPD may have fired before the connector existed.
> +		 * Read the DPCD from the work now that it does.
> +		 */
> +		schedule_delayed_work(&dp->hpd_event_work, 0);
> +		return;
> +	}
> +
> +	phy_validate(phy, PHY_MODE_DP, 0, &opts);
> +	if (phy_get_mode(phy) != PHY_MODE_DP)
> +		return;
> +
> +	/*
> +	 * The combo PHY is already muxed to DP, so the sink may have been
> +	 * plugged in before the connector existed. HPD is unwired here, so
> +	 * admit this one AUX transaction before force_hpd is set.
> +	 */
> +	cix_dp_session_lock(dp);
> +	if (!cix_dp_regs_accessible(dp) ||
> +	    dp->force_hpd != connector_status_unknown) {
> +		cix_dp_session_unlock(dp);
> +		return;
> +	}
> +	dp->aux_ignore_hpd = true;
> +	cix_dp_session_unlock(dp);
> +
> +	ret = drm_dp_dpcd_readb(&dp->aux, DP_DPCD_REV, &dpcd_rev);
> +
> +	cix_dp_session_lock(dp);
> +	dp->aux_ignore_hpd = false;
> +	if (ret < 0 || !cix_dp_regs_accessible(dp)) {
> +		cix_dp_session_unlock(dp);
> +		return;
> +	}
> +	dp->force_hpd = connector_status_connected;
> +	dp->status = connector_status_unknown;
> +	cix_dp_session_unlock(dp);
> +
> +	schedule_delayed_work(&dp->hpd_event_work, 0);
> +}
> +
> +static void cix_dp_hpd_event_work_func(struct work_struct *work)
> +{
> +	struct cix_dp *dp = container_of(work, struct cix_dp,
> +					 hpd_event_work.work);
> +	struct phy *phy = dp->phy;
> +	union phy_configure_opts opts = { 0 };
> +	enum drm_connector_status old_status;
> +	enum drm_connector_status status;
> +	enum phy_mode mode;
> +	bool hpd;
> +	int i;
> +
> +	WRITE_ONCE(dp->hpd_worker, current);
> +
> +	if (READ_ONCE(dp->hpd_stopped) || !dp->dp_panel.connector)
> +		goto out;
> +
> +	/*
> +	 * Sample before the PHY wait. A probe during that wait updates
> +	 * dp->status, and reading it afterwards drops the hotplug uevent.
> +	 */
> +	cix_dp_session_lock(dp);
> +	old_status = dp->status;
> +	if (READ_ONCE(dp->hpd_stopped) || !dp->dp_panel.connector ||
> +	    !cix_dp_regs_accessible(dp)) {
> +		cix_dp_session_unlock(dp);
> +		goto out;
> +	}
> +	hpd = cix_dp_get_hpd_state(dp);
> +	cix_dp_session_unlock(dp);
> +
> +	/*
> +	 * On a USB-C DP alt-mode PHY the hotplug only becomes valid once the
> +	 * PHY has been switched to DP mode, so wait for the mode change.
> +	 * A native DP PHY has no ->set_mode() operation, which leaves the
> +	 * mode at PHY_MODE_INVALID forever; there is nothing to wait for.
> +	 */
> +	if (hpd && phy_get_mode(phy) != PHY_MODE_INVALID) {
> +		for (i = 0; i < DP_HPD_MAX_TRIES; i++) {
> +			phy_validate(phy, PHY_MODE_DP, 0, &opts);
> +			mode = phy_get_mode(phy);
> +			if (mode == PHY_MODE_DP)
> +				break;
> +			msleep(100);
> +		}
> +	}

It seems you've used quite a few tricks for USB-C Alt-mode. Both the 
deferred_hotplug above and the polling here to wait for the PHY status
to become ready. 

Given that, why not consider using DRM's native bridge notifications to
accomplish this? Please take a look at aux-hpd-bridge.c.

> +
> +	cix_dp_session_lock(dp);
> +	if (READ_ONCE(dp->hpd_stopped) || !dp->dp_panel.connector ||
> +	    !cix_dp_regs_accessible(dp)) {
> +		cix_dp_session_unlock(dp);
> +		goto out;
> +	}
> +	cix_dp_session_unlock(dp);
> +
> +	drm_helper_probe_detect(&dp->connector.base, NULL, false);
> +
> +	cix_dp_session_lock(dp);
> +	status = dp->status;
> +	if (READ_ONCE(dp->hpd_stopped) || !dp->dp_panel.connector ||
> +	    !cix_dp_regs_accessible(dp)) {
> +		cix_dp_session_unlock(dp);
> +		goto out;
> +	}
> +	if (status == connector_status_connected)
> +		cix_dp_handle_connect_locked(dp);
> +	else
> +		cix_dp_handle_disconnect_locked(dp);
> +	cix_dp_session_unlock(dp);
> +
> +	if (old_status != status && dp->drm)
> +		drm_helper_hpd_irq_event(dp->drm);
> +out:
> +	WRITE_ONCE(dp->hpd_worker, NULL);
> +}
> +
> +static void cix_dp_hpd_irq_work_func(struct work_struct *work)
> +{
> +	struct cix_dp *dp = container_of(work, struct cix_dp,
> +					 hpd_irq_work.work);
> +	u8 status[DP_LINK_STATUS_SIZE + 2];
> +	int ret;
> +
> +	cix_dp_session_lock(dp);
> +
> +	if (READ_ONCE(dp->hpd_stopped) ||
> +	    !cix_dp_regs_accessible(dp) ||
> +	    !(dp->state & DPTX_STATE_ENABLED) ||
> +	    !cix_dp_get_hpd_state(dp))
> +		goto end;
> +
> +	ret = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
> +			       DP_LINK_STATUS_SIZE + 2);
> +	if (ret < 0)
> +		goto end;
> +
> +	if (drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) &&
> +	    drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt))
> +		goto end;
> +
> +	cix_dp_train_loop(dp);
> +
> +end:
> +	cix_dp_session_unlock(dp);
> +}
> +

[...]

> +
> +static int cix_dptx_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct cix_dp_soc_data *soc_data;
> +	struct cix_dp *dp;
> +	int ret;
> +
> +	soc_data = of_device_get_match_data(dev);
> +	if (!soc_data)
> +		return -ENODEV;
> +
> +	dp = cix_dp_bridge_alloc(dev);
> +	if (IS_ERR(dp))
> +		return PTR_ERR(dp);
> +
> +	dp->dev = dev;
> +	dp->native_dp = soc_data->native_dp;
> +	dp->ops = &cix_dp_hw_ops;
> +	dp->status = connector_status_unknown;
> +	dp->force_hpd = connector_status_unknown;
> +	dp->num_lanes = CIX_DPTX_MAX_LANES;
> +	dp->max_rate = CIX_DP_LINK_RATE_HBR2;
> +	dp->max_streams = DPTX_MST_SOURCE_NUMBER;
> +	dp->dp_panel.source_id = 0;
> +	dp->state = DPTX_STATE_DISCONNECTED;
> +	dp->pixel_per_cycle = 1;
> +
> +	ret = cix_dp_parse_dt(dp);
> +	if (ret)
> +		return ret;
> +
> +	dp->link_config.max_lanes = dp->num_lanes;
> +	dp->link_config.max_rate = dp->max_rate;
> +
> +	ret = cix_dp_init(dp);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, cix_dptx_dev_release, dp);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(dev, dp);
> +
> +	dp->bridge.of_node = dev->of_node;
> +
> +	drm_bridge_add(&dp->bridge);
> +
> +	return 0;
> +}

It looks like this part is platform-specific, so I think Andy's suggestion
to split it out into a bridge from the beginning is reasonable.

https://lore.kernel.org/all/15d12979.26c5.1a1d9c981a5.Coremail.andyshrk@163.com/

> +
> +static void cix_dptx_remove(struct platform_device *pdev)
> +{
> +	struct cix_dp *dp = dev_get_drvdata(&pdev->dev);
> +
> +	if (!dp)
> +		return;
> +
> +	drm_bridge_remove(&dp->bridge);
> +}
> +

[...]

> +
> +static int cix_dp_bridge_attach(struct drm_bridge *bridge,
> +				struct drm_encoder *encoder,
> +				enum drm_bridge_attach_flags flags)
> +{
> +	struct cix_dp *dp = bridge_to_dp(bridge);
> +	int ret;
> +
> +	dp->drm = bridge->dev;
> +	WRITE_ONCE(dp->hpd_stopped, false);
> +
> +	ret = dp->ops->aux_register(dp);
> +	if (ret)
> +		goto err_clear_drm;
> +
> +	/*
> +	 * Komeda (ARM Mali DPU on Sky1, not in this series) calls
> +	 * drm_bridge_attach() with attach flags 0 and does not register a
> +	 * connector; create one here so userspace gets a DP output.
> +	 */

Please drop this comment.

-- 
Best, 
Chaoyi
