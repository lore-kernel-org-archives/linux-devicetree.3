Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625693;
	b=4e3zGyk0tGPp/XEhggU6guUgtl8pCEZfTrX5p4K5DPs+VCsLRLA7C7Q4ZMBq07hVeukx
	 oFh+++Mrv5kQdqcmq1Zt14ulh3qzQzPl/uEYlJ81ZKOnfzbx3hRft8x9IRNV8+QE50+ts
	 qD8389PUQz7rCTFL8ecvD+kDvQdFdE4Jy1WW/9zH8yK1m71oPMeVtp6fu3AD0HcpSgJgs
	 q3Z5MWQkjKbpt39m1HNmrNa/YBwHFvjYEDhaiZW9sHAsF1eu5l2K1tib3nflXWsu8Czfb
	 p2Qi3e743Dgfc6CFqR5wy5bZnhAZx/0WtiM9C9b+VN9HFAoNWbJNHD1RHf+v7ZBDgQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yzb4FLFHNkxHewORAzgIXxT9puE5wh1HG/JpGad3oS4=;
	b=FjD3mbc9FklVExCmY3eUhF9goTLFIJnu3Qr9oI9/Duir1m2Pq8WV6ncaNiovjHuIweQP
	 mazvzjzi2GuYHuWyy4w73ByC7oaAd/L32vbsETpR8S3mz/jCuKyeayiDmiesQpacdUXFX
	 giIxicGzXAct9qnQTCNPjXIfc7wZOJf99cObJWIPlAdh3Znzn36Cb5y3SIUVcp7leK8O6
	 MpuF1hIyATVM7fn8P9gPi+8kNvKosjvruh9ciR43RKdgfqYCVK5QJJrrTcqUGIjaU79hz
	 t8+Q2Ud8hMVL8zgAt1NXBLGYGAo4o369uwd9PgK5ydPSyeFSYMBFKEUZiDIcsbz7rjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qcpza+pb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F288606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F288606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qcpza+pb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so28503115e9.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625691; x=1794230491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzb4FLFHNkxHewORAzgIXxT9puE5wh1HG/JpGad3oS4=;
        b=qcpza+pbzaQUN6rpBFezjcIf7pFSYBAYS5RQntMgEhtnNSN8nsGmxaZrwLwh0TSm5l
         zldSHO+LS4Y72s6k7gfwGZzLw1BBf+iVhE6UzYiJjKFeQsYIXjRIQ0t+oJiDta1x8NDn
         aSIzEjbHgchqaKHkHECTWuHwFHnTuyw0wh0gnYitbXMQU51EAI49G5VY9Gfg9unePI+j
         iBrFN9Nm2+OgN2DAIO/SfSYWWujBIb2MtZU1b7g+EXzyhL9rNJjnvvZIjtA81Sdom0D6
         VDCsng6+IiSBJbSwbIHoKcK1DfTqrzjgmFPt9XpVDXpKECWJmrsLhmxXzKAUEGUVKKE5
         YJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625691; x=1794230491;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzb4FLFHNkxHewORAzgIXxT9puE5wh1HG/JpGad3oS4=;
        b=DVSEFXX31hBwbpoeq90gmlY1XoxCeOhKdewu6/p1VZQGnPNxvTBZTciI47pJiCEmH5
         7+9/8+4ApW3FlFvqTz0n0/3sUds4kTaxiy2VGmmIaeGbND0Pe3rLIb0/cZ8S0bkZFXZu
         ATJGMiT2i+sU7j9gzL/TFVJlyPOwvssVFoPg0JLVbG1u++fAW07wmCBiN6uZkPyOsDMw
         nuOAA/CAxzIzbNl0V2FKzP01/v6GwLAamNAkjWAoQnfDCS1i7NNkl3TITqMX2135FIAC
         YkUsLZltamSFTvRcjvn6uxZJppzsJEDk4RbCp6Y/hyH5jqwKLqWczxVvj7+v/jTMyA09
         A4oQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuQXM8AjgWl/uilAgfEqDm+F6BigN0znjLQ4Ts280YDHsnrbOz0GdukHsga7NQYUmRWz4tLXX35SM/@vger.kernel.org
X-Gm-Message-State: AFq9FYIYLUO7zD9dthCbSIOXMVRG7pFzYSUv+fIIi39Wo3bsxdmKqt4D
	OI2X1a2jKgmQrQ9goUAvG1la/iDI88lTPABoVApkugXQG/fUDWzBJSmh+3kPJmoPUbg=
X-Gm-Gg: AYBFou06ptvqICSn0erDHpuyK1sP81IlAfBmbslAu+pcFiYg4YgK1j6zvoJMwcGNpJ3
	GFHyO2aLveqdUVFAai26sx9IbE5JooQlk+fsxTsq3qRx17qG7FIJ6+XdqM/a4ZQYuTskjRuO2P+
	0SSK8PDPTqUU9v7yR1lpPz4IchRoW7KbrHcvWOtb/0H3tnEmHWKZtVZRLCkbTVHgMtjXW8arYfv
	1QA8/aplgHUWXue215xXaVGoJAMVtq4GKEzhD3oBk2R5wE5TVoLiLyVKfDyfvvszktXBzEVHW2e
	GAlvTePOwU/PRnsdXvtSjnSjqs9QxUFOAAMR+nEYjzcAYSSnoeEghidVXbtBJJl2eEpniy10me8
	f7yZQAS1/iYbjm3f+j0fWNMflopCl6U+7bc6aUYaI3hfBb2T7djPkNYsdQD0gFNdKsqLDAuuHy4
	qzq3hAJ9+0CxDUpkCv1ifHpbZUZC3zskSOmwV/03FDqC44BcJ7G2FyUi+jrtqozy6b+J30BAAjK
	BCG+dGBiqV8oZZ5Yh+09PwLCBpdm0Mz9KfbgG20xuwwlizZhguB/XN0flWfFt4vgZQbXk+DfEpC
	aFrdrMLZRiZNIx0IE84Y0CZMRsNzvf8op8wScDnC50f91c4gtt5UT6oDfXLwSc+Ds4coZ1AWsOp
	fLo1c
X-Received: by 2002:a05:600c:a00b:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ac185bcc7dmr242358135e9.14.1793625690760;
        Mon, 02 Nov 2026 05:21:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm228432265e9.4.2026.11.02.05.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:21:30 -0800 (PST)
Message-ID: <484889a9-97a4-48d8-b630-27141077d0b0@linaro.org>
Date: Mon, 2 Nov 2026 14:21:29 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add AUO B101UAN01 panel
To: Asif Ikbal <asif.ikbal@amd.com>
Cc: jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 thierry.reding@gmail.com, sam@ravnborg.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com,
 michal.simek@amd.com, naveen.gaddipati@amd.com
References: <20261016094638.2958431-1-asif.ikbal@amd.com>
 <20261016094638.2958431-3-asif.ikbal@amd.com>
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
In-Reply-To: <20261016094638.2958431-3-asif.ikbal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 11:46, Asif Ikbal wrote:
> Add support for the AU Optronics B101UAN01 1920x1200 10.1" WUXGA
> MIPI-DSI TFT LCD panel.
> 
> The mode is taken from the MIPI interface timing section of the
> B101UAN01.7 (H/W 1A) datasheet and gives a 60 Hz refresh rate.
> 
> Signed-off-by: Asif Ikbal <asif.ikbal@amd.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a944c34642dc..46ec17b6c365 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -6389,6 +6389,35 @@ static const struct panel_desc_dsi auo_b080uan01 = {
>   	.lanes = 4,
>   };
>   
> +static const struct drm_display_mode auo_b101uan01_mode = {
> +	.clock = 148350,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 40,
> +	.hsync_end = 1920 + 40 + 40,
> +	.htotal = 1920 + 40 + 40 + 40,
> +	.vdisplay = 1200,
> +	.vsync_start = 1200 + 4,
> +	.vsync_end = 1200 + 4 + 4,
> +	.vtotal = 1200 + 4 + 4 + 4,
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc_dsi auo_b101uan01 = {
> +	.desc = {
> +		.modes = &auo_b101uan01_mode,
> +		.num_modes = 1,
> +		.bpc = 8,
> +		.size = {
> +			.width = 217,
> +			.height = 136,
> +		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
> +	},
> +	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.lanes = 4,
> +};
> +
>   static const struct drm_display_mode boe_tv080wum_nl0_mode = {
>   	.clock = 160000,
>   	.hdisplay = 1200,
> @@ -6572,6 +6601,9 @@ static const struct of_device_id dsi_of_match[] = {
>   	{
>   		.compatible = "auo,b080uan01",
>   		.data = &auo_b080uan01
> +	}, {
> +		.compatible = "auo,b101uan01",
> +		.data = &auo_b101uan01
>   	}, {
>   		.compatible = "boe,tv080wum-nl0",
>   		.data = &boe_tv080wum_nl0

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
