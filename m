Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5D396D2E
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514324; cv=none; b=ONiRYSnkq9j+1ygxBWO52qt9kWcdjeUDXI1pO9/XTGygDTaXbYysntxlCV/tcd1tJsQwGuyPjOH8i1REzbRcJvKTgQjq7oSjAEspXgViiTg34RjPkr2L3CTJD6nJcYYoDuCj6HCsEOv8QYXfMn1XQdnRViID7WqS0kBYo5LqW1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514324; c=relaxed/simple;
	bh=Vsjh+B1WCvLGKxc2PE6gnJ4j2h0NrytSD3QErrDnreA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AwLSCNBiQYK0MAHpUXvmei3i6ulT8JtDEU5m8YVqoHc/KRwCOBdS6dVZdQlomnHH9uaRs8tG8Y8bxrR8bjvu+ai0iouErBwrtODFPTcvTMN17LoulcRNU1SBezVlTnQsWbwnRl7Kk6SFo3liGgvSbJxCEoqIYUhM08mGUtxLwLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hnFgxDF9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hnFgxDF9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b871dd06eso373255f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774514320; x=1775119120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqy37fTLBIgdrRRJV6oiAJlRmShF96nT8C9cnYI6+hQ=;
        b=hnFgxDF9DU/kZYln1/gwGmqYEu7BDBBoRZeENqdLy3uujCz/ncXsKgkprlfnOy13So
         4lfTiivsdVmAZ08/DZ/WCVFvWjFOOvRWZAu4PNuwPPkdfU7RXKpu7yDcR45VI7+dnmbQ
         BNn51LqOxuplLtU82WiP3M1ERU+Mcmo3v88yjI2AVjAwQC/VEO0P2DRUXCnFze/d0rWV
         rB/eK8Rh2DhMyiJkhMgthq29KPsyIVE2qrc9MXso2V7HoKyQKa5BzUFzZKsHUewcgS9o
         DDVEhoPbJDx3X0gQXg2JhEYCiKD/yz4XyOUPHsuoR9eeqviViMla3rGEed36sH5N5cXc
         nTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514320; x=1775119120;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqy37fTLBIgdrRRJV6oiAJlRmShF96nT8C9cnYI6+hQ=;
        b=qkbX00rEMmFgNTUuDH8WO4dYwtbHtmNqaArBYMDMkdQ5Y3yUkm/fDIDII62nnJLhVT
         ZV9rP+J+oV67pREd4L7rLI+V9uSWzvDoIkgwrMr6EqFrgdhYcym8uuOGrV+mo7WzOZFO
         bIKBq3OROogXZ7QQQh3genWiipvYNdRbR1qj/qWlBVaGQta7LXALjsTN2wOp2ouFGWmt
         koKYfR23KhXs6x4HQmWizt2ARQYky2/4VFxd+VPHl4EiFaFcFOUJL3JteuFIZL/VoFoh
         Qte3dMik3mekREkoXYF/oPsKu/IasZE+RE5PM57nqbJpakeolQMi5X3uq0T/rg6uLSDH
         WXfg==
X-Forwarded-Encrypted: i=1; AJvYcCWzWQu9o+Nv49+VFjKug+jdpaV+J/x/6+uVMgnPT1vZHA7c+1SzUSzNS4XO6jGjrKZNkx3H4MWQxN/z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4qTK9LHYI7yLBQ2VEFJV2nhFo2LdEv61s1SfO6bKiTEutZtoK
	fnZ0eYaZBr70KMC8XYPtkA7zvsJb3rwDqP6JFQU0sEDd1CnmVMfdLqeeuHQY9cmgyUs=
X-Gm-Gg: ATEYQzzMXB+qPSqJvJDl4n0gdv69TkOXqv1k+Gy92PyVNUGJvsbnOLebdGCZJPW7ByX
	VLZqoi1cRuDpcDAvN+nLkgkYE/PpliopQL4b0cVlnkQsLt1/O+lfATOAnJzsf0uw13DMzBuZ5rC
	EFUl7Py/K7Zf6hZ7mSFGp6Py9aoO59QpG3c+xTKhKiI5mN1YrAFhK4QdpNWtUGdehTuEHSXwLmk
	a+BAz7pH9mqORiTyeUNb2Qv5bN7Dawg7QLu6a8oyyTrqxvFeCPZ0JAUSuBa1+SkH0JDX+vIcQOJ
	L4QC99Gv0vEUQuhZL4z9JSr0YNFBlCTKrCFKw9OLJsqy1lJUp+zW09QQ1WrxHy2yyE8iqkpSUN/
	p9HZeklXJt9gOIXnwcvFg9Y2qwq5ZRgSFXf1Rn+EEv7MJ6lnHduXgRfBrVsoIX5K+2VhiH9/SCg
	3odeQ9FiJmlqES/5yPyuwzbTl+TrH5VWP0DUMmH2/pDhQCgZkZdU8XZ1V6pwrq6grBhWx+sole3
	0I47yxHOMMM/ik5XA==
X-Received: by 2002:a05:6000:4381:b0:43b:4468:b114 with SMTP id ffacd0b85a97d-43b889db4b2mr9444918f8f.23.1774514320331;
        Thu, 26 Mar 2026 01:38:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e68a6sm7333599f8f.33.2026.03.26.01.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:38:39 -0700 (PDT)
Message-ID: <dc18d8b4-34d8-4c66-bcd3-e20c4af50319@linaro.org>
Date: Thu, 26 Mar 2026 09:38:39 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] drm/panel: simple: add JuTouch JT070TM041
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
 <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-2-10255d236439@pengutronix.de>
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
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-2-10255d236439@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/26 12:32, Steffen Trumtrar wrote:
> Add JuTouch Technology JT070TM041 7" 1024x600 LVDS panel support.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 91ab280869bac..6ac263f83793b 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2940,6 +2940,35 @@ static const struct panel_desc innolux_zj070na_01p = {
>   	},
>   };
>   
> +static const struct display_timing jutouch_jt070tm041_timing = {
> +	.pixelclock = { 40800000, 51200000, 67200000 },
> +	.hactive = { 1024, 1024, 1024 },
> +	.hfront_porch = { 16, 160, 216 },
> +	.hback_porch = { 160, 160, 160 },
> +	.hsync_len = { 1, 1, 140 },
> +	.vactive = { 600, 600, 600 },
> +	.vfront_porch = { 1, 12, 127 },
> +	.vback_porch = { 23, 23, 23 },
> +	.vsync_len = { 1, 1, 20 },
> +};
> +
> +static const struct panel_desc jutouch_jt070tm041 = {
> +	.timings = &jutouch_jt070tm041_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 154,
> +		.height = 86,
> +	},
> +	.delay = {
> +		.enable = 50,
> +		.disable = 50,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing jutouch_jt101tm023_timing = {
>   	.pixelclock = { 66300000, 72400000, 78900000 },
>   	.hactive = { 1280, 1280, 1280 },
> @@ -5352,6 +5381,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "innolux,zj070na-01p",
>   		.data = &innolux_zj070na_01p,
> +	}, {
> +		.compatible = "jutouch,jt070tm041",
> +		.data = &jutouch_jt070tm041,
>   	}, {
>   		.compatible = "jutouch,jt101tm023",
>   		.data = &jutouch_jt101tm023,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
