Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF87481661
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078972; cv=none; b=jq1Zn0/0mLhY+FXZ3yBMHJZCxZuTqmNiHjjLjjzJKrKjNTXYG88Xo1dMwuRcwlXo+++R5H6qUqeXPBwWgO0aKl9WplG5Vvvt/0rdvJqZEWFHTjJ8STgRs+7h4b2JyEAA+OJGq/uGs6u19t14Q9kPp1ndrsNBUfdDv7LUIBNc/ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078972; c=relaxed/simple;
	bh=qnusQFmn4pMAFv6LjyuEsqmsFou/SxGhc6MmczAZ63Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fICAsfznIil+8kXl5GbfJxqrKS/qxwoVHwqdcBnIwe6OTrPqbwsA0lBYXv60KRKjvDOE6NYkZehGsx2izhWz+0NPGP8IPCAWZrGTzuMFsB7e2Gnpc0v/6ZtlV5q83FCe5B9TrcG4gRGnb354wjUT2aCcLOzxKo5TIkj38Kex0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u149sAjA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u149sAjA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ad135063so62107175e9.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078970; x=1778683770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jERKJjknkdQ4i9JtoqjPY+iXeD3hkNunomlZQlqiv/8=;
        b=u149sAjAqQrk40msNvRxK9DRME5bv/t+iMvsK+9tyyO+T6Vm8B2b1J1MOKGR2i7wS9
         bGIH59guJmAb+1uiPmJMZgKMpvynNw9NJOxQCDDpqpmUivMf6fxstssjpnna8Z+Bz7tn
         JAN4gOmuXzrgPZi/lqiHFy/L3rNCQVYGDSJcTcXrmGhozB7yJzbcE4cH3p5XgC8QTEb3
         mTdnqlnBB9MNjSaV2aRhhYy6VSVKFh3OIOvh1go7zm+OtF8kJTw8T7diU1s6xffT+Xe1
         B8zVMoz4lcgXa0WDb8Pjp6Yfqlxqnqa6kAtcTxDlk6AR3Yy5pARuXwwZQ87PFpn3ajTB
         VQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078970; x=1778683770;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jERKJjknkdQ4i9JtoqjPY+iXeD3hkNunomlZQlqiv/8=;
        b=GC6PKdLOhWYKyZLzWc03ccsATYM6PNo2dJ23o1vDRBZ4KA0Sjqig1MjEaOdgsoJkir
         34dbEXSUzVB1W8Snb75gXHHTBPSXGE71f3B7JzA2DL/AeJ+59snn2PdgluidRkL/F89w
         039kXJFttKJyyz+fU4Ho7DmwR4cs3pmY12ojiXeExRSW4tUycT6Y2I+OuSdvOhueYD11
         flXFl2PCbeBrCSDQ4lKM6TmBuE1v8mi13lkotPM2atUe+OGJJ/n7xDVYyxYMSj/eXI86
         rkfw3XH5wiZysW6/qEsMU/agjmzKCgivDy9z5hkf+mWCic1JBRspAKzHSTdrq/5UbIoq
         3gFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pab+k4KTBu0HJJGVXam3xnUnF5bs9OWbjpWOhxRpehYXNb32PMyA9jYpnnUEEjSUSruZcYwpWWe3I@vger.kernel.org
X-Gm-Message-State: AOJu0YwkZgNKW1YgIOgQ/TNEv9vO6oyWIYD+F1O0U6Sz+u62kRQAMyeB
	Lzr3KJbEEKsbci001aZU9UwZR08PDp1Mhn2EO9SEHeLKQ007B0eQrG0dJKW+tZxGvUY=
X-Gm-Gg: AeBDieshkXUXIjeyjP0E00x2y3oIEWXm+2ioFLg8HbNA/J7ztr6aXcZd+qCXMYPRuJ+
	XLZC/5onJlKFfQgCUH1S87fpWFQGnQR1DsgjSVqkPT51dsPsw9edX+70eYJ+W7n6ZJrocDHTN6O
	4jpjZaynXi+2zqq95U3wF7rBIvxnsmB/08N8DVK8X+J+x/xbtN3u5wc9NXlO5MrtepdaXONEBHW
	fH96qsfyhrQfnfMU1qEqTv5Mo+sX4Q3X0kSwJe+YSGU/e0T0FYXDEuLNA8aX85sSwak4t/crERR
	4hNza0jlY5VUGrUCRHPav8b8SptSUGnkKz42PdVJznAhbreo+0dBRYMfyYa14VPuEWJPrSF0uoH
	h/piwuObrebIWfhM2uiqKwy5+yCUgtANUzgwtvbTGMkwMJrb4go3imNimz7LWZzhRy60AFQsBNw
	kpvxQItPd4sJ5C64kJdwKwaWp5S00z7f6DTdmy49yosRprGogDxl2kdf9ShHMPPzPRt1n+aGrSz
	/UYQMqjVYMYwtw8ZA==
X-Received: by 2002:a05:600c:8907:b0:48a:65ad:1881 with SMTP id 5b1f17b1804b1-48e51f32a46mr51738465e9.13.1778078969666;
        Wed, 06 May 2026 07:49:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312dcbesm18061055e9.22.2026.05.06.07.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:49:29 -0700 (PDT)
Message-ID: <3010fcb6-f5af-41e2-aa5a-ba4401513a52@linaro.org>
Date: Wed, 6 May 2026 16:49:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 04/16] phy: rockchip: usbdp: Amend SSC modulation
 deviation
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
 <20260428-rockchip-usbdp-cleanup-v4-4-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-4-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 18:13, Sebastian Reichel wrote:
> From: Frank Wang <frank.wang@rock-chips.com>
> 
> Move SSC modulation deviation into private config of clock
> 
>   - 24M: 0x00d4[5:0] = 0x30
>   - 26M: 0x00d4[5:0] = 0x33
> 
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> [Taken over from rockchip's kernel tree; register 0x00d4 is not
> described in the TRM]
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 98562a888b42..1f686844c337 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
>   	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
>   	{0x1a44, 0xd0}, {0x1a48, 0x01},
>   	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
> -	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
> +	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
> +	{0x00d4, 0x30}
>   };
>   
>   static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
> @@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
>   	{0x0c30, 0x0e}, {0x0c48, 0x06},
>   	{0x1c30, 0x0e}, {0x1c48, 0x06},
>   	{0x028c, 0x18}, {0x0af0, 0x00},
> -	{0x1af0, 0x00}
> +	{0x1af0, 0x00}, {0x00d4, 0x33}
>   };
>   
>   static const struct reg_sequence rk_udphy_init_sequence[] = {
> @@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
>   	{0x0070, 0x7d}, {0x0074, 0x68},
>   	{0x0af4, 0x1a}, {0x1af4, 0x1a},
>   	{0x0440, 0x3f}, {0x10d4, 0x08},
> -	{0x20d4, 0x08}, {0x00d4, 0x30},
> -	{0x0024, 0x6e},
> +	{0x20d4, 0x08}, {0x0024, 0x6e}
>   };
>   
>   static inline int rk_udphy_grfreg_write(struct regmap *base,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
