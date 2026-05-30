Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232263B3896
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780148063; cv=none; b=uWZr3pYmZzSK3AcfgyrFtvrn2oBhWdID8nnaop0sSo7KTmDdrnoqvDvctax/clV8HMa295KGuhT96IAExl0maEmvVA8wLvmylzVtcZpvRCqWp8xoK8CevyBxNz+bzDlowBC20SXg6sI69xlJEM1WvMGdKc2RlkTB1GyI6A//NvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780148063; c=relaxed/simple;
	bh=iVCUFnO5WbbV3OJ4rqlAFJ+uZ/PY4WLpOGZ6AWPeBb0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=BQa5nmPDIyGkokcNOD7CdXyTHbGN3s3UkNe/E3OALNog53c0D0lDSmyYxReRcJH9BB2Ln21L2+ymdCeeg5ESMRlGj4FHmLs4js/4U84j+E+1Dx6NT/BGHa3NiNZs+MCaEtCq9pO/gLUtP19JFsDmPci+ToDXcpcryS6eOf7Dp+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V1l1Mpzx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V1l1Mpzx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4705AC6246B;
	Sat, 30 May 2026 13:34:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04BFE6073B;
	Sat, 30 May 2026 13:34:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99C0F10888650;
	Sat, 30 May 2026 15:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780148057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zGPssiD9Uz1z4ogF/jCPCY7so0jWtc9luglv8cyEFOk=;
	b=V1l1MpzxL3wkM+JGU2t+7/iNfCNyf6efAs/VsnRvqkSHXwwNu9pToPUjZKbglaFr0uxsBB
	nJhKG8wEy+TNiFJ0GIoK4VSTH4khTAh8OyfFnqp24XzRfsaJxcQHt0q7JAQOgr6szezlwG
	NzZ9O/f8rS/UVWUfMZKXQNCU3smwKKCkgaODg93HWCGdVT0S3BsRfMt12c1O5LSd8YAwC/
	YZ3KigOzbS/+pqROsWK4lEc/2TwA3KH4G8DwYWM4nLaE5SpWoZKenmaIC5OAkU4IX1NBzw
	nurq2UEGVQuvivgZ8Uoxn7A8ioUtGa5N1ww+5U2qNAahJ+SPjkeEaki74cYpig==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/3] drm/bridge: analogix_dp: Add validation for
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
In-Reply-To: <20260529040530.741336-3-damon.ding@rock-chips.com>
References: <20260529040530.741336-1-damon.ding@rock-chips.com>
 <20260529040530.741336-3-damon.ding@rock-chips.com>
Date: Sat, 30 May 2026 15:33:59 +0200
Message-Id: <178014803941.21632.16225608049285101452.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 29 May 2026 12:05:29 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:

Hello Damon,

>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8cf6b73bceac..699a7f380c56 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1260,8 +1261,16 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>  		 */
>  		of_property_read_u32(dp_node, "samsung,link-rate",
>  				     &video_info->max_link_rate);
> -		of_property_read_u32(dp_node, "samsung,lane-count",
> -				     &video_info->max_lane_count);
> +		ret = of_property_read_u32(dp_node, "samsung,lane-count",
> +					   &video_info->max_lane_count);
> +		if (!ret) {
> +			if (video_info->max_lane_count == 0 ||
> +			    video_info->max_lane_count > LANE_COUNT4) {

This sashiko report seems to me valid.

But I'n no DP expert, I have no idea whether this ther one is valid.

> +				dev_err(dp->dev, "samsung,lane-count = %d is out of range\n",
> +					video_info->max_lane_count);
> +				return -EINVAL;
> +			}
> +		}

As reported by sashiko, 'count == 0' should be 'count <= 0', being an enum.

Additionally I'd avoid the nested if, and I think using dev_err_probe() is
correct here (we are only called by probe functions), so it all could
become:

   if (ret || count <= 0 || count > LANE_COUNT0)
        return dev_err_probe(...);

There are other sashiko reports to patch 3, and at least one seems valid to
me. Can you either fix them in the next iteration or elaborate on why the
code is correct there?

Thanks!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

