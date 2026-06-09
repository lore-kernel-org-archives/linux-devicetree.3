Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4530A4D2EC6
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 17:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026774; cv=none; b=DM/4r2DfCak52G5pc4xd29755v7YlDB9bXKGAZh83zTyOnUeu/ZdnOAEAjYUoFrRZITPxwhoMUiEuELXJQVYnIF/JZrsGv6qQZO0uDqNaoGVQU4RJGHAYmAVmsIRnEHDLVA6g8NWthQxdnEyTvuXsN7ffsZiRN8IVNGQLR6Vb98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026774; c=relaxed/simple;
	bh=RpRMvW5iYap9UdQ+48wHOpbTlFeKShOI8IiDuea9S2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WspTgEV+RuzcT3QgPIiMHRp5p2hpCldw14ugALs52KZuGBqeFV/9Qc7iCD+ibGZy0ELkOnmdCm7nW7OHOCjsd73prjo2Mma6Jvtrrgu9LA1tg22oWoJ4xiFWx8Rac7xFxZ8VR61IbRtqwWDJm+0tKNzJZFMbJL2w/vnSyP/6sCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMZwXyU6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMZwXyU6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so37524175e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026772; x=1781631572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=sMZwXyU6cB45yigqPfA1/O7Jt1M3cHgeh6SDT2jO+ogWZ7Z1Vlbm0d38O700hO010E
         Y+I6DQOiwZfphQIR3LlRF2l7eh0fTsf7aw62aDLC+UgIQzzLc/DBqoR7ew4gA2+r2OUn
         4RvtYEEr+04Plt4abqGlfcCTSHnB7AAbMJiKWznuSjybUbrMAypIhAJw3VmF/BCBh08e
         9iFzoxnmqN3DgYXBuzTNlmDzG3yEQMF0LEBrnFHbTjnxhOdFKNoR1ci7ypGd6dX7/tk3
         0fS2Nk9+LTxgacNnnW7L9s2MTTjklLNe3Kxp5GRayYq6eLfOE/4eth3a/WJxBpUuXmsN
         F8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026772; x=1781631572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=AlxWBS1FeDsRIPiC8do9+ZXNQ+VteSHtYRUELIfKwpDhW9mNTWKgzhEvXEc5uXvshk
         7kkV5LOIjx00NxSmpEg7BXi2kxSPfZFYsG9w7aIevauEqySKXESvvIxDwRBw2OsD2l7p
         lmOo+uj78gGe4+Xuz5e36o24++pLMfEW3SZ6Odw5/EH++3R1ohF0lin3moFel1SF5E0l
         4KZGSa0AbeVHP+OjkZ0ClwjNlGCy41O+g9rk+f9VK4OULypo+JexPFmG41pMOHmGR54Z
         JtPAAko0k9p3B4QDlA2ZKrn4JhJsRC9xgoKgIVL623t9yQAkDsklS+OPSyimTADQOBEd
         qrUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/e8REZ4MHE7SKKd92y0aNmlFr8Fo+p5cGrfjIILM7spdY0xg5SAONvtRdtGBQ8VCfc7exN8Dn7od9V@vger.kernel.org
X-Gm-Message-State: AOJu0Yylm1C3ww7DAt3URXB9zwKdF8OnTN67Aib/qANr3hR+caBm1XPr
	ZvZlbwuLH8WXE1zDzsjWftV8y/zh8LCiAph/xz7NWyFSWoFSdCyUsvwuvjQVoBHmQec=
X-Gm-Gg: Acq92OGnp3DFD2xDJC5B+yz0mXNFitL37pMmsATAMXeax0Zi3Rm7eszWtw7C4/+Jei5
	oHO5aDdgEIa5ZgN4UmGMEIpd2eZXZR3EqJP3m9RR4Et28yx9XAfflSsxmVGOP5+1wHqBL4ltQWH
	d2GdaLtddxf9vXF597zJgF05DQSoz0FtIoS4+9zzDIX6iwhLcroDgVFTlsyVTZ+vqFr7bDDgUpE
	JgFwWPNbjaXK4bnFAJ0j3QuS/ylnoHO1GUjz9Ws3ki5yvSvEffW7bOZU6T1KgTJ0bHeikC9L4tP
	LNWIY2XYuHezFHmjYUc290ndE6eZ+GnjWwyajvSlXO9gVFjX9ay7MHJHpuHYis8IOnSX0bfAbiq
	IdDdnhE8iMALsDj8qpdZyLHUcldrS6aUiOWk4NGpFRUB8YD5+j3VaD/sPalMmnyaRZYFnRTaEjY
	Jo3mN+FJzXgz1IN1deMsqTT84iXgkp5vHFVw9IZLZHzWbzAeK2+FBA/TwmnLJE0D9OV9m1C1YeJ
	cyRUFGp2bv6kYTlxSvSkx/2nbc=
X-Received: by 2002:a05:600c:1396:b0:490:d946:47cf with SMTP id 5b1f17b1804b1-490d94647e9mr41460835e9.4.1781026771736;
        Tue, 09 Jun 2026 10:39:31 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:23 +0100
Subject: [PATCH v5 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-1-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
index 86ca9297edab..498ca30a00c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10952,7 +10952,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -23652,6 +23651,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0

