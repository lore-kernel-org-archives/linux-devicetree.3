Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3441F91F6
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144126; cv=none; b=RGysUwH0ZcY/jb/Gg5h2pzeetBHbUYO/HXzYzIc8fF5RSqSkz+qMeqft0An602I1tOtq5NeMliTfhJTqhwrXgSqFDy9cAd6ueWfyaoCt+JfDTPqHZmcu0iUPOumR8Pw/EJ4Hgom5AKP3L3zIaWDd7nzUV/vhVFL0I05J1ix9nwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144126; c=relaxed/simple;
	bh=WvwxPTNS/rbQV/ye33IfeL8KmFJpEfe0Yrhaz7GbPac=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kkgGfqNTxCgcN0ESwAIzRTGu08awzphHaFWgYuVhZMMgwHc8BsRor3Pqszy5e4bHl0f7eub+A31Qus+mIZeAMPCPn6oQROwpSJT2aFU4uWe17uDhHnpkvJN1fdFTGHV/GoAwuW/S6/UYv3Bx8YTVjHjO7qbV8sYp4uVDpNFd5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s/dcREpn; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s/dcREpn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 877AE1A1742;
	Wed, 19 Aug 2026 12:55:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B0D15FF42;
	Wed, 19 Aug 2026 12:55:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01B3311C71083;
	Wed, 19 Aug 2026 14:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787144117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ygTdeuwc1i7RyvsawYkcbeG8xHD6ruDsvhDDf9HOw4U=;
	b=s/dcREpnOnlNpCoAA+1Eun7M51rBb5QT79Gxej55mADMEauWW2ZNDZPtTXrhFsMvsAeVhs
	zlU81iHrTh2A4wLbEHUdV+MxsNE3uhThgg8crsZVjdSAT6ZiBzkQdC2QXxRc8YWSvQasYN
	YX0Xx7arFtAkbC/mxFzfTX0wvWSxLCrLpd/E/d/yViFo1ZHuu8tcJfTrnnuG7wgWIY4WS/
	XZxgHLMwIL7kGifi1F3fTCE6avqBKQjxW5UV+cD5J3Ogs5Jo6Yi10nHvdqywtj1INPaV1u
	99IXZzaBvwwoVWsIbyrEXNXgvokdj6KDy2Lu95fEp1HmWnm3R+KSNMITuW/2cg==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 3/5] drm/bridge: analogix_dp: Restore mandatory
 samsung DP DT properties
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
In-Reply-To: <20260819075238.3007087-4-damon.ding@rock-chips.com>
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-4-damon.ding@rock-chips.com>
Date: Wed, 19 Aug 2026 14:54:46 +0200
Message-Id: <178714408666.358642.12912882529209046607.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> Revert the change that made samsung,link-rate and samsung,lane-count
> optional for Exynos DP. Add error checking to fail probe early if the
> required DT properties are missing.
>
> If these properties are zero, &link_train.link_rate and
> &link_train.lane_count used in the subsequent link training flow will
> also be zero, resulting in link training failure. Although all existing
> Exynos DP DT nodes already contain these two properties, this potential
> logic issue still needs to be fixed.
>
> Fixes: 0d0abd894ead ("drm: bridge: analogix/dp: add max link rate and lane count limit for RK3288")

If it's a fix, please add 'Cc: stable' too.

Also please add to the commit message the detailed analysis you wrote in
the v6 discussion, so that it will easy to find in the git history, in case
it's needed in the future.

With that added you can add: Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

