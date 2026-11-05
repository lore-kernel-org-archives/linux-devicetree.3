Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793889328;
	b=jif5/SgOZ1VaxATLqXy4yMQjhBHxhBAvLGvxHGzvdCHjh2Dv4QtaDhL7J+szcAJPR+CZ
	 G888kXUc+HmTu+XYpnYUU2KKtStdLbf7bAgQMEgrIMCO4RJa+QHoOYvF3qZGAe6/lmygb
	 /qiR/3cNo+2Zz45KCtvNvrhNYMSf3xaKs5QM64+vuyCPBqiIDgiYSD8PrqqLqRA+ayNgi
	 Lb+pU+k42Sct0XRHQiGUWGMKdS9jezNgarS6+h+sdzWCyMBOA7+Rt9C1wEkc3n9Y5AQ4C
	 xfr5fzL3uT248vc5HEuNWFwTBca+I7An+VQZcqtUkKqcATM9R1M8O6Mt7iN+D2YlHbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
	b=vGUlbCSiqAzpQjkVoUnXXKy4Fxu7rWbId/JjGbEUHBl0drLjgVQqc0Z0modx0CmpzT++
	 znyA9Ww+QdkjsCAWQQvoqQoG3cq+2aG/UXZwMdB7BSIZj9hRHGhEa5Z/nqm9a1+9YzKsV
	 Vt0ckavtUQHgx8e/JHdYkG+Io4lRhD8wxPVZG86vfBJdLeIQ0BzwwINtzUu/HW/KTksb9
	 Y+ZoZcWL/DE2c3gYkQmctSavl4IsAZT56WXXGkznAm5iWgMQ3YjwMlo1P2cZNQN+/9ZjM
	 J8L2oLGYVHfdpUEgxW6Uv0MPYwG1IvdYK85Ex+U8S4ner+sBkD1WnlmOwVWWiz3Rslw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b="Me/qf0GG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD191606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD191606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Me/qf0GG
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89ff475a152so875451b3a.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889327; cv=none;
        d=google.com; s=arc-20260327;
        b=gt0kptOHZ/jsJwOFiGZ1P8sKtV09Spln/GXLknUZuyVNL58aNDQ/oZ7VXzTUZxsmBZ
         h6Cmz8LiyCG6hcYypc0+69ZxF0ND3jqctB66jGQzvVDKfSXuBDT0LFE41EO/d4i1hYmG
         +Kbw15aAe4izETM79yBmZccHTtAaFPHBVbEZEdZzfvKLuZawwjANWWaSYgGs/aE1NIuh
         +1smjsRX8gmsUAS5Hqjzy1inqjlgTimHUYl4c4D74kU5zXUmdAxNH9lu0l5aj1uXTM7h
         mloI2Rxl7STNiDsX6CY9X0EP43IR/f8UkGKfIF3pKdsptmq3VU7YDIRAPF9PVuuSGoAE
         kDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
        fh=1PZVqnK41AbHS398aRUi4oXzu4I6PtaYk6jhh2A9+3k=;
        b=NaDyPScOpfx1vNa9emqREsNugUEHdMvWwkfmxO4i8t7+5wfoxvg2YHr6bWLIsnWgpb
         sxahAt3ekh0bG6YEjMtikae5uHMZZVEmoQK67r0VWHmol8uYrEAulXd0lVbfpQZvfjuK
         bxmdJ+xCT6W33oykg54TPClrrhTFsJWX7ga3pjWWd7tvRMxzayPt1YMYD3+uyrXqmjhx
         HP1OgrjUVWc8IllvdOMIYskWY5Cgc/nJ9KWfE3JzibxzYt76YDHx9G9kLD+yEmYAWdoU
         2RidDfDZunUeXI5ZmsX0Ouctyi0DeK/BfJM4h4tc4IDl1CwADrUKDQVyQ+f0EPjhB6pt
         E2ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889327; x=1794494127; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
        b=Me/qf0GGQl7p2CLtA6UaauD3mVPhNfPZ6j+rMbzFCTrHwPgiOWrruC4R7wOiSLDsqo
         q4wbRY0oHmY0K8JiqAKm9J1pj4tJJftZiu9UrwIySoSSBeZz060odCbcjACqxZoG+tqM
         GvKUJhk/febxO/RSJM91tFI5H7yA+mDnojqoME7qdjczkfUyNwr9GLKrfk8awmCwKo3N
         QbjsXR1lROlWQo41cUm68ebiArEPwnfjMnt0Z2GdcYaJY4UeFsUHVbNAQx4YN92ig7bU
         wWyRtRFBy7d1BscGVrMRhvynGCUSbepbxsFlX6alToFslnbPBYY9cyH/JZy8KgBr8jJm
         uF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889327; x=1794494127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
        b=Z+Nj/NyELKztmChAVUV9ssMOWcmlBZzM3yxLFfK/vVmomnLlJyNxaEwR2AtBVuUKoH
         OJZn6gwlZfo9xJvDgsnLn9+gZYZefYFqEy2P9vJcHx8mMxCL0L31LFUblANwtEIHM6w6
         AMcrlrCWpw39mZWgpiRry5gD4xIi5eKhHR5RQFA+HAPTlBcaAuQmHoIalViNqSp28REx
         WzUXnvrbibUegjY2vRSnkvapoF540KWp2gCOYajiMFLO0o4WDUGH9RRukV/otH8DZRiG
         TBZEWO5N53IVOolgjroMU0rhRE9lrslUk4aXdhpN8md2baiOWFseUABimJG36tl2t4Qr
         M9eg==
X-Forwarded-Encrypted: i=1; AKwUvBxOQi92Xr7wHslkK2Gf/jP6SveWvRBKuCFo9xBppuTPbASnCGrzf1xbxLq/S9v76d82AEILCMG1GpU/@vger.kernel.org
X-Gm-Message-State: APuU4Z/UezNd9UJn8j3ezfP2g4h/V8U/guRVc3t6tERV1wNeaF/GhS6H
	5S2zD+16NwgluGEjEt4ApUgg6qMsrggt7YWRThXgKcA0tyd4E0mCKHzPwEkMgllpAgcZndsZTCm
	zLGsoUKL2P8uh94fIhGm/y2ndKZBNIFOzpknFCDoMYw==
X-Gm-Gg: AYBFou10Tjb/jeAPyVero+y/yMtNyE+QeKr13VIdooeUsQ8bufWW4ORihuLmSYV+hV8
	y3BUv5YdaahgKOcgychCQpy7mfkECDY9PacZ+t13yURLYMW/czSw+0XcRULfOHWBv64bcDnGYDl
	dB9orf1xe2qEu2Rwvh/1cwn7FroRQzSJsYNl4QYhLtKrPjM99maEBNnSZiP35YOZ75ufBehy6Jk
	Ne8uHW2EVH8ZxOn3ahNnVRH4+azgRMvRs22xf9gk8UdnvTKaKGQ8qZC8r2H7f357R6x7NgkDJgY
	IXsdI21E6W9a+oJpeZSj1EmQjfRcEWNrnltwtOTdU7SMq19/KbXwrsy5zGXZqlIr+AbIat/wN0G
	Wh36ITh72dmk/vhdn+YTMxh75VusUpa+Vm2k6ycj/sM51i33qnTCMYMPU3A==
X-Received: by 2002:a05:6a00:21cb:b0:8a0:6860:cb16 with SMTP id
 d2e1a72fcca58-8a9ba806f4bmr13913523b3a.8.1793889327094; Thu, 05 Nov 2026
 06:35:27 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-9-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-9-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:35:16 +0000
X-Gm-Features: AclHuK_n1-N1ApR-k6d2Ij0iknOGmj4ALZ4zRGpX5gsfuT0639_6holwqyNMTac
Message-ID: <CAPj87rOutcy5VhtmqYg=YD4OB6dbRzxyaf1rG2kcASp477X6og@mail.gmail.com>
Subject: Re: [PATCH v6 09/15] drm/rockchip: vop2: Use TMDS character rate to
 select DCLK source
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> The HDMI PHY PLL can only be used as DCLK source while the HDMI link
> operates in TMDS mode, i.e. for TMDS character rates up to 600 MHz.
> Beyond that, HDMI 2.1 FRL is required, in which case the PLL would run
> at the link rate and VOP2 must keep using the system CRU.
>
> Currently, this is decided by reconstructing the TMDS character rate
> from the DCLK rate and the color depth, i.e. DCLK * bpc / 8, which does
> not hold for all possible output configurations:
>
> - YUV422 always transmits two 12-bit components per clock cycle,
>   regardless of the color depth, which from a clock-rate perspective is
>   equivalent to three 8-bit RGB components.  For example, 4K@60Hz 10-bit
>   YUV422 requires the same bandwidth as 4K@60Hz 8-bit RGB, typically 594
>   MHz.  However, VOP2 wrongly assumes it needs 742.5 MHz (594 * 10 / 8)
>   and ends up switching the DCLK source.  As a consequence, modes
>   requiring uncommon pixel clocks, such as those corresponding to
>   fractional refresh rates, will fail.  An example is 3840x2160@59.94Hz,
>   which would likely rely on a 593.407 MHz clock rate, unsupported by
>   the system CRU.
>
> - When VOP2 processes multiple pixels per clock cycle, DCLK is only a
>   fraction of the pixel clock, e.g. RK3576 halves it for pixel clocks
>   above 600 MHz.  Hence, an FRL mode such as 4K@120Hz 8-bit RGB, with a
>   pixel clock of 1188 MHz, ends up with a 594 MHz DCLK, which slips
>   under the limit and wrongly selects the HDMI PHY PLL as DCLK source.
>
> In preparation for supporting the use cases above, rework the DCLK
> source switch logic to check the TMDS character rate computed by the
> HDMI connector state helpers, which already accounts for the output
> color format and depth.  Keep using the system CRU when the rate is not
> available.
>
> While at it, drop the VOP2_MAX_DCLK_RATE define in favor of the generic
> HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ, since the 600 MHz limit applies to the
> TMDS character rate rather than to DCLK.

Reviewed-by: Daniel Stone <daniels@collabora.com>
