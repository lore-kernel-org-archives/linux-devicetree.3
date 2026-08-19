Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DDE315D49;
	Wed, 19 Aug 2026 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144141; cv=none; b=YDs4scqN0Hxun9nSYrTo1j90LQtrJhiACcAoYsrC8lkOQ+rZR79L95q73m5psVxhIYrYE0QjX9f+MqhwurbV+ifyNeBUgEaQ12f6nxv6kJUv/A1F4RymXA9w6b5qNUbUKoDIHPh8V7MoxGJZL24W5LOGFlObqy2MkdMGg8c8vjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144141; c=relaxed/simple;
	bh=Nr7ANhzhlfZepKwZQvaceQMcTGuzofbbeCHqCypa/D0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=eAQxAQq6q3fCUeMi31r19yblkHDWCVDAgNr9aPWPfZi+bVq1jR9g2Np4a1GIBUdP0HAgEd0UnLz5lf98VE+ZhS+tbot8dgggD17JwSjukYhJesKz59i6BLWDKfdI9G+zIX9E8RFjKYs/Q7YYxgZU9EOsEdY4fNYPFitigR8rLLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kwlHNqqO; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kwlHNqqO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A5E24E412D2;
	Wed, 19 Aug 2026 12:55:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F27AB5FF42;
	Wed, 19 Aug 2026 12:55:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B02A011C71085;
	Wed, 19 Aug 2026 14:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787144128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4dOAZ6SxL/cfL7dWFpm2eTJHzkz2i9+gxpQOohLaBME=;
	b=kwlHNqqOArv4as5beOu6dz/tjo0akgYVLco790/mI6LjPAr7O2E4ef+QBkGny0CPSuLVbM
	qDMyzpb1oR+hoKLTAtkVKzfuPwNoZd1xMKRF+CL6rWbQ7Kq+SATP3U1tL/bZYh+O9iD9Cm
	Zj0QYqCxYyHcxRyAlEJBooZxp1FYTiEzdXKh7GNHYU5ABxLaH1X3zKhY1zbFL5GjKjHiCU
	YReP1qu1y8MDaqrdRFW0RkURD+Wa7ogtkT5BbN5W8YqR4Ywg/OL2K+5npFbz2aqQMY6jGH
	rJvoMpWVWzwePuvV3NzTxB2JVH/igJE5smtODYecFaLzeMiXOUgLbWxGpZz7LQ==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 5/5] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260819075238.3007087-6-damon.ding@rock-chips.com>
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-6-damon.ding@rock-chips.com>
Date: Wed, 19 Aug 2026 14:54:46 +0200
Message-Id: <178714408666.358642.10737743872246645132.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello,

> Parse the optional 'data-lanes' device tree property to support
> custom physical lane mapping configuration.
>
> If no valid configuration is found, fall back to the default
> lane map (0, 1, 2, 3) automatically and keep the driver running.
>
> Lane mapping is mainly used for below scenarios:
> 1. Correct PCB lane swap and differential line routing crossover
>    without hardware changes;
> 2. Adapt mismatched lane pin definitions between SoC and eDP panel;
> 3. Support multiple panel hardware variants on the same board
>    by configuring data-lanes in device tree only.
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 117448b854db..4aa444858bb6 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1240,6 +1240,59 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>  	.detect = analogix_dp_bridge_detect,
>  };
>
> +static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *dp)
> +{
> +	struct video_info *video_info = &dp->video_info;
> +	struct device_node *endpoint;
> +	u32 tmp[LANE_COUNT4];

The 'tmp' name is not very useful to understand what it's for. Based on the
code I'd say it stores a lane index, so what about 'lane_idx', unless you
can propose a better name.

> +	u32 map[LANE_COUNT4] = {0, 1, 2, 3};
> +	bool used[LANE_COUNT4] = {false};
> +	int num_lanes;
> +	int ret, i;
> +
> +	memcpy(video_info->lane_map, map, sizeof(map));
> +
> +	num_lanes = drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
> +						   video_info->max_lane_count);
> +	if (num_lanes < 0)
> +		return -EINVAL;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);


> +	if (!endpoint)
> +		return -EINVAL;
> +
> +	ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, num_lanes);
> +	of_node_put(endpoint);
> +	if (ret)
> +		return -EINVAL;
> +
> +	for (i = 0; i < num_lanes; i++) {
> +		if (tmp[i] >= LANE_COUNT4) {
> +			dev_dbg(dp->dev, "data-lanes[%d] = %u is out of range\n", i, tmp[i]);
> +			return -EINVAL;
> +		}
> +
> +		if (used[tmp[i]]) {
> +			dev_dbg(dp->dev, "data-lanes[%d] = %u is duplicate\n", i, tmp[i]);
> +			return -EINVAL;
> +		}
> +
> +		used[tmp[i]] = true;
> +		map[i] = tmp[i];
> +	}
> +
> +	for (i = 0; i < LANE_COUNT4 && num_lanes < LANE_COUNT4; i++) {
> +		if (!used[i])
> +			map[num_lanes++] = i;
> +	}

This loop is a bit obscure to me. After reading it a few times I _think_ it
does the following:

 /*
  * Fill the unused map[] entries with the unused lane indices <reason?>. E.g.:
  * used[] values = {0,1,0,1} // Only lanes 1 and 3 are used
  * map[] before  = {3,1,x,x} // x = unassigned
  * map[] after   = {3,1,0,2} // filled last 2 entries with the unused lane indices
  */

Is my understanding correct? If it is, please fill <reason?> and add the
above comment (possibly improved) before the loop.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

