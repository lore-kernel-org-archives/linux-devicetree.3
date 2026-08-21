Received: from mail-m158135.netease.com (mail-m158135.netease.com [47.251.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405913A83A8;
	Fri, 21 Aug 2026 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.251.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297858; cv=none; b=QJ/hSk/RLVWT0bIBrtVxHY5R2N9jHkMLHBxzEeR5nLrYLJo+egwNo197pZ41+lnmIYeAGRn7bRWSiqiJsG85v2OpMKr++wV1wEAtT+O1Z7SMlBdnuXHrjwkNlGY3htPJhhjH30BUA88GhGrYolM+PVcQ3kP1LUjibzkbfzbHHpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297858; c=relaxed/simple;
	bh=8vRtgCLwCV637D65IRaFhfXUbiy54Tfg3A24lVNa12s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhgNUV9qhmuKyy/B00m1/+ac8VMdL2j6FFwZp58QETfQ8Jnhj/k2My3ROLB7M/IYut5rJ0EjiFq0dZPyYGboOvfzlSFBdGIve6/Dp+rXryXqYHHtuoRHNPte+w5xjME7/0SH9kOB72V5Kjo2Qxr5MxOpnd5MsR7GmyIDTXbop5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=eEgOCGeo; arc=none smtp.client-ip=47.251.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="eEgOCGeo"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ad31442e;
	Fri, 21 Aug 2026 15:37:19 +0800 (GMT+08:00)
Message-ID: <7087887e-95e9-4253-a86e-c074eef950fd@rock-chips.com>
Date: Fri, 21 Aug 2026 15:37:19 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drm/bridge: analogix_dp: Restore mandatory samsung
 DP DT properties
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-4-damon.ding@rock-chips.com>
 <178714408666.358642.12912882529209046607.b4-review@b4>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <178714408666.358642.12912882529209046607.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa02340b79c03a8kunm02f452e245569a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBkYVktCQ08aHU8ZS0NKTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=eEgOCGeoFhbUNQZl237hGLavdog8J0uivhVhnfoxC+IBAIjK4kKrxBv2c9mlueubt6b+KUIinNK38NkoOooSDGNP9C9T1GpTObhCiuWV0fj0/WtkZYMoYnhPyD74yZunKp71VxN4B/rZiRlKbl49qZxVZi3K+bXOy1Ob0T+dJko=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=vwmRpH1OMYfMW+wdngHC16XU1WHD68RBOexz3bP/ZHc=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 8/19/2026 8:54 PM, Luca Ceresoli wrote:
>> Revert the change that made samsung,link-rate and samsung,lane-count
>> optional for Exynos DP. Add error checking to fail probe early if the
>> required DT properties are missing.
>>
>> If these properties are zero, &link_train.link_rate and
>> &link_train.lane_count used in the subsequent link training flow will
>> also be zero, resulting in link training failure. Although all existing
>> Exynos DP DT nodes already contain these two properties, this potential
>> logic issue still needs to be fixed.
>>
>> Fixes: 0d0abd894ead ("drm: bridge: analogix/dp: add max link rate and lane count limit for RK3288")
> 
> If it's a fix, please add 'Cc: stable' too.
> 
> Also please add to the commit message the detailed analysis you wrote in
> the v6 discussion, so that it will easy to find in the git history, in case
> it's needed in the future.
> 
> With that added you can add: Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 

Yes, will do in v8.

Best regards,
Damon

