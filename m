Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.88.81.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596925;
	b=0Ni6C3ZU2RP9YbLRN4zi4/3A9akz7neKkO1nvWNF98vC4EhX56HyoQhjTWEoPX0K7VsS
	 /59/9w6NneJhmcpUjcPSYA62txlpfrYtjKQHMDR1x+XCoyih+1/juwi7ay2X2+E+mQjT4
	 znM4JF2QMczQNaeNdaD6CkpvqdUH2o5TPNj9hKcrdhGXsmnBsAJY6Jl6bGIKZOpEAB41m
	 S09VIhXzAFVdzhy59+yKs093FqPIIB+h6jENm6qqAcrkVznFRHlDeO18wMo2m95JwOJgi
	 Dx6BlubMPAm7Z8vLlI6B9ryPMvmihSnjfo2Nc0D9yUdh4M09um5WsO1OTsixugOp+jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596925;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=o4GT54fvMYkC4amfZANmVOthCE6DeSD74V9mpKYzQZY=;
	b=i4yAr3QffFZiW41bSklntjTcZVOS3+yATfgIv2KQNIbl+zE11ISf49pALpjvyha9GsR+
	 o7+2x7aCE+NoWVszUpiw/RvXBoljLfQyl0B+xAOG4/L6DnU5RyK9MZN0I9zi07mJvwSh9
	 M3pjtpyPbeIHEHYSomTgYp+KU9KamP5UtqTgdUepLlDa+PNJ/spOqJ7i+sy9Bu40sGuOH
	 69m3VR62mcV1c8vsp51MvPaL65+Xm/SZTkF7uZ0szB6bRSWl6d3QMSrsR6EJ6NqQlyFC2
	 K4zSREH82JCyQmM9rJSe4WwprvmSIxO2W3x6v32aAl0B6oBOD1WQpJuWvq+DfMknXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="BqS+h/HA";
	arc=none smtp.remote-ip=47.88.81.196
Received: from mail-m81196.netease.com (mail-m81196.netease.com [47.88.81.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E37606A32E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E37606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=BqS+h/HA
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f2f99e1;
	Wed, 25 Nov 2026 16:55:11 +0800 (GMT+08:00)
Message-ID: <82168811-c141-445a-97d1-e5c1ee38e0f4@rock-chips.com>
Date: Wed, 25 Nov 2026 16:55:06 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/bridge: trilinear: add the DPTX DRM bridge
To: Luo Liu <Luo.Liu@cixtech.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, luca.ceresoli@bootlin.com, wuyi.shen@cixtech.com,
 cix-kernel-upstream@cixtech.com
References: <20261124120114.3273161-1-Luo.Liu@cixtech.com>
 <20261124120114.3273161-4-Luo.Liu@cixtech.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261124120114.3273161-4-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa211ea839803a7kunm367dc79fe08dd9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkoaVklIQkodT08fTENITlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BqS+h/HAVZ206PWEvVwfP1IycONXbmlKg6lhmJFv711VYa9d8faJGNxIZxw0hKmSE4cO5/hdsUHqmKQOUH3cz9wOul+AnEy5FAxlZk6wpRE7U/banOPxqtJ8XO5I+w3PulbMtrq5UgqlV4YvrrVq3P3uprzIGrVdzsO8flFpZFQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=o4GT54fvMYkC4amfZANmVOthCE6DeSD74V9mpKYzQZY=;
	h=date:mime-version:subject:message-id:from;

Hi,

On 11/24/2026 8:01 PM, Luo Liu wrote:
> Add the DRM bridge that exposes the transmitter to KMS: connector
> detection, EDID mode enumeration with a downstream timing fallback,
> validation of a mode against the sink link capabilities, and the atomic
> enable and disable paths.
> 
> The bridge is meant to be attached with DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> the connector is created by drm_bridge_connector_init() from the bridge
> operations, so the driver only implements the bridge side and never
> creates a connector of its own.
> 
> Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
> ---
>  drivers/gpu/drm/bridge/trilinear/dptx_drm.c | 623 ++++++++++++++++++++
>  drivers/gpu/drm/bridge/trilinear/dptx_drm.h |  17 +
>  2 files changed, 640 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_drm.c
>  create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_drm.h
> 
> diff --git a/drivers/gpu/drm/bridge/trilinear/dptx_drm.c b/drivers/gpu/drm/bridge/trilinear/dptx_drm.c
> new file mode 100644
> index 000000000000..fde34bac1230
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/trilinear/dptx_drm.c
> @@ -0,0 +1,623 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DisplayPort DRM bridge helpers
> + *
> + * Copyright 2026 Cix Technology Group Co., Ltd.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/math64.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_edid.h>
> +
> +#include "dptx.h"

This file does not appear until patch 4.

> +#include "dptx_drm.h"
> +
> +#define DPTX_MIN_H_BACKPORCH 12
> +#define DPTX_MIN_BPP		(6 * 3)
> +


-- 
Best, 
Chaoyi

