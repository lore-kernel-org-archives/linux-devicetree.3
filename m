Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4447B37FF58
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 04:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019121; cv=none; b=jDcGOqUuF2EsSTTusHVs4JZVSAEj/tlQFQlJ1IwNdS9x4n3RWFDRNB43Si15B51ZmxP0Qcx3FjLSrXtIXnJ3IqXfcJ5RYOaYPgQb2QurwakEn9e88CM6ja7iv4+6pIkfAVNH40fKb9QORJLn7cRTKsRqhF90yCBw6SSF1IhF6yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019121; c=relaxed/simple;
	bh=KI8zS0eSrNW0sDC1Q5BeDySFx6bb4+/qC2XzzBPNrd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKEmkombz2buiNmqCzCJQP/etSakDLP5r6ZIb0Oub6aut548hSbaYfdniuAO7DZC8763SzBf5cxjWcUPFF0XgBWmnxjCQRm6watULhBWdqCvnPTPrw04La2EwthPMw8XnGC9mxCayONmGUwJtrUvyI8wrMsHyvJ8gZIX28c6RdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=klbEgAJH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="klbEgAJH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so1947509f8f.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 21:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019118; x=1775623918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=;
        b=klbEgAJH4UtbMrQ3TphNJEGVXnMY2iooyXj71WyZqsQTx0Z/ajbZa72S+goIpud3kc
         eSs/FdWUp8DbsmjDkB20N4T3dCgOObtXKPRNsccSrN5B6/GsBRnINiBeYZA1peCWni5/
         4G0RkdMw8FbBETvJ60z7anj47aOD8hEwY164wqVQnwtjkxfGj9k4Gu5sX0Lk0etFwZCa
         o+A0t8UrrGtt1s9v6HPVfZx5iGLpSgdGcWSJZRGmfmBSyk+2PDx1wzXC4KuvJRvSsGut
         sKF7FrRxftWpJYvSP/adDQsakC/zc0w0hBAS+SOSXeFj5AflykhL9LS+elwBG9p46kJ+
         s/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019118; x=1775623918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=;
        b=Te8/gdkWHAL8ehTvYn96gSjxhRULNcKuhSHSIRR7VhmZ0lOiVEMp0LLRczbpibS8lL
         Mw+9aElppAvMicF67xlp9VXrEH2DcVnQPqPGQTKXP3hJJBHz80wUvCroppiWqJ6xad16
         /y2KrGSJsVyNUaEetTAqsO5HnP+fqz0dxV6pSWttYMRdHpRqUnPAMpnhH4ljCGevEkof
         EpSwUBCFTN7A6AQU5GIGnM93AR9opfy7Q5Lyg5ZosGZ+sfFmrDJyetlsJ/NTsd0JMIOY
         scK2ylOw1rBPVDs1+iXP9xzBiS1r6vBU4cU3S/7MfecU4Y+O4rg6Eci50v4HwHu5+2+4
         2Q4g==
X-Forwarded-Encrypted: i=1; AJvYcCURRtP1G2S89R8yOSAfoMjjvh2qkl7hl0MvimrqNebCPA0ukzZas8d1Xfzp2ZbeCB7GhH0vzTotydYl@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJpKokpvQtPWBS5NzpJHQZ8X+UZq6jKNDgxi1CyboFrLwf7ip
	D+Oz7lolphhLCJWkyH55wJZphgKKMQtkwLfJhUtI4m0fzqGW92ghaGPY2HYy4wyDofA=
X-Gm-Gg: ATEYQzxPcfrN1PkVLMf6+vMI0sfNOoiPuXpiJ6MMEL3n3karbr0FYf7jY69/8zMS0dz
	WFfvPsrodLFFng+E6IkvDlmuvKNMWiG6wESb+CY0fwfLoVH5e7zYABYf/CnjmTUVeuFmLkuF8eJ
	vMeo3I8nyxDhWJN1oXiqCf8xok60s5ULLfjVG04AeRWbWWn3eh2uksp1ybEAaYirYwVXjDVP4AK
	140K6ygH3n5OgGweh7+vpUmpSvd664p70xFr/1kfKVcuFq/4mvxiqCHviIct3ybe0ihVvqWn9jb
	he+1kK5xXZh82U2Jd/heYGItVLNnOHh+ey5EaGpm8rF54lbmmGdGWZ7rp8Ksg+0g8qaZ/hpa8yq
	y1WPAOo5/TjK24tyrYE4sB2o5g2qoY1DdNKECBq+XA+Hg/fGUuPnZmKvYlmU4G4s9af5R093nTv
	dt6rFP2UFSJ7fxUAqhjRVSiaGgwLzQKwmzsry+m+fN8xtygdSJLs3tBR6LPfgB1a13tayTuUPoE
	FqJEw3id+SDZIa2aGzfcfkVf4Y=
X-Received: by 2002:a05:6000:2384:b0:43c:ff58:35d2 with SMTP id ffacd0b85a97d-43d15047d3bmr3946162f8f.2.1775019118574;
        Tue, 31 Mar 2026 21:51:58 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:51:58 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:55 +0100
Subject: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
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

Some Exynos-based SoCs, for instance Exynos850, require access
to the pmu interrupt generation register region which is exposed
as a syscon. Update the exynos-pmu bindings documentation to
reflect this.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..92acdfd5d44e 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -110,6 +110,11 @@ properties:
     description:
       Node for reboot method
 
+  samsung,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
   google,pmu-intr-gen-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -189,6 +194,19 @@ allOf:
       properties:
         google,pmu-intr-gen-syscon: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-pmu
+    then:
+      required:
+        - samsung,pmu-intr-gen-syscon
+    else:
+      properties:
+        samsung,pmu-intr-gen-syscon: false
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.51.0

