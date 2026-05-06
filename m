Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA112481664
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078873; cv=none; b=mhZ8LJOedBNxutw94MH/nmu5tN+iO9eFuOXyP2Irx7js3wdOlOvFETKqyRZDB1ADm2sTLEypy1ywG0cPXRXp0FOzB5v2cSFUgQro5Z5yXlMbeXhfnStZHImU8y1Uy8dldJLEqiM0RX+Ggcn0U3FzsHFtrxT/o3HQrLXk0lIVv1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078873; c=relaxed/simple;
	bh=2WZFAXWcYYtWZ8k/PgJdpY4GDufKOQsH8I/wniYfAbE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=c7t6bqQh6Ols1iD/+6m0XuhS8fKk2sSYoLcq3WSzqL99osIEDVo94MpliC0DclYDL1xxeKBLZ28ZvHPLMPA3SMqaO0+TCJc3WNxoz9jZhmcVRrBM5+zLpq3lWMNhCvdzXaJdUhfxwcWqjX980GvqPPxcFOLQEEczU1hrUhD28Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u3XRVYkZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u3XRVYkZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48909558b3aso71948365e9.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078865; x=1778683665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3vToQ5Y+vWhpVQnvtWFjRehlTKodwndWbzaDErO2cA=;
        b=u3XRVYkZpFKAaZlMLV/BXG2jL3MBQZLsQSkXFpbsGXx/RHp0/6yTW8X+Ai8a008UfW
         F+R97DyNhzWhD2lYxTm6OE4G4UW8vx7//WZPC88yjwODiPHv89DzRuFY8rnvFHIEkqwY
         tD8mwxdLE9Z1bhvqM+WhLnFd6+tHAe2lEZG5BVn7q3AI4zflNjp5vOsUE7G3z1G1iNrF
         21vayC46qo5yaDXmR3v/bOGEkz6haGXNQFrlrRwNjNNtEietMwdqOeQf3ZuxtTiIj0rd
         9rrjToeC1b61QR1bQBt744g9usv0VUxFAVE0F51MtEBEfvQjQNSYwhXyVEm2uT9Ml0zc
         Py1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078865; x=1778683665;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3vToQ5Y+vWhpVQnvtWFjRehlTKodwndWbzaDErO2cA=;
        b=ce4WgYe079X1FK5GbcjP44RNUrQnsrUAYVx4f56eHGgM7CAi6HrwpsdREu1SiR2/Wb
         MaabSpZc0fV8VLBdInOt/iOJGavyFRmzEISQQO/XwZcnb7xVR1juhFKPpFXyHE3wqEia
         xzBumP/GLw5ZqagyCZHPl+o/rdixMcnMBe9fwip7vsjDdoCtPPS6D1UmSugiRHTCuffN
         JnV0/Etpu7IpEAIW0iQCWp97bxXHF66EYpaHhmiwvQqcdkBc8WAodduNX9EJryO8AxO5
         a3E4duRuEmavyONdg46eC2MVsp3Yc0f5E3bKSooCFmEg7/qlOQR0oDdVO7yn9KuY8ttX
         2Z9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+3wLYHovSDFvNc+YM5azI92GVHpOVoKn0o5ak0kkNUW2NP73QDNgaSQPlcyUHWz+C8eKnPbMdTVyx2@vger.kernel.org
X-Gm-Message-State: AOJu0YxV+c+x7fsuSeB5MLrGB2ThfF/XBqluitAe9HNdww3Gki6yrXeA
	iHt4ipouMomTb6BnZOIydOzGSLZu3DhdLvmmVU4fHqtA384wEFUCUsmq7dAJ/coxdRc=
X-Gm-Gg: AeBDievpp+A4Ajl8m/oPlCyZP+t4J4eNLv8sywxjOStVhc+5Wa6FsSoPybegx2HSsFJ
	1GbU7Ghw+W+fhW10rHe9/VuNSDZqdYWcHEI/TCsqjdpf5fa2g3S/ICnkRXTS/cCL+wtkqdAyRnT
	WFnIiNX17ykgmtcE3RHvCNN2SOifoxIaUVCzhtDLnuqGQ6Gyi7puWTVAzfacxL5WUIZ5Vd32caD
	d8pJBteaMsJ76yNcjlr/49r0LerldU5VDQ86pI/09cOl+2LYrhiqtKHJBmlu5Y3It2Q/HQviNy/
	ibBmN9Y9PAGuY0s6CMD7zUf3atstdgm3S5VWejbIsVjOLL3057A6rXL3vHhC8gnijkJ6fI6S5fy
	n1z5ZOH/DXLGo6qu0lgBsnzNvdGO/B+0u9tat8mDEe9gFIdI7IDyhDXD9IqMtHwLHNv3DmApWwA
	24M9UEJHV/2fMhTb9RSFbmPXDFVMYTQqunSrgsFvflvDmhCx6aZZbqI06tGOltf/WRJJmqweSEH
	6MwzMtUhgiNMY3zSA==
X-Received: by 2002:a05:600d:849c:20b0:488:a2ac:a34c with SMTP id 5b1f17b1804b1-48e51f220e7mr48119355e9.12.1778078865201;
        Wed, 06 May 2026 07:47:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b213asm18805425e9.2.2026.05.06.07.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:47:44 -0700 (PDT)
Message-ID: <b4e3adc7-bfb9-49ed-a2aa-30feef074554@linaro.org>
Date: Wed, 6 May 2026 16:47:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 02/16] phy: rockchip: usbdp: Do not loose USB3 PHY
 status
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
 <20260428-rockchip-usbdp-cleanup-v4-2-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-2-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 18:13, Sebastian Reichel wrote:
> By default (i.e. without manually enabling runtime PM) DWC3 requests the
> USB3 PHY once and keeps it enabled all the time. When DisplayPort is
> being requested later on, a mode change is needed. This re-initializes
> the PHY. During re-initialization the status variable has incorrectly
> been cleared, which means the tracking information for USB3 ist lost.

--------------------------------------------------------------/\ is

> 
> This is not an immediate problem, since the DP side keeps the PHY
> enabled. But once DP is toggled off, the whole PHY will be disabled.
> This is a problem, because the USB side still needs it powered.
> 
> Fix things by not clearing the status flags.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index fba35510d88c..744cc7c642f4 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1009,7 +1009,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
>   			rk_udphy_u3_port_disable(udphy, false);
>   	} else if (udphy->mode_change) {
>   		udphy->mode_change = false;
> -		udphy->status = UDPHY_MODE_NONE;
>   		if (udphy->mode == UDPHY_MODE_DP)
>   			rk_udphy_u3_port_disable(udphy, true);
>   
> 

Looks good, but any fixes tag ?

Neil
