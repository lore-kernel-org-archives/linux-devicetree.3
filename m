Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F89246781
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079302; cv=none; b=OfYkhRSgMjIooF8xjRiurTypqMMh3uVy4VWFxRCXP9BTrEq5wrCLPFNztDfTM0C+ADe5Zn5KDMHClVHEdW7i+znUk+V/Np5OMjpqiC1Ia3ss7mllHMRIJqrqxjYEzx19WFAtDadN/LOQ/tVJBZ7eFeSFH9tYkVvD3bLzuREkbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079302; c=relaxed/simple;
	bh=rpq98Csl+lQ5wYR6qlUiykh7sw2CinuH04grcHiC76Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L4wvZhJQmBNMrnMEBym+e2zwbPXvuXV/Pr1gxCY/zu1cZ2T+kbDWJ8SG9ahrR7LpXD9HBSoU7YIyRu4tI/psEB3xYF8w7LNVwsBa/9gWkVuSRcwRUCPyvMLf6rLRGB7tOnNjqZahKEFi7a5Kh6QT2FNe9ixQ3hRVFF8M3XYTLlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L4Ub3bjI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L4Ub3bjI"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44a786a9a35so3658079f8f.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079299; x=1778684099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9IziybJHuk3HSxCnNSfWSRrMnoKvg7/QyPJ8LC6HiM=;
        b=L4Ub3bjI93FbAV24RYiF/YbXq8jYWSF+Z0XeIi5xPvjLx+uZCg+Z8306PrA0CJgcLP
         qED5M17nd7fB4XCNETqfOtYYNU+7lgCvaVW1bKmj5pGhcuNQHfdfZBQduJVoy6P/euOv
         D+o35miAuA2g25dvCz7MsrGkFe+kUauVudRpmDCQOkzkDKNuR/8fOgi+DfrWoidhvrff
         Sr9NtB+oguPa7+0WaFUHil65Cu4cBZT7MXa1u+c2rgckvtZwZ1uBc0r5IBh07xLxlXMc
         I9K29g1Dixcm2uBeN070kUnNhmAQQb1oLQwvAq1b907W7ZJRShuF1Xc9qAEgJnsevxzH
         kI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079299; x=1778684099;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9IziybJHuk3HSxCnNSfWSRrMnoKvg7/QyPJ8LC6HiM=;
        b=hrf+ig6eNoVGqx8XqAY+uF6q0xQbt1DeHJ67neqMK7WEDw0ORmNVvDBh0+rkfdOg5g
         B3pm+dXeFSf6Rft7hUnlPJhPec2tp7dxePe0AuhRJFrM3NstcszeMfZH0ftrzyZqLJbY
         8F5wCysh/e91KZzBZaFkhasaa7ZAPMEJOnoeLv7I074+a84uqHBYP763isuO4m4eVQWh
         Z6e7E6HylL3LtteJukU08jeKjysu2fB0rGfqKIESgwkWEec56bS1UC1PyLvj3eedMqf9
         sFQeIfDmSRzTkDgscndRLF1Wq/WLq2p/uO9+LbbodWfFbp+XwQWWc8O1II6EUe5AvfVG
         D69g==
X-Forwarded-Encrypted: i=1; AFNElJ8hMxhusqfe8vJKx3ZKQOBpbS9mCC0e6NnnDOO2zfKhWqHZm/IUvYNIwjNFN/6ypUL8P1fn62fKteme@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/5dzRJRwrMdMzLvz5IbkoPY7sDfXbVsLFahpuxdjTpR3jRj30
	2dmIOjuGONA0E24IhwdVi3SpRptAgTRIN3dpA5luPxAIYVYymOKmEzKfM1i+lBV4D6g=
X-Gm-Gg: AeBDievPbOPK+3BeftWHpE5ZpPej6m7apIv1PCxro+XOrLIiqFZ+DH82UxdhJ18JCX8
	FGOJzwrMJr3SDpPQIVdaz/LrdkaE56Rnv5Uw14RLFVjrJsd7U4IAL98Gp9ZID6NJeEFOUOiT5vf
	CgxWN8qvJuu+TFZ3n8QjmAzOPI+kkkjX1GvZ+JvR4heKO2QZvwMf5aQtFIOfYijv70USCTDIT69
	BEZa6om7D5+cCOxmdei1Ryx4A+UVc5GgKTP9M6kGPtKZcLLmvWKmR7g8juI0qWqs25yxxQmKnVL
	ezJqCPiqdrepgrx5JQ2Kbj9VMLcmHAsWzJd66OUDwvWTukmikeKqkGmQqKwO0AYAf/vTFa2HRjr
	HVU89jy/pHNqzx2xVQipx+OxgHHZQNI+wolSMP4hZpssOq5BZKAtRI3EgmENo5oZSkwZdAwlJky
	stTvkpy9JId80RfZAPhwkjbt5CC+fsMA0pqe2uclHWWQDcAWbGxmAJ7Kr2X6jkIOr4iGpTmuLwF
	eWslR22AFnc2dvygQ==
X-Received: by 2002:a5d:64c9:0:b0:44a:3aee:370e with SMTP id ffacd0b85a97d-4515ce1c5aemr6073557f8f.25.1778079298902;
        Wed, 06 May 2026 07:54:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm14567686f8f.28.2026.05.06.07.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:54:58 -0700 (PDT)
Message-ID: <aeec8c6e-c0dc-4643-a117-be3f787fcec2@linaro.org>
Date: Wed, 6 May 2026 16:54:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 09/16] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
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
 <20260428-rockchip-usbdp-cleanup-v4-9-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-9-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 18:13, Sebastian Reichel wrote:
> Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
> with the existing helper macro.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 6d7ca11b308e..1bfc365e2b2c 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -12,6 +12,7 @@
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/gpio.h>
> +#include <linux/hw_bitfield.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
> @@ -75,7 +76,6 @@
>   #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
>   #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
>   
> -#define BIT_WRITEABLE_SHIFT			16
>   #define PHY_AUX_DP_DATA_POL_NORMAL		0
>   #define PHY_AUX_DP_DATA_POL_INVERT		1
>   #define PHY_LANE_MUX_USB			0
> @@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
>   #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
>   {\
>   	offset, \
> -	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
> -	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
> +	FIELD_PREP_WM16_CONST(mask, disable), \
> +	FIELD_PREP_WM16_CONST(mask, enable), \
>   }
>   
>   #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
