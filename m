Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26843377ED9
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112831; cv=none; b=EcS/+UWgAn6vyPVTllw2eFiF3Czuw6k0B6wBx3jEgnGyNBPcfossZPrCkHCexcxCQlIHeQDZocr2aC2XucKEV+EnJEKH6SXbfzJJNnm1IUZW1hy1LPSJM6QMNQuk5DcTb1IJz3U9cr2+7vBEGycmkZuXJo9xzt0vBDBdTQgVdwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112831; c=relaxed/simple;
	bh=YzbLVvJ8u+8Wg65pkN5KBKF4cx/agsnWFQ9OvNe3oC4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HY/tTbsHA7hX+Y8NZVaiC4IAdLeq/x+b7MYNsuXAoH6sPAfZmwyxqjxGRDxZ9euXvoTLzh+0ONTEwiULXyOt9g55v+9sTP5cm+vjQ52uxHAxfOmXSM6aXWCjxCVdPoeHtU0QvmVATUuSGq36AZt1ZhYK+W2FcWKo3RbDz85wo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vuWwIMrA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vuWwIMrA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso31707415e9.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779112828; x=1779717628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSzdDCalKroiZkrBK5EAjSSCAceaufgt8kCZ3umG54s=;
        b=vuWwIMrAg+kvadOsNb/srJSq0ghNNJWNPlzQRvq1SJzay5aq1utwzAsgeGXhgQbEvH
         wQQdb+PZjcDgfPNtLM/Y7y6JAMacYn2Gm0jdRh2okDC9pasp6rXyFLRaYr7mcFhwrqj5
         fQgRL+7suytDGM8vLrNDSKfrG8eN66GGwyvtmIvkSBi6Xxw9Z+A1TE7vxXvtIUaMwn73
         QcEwNI9jA1MHibsRkwvzmjJ/P7zuumhLE38pyCanpquNELhQ/owWyNe/OBVrDIlTc5WG
         dc50GTV5ZG7O1tCn7ivFG9vi7ffZAjgYphWxze838r1h7OMoNSegph4SzOtui4K2ISt+
         tu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112828; x=1779717628;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSzdDCalKroiZkrBK5EAjSSCAceaufgt8kCZ3umG54s=;
        b=SwSxCpxDY9IFMnYU/6YzRMP3GymbMmbxBwaGNayDHs9Xc2kMm7MATy/dREjPkpHIIi
         bgTZ5vmWt8lLFz5R8PSi2+QyitbxROyWl6rAtNUizW96G/ee0v/txhWdl7T3ZL1dHmXL
         tD839dLcsP7doNmIluJBEIXyW3EvZm0YjT3tcpVfQBf2jg/7LEbCTZJIwxsa5nE3pZJn
         aZFxSx3ANC3OP+/igq1KYEM7HMaiy4Ws3heGj4G4qdnxNbJ9YQLnZIceoYGC/NHkqyF9
         PU03r0Y24Z/arF1yMyhLU5HXzrq0Gg/isj3Rjd53TdiPL+pMEHWRKeKjbQ6E+IVSItX/
         GSTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/a3h6J3Fo75p4MmsWPJD3AShCwN7+qUYDhqo7ZAqEf47/yg6LGHCaeNpKIILIYLfdmLzZ/YTafPf22@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rLNpRVPNuy/tXglvdR2NEKdmv/b4iteKLWnI4I43ysBpKm7d
	BcEL4GlKL1LWn7zSRcd1keIsXZ7uHSD4DgZJq7srqCK5YByFUrS2FXI7+11/9gtpRGY=
X-Gm-Gg: Acq92OEK9B5IczfQi63JjgWDBUWm9uaIyO4UIx/q4WzX98GIu6UbYPKlZvZ5n02OeVn
	ZEzPVcprz2JOPFRps4KlvNYQWSz4FYHfs1H4mzNouIIE+VV2vlQ56hJunUxjyPguxyJ4cu9ewvc
	FX5QxErjAcK+KgeJsHgWNc6ZEDO0X4ToVGDU7bOl5la7n3/vr0EPPlcT6LJpm7T2/Lt9VpxL20V
	vNaU8/YtsxC4I8pIEEDPpcRDMrVASMnIyOlUxyD67H7d5Dc6Hc3nWzCEOPVN59yZQucyfadIWSf
	d3zAn613hlatGCp72yXbczRkEDWOyTAZwYVnMGjBFrXskUc0Ag9wI5+6/Gk9flhU2rsk9RAxVwq
	YCuoc3CewzjRhJ2dUlTKzELnzEGZKjdrZMxqDWbOfVZ3jN8EiJLbJEPnWkrvYwHcSsYduv4idT/
	+DgoC9qe0vl7wMp9Mt8WzR8g0p2y3vvcfRHdGvcdNSsIRLldpCOnpKUFIO1bUmCwomwFtPEQf3X
	J2t/4s=
X-Received: by 2002:a05:600d:8:b0:48f:e6b9:c740 with SMTP id 5b1f17b1804b1-48fe6b9c811mr201655935e9.30.1779112828111;
        Mon, 18 May 2026 07:00:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2f738sm36982077f8f.16.2026.05.18.07.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:00:27 -0700 (PDT)
Message-ID: <4d7d7ab9-5c68-4edd-a6ce-cee7b7726ca0@linaro.org>
Date: Mon, 18 May 2026 16:00:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: add NEC NL6448BC33-70C
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
References: <20260515-v7-1-topic-panel-simple-nl6448bc33-v2-0-74ab0baa1817@pengutronix.de>
 <20260515-v7-1-topic-panel-simple-nl6448bc33-v2-2-74ab0baa1817@pengutronix.de>
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
In-Reply-To: <20260515-v7-1-topic-panel-simple-nl6448bc33-v2-2-74ab0baa1817@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/26 13:46, Steffen Trumtrar wrote:
> Add NEC NL6448BC33-70C 10.4" 640x480 LCD module support.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 236bd56208ccf..dca6cbc41bd9f 100644
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
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
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
