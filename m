Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084AC363094
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 04:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019121; cv=none; b=mB0aVtBajd0aV/VUsuBQ5X0Nx6rB72x8MaDgHe04F6qBqiVk0wkSGb8FLoofdSdnsm3qtgfyV1W8lx+M86aoZb7yzmyxZ++KldIvzVm37vnYEmOUgED4+hT0vkz1scE/xGt0YL4tQIrTNhDKHhKvyTuWkHGjbpYqnPwnoOSwiZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019121; c=relaxed/simple;
	bh=9fWvu2AgU7IBwmaoYqowNInEO+gM8FjMCr/yz2qlfGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tCgje6hXyiFxKYYSq1SuEaUtGcE8gpPKLgLsY4C9KJCRy3Q2udPCbBMbZJ5sDVIZpMiFk/mbw4+AvpULz4LhhA18Zf9bW3/Ji6+jxoYHPqztdSzxAVBTOMYkJnvRcpTQiiLAM+LttYW3M942CGL1jvaeOCKawEE9orXUyqJh76U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zIhY21Kd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zIhY21Kd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486507134e4so72354435e9.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 21:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019117; x=1775623917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4XnAKFPVmyYTHO+P1XBUrrMd2S0zggRsNHe39W700w=;
        b=zIhY21Kdm9KmKoYpve+Kk8T8Je7htt28EomsiJlkpFwQ5LAVg89X5bZ2s4QsA2p0wK
         wqeKmF2wKg56IK2cp2kwbx9Gi1iSKmDKQMsAi/orj3FSaSsJP1PztFerYHZj0+c0XSvP
         maYV/n87lxznZRrTINDPs3pt7lY51b995dgU6D4YhcM2kDHYafUjCqOIx74oRPq7roHt
         TFPVP0YAvnngPEhM9kuaI6R8sRC/O0uojILRbIkHPHtNYt8NzsC4LiKVVrE11B+vuw6M
         ns8UaJt389QpHJHUIgfsGot3jBxuuzRWcKNl4ikCg4unQa5P6RjvvXjl+kRGaJ2e4sN1
         ypUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019117; x=1775623917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U4XnAKFPVmyYTHO+P1XBUrrMd2S0zggRsNHe39W700w=;
        b=bwz0gkgetUVyfGkUixW4FI4Y7d5mTj6fTjwyriSmaZemYRUJx6mtVUH4hORgoo9b0a
         NUwxE+GL0i4JSLJomwcS1rtz7STjk7d7Z06xPLFJ0DDSa/XJxG3onxNfAQhCVS0YVV8B
         vAjCzt2UW9DOFFDUimn5y8zM2uWF7SvNQOhfnT+LDKt/D6v6KurriNvcl5NfSDb7O1Dz
         w/nG2Jhc7R8Wa1lfTszfo1lnxzSDGdxRP5TOV6hDAC+EFoPzLdDDduIV9Ma+CwuX5F+D
         E+cDo4nVUlGHrGqZA6PncpLsJtI+/X8thLCxTuPqErSCUAs7/hOQj1WkmT5Rtxba+NJ/
         EeVg==
X-Forwarded-Encrypted: i=1; AJvYcCWD15e5MnEuk3SJquZb9s4R4gRXNrR+nCWIclxB+fU5ZD09/0+Rof1kNqasvc+41+vOGi7Q3Yxb4uDy@vger.kernel.org
X-Gm-Message-State: AOJu0YzYa55Sqykei+VdY48t7N36uYjvtsn8q9HFgmvrVBvzvW+hCEH0
	dLskwU/jh+RB28c0zoBbn8PdYGLHW0axp7LkzqxwEh7B7R2kMNDNOw2JNLjL4nt2MYc=
X-Gm-Gg: ATEYQzzQEHLwURvhVN3MYAdSiQcnB2tRDMgV9cyO5ANGFTeFZldAd0ZZ2Bi+DfbKTD9
	04/RKfU6qhLOe5SGk5kTNaP7yb+qO+WepBpXRcgf6NaBYh18O1LnpQC0rnZwRHTk8Tug5dIVW1X
	xaKMxr9bfzlCgaOe23kR4rjaoKdpmJ/NvDposz8I94OLr1bjMqd8k83Ff8DhWgc/zRruaLQDYew
	GeKAY9ecKcXr01qm0YosvaSUT27SLjRvCp8GUW9Gsu2jDRgB5ZmB/d4hedaT4qcNgcO4eDHib6s
	7SsSXbg3Zru9wOkfDABxa6DS6JFhS83mTCg7LEfZGSpsji1DsDAzZ57b65p5sCWwdthkkhPqN4f
	QywAxyNpbIZ+3zocs8sMvaVg3q7ydhsKoOfhRrQpBURsOJeSV9dHA2MLy4ZoCcdbdlaZ/5vRHj6
	D3yYpA6Axm4aVEddVwc77NJmIKVbpHfgIYjMNoD15wKltyPSi/B8QMkdynpzdRbBY8q2nVxsUJC
	2vHOsPYWRW6oqbC
X-Received: by 2002:a05:600c:c04a:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488835b2f54mr22338195e9.20.1775019117430;
        Tue, 31 Mar 2026 21:51:57 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:51:56 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:54 +0100
Subject: [PATCH v2 1/7] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-1-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

The PMU interrupt generation block introduced for the Google GS101 is
actually a standard Samsung Exynos IP block found in older SoCs, such
as the Exynos850, and is not exclusive to Google SoCs. To accurately
reflect its origin, move the schema file to under soc/samsung/
directory and rename it.
Concurrently, add the new "samsung,exynos850-pmu-intr-gen" compatible
string to the bindings. Support for this block is required to enable
power management features like CPU hotplug and idle states on Exynos850
platforms.
Also, move this file under Exynos850 SoC in MAINTAINERS entry.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../samsung,exynos850-pmu-intr-gen.yaml}                          | 8 +++++---
 MAINTAINERS                                                       | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
similarity index 70%
rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index 2be022ca6a7d..df23467d0e0e 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Power Management Unit (PMU) Interrupt Generation
+title: Samsung Power Management Unit (PMU) Interrupt Generation
 
 description: |
   PMU interrupt generator for handshaking between PMU through interrupts.
@@ -15,7 +15,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: google,gs101-pmu-intr-gen
+      - enum:
+          - google,gs101-pmu-intr-gen
+          - samsung,exynos850-pmu-intr-gen
       - const: syscon
 
   reg:
diff --git a/MAINTAINERS b/MAINTAINERS
index ff935e197c21..e14e6f874e05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10947,7 +10947,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -23606,6 +23605,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0

