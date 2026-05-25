Received: from mail-m1057.netease.com (mail-m1057.netease.com [154.81.10.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CCE233939;
	Mon, 25 May 2026 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702141; cv=none; b=PyaL2Vs7qXt6wh2/wh5aFCTO1XLPFevw+CRrC/sgyX+8q9Xk7d+e2R6qwQ1tcnAJgZ9P+IVASf8S5drmI31YmJRBaEBURm2ogaHSiaPp9LYwHIS4O2I0FyQSzfx96SedDh8DVAS66DB/jdKle+0zjXe+YESRO+uTRwMuhYQmWaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702141; c=relaxed/simple;
	bh=hCBNUddRoONQ8SZyRblRDAqVsWXqFFXR4b3VLybyuAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVsVCiKiNLX9hZt+k9Nb5110reUdwiGgMLWmFsc+sIkda+eozTGMTFcCtROww11WDj3BcU0gQCGo1i5cPhUC7yRYKqryAF/ZCSRmQNk5eWaPi+n5nNianUhyPWBazIaFgiJQcd3wv73qNH0Vva7pAXFx8hc5t6xun75Mcss1Zo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Nv/exr7A; arc=none smtp.client-ip=154.81.10.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Nv/exr7A"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fb5a1dcd;
	Mon, 25 May 2026 17:42:08 +0800 (GMT+08:00)
Message-ID: <c3c81cc7-6c5e-44b4-892b-c5b4199452ec@rock-chips.com>
Date: Mon, 25 May 2026 17:42:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/10] dt-bindings: display: rockchip: analogix-dp: Fix
 hclk as third clock for RK3588
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
References: <20260525082033.117569-1-damon.ding@rock-chips.com>
 <20260525082033.117569-2-damon.ding@rock-chips.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260525082033.117569-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e5e835f7703a3kunmae9bfcda10eb2a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGh9NVkNPHxgYGB9LT0hNTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Nv/exr7AsXooqkxImwxXo6jSxa80U8X1v8eE9880g+5wTjsSfrFu/nYbd7R3+3fm+kswG7ONUngoAn2OjhHJvkZYNBFRtLobTuZ8f4zxo3IF196fLscVp94xRG9cx7NwP6qx+FLnqpNhUGX9bglXhf0iCjlXU+1XBZd6pMh6294=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=sL2k1TVhyRJKaVnuqZpKLrU4rtjpfO7R4bvt8rDkFus=;
	h=date:mime-version:subject:message-id:from;

On 5/25/2026 4:20 PM, Damon Ding wrote:
> RK3588 eDP controller requires HCLK_VO1 to access the VO1 GRF
> registers and enable the video datapath.
> 
> Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
> phandle reference, which allowed the eDP to work without explicitly
> managing the hclk_vo1 clock. However, this is not safe or explicit.
> 
> To make the clock dependency explicit, enforce per-SoC clock-names
> requirements:
>   - RK3288: 2 clocks (dp, pclk)
>   - RK3399: 3 clocks (dp, pclk, grf)
>   - RK3588: 3 clocks (dp, pclk, hclk)
> 
> Do not reuse the 'grf' clock name for RK3588 because it represents
> a different clock with distinct control logic:
> - The 'grf' clock is only for GRF register access and is toggled
>    dynamically during register access.
> - The 'hclk' clock controls both GRF access and video datapath
>    gating, and must remain enabled during probe.
> 
> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Modify the commit msg.
> 
> Changes in v5:
> - Enforce the correct third clock name on a per-compatible basis.
> - Modify the commit msg simultaneously.
> 
> Changes in v6:
> - Expand more detail commit msg about using hclk instead of grf clock.
> 
> Changes in v7:
> - List all valid clock names at the top level, and constrain the clock
>    count for each platform with minItems/maxItems in allOf.
> ---
>   .../rockchip/rockchip,analogix-dp.yaml        | 34 ++++++++++++++++++-
>   1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index d99b23b88cc5..7fe7655c1f37 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -26,7 +26,9 @@ properties:
>       items:
>         - const: dp
>         - const: pclk
> -      - const: grf
> +      - enum:
> +        - grf
> +        - hclk

./Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml:34:9: 
[warning] wrong indentation: expected 10 but found 8 (indentation)

Will fix in v8.

Best regards,
Damon

>   
>     power-domains:
>       maxItems: 1
> @@ -60,6 +62,32 @@ required:
>   allOf:
>     - $ref: /schemas/display/bridge/analogix,dp.yaml#
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3288-dp
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3399-edp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +
>     - if:
>         properties:
>           compatible:
> @@ -68,6 +96,10 @@ allOf:
>                 - rockchip,rk3588-edp
>       then:
>         properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
>           resets:
>             minItems: 2
>           reset-names:

