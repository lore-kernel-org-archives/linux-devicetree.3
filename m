Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B3F3ED136
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079193; cv=none; b=dTWZvVl7S0WfKbGGyPUWaEpJJViu6JlUVzR1aqTwpmfOdrPYmLfFu6iD6w6X9Ar0wi9HMIbXIgjuLGetPuC8ikPUuuKKYroNXXNPeJ/piYUv5XmJ2M4SbMXx9h+GDtSELQLVnW3m8MJy5YQ0XRV+7ekbqKnHDUUkbYslIAy411w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079193; c=relaxed/simple;
	bh=R3SSPJXvpf5OjuYx5rEIzWzUqFNGK3pdIYU6G3MlSWY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IEX6Nk4rJvLXHBpoCqhjgr1gzhbjKsVrWYsIDq0X8tOYzNFio+ts4Tx+w6Q2d72XUhC7J8bJm0a9fR5baqFrxWnpU9mcVqWjRQP2GbOUuDRn0b0zJdWUzeE52fGM3T+9B7aZ948TO0ll7x7FMdM/WZ5Nmdr9Zv0XX1mQY0SPcVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=svFgNIxr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="svFgNIxr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso50697085e9.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079189; x=1778683989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAySrM3bN8yQAz+pyh9tgVeeAYL6w3U2oSQp8JsglNA=;
        b=svFgNIxrI44E9oB59OC+yyeWhEZ+IG6CPbV/0/iGVK120i0UMNuBifv6fEf6wI3Nn3
         bxEUyBqEe3BPPdW4vgciOqgbA42kc1BZhYAtNnWHv/3cSs8Qh8Q0EoPLvePpyCA+G2U1
         yMxOZlKwFgvnjAhQu9Nt4A1onD/QbE7CijAwNXpjgivw6A+80/C+KR+HN2h2LDkdEp8M
         Ayx/zZOTfWYS8zmTlgWkPYJnR7Vl4ca+RN7jW3/DvzlSSFO7s/y1z1o4BJ+UCTGcEpKI
         H7fA0FbM3uU/9MOH5dSP08Bi6S4GHtSsOzy9ZHe9QahjKPd0zotZl+DDeOkIO3bHKndB
         0jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079189; x=1778683989;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAySrM3bN8yQAz+pyh9tgVeeAYL6w3U2oSQp8JsglNA=;
        b=swQaaxLZ76gg0M2ujBEbymx8HcGJIUpLxIBI1jYGPyyafkO5U8amt1gCDTDpxkp6wv
         ygeQI4PJ7Ev/H/7a/kuxKE6u3hEyWxd1qlgH/44Gu3WVF9XeQDJhW0TfqZacFffWkEHx
         QN9aXTfhnRla7LuicMCvcuc9Yi78PHl3kc5o4yAnH2DK/xL+sSZbGMG4nbk8e9lvU3Jq
         auKqXyrmJACApf2Go6WYRPtVv3WU3j3RDDmayQwomMM4jEsDcPa3H3AyKAZv/2Lm0Md/
         93YOlK1uaYojUG4Zev/yc5JXBeXV8pw3iYqN2Ms+sm0LBei1RDboYrKV/+E2nfaPfAFk
         QUug==
X-Forwarded-Encrypted: i=1; AFNElJ9TNV3LqX/ck3WRPO4OAG0EFelS9TJdsdPmlV4oIgm7dMBO37z1nQNdOWqcG0U+4P63na6M0yQMhnih@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4RhxfrZl/YFAxdkaxGb5D5Dag6pl4W6wy9V4HSb4HbOZvHpp
	h+A5q2g4EIVrgjCZGxhXtxpoRlNw4Hi0Il0F+iqgVB6e/PEpK+u3d5Qme4zhHFVBwDE=
X-Gm-Gg: AeBDies/vn0GQIf1XlPLXjyYPyBlWuH/nvvwYtRvi8hclE5HLRHEqsraWY42ltwZs6J
	nrDq2Ks4qtCg+60xTOiSaDnrKFkqi+CtkaKhhyrYtFtJ50teBbL5vUx58MnUDHUok6KKGUw7vxY
	Oe/QeznmxRfQq0QtFLORnfm7GHgrnpQcqZruL4b2awkhZvzAhKqIGKkn8DDCTWc7lyd+cKT3Wia
	jO4CqJ//0ZJpgHmbhfCekAJR65tyfWnJudlO3zM2mlTyyvVtQ2y2kUGJgKQJp6iFBMvOt2eYyD6
	+XUPZOYE1erzrN8U9QEqn6n9rP2y+xEoQqujwvHxPR0BgBPIuHQKuYqi60tmju/BgV1xsWA8ZoF
	EWof6JhtWPIlWKTWbQ2/jU1FBHDdCWwmtHgD2nFGocW/A72ECXY0ROGmnzzoU0rSWFIHZrXhtOi
	XYewNd0iIVqKQoVMdvvoURZSPb/XzXj9XDLvzo7ZgCHQT0nh1dO9eBTv69ev14Y18YK4KfxlxvH
	T06ZPktPb2CowmynA==
X-Received: by 2002:a05:600c:3e8d:b0:48a:6268:18a9 with SMTP id 5b1f17b1804b1-48e51f32797mr68799045e9.13.1778079188986;
        Wed, 06 May 2026 07:53:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b05d9sm25672695e9.3.2026.05.06.07.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:53:08 -0700 (PDT)
Message-ID: <f29df43b-111d-471b-8579-0196596fc32b@linaro.org>
Date: Wed, 6 May 2026 16:53:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 07/16] phy: rockchip: usbdp: Support single-lane DP
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
 <20260428-rockchip-usbdp-cleanup-v4-7-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-7-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 18:13, Sebastian Reichel wrote:
> From: Zhang Yubing <yubing.zhang@rock-chips.com>
> 
> Implement support for using just a single DisplayPort line.
> 
> Signed-off-by: Zhang Yubing <yubing.zhang@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 61 +++++++++++++------------------
>   1 file changed, 25 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index febc148a754e..bf8394174294 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -193,6 +193,7 @@ struct rk_udphy {
>   	int id;
>   
>   	bool dp_in_use;
> +	int dp_lanes;
>   
>   	/* PHY const config */
>   	const struct rk_udphy_cfg *cfgs;
> @@ -537,6 +538,13 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
>    * <0 1>                  dpln0         dpln1       usbrx         usbtx
>    * <2 3>                  usbrx         usbtx       dpln0         dpln1
>    * ---------------------------------------------------------------------------
> + * if 1 lane for dp function, 2 lane for usb function, define rockchip,dp-lane-mux = <x>;
> + * sample as follow:
> + * ---------------------------------------------------------------------------
> + *                        B11-B10       A2-A3       A11-A10       B2-B3
> + * rockchip,dp-lane-mux   ln0(tx/rx)    ln1(tx)     ln2(tx/rx)    ln3(tx)
> + * <0>                    dpln0         \           usbrx         usbtx
> + * ---------------------------------------------------------------------------
>    */
>   
>   static void rk_udphy_dplane_select(struct rk_udphy *udphy)
> @@ -544,18 +552,18 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
>   	const struct rk_udphy_cfg *cfg = udphy->cfgs;
>   	u32 value = 0;
>   
> -	switch (udphy->mode) {
> -	case UDPHY_MODE_DP:
> -		value |= 2 << udphy->dp_lane_sel[2] * 2;
> +	switch (udphy->dp_lanes) {
> +	case 4:
>   		value |= 3 << udphy->dp_lane_sel[3] * 2;
> +		value |= 2 << udphy->dp_lane_sel[2] * 2;
>   		fallthrough;
>   
> -	case UDPHY_MODE_DP_USB:
> -		value |= 0 << udphy->dp_lane_sel[0] * 2;
> +	case 2:
>   		value |= 1 << udphy->dp_lane_sel[1] * 2;
> -		break;
> +		fallthrough;
>   
> -	case UDPHY_MODE_USB:
> +	case 1:
> +		value |= 0 << udphy->dp_lane_sel[0] * 2;

What's the point of keeping this no-op calculation ?

>   		break;
>   
>   	default:
> @@ -568,28 +576,6 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
>   		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
>   }
>   
> -static int rk_udphy_dplane_get(struct rk_udphy *udphy)
> -{
> -	int dp_lanes;
> -
> -	switch (udphy->mode) {
> -	case UDPHY_MODE_DP:
> -		dp_lanes = 4;
> -		break;
> -
> -	case UDPHY_MODE_DP_USB:
> -		dp_lanes = 2;
> -		break;
> -
> -	case UDPHY_MODE_USB:
> -	default:
> -		dp_lanes = 0;
> -		break;
> -	}
> -
> -	return dp_lanes;
> -}
> -
>   static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
>   {
>   	u32 val = 0;
> @@ -659,6 +645,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
>   	}
>   
>   	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
> +	udphy->dp_lanes = 2;
>   }
>   
>   static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> @@ -897,7 +884,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
>   		return 0;
>   	}
>   
> -	if (num_lanes != 2 && num_lanes != 4)
> +	if (num_lanes != 1 && num_lanes != 2 && num_lanes != 4)
>   		return dev_err_probe(udphy->dev, -EINVAL,
>   				     "invalid number of lane mux\n");
>   
> @@ -923,7 +910,8 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
>   	}
>   
>   	udphy->mode = UDPHY_MODE_DP;
> -	if (num_lanes == 2) {
> +	udphy->dp_lanes = num_lanes;
> +	if (num_lanes == 1 || num_lanes == 2) {
>   		udphy->mode |= UDPHY_MODE_USB;
>   		udphy->flip = (udphy->lane_mux_sel[0] == PHY_LANE_MUX_DP);
>   	}
> @@ -1074,18 +1062,17 @@ static int rk_udphy_dp_phy_exit(struct phy *phy)
>   static int rk_udphy_dp_phy_power_on(struct phy *phy)
>   {
>   	struct rk_udphy *udphy = phy_get_drvdata(phy);
> -	int ret, dp_lanes;
> +	int ret;
>   
>   	mutex_lock(&udphy->mutex);
>   
> -	dp_lanes = rk_udphy_dplane_get(udphy);
> -	phy_set_bus_width(phy, dp_lanes);
> +	phy_set_bus_width(phy, udphy->dp_lanes);
>   
>   	ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
>   	if (ret)
>   		goto unlock;
>   
> -	rk_udphy_dplane_enable(udphy, dp_lanes);
> +	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
>   
>   	rk_udphy_dplane_select(udphy);
>   
> @@ -1365,6 +1352,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
>   		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
>   		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
>   		mode = UDPHY_MODE_DP;
> +		udphy->dp_lanes = 4;
>   		break;
>   
>   	case TYPEC_DP_STATE_D:
> @@ -1381,6 +1369,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
>   			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
>   		}
>   		mode = UDPHY_MODE_DP_USB;
> +		udphy->dp_lanes = 2;
>   		break;
>   	}
>   
> @@ -1529,7 +1518,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
>   		ret = PTR_ERR(udphy->phy_dp);
>   		return dev_err_probe(dev, ret, "failed to create DP phy\n");
>   	}
> -	phy_set_bus_width(udphy->phy_dp, rk_udphy_dplane_get(udphy));
> +	phy_set_bus_width(udphy->phy_dp, udphy->dp_lanes);
>   	udphy->phy_dp->attrs.max_link_rate = 8100;
>   	phy_set_drvdata(udphy->phy_dp, udphy);
>   
> 

