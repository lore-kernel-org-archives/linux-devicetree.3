Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D4D15665C
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727193; cv=none; b=DXA0OmcsRpSB5CnZ2ZTxf1VN7r2F49S5CFIReWzWcermObFheqq5CxCAAbxqOuvMLmYvvbGR8RYrIISbmGd/WIicYcfCw6zXdpq8kRPrvYfq4UHGgFjlJN+GMtbDi8PvFO3cEkKEVVyurSchfaftbqG+VaN5RSa4ogs/imnGGf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727193; c=relaxed/simple;
	bh=b7z5f+aN9HjkLJpPXtPz+6mzoIt/UlKHgKR75iFSd0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kg4Z7xuxw7Z3An86udSvh8opFgab4cwmZoSETHMJKFz4Nn0lip/2xa7gbgUH3OGKSVg6k/jt2y9ZIu0X7olwDJIytwe72YpTi+Rn8LLMouOxygbZ9Hbil8Jm7qht9K1SyojAg5k37wuhz8KaWa7HA2OkyzLsemKHTAA46vD4ryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sIdY86kX; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sIdY86kX"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so2859775f8f.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 17:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727190; x=1791331990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8zcsJ6JNS6L3slLlgYZ7yiqUfkHSeYZphHvsSL8bbk=;
        b=sIdY86kXVvdxyFSEF0nH+iwd2qZ3xxMJfoS8sTvfj5etDiJcaTq6jbUifoxyn1/BBv
         zkUdHNNmMEgqvK6yUxj7bFPqVHL6M8hjWU/3IyRGnMFfpIA8hooBQAMhZHeL0OUnYMy/
         tVzvLZNvDTKh4DIpjvU8DRGR4dq6NhZfZdvrJ+Qan2Sv6GZWr9VNOYtntLw4PZ1HlW6k
         IJ4YVPP9C9FZ7ph/eGq8g6V5WCR0euG96Df5vNmF+0TDLQFfvizYZAfNmLsJyvWi5P0I
         sWrKVwbRu96eijYj5aJGX55ZfUAm51cBW1u98sCM8cL9HP1eTGYXIg7goSfudzgASyAu
         ZGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727190; x=1791331990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8zcsJ6JNS6L3slLlgYZ7yiqUfkHSeYZphHvsSL8bbk=;
        b=PYifVIPgOrVaaY3Ua+oMVq2Rw+ZpEQNnbYJiciu18smeQcnLldqmGshPtFWOFjvP6Y
         xwe7mRTkPcT+4VxuSo2Te5bdK9MZGBcVSauPPGL45f8wdgI4y7pG/oFDdltHq6Zm3LWM
         ZX/i2QcEf3mWzcReLBgF4mBA1IIAUK8MRXU/0Bw/J0wWO0PDIc/URLBBElQGf4zdN0Ho
         JwpLEuBABXuQGSNhsJVDtLEsCPUzIcXRjlureghejbDEUtBMI7nFqh5/+ProcRVWMkgj
         dCOuijA70KazOr8Nj/tfo+0GYKoexyvup3OS9u+rEcSAk7J25FqC2LkDwFQToUYBnq8m
         CDRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdmBYzt59D/YK0bP4odsOemFRth2fwkURAC+YSM0s3VJSXA3J/bsNA8WiYsyl/EeMDW09bu6HXhVN0@vger.kernel.org
X-Gm-Message-State: AFuF++kHTBlr8C/rPsl4TSpc62aglDEzNeA8OkNMh7J2DYSSnr5n/+GN
	fKpPMxY62yFoHpS2UOW4HZmWyDK+u0vWeJyM6kDFkSG9McAZVIn5MsJdDodS1yoH10I=
X-Gm-Gg: AYBFou1OayaL5n+dWDpWvdeR+89VwD2Jhg/oNfu7IVe86TsHpvRatkpgjima57c5MFG
	Pxd8W+DxDXOpNAhPFGmFG21W5+ZYLDTSM9qRzrVuycjlUdBkreU72PicrVrEh7jacsllqHRxRoa
	782fCGx06rTbT5JWW0cspK86uhcTpf4VHNWzOnPKBfbpP48i2TmD0f3r9aXWUIlsSgPULOQiOUI
	dmFhuwqPCZ151HCQm+sDr/xNygoYxCI79jk7QA9lFwT4LYegRmDpe4vKOpVn5tXhCiA6OkInGgj
	LuzlGulCsd3EMVokUa+UJ5ZC8usVFYool/p/Atn7nPz4EUowLQzCSplPOcsjJNiD1aEIV/thiqM
	Ae6LeufgJyR/FQ06FpPINxNagi1aJVImGrgUQ9mvLYNrsUNJtB6UNIxfiILqp/4z9RLbUAKlXhC
	zUi4wefwNV8UVedn2fNkVxO7po66HYRzNQ2+IcGf+hclOcILO7gz4BYLdNRchb9B4Cq7dc9kbZ8
	H6wgK4WazpKLfLx6IlpzZhqwx1QJG+K0ZtRmeH1t5Cv9lGgAPeEVZFQ4KdkFw==
X-Received: by 2002:a05:600c:800e:b0:4a0:3c3:1ad4 with SMTP id 5b1f17b1804b1-4a01502bd28mr12961385e9.22.1790727189896;
        Tue, 29 Sep 2026 17:13:09 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:09 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:12:56 +0100
Subject: [PATCH v7 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-1-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
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
index 1c02b919d6ae..137297bf508b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11298,7 +11298,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -24629,6 +24628,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0

