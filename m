Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAE045D5E7
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447882; cv=none; b=I92BWyjDjYxm4tB+tck2ugwptzTPjritxKw1lPhSmquPJ9sSP26tEqlxNNiOxtKokMW1IcoD/mOnnNLOtA/C/QRINMt5EMPiWnZb5I/7Dt9kiRXzsOl+iEx5Pe9Is5AP6qUFCOY+O1DCAdCgUfGByt8GKCrnVHKWgqMtDZFKiVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447882; c=relaxed/simple;
	bh=R19lXHv3qObauzbjTU4gwaYFk2HryBGzM3LG4AIi0Q0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mgFfrG2L0FidP0aD+UvlKfGEvzYfmFHwtAGoDc3EgKg4DOcCbd3TKUmKuM/soBr6aBRw9lNDvL9Vv4ZFnzTC1Jx1d6+3yWL9U2oIN8izwZ1a8LlPMgfeSQf4j7c3piIQmNvGLVcUajWL4Mu/3xQtbPO/Y2O2ONWymbNk9cBcA+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VPqSJjo1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VPqSJjo1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso49441495e9.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791447879; x=1792052679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6ASayUKoMdn/Pu+VkK60Fyzl8gQVjykNVGO1atxmUU=;
        b=VPqSJjo1D6Ye4jlJ41V+/Q5kylyaXwDzIpBQHzjjpHV6T+pgjd8ZJC0ERRFeWFwPsl
         bo7mWQHBxtNkLkX7yaJL70pOvrEmGWwMjURAReqJaUEp8H7bePKqIzcUmfmx7pV3T2QQ
         sRyvvu/YJdVGbvYQuexKlR8DoMiWX2ooNhKL1UewFk2z1//5u/JISd/PER7LqjqQA6rg
         IV0E/4PTp2rcgDxV3ACH8wPmoDx8J283FYFJJB9X6D3QfSkYR2jPWAPjViv9LqmG93mV
         ekGL1TeTKaKi+Eyr7r1iXsVSna5NtgpCXnLFx1onT8eta8sqQbDaN7w8Njws1J/lTlmK
         P7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447879; x=1792052679;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6ASayUKoMdn/Pu+VkK60Fyzl8gQVjykNVGO1atxmUU=;
        b=BK+hLmYF5DJClxxIOTq0+94ejS1ytwPGrA25ue4LFQYbH2GpfZnU+a2jChQuYSChQO
         InODAlNvNo+tXhl4BHhs75nsTb/vymIx4dKSo3lnAuc+Nc3wkAqh9FRMhmFJxqfZ1ywG
         eUl8LpQPhfb8Yx9Yxcf3stAWVS6dPOi8S5JjKg4ovfIhJMPi8flCGJbvarUU/7FWaEyA
         hHBpOZkJBarurbm1b4TO7vzae+xjSYc022itOwynpIuaGFfKe3xuAFtvbMmTPuZuO9C0
         CaJutpMFLmVv+ng1cK/HzhBdZyKixypyHvAyrFYy7B1L21tEoy+Noufddfwu9zL/qagO
         BwKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzir0OYMyqbtgB60OJ/ubrtdtOkJCxwchmU0wMXYpTofz/d6H/qKIsr16CUB1rkojZysX3koyYbWpmc@vger.kernel.org
X-Gm-Message-State: AFuF++n5BTnYazYu7MHoG0PorVjiDhR8mgrbyZyw98AmeCv8S7WxAmpN
	Htnxx4OZtg8xIW6OaBhqNJqVQ0Fqnig7RjsVLoDQ43mISf/ovibonLT9Q+JKPo7b5A8=
X-Gm-Gg: AYBFou1pUYqcXUsPlshS1FRmLBZREQoxoz7Hvz0YokG8OPHyl/LjBbeMO/L8L6xOfmr
	r91/lLp6kCO6xNc8kBs2x4JEhEzmGtIfOSpmUDVkPx3XdvBwU3nLaYGpoQE4ZWdGiOLNDBhotyR
	WboCFpPEKJM9aUTbflmYrKy1ZjhNX1bGoSH8A7WwNFrmx1PlCKmFNWb97swYkzCGUhXnDMK/87e
	nU7rPyA9loPAUapyChk1z1KXLzuZchY4HTD372HyH7Z9A0Or22w5fAWW2Y5daKpQR1IutC7kQ5Q
	xa10U7SB4zEayii1XrEEaQjmzg08piU4pv9BDg0ZhjeRb9X8Fa5u9yHoDWz/h4dv4JKwh/Mdhjs
	4X+xJzXh9CTXoyxVMxwywgxiuYfjOb0qHIJfRntNrc5MKAC89xNJETY8buEM8iKaRAK/kqbUnzs
	8E9SiCIye0kuCtJRmYgu/PRog77RwVL3I6h/qQtiAaHZOAqV1pevqym06N3/Te16UCLY4UVCv0O
	Q/VISzZKyZ0UdeUkKrE3bqVflt3sC4=
X-Received: by 2002:a05:600c:810c:b0:4a1:7163:3e41 with SMTP id 5b1f17b1804b1-4a1804234ffmr77254905e9.9.1791447878231;
        Thu, 08 Oct 2026 01:24:38 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843d1e0bsm51322805e9.6.2026.10.08.01.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:24:37 -0700 (PDT)
Message-ID: <fa64131e-52a3-4058-9655-e1a4c36de47d@linaro.org>
Date: Thu, 8 Oct 2026 10:24:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] drm/panel: st7703: move init commands to prepare()
To: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>
Cc: Ondrej Jirman <megi@xff.cz>, Purism Kernel Team <kernel@puri.sm>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
 Felix Boucher <felix.boucher@savoirfairelinux.com>,
 Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
References: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
 <20261007201859.3709656-3-marc-olivier.champagne@savoirfairelinux.com>
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
In-Reply-To: <20261007201859.3709656-3-marc-olivier.champagne@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 22:18, Marc-Olivier Champagne wrote:
> The panel init sequence is currently sent from enable(), i.e. after
> the DSI host has started the video stream. Not all DSI hosts accept
> command packets in that state, so the init sequence may never reach
> the panel.
> 
> Move the init sequence to prepare(), right after the panel reset, to
> ensure it is sent before the host enables the video stream.
> 
> Since the init sequence can now fail in prepare(), power the panel
> back down on error: the panel core does not call unprepare() when
> prepare() fails, leaving the power supplies enabled.
> 
> Both patterns are already used by other DSI panel drivers.
> 
> Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7703.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 368c57591817..f4635a7327de 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -774,8 +774,6 @@ static int st7703_enable(struct drm_panel *panel)
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>   	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
>   
> -	ctx->desc->init_sequence(&dsi_ctx);
> -
>   	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>   
>   	/* It takes the controller 120 msec to wake up after sleep. */
> @@ -784,7 +782,7 @@ static int st7703_enable(struct drm_panel *panel)
>   	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   
>   	if (!dsi_ctx.accum_err)
> -		dev_dbg(ctx->dev, "Panel init sequence done\n");
> +		dev_dbg(ctx->dev, "Panel enable done\n");
>   
>   	return dsi_ctx.accum_err;
>   }
> @@ -819,6 +817,8 @@ static int st7703_unprepare(struct drm_panel *panel)
>   static int st7703_prepare(struct drm_panel *panel)
>   {
>   	struct st7703 *ctx = panel_to_st7703(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
>   	int ret;
>   
>   	dev_dbg(ctx->dev, "Resetting the panel\n");
> @@ -843,6 +843,18 @@ static int st7703_prepare(struct drm_panel *panel)
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>   	usleep_range(15000, 20000);
>   
> +	ctx->desc->init_sequence(&dsi_ctx);
> +
> +	if (dsi_ctx.accum_err) {
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_disable(ctx->iovcc);
> +		regulator_disable(ctx->vcc);
> +
> +		return dsi_ctx.accum_err;
> +	}
> +
> +	dev_dbg(ctx->dev, "Panel init sequence done\n");
> +
>   	return 0;
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
