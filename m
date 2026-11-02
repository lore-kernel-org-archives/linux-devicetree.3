Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626839;
	b=rBncbVUyKv48bSpsiFtIBCOuiRW7IaRGSK/PhUS0VJNEXXG1pmY299aQNA+vBi76rluP
	 /0Wp8EF/Ds6X2mRI+O89ecZp3bRHPfODkwta47RFmcUVSb1wVkVMbcDsfg7obPtOM3Hy7
	 RwnOD0pPe2kp9YFInncerEav1u21FdKz99w+4SEGijNunXem3FtAeAonJzYuolL5OYQ3s
	 QK+CAyDnWVoAvNuOtsRn18SLrheHjxF270MQqRjPQIAF73iKi1l0tly/XPJKv0xC3QzW0
	 vserASxFYHSRb/BlvEmiLmfl8yosC+1cWyN+LuLo/wEBRjGtNZqYjp3nw8GTjMRylmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=h+wkXijMt26jWnEtDLY8VzmO1E+BB8IahUIUjU3Iokw=;
	b=SwTDFVJ6Er14A9xtTSWU3PiPN/tmu8WMZA8GfbvG55XSM70bGZHGyr+uznYYxy6yfuwz
	 MhwASHrNjMunu2SUhBJfLImIb2EuHW0TXJFLWb4pgQ2ukky65nqFQZtVy3lLF/AxxvCpC
	 vksYVzfxhjMWuuyYVpxR0ug1UCwXyvIvgSlmAsTiqAj/Hvw9RDB0cn45P1QQ+Xqu6ntBS
	 sXz13Uknt+xBD4ujnlvyeJAlFI7G3nFzk+YTbilFPryr41CyPLnTgMn9/rp7Wtk8cs6Us
	 Z+HhS7UKzRi9dnwJUdqTKRnJYhUOym6RR9rIbdzFM1Y/jFh0ABJDMHITIoFkpQ2V76A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfC9zOfN;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861BF60A2608
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 861BF60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfC9zOfN
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso30625815e9.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626838; x=1794231638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+wkXijMt26jWnEtDLY8VzmO1E+BB8IahUIUjU3Iokw=;
        b=jfC9zOfN+TtGHvYwFdh25/WeZJVuysLM3fzT3vC4kmGLy1EsAdN6y1fFLrI2BJCAf0
         huuq9AtTIAp2fbohQJgxHLtoYbUBQ8qC5e8+J5ZVRJAPJKutBxHFK6yUVl2SYUI1HdIr
         jBpm8GxQvfNaNQ/rq/TnyYFP5MqlV+PDWEXRmRpScb6hH9eP7x8OSzeDSQOcWAUoueau
         VfWXWbWoles1KzARZdhQENXFN44yL2EtVih9Yw9qilRF2y7odjwC1DzBGOtO7ksZmLuQ
         ZiwWb6ZbEzCv6xHzGkxMY8iXwoO6JFbyTNSXEZ5cdpRAm/12LRrg8PeYDZs1fcVKADLl
         o5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626838; x=1794231638;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+wkXijMt26jWnEtDLY8VzmO1E+BB8IahUIUjU3Iokw=;
        b=laeC04CdXtCT9A7RyrFScZ4Jn4jKzgqdb7pamUK9FbgW1y1XmjwY5zyq7kQzburP9X
         WJ4u94epq0f3Cb6j5xEcd06zBCrAESznfkdXCfUK+KhnTqEwccwWCvshnKuFMK1R7+Jh
         R4wFV0/4+RnQZFDCpwDEl/VkMK8rL4NueD1P4+AkOyX26Hjdh6jfYCmTJZBIzr3EnwZK
         xtqKAoJtSyoosWZtuwDppeMd9i06vMIlNS/ElRn07iqccVPx+O/7Wd/75R5uPGYfMtFa
         28yDluB8jmqE6UfF0Jg2Wb0GH+7HWrTG2oWUsjjJP1+W+41MtiiJIfDKCzLfMGZTfZHS
         jtsg==
X-Forwarded-Encrypted: i=1; AKwUvByHcDPli7+hCzKe+Kcfrr4zz8j0Q+Vpog4kYdYz4YfZ0zcr7ttVMM9O5wBlpZNs17cpL/ajh2ovLzGm@vger.kernel.org
X-Gm-Message-State: AFq9FYIYoNw9MMfUxbbA1IgA8LNqGJFdYYf7p20QDcadh320JE0ptZE8
	ZHBplghTDbetzU3Yef7u5RyQS0LoWN31/a0ogBrpmWHW3iUC7ZuLt3HOS33knpT2x9A=
X-Gm-Gg: AYBFou3kh/QumW3aF1x3zKVLoTo72MF022t+M/RtxIm2phMZJnpRghS47ZDKDsk6GeM
	3B+T6qi1zcIuFaUJ+rt+TX6Xzf01Mtb52BXjZE0kuLeLMzdEhKMDMkRJmUwKcwT3oHL3j4/3/m2
	nLAnhfDUumKND4Pisq7w2H1b6nabMjLuVe/pX0XB/y0pmJshfCW4Vm0oyCrOMn+kchTr66/cMxU
	l5eX+aw1dhlY6n7XZJLQ2qTf54CjrZ/Ro2LSN1Z9L3NLlEBulXD2WrbTcOp9m/LGjUu4+AtvMQ+
	lBdcy81YjK4rIG5lV9psq8zD2pTsirrMom8+GMeMM011QA7+1nww+j/CsRoqahpTDZnIKXAK6gc
	2JysUWGlgu0gS8Hjbc36HNmFlIV6k8K3Xyw6oFgjcwnARYajuIMxICTaNf/Krkf19C38dlcLwn+
	SkFCJCN/+c5iiW8gc//Bb/C37tpC74htCGuajWd8nEjv/UIugURZ/M21UF/xkeUFBlEudyZP7U4
	HbQnYMi8eKFzhoSqG5VPojp8S1d36Fnojm3ReDMdZAc7uwfZR3wYtg+I4ztdMrp4dQ9fIKPrJQc
	6IwsKbyveoTdAYPPP+bkHZ5ZROk4y0w036MmlWiunZMw43wOMQ==
X-Received: by 2002:a05:600c:a48:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4b22ec58f9emr16148545e9.10.1793626837704;
        Mon, 02 Nov 2026 05:40:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
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
In-Reply-To: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
Subject: Re: [PATCH 0/4] drm/panel: st7703: add support for DCLTek DT300248
Message-Id: <179362683669.3310106.16771881319791378859.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:36 +0100
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
X-Mailer: b4 0.15.2

Hi,

On Wed, 07 Oct 2026 16:18:55 -0400, Marc-Olivier Champagne wrote:
> This series adds support for the DCLTek DT300248 10.25-inch MIPI DSI
> panel based on the Sitronix ST7703 controller.
> 
> Patches 1 and 2 are necessary preparation: they make the driver send
> the init sequence from prepare() with the DSI host guaranteed up,
> since not all hosts accept commands once the video stream is running.
> These affect all panels using the driver.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] drm/panel: st7703: set prepare_prev_first
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/aa0f8d68fcef246d626a8edd8724e889a71c346e
[2/4] drm/panel: st7703: move init commands to prepare()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a8e72d97ce2e779a95e1d521553c9914791ae759
[3/4] dt-bindings: display: panel: add compatible for DCLTek 300248 10.25in panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0a16c2a62af399444849dfbf7c00980150371e43
[4/4] drm/panel: st7703: Add DCLTek 300248 10.25in display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8068c2f78f7233a0ab528e429a02fb73864f6423

-- 
Neil

