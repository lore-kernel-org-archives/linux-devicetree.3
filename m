Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401842E1EE0
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551262; cv=none; b=Ytfe04ydibFlvIC01+EziK5Qk5oX4+/nS0S47oIMBSn6+QvjhWeDKjpujlqAJsLrBRbU8He3Ay9Rl4/QkgsykD+fuy3WzlAhsN9tslywHHBUVo9AFh1uvaWnERf+ZvSGudalKxtRjPm9hc9x9zPqYD0sxnF1kb41/TKZ9GlzpaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551262; c=relaxed/simple;
	bh=A0XOoK0wvH1PQBH5QB2x7RfD1TV9PusheSC6v7PTO6k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YaCQdtU1qMnAHofwCVUe++APA3p3UBhYViepPCV0G/TNyr9W6fGEY8v/LXRwhJEFMet4W2ETZM4jLi5Xaw38Q1JjrHnjzPpaSnQbkgppSfsCPnGfrLjRVdFRVuibtgI6lWY0HDDd/VpwEo9PLFYh6X6wipesz4fvyKggsm3QfIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KDL/gZz7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KDL/gZz7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49550ec592cso8462805e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784551259; x=1785156059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9RLppTCvwfs6eki4J5o77QyN9i8+Bne6Cqvn0sJNVGI=;
        b=KDL/gZz7wUR5vWQBhv+icqcyE8gNpO4aoDsoqByQzJKxYe2T65Q9PX9972jVxiQ7Rl
         /pPcoDHi7vQP9vpwkauwlLod+PoAeRCJfJ+v8qmnMcL5EvpLkyetPF6pCOZrwlSQFjam
         XIJ/KwyzAOF+aDj/EHXKmF1MH0nenE4GgCep7A6zyNfnlCw5Id7hSeXe2yhxCe1mYrY4
         TwVDIwYKsLyieRnmKsAvJ+pa7kG4H3Nndx//ys+1n35iAQrf2UL+oWfrcQPneT/rHuZr
         KGCbb2pUhv4JnEwg+FQ78hS1DXgz8xL+KwuW9d1YhzESgacScM2MCGzrqcicDA84C7uJ
         z0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784551259; x=1785156059;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9RLppTCvwfs6eki4J5o77QyN9i8+Bne6Cqvn0sJNVGI=;
        b=oA1O/5pUlaA+mzed+hahAilnj2DWhzWb8rk56Ulrw6VPolNm5tSdH03nOwlbM4SN21
         uSE3dfe6DjhHi3Gs10QsphVisgARXRfDqhlvyFd/vyriOUF36ovQCMsmY3WuzlKx0h+e
         OeDKoLyzkuZTgrnkUMnvVvE1nz5zExIOWSfHWcBn3/72+lVYt4LQp+VYPBiMFgH5FtE8
         aPBx2gkIsep823de7rUa8uGQEH8gBqI8e3T1lqLz7O5/XxcEZg3RGom2oPY6ispo+vpY
         WyjftoVV2OVomz3HYm2Z0SxljjaO7SOIub6BP7h5PZVlz1qrqz9KSuxw4W8z5wnAkScO
         4KUw==
X-Forwarded-Encrypted: i=1; AHgh+RqyzSz+4vDS8qheRRdvr4XZnAMIW4fKa1tqhCcGLM5/BwR9I9zTepg6eiHmXUqyQdQ/VzcD9BD+3fyd@vger.kernel.org
X-Gm-Message-State: AOJu0YxDnPrEmCoUlVJkbPyiFuQEQ2la+Sx14rNehHwh6JmkkTfhItiJ
	AvywShegCOajy/YZNnd9SKzib4m72YX+r8wt8FCV4+RRE9+Z6U++M7vhqG/Z0631UT/pcXNNiIC
	DP3Lq8BE=
X-Gm-Gg: AfdE7cmjRh7aawx+lMDyLlP6q/NIaygdaD6M4ua9UXOkJrX8WEXaAETW1tnyfOB5yAi
	qB+8IqKqTCzZ18OWBV6x1yqSnlfpltfDWY3BSxZFDGoxGtNm9Oh5ULbPpdoMzuohvW/tefg4r0Z
	Vo9hR2B6rNNeQfaXgVtI5O0yWY2l+9pJ9aWIIzfW+MLYlvqVP6aHt6j3mw85sWv/1T7b+ANE0yW
	W2pn/cuOgl6V2hF8pFcZrF7Zny+yoT1doOKAt8y0U3hi99oHDmafz7YV8pkYxt+Fqr0KZvvYlLj
	Q8zKWbzFxmld6VrQTM503lJ6uWpIb0HKDuFiTJ94lByUPmP4+ItnzPM8veZcFi4viFZVb0jHczV
	KB8xI41UF7Tm/MntmbezTKJqB7feVXVmdBJO56NxLrdEngjqs/PiCLCUKS592tZ8TyR6I4ec8an
	pAylM7AWtCDna/HKe66oyQCBog3Opaj9XI1qWR07FDhsSIxKPBp3EeCGbb2A==
X-Received: by 2002:a05:600c:b8a:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-4954a33dc55mr148751995e9.16.1784551259402;
        Mon, 20 Jul 2026 05:40:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:544a:2852:f257:ebc5? ([2a01:e0a:106d:1080:544a:2852:f257:ebc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499a5847sm201100115e9.2.2026.07.20.05.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 05:40:59 -0700 (PDT)
Message-ID: <39c805d0-0435-4c27-980b-97a7c2850b87@linaro.org>
Date: Mon, 20 Jul 2026 14:40:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/5] drm: panel: jd9365da: Enable LPM mode
To: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
 Jagan Teki <jagan@edgeble.ai>, Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
 Felix Boucher <felix.boucher@savoirfairelinux.com>,
 Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
References: <20260708213500.1867092-1-marc-olivier.champagne@savoirfairelinux.com>
 <20260708213500.1867092-2-marc-olivier.champagne@savoirfairelinux.com>
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
In-Reply-To: <20260708213500.1867092-2-marc-olivier.champagne@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 23:34, Marc-Olivier Champagne wrote:
> The JD9365DA-H3 uses DSI LPM for command transmissions, make sure
> this is configured correctly in the DSI mode flags.
> 
> Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index f6b04de1182e..1ef0c937863a 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -2950,7 +2950,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   	else
>   		dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
>   				  MIPI_DSI_MODE_VIDEO_BURST |
> -				  MIPI_DSI_MODE_NO_EOT_PACKET;
> +				  MIPI_DSI_MODE_NO_EOT_PACKET |
> +				  MIPI_DSI_MODE_LPM;
>   
>   	dsi->format = desc->format;
>   	dsi->lanes = desc->lanes;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
