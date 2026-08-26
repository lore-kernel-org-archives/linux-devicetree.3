Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D58B38F633
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738511; cv=none; b=p6qCEpBQB/NP//WqQClAfeRHSzS3aLWYKNrXfzSJUfeTuunlRWaWkRxC0TiYTrUVaGE0L0oWsf5MEEhzFkkqvGuphYpdqrDCbv03lA3GSWdP84/wMeKqiIt01NlU2WlxvaaSagfdN74ZADoYWDq0Q2aG/dJVRCNv6eIkN0nbHYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738511; c=relaxed/simple;
	bh=rsbS0c+lttjel3drwTYkiXEyD4y7pmGlCqIyrAGFppk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UhpbmrTxX2J2pjIXMVpK7ToeHI2aMHM4zu0xOuj8CuHV/o/MxcdRzo4FkuULZntTxWajAy6nvyy+pjb/9F99Q4fxuZt8extPphj4tq7FecmmkLqaZ17p2z3Ktzcm40I5mL5v1q5aLsNLqEvjaOK99JDeYaSDsN1ngnZAV5NYxNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O9e9xjWp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O9e9xjWp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso6641445e9.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787738507; x=1788343307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFUvpm8EmgV6Ri+LBPnpFH+gnBuAX0bG3qD3bLuTVyQ=;
        b=O9e9xjWpRxOgv09knthGvOeOaTawz2zrBOJ/SPR5N2vkvgIM3tyIGc3TB96/qZOhsF
         IDXgl2bDLvDcmu2tiHY/YC2M27YFAw7WWJkS1PXM+pQGKsRaENYamfh5XdocmlYIMNPo
         RP7cDKJgkY/DY+NTeENKyFVHQF0NqFmYOsKCOAoRwCXYIgnOcsxWkB1a3PqTK/sZ573m
         5iF74eoI9Si+4IW4UcGer7ngInoWJscTBm4zXZ4eNRU3n/Pt1S6tXvvjULuUetFdkHI8
         pOIKiRU6EEaIPvn0bBYo5VL233JsIjl3KEXWnjDZya+iDxnN1pRa6/Y9RdZgTslkRuTK
         gaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738507; x=1788343307;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFUvpm8EmgV6Ri+LBPnpFH+gnBuAX0bG3qD3bLuTVyQ=;
        b=J/loCOye20trvovahRgqjBk5ToGnRCMWx/wHhdBMoIUmIAKZZQWhWpxH63f+3KOq21
         C07PObZLT5P5MfwOEm49YF6Mf3FpMCMUQmyKBsJkfeL5dJa/knEd6p0yjrkcGaIsUwRo
         RHBRWzjZYgk7z6ZtXdttPxyiHPJL/PHDzcSHRQcZYdDzoTuhcu2eywaNvr6wWBKgkseC
         skqfNjMTn7A77xLV2Gzhpxo7ej/PJd2knjpxwHo1IUk/JaFttxOso5whWibjFY+KYCt6
         iVgkQ6kkp/RkN+Vl0mLnUyW/N0d2noiuCNKJNy6DkActN6a4Ph6lT/7MJYh4C+OtB2Jp
         nE1w==
X-Forwarded-Encrypted: i=1; AHgh+RrSOgSkX9xAhAatmjIg27mr821Ugg0r4+2CcfK9CUS5agpNEmzWusgy+nrLXHzbxaqq1JFTIohVYDuk@vger.kernel.org
X-Gm-Message-State: AFuF++luC5hN2KZUf2ZJGyyeE+BZNbTg9hjM96Se7Lla2MhdiBBkR/0U
	c7y24F9nChPP1YOfN2YqQ6oKrmt3AETJNXDeA4bhHRn7R9Xj0lOMBm2vCu8sCVaHQY0=
X-Gm-Gg: AR+sD11hzh4QB99h0PxOEdAFGf8wezUt1BXR3hPCNSsO0bw5sOyla4NnxIN9Sob08/G
	AifdsUeb9djn6sTjb/MHFYjlYoVJbcz8qyPEK9la1WCkjUPlR4pXxCQqvxsckMwlxBaBHj5vpZn
	Jhxz5VJWiAHuuEs1kvue2h3Jq59aHIy9EOyO3ZneSQsana1paC0VeT7unh4dEdmV08lnnDpO9aR
	HuM9dlk53mfOVvsxviri3BnulHpx0NTIFhy5kpTWg7bd0KFI40sWvsD564yvaxK4KuhSDZEcbK4
	stFQsJ5uCeR0DMNC6QI8YtLnPYo8mDpBlxc9jX6A8Tux+BkyWK2Cfyt/9X//Ctgo+RQs3dPpWAy
	GD/4grHYyb2F5JDwFwtPs82iejhdpnbM/oU/nVvYegtMtmmzuCwsOKaPXh69S71Ff6+rp10oJvE
	84annQiCPYMbEPOqZjOijayztt4Aca7XI0b6Vd6/Rwjhv98kgh8hoB4J2gYbuf/AgDm/LFa3LbA
	aZg0yshJLTTVSNpTAn03PVkhpQgsZ7FjrBSDlUW1kaZ2AE=
X-Received: by 2002:a05:600c:3485:b0:49a:77c1:d246 with SMTP id 5b1f17b1804b1-49a77c1d2eemr10500275e9.15.1787738485302;
        Wed, 26 Aug 2026 03:01:25 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:84f0:37f7:9223:8e7a:9b5f? ([2a0d:e487:135f:84f0:37f7:9223:8e7a:9b5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5616f7sm13144835e9.2.2026.08.26.03.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:01:24 -0700 (PDT)
Message-ID: <1021133b-454a-4f49-965b-a71e065e556f@linaro.org>
Date: Wed, 26 Aug 2026 12:01:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/panel: simple: Add BOE DV215FHM-R01 panel
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
References: <20260814-b4-lvds-panel-doc-v3-0-1ad152a4d3ec@oss.qualcomm.com>
 <20260814-b4-lvds-panel-doc-v3-2-1ad152a4d3ec@oss.qualcomm.com>
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
In-Reply-To: <20260814-b4-lvds-panel-doc-v3-2-1ad152a4d3ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/26 07:25, Vishnu Saini wrote:
> Add the BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel
> LVDS panel.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5c169fdf265c..d95f842c8980 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1563,6 +1563,31 @@ static const struct panel_desc boe_bp101wx1_100 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing boe_dv215fhm_r01_timing = {
> +	.pixelclock = { 148500000, 148500000, 148500000 },
> +	.hactive = { 1920, 1920, 1920 },
> +	.hfront_porch = { 88, 88, 88 },
> +	.hback_porch = { 148, 148, 148 },
> +	.hsync_len = { 44, 44, 44 },
> +	.vactive = { 1080, 1080, 1080 },
> +	.vfront_porch = { 4, 4, 4 },
> +	.vback_porch = { 36, 36, 36 },
> +	.vsync_len = { 5, 5, 5 },
> +	.flags = DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc boe_dv215fhm_r01 = {
> +	.timings = &boe_dv215fhm_r01_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 476,
> +		.height = 268,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing boe_ev121wxm_n10_1850_timing = {
>   	.pixelclock = { 69922000, 71000000, 72293000 },
>   	.hactive = { 1280, 1280, 1280 },
> @@ -5726,6 +5751,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "boe,bp101wx1-100",
>   		.data = &boe_bp101wx1_100,
> +	}, {
> +		.compatible = "boe,dv215fhm-r01",
> +		.data = &boe_dv215fhm_r01,
>   	}, {
>   		.compatible = "boe,ev121wxm-n10-1850",
>   		.data = &boe_ev121wxm_n10_1850,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
