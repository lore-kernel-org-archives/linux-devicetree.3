Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB95481226
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112783; cv=none; b=C3l6OPF3yQB+GXXmsxVCg4t7+KB87dqOaLEWBMgh62exSWHiv9ZJBBTjMkuk8K/KVvCHypr7PZ3vtaf6GHajQZszFXjNckmEWhKGNEpvBuFylD9BlW7ieNWC/CB2xqKXWIlln8u3wsspbAsrNcEn1/KtFB0bMkXMHnEQqhBYyKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112783; c=relaxed/simple;
	bh=ywb3m+LvuKSIe0tZc9u3tSaCxrhPzPfhrqMTeyTgJIc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rV+C8Mt/FGU8WJRfvEyWMdmGPt3fvQOwYJrDNnBEa2PrImPFN8M8S2lQhSVHs1XbFmEfiUa/IbVL7YvsZsAzGheDbfwshYYNFGPbGGlTMbdOi9+hQtQ91DRqVB8rypNz6jKxG3Et7dpcMt4xN0N0MgKoxEAYr/huoJ9bDiYV9cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJljA8Xk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJljA8Xk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so25549355e9.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779112780; x=1779717580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnU5FDn+KzMBX5iK1bsH44f81pms9pH5cn3b+/Mb3eY=;
        b=CJljA8XkyTMww/t7es4IbSmzSj0pjPnVI2ld/lXcYn+3CoOLHv3x7bk/xK3NJxigI6
         55mxQttmEDlQT0qIfR+CDzm6D9z+ZcY4nIZccUXzklXq7uVrKUz51Wq6d7FVANrCkjEn
         ZK3TkmvuKdAv0qTUKD6ZJ2xTLRNimiqe3dVSEcBrho862Zm9hawE68G8EWGUQAs6bymo
         ZUQDzujs3+4s+hQDc9NB+ZgiY+Pz5fqQweLVj+zJOiemuUfNSTu282t8qbr4UdotEB3J
         khzR0NmX/1zyFcUy+HymI5fLeWB4ti8zlpyl9W7c+25jKjpELR5bRqmp+Yvq3gLi9H3m
         z9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112780; x=1779717580;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnU5FDn+KzMBX5iK1bsH44f81pms9pH5cn3b+/Mb3eY=;
        b=s2YPDuEvMEmp1SuW9YKCjtJbF1yJVp2LWDDetI2XWN6DX5znHronheSeMYoFMKIMn9
         SROuNHFDcSMnAHGSUW2e7W7XuCafuWaNZiNkMJaFGgBemKYbXwlqNnhI9a8Py90aEMny
         cpuEcM3L/0ceXuwrYOQTW2uBKlF/CQNhG1pypJ2XAn+xOz1Gkwe5cO/C0RCX9Xx2yR0P
         Lc4LWd7HXopflpHaFozeJkTnFyiRqv8VfHQJAM+jZKmfELAG2JzB6+NEv6XylyqMevWg
         a8fjndiwoOQTfzG9ytspoP7anc3VcGPCTRMY7zqKzVUEpzyHfh+t7/8/lWajc6fbZHBv
         1x9A==
X-Forwarded-Encrypted: i=1; AFNElJ+ak9wBkijrIje1yj3q+IlXrKMmlJtDEK39jbkLm1wkwbp9rfw7JZkYEw8LCFL4tYjknBmzYUI3qLYp@vger.kernel.org
X-Gm-Message-State: AOJu0YwLELtkUWL7sOSdtHoS2W/z7uS+sQ9CB40WAld516zKkqJNWjSi
	jgTvquS6IhMkHKzTpiuL3bLJu12iPCrICSwzBwXEPkR25RwuuBQ9PVG8ifBFJtKhJoE=
X-Gm-Gg: Acq92OEgwTbjM8+Eq/sV4xhrhwsFbh47m6lBjw5nRcBlPzJvqMHkigcdYJbUCNc62fW
	hKk2TmR/Agb2KuoXbdThP/c5PzPBxUzN1n+K6mtklVqaZIOZmF1eQH656Dr2D6DUfYpTdfdoZOV
	QkknfkSyPwcrP9y93a7SbF9gd6CwLInm65PI8OZU7GecwU2uVPX25jyorMfqqROMvjYzjmnnE7H
	vMdV3wLwOE4voUu8Er7wWHkukteW2AjZ03pnCyyXIfBUdPcgC3FcLemuMgugddLe5s8XBwmt60F
	l5sfGPllAJYgyq+zCxx8XQL1xkT1T2eafxlUDvD8pxqi/2DO7RPQYFOAal0An/asv9y8Pf7fapm
	xHWB+Eplp1vNeWMNHPtOX7w6r+sNeo+4JchShn2nFKsd551aURPjnhG/3t8NRQiGV8BpXhhTqFo
	/Xz4GUjFmfQ3EL0ah5e4l2yJ30CBBsl1c23AkVUpWQg9hC2UivkV6d7GygZPR9/aq1XfPmy4a6e
	LAfS8s=
X-Received: by 2002:a05:600c:4692:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48fe632579dmr236323395e9.20.1779112780287;
        Mon, 18 May 2026 06:59:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58c04sm84381495e9.20.2026.05.18.06.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:59:39 -0700 (PDT)
Message-ID: <97556944-0031-46fa-b735-9d26bca4aea4@linaro.org>
Date: Mon, 18 May 2026 15:59:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/panel: simple: add NEC NL6448BC33-70C
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260518-v7-1-topic-panel-simple-nl6448bc33-v3-0-21ea14a6e835@pengutronix.de>
 <20260518-v7-1-topic-panel-simple-nl6448bc33-v3-2-21ea14a6e835@pengutronix.de>
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
In-Reply-To: <20260518-v7-1-topic-panel-simple-nl6448bc33-v3-2-21ea14a6e835@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/18/26 09:47, Steffen Trumtrar wrote:
> Add NEC NL6448BC33-70C 10.4" 640x480 LCD module support.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 236bd56208ccf..0bf50b1ed69e6 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3659,6 +3659,32 @@ static const struct panel_desc nec_nl4827hc19_05b = {
>   	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>   };
>   
> +static const struct drm_display_mode nec_nl6448bc33_70c_mode = {
> +	.clock = 25175,
> +	.hdisplay = 640,
> +	.hsync_start = 640 + 16,
> +	.hsync_end = 640 + 16 + 48,
> +	.htotal = 640 + 16 + 48 + 96,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 2,
> +	.vsync_end = 480 + 2 + 31,
> +	.vtotal = 480 + 2 + 31 + 31,
> +	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> +};
> +
> +static const struct panel_desc nec_nl6448bc33_70c = {
> +	.modes = &nec_nl6448bc33_70c_mode,
> +	.num_modes = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 211,
> +		.height = 158,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode netron_dy_e231732_mode = {
>   	.clock = 66000,
>   	.hdisplay = 1024,
> @@ -5520,6 +5546,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "nec,nl4827hc19-05b",
>   		.data = &nec_nl4827hc19_05b,
> +	}, {
> +		.compatible = "nec,nl6448bc33-70c",
> +		.data = &nec_nl6448bc33_70c,
>   	}, {
>   		.compatible = "netron-dy,e231732",
>   		.data = &netron_dy_e231732,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
