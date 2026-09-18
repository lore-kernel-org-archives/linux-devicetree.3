Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8A4E431A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734096; cv=none; b=c2QIVqi7sDenIK6SGdXss7vg2ESmVw7hml6ynMfiR1CcfGUgbCPxbd0m5iJ9G58Gy2sN18KPsKs+IbCstUgdYHMybFTydD6Rov9oLWRK2G5Qlzg++MEpRw/jua9zGZDpnTIPro4Iwc/4bsj8LbNldqc+nW+B917sRP2fHYJQdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734096; c=relaxed/simple;
	bh=3j13Nfvb8qjiC7glPQglzuzhTqg7XQ76dcALMvsqFWA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KAcZ3hFWAW9aaCD4scwN6COCQPzXRXypmT5qTsFrCOSgbZDl2OFuqW6y8td9/AuZkEmxlDGagJv0VUPnn+y2ktdhrsDLao4GD9qOeiVm6boLpaLCSA+WrICfKufn59+hGYQY1KlJX54vacYbgL+VuSCgOVJqsCpKJ5SbadikGus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GzoCPd3S; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzoCPd3S"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so3423285e9.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 05:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789734088; x=1790338888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZSli+1ou/g+3V4+7u5wg2mN2aQGNSeaL9prHAmrZHY=;
        b=GzoCPd3STOr7KyPX1Rq/TSSJ9JBt5GA/GPmn8IPZ5TqxmOVAYGvDrtRoRH7UKG0Fpg
         sTFwqr8A/WleGfbS3ZNfL4qbCzKnb1L2A4cL9k/+bwj4kmAn/Hb5nidoq57IYuNCbSaV
         +S8sbLRQLJDhzGD49w4n3mm20LfXoO8bB32/r02QwNirVl2m1OKtgq+KYZfBbiRH57wD
         UokUgStd/+0ItXz9BD2GYMEQlet6LSExeCWnI9k01Ed28q9IkyyLgxvruZ88agM1GQyN
         91+N/4AOI+9w48S3j08QnUF6rUBmiMuwDkCuxc3Zu3hSHyfST/2BLVShg21NBxrz7/9C
         aUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734088; x=1790338888;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZSli+1ou/g+3V4+7u5wg2mN2aQGNSeaL9prHAmrZHY=;
        b=B1YXGJgSCLelrOMajfUMtsNtSBRx4UOVkvrHvViahIgjU8dkmxps/PP4VfBZbuMKBO
         W0prrA7qhsgmCNrmBWzsORysdP2OM1a/iL15aJGuzL1MzQZG+/4E0bE4jvHk2uCNZCf3
         C45Ybx+NleRriNz5MMq0eq9ADVpUIIjxMTpD/7H5pYMJFNfawDwdEd36lEnGoGfePeAT
         xcolIGuEyjLLulxP4tVDxpZbYxFh/q1gp3bhZqOHyscrpkLM4rc7Rr6k7dGTsghzfSkA
         vqG29fDsvLsC6DANpb1t+udcjxUvvghaMid4DEqR8HjmFG9MLecwSP4gDSHfox99rDEu
         Yf6g==
X-Forwarded-Encrypted: i=1; AKwUvBxt7ZvR7/Sv17/NVwnoHHi4fZTh8jE9KbjJvrabffnFqtA1w2JC1+4DreygNerKrVX50747jZO2dgua@vger.kernel.org
X-Gm-Message-State: AFuF++nIJb+vaGWwyp5R2YxpxDWGY103tvZyo7B8hDSRIbDrVtW2J3Ng
	PIcU5C5gEp5e6wTw8vJJY9i2i2eWJrHomRxzw8eunvFfgYfZ/XPeGnFT5jGFisspiZk=
X-Gm-Gg: AYBFou000QVluOYTy5HKrYr9MYji6clqr4KtywJxvJfW/Bf4zCP0VKRhQp1tzMVcfpT
	eHDO7bWsm//xc5HFMIr3fEOlCElcRiYCFKFsa2zj0wqVyDiGcZ65jH6IW10rRHpCkFYosAQraF2
	5D41g40ejlK/FS+H2vThB0ZBfb1Iq+Q7tFDsXdMGcSzOYWAEwVpy/w4vq1y7kSuFpqsLoD+wux6
	xWjyQXp8+8geJageuXVtumlXGEn/INb8aYem1V4MDCqG/tb12JFDUgqLl3/oJee7GqruABs3NGt
	AXfqrp7c9fJAcpejVGjwsR8L6Z82Itge9zJOSO5wF2dAAmid3VJcJ8gev652MiJoANBcTnLNbco
	akCSP1S3W6BD7XoRyEC80GR9tFhjiAXwSg+iWYhiwzTr0ML72UFFlLEnGrpxmgyU9vn3179FprI
	NQpyb5x6QpQhDhGxxZjMyeuA3BeQJH7fZ2BLozSKPw1/tu/434C+qLobaKcP9UcbXdK0X8GTxAY
	uh0XdiVemiE5x8SMV3NpGEl5Gv9wKX98DEnErnbLb047svdNl4l8aE=
X-Received: by 2002:a05:600c:3ba9:b0:49c:f504:2af5 with SMTP id 5b1f17b1804b1-49fc566939emr33360575e9.1.1789734087499;
        Fri, 18 Sep 2026 05:21:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc? ([2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm45727935e9.1.2026.09.18.05.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:21:27 -0700 (PDT)
Message-ID: <bcdbc5b2-785d-472e-9d07-599da628719d@linaro.org>
Date: Fri, 18 Sep 2026 14:21:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Truly
 TFT320240-229-E panel
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Frank Bodammer <frank.bodammer@siemens.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
References: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
 <20260917110517.1053556-3-alexander.sverdlin@siemens.com>
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
In-Reply-To: <20260917110517.1053556-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 13:05, A. Sverdlin wrote:
> From: Frank Bodammer <frank.bodammer@siemens.com>
> 
> Add display mode and panel descriptor for the Truly TFT320240-229-E
> LCD panel.
> Register the panel in the of_device_id table with the compatible
> string "truly,tft320240-229-e".
> 
> Signed-off-by: Frank Bodammer <frank.bodammer@siemens.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index c95964ba25a95..bd7f6eaeb0deb 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -5114,6 +5114,32 @@ static const struct panel_desc tpk_f10a_0102 = {
>   	},
>   };
>   
> +static const struct drm_display_mode truly_tft320240_229_e_mode = {
> +	.clock = 6410,
> +	.hdisplay = 320,
> +	.hsync_start = 320 + 8,
> +	.hsync_end = 320 + 8 + 39,
> +	.htotal = 320 + 8 + 39 + 4,
> +	.vdisplay = 240,
> +	.vsync_start = 240 + 8,
> +	.vsync_end = 240 + 8 + 8,
> +	.vtotal = 240 + 8 + 8 + 4,
> +	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc truly_tft320240_229_e = {
> +	.modes = &truly_tft320240_229_e_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 70,
> +		.height = 53,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   static const struct display_timing urt_umsh_8596md_timing = {
>   	.pixelclock = { 33260000, 33260000, 33260000 },
>   	.hactive = { 800, 800, 800 },
> @@ -6167,6 +6193,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "tpk,f10a-0102",
>   		.data = &tpk_f10a_0102,
> +	}, {
> +		.compatible = "truly,tft320240-229-e",
> +		.data = &truly_tft320240_229_e,
>   	}, {
>   		.compatible = "urt,umsh-8596md-t",
>   		.data = &urt_umsh_8596md_parallel,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
