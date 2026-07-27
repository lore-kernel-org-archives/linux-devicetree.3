Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CFD3BE17B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138849; cv=none; b=YhXEKtcmKs4CRVEO0iSLWaWPdkdGpDUacEznK1AG7dM/Zcuntt3NeXEGgfyBcaaNeiwYz5dhoKQaqjxRqBlr1L38WThOrww2xO9uZOP/kyjqfXS4CNXMp01dPq+N2XJWC+xbqLIWAFySrK6AgC94DWbgNaL/fCRGjzkVYJYUmY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138849; c=relaxed/simple;
	bh=0/7aJcorxjkjYh2WxXLTjtcNxe/C8FiLZXKBu+DN6bs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OH8V60dtdJwHPaXhhunHxStB3uAGiV+MA5JlbkoviYQ9Hl/5acx5LJR3Vuhwy7OP9SPGIkcSi5h/9ktJ3ga0T7xJ/pb/toY56mWXCI1EjNIizh6ARHjaCcrV32PkRBncu5+LvyGIcosSShq6/DxcO+35KfN49dgmvCeSuBPAYoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RZNNMniM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RZNNMniM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956242332dso21185465e9.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785138846; x=1785743646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqNjK/rioA4iOLl1ZVnlKqLU3LaxNT3QS1tkdq44BUA=;
        b=RZNNMniMMn9sMiDYGAtpDot+LBL6AXKZBWAJRHzas6dGIOt+Ut2ZEbV626zodvtWHb
         Zohfv2UkGYDH2otIFEWqOSlzwKP58BI9uScid4e8Xolp5uOM6BgL7Vz/lpFlFpG9Syyd
         2rrCpDVhaC90R6GjcDlr+oa09E6UlkrnrmIkLwfxGYa5ZtY+G2SFiVSvLqDUYhKOILqL
         /fit5oxDDN+JFxOrXkPceF+rTDAqNCg8swaO3B9fahrSTgyrOor4c8pxLfo869NmlstT
         TxcaU5TRG4PQh6yJeAOMe0wr2silxMEGUWOCMuRUmTPQyMhGg/RbX79HuP73/zXHZ0h/
         LJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138846; x=1785743646;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqNjK/rioA4iOLl1ZVnlKqLU3LaxNT3QS1tkdq44BUA=;
        b=sT3v5eMeXORI+ICSSPRABeTHfy9BrtmDk3oZYdYfCT169HxmtPk5UR1mGy3W/s6VLa
         U07BB+fYuPW64pZBXnr1G0PARBlXDxyYypeQDbdSN/tWGAmwUIuP1TY75MVKpDxoaFQT
         7l+eNDRbp2/f8AYfIxw53V5eU3FF7mqMPvcug/crALNZ7DjPHnUu9H1aEUTGaI5mOUhq
         xxwo43ib0k+jquBgUvh5kogSBr0zfmOagifBAflvY0amhjJCkh2abYhpVH7FEOKT+Lpu
         szkLN7fxA6QtTjYRhKevDIINT2XOBfx4fAy+vfouSoKDMEHJBr8Lxi2yphObbIQgqDjN
         zLjw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2IkuS/TO3/8lwLzbv160NdYa3Oqwk63Kq4DBCkAYh5RI++pTvtInkrd2VUuLEKYWiHMw+BCN6ZsXO@vger.kernel.org
X-Gm-Message-State: AOJu0YxKa74kRJcqhfUWNxm5/pBVYdDkUSWHrio40cgZAekdlh+kenbw
	eiFINPyGwK9TJNn9BzXqudYImilwhs4jY8FcqPiBYfqdIFXIYXuaqr/4zTtkeuknMaM=
X-Gm-Gg: AR+sD11oJ5UKK+kEzrVr9QOmcjjhfJ6KzXo/ncjFpE+zlfyhSkv6CSbq10AZByV/Fzc
	9QtbPm2w1VaXJHwVo/bHf3Nlgyan8PcE34L2ookuU2Obs9KebD0ZDVR1ezwE+7u9XU41dsxG9lp
	4/dbeShkkQjjy9JW00HZ6PFGIDKlvXPuSwAIi4TilgWKJhdubQQuPPK3YFnyX2LF+YL5LR3sfzO
	FbzAN2Fa9b+d3PkgHMXj9JCJEBxyBLIcCx02DIX45XSlw16qQnN/G6g79Vw32Zl+i9if9sNB5EN
	sxeTqfxsMzxt82nZtmZBFRrLrB8Ug4ruTmOLZqWktY7R7twihjmHMgvtwQbJPeRVdvpBpT2Bd4m
	LLi/TpApJLz/v0Vbuz/vB3DjDrJzcwv+jjsuyUqqs2woAR/Z46Kq8wRP3cTY3Oe6zD04D7XGfU2
	YksT0Mw7MxyPmnFFOlbs0sc1tMpAHUhwMlnGELJLG+IUeSw5Ux0B7e0RU7SA==
X-Received: by 2002:a05:600c:a00b:b0:495:4589:cea6 with SMTP id 5b1f17b1804b1-496b5709d44mr98553935e9.34.1785138845564;
        Mon, 27 Jul 2026 00:54:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9be5:334f:bd8a:8041? ([2a01:e0a:106d:1080:9be5:334f:bd8a:8041])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm297543085e9.3.2026.07.27.00.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 00:54:05 -0700 (PDT)
Message-ID: <7b32e0ef-eac8-470d-8eb3-28c20c91f1e3@linaro.org>
Date: Mon, 27 Jul 2026 09:54:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Ampire AM-800480N3TZQW-00H
To: Paul Louvel <paul.louvel@bootlin.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260723-support-am-800480n3tzqw-00h-v1-0-6a4ae0575a19@bootlin.com>
 <20260723-support-am-800480n3tzqw-00h-v1-2-6a4ae0575a19@bootlin.com>
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
In-Reply-To: <20260723-support-am-800480n3tzqw-00h-v1-2-6a4ae0575a19@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 18:31, Paul Louvel wrote:
> Add support for the Ampire AM-800480N3TZQW-00H 5" WVGA TFT LCD panel.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index c09bf3db5e78..fb60d8e7f47c 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -912,6 +912,36 @@ static const struct panel_desc ampire_am_800480l1tmqw_t00h = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct display_timing ampire_am_800480n3tzqw_00h_timing = {
> +	.pixelclock = {23000000, 25000000, 27000000},
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 4, 8, 48 },
> +	.hback_porch = { 4, 8, 48 },
> +	.hsync_len = { 2, 8, 8 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 4, 8, 12 },
> +	.vback_porch = { 4, 8, 12 },
> +	.vsync_len = { 2, 4, 8 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc ampire_am_800480n3tzqw_00h = {
> +	.timings = &ampire_am_800480n3tzqw_00h_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 108,
> +		.height = 65,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   static const struct panel_desc ampire_am800480r3tmqwa1h = {
>   	.modes = &ampire_am800480r3tmqwa1h_mode,
>   	.num_modes = 1,
> @@ -5648,6 +5678,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "ampire,am-800480l1tmqw-t00h",
>   		.data = &ampire_am_800480l1tmqw_t00h,
> +	}, {
> +		.compatible = "ampire,am-800480n3tzqw-00h",
> +		.data = &ampire_am_800480n3tzqw_00h,
>   	}, {
>   		.compatible = "ampire,am800480r3tmqwa1h",
>   		.data = &ampire_am800480r3tmqwa1h,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
