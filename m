Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794935;
	b=ooceV6LTH1evLAOZWzHf7wuEoS/hNJR29dZW4ZwMLvRwu89bHIihi0erdfhKgL8lti38
	 EgXBYXY1W+AaYfe/lETTMkYnHgDUeOJm9YbhsYg7Zo2++S3K0VolozZnJB3TuSnc9d2qd
	 pxkUEN8COV7ZDDlJ327ldPZj09nVzioI18Tu+uxFIy2aOXYa/YOXBcwrOdynXQw/IbNcv
	 Vkjdx5NS0cXTKTtc7QDrGkNo2XSi52qgm8Y53IdXH1kLIbh4WmRIPdOo1DhT5Mm8qjfxM
	 0UjnAU4MSeVaWjFkLDNPCCFwfR1BTKMoFtY0Sij5fYTuauQR/OlKn3KRWD5RCh37mYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aamHFFzwS0CuBXIurBQ2i5axgQPtqXRYIqnraY6fuvo=;
	b=Cea8crd/IuIfhkaT/qtvTTFvhHfx+rn1hGGNR8JLaub/SiexQjbUekcpl5jsiQX6gbXk
	 3qyvV3aj+NWuTM4wWa+75YLE92/wggfinIexR9XZTYHkNDUB1Mt2eWefzpZ3aNnVYuQQW
	 M0TAbLz5Yas5B6PPHWCcBPQ/n8C/4K2Ze+pRNrct3XyItnQ+5yhX32a4jlaTGP5+Hu5b1
	 lud71RXlpdm8DgAkMbks1mjkFqR7A13e4jdsoV4DO4qbydU4A+HtvP77Pu9DXI/PuOKGK
	 qw4bDQYULjeP85T6Dk5jm61UOMI31JzqUizg3tePjkC5uoea+7qgOuM+pypU/Gi+9+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=STCmbWQ4;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF65B606A33E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF65B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=STCmbWQ4
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so12862146a12.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795794932; x=1796399732; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aamHFFzwS0CuBXIurBQ2i5axgQPtqXRYIqnraY6fuvo=;
        b=STCmbWQ4UewMFNdT1uhAQMvGxDQ+Czwg0A/LpYUQwYPo4acKkvPsx8o7EYjxc3JOXj
         0fqsMScXdhYDWKFXgtqS1udFUxPMdZ88Ga+isgQekxQZYQaxKf65iVCeKDoZF2w/JO/t
         AzETHsvchFXd20ugammQpkBx7ZeiY+QnSGU4VJ0HWFgHzLJsMj7IBRzjhJH1MA+8zE49
         Vi0hb1MAeWBYT9Pfq6AQnJJuu02YlG9k0W+ipeVG9dF6f21mePSC9HNc2hukTN2POCa7
         UNa81yms15zWe/TBVSIe75pi3TYN9NTp9baFvLSGi8iNL8GiPwrQ/CI/UawvYTxTogCB
         eL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794932; x=1796399732;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aamHFFzwS0CuBXIurBQ2i5axgQPtqXRYIqnraY6fuvo=;
        b=Bd+ZDeUpe+SqoxEl7XdfQT6ZhIIOoXuUyssIrf/v9vDgBhjfWLhqv388AFEnXdo89C
         owTxdvvqkY3NXZ1lbT/nbz3hUDQJHQAKQidwSDWd3psRp+VmhBtMoOOJ2cgWDNk7BeKS
         p8Bvvx2WUZMbIKxMqVQ966X3NGNpmtJoipKJmDZNmo6QRCNpW+GPjXJsgm4gaD/t23eb
         qMkDbGMoxYNDMU31aPO5CPXDW+Wsx+jYB8lRgt0KvrUf+rKLDSAxKHA2k7gDFqao8xaO
         jb1nfcDZwZfpYSLIDh+a/GEk5ycglwiseO7FCjjJHN9MH1VL79Tl2bHN5W0AusKHlXi4
         ERvg==
X-Forwarded-Encrypted: i=1; AL+hErFZRwnlvGFFuxvkNh5KRPoN0DnjvLzvx9TrqmWFa4S5hQ3gPm+MvmVEuZicBmiFOyTH4hh5vUPtoQmJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9e2CfyRWR66ruiuhz4nULU6oba8szRlslnvrHYVlsRLOgS3fqZ
	kraRUvZEbqFado+ZvTEMo0MFV2gZvyCTredCXz9Fzyr/mVZmbi6vB1iiZfkWXIHtbM4=
X-Gm-Gg: AZFdTZdnD9TYx+Cew9i4cpAF4iIIrV/BE0hLP0xPJX47ntON5mnQMw2HU/8dfdPg+WF
	Wr1bBP5fpSAQY+2sPmI7xjb+eC1ulq8vfQVyFl4LyZi9jIrj2m905j4fz+VigLFfsk37CseduXr
	hWR/b9LLZZA899qXBHkJ5EeZX68rchbjT6jn2f4PS7OFBnPvcotOIaoteFB1XNNEF49vXwBFWbw
	+ciJNiWcl5HfAVy+g0WKwB8DGc/OXhJ6lK+pHjA3xkGymWI/L5hIBNRnaKjiTTYmL3gip62gCkE
	ObMcWT0AMRrIXzs4SNh3kquJHI6bftWvSryEHJvXbXeCodhgYUYWj3DVzVe7QZWe51snaTyeUhw
	aJfSRYX++Oosua61Qt/EwsZWGI8f7zjB5uLOyCeBZl/H+BgwzghqmbseLAvlioL9DFuiqdK0Z9i
	e7xRmgB9pcQUfEYNtTfIpzbfOmIP7gr6ywUu+BuAZqhmqtXRIFP2umEQLCFZ2InMaK63FRs1x7u
	f6wbPZQUPCprTVojmGN14VhZB4WHZIvKciWERyspLEDK93GmrTwMVFum8JoAZJwWIg4wbXtAEKv
	JdY/IGiKW1QuWmKNZbqlMmXuXs3rzJ8jXP0XIwr2JvNe6eYr
X-Received: by 2002:a05:6402:42d5:b0:6ba:b20f:60ef with SMTP id 4fb4d7f45d1cf-6bab20f6810mr13142715a12.14.1795794931858;
        Fri, 27 Nov 2026 07:55:31 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm11127032a12.23.2026.11.27.07.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:31 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v11 1/2] dt-bindings: clock: Add gpio-enabled-clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261121-feature-clock-guard-v11-1-00c633a667a2@bruker.com>
References: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
 <20261121-feature-clock-guard-v11-1-00c633a667a2@bruker.com>
Date: Fri, 27 Nov 2026 16:55:28 +0100
Message-Id: <179579492872.2809466.854994706444744625.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=EINX0tsXJyuIqPfhhtODzW0RYgk1o8pIb3kiWYxd32o=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcyz9NeeSvuvxluoj/fc+eDxPTeFoyO7wUhVVepi4+E
 iT7z2V1RykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZiWMTIcEhN6OOtXNeedfw7
 qyo8PxZ6pGjGTGJI0/pyNvvtxZeNrxgZ+u94BJycfCmGgS3E4NYx+V4240lqPgrX/p6K6+0tiE9
 iAAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Some clocks are switched on and off by hardware outside software
> control, which reports through a GPIO whether the clock is currently
> running. Software cannot enable such a clock, but its consumers must
> not use it before the GPIO indicates that it is running.
> 
> Add a binding for a clock that passes its parent clock through
> unchanged and is considered enabled only while a GPIO signal is
> asserted. The parent clock determines the rate. The status GPIO is
> given by enabled-gpios, and poll-timeout-us bounds how long a consumer
> waits for the clock to become available.
> 
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
> Our use case: peripheral clocks generated by FPGA PLLs, with the
> PLL-lock signals routed to GPIOs of the SoC.
> ---
>  .../bindings/clock/gpio-enabled-clock.yaml         | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
> new file mode 100644
> index 000000000000..4861c87ae5e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/gpio-enabled-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO Enabled Clock
> +
> +maintainers:
> +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> +
> +properties:
> +  compatible:
> +    const: gpio-enabled-clock
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  enabled-gpios:
> +    description: GPIO that indicates whether the clock is enabled or disabled.
> +    maxItems: 1
> +
> +  poll-timeout-us:
> +    description: Timeout in microseconds for waiting for a GPIO signal.
> +    default: 10
> +    minimum: 10
> +    maximum: 1000

Those limits are made up. I'm not sure they make sense for a generic device.
It surely need a value, i'd prefer if it was required then.

I'll wait for the DT folks view on this before applying it

-- 
Jerome

