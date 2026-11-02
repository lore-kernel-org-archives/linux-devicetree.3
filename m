Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625413;
	b=z+59oErOSnEFDv/x8haFAEjIppuYJf7ROEbwRBrL1pymQAN9N5xs1K39m+LMDyXEDT1+
	 Eh5e1fScgzmXukrGRaHncwxXU7hy9NYpYj+Lg+pOBWgff+MfTw9TCcM2/v9s+kbwpKVBw
	 ktwkwmeje6aZEdPLqkoavmKexA7Pc8/PP2iMG0q9FLmpiBsDKzJeabvyaSq1JsoSesvmq
	 JdhBw2QmwzCFegk71yzhEBpHBxmEusMqxw7/lzgyNZ0WWr4jfw72xnArHqvEXG2R9409k
	 7CpIGQGoo5fUWUQjleHSB1Ibue6WhPbIBiZZ2CYn0ufzKXnxn2CVM/gAChU4UXyLPZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
	b=KnxVsuWKRkfhJj0AhZ8fvUb0aL/D4eey0AovkYuTFm5SNyDA/CT37gpu5Je/0vNhCgXg
	 XEObe/uNhZE/B+esYd/QJMMAwkXL0jEaLHJvwPEYFhj/JjmfrFXSsEBBHv7bqu/rPOwON
	 RCpdbS0Zxrq5TENBRICS01HeZVYDadgxw/zbGjgUGjvttt6DiZCc4iX+75Q/eOwOMxCwY
	 D1A2tTWR2rBuQveccvuhNCtfTupV1ySanCSe9Yd2vWTEEZDTfin7SfsMBOfPrx0gr3GBv
	 vyLtRkRv/Y6geZu4IbRtXyU1MJ6x3lAkWHBKREnuRSwxVkxi/UsGxllVKbI6axv7dfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CNjKDcC1;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CCA606A32C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CCA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CNjKDcC1
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso26510985e9.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625411; x=1794230211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
        b=CNjKDcC1vcob1Yw0x51FCYwzXMhIJwqcfHwCboC30T8iIZH6Dh52y6HFV1UY1wRygk
         7tHiPu4mesMgtDfrhzRNXA3a4PpP88fKTjkl4FxPj5YPmCNOkfBiryqv1bjicJfmvLaP
         bChXjd/qCIfmyLJL4DFwf5bRPP+n4p5kPCNOMF2s1ytYnLXdyhNC4iOqrjQQyOBslGW7
         Od0RmsIUb9I+/f3u8/hWWzWfAHLvMwFBSt5X104OmdO9ry5wI8+33oBAAidwztLoPIQM
         w3I4OAIRDs29VvIoxn/SKkiklIOQNWQxK2T41zI31CAXNuljqvTZM1TorOmZjKnngC77
         eddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625411; x=1794230211;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
        b=YnRcaiLXceLgKJ7MdQ5LEVj/9bPsLr+GF+Xu+/sVsfiXY9fFr2IbppzzcEfsBMTcbA
         qyTYWa1O0Ivoj9ABW5jykYUV+rMyogkcvuLFFkBu+IeLJTpomMiCcLnMXYmZm7MNiySc
         SdYiDnOXDDwJwy8eDpjBHpa2FgYM0glXmK3hDGXv9UXYvudwZ+9DqNXn32MVHLpPIpC5
         iU2piHkaNC6au/C9j0M6pum7UF8sfVqBlZTiS5fPogZd4yxVKqTq2rA+zFl8Yen6z2KJ
         UeazsC0SZGWpGSMlnk7QtvTlPZSDuPh4+98PZWSbAQKabelcwon+MY1n61sfXMEkJ0t5
         9MIA==
X-Forwarded-Encrypted: i=1; AKwUvBwtdpsEtt2Q70PnVw0ViMWnQAecFuOZlJgyCU9ycdBj7HEYOrkTHeGo+lCMTVVT81qUCLO7J7DEV8MS@vger.kernel.org
X-Gm-Message-State: AFq9FYIKyhkpexLKSXf3oCIDCQFvY27s0VWTcdsVmgNrXTo2D4q9ase1
	YSQa4KV7wW3jcgOkeAMK/5vI/IFFlO7ZOQEYjsndR1sn7R3mgmABNV4eedXEhQwjDx0=
X-Gm-Gg: AYBFou379aAYxQ6x40xqurhfUuGtqxZKiAaeWW5ix2GTxLDV7IO+maB6Bs+E9Me5kKg
	/z6yfbI2D6jdWNfcMTXdULdZX8eP4HnL26rLiPpLkjS5QdjvX5u6ThlcfnjqloAoeKlTPtdC+jY
	w0B6GcQG+jjRhIi8HGEeQQX753KcfsMAJLqrrFIl77WFAqTsVbbuH5B1qbzVukmoSDGsOkvIL+N
	rrliNQzncIcBR7jzbVAj5B2hsNfqzy2EVg0pgU1hW+qQAlxvGtcCcnozfgzyPxRlu7o5USZOpHE
	WDHGV2OCXwG3OSCjOYxHZZW1OgGm9+7ovT1pfQSy5RjDzg10gVdx9/VqH58Xo4z4Dfa3wu0lK0T
	C4LoU/817PLZk5Nlkx/ZY5Fl26RRw8GdsZEmGLy+n5HU/8rLc7AyfC/5rEpAlISaeERAA2Jm4Mw
	bUinnZs0Yb0W0Oww4RLACZSJ+yj5FDI/Ksepw3wksQXrnWfJ9FiY7rB3geXVrHNWg+KCkQMTf+6
	B2GodeXefDgrE8KsEzKXAO1bz/G2rdal720ZsRrahSnLVV2Izmi8Jr0U+wa1RDc9/2povPejb35
	UgqR6Aw6ke2djYrnHQi9CVl4j13S4ilpAxOB2FN+hmB/glf0EEKLzOlYiYJsOJaKlBqzb1p0UU/
	MK0Dr3A==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4ac1709ae4emr246187665e9.14.1793625410523;
        Mon, 02 Nov 2026 05:16:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm331607645e9.2.2026.11.02.05.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:16:50 -0800 (PST)
Message-ID: <fbf54a00-33c6-4b5f-a9d9-3f6c23744ae9@linaro.org>
Date: Mon, 2 Nov 2026 14:16:49 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/7] drm/panel: simple: Add Waiken WKS101WX001-WCT
 panel support
To: Frank.Li@oss.nxp.com, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Robert Chiras <robert.chiras@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
References: <20261027-dxl_lcdif-v5-0-3a974e4b94b2@nxp.com>
 <20261027-dxl_lcdif-v5-3-3a974e4b94b2@nxp.com>
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
In-Reply-To: <20261027-dxl_lcdif-v5-3-3a974e4b94b2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/26 16:00, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add support for the Waiken WKS101WX001-WCT, an industrial-grade 10.1-inch
> IPS TFT LCD panel with a capacitive touchscreen.
> 
> Although the module advertises LVDS support, enabling LVDS operation
> requires hardware modification, including the removal of several on-board
> resistors. As there are currently no known users of the LVDS configuration,
> only the default interface mode is supported.
> 
> Acked-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v5
> - drop "If LVDS..." in commit message (Liu ying).
> 
> change in v4
> - s/LDB/DPI
> - variable use 101wx001_wct
> 
> change in v3
> - add wct surfix and change to use MEDIA_BUS_FMT_RGB888_1X24
> - Add information about lvds support plan.
> 
> change in v2
> - update height to 135 from 136 (sashiko)
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index d7dbd7442919b..5ef6a79f0de95 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -5252,6 +5252,34 @@ static const struct panel_desc vl050_8048nt_c01 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>   };
>   
> +static const struct drm_display_mode waiken_101wx001_wct_mode = {
> +	.clock = 71100,
> +	.hdisplay = 1280,
> +	.hsync_start = 1280 + 70,
> +	.hsync_end = 1280 + 70 + 10,
> +	.htotal = 1280 + 70 + 10 + 80,
> +	.vdisplay = 800,
> +	.vsync_start = 800 + 10,
> +	.vsync_end = 800 + 10 + 3,
> +	.vtotal = 800 + 10 + 3 + 10,
> +	.width_mm = 217,
> +	.height_mm = 135,
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc waiken_101wx001_wct_panel = {
> +	.modes = &waiken_101wx001_wct_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 217,
> +		.height = 135,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +};
> +
>   static const struct drm_display_mode waveshare_28_lcd_mode = {
>   	.clock = 50000,
>   	.hdisplay = 480,
> @@ -6248,6 +6276,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "vxt,vl050-8048nt-c01",
>   		.data = &vl050_8048nt_c01,
> +	}, {
> +		.compatible = "waiken,101wx001-wct",
> +		.data = &waiken_101wx001_wct_panel,
>   	}, {
>   		.compatible = "waveshare,2.8inch-panel",
>   		.data = &waveshare_28_lcd_panel
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
