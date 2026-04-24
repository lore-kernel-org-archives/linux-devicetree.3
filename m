Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A060E387359
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023278; cv=none; b=jPXhP2thKgmsJ5IiYIEvExrcGdi9/Y2yPaARMk9M5Piwn/WimQlq0xmwNGK/K9qpe9OzCDeu56+SGt+zMAZ2wypLF5/J4bPWnGiLwGj+Tvr4Lp+vfSEBL40fVFSEO2By6Vwv/5Hs6oJbUTPUrCfqiarL7CiDltA20GFIFIGAWu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023278; c=relaxed/simple;
	bh=WU0Mawr6Ukyw3+jxyj17MujDXzfHv9LsT9zg8vS6aFk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YA3Mcgg/Or1hpPH8bn1fInI8D0KzUaJLLKcN8A03OFCVjuLv1IOjauUUot57o8T7tJPZfIGk7QbxjaDYF+3a0deIAj4z6qkc21ACFioqU8R29R+eWTVHitPSSTHfK1E8gmnBt4u/6q01tAblEWNHIWY7oKh1ya0LLH/IXYja5Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6iNo/qL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6iNo/qL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so6907983f8f.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777023275; x=1777628075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJWCPBfaf3hl7HU5rQXTywnCv02n6udY9nbMMzxiGZ4=;
        b=h6iNo/qLhSSXwoz1O2M+t5ddm/5CF92BdiMe6tTrFfUCY5I46dhtbKWX9jpOdBnlSv
         q1pl161lYgK6scDcvCt6HmgB1Rmvoj+qRkjPQhghcxcECp0vw9qFU9uSmItMaIBOV0A6
         JdQlgeafUnh2oPN4ZE0mC26r3KTSwCMuQyaM/RkPFDTl9aJ/lI9xIiU8dLtCs37lwpnq
         OBPkNoCtGeQVylDBASA/zFChy5r8eQ8D93IOJIGAtcJ8D3Qu8s0RdLuAjDaHiQCF7x9l
         NXxQEpXZFstFA8nIuXGQz0hPGdXI2ut28z6su1wUOamOLQTsncufAI2nWTbtiYjD5egA
         TaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023275; x=1777628075;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJWCPBfaf3hl7HU5rQXTywnCv02n6udY9nbMMzxiGZ4=;
        b=jMsJJZzhjwV4eMCR2xUdf9PVNAZEJjfMus2mOSjyv89+Zutm49KR+Y1wlSrolQzMH1
         vyrnxvNWfgPn1sp50tysZD2cO6q+88evAOq5r+hZFQaJSLANkRvIYzlQaOvLkXmpcLZA
         ZCJZERBHlIv+zJNe1FpA1wC6DXvf5J+fz1IrDC2ca02WlcUTyOf7YPeBWYwuI9i8zZ61
         LEZJI2Z9JOGtHev3yIWTE8xHar+4LjD2kBKPrHDDKCSfHhOtRZAKa+zTZD3ucSJe13qr
         GoFEQ/S4vp3gvpcOa5QsuHRauNuyG5mAWEIcJCWAxTaZNSfYWcvHid/KXocsYUJHtl8P
         8ZPg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ip/9Sp2BA+TbOflBt75LXi/T/gnvKKI1qZ+hs0f5iub02gK+bkPsbARlEe04R6VxnKDTmp4gMjYLR@vger.kernel.org
X-Gm-Message-State: AOJu0YyMByu92w1FsI+47ExTqxZI7opmjNwtkb37X9cXZfLDoCQgv1v2
	7dc8JuS/OlSaKh+WD0AT47goYJjB9fd7cIFJEvN9sMtwbgxMP/6OsDDQSlsashDeFhY=
X-Gm-Gg: AeBDiessz4d6T01UjaaNTG6NNLgAdszVyYA/7jqycUz0ZLZCu6brOVp1O7VuIW09wNL
	bLfMhtCKKfRXrKMrSCe8JS/7bYwzdK+ivm5vbd7EQRrLo96HxKzMGcgVJBJz/eIaclNmHT0eRUe
	K0kArjwZ15rRb0+s76KBWKxlJkyoPG79zcVxmQhlVPlwzVmMRdDujlGiMRRewcg4d8hVHiDe+bt
	sffnXjA4Gb/W+KRzIzyd6mky6gJ7liCUQoLfZcdpy6hJxjezRhrqHRAZDMTSXb9OZFVcfijkUrQ
	22rlziPf+o9C8+E40AYulVVqTQQ2xlPCDxh0vZLfwl8EWyESa4ZfIkG4EnSKETeKmQwwGNTkhN9
	FgsLWJnhK76dokqL6DxzKKXZmOcqAdw5mhDRxEtf6cTb6b0z1eAyqY2Uf2LXXPeN1Ki/Br7jyOo
	iaDynNdvLS5lcDXQigJViknzxkfDlylQg31hSiUIuALftXv/4R/WxX90OEzSA1bX1AM1ZER6jYv
	M+6UtHhLMDVCJMg7w==
X-Received: by 2002:a05:6000:24ca:b0:43e:a70d:7632 with SMTP id ffacd0b85a97d-43fe3e0b463mr48905959f8f.25.1777023274954;
        Fri, 24 Apr 2026 02:34:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm60175178f8f.2.2026.04.24.02.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:34:34 -0700 (PDT)
Message-ID: <fbfdcb81-6293-47af-8d09-30bd18b9c815@linaro.org>
Date: Fri, 24 Apr 2026 11:34:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] drm/panel: simple: Add Displaytech DT050BTFT-PTS
 panel
To: Marek Vasut <marex@nabladev.com>, dri-devel@lists.freedesktop.org
Cc: Kael D'Alcamo <dev@kael-k.io>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260422210806.80948-1-marex@nabladev.com>
 <20260422210806.80948-3-marex@nabladev.com>
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
In-Reply-To: <20260422210806.80948-3-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/26 23:07, Marek Vasut wrote:
> Add support for the Displaytech DT050BTFT-PTS 5.0" (800x480) color TFT
> LCD panel, connected over DPI. Timings are taken from the datasheet
> from 16 Nov 2023 is available from Seacomp:
> 
> https://www.seacomp.com/sites/default/files/datasheets/DT050BTFT-Displaytech-Spec.pdf
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: "Kael D'Alcamo" <dev@kael-k.io>
> Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 36 ++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 236bd56208ccf..9f4c907ae044e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1902,6 +1902,39 @@ static const struct panel_desc dataimage_scf0700c48ggu18 = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct display_timing displaytech_dt050btft_pts_timing = {
> +	/* The TYP pixel clock are recalculated from tV * tH * 60 Hz */
> +	.pixelclock = { 30000000, 33264000, 50000000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 16, 210, 354 },
> +	/* Datasheet Figure 3 indicates, that tHPW is part of tHBP */
> +	.hback_porch = { 41, 26, 6 },
> +	.hsync_len = { 1, 20, 40 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 7, 22, 147 },
> +	/* Datasheet Figure 2 indicates, that tVPW is part of tVBP */
> +	.vback_porch = { 22, 13, 3 },
> +	.vsync_len = { 1, 10, 20 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc displaytech_dt050btft_pts = {
> +	.timings = &displaytech_dt050btft_pts_timing,
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
>   static const struct display_timing dlc_dlc0700yzg_1_timing = {
>   	.pixelclock = { 45000000, 51200000, 57000000 },
>   	.hactive = { 1024, 1024, 1024 },
> @@ -5319,6 +5352,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "dataimage,scf0700c48ggu18",
>   		.data = &dataimage_scf0700c48ggu18,
> +	}, {
> +		.compatible = "displaytech,dt050btft-pts",
> +		.data = &displaytech_dt050btft_pts,
>   	}, {
>   		.compatible = "dlc,dlc0700yzg-1",
>   		.data = &dlc_dlc0700yzg_1,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
