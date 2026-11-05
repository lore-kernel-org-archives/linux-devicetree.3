Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793881150;
	b=ONx5/UArVevDiXVYGrKGWOBRKkWOZOBN37DXbaEDKRXwCBn2yv2VmyAzB90fNSViu112
	 RkT0W6/RK1hdzQTJ/HSqTeJNb6ZlFprG5ZpkELagSjE14DXalbEmMRUrgRaqHTB21dSdZ
	 5NxUN44A2r/wYNn0oBXB/XUCerYrJQNeQcOxFn9wawvikb7sRYFAc9ey0EhA/7V7IbkTf
	 tzAnRRbLyWAh8kYk9WrwQ3j0ihXdjMI0GX2UIa7UQb3jrmQB4mZrVuWi6R+DNidlePiMB
	 kmf38aYQjL/0OodJqSnMI6k+WixTK10niG+2H+c5X4c1bPBD3STzaWbaFiIuwGyZXcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
	b=ECyvo5cVZb9myH9f9urLVlng4GOP/eD0zC9B0dDZAl0V93ScOHRIvfLIYjLSOmwyAGzU
	 q4fqGgt5M9rS4Q+i2cUBdraq4fPlRfRz6YNiFEOfNlU2QyRJzwCO9MYDG4Y7AZm9lCbNP
	 Ml7rsHbgTUS6w7mEzF+OO30NhGdOoaHUoi5Fak3CoQnIZV3OnsJC2NHzrkOqm/aPibL3T
	 PHzJPMeFw2E11n7Ji5HnvgjQ6LIhDJYcxIu1evGroVvZOeDPEn67o+9USoExCKaAzHhUa
	 R3V3QLU5I2XCu2fnAEoNRy/0xN/D0/hYoIzViNpgk1pLHShXeEztLl3881O4WDRLH3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=pGveBj63;
	arc=fail smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46E6606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D46E6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=pGveBj63
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso756467a12.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:19:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793881149; cv=none;
        d=google.com; s=arc-20260327;
        b=p6CvPGwdCWHlR9qBmRCUkhIt3AlY1LfcUr0005llqri134CnNDpkB1saiaGLb6SzXU
         rfn6ZMRekNjurHjuwn7Ihe0wAeZScV7NDQ5NTowxrBs5EuLGvTKqZPspdWtj1HCiHeNs
         eFyMdxUWdKJi33a78RQqegFSqv2OyEqJTvF0DLJYLog9A6T76jR0Ca2JIigDEW8nUEin
         14mD0xVNQ74VJXJ0s6cUmFv7/hsbCBEZzKNRdlbflzm6p+kjTCfk34X9WQP8qgmxqgqT
         rE0RYTsihWp4Fo/l+SGi1vPxvQSY8FyFVypYx+GdOJhm8u3WT6XsEoqV/Ay+1vzIQWF3
         IECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
        fh=MN5BKT1hnv+rGkYwPy7A/3dmgb+3Pzl2y2uYCmqU2WY=;
        b=et64uuNdd4MTY4nrdMM/Ub813xzlAX7WHJZ3bYU3m16Fmwur1ZlP7B8xmhlI6bH9QY
         qxfQ4z369MX6EEW7xMh7hR1IjO6AKxSCuMootYEsCdaLydLxD+Yjxps/B7kFIUdoKbVn
         rgZh6Xm6LoogBOkiKHpMJclUeKkZ1UDtRSI8wfEGaj31gmZDnooh1CjWQZwelByj6vB+
         pMEk1pgeJiCwhv4m168QLME/Owo2Hr4MX03fH7PIjI7kHglvSPUDc7Ryc1RntFBcMr/w
         l55Zb5923vJPlwVRRA5tWKtppKmZRDbqze9i0o/T9miq/HQk3MGJqavtkqTHWmwaEzKc
         dWAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793881149; x=1794485949; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
        b=pGveBj63J8QKWRf+jhueXuB0ndPsWZfe7LfoalkUdNlsHOZ9fsYsqkqT8rGUpHJctn
         fUipHFPEHKZDCMtm+V8vJFC0ZwtAS21AcIQQ08Oq3K4w6YLjBfHSLWfapxR3EAHLSONf
         U+D+Auexv0At4mf1cLt3mcv3aHONwJuTkLq++LvA6yX5iUhX02j4AsQC9x2zxuCpwc9c
         B95kJHOFl38wViqg+1WG06SuRaDrsF2S60UBOx4n8YDUcdoJaeGVhYEMkzDfiOuckzWA
         HutJ3tTF6DgBoF7yplyl12feb/JaF7RHsVHFmW+4MXyQARMdGlOCu39ZZ/O5X90REnfk
         STBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881149; x=1794485949;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
        b=IpDUw4UOXWu1oEt/cAaZSnBB8XzCHwGALwxxC5wA0BP/+j8GRuX2NZvbTgykMrJyxM
         ya/OBoGYqanTHkAzkfxAkf2zotGz6BZJnWzZr2dVUtMwNjSWvjjQeygyCvm2d3VoFbCB
         lsW9fGh05TH4Y6McNlPvEZoPI0AWNnKB8VExSUgc/ynjTSMVo0eOFKye21rumaSDxtvj
         3FGEXUfLCN/Z4uiyGDoOyGsJvocTnw+Wy6z44c69E6TLKNypU7KnwZyewUzv5aPek9kr
         z23nDkPkKhZkgKvzMdkXEu79yiPQxdAbj7GRrtR1ZTAdGa3Gy0K13TJNElL4jJh0ZlNY
         ZmYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyfr9tf22J3R2C+HiNSAXG366xlfchjQ9oY6cBEncR1BQNiNQq0vvojdkeKMHLUEVr3LK7dukq2s9w@vger.kernel.org
X-Gm-Message-State: APuU4Z+ozc2mxr0ezI0NZqX3pefI34/aDQhUtcLxjfi0C2wTd6OkU8Ha
	N+atKT3R+iwuExRaFGZqiLldYGZjYu6XP6NECtN39iN8iMeq8E0Uh0WPq/nVnJn/lqFJFeQY257
	bXcWTwg2XTKkfPXe+1OXDbV9eoScZR2VtZc6WnZuyMA==
X-Gm-Gg: AYBFou3r8L3vgp/6MLtC84AmYjgWOlr52rllXei5K2aMF9Xlx+AUPpnsAj1uLMzLYVp
	Z8xc/rQqwmNqSEM8H/+jA8n6Co/rmYmdeAywidoqALEWCPbvGHaMHBHTRz2x7IHF1CQbIln5Xzm
	LRNNkPkiGupgaHHRuCador22uq230i7qYfIURI9o1rhz9xxmHCUZMWKYv0W9uhzEMOozi8gOQL0
	Jpvfmc1EkB3uCCIz3G7rXOavtjF4wYGsT6BcuXnZKRjUnLH0P34Ba/EByQaZVlBjqXCTIm1Pe1t
	NVut59vDJWb1QZCWt4QQbk0Hyiz9h6YfJZMlMf9SJScSvmdnMJ8lmLZuQ3Er8RGU+cgKYbbCxMn
	iDvt3erPVQ3OEpPqciEZV9emsbL51nS2GWwip
X-Received: by 2002:a17:90b:2741:b0:3a0:e4ce:31fd with SMTP id
 98e67ed59e1d1-3ae896f8304mr16451431a91.10.1793881149147; Thu, 05 Nov 2026
 04:19:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:18:57 +0000
X-Gm-Features: AclHuK_2VZ_bwNEEFECKGIAUHsyDmb8_QQvXN9pJrwLdMDPCY5CttgkKVemI1Rw
Message-ID: <CAPj87rPk=girxTziKY5ROV3ZYqGhKRz471BLWpkCjtvNNseuog@mail.gmail.com>
Subject: Re: [PATCH v6 08/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
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
	linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> +               if (pll_hdmiphy) {
> +                       ret = clk_set_parent(vp->dclk, pll_hdmiphy);
> +                       if (ret < 0)
> +                               drm_warn(vop2->drm,
> +                                        "Failed to switch DCLK to HDMI PHY PLL: %d\n",
> +                                        ret);
> +               }

I'm confused ... if we have switched to the PHY for dclk, then a mode
switch wants us to come back to the CRU source, don't we need to
reparent to dclk_src?

Cheers,
Daniel
