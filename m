Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F737F75D
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957793; cv=none; b=kRuNuZ/eUVoG4Npv2Jl78lPQL+HRHfwBQYKKifL6YUvKxu+gU8rY+8YwY8N0KeExYStFB/3uAaYy9ITnMzjQqCx0V1+8CDXNLVGgdgwLvO5jaSstfBR4AwgbONqsvDNImj+7nVQKZaxf6Z0UDy3VKQwTSRJud2opLIp/RdPvluw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957793; c=relaxed/simple;
	bh=7AhKBHwg3sF5ZQfICMhVBtTO5MM//2w9hYFIb8IP1yU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icAzor0+bVfIaoqMZC78tLoq/tRCHRQbsTKzfEHhG1CPXo1C8Zbp+GKSIoJ8g/M69kwVazRYW/Eu3bX/2adIkhit1clxYCDs7OuXka17mu0ml8NqBZT+gi6no5dF8c1NVueA4D6iRS695vZDu7dy8LoABfBMxRrM3oPLVosKO8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlF05pQf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlF05pQf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso70864645e9.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957787; x=1777562587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45rJAXYOq5QzWK7uWpAJrY/aJNT+spUoA8Oj8mxs4Uw=;
        b=NlF05pQfvz30iToZPuVXHWFBWmVK7cb2B/KJwOeVySZZIS2ikJt/BRj8IKg6pIxHv8
         cobX1fG5uyLrMm+Vdqy968vKWoEUqRGfqtY5KtwKujTgl1/4Kn05ZwVaXVqelo9b2zCO
         97Dkd9+Vgbm0cjBed31iAYcU+snjv+sEABYNWuOp5DY1t9uITqW8zwMrXyyKoRNu3Y7t
         3SLzLsp2ocgYTz+XykRUIKZIWoslHdaTb7hfDjVTguhqM0RVjMLD2Hj1q2Y3BHcfZxZC
         /LSbphCxg2KsVqMkY5j9Y2SFMjLzGfv3KpB0or7azjs+kiZMhNUkgCi6CsE+zW1y66Gj
         9yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957787; x=1777562587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=45rJAXYOq5QzWK7uWpAJrY/aJNT+spUoA8Oj8mxs4Uw=;
        b=LAAzhPr8KogqykDXLU/w5scQ3DUyOnXruPC+fSWh09pxBh/8o+mdkr1IYADYvnJNGC
         Q141j8DRFaD+qkZxfIwBPuLDPNBKDp/FI29bvFx4urP4WdKcChFt0+r+x6CBKjdI1BOd
         Vk05N4szj8JGvNDIO5i+IxV+psUYp0J6+bpWNG/d0SOzHlUUTKjP4N+7BxClE2q78jmT
         VtRrdlTOu/8kaqkTWuRA2VMq25YVrBbu/5P+WPkUYCbIiEXMx3Zdpm6OAPiSY5Ak2I1x
         2tOrGfRaw9tIwTICwePHtaoLUkGqdl76DqAJJW6MIgQxHtTTgD+yAiuJwwnwjbTAKf+n
         gxIA==
X-Forwarded-Encrypted: i=1; AFNElJ+nBg5N+jTwCTAjYFLtFP82kbqPN7hLgRnD0haqqalk4PKjM5J1E2YE5/S1+E/vSM0MXv9X8YQajw8F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4UqZRtIjiRD5aHG6lEl6BfT6rZSotm0X8vualxr/zL7BZQoob
	Rw43IYYt5xM1x+3kL+NBbUtpN+vRDvNqI1c/QikkwEx2o7m0/NjqFFIrKshznR26Xlk=
X-Gm-Gg: AeBDievcYlETG718eCylmx/jwM28YgEQ3ztVEpHJHEli9cWw1UUoId7fnXeQI/rvz1w
	+5PiDg2ya0fNAyzF4dqo8WeJgP2bB589E8wAu8ISZVKMG32inXKWG7nk64o1Tg37j3LRm/M6x59
	GhRylPv767GQoCrMuRp/A6vFkEP8LL5EAX0gSIwty1B2tZ+bgZ4TUhm5d+wjjlL0A7Tcu+Nnu7D
	XqIqFJ46SZ4RVqFVhFoihQgP3FhAI/ekHMDb1eHWTQZb2d7iGgdkYgnH2Zg4PJ/FyD5Ki3a9q67
	Ho+tr0osCE5diKPFU+Xup8c9h2H+Ovow6kAhb0nJSWtQFxk69b3DyoPCB9hri/r797GIXnmnJlK
	bxp3ndZRy/PymJWIGwXqEk1oMMCt065qXiZzLsz1M0MSkoAemMKz6oHBl0W5rI8O3dRGuOaimTH
	ZoHoweZbTUGIk7l7UUkeImrK6GyhIrULv1bI3ICjQFXRxgBCOHOQ9bn1H7tnB8H4kSWFBp/8rQQ
	E2ppL2nOQ0hAVNSaA==
X-Received: by 2002:a05:600c:8a08:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488ff369a1cmr299536255e9.30.1776957786885;
        Thu, 23 Apr 2026 08:23:06 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:06 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:59 +0000
Subject: [PATCH v4 11/11] arm64: defconfig: enable Exynos ACPM thermal
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-11-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=812;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7AhKBHwg3sF5ZQfICMhVBtTO5MM//2w9hYFIb8IP1yU=;
 b=5VX9qU+w1MAGCTcm/KONCzXTpE/zawPv8s4NGdTf7+yTo8O2OSQ5R1ITDc/bhnFX4LjS7V1lm
 qjj5hM1FeU8CPP2c5DU5SvgZzv7wBhNlnAt3R1NZBOCz6liqK8uA6Jp
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..3fe76a4c2633 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.54.0.545.g6539524ca2-goog

