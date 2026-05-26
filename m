Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3889D3DA7EE
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797297; cv=none; b=jxhSemZL3KyQO6WuKzx0YxO/SN71w69MFf4+iuGF6SrTCetQ9P8gKeVkuswsAXPDEBpcnbfi4hCR1I2UL8uziAYN1RJjaKyoRLYg87sJJBlqYPy257shPKLXBwopyuec4dcu7Tr6a9PlcUg9iD8wmseTWamOSOP1eCQKmHc/HmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797297; c=relaxed/simple;
	bh=QzJXSHGVfVeE9SparCy1CIwBuNy5tODp1YbztMvjrN8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=A/9uQssQdNKYjiUV96itBPkhN2gqM9HIVoHnRv1XKP+3Uiu3X3xnMvq2M+y93MldJf5DuzVotc56A5EUuPhAhqZm7S9j7pus4Ej6ppvavwVYj/7ppfvWLCcw21ReA2tp1ubcOKnTaXMENgLYrfUI5MAkljl0JT6zwRjyPl07hEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RNU5++s0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RNU5++s0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B6FFE1A36D2;
	Tue, 26 May 2026 12:08:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 866A56011D;
	Tue, 26 May 2026 12:08:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7181C10888356;
	Tue, 26 May 2026 14:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779797292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DK8eA9/GN7NzLuxBx/GTovhK/apGoGFfUGeCC5d5iyI=;
	b=RNU5++s0L9bfnoxU24iB+xsMHm5P0Ae9cOJvZKPHxeM97AF368q8RuNWiwcQLO12P9CZ6o
	moU9/AUpCKd8iyFRV54iR+l+nhFxSXVFwjQn4i9RbIvM26ms7QueBOCrGZ0MMKChE14P7P
	HZ4an8aN8PC+KrEOHJu3tLBY7Zi/DIs7l3U2GzxAYnRfA3DEp2mUT0jZPfnbEJn4DAORa7
	xVj58D97QdBzzHxdheW2w2kq4sIQtzS+j2fdh6rSwYZIdd5EZ0oVBR7inInOpoANc0OCpg
	LhcQsFUfMpAh+toIhmX2aljXCS2HNweQL5NuMs0i3q0TuPvtlh6+YQ76VYqetA==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com, 
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com, 
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com, 
 dianders@chromium.org, m.szyprowski@samsung.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260525094731.121380-3-damon.ding@rock-chips.com>
References: <20260525094731.121380-1-damon.ding@rock-chips.com>
 <20260525094731.121380-3-damon.ding@rock-chips.com>
Date: Tue, 26 May 2026 14:07:50 +0200
Message-Id: <177979727057.297330.10691183273720133245.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 25 May 2026 17:47:31 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:

Hello Damon,

>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8cf6b73bceac..d53ab25bc57b 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1234,6 +1234,59 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
> [ ... skip 11 lines ... ]
> +	int ret, i;
> +
> +	memcpy(video_info->lane_map, map, sizeof(map));
> +
> +	num_lanes = drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
> +						   video_info->max_lane_count);

Should num_lanes be > 4, the buffers could overflow. I realize it should
not happen, but analogix_dp_dt_parse_pdata() can set max_lane_count from
the device tree, so a bogus dtb could cause such overflow.

Perhaps you should just (in a separate patch) error out in
analogix_dp_dt_parse_pdata() to prevent this. And maybe even adding an
BUG_ON(lane_count > 4) here.

Otherwise LGTM.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

