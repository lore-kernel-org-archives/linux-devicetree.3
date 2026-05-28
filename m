Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA113E51C2
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779968187; cv=none; b=BvtqQARNMPXq6NTwziWATfjscDVLWxSNm3wX3Fe20H/lpoVq6mNsydE46eTLWA/GVED2EtRq4M+EBDSLtJYiCiZj7zabHtuKPdVJpIEEEMnfS+ssFtvd7cUQ0TU65IC7QiY+HwuzEnwFizERfHxDfgx3ggxAho3d4ueLufXPM0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779968187; c=relaxed/simple;
	bh=xJKlJC7dGl0wGAvaj+do2NaPXo539auehvyu06PLQZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SOwZOi9/QipFg0yg7dS0g8OpIeoqcFecze9CSLgIgDK2eu+/iYio8gTgM8E6exkFcCPXuShE9f02qQUXmUBpaOrwR6Bv/Ll8g7D0ddfZse9EGfEmnNP5nHDLrgCLi+hY+Zl0abcduqbvb0+ClwS71ZL1zXAoVMp/LtPN6H0NcO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6WaRSKR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6WaRSKR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48fde648a71so84392975e9.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779968182; x=1780572982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BekxfQF8PLQVYHupI67TdA6JhqhQbbku1rpfflIBCq0=;
        b=X6WaRSKRsbGXDV8YF7KPF4mNShE1bdhYsuKSHf+d6GZZvfds8tC2lWHX3FfjtEcctH
         nTYNwDd+5atzb7ffM/+PScAT2V+0o/bJBmUrcaW7iHdTAZl+hnALWlm6zBNP35TM7XtW
         NoiZBGhISuBGUgLsiN2tdkp3LuopcMvPqWSW4PiAmelR/vzCr/gFFNYMzIjDCK1WvewB
         LVMRLFpoGDIer3sRvLohHUMiv+Mv9wYFP7WS8Zqvzx+APnBxLPdHebFQenRxSONJQREl
         yVvh+stSRD14nCfDSh0gTR9vJxx1IsBbtXHZ2u1S/4TLoM8VV3fk6xRUCrNPo++xMUSe
         ek4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968182; x=1780572982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BekxfQF8PLQVYHupI67TdA6JhqhQbbku1rpfflIBCq0=;
        b=ootbfsdJm8t7atl0BZALfAjcHiEpAtQD6R7zE+o68O/jrWJ7Mfcuc97b6hOctafNvR
         GcDGJRPUZ6LsorNZygbWkewmQferfXj5DGJiEGVkXFX9eoEtRlaMoGM81BdrSKeyiP7Z
         TOdjzFMef0z/CvBdYG2XESjW3RrZ7Guw982VNb/VRitgB3Keufxh1pWxBinCTFmYOl8/
         JBFLUjJ9xOxE3cV4NbtW2lXD4V1ugulDRjwYt942wwBpz3W7AyDulKs20D8WQByaMYdP
         8MBzIIVxXJP2Mc92hOoYyOLFWij9jTzanapWJSibitf4VSo6/2rErJ4RWGTNpmV2cquP
         OHJg==
X-Forwarded-Encrypted: i=1; AFNElJ/TraMx8n2ggut7Z5ARlYy7nqORgFWx8hokb//O9Sri9HS9buYfkzFWGzoN5ScwQ3xoOIdxhivCwIt2@vger.kernel.org
X-Gm-Message-State: AOJu0YzP17hZGu6fxUtDtNvHhztRMK5sEUL4Un0bk9DeqbrmpF/4P1ww
	ZslXFfApvc7w2JgqnBqnwwewhp70rSGM6IY93RzRu3wzgSGqjMrl0VHu30K5iAW44xc=
X-Gm-Gg: Acq92OHfo6jx5V6/9GF7mFXS+ymzsYrLs7aCUs4mh7M62wECskYsNTCqi/n1/YzFZlb
	1lz6n5ZS/MRVF4OtB6MAxbgU7pgIDa07MPWksg7V1OX6zd8vE1eNS6W257KC0yfACUwmwwtQJRW
	2k2+s+1b/HMV/rMU2aB2y51aRWekU9ULTRMIr+FKPETBV7iYTdvYC7jwqnY/3xWWlLb6jwURF/E
	ecdMoYI+xtow6peShJ0D6O38Qle0UgIluhpp1bP9a4D6yRBBG5mlKtSc6aNVyAe8lDbavL0jlTx
	SjfwsTXcqNIZ4+VEo7yWxCAn9rk1i3CdmHKOUjeDxHunfqvgYNlUpAvmJJh0eN4lklpP6Q3xMxt
	h+64KY2WI+JBulUTYyTba8NxJIJyYVrWW1DxIZ+tZq8tCFFSWORbYrVn++3kzbTUIxtkh2zp1kn
	o1uiMJOm6zM4npXVJShJrCCxBm3kG4RPYqWo3OLEzX+ePXrwzOVylbZ/H+AK/hgJ/cn2OqzGN19
	w14AGfvmRjOna5EHQ==
X-Received: by 2002:a05:600c:3ba5:b0:490:8b0b:d3b1 with SMTP id 5b1f17b1804b1-490947b0929mr17354425e9.12.1779968182422;
        Thu, 28 May 2026 04:36:22 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm60385715e9.12.2026.05.28.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:36:22 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 28 May 2026 11:36:16 +0000
Subject: [PATCH v6 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-acpm-tmu-v6-3-b4d7ce57594b@linaro.org>
References: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
In-Reply-To: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779968180; l=988;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=xJKlJC7dGl0wGAvaj+do2NaPXo539auehvyu06PLQZg=;
 b=/RrV08zJwcGs+ddtnbcR46GfaRC7OfWZyTRmTT0RYZwhRTifb8P4BFHNCQhv5h1Ki92YZBkoZ
 NPR7YdMiLPgBcKDzpqdf42dJ2N6zsZtFSV6gfm3ESwzL0rOq/+LKlIW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..7ea3b9d95ccd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23660,6 +23660,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0.794.g4f17f83d09-goog

