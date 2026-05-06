Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72544DB6D
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079359; cv=none; b=uBaPgn8UCcYaIADLehjj/JWCuggyRZ950CBCd5mJdicjMjJvpAXJPaPPO1DLyBsihx46IIrV7z+qdG4K31oKxeq7EEFv2piW/U3oAi1+/VZrkQg2GjR0dUVvm6TC+GeaJ0sPcbRXS2Lr52Z1mBt9MY6zhocuAFWVR33SLBGHfs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079359; c=relaxed/simple;
	bh=jl5NKVs5Ycw4SciXIs7vkba7yu3R0UBZ4/DWwYzN3ZA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lCwdrD0R0G+hM4Hq+95ppdAmPaR2eynMlGGB15s/Gy+RjbyO+nhnNitGibAyz5AzPedEuvq16AxXRXyjTH5aIV8MGl35WaRwvDeRlLFiGrq+kxNMhwBmctHbVFrLQmKRtu0lbPsLuvE3A1k4Je8GRMutNpYeVFSLCm7OtdQ8BiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TnXfx+K6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TnXfx+K6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso50066555e9.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079356; x=1778684156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MideM2n02iIKTDCku+HSAt6i6mJ+89mrIgdH74VDGvI=;
        b=TnXfx+K6H/rI4laGbuJL9ZFGTEFkp/ZmJxBgz4NReXcXB5a8MMHNJqTb6K0+EcA3Y/
         YwUiXdzrkhyH32Hv7j6wVKsSAY88svw4hJDNGkeAUgBsypc+rA4lUNGBmi103WzZPsmN
         Qeg6c1G7yQ2Bi+WoPryiqEZUYzwo9NtFexheHxf1aCdQql96HOXBxb/pT/lH1zCR34W8
         Lk1Y76RzA9zyqjZaSaQDmrMDJ8KxTZ39WUx5Xb2lKYhiB9iboL2dErteydiIGyrSHT9V
         pjPZxy2LDebxbzTFkU2usj2ZlmdLbbszOL2MG4PETxvoDa+VbCMNSLNgHMWqNvbl2DD0
         v66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079356; x=1778684156;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MideM2n02iIKTDCku+HSAt6i6mJ+89mrIgdH74VDGvI=;
        b=adidjKFGrFbABKFuRS8MGvQ0ANoq/zPWHHI7gcx1APHzhd5lf3wnCKxQ4hXTni7Wip
         TYHYemCDSrfrFdpu9yf9qocpROuV3PsDkxYuJh51L6S2YnNROSv8QyGX+i5602QbP/Us
         tfaB06RNE9jD+z8nN3kkV4Ma8SIfaHzuQA4fUwTVoPt+dAJOH4aBR1BKHc0qwpWu+CDV
         P0lcLzBgUEWMQek45H2dPxkmwz6FDDetEnND7uar4Fx9svhWW8HFT/A3FndZe9pEPtZ5
         k+pFatVVUfCe1ULIvmFe6gPG5Y+y2RmKVg+/Rx7fJeY3jXl6p8OJKcx6rPiA3FOFvTq9
         Z0KQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ak43kOVM6XDDVdrLR9+y9yoq2AN/33LORl8hMyIth6kjUueNc1hOSWgDCMbBUwavAClmnCdbGt81K@vger.kernel.org
X-Gm-Message-State: AOJu0Yygp/jMH2JaUDqFMD5T8svFwLokARfWu4QNHtA9cC+71ZUtAi6J
	Y8298BhXXByrg8yp/p6Wt6HLDrO0VpWCgRkt+5YHMHEdENeuzsODTEc02FjphADFHsVBfkyPmx8
	kpyMz
X-Gm-Gg: AeBDievYy3d+b8KhoT0QcsQao2clmBkuQZAcPuFW2iMfGoxJOfeqtTUsBuYfwmHMHYG
	B/g/9K1l1kvsOeiCXn6Y7vjJqJxmAXDAvei5T54t6Fbf724mpam5gspAU/iZw6BxOpBS9Ki2V0e
	L0zt2jZjaLxytN5lC4Kwb4nyUJyLyOaaDaFOKTXkZl0Rqh9mtjwXk6uV8Kx3SxkA5hLiH+Ey9mO
	opOvkNBOwkNLGIQWceI/ON2KrtdVwMYPS1aF+TY0OQj+9qbk/mY05xlY09prdEIqu0xhfi1i0NP
	02OsC3+/SAk2C89Xkr9rluKBvVUbaghsbF0a9ijuaokou7w4w9g/Yqe/DgijaCcsIP6//8cDP8x
	FgiaKgQOQq3Y/WsUMeQZBsSUpZPZzSCOeEuB3BaqC5TaQMGSzSc+pN2WVXQWkMM76lFLih+sDSY
	CjMOM6nP3JK7YTI1weoP38gNzwgbM7u6R19pXGALPAcff4OgfrbLPMg5i/r2Vrooy9dtkw44/9W
	5u6EifGR1bPOPMN5w==
X-Received: by 2002:a05:600c:a317:b0:488:a977:8d6 with SMTP id 5b1f17b1804b1-48e52bd4f32mr44117515e9.19.1778079356162;
        Wed, 06 May 2026 07:55:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530a67dcsm29024575e9.2.2026.05.06.07.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:55:55 -0700 (PDT)
Message-ID: <18fb5696-8eb1-4d71-a35a-a26c3a8445f4@linaro.org>
Date: Wed, 6 May 2026 16:55:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 10/16] phy: rockchip: usbdp: Cleanup DP lane selection
 function
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
 <20260428-rockchip-usbdp-cleanup-v4-10-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-10-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 18:13, Sebastian Reichel wrote:
> Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
> logic.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
>   1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 1bfc365e2b2c..beab20e4c512 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -550,30 +550,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
>   static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
>   {
>   	const struct rk_udphy_cfg *cfg = udphy->cfgs;
> -	u32 value = 0;
> -
> -	switch (udphy->dp_lanes) {
> -	case 4:
> -		value |= 3 << udphy->dp_lane_sel[3] * 2;
> -		value |= 2 << udphy->dp_lane_sel[2] * 2;
> -		fallthrough;
> -
> -	case 2:
> -		value |= 1 << udphy->dp_lane_sel[1] * 2;
> -		fallthrough;
> +	u32 value = FIELD_PREP_WM16(DP_LANE_SEL_ALL, 0);
> +	int i;
>   
> -	case 1:
> -		value |= 0 << udphy->dp_lane_sel[0] * 2;
> -		break;
> +	for (i = 0; i < udphy->dp_lanes; i++)
> +		value |= field_prep(DP_LANE_SEL_N(udphy->dp_lane_sel[i]), i);
>   
> -	default:
> -		break;
> -	}
> +	value |= FIELD_PREP_WM16(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel);
> +	value |= FIELD_PREP_WM16(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel);
>   
> -	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg,
> -		     ((DP_AUX_DIN_SEL | DP_AUX_DOUT_SEL | DP_LANE_SEL_ALL) << 16) |
> -		     FIELD_PREP(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel) |
> -		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
> +	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg, value);
>   }
>   
>   static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
