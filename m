Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AD6304BB2
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257790; cv=none; b=FRqPfdGuyANhUggDeBBz+weGbmOqMcLG+oBjQpTXjneFe/NXH2/qkKMkmLlm+GnJZG6WWc/OMa0+k4d6SzyKZBxC0L0zdf0Y5FIB8zvvno//SA7TJdsIzV17czKxuU4mdD7mQlOoLrNkO3RZuH2jzgOu0NWpd8XT2q0N9us8kdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257790; c=relaxed/simple;
	bh=3NF/UT+bIdNGyzpzYRH7TdrzumbZFNv2O65NMnOA8tY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KzfIP5dnDBsqraLKVzODyzRDJKgAmqERqmS5IQkg1Qr4ZVAqrsyS+jHbskd0Q2Jmh1XF1+npi8FWxD2P22nqaA2a+y4/XO1CNUfUVMHpxx6DR4cvA5Q6KpFoInylEPdlHg9gCEiX4tEkiD1YuHyAmbS8sePqjpWziysfGvos0gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tasrePbG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tasrePbG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so63735215e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776257788; x=1776862588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlZO0eraAxc9RdlGoUu/4T/udUp+sK68ZU76CN9CV3w=;
        b=tasrePbGlTg56XJvGmeyalLwXzcmwN72Y38ySygAj1LdS4WluYzhENWxAkZZ+3rcHL
         iwnLWQIqwls5Rq+l2D59XTk1MIfhunSy2HcvWRVDMppzJl7wvqfmdxmv6ITtuu3/ztme
         OJNuo85CItPSLPfHKDCixDEUS5jW2ocknBE/PPh2K+uJAu6++MzQE94aVEJTIhE0EhUq
         Mf49xG6fMrm5CjgnSyGRKluxyNnXIoJH5N5PVWCsiriB50Ygx1xUgFjCgv41NVXb6Lpi
         xrLq39qsOvFIWlsWzUELPnRQNTe+gnJRY+LsmjMe6Cn79Gl7RpfctdIHP1Ok4ZKz9M6Q
         XQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257788; x=1776862588;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlZO0eraAxc9RdlGoUu/4T/udUp+sK68ZU76CN9CV3w=;
        b=fYCD7JZzXb5QYR+DcNS9CVegrMH9mnI+tjO6QcZZP92gBlm/rtN8rCspPCaJo0A5q5
         CMxIHsqXLUJv5DksN7tLWxZyh5MzKG7JCXFYByVRXbW4TbkElEdhlkKfClGvjTXRoaNK
         eZ/mnlHhIpiBAEd1PrCfgn7D23xU54a/8G7As1Ue8cyOZTif3IoIqiNXJoZ1RMOISnug
         l/2BX2ImBX4A4cbqV9/EwGw9rTk0pwe0+sZGL+87btDxVSj/jZxMmgKHzp+TArmQD8Qm
         yyrrh7MKaWaH26D5eUn+PjyTHExnithQ9fhWxaLzWrLNqqhpWbyBIovYGN5E1UGIIf6C
         4LZg==
X-Forwarded-Encrypted: i=1; AFNElJ82r2fVj7t3fwTnoOj9cDn0w4gb+AKpLSpoEasFpaBteiNAR7h2yaNUly8e6torLCjpsiEXZAzZSkhK@vger.kernel.org
X-Gm-Message-State: AOJu0YxBOqmh8rJOvsRDrwVZucaXGrsxgMSWbExJ+o2tSBXRy5dEz73W
	3/7VEDT5wIRo9gUrelT8l1ytCnGObkU5dD6bBxPBVqOGBJRDUIsnXMf1sMK06RCc66s=
X-Gm-Gg: AeBDiev28cAe1rA11aqHabmPeeOuwkt185xqJ4RNXvuIjNYf4GJevve1aETePft/acw
	Oqn8Nr6iKenrOnnZ7rFYFynsdFOjuuvhYaxPu76DE1h6vG/WXrIQSuHwBx/6eimEWijkp3HxtXV
	Eru0S/nqtwP57rv7hYIcfq/TX0crXFslQjX7snOGsxk4uDlsoIukZOcul3Wq51VGSWF2i8W+8sC
	PvD5sBWocHlGh7R+gINV/SzwWhDXPFw7KQunj1z7q3Lnc5tBIBchkMzCAGtxK3J2re5PrUvLsZi
	h7ZuvLYIxzQA1U20NvPzik2a3a4PvF/TkCc9jfMkDvBm2qqX5aVnF1zU9HLuoy79o0vTdvhs4Mp
	tBg7TP/MRYOVHsab4QGb8VxkngkelBXjoFm3mVjpwXD+CKRWRc8wQAE5zuQ3poiEB1M7HDqGM+Z
	RisbzzVJB4lCTTbMaZSwVvJgwRzT0Sss/WnH6XNdXleg2tMBYHMdOpKsnEufzYjILoEZ+iDMO2J
	b3EtzSIKlwo7ZyLqQ==
X-Received: by 2002:a05:600c:3b29:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-488d67d24cbmr280170325e9.9.1776257787605;
        Wed, 15 Apr 2026 05:56:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1c29:ca2f:5699:2fdf? ([2a01:e0a:106d:1080:1c29:ca2f:5699:2fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f1d5dd43sm49046795e9.0.2026.04.15.05.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 05:56:26 -0700 (PDT)
Message-ID: <661c12a0-d736-4a5e-8bd5-43f0b46da4d6@linaro.org>
Date: Wed, 15 Apr 2026 14:56:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/bridge: waveshare-dsi: support DSI LCD kits
 with LVDS panels
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
References: <20260412-ws-lcd-v3-0-db22c2631828@oss.qualcomm.com>
 <20260412-ws-lcd-v3-2-db22c2631828@oss.qualcomm.com>
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
In-Reply-To: <20260412-ws-lcd-v3-2-db22c2631828@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/26 19:32, Dmitry Baryshkov wrote:
> Several Waveshare DSI LCD kits use LVDS panels and the ICN6202 DSI2LVDS
> bridge. Support that setup by handling waveshare,dsi2lvds compatible.
> The only difference with the existing waveshare,dsi2dpi is the bridge's
> output type (LVDS vs DPI).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/waveshare-dsi.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
> index 32d40414adb9..ded57f298d64 100644
> --- a/drivers/gpu/drm/bridge/waveshare-dsi.c
> +++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
> @@ -177,7 +177,7 @@ static int ws_bridge_probe(struct i2c_client *i2c)
>   	regmap_write(ws->reg_map, 0xc2, 0x01);
>   	regmap_write(ws->reg_map, 0xac, 0x01);
>   
> -	ws->bridge.type = DRM_MODE_CONNECTOR_DPI;
> +	ws->bridge.type = (uintptr_t)i2c_get_match_data(i2c);
>   	ws->bridge.of_node = dev->of_node;
>   	devm_drm_bridge_add(dev, &ws->bridge);
>   
> @@ -185,7 +185,8 @@ static int ws_bridge_probe(struct i2c_client *i2c)
>   }
>   
>   static const struct of_device_id ws_bridge_of_ids[] = {
> -	{.compatible = "waveshare,dsi2dpi",},
> +	{.compatible = "waveshare,dsi2dpi", .data = (void *)DRM_MODE_CONNECTOR_DPI, },
> +	{.compatible = "waveshare,dsi2lvds", .data = (void *)DRM_MODE_CONNECTOR_LVDS, },
>   	{ }
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
