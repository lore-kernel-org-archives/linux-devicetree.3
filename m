Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960FD3A16BD
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776072355; cv=none; b=jh1hHN0qc8afg0HExL11+ZcqyLa+RNez3ltaovXfbSB3KtyGMKw9aFwxdTBgqCYp+hxveqZ6y88rtE8P4GLNkLncwFPcL7FqZiiJLGoHt6CTRxdCU1Jz42wrk2G9RI6H2NvzBBL1nQLS4pVDfyV0Qiwgs8F7+RKYQnr8uBe9HiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776072355; c=relaxed/simple;
	bh=bV113SFRteRf/lfCkd8TXPKJE+so+EzuNa++sYxn6s4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Tq7cTyb7G/AwsyVN9POvKVm98qTY7O2HjiWPIpkTFxNAgVVKav4/0Ome1Ieg55arruS7/L1Gl15WqrZEN0cjCnSF0Ww8Zc+gJMn1E9Mn4GYtmWF7Qg7HEQSgq4pv+xmbD7w+NWk7m9TSEMSfbEN+0DLKAfbXnLdW55vA8VhNRlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMTCIEFa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMTCIEFa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a041eae5so30074385e9.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776072352; x=1776677152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxTuUhvNuyjpocH8H2TWu25ZZLHbeZ5L/TpNb0PyPXg=;
        b=aMTCIEFaiF3Fr6yJRlz1FiOFA+BY9ERsIFyNANlS43BBEvmY++Ro6M4eekU1Ve3aNe
         uB+a22sfwXVB/6fQOJh3QrPXG3ZWykaYtd/5djJRhO9lLmpA/8fhxXKZ1cibmx0XxLgt
         PICfPsL0YMY0rDfBYamtcp5WSaqf8PktJPtvsCCzLv39TyNnbhkySHyFJT4M0tTqEyw6
         TqW3fszZOGwau0MX9bKIFqyRb2dDEleoDUpFd/kZonm851xwq/fWttZuULWZsexVU+OO
         OH5iOCnMHzVzOX6H48PTpJU1JoTnkkLkvPFCbOHrTOk1dh0hoeY0V+bVeF5l/Ok4lXkx
         nfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776072352; x=1776677152;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxTuUhvNuyjpocH8H2TWu25ZZLHbeZ5L/TpNb0PyPXg=;
        b=NNpJEKpqz2iOyVmvddaHdplexTSedDotxNtIQaR+//dOcDF5VewcYLtn77T7pYrcnk
         sUbbuRAlcs5YcuMeVqKQRBEIqe+Fu7ZKm90WezHYbvnjZz/Gf3iyYyvvkEBBSowm1ZuB
         ZR/AslnkebKhgGmQSma/V0dtqpg00jNu+EYoRyB+H54oQjWCVgc0yq0n3xE3MhEdrp86
         O8WrGnqldYdOyTCfQ1Lb1bZFoWqLrPYlEPGuLfdenQaLvRY3vYTE6ag29lEYwvXl/nqx
         T10XGrNZDQVmvIcsdxC8GfQZaFE7qtw4JoDZGrFrb3zW2mUcwsbDwgIkNUzg/oiIAJVX
         kNLg==
X-Forwarded-Encrypted: i=1; AFNElJ99gS4Ci2xauyBGiH2NDqyW591eUw8jjdCwjiaE67duBpeMbkyaLpk9nhLAVOg8I25iTwuMaEKKJUJW@vger.kernel.org
X-Gm-Message-State: AOJu0YxlQrKoLCnrKB3Qece9rEGWQb+is8VOBrVQtLSjQCw37Fvq48dU
	YP9f8uY8amo1FKg1Xnh7gxAwbGEAi6hZqP8Mkyp9Xh5Mhq+2VRxd4TJrAZexJ3Xi/Ds=
X-Gm-Gg: AeBDiesevhY/0PnZyo38FRlNtrDB9Uxcr5lb8c+/v3zW9Jova8efullQE4NXP9YXROm
	ClgVjAu3wJ9JilPThhrAU36I9fykNscpFlATe6RxoWSXCJnl4VUIKeYmLgIbiWZakhKGR5NytfJ
	gR7K7qk65sFX2rSDtrQo+dpiG16ewpuR+7q74Hv+BnsYIu5xV70AQ4cfO8rX1BFaiETlSHCWCd3
	b7ux8H2z9uTazM/SmVkFZ9JxT9Ho8tyIljxZPyMrd/B2WHujfG6Bs7X+Vewys08DI/yMKzEyDxD
	kOvnpb+oTNvhK7dXgkSbIYmIVnHMLG7PD4UzQS4uJqWdMw+g8+NM0iKIF50/I3rAEbNNEpz7N6S
	2UEdbcvQmv4YJHGLNM7RDuKgZFO2x33OUoB0gAhyU5s2I+Qs9E38edLNj/SQdcxaqli7qhr1zxm
	3Y8jmC7i407Zy3p+TEUMYbE4IS4KND5LhW4OQohNy8v5WvpE6EjpGDr75+H43It+X4pWz/CQf+V
	QGeXEtT
X-Received: by 2002:a05:600c:c10d:b0:488:ae4e:51a5 with SMTP id 5b1f17b1804b1-488d683d633mr115963445e9.15.1776072351876;
        Mon, 13 Apr 2026 02:25:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d684b55fsm94935965e9.26.2026.04.13.02.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:25:51 -0700 (PDT)
Message-ID: <a32bd2ec-10c4-4cfe-b206-9e96bdab37fd@linaro.org>
Date: Mon, 13 Apr 2026 11:25:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Startek KD070HDFLD092 LVDS
 panel support
To: Stefan Kerkmann <s.kerkmann@pengutronix.de>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407-panel-simple-startek-upstream-v1-0-76721696655f@pengutronix.de>
 <20260407-panel-simple-startek-upstream-v1-2-76721696655f@pengutronix.de>
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
In-Reply-To: <20260407-panel-simple-startek-upstream-v1-2-76721696655f@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/26 11:31, Stefan Kerkmann wrote:
> The Startek KD070HDFLD092 is a 7" WSVGA LVDS panel.
> 
> Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 91ab280869bac..737a1014f8112 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4540,6 +4540,32 @@ static const struct panel_desc starry_kr070pe2t = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct display_timing startek_kd070hdfld092_timing = {
> +	.pixelclock = { 40800000, 51200000, 67200000 },
> +	.hactive = { 1024, 1024, 1024 },
> +	.hfront_porch = { 40, 160, 216 },
> +	.hback_porch = { 30, 140, 140 },
> +	.hsync_len = { 20, 20, 20 },
> +	.vactive = { 600, 600, 600 },
> +	.vfront_porch = { 2, 12, 177 },
> +	.vback_porch = { 5, 20, 20 },
> +	.vsync_len = { 3, 3, 3 },
> +	.flags = DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc startek_kd070hdfld092 = {
> +	.timings = &startek_kd070hdfld092_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 154,
> +		.height = 86,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing startek_kd070wvfpa_mode = {
>   	.pixelclock = { 25200000, 27200000, 30500000 },
>   	.hactive = { 800, 800, 800 },
> @@ -5532,6 +5558,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "starry,kr070pe2t",
>   		.data = &starry_kr070pe2t,
> +	}, {
> +		.compatible = "startek,kd070hdfld092",
> +		.data = &startek_kd070hdfld092,
>   	}, {
>   		.compatible = "startek,kd070wvfpa",
>   		.data = &startek_kd070wvfpa,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
