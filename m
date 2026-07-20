Received: from mail-m1973197.qiye.163.com (mail-m1973197.qiye.163.com [220.197.31.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A203CB575;
	Mon, 20 Jul 2026 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535468; cv=none; b=YtS1kssEHdMqeYaDku4X7KAMqRIcY2uR/6fs7O1oNWi5+qTnIXxMrar3TpUu6q1ow5D2Nv/nIsbq4PWr3HE35NRa8WBc+8kj1WT2H/1AnTjIYXT27XqNdNzCNVYphtxcXUK1a2wilm/Y58GyC1i7qIrvPnluL4yBxWQ4SA71Ul8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535468; c=relaxed/simple;
	bh=6/0y02gY2k2BidM1qrF9sMyGWPDIgZMhiR9G3/xXyxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laUJH+DZLUNk9HggFP1WpU686GK3uQjRdHvYUxdSxtONqQv0kjfCsOwwsygoyrVQ0MMs8JdYQEl2u/UIzEJeq8ljdg0k8SKR4ZrMyGNXlotHFiYKYaKtQ7GZ0KHCS32sgKo3JNgf4hPZFHtQXu1si5nmK7TK1t9pg9Ao/6yudcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=WVqO+2NC; arc=none smtp.client-ip=220.197.31.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="WVqO+2NC"
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 46c241bcb;
	Mon, 20 Jul 2026 09:27:46 +0800 (GMT+08:00)
Message-ID: <a2eed39e-1991-4b76-837f-d5cab47391b2@rock-chips.com>
Date: Mon, 20 Jul 2026 09:27:44 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/rockchip: lvds: propagate bus_flags to the CRTC
 state
To: Rok Markovic <rok@kanardia.eu>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alibek Omarov <a1ba.omarov@gmail.com>
References: <20260717120005.2087386-1-rok@kanardia.eu>
 <20260717120005.2087386-2-rok@kanardia.eu>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260717120005.2087386-2-rok@kanardia.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f7d22e4aa03a7kunmc2dbdd921ce93e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGR5CVkgfGkoaHUxLTExJGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WVqO+2NCDv/mqaO7Kt2nEXgpTXTldKPyN/TiQkHcsd5v7udtGR77JY3k0OKq4COd3wN0vU79o6m/lfszbFb8PIsZYbVdWFJmO0yDE9FtgwlO5bc6k6xYkmawjTIedk/4J+nzSL2Igg1ho8BleWnFiLT+YAsqNSxgP6FQ5VsHWxg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=KlQm/PpCTfe1j9oRpQXe07F8wUNhZzgsWv2yet6lYR8=;
	h=date:mime-version:subject:message-id:from;

On 7/17/2026 8:00 PM, Rok Markovic wrote:
> rockchip_lvds_encoder_atomic_check() sets output_mode and output_type
> but never copies the connector's bus_flags into the Rockchip CRTC
> state, unlike dw_dp-rockchip.c and dw-mipi-dsi2-rockchip.c which both
> do.
> 
> panel-lvds parses pixelclk-active from the DT display timing and
> publishes it on the connector as DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE.
> VOP2 reads that flag back out of the CRTC state to decide
> POLFLAG_DCLK_INV. With the flag dropped here, vcstate->bus_flags is
> always zero, so a panel that asks to be clocked on the falling edge is
> driven on the rising one, and there is no way to express the panel's
> requirement from DT at all.
> 
> No functional change for the SoCs currently supported by this driver:
> rk3288 and px30 pair with the VOP1 driver (rockchip_drm_vop.c), which
> never reads bus_flags - only VOP2 consumes it. The flag becomes live
> with the RK3568 support added later in this series.
> 
> Signed-off-by: Rok Markovic <rok@kanardia.eu>
> Assisted-by: Claude:claude-opus-4-8
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 75f898a..95fa0a9 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -129,7 +129,15 @@ rockchip_lvds_encoder_atomic_check(struct drm_encoder *encoder,
>  				   struct drm_connector_state *conn_state)
>  {
>  	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
> -
> +	struct drm_connector *connector = conn_state->connector;
> +
> +	/*
> +	 * The VOP derives the pixel clock polarity from this. Without it a
> +	 * panel that declares pixelclk-active = <0> is clocked on the wrong
> +	 * edge. panel-lvds fills the connector's bus_flags in from the DT
> +	 * display timing.
> +	 */
> +	s->bus_flags = connector->display_info.bus_flags;
>  	s->output_mode = ROCKCHIP_OUT_MODE_P888;
>  	s->output_type = DRM_MODE_CONNECTOR_LVDS;
>  

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

