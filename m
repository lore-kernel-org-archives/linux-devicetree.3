Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932A3410D2F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675840; cv=none; b=FPWTAwPz/UrCJ4/qse+rweQlSYnYVARHt8W7CUx0SZp7YbQOQJuTFLFcyk/DHIKIrD7Tcgh4UmIkS8az2k0PRx+ho3pyHlFSvbpEiXa+S2Kz5ODYtgM67HhxrAXT2VbSpB2gGkAMbp5dmYpI5x9OHDLYPHvst1887cYVBXV59Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675840; c=relaxed/simple;
	bh=RpRMvW5iYap9UdQ+48wHOpbTlFeKShOI8IiDuea9S2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGGnFThQk6z0f4x+suJkE+o+eBHvTHy7QO0eSpObvDk/79jbGHY+PPCgR2ZxYxwyH0he/W5lyfx13TaQZZVtufkBcdPd3ShLLAVo7qUo9NupJTdH81j3p7jtzvSQ6pBUMYtUGmd0KLryezX0uUs2NNvugCwHscYGAtTEbwyB53s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bM3+w4oq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bM3+w4oq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fe608cb92so4256652f8f.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675837; x=1779280637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=bM3+w4oq+2ThTtN8g3SNT31ew8s/dmrwAoHtVvaarezk8/K8HSHIlMSgiEkEyaBm8K
         WVkdjVSTFuEk1AJXXDfDJfiG2ECGgiU3GgzR8FvSTTKw0l32+WURhEZkGgtveylGfB/n
         d9Xv3HgWrVB4aYO1GJ7DCV1DW48rFtUeg0dFZZDxutEzeG4g9e0kek0c1BWlbq169UKP
         4VJqK0kH1qhwedwSjeheTeHvd4dFIJgS2Olv9OAPqK2KTpYqAplfJ/Z0bLRKDp/7OeCe
         k0NoOV8G+/8tPue12upxYsmJQ1NG/5hIB0eKq7YEwe/C0kVXQic+41s2hJ2spDVbf7kM
         9BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675837; x=1779280637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=F4fwNFLCQ3DOkuej9qjQ512JBLqTDgWmQbeX0YuKLWQJ2GZnf20vU2V60N3EbPlVnt
         z3Ok3AwJ+i5zhSNlZux5shgWFP/15yamzyIyAU/QQtIekIih0BKKK1BRp4QKq67oxLvK
         VXefpdI5IBlLIJj9+n7VIrlij+Bvjq5whmge5MIzPpy7BLwJUVsBM2jKZ0gEDSq3CrRi
         m3KvOCxwAWYT1aCATsQpsRPM+RhbsdXVO4rrmhLJj/TBF9bh0WG7LKHB1NFW6OfoaRm9
         cPyiryPPLSJXtok/86UZH77DMXwrCB+m0EDD4SH5wWex3iEldhZ9lFbfKqphjajDV8ww
         zpJw==
X-Forwarded-Encrypted: i=1; AFNElJ/JbmM0FmGZn92QOTLDFpqKBaN+A1bKiXQuYAZZujmYK4VY0Rliylnl0aeyAKhthHleZDsVZG6v9uDW@vger.kernel.org
X-Gm-Message-State: AOJu0YzATpAo3W/D7z+EGKu79GD9NMO1coq0SHtVARgG4DgqrfWwT/Nv
	3doJPBMVC2alaobSj3jU56W9T2GX7VJBEAvhAiJO3nywLIeyzjySFEQrCB0i4VUpuOk=
X-Gm-Gg: Acq92OFdgz+08iOalQ8tA7fk1i5nZ3gRoMnA/HMGoQo4Cwvo9RBdi6JH3thRQhFiaQA
	Zg7sLwUTkcQXlLrPoSQjCLmPh2pUKqzybeAlnlLACNqKIXsbjCjkAwQ4XA1X8r+xmUj2yjpCBTI
	noz4W3q17vHCjDDsU7v5+kEBLrt4Nxm7qBD+Vpg1Cfa78oO2mzWN0Fazy7zQGcmQGzXM0/ssXpc
	mUDBZBBdfKeT+OxmdNxRGhAETtYqQHDSiioG+DVbF5yAxIkqLnFaL1yjI6BXgmp2842b5N+4KVq
	QoUiSD/G6WtK5oHYtkgjkZyuJX8LSDY3sLpBrLIMJx20frtNq2vXyrWougXjNGO75hWTuzihFE+
	283GORsGM8Y12SN7kAS00LP1Q0ndAMFlSvc/V3tct0XfGK9k3EgT1MeQk2cW9l9DiUyvyOQDOD5
	dj7LyhU+aaCEgNvgjBORj2IhdbjPVpjKuf6+skgXP2SMTA/ehAKX6NvScGPcEYdmK8wpcM2OOVD
	/nI22j7GYf23Q+K
X-Received: by 2002:a5d:5f82:0:b0:449:4079:4c39 with SMTP id ffacd0b85a97d-45c5a1a791bmr4966657f8f.29.1778675837045;
        Wed, 13 May 2026 05:37:17 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:16 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:13 +0100
Subject: [PATCH v4 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-1-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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

