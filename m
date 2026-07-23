Received: from mail-m121183.xmail.ntesmail.com (mail-m121183.xmail.ntesmail.com [115.236.121.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D9A3DB306;
	Thu, 23 Jul 2026 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.121.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790810; cv=none; b=Rl3vPxtxYCb4CX4uP4cmUVsoZkRguWi6umlgz5ennWxRw1uLzCM1u99dswsD/WI7frNIUJ+iRfg76bIgyN0cj5DLWITIX6P62P31M9XDGoW4ngWBCY75tMwSvMiQv+LT2h/AHrW+9gLW+sc8pH8SDvMrhR9buIuckFYF1G8yTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790810; c=relaxed/simple;
	bh=fP7mP1PvyxbdpviNlPMSkzU4H0gpIbtJMNA0s6KxveE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rB0LtOfoD/tfkfkKH6jdrnfv+swZC2MUQbKihq6A2dwD2VoplPV1RDlLcsFuQWfSmhYDJVgRq98BYYBZ5s+7HHYf1C39V8Cg0TYE2Rh0MAkV4bPPLiDVpNrxo8hAznky56Cj6kHqa9zxLQaFbPNpshtcdCwngCQHot0UAXj9DqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=BRDErc+n; arc=none smtp.client-ip=115.236.121.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="BRDErc+n"
Received: from [172.16.12.74] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4746d9e60;
	Thu, 23 Jul 2026 14:37:43 +0800 (GMT+08:00)
Message-ID: <97e28cf5-dd68-499f-9b05-95690807a5b6@rock-chips.com>
Date: Thu, 23 Jul 2026 14:37:43 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Add eDP lane mapping support
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260707040613.1992841-1-damon.ding@rock-chips.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260707040613.1992841-1-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f8db1bbfc03a8kunmce2c72a238580c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGh1IS1ZCQxlOHk5NGB
	pMSE1WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=BRDErc+nOga+bu2rulXIPEgszcRtzplx0OBArAZBL8pXrQtJGw2+BRjUNroUJKjfDGWnaHBTTqPQhcrAsMdYAORLDKlyrnpFquwd/zm15pJqzIeaHNc3sV6C06heK9Nu1/Z3lF0D6jdo0w77EZEhEmpvp2/J+n1epPFgzk+9QV4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=hPnxwzBAhZxcG9oWTVfy2nq7tEgZYFpIDiq2DYBjWcA=;
	h=date:mime-version:subject:message-id:from;

Gentle ping.

On 7/7/2026 12:06 PM, Damon Ding wrote:
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
> Patch 3: Restore mandatory for samsung,link-rate and samsung,lane-count
>           properties
> Patch 4: Add validation for samsung,lane-count property as preparation
> Patch 5: Implement lane mapping in analogix_dp driver
> 
> Damon Ding (5):
>    dt-bindings: display: bridge: analogix-dp: Add data-lanes support for
>      endpoint
>    drm/dp: Add helper to validate DP lane counts
>    drm/bridge: analogix_dp: Restore mandatory samsung DP DT properties
>    drm/bridge: analogix_dp: Add validation for samsung,lane-count
>      property
>    drm/bridge: analogix_dp: Add support for optional data-lanes mapping
> 
>   .../bindings/display/bridge/analogix,dp.yaml  | 19 +++--
>   .../rockchip/rockchip,analogix-dp.yaml        |  1 +
>   .../drm/bridge/analogix/analogix_dp_core.c    | 70 +++++++++++++++++--
>   .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
>   .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 15 ++--
>   .../gpu/drm/bridge/analogix/analogix_dp_reg.h |  4 ++
>   include/drm/display/drm_dp_helper.h           |  6 ++
>   7 files changed, 101 insertions(+), 18 deletions(-)
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
> Changes in v6:
> - Add a seperate commit to restore mandatory samsung DP DT properties.
> - Add Reviewed-by tag.
> 

