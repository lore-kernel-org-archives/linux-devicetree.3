Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D138C4534B7
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079012; cv=none; b=MPvylBVqmIzjPIrOFyI9snx278XW1z4au2TQuWbxQMbaSAZNm/SqAkZc9TjH0YYpZQFAr/ZR7CD5PCsvCw+/Zof79+nXqr+Jc6fbWeyXzQqYgAedME9CYNi/TlPPMEpXBwx4O6fHeJXgwhGnyAXbxA1qwBlgg7GhgBj2yHzaB9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079012; c=relaxed/simple;
	bh=E/7Hn0lBRsokKc6OpKls9FgRkgsCMpy/r+V2ptQbSuY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=E1REhRX+2mKWtZyAzrVUdVcTbogOcMlbOtbZ3L1FSNFWu2SQNKn0xSxQrnclqfaPWlbcdXdtOLaz0Ma+FVNb7hpqmGd4N2x+QxsQ4B+28QShX1hhYC6BslQMdDvHQCXiqF6eZYJhxLfrRxZqU3rinNukqXteUPFCN1GxKSFfXGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tUVAwgY7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tUVAwgY7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso50667485e9.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079009; x=1778683809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNlQdkQkqMvv6TX3zSIUZJDpuOz3OCXPy5mPofQZIh8=;
        b=tUVAwgY7dq/fY4xocAXkyo5rSBv5tVBscixR/+jUDJO1xsp+0rcspglv6ZFL0Ky61U
         g6IQYnCzC2lAG3kUx4h0lTy0StJImHoalprbGliL+wHMEZBLRSfgaxXpBF0NX66n9lFK
         nM0UbKMxEw1/KBEzsVtjezdkrQtLTlhvzJXRPAWEYMesLjsH/uunj5OEA69VohOHBI6s
         v9OaTmNrdSgh2Pq64Oywklp74Ivp1omUC5EZY+nnKRlHmKMPcFeOkJI2q+lk/+BgMjk2
         Yu+L1bHo0IUfDS+z7jPSAUJBkxXQvoFPxzsr5PzTB9EtnoQf5ZP3bYK2oKXxYiuOwvEx
         FmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079009; x=1778683809;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNlQdkQkqMvv6TX3zSIUZJDpuOz3OCXPy5mPofQZIh8=;
        b=Ai8VbEBvsVT56Sx1DFTttWX0f+9tPWF+a0xrFDx9MoUIZeiCRsoiEbrmfupd1Ydpg4
         I7plUKYpfiZAdNsjpxtbFLhG6lXGX8f9zepQuWs6R6gZVQPQm5FLjiOXTrudOl8nArMw
         4FB7bKM+KmToXArfmOuhXT7y70uM6VymFeQzStAJ3RIvXUiTah3REqfxmf8EGZWRoYR5
         HAIHmXmh6yYDifJRzuD5xvkHtCtsf5whHTNY8xwT+gUGV+C+pdP6dM7P3cvnyx/cONgD
         kuObGWEhS4FbaoOsUQQ+Fp9QZdiLS2N/IWKwnROzK7yZ4T8qapmgTpEa+xHkYdmyQotp
         FlRg==
X-Forwarded-Encrypted: i=1; AFNElJ/OrD8qxaP3KUp83+N54Uf52tpr9sBBr4fj83k0FglIqlKYa4UMOTiKs7Ul2qlpiJnL45zuSGmyq69Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjL3tVswRCdRGpJwxUDdUakysLAzqofkpV04foBJe48IFrw0W
	A7f3SqYmWIZDhDgX+R4ThGUW4n5y+/G2E4eBsPjwG300B5HRJsy9Eb7RTB5BGDVLglE=
X-Gm-Gg: AeBDiesAgyVOWnccc6kzvm1F8UAEA5gGvdBZjwseIQ8s2LJsu0Moc91c/VCDZst6bQt
	FS0CS4CnJqos1xEfaY6bAkXGvwMQS28qghXK++kYpVmpRziuqMfev9NELkzwafma+0jWvB6COqE
	RPW9Bt0/jHVneNlhC5x6kB1YzMEsaoEze6pi6Zz5JA7+Kyqo43yqTp1o1rrc6k4vNCgouZ1+4vY
	Y5+73f7LO0tEgH+NtqEV4HjgJwLFfK8k8hi67ePWI7OUagFTgR03uhpXyIiJlgTLIYm5d47w2Sp
	m2OU3g85EUqcokpPNXKcwHfwaFmvUTjnoS7QRHdFhgS3We1INSvw7F6GjJJdlkx9O02HqcQXViv
	PS855wcm+SUetP1wQD/P/3gHUXXQrQC0UzxfbK0ieoyFECsczkIWs6JRsC5c8w/NrP7eGwoad4x
	PGVUM1koLeK29jtbgIJWGpG5OgptmpG7EgSV/yKOF/6IWL7QcLF3yrsJCCJLEnhlCOOMkioinbN
	9ePAS87LVmoKx8laaNsa+ynwALn
X-Received: by 2002:a05:6000:268a:b0:451:3b12:9bca with SMTP id ffacd0b85a97d-4515ce1cde3mr6569525f8f.25.1778079009130;
        Wed, 06 May 2026 07:50:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052483166sm12894076f8f.7.2026.05.06.07.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:50:06 -0700 (PDT)
Message-ID: <7430e331-5bc4-4814-baf1-e87a9104045f@linaro.org>
Date: Wed, 6 May 2026 16:50:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 06/16] phy: rockchip: usbdp: Add missing mode_change
 update
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
 <20260428-rockchip-usbdp-cleanup-v4-6-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-6-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 18:13, Sebastian Reichel wrote:
> rk_udphy_set_typec_default_mapping() updates the available modes,
> but does not set the mode_change as required. This results in
> missing re-initialization and thus non-working DisplayPort.
> 
> Fix this issue by introducing a new helper to update the available
> modes.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 97e53b933225..febc148a754e 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -619,6 +619,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
>   	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
>   }
>   
> +static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
> +{
> +	if (udphy->mode == mode)
> +		return;
> +
> +	udphy->mode_change = true;
> +	udphy->mode = mode;
> +}
> +
>   static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
>   {
>   	if (udphy->flip) {
> @@ -649,7 +658,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
>   		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
>   	}
>   
> -	udphy->mode = UDPHY_MODE_DP_USB;
> +	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
>   }
>   
>   static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> @@ -1385,10 +1394,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
>   			usleep_range(750, 800);
>   			rk_udphy_dp_hpd_event_trigger(udphy, true);
>   		} else if (data->status & DP_STATUS_HPD_STATE) {
> -			if (udphy->mode != mode) {
> -				udphy->mode = mode;
> -				udphy->mode_change = true;
> -			}
> +			rk_udphy_mode_set(udphy, mode);
>   			rk_udphy_dp_hpd_event_trigger(udphy, true);
>   		} else {
>   			rk_udphy_dp_hpd_event_trigger(udphy, false);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
