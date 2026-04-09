Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF24248886
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 12:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739562; cv=none; b=dqhewx25bgQuRcaQPW/24hCKH77gt1KUTTbZbB7h70g8485thvzfVaWSHR7usRMLYdyzKBeWCe244pydfXYLqBwsKwIfxU9oS0o4g6wl83uHmMUqjGxuBKr2K2AS28mZD8fCEP5dxwB9dDBjuigXHwjQMMP4szmj/sRGU9a4CgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739562; c=relaxed/simple;
	bh=3W7k/IMpUVBZFvr2L9V1GePV/CqpwAafIlc0oZXBsvc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fSs8qPHnO1pfaKL+cfhTTLLtjeun8VPCQC2O/aCtQxJZlL3rWyrjR+C01ZlwGtzc9hZGBFVwDdTTaRC0wbfH1EdSyvYMwaeg9LqBXF9j8E6ok41UoD1JLoxIVcoZrjWL+oVJWSGhAjuDDwIRDQ8TRDV7od9t+D5pdn6Cs0q5efI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QVov5Nf1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVov5Nf1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfce3a195so532439f8f.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 05:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775739559; x=1776344359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xj2vZaEiNHHsypQhOoqn3dsKsdK2sO9N5bb9CwmONCI=;
        b=QVov5Nf1R1zlwDxfT9ozzjoj6EjHj4OBaTxu3serFl6rC/lDZPUMg5NP59jBTtpxGW
         3rbX0IwamBZdew1fz74MJewj4vD4htQwb5/L2Pyh3HC3fU6jCXKBZ19R0GTgYw8+pNfN
         f589Ll4nNurh4gMwIDHrLLAwcUadB60U/5L0wvxzm0kdgCleC/aWshoc9TESZ/LYSMSj
         2Uaca4LpIVTIojCXU5RCjcmbxWS6IE/drAgieUeascewoXKA8/7f12S2QhEbaV6s6NuO
         TZ7luMcDiXBj2W5V+AbJN9FZc/xTNZryK6fino4RbVFnSnjkX8szEbdkujjih3KBQhvD
         C+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775739559; x=1776344359;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xj2vZaEiNHHsypQhOoqn3dsKsdK2sO9N5bb9CwmONCI=;
        b=rSnxElweSoEpRngZE5FQ5hKJ1iCmXvb2Bewsc1OmQfkQ2EIAXE4aJB916gFFRuULIh
         iVl8EK+wlknvvMBv5QvWb03bxiQ7OkqlPfZ5DNcJbMREDTxsTSZSjTMj5qz7YcFtTz+W
         L62/2C051O3afASho8FRCwQm1thk7mXnHWEPcV3hgFZTZDpsb5RH8Ia53mY2607ut0Dq
         aK+Wk1kP9VD4rJanEEWrrZd3AfQ5jD2gbziS60LCPiCnfJHDPyavgA8Otussl6FA3HiN
         LdLyVnZ5MM8S2KRYAekkfS/FYvdSC8LmNG+ti1kgM7XneFvXr4+/Z6nU7iEjtyJX7uIk
         f2Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXaKaDtOWS8inrugoKUOGK+WKjXi8qkorqvgclIAszUOEbOIYa5SgrRp0gKzPg9cZxOcTLIVLeHfFcP@vger.kernel.org
X-Gm-Message-State: AOJu0YztVM3R7qyOzT0TvqZzUIHjQi7GLOsXzGjVtULLmpHTB9nZVWYn
	kLLqX8hNpy9CKTczzwSE/x++mJM8eVIP086i6YEDArF8wjqKWp5IaBOdTbXz4hHx7vw=
X-Gm-Gg: AeBDiev4EowOH8DpEMKRqnQgjsu02vpdrOPRzN9ayb7xwxzqUIbB7MPfJA6qLsjYo83
	aL1aw5+qJF5FfZR/uydRMZt4W16lgjRtGRDlDkFGDqXJewKRi6wavm3m5eE+Rb3YMh9osGDrijO
	e1RlPyGuBkGQw0W9Ht5YHx8OVcglpYLTrlQUPNikTjSlLGCeXICW2+KFm8wMtL2xLNmmtIhmz23
	rblZB1gh42KCRXAOlthkWDs3Ru3S3Esp4voHij12BY6ZztGUh/21lqpa2ibiLgo1MQzxMRyyKB+
	xerqH3q0WiCG9zovbGgRYgcNuvZJ1i0CfhuxE+WDyFMQ72uGiu3yZ/gkPZZ9XrHYOWxrKdU/zLq
	zVwYHo2ESp/8WazSMulZ6vbrBCka2i/bjc7KPyON7KhWo/H3+ThjJH6pMNsJiirQZq8Pm6pxoRe
	MIxZRUxR6KxUBWlYHZnJEDDoNH5mMsHu708Tz7a1woJTKPBjjhpvR6dJszuYfZBlk+5YMB745Ri
	AvP
X-Received: by 2002:a05:6000:288c:b0:43c:f336:7ab5 with SMTP id ffacd0b85a97d-43d5a14b024mr4729778f8f.22.1775739558565;
        Thu, 09 Apr 2026 05:59:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:47c:bef1:62cf:54fb? ([2a01:e0a:106d:1080:47c:bef1:62cf:54fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm69043166f8f.0.2026.04.09.05.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:59:18 -0700 (PDT)
Message-ID: <a4a487fc-7b65-4de2-97f9-71e5085dded1@linaro.org>
Date: Thu, 9 Apr 2026 14:59:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] drm/panel: simple: add Waveshare LCD panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Joseph Guo <qijian.guo@nxp.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com>
 <20260331-ws-lcd-v2-4-a1add63b6eb6@oss.qualcomm.com>
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
In-Reply-To: <20260331-ws-lcd-v2-4-a1add63b6eb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/26 17:44, Dmitry Baryshkov wrote:
> Waveshare have a serie of DSI panel kits with the DPI or LVDS panel
> being attached to the DSI2DPI or DSI2LVDS bridge. The commit
> 46be11b678e0 ("drm/panel: simple: Add Waveshare 13.3" panel support")
> added definitions for one of those panels, describe the rest of them.
> 
> Note, since the panels are hidden behind the bridges which are not being
> programmed by the kernel, I could not confirm the pixel format for the
> panels.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 381 +++++++++++++++++++++++++++++++++++
>   1 file changed, 381 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 236bd56208cc..b2708a1fe464 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -5061,6 +5061,342 @@ static const struct panel_desc vl050_8048nt_c01 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>   };
>   
> +static const struct drm_display_mode waveshare_28_lcd_mode = {
> +	.clock = 50000,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 150,
> +	.hsync_end = 480 + 150 + 50,
> +	.htotal = 480 + 150 + 50 + 150,
> +	.vdisplay = 640,
> +	.vsync_start = 640 + 150,
> +	.vsync_end = 640 + 150 + 50,
> +	.vtotal = 640 + 150 + 50 + 150,
> +	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> +};
> +
> +static const struct panel_desc waveshare_28_lcd_panel = {
> +	.modes = &waveshare_28_lcd_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 44,
> +		.height = 58,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE,
> +};
> +
> +static const struct drm_display_mode waveshare_34_lcd_c_mode = {
> +	.clock = 50000,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 32,
> +	.hsync_end = 800 + 32 + 6,
> +	.htotal = 800 + 32 + 6 + 120,
> +	.vdisplay = 800,
> +	.vsync_start = 800 + 8,
> +	.vsync_end = 800 + 8 + 4,
> +	.vtotal = 800 + 8 + 4 + 16,
> +};
> +
> +static const struct panel_desc waveshare_34_lcd_c_panel = {
> +	.modes = &waveshare_34_lcd_c_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 88,
> +		.height = 88,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +static const struct drm_display_mode waveshare_40_lcd_mode = {
> +	.clock = 50000,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 150,
> +	.hsync_end = 480 + 150 + 100,
> +	.htotal = 480 + 150 + 100 + 150,
> +	.vdisplay = 800,
> +	.vsync_start = 800 + 20,
> +	.vsync_end = 800 + 20 + 100,
> +	.vtotal = 800 + 20 + 100 + 20,
> +	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> +};
> +
> +static const struct panel_desc waveshare_40_lcd_panel = {
> +	.modes = &waveshare_40_lcd_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 52,
> +		.height = 87,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE,
> +};
> +
> +static const struct drm_display_mode waveshare_40_lcd_c_mode = {
> +	.clock = 50000,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 32,
> +	.hsync_end = 720 + 32 + 200,
> +	.htotal = 720 + 32 + 200 + 120,
> +	.vdisplay = 720,
> +	.vsync_start = 720 + 8,
> +	.vsync_end = 720 + 8 + 4,
> +	.vtotal = 720 + 8 + 4 + 16,
> +};
> +
> +static const struct panel_desc waveshare_40_lcd_c_panel = {
> +	.modes = &waveshare_40_lcd_c_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 102,
> +		.height = 102,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +static const struct drm_display_mode waveshare_50_lcd_c_mode = {
> +	.clock = 50000,
> +	.hdisplay = 1024,
> +	.hsync_start = 1024 + 100,
> +	.hsync_end = 1024 + 100 + 100,
> +	.htotal = 1024 + 100 + 100 + 100,
> +	.vdisplay = 600,
> +	.vsync_start = 600 + 10,
> +	.vsync_end = 600 + 10 + 10,
> +	.vtotal = 600 + 10 + 10 + 10,
> +	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> +};
> +
> +static const struct panel_desc waveshare_50_lcd_c_panel = {
> +	.modes = &waveshare_50_lcd_c_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 109,
> +		.height = 66,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE,
> +};
> +
> +static const struct drm_display_mode waveshare_50_lcd_d_mode = {
> +	.clock = 83333,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 100,
> +	.hsync_end = 720 + 100 + 80,
> +	.htotal = 720 + 100 + 80 + 100,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 20,
> +	.vsync_end = 1280 + 20 + 20,
> +	.vtotal = 1280 + 20 + 20 + 20,
> +};
> +
> +static const struct panel_desc waveshare_50_lcd_d_panel = {
> +	.modes = &waveshare_50_lcd_d_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 62,
> +		.height = 110,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +static const struct drm_display_mode waveshare_625_lcd_mode = {
> +	.clock = 83333,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 50,
> +	.hsync_end = 720 + 50 + 50,
> +	.htotal = 720 + 50 + 50 + 50,
> +	.vdisplay = 1560,
> +	.vsync_start = 1560 + 20,
> +	.vsync_end = 1560 + 20 + 20,
> +	.vtotal = 1560 + 20 + 20 + 20,
> +};
> +
> +static const struct panel_desc waveshare_625_lcd_panel = {
> +	.modes = &waveshare_625_lcd_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 66,
> +		.height = 144,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +static const struct panel_desc waveshare_70_lcd_c_panel = {
> +	.modes = &waveshare_50_lcd_c_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 155,
> +		.height = 87,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE,
> +};
> +
> +static const struct drm_display_mode waveshare_80_lcd_c_mode;
> +static const struct panel_desc waveshare_70_lcd_e_panel = {
> +	.modes = &waveshare_80_lcd_c_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 152,
> +		.height = 95,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +static const struct drm_display_mode waveshare_70_lcd_h_mode = {
> +	.clock = 83333,
> +	.hdisplay = 1280,
> +	.hsync_start = 1280 + 64,
> +	.hsync_end = 1280 + 64 + 64,
> +	.htotal = 1280 + 64 + 64 + 64,
> +	.vdisplay = 720,
> +	.vsync_start = 720 + 64,
> +	.vsync_end = 720 + 64 + 64,
> +	.vtotal = 720 + 64 + 64 + 64,
> +};
> +
> +static const struct panel_desc waveshare_70_lcd_h_panel = {
> +	.modes = &waveshare_70_lcd_h_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 155,
> +		.height = 88,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +static const struct drm_display_mode waveshare_79_lcd_mode = {
> +	.clock = 50000,
> +	.hdisplay = 400,
> +	.hsync_start = 400 + 40,
> +	.hsync_end = 400 + 40 + 30,
> +	.htotal = 400 + 40 + 30 + 40,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 20,
> +	.vsync_end = 1280 + 20 + 10,
> +	.vtotal = 1280 + 20 + 10 + 20,
> +};
> +
> +static const struct panel_desc waveshare_79_lcd_panel = {
> +	.modes = &waveshare_79_lcd_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 60,
> +		.height = 191,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +static const struct drm_display_mode waveshare_80_lcd_c_mode = {
> +	.clock = 83333,
> +	.hdisplay = 1280,
> +	.hsync_start = 1280 + 156,
> +	.hsync_end = 1280 + 156 + 20,
> +	.htotal = 1280 + 156 + 20 + 40,
> +	.vdisplay = 800,
> +	.vsync_start = 800 + 40,
> +	.vsync_end = 800 + 40 + 48,
> +	.vtotal = 800 + 40 + 48 + 40,
> +};
> +
> +static const struct panel_desc waveshare_80_lcd_c_panel = {
> +	.modes = &waveshare_80_lcd_c_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 173,
> +		.height = 108,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +static const struct drm_display_mode waveshare_88_lcd_mode = {
> +	.clock = 83333,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 50,
> +	.hsync_end = 480 + 50 + 50,
> +	.htotal = 480 + 50 + 50 + 50,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 20,
> +	.vsync_end = 1920 + 20 + 20,
> +	.vtotal = 1920 + 20 + 20 + 20,
> +};
> +
> +static const struct panel_desc waveshare_88_lcd_panel = {
> +	.modes = &waveshare_88_lcd_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 56,
> +		.height = 220,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +static const struct panel_desc waveshare_101_lcd_c_panel = {
> +	.modes = &waveshare_80_lcd_c_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 217,
> +		.height = 136,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +static const struct drm_display_mode waveshare_119_lcd_mode = {
> +	.clock = 50000,
> +	.hdisplay = 320,
> +	.hsync_start = 320 + 60,
> +	.hsync_end = 320 + 60 + 60,
> +	.htotal = 320 + 60 + 60 + 60,
> +	.vdisplay = 1480,
> +	.vsync_start = 1480 + 60,
> +	.vsync_end = 1480 + 60 + 60,
> +	.vtotal = 1480 + 60 + 60 + 60,
> +};
> +
> +static const struct panel_desc waveshare_119_lcd_panel = {
> +	.modes = &waveshare_119_lcd_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 58,
> +		.height = 268,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode waveshare_133inch_mode = {
>   	.clock = 148500,
>   	.hdisplay = 1920,
> @@ -5697,6 +6033,51 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "vxt,vl050-8048nt-c01",
>   		.data = &vl050_8048nt_c01,
> +	}, {
> +		.compatible = "waveshare,2.8inch-panel",
> +		.data = &waveshare_28_lcd_panel
> +	}, {
> +		.compatible = "waveshare,3.4inch-c-panel",
> +		.data = &waveshare_34_lcd_c_panel
> +	}, {
> +		.compatible = "waveshare,4.0inch-panel",
> +		.data = &waveshare_40_lcd_panel
> +	}, {
> +		.compatible = "waveshare,4.0inch-c-panel",
> +		.data = &waveshare_40_lcd_c_panel
> +	}, {
> +		.compatible = "waveshare,5.0inch-c-panel",
> +		.data = &waveshare_50_lcd_c_panel
> +	}, {
> +		.compatible = "waveshare,5.0inch-d-panel",
> +		.data = &waveshare_50_lcd_d_panel
> +	}, {
> +		.compatible = "waveshare,6.25inch-panel",
> +		.data = &waveshare_625_lcd_panel
> +	}, {
> +		.compatible = "waveshare,7.0inch-c-panel",
> +		.data = &waveshare_70_lcd_c_panel
> +	}, {
> +		.compatible = "waveshare,7.0inch-e-panel",
> +		.data = &waveshare_70_lcd_e_panel
> +	}, {
> +		.compatible = "waveshare,7.0inch-h-panel",
> +		.data = &waveshare_70_lcd_h_panel
> +	}, {
> +		.compatible = "waveshare,7.9inch-panel",
> +		.data = &waveshare_79_lcd_panel
> +	}, {
> +		.compatible = "waveshare,8.0inch-c-panel",
> +		.data = &waveshare_80_lcd_c_panel
> +	}, {
> +		.compatible = "waveshare,8.8inch-panel",
> +		.data = &waveshare_88_lcd_panel
> +	}, {
> +		.compatible = "waveshare,10.1inch-c-panel",
> +		.data = &waveshare_101_lcd_c_panel
> +	}, {
> +		.compatible = "waveshare,11.9inch-panel",
> +		.data = &waveshare_119_lcd_panel
>   	}, {
>   		.compatible = "waveshare,13.3inch-panel",
>   		.data = &waveshare_133inch,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
