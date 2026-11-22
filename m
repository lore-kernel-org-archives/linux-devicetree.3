Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360523;
	b=pQHyooTbrTVYn1WjTCKv2mGGQP4Yft/kQ3q0GR9dkSZD3fagBn3v03r0x4JDLR2970Xw
	 /wuNqluL4/IYwYKsvpQVWPvdpLn4mDotuc5iB8ZRDAW1lrlJrir5HFGxeUoxkgIPenWwo
	 xa7jDK31wV+5JPjMcvbhh1pEMCSazHSeSLBAGYYulhFIoEdxjMFixzPU49kbhAK0pnvVD
	 f7m/SwXF14MLzOkH+k6KiAbB1VbqDXeNJzOmeK/aIfB2X0ELrgGeaKk7sDy4GKa6+jKcB
	 iXqDLIqS/jtqb8nlFPGWlPUb4OuZybmA7OaHkmvWgXfNxuv1HhGI6YIVDiw4j3XZfdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360523;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=YcbGbMRgLK/OIub+XZuA18eN9luSA2VJQTj6s0rdASM=;
	b=hsccUR1Yv9NbJBfhU9oGNgIn9xFGIOGz+whEV+MWv++ruU0Fs0EJfj0dG3Y69yPCgZME
	 apWXmfZCYx3P+/tSR03hJrBU1w1v8VDpNdUGXi8o7bsp494ufF3OV4bvOLBRSm2pmcFrq
	 DTVE9N60BNpMZ63gFcXIHjYlMYVl9hvouAcQEHDl5ASYWX+GhP+GI+VD0Q/ZMJxYh+Gy8
	 4IZ/XbXV9ilNzzs7EXSPQs90K1/hjZyHDGn5jYcX8YSMzTE/uplH7nm/9bzl9XrOVq+ZW
	 CqLT9Tc+eWGhWZ2DluB7GbezUW+shOUZv63GX/YVbeRtrLtqGFG4sqkQU+DGzKS0daQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dxTAGSlf;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25DD606A320;
	Sun, 22 Nov 2026 15:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25DD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dxTAGSlf
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82BF3177;
	Sun, 22 Nov 2026 16:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795360368;
	bh=dQri5mv8BvesQ/Ojl60wnHM9oP3BZ02sBcrilidM8ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxTAGSlfLuLYYZTU7FXYNTcw9DZc8j2okIrFnLHCkdwQ1E5FrbAMsE+5i12HOUzCU
	 WHSfcl1/DXU+OD/1fddj1HNOhkDdklrxxghu0JKBzP9cE4wwY5N+mnrjTC+QC75QoT
	 U4NXSyuICBdAg10v73TUdMHfUgSM4Pi2ueU0LwpU=
Date: Sun, 22 Nov 2026 17:15:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 16/23] drm/rockchip: dw_dp: Add system PM support
Message-ID: <20261122151518.GB2881876@killaraus.ideasonboard.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
 <20261114-synopsys-dw-dp-improvements-v12-16-d42d3dc5bdd4@collabora.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-16-d42d3dc5bdd4@collabora.com>

On Sat, Nov 14, 2026 at 06:00:49AM +0100, Sebastian Reichel wrote:
> Explicitly suspend the DP controller when the system goes to sleep and
> more importantly resume it properly after system sleep exit to recover
> USB-C HPD register state, which is lost when the system goes to sleep.

When the system goes to sleep, the display controller should shut down
the whole pipeline in an orderly manner, and restart it when the system
wakes up. This should call dw_dp_link_disable() and
dw_dp_bridge_atomic_enable() respectively, which should in turn (with
patch 14/23 applied) runtime-suspend and resume the device. Why is there
a need for this patch ?

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> index 99d948a7c51f..4cfb40494379 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> @@ -269,6 +269,7 @@ static int dw_dp_rockchip_runtime_resume(struct device *dev)
>  
>  static const struct dev_pm_ops dw_dp_pm_ops = {
>  	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_resume, NULL)
> +	LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>  };
>  
>  static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {

-- 
Regards,

Laurent Pinchart
