Received: from mail-m1973189.qiye.163.com (mail-m1973189.qiye.163.com [220.197.31.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467F5407CCB
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539480; cv=none; b=OxXcPB7H41iRnehIdXVNDXb/+kP1kcxTfHeIq4VZG8p0H6ZrlCyx2eSfM1sSKcrBA9IREgqLVCaZ27NrTE17iMhSy32I8TX/B+09yQp+u51/5rcj0ReekTiw18s/pQcn3KpfhklAgt9v3e6FS6IQ3KbiY+tvvGf9X/yTePNPNOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539480; c=relaxed/simple;
	bh=xCMEoerQr6qOpSceVTrX07b3WN8wSqvO5OwJkSDd64Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJaV56PIgbigO/w5HR7MEh5V6XJYSFz6ZsVRTzisc7xkNUDuSH4tJ8oI6UfyqwywNIzFEbGiLTmCVvzpR/6cDv9fONnR+IF3hIx9oDAFJbloOxU8uU1Ibcy2/66DkhJGZwE43m8yBe25Jee31x8ls7Wnr6gLxAGMKX1tZriyaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=H2pYc5H4; arc=none smtp.client-ip=220.197.31.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="H2pYc5H4"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 427046fb6;
	Mon, 15 Jun 2026 20:34:58 +0800 (GMT+08:00)
Message-ID: <8da02c6f-030d-4033-935b-a44c777a14d2@rock-chips.com>
Date: Mon, 15 Jun 2026 20:34:58 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Add eDP lane mapping support
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260604085220.2862986-1-damon.ding@rock-chips.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260604085220.2862986-1-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ecb4725bc03a8kunmad12dd9f4325
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZShkaVhkYTxoaGEsYQhpIGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=H2pYc5H4U519kPcqsLXiGZSqfal7roIZHKjog0oUnFm77yfp9eZTtdfOGTPLM5/Lcsv+XL4jWuNSRzLTovnS6ukbqMHh0l4IBojJTjDT+R0HGDUMdDikxtVT4j36p8sRGDPrJFuqrwx4ZAj5tX2uj6ZkKN0BqpTpcTwOo+O86QA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=qY5kOzqcJfORXQNkdCMcMwTxAyKHZxf9POk2wrTq/zs=;
	h=date:mime-version:subject:message-id:from;

Hi all,

Gentle ping on this patch series.

Best regards,
Damon

On 6/4/2026 4:52 PM, Damon Ding wrote:
> This series adds configurable eDP physical lane mapping support via
> device tree data-lanes property.
> 
> Lane mapping is mainly used for below scenarios:
> 1. Correct PCB lane swap and differential line routing crossover
>     without hardware changes;
> 2. Adapt mismatched lane pin definitions between SoC and eDP panel;
> 3. Support multiple panel hardware variants on the same board
>     by configuring data-lanes in device tree only.
> 
> The series includes driver implementation and device tree binding
> updates to support custom lane mapping configuration from endpoint
> node, and keeps default linear lane order if no configuration is given.
> 
> Patch 1: Add endpoint data-lanes property to analogix-dp binding
> Patch 2: Add DRM DP helper API to validate DP lane counts
> Patch 3: Add validation for samsung,lane-count property as preparation
> Patch 4: Implement lane mapping in analogix_dp driver
> 
> Damon Ding (4):
>    dt-bindings: display: bridge: analogix-dp: Add data-lanes support for
>      endpoint
>    drm/dp: Add helper to validate DP lane counts
>    drm/bridge: analogix_dp: Add validation for samsung,lane-count
>      property
>    drm/bridge: analogix_dp: Add support for optional data-lanes mapping
> 
>   .../bindings/display/bridge/analogix,dp.yaml  | 19 ++++--
>   .../rockchip/rockchip,analogix-dp.yaml        |  1 +
>   .../drm/bridge/analogix/analogix_dp_core.c    | 64 ++++++++++++++++++-
>   .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
>   .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 15 ++---
>   .../gpu/drm/bridge/analogix/analogix_dp_reg.h |  4 ++
>   include/drm/display/drm_dp_helper.h           |  6 ++
>   7 files changed, 97 insertions(+), 16 deletions(-)
> 
> ---
> 
> Changes in v2:
> - Add lane mapping application scenarios in commit message.
> - Remove redundant deprecated property 'data-lanes' for eDP node.
> - Update port@1 $ref to /schemas/graph.yaml#/$defs/port-base.
> 
> Changes in v3:
> - Squash [PATCH v2 2/3] into [PATCH v2 1/3].
> - Add unevaluatedProperties: false to both the port@1 and endpoint
>    nodes.
> 
> Changes in v4:
> - Add validation for samsung,lane-count property as preparation.
> 
> Changes in v5:
> - Add DRM DP helper API to validate DP lane counts.
> - Apply DRM DP helper API to check the validity of samsung,lane-count
>    property.
> - Add Acked-by and Reviewed-by tags.
> 

