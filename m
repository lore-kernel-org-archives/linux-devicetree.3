Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D14C282F29
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514218; cv=none; b=IAnTJlNbKMiLrwUIbnNs2KvQ/9FOSaIfYa1Lj2Wj7awMe/ofSDZnFT3vQ7wrwFEq3gCGlwJ2mjExZ6RXuCqvfWYjYtGqb/KgDqSpB1x9EXiOVo+zrOTupGXQQqESBOJRQXCee0Ky5KCWhVXaF+z+yNJ+cnC4ghL69PJv7OgInfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514218; c=relaxed/simple;
	bh=RpRMvW5iYap9UdQ+48wHOpbTlFeKShOI8IiDuea9S2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2mSgf2LemoYWWj5rxkq8yMzSc+/Zus4cRo3wHn60TH6Jh8vcNx8XCMcMHcHbc7TLzCO1jxnKFXGsdQCAQzRpBbKrqdTBeQPRFys20QSaPS3KI6nfPiSNPDEgHiGs9biCIhTn7eh7EWZxvP1JE8IAsthrMBYECor9AY3yIlfaT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uB+BXcq8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uB+BXcq8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so3320595e9.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 18:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514215; x=1778119015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=uB+BXcq8p8Qm/bXIfjhHZRWsqmiNIYi+8L40zQWY7JzWRDZ/w0rw264ZxKIyi8X8lI
         IfqY4NvTvWR5oM5ZBmBG+GllUSCXurQSapHmBzzkkJO1uacdcwnXFu2mMJAFt8Yyzq0O
         W6fCLKv3gMGpYLEDocupHM+/I/SpzrrkN4G3AoI78BiiztLr2gnUK1f2tQYJ+F8VzGfA
         qQsySQ8BYrC2zfaaN7SkcV8HzeHkoCZBMBtuzrmxDmyrbeMIM9bfgWi+eTDUAr/tALmJ
         lcioKRmcGYbp54yh3stUm3CnYEN5atpIgLaE9Ej3ZqEqK53835lSn6rLClkhzElcN41W
         P0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514215; x=1778119015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=odmjFoEDlCC6QZSIG/z7cZJnzKkCgik1/9S8e1la3EcZgDkajdNo5K0quUFvvK6fsX
         n6O9ieZgrtOLkr4R0U9/U3hHtW7Se2cLbB1HTzCotPwTtQ0FfGSc4LnBBjWmveORSqjh
         Bm3YomnYFLO0HZSeLQKcTAlb0ga/0bhBU/s+5q+lXooRI1aDW/wrdUYFBw/x2VuXVy7M
         r6L4hd8XoIlCz8NPeTeiYCiNZX9NxvNmJUxTyxQyntiub/1OQc+JAqXqVCR072J03IgV
         h2DJJb5H0+xAt/lCy9UMAO+VvmgdwIw10U0SbAglzO7hvA4AgPqOrJC6bGnWPzGinbAc
         QOCg==
X-Forwarded-Encrypted: i=1; AFNElJ9gNJ9ijJfznZUbAPBS+7pTTHsQX+RsUUlWoxuiCZ9JQTjkHNRcqhqExWcu1fKXvBfmXr1xfKcEp5Hm@vger.kernel.org
X-Gm-Message-State: AOJu0YyqoDBcp1KuaoTgtCIl8zjLjLoyF1DlhttGQnzUdl7dus/2Q0CO
	QoDNQi8P5KDyEMgXIM1RSJjHP5jEnZKw7RA0VQYoD9rrg+xX/7KWQ32h60qH4qPzD2E=
X-Gm-Gg: AeBDieuIERRupkse+vuOkFbqHKnike8pQ4ArVULpNIY2olyabHGIyH1wZsq+p6Pu3Xb
	dTDK9Ns1SBiQCsYNhvWiFGs0GBgehUC8u9OKb3hzJi/HWRaMZipKgNRuw0KBhUILAy6QzTtGhS3
	Uo5efISObfUf2jOj9QKbh7khEiu4gLXUL3U2RnHhF4VD7qMnCqxatlASdT9e5Zm7BgwjC5b2EKU
	bBb8Kv5P1OX+KIOjEHzkmw1aVDrXf4eqQDjrseBgyTOwzs61BV4b2DOAcP06jzXZgQGexhuic11
	eXQSHX35eVABKpuCoQdKT0IYaMFwuWUWtLIjcAIB+7n0A+q9NW5Xw5DD668Ifvssp4QAYDTcEZb
	lY2ExttjsbTmXdiain2ty3ydoIJe6KvYiTi8I9cDlxg2xpkJKPl3efDSppotEKDKSrgMYBMCdpG
	TuhUQzcVjUub+UbcDSA9tuqPgbe08OVnqA+9CA7WvSp011LtdaxDrvttFk4W/IWw28TsX9d0oWw
	OLZx2JBOnFxfkr6mzF3Rr6XTEk=
X-Received: by 2002:a05:600c:1e0f:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48a83d0222emr16301435e9.0.1777514215291;
        Wed, 29 Apr 2026 18:56:55 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:56:54 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:51 +0100
Subject: [PATCH v3 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-1-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
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

