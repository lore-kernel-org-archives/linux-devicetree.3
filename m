Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6613A1CF8
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542295; cv=none; b=GQKeScDhqMKz7lAHJfqmWefVFQZDd+fpLdRecvDA2fypAhiCJ5rw/TrWSbfBRCZ+41ueaH5hciB0gAPT1C3TIyDRjkD6QnYbXAWoQrijrkB19QGEVk8AbiCe9z+g5GidX5V3nEYFYIMtHBR/jC2ImSlH0GSv8XZ+WauBSCC1xks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542295; c=relaxed/simple;
	bh=fLZ2Jm/Y75Qj4E48M5wQjMcZBb11iicy0ZTXPZgtU9M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pvfkxvnDy6/zSRmIxRZ0cQVy06a7nzDMPYwmzQDYgH+71O9SkpeOcrHDZiduLRYLrudthxWzqesQtIeX4bNYe+UM9CJ/y9JlegVH9SGzYO+pFBfXqL5FzagqyJEY8deJ9Yo3HEIn7rBMosi/M6lh/9pjfyBI56faa+pU4Jq2jCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rAavCcyo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rAavCcyo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso187308f8f.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777542292; x=1778147092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0PGE3BNlb0IaXgkxdiLNH6Iyh0Z4cLUYLiEdgTxCoE=;
        b=rAavCcyoGtNugRyV9nFXPTdFzi/qXQdNz+JQxfSKc5GQGNpVvIZjd3X5ij8qhi4EXe
         MohMP5nMNoA1INQKHYQwVPPO/KqXRaYUpCFxJ5nzSw/G7hXUm33qQXlxsSHEwjdLwjcM
         vBWce8ysZzsqMkcNi6xAg9yZJ9/FPYMtqtYqf1ytBVdLfhJBP64Ry+T8pHwbldLwEOAT
         De8uaeOTzWCH2rObIZuimyFK8W039HC7XtVQx1ALuQVM5vW6WlRadLr4ZHA5IQBpY4m+
         887Ee0aQ0vRwFKEwxvUJD37F9ayVIPdAyNNni2ArdIrgtp6T5qJCLAYcbAz5zSWVMDjL
         7PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542292; x=1778147092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0PGE3BNlb0IaXgkxdiLNH6Iyh0Z4cLUYLiEdgTxCoE=;
        b=DgiG1iIMtMHmLV4eDodQyiodsjaEeyW+QUeVbuvGmXEp57h6DYI8hUxrY+572OpXoY
         2eiDLU8ZoRmqDaj67nDB5zcLl0J5qd6BXyrryv7rl7levgCTcWjjJUT2I86lfFrVBl3x
         z6/B28f88eEXrObc5nOx1oD1MXPtySKNJsMkZNqGw+QRuZ2VA99d2hvD6L0sDS+gdLBI
         X7Woo9RqdDAgofKdfVoLYdB7iBPFKrspru0gguoCVRKi0uDTPsw7D6sk0SUbBrfkrboH
         8D3T8rdAmGr3p34Lczz/Sod8P2JfGWUZpMhMjVhyqlcD+KTEKLdEibL41btwWtICvLGi
         TylA==
X-Forwarded-Encrypted: i=1; AFNElJ/aGiVMFc63IulHL74cUFrhekieGfAkxC32gD/7Rh81dRSvYDC5LbKjzAf2tk9grM9e4WyeuhB5LIpv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg+vprWOfsam9cbNybBSMxZvjegYSXaC1ktMfJG7P9HyDOjlAd
	dZ3gtYJwyF3jdpIWyWjHKlC10c5wzy72Ietv6bv3YRQSTkZwxApIJp5/MLp8cURJNS4=
X-Gm-Gg: AeBDieu0l82z1cbN63xcKGU0nEyMGx9fCxTsdiRiLPEFPlQ/zbM32sJouxEIHPyKtga
	U/pg/FZEoqpXw9JQBgfm8/s7aBGZcuDGxeiqh9/94E1uMqA5CmRwPJ2vcj4t7gIeBrKZki7E662
	E3uH280xaxYgka1cBMbZJDkDV/xjzUOWcGjx5wQS0sYeZqHH9jqm67VCfZqGULT45RcRmJWC61e
	sCAbtmlShfs2okP299dWXYeiyDd9nljj966D6QIFsTCRX/oAZP0hpOO6XLeG9nMoiIy+3HA1qxM
	5WnlmmIRmR52nIyII91pewclsuH3xoh0v22FpaH4ndPUwq+/38tSKbVgno8bYKgPqdUXgcrSgqx
	YsxhzbyKlsG55WmlmuYh6wsOA5IFY8D9EX0t2HxpDCkHW5qffKjkSMXr9j0xju40yaseHdn4Vku
	8WgXi/cTMujWZMlMdiOiYdIUrSRq9OlNz5wIYHGOaaIc1EgBC6rS0ietrDZNE2wgfETbde/JlUI
	S5OHuK7JirohPI2Ag==
X-Received: by 2002:a05:6000:178b:b0:441:36b7:7262 with SMTP id ffacd0b85a97d-4493ded56e1mr3441957f8f.13.1777542291653;
        Thu, 30 Apr 2026 02:44:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6dcc:3980:fe87:c6ae? ([2a01:e0a:106d:1080:6dcc:3980:fe87:c6ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d482d3sm11536834f8f.1.2026.04.30.02.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 02:44:51 -0700 (PDT)
Message-ID: <5d0c4fc6-5d50-45e8-b323-23015fa52021@linaro.org>
Date: Thu, 30 Apr 2026 11:44:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Team Source Display
 TST070WSBE-196C panel
To: William Bright <william.bright@imd-tec.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260428-imdt-dsi-display-v2-0-cf7294b5d7d6@imd-tec.com>
 <20260428-imdt-dsi-display-v2-2-cf7294b5d7d6@imd-tec.com>
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
In-Reply-To: <20260428-imdt-dsi-display-v2-2-cf7294b5d7d6@imd-tec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 17:17, William Bright wrote:
> Add a dedicated panel driver for the Team Source Display
> TST070WSBE-196C, a 7" 1024x600 MIPI-DSI TFT LCD panel
> using an EK79007AD controller.
> 
> The DSI timings were calculated using
> "linux-mdss-dsi-panel-driver-generator" [1], reading the downstream
> file "dsi-panel-imdt-tst070wsbe165c-video.dtsi" [2].
> 
> [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> [2] https://raw.githubusercontent.com/imd-tec/meta-imdt-qcom/refs/heads/kirkstone/recipes-display/displaydevicetree/displaydevicetree/0001-Initial-bringup-of-IMDT-Display-3.patch
> 
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 236bd56208cc..0010bb3db484 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -5936,6 +5936,39 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
>   	.lanes = 4,
>   };
>   
> +static const struct drm_display_mode tsd_tst070wsbe_196c_mode = {
> +	.clock = 52477,
> +	.hdisplay = 1024,
> +	.hsync_start = 1024 + 160,
> +	.hsync_end = 1024 + 160 + 12,
> +	.htotal = 1024 + 160 + 160 + 12,
> +	.vdisplay = 600,
> +	.vsync_start = 600 + 12,
> +	.vsync_end = 600 + 12 + 10,
> +	.vtotal = 600 + 12 + 10 + 23,
> +};
> +
> +static const struct panel_desc_dsi tsd_tst070wsbe_196c = {
> +	.desc = {
> +		.modes = &tsd_tst070wsbe_196c_mode,
> +		.num_modes = 1,
> +		.bpc = 8,
> +		.size = {
> +			.width = 190,
> +			.height = 121,
> +		},
> +		.delay = {
> +			.prepare = 20,
> +		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
> +	},
> +	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
> +		 MIPI_DSI_MODE_VIDEO_BURST |
> +		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.lanes = 4,
> +};
> +
>   static const struct of_device_id dsi_of_match[] = {
>   	{
>   		.compatible = "auo,b080uan01",
> @@ -5955,6 +5988,9 @@ static const struct of_device_id dsi_of_match[] = {
>   	}, {
>   		.compatible = "osddisplays,osd101t2045-53ts",
>   		.data = &osd101t2045_53ts
> +	}, {
> +		.compatible = "team-source-display,tst070wsbe-196c",
> +		.data = &tsd_tst070wsbe_196c
>   	}, {
>   		/* sentinel */
>   	}
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
