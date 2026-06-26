Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2042D3FADFD
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491388; cv=none; b=jo2LXylA+VGpo+3e3nDf2PtY+ygObUBdF6k2O9AZW72bz6Oaa4C7MspIcMTSe7tZuwwPZb7Vz0OVok2rpXXmtqJhrhIDJ0DVhcMhGF9/bXVTFGUo8QdpAA4uqpzhcTGy9gusziLf+r+FaSE9XjfRzpd+EAKtWPgGH3HSAueip+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491388; c=relaxed/simple;
	bh=4swLHFSVMUoMdc3r35j1zLG0tNhQRF22DJkAvHq8mu0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sGw/5U+KriRgAp/M6UCdUXtsfa4y2p2dOGMEkcWBXHECAqeNhsa6PULeUQR/ARFaeC/OPbSWjKMgjsF/EjGOtwvkq9zjgWSMm1Hrt6bw9Z55/JmIMPdtDR7SD9aN33a8shZvsXwaRa46pQo1O+8KUH2+JyecISaJZRhLMVvfcW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w21TOswO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w21TOswO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AF35A1A09EA;
	Fri, 26 Jun 2026 16:29:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 814D060232;
	Fri, 26 Jun 2026 16:29:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 914E3104C9AEC;
	Fri, 26 Jun 2026 18:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782491384; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t+BRi142KmPuEUcsmuXZ0IikgeFHZzmKjoeyvOaxuEQ=;
	b=w21TOswOVZP9cm07O68mTEA9LTM/duqidm1F8aWEzC7PVhcUBQDBk0zM6eUh3qjO4yLZYU
	uKlmPHpoaFimW/HZ6ulF35YQxLVfxiny9tAcGq5sZNzsLLTkZcZ8pafDtF9b2dl32ZycN7
	Q/PmGPX5B9sJAIHdZoV7PRXYLH+ckEmizv21lWyeMqDib6cz3Kcl2dFEa6OMzePnde6Arm
	6MkgcF+7T6YZHcDrp/6GFo9TyR2Zfyc4nyQghYQ1JX5fvEnSItexw2F0Uu5QgVqQRajiSb
	fz2eYG+dbdo6Xriq/0C1p80MzKD7JFKf2liwI8ZAHdoNxU3wZzesxPQDgMTbCA==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 3/4] drm/bridge: analogix_dp: Add validation for
 samsung,lane-count property
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
In-Reply-To: <20260604085220.2862986-4-damon.ding@rock-chips.com>
References: <20260604085220.2862986-1-damon.ding@rock-chips.com>
 <20260604085220.2862986-4-damon.ding@rock-chips.com>
Date: Fri, 26 Jun 2026 18:29:25 +0200
Message-Id: <178249136513.1374898.11400378046460567437.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 04 Jun 2026 16:52:19 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:

Hello Damon,

>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 7a85774aaac1..e120ef3320c1 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1261,8 +1262,11 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>  		 */
>  		of_property_read_u32(dp_node, "samsung,link-rate",
>  				     &video_info->max_link_rate);
> -		of_property_read_u32(dp_node, "samsung,lane-count",
> -				     &video_info->max_lane_count);
> +		ret = of_property_read_u32(dp_node, "samsung,lane-count",
> +					   &video_info->max_lane_count);
> +		if (ret || !drm_dp_lane_count_is_valid(video_info->max_lane_count))
> +			return dev_err_probe(dp->dev, ret ? ret : -EINVAL,
> +					     "failed to parse samsung,lane-count\n");

I think this report by sashiko makes sense:

  >  sashiko-bot@kernel.org <sashiko-bot@kernel.org>:
  >
  >  [Severity: High]
  >  Does this make the optional and deprecated samsung,lane-count property a
  >  strict requirement?
  >
  >  If samsung,lane-count is absent from the device tree, of_property_read_u32()
  >  returns -EINVAL. This causes the condition to evaluate to true, aborting the
  >  probe with an error.
  >
  >  According to the device tree bindings
  >  (Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml),
  >  this property is marked as deprecated and explicitly optional because the
  >  lane count can be read from the monitor. Does this patch break compatibility
  >  with device trees that rightfully omit this deprecated property?

 (via: https://patch.msgid.link/20260604090935.7FC051F00898@smtp.kernel.org)

Can you comment on this?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

