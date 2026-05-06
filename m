Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A693ECBDA
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079206; cv=none; b=gRr9tJJGY7O2nkIIUIOY5odkXrJLqYEXAWTbJLTWXH7jKtyrSMx1TFmN2ytkcQRZj2kjr2Cw6yw8W7c+BMvRr/wgM9sII4T5VC4l7HZTl+oiV8ZxsD0vOjnF+pwxB5RKMJt1wpUqRmvlrKhvSmTjRRRS0A4uwHL50NPzkxOrosA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079206; c=relaxed/simple;
	bh=4qfn+tiAZ1CX5Zz/D3C/XMk+tIo8N+RJ+erQO7WoTiw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MBzucUadTVXYS19g1m133Noei8Uk+1QWIFZBq5ZLbHqzlJodbf/+AXN/nQqEBqLo8zW4RNw9xBZUaWsOm1QaCI3rBxFGX1yVK0zwxRgalACc3bKmOW8PLaipjSv+3lR13ic3gc8Vjc6Ha6JHIxd03vI+FUpI4Mb30Vyz+gHW3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wg+PEvAP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wg+PEvAP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0046078so57902565e9.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079204; x=1778684004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpSjTagPhl7VYCNjsjMoXdAj9yIuGfraDWHI738kHCI=;
        b=wg+PEvAPi77brTrVXQtoaBcny1y6uXNNWZbsgbYHv5kpBCQXXtFEu4f0SS4rDz0zhh
         JrqQRBwEsB3L41kMhfVLy0Pqj1gsSgrgGJkTJ85fqQoNtgOZw+TLjAvq3MA8RERIK8Nr
         eDOK127FTRWI9Zr871q3G/x92X5qbcsxQHeb/nI20l+L8RY7Qz3hZYgYW3iqNsyrICBm
         oeJzJPCBgyoUzWTPh6nDW45XQMfXaC93VOtlHUR5+9qlb2S094e4aEQquFRGEq9lRLGx
         MaUovSnm6oK05cBHRPT+yASSaTlUjBCDuGCxLKiHrHp0fppxZz5nUNqvrCUcYDGBBymN
         4WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079204; x=1778684004;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpSjTagPhl7VYCNjsjMoXdAj9yIuGfraDWHI738kHCI=;
        b=WK551vCFrBddbSJP2OybdecZ2VI/NCCwyuiwb5gouzPoZWuxkqckSUB5bsOsCc9TKq
         4dhFAIWtWmqFteES7InMB5pgfSH4XHXAp7zp80jtnO79TIRQsz9WKvp7NlJyG0tHxzZr
         hfiEnCYuCswtPcsQSWxVqoH8gRHNILBW3c/z4/PAJIIORhAC20hNtEb4JtIuhLarTH15
         7YHfLQibturB50lYK1Dgf1wtFuRl2HoNeHwSNq5fLdyj7pIK8PbUn86u51baA+e+tLuj
         hRqVaQs1+5ZLUr2qjWKDn2IKeH4RJhhd5vvum8Yf2OZwg6q2ojlaww8o9VFRseADyNuq
         eYaA==
X-Forwarded-Encrypted: i=1; AFNElJ9SNHVsA242XF5q25fyYq1LKGmZQDZq+NAu1sYX7O2uOJH6Vo5/wkaNxdma/CzQqH4Wc7f4Kuv1+SPo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywir5mij2rO4J5YQk8JCNXg/S2/vFn4WuUEepXvQCuTsUCV/Fon
	xEW2t8V/HS5VAdcj59WlFBLvxa2b9/aEC4YquaH5TNDbx6k4guCLCqJHemJjCNI79hw=
X-Gm-Gg: AeBDiet8ELROzhpmj3p0eUe9u5sJpWWni3JfshOvmNBSbCM++E7w+k96XlnY32BVQUV
	51s6fsTNGkjik4VOqh6OOVAN8HX2EHKk/QAQurwSAbn4X2H3OmA/4hvphGxjX5YJqwZq0qi3XDc
	jkHbIcqwoQ2+f3+RF8RASPkbWyHWAiHPzioYUaP2u2pVY3P8p68ZhHiU2dlPLlKnAibVoWrd4HR
	UgM4CYkqrULbvZiBdiva6GTpncEHSvd+EvPPDbzBTVol7mI6vppIh+wVndJ1DjZSl8SffPor7YW
	AA9YYoFnDIVUdnmMbYVRGL/tSH8wcfAOh078c0xtShvhLa2GdooDbJHWMCtvFWYw2zvLJu5Jltx
	n49BYH91xl3+4xBEASTsOnuBgs5PQQ/o7zWiDI3MCDHI/u65h+9nyjhmb/8fSaibVQNLVnJrL/g
	pQtx19J1yGfXsOVg1hR61haaILZwpO61H+P2k9+YtmxQ2E+rv4xrlNQ0gVDzvkhfI5/IbHlPvli
	KIuklqk9xbEtPCazQ==
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr72610725e9.21.1778079203544;
        Wed, 06 May 2026 07:53:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530a68aesm28180715e9.1.2026.05.06.07.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:53:22 -0700 (PDT)
Message-ID: <40518e75-fea1-4367-a47a-024cf115bd12@linaro.org>
Date: Wed, 6 May 2026 16:53:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 08/16] phy: rockchip: usbdp: Rename DP lane functions
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
 <20260428-rockchip-usbdp-cleanup-v4-8-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-8-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 18:13, Sebastian Reichel wrote:
> The common prefix for DisplayPort related functions is rk_udphy_dp_
> (with a final _), so update the two DP lane functions to follow that
> scheme.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index bf8394174294..6d7ca11b308e 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -547,7 +547,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
>    * ---------------------------------------------------------------------------
>    */
>   
> -static void rk_udphy_dplane_select(struct rk_udphy *udphy)
> +static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
>   {
>   	const struct rk_udphy_cfg *cfg = udphy->cfgs;
>   	u32 value = 0;
> @@ -576,7 +576,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
>   		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
>   }
>   
> -static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
> +static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
>   {
>   	u32 val = 0;
>   	int i;
> @@ -1072,9 +1072,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
>   	if (ret)
>   		goto unlock;
>   
> -	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
> +	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
>   
> -	rk_udphy_dplane_select(udphy);
> +	rk_udphy_dp_lane_select(udphy);
>   
>   unlock:
>   	mutex_unlock(&udphy->mutex);
> @@ -1092,7 +1092,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
>   	struct rk_udphy *udphy = phy_get_drvdata(phy);
>   
>   	mutex_lock(&udphy->mutex);
> -	rk_udphy_dplane_enable(udphy, 0);
> +	rk_udphy_dp_lane_enable(udphy, 0);
>   	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
>   	mutex_unlock(&udphy->mutex);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
