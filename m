Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA193F7888
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079384; cv=none; b=TL9h3HNmv3Ilz9QhupmfnYSlyit7Kd07wEBSUBo7Zqkv09ZqzS5PHMhLBBo1DlVSqANV5azwaSHdhJ5jlHbd2G9aWFBA9ssdtCldsD9C+97bM92E/uovN/5/jEThIjPBeNZYJnIVHvaPoJ4UgKJTrkzRNMmmp8jCkKeaGdPUk4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079384; c=relaxed/simple;
	bh=94gcLKqdZVCylJnCw23bUXj9VoLTvMwy+QHxsGzTi8g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PN7wZEDSxR+D7zEvMMfuMGN3pIx5oIyChW5879Tt96BHlKPp3QZZDvRRTBGD92ORyEzrOE4PZHeLqBMgM07hXet9pFdM7XIejYFDeM4AToBPhfWF8HMPxl+A69rtLddzjLebjsh1/QLErDXhKcx87wb0gzV7hxUZaFJT9Cot//k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJxQ3+ZY; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJxQ3+ZY"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4350cd5b97fso282969fac.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079381; x=1778684181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqwubmezLdUWi5nwdGm9inEyQvRDdNL1kdWWslX4DTM=;
        b=dJxQ3+ZYyogghpk/WU1KXOdQi4cXD3knPlsf45nS4+iLZhxQSZieeuNNwbM2OJ4d6E
         LQJ3ez7MlWdBJCST4t1+5lyJr30wyT5jVAmw7IMGW0Kxuq9vlo/jXgjrfgwRWXpeqZCb
         9QIA1YwJF5xDFHbGBx8sfLQUibd1LyXkrYJxhGib5QxSEn/XaoMfF1ovX0PSSmxZ3MVt
         wcK1RvNuXKhO8T7dE/5jdKueADOcVD1Vi7nx7eYtltwIO5fqyvp5864U+BSXHeiTp7Wf
         rMidCTnQOcdNyL1/O+u3+JO/faxMMUyJoFIBHN+1ingJrW+CUeKt0fQH8SqI/Pv1n1LC
         cxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079381; x=1778684181;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqwubmezLdUWi5nwdGm9inEyQvRDdNL1kdWWslX4DTM=;
        b=AdKt152a96iEHNi02C+51idALFkhS5MM6cQ7D0ddtdaYzw1c5OgAEpbm0t770xTw1W
         2jxehG3rXttkR8yFD2qqs77NHtn343C1kHnddFZKJbFKKE0//Bb6kMO5RpyaqWKHkQc5
         loQ90YsrM4M+myeLfBEV+DKnu5k3TB9IbjCdfEqhsTc6L3EeAFzSqvyDnW0OYMAhKT/V
         5buOveLglqAvvg11JitZOddjIxiLOPFdAOXdae9Ro7Mii4A0JeMbX21eRadOJwEDMVBp
         Uh+j/kpcQJOGyt0z3Bk5cFFdqGyVZEFIglRbff9KmTI+rTdzRx5ydXPMRArQ9pQ4CHSZ
         EbFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bI7eL3yKyh+CS48jSmdLQITj/FIOWKVCan+W+vMIo9yxK3MBVkcJZam5ZXOFjblTKMlhZOyC/EG/e@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd6nbgfACJWkr2skZ6Cv+/BXB3ppuxwpRwOeB5j7wVSYegfqO5
	VK9cvkutNE2g0JcN9AME3pZN6gvmOAk16vUzTyYvBoBODjzLF3Airibyv9aaIS8CTLU=
X-Gm-Gg: AeBDievBcLmeaL3u9r0oyA59yPSTgn1PLdkJv/yuR6iZhfjr1HAqydQ9EzWUpekTpy6
	xMBE/itkpDxdrEU+0PuuxoTPCdT0HTpme4t/mDU3ySJ1mQKZmeTLjPOkfBfE/nfZQQC1srxp8tz
	K+37ttJKSUrt54L739vMdhzn27ewwHOej3htVDHMvGx8g0R9ebNjKpE2Dwu4syG/jfWyJcJaAiD
	NmhK27AY8Tchwzk6JsFyg00oLhoYvnzsuT6Sp+izcvlO0zdcprBF8EStOv5/XATQz7k3ZD0XXM1
	8kRW6wfpK9GtgKEt9xldrijLLMatk1p13F8xWU5bKmCK18S8W79ts9D+LowAxQgfD790wGTMo1x
	2x9ZdKgxYHnhD7dfoMBIaEcVaOvX7hDUAcfCUocvEWa5LkaAPMAZvlUsuwjCIf9Kr8uV8q+Mg1J
	qWXbMQx4CSRHl9NbYdZfhsaquAWOvEWPOb1GlzlMwi87t4e1eozn9Q1C5OyhuN1a41COphYhVfl
	/NQhkDd2xXZ48MrGfDz8tOkmUTF
X-Received: by 2002:a05:6871:e48b:b0:417:6237:cf7e with SMTP id 586e51a60fabf-434f5cd2ed9mr2538133fac.8.1778079380535;
        Wed, 06 May 2026 07:56:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454d8ed0dsm15613477fac.17.2026.05.06.07.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:56:20 -0700 (PDT)
Message-ID: <cb419510-b9ab-4a62-b210-ce07383c564b@linaro.org>
Date: Wed, 6 May 2026 16:56:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 11/16] phy: rockchip: usbdp: Register DP aux bridge
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 devicetree@vger.kernel.org
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-11-7775671ece22@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-11-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 18:13, Sebastian Reichel wrote:
> Add support to use USB-C connectors with the DP altmode helper code on
> devicetree based platforms. To get this working there must be a DRM
> bridge chain from the DisplayPort controller to the USB-C connector.
> E.g. on Rockchip RK3576:
> 
> root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
> bridge[0]: dw_dp_bridge_funcs
>          refcount: 7
>          type: [10] DP
>          OF: /soc/dp@27e40000:rockchip,rk3576-dp
>          ops: [0x47] detect edid hpd
> bridge[1]: drm_aux_bridge_funcs
>          refcount: 4
>          type: [0] Unknown
>          OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
>          ops: [0x0]
> bridge[2]: drm_aux_hpd_bridge_funcs
>          refcount: 5
>          type: [10] DP
>          OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
>          ops: [0x4] hpd
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/Kconfig              |  2 ++
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 ++++++++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
> index 14698571b607..39759bb2fa1d 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -136,8 +136,10 @@ config PHY_ROCKCHIP_USBDP
>   	tristate "Rockchip USBDP COMBO PHY Driver"
>   	depends on ARCH_ROCKCHIP && OF
>   	depends on TYPEC
> +	depends on DRM || DRM=n
>   	select GENERIC_PHY
>   	select USB_COMMON
> +	select DRM_AUX_BRIDGE if DRM_BRIDGE
>   	help
>   	  Enable this to support the Rockchip USB3.0/DP combo PHY with
>   	  Samsung IP block. This is required for USB3 support on RK3588.
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index beab20e4c512..77ad2a89d4f2 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -6,6 +6,7 @@
>    * Copyright (C) 2024 Collabora Ltd
>    */
>   
> +#include <drm/bridge/aux-bridge.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <linux/bitfield.h>
>   #include <linux/bits.h>
> @@ -1434,6 +1435,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct phy_provider *phy_provider;
> +	struct fwnode_handle *dp_aux_ep;
>   	struct resource *res;
>   	struct rk_udphy *udphy;
>   	void __iomem *base;
> @@ -1492,6 +1494,18 @@ static int rk_udphy_probe(struct platform_device *pdev)
>   			return ret;
>   	}
>   
> +	/*
> +	 * Only register the DRM bridge, if the DP aux channel is connected.
> +	 * Some boards use the USBDP PHY only for its USB3 capabilities.
> +	 */
> +	dp_aux_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 3, 0, 0);
> +	if (dp_aux_ep) {
> +		ret = drm_aux_bridge_register(dev);
> +		fwnode_handle_put(dp_aux_ep);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	udphy->phy_u3 = devm_phy_create(dev, dev->of_node, &rk_udphy_usb3_phy_ops);
>   	if (IS_ERR(udphy->phy_u3)) {
>   		ret = PTR_ERR(udphy->phy_u3);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
