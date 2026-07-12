Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5EE39D6D4
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849492; cv=none; b=EEL9tUbbMbWAX5rJi+0/+74Gws7U8rh/A5hW3vl0I+kuIFEs2vRlqAR3ZSYCXoAL4aeNAfeqvn9dKr8YrXNHewwn0FVm3QgEKYOnh13bhzK7ORTF5P6OVjnsvGYtFisqOuYRuc7OiiQCA6l8DWbm7xEW5s4OGKOQYBLJLUZtz8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849492; c=relaxed/simple;
	bh=IymUvUUOlIyUk7vYIWm4si7rSp3+FNzQ5/l7gdZ5Phw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l//ZN0yrYfq4Buqa1omAotHHph/2qQcPNpPMElsEue5VSAISmPvyEIHOZnlIw8iweDI61VDFy6czRuj2/z79f6QcIhcD+f3DjCG7gad69NJPXZhcQ+jP9PUisTHEtI6ZX1YN6LlGLRA7Krv/Q1tHWXe/LPvEapw0nC60EMlWjgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV9lZBxp; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV9lZBxp"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so2212036a91.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849490; x=1784454290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=JV9lZBxp7d5/9xiF9/9+AR7sg1iEWmcOIyzHpuuco6YaZLLikibOBvMCJkVAO2f6Ee
         FRGNoO1VKAhlmn0nK9DhZ1jLGnP4tBv/4zzbxRjoBd2RCiwJTDfwOFbufzHepW8ta/Md
         Trd+dxSqLxHXzYlnK3yWQrWg5cat71mepXSErAWhMWb6k8XYKqcTpPozsAJORb2Kxud/
         Kv079A6s0N25DQ0gnkPcEeTxtyXLorZSfOgyGbwn24uWEi+VP93vjq9ppscT+JP4+xIh
         rnyuj00SXLRwMiDa/c/wSaUxPRT6eIVp995V0LEWC22+h+Nz3bbwTeF+e9UnWSURJUZS
         Hvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849490; x=1784454290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=VGPfoU3qJktWsIQDw595M6LrZ95CkCdFQ8B9ngL9TUnNIXBX2ynW54rd/4RogKEfOk
         Kyj/BzGdBqJbyptyXRoU2hOLdqN2pF7WPLwJXcWTUFATDaeU7PdPuLlTzB01f16PEsZK
         VFbfhkFDnCsY8yICvhynyYwtRiV9sRBIsVYOmTiEiZQ4Z2VKmM9O0yd732PaDm15PPw+
         t3OVe4a8VNN9MdOUow4mi1dAsQ4LX/IgCSheXmABAZ93Hy5I5HBWwquyHdXg3ohsak0Q
         l2e75JAjMbg94k+o2NqChNsg+tQIX8rUpuW7eEbxD79vLdlL2DCRPRww9XcIzVRSw9vT
         d3Yg==
X-Forwarded-Encrypted: i=1; AHgh+RoGxu93Q7V2E2m6lgDzkIqfIA/QwwOYM9YkKAsklIecMl/mN95Y1SumnKEjCpy5lv1/Y+ZtWLz4xwGQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8pvg3ouFJogU3Se2pfplGW0Xu2WT+Rnl+r+bfeIOpnRDvlBJc
	gnV4sRl9KwFN44qC7Rnawdn0SRxXIn+02g7FV+PP35pSBQj4c39aed0M
X-Gm-Gg: AfdE7cl+Nbf6pg4GvaKEBifC9RduVJ7Ygks+zDamKd875F4IY5uhFoLWdTOSmWvXlwr
	m71uOsZuRlIdUuf5RYNhZBUA3riH2LMvP+0doqBp2DOh+5NB/4cpX84+GleSMl284/WHhlfSEqR
	o6+Kj+Q6TZaCnbdjSCe6pD/4A2xate2Hv8DTimL9c7kK4k2pdlZsdBI03arpDbt6Y1WB1iP28mW
	cKmfQRU1TMnhL1hY++Mqq4BOXgjunEASTd6obk51VPxuByF9dEX8Vh4FONmaAW//xCJcMEoRBnM
	0qXClgTYnFGrL2qkw1cBcaWq0BMhcaykb24Zv9ceuRbw4L6LDHBSQO2C0EYqYR79jFT1c/dSrfH
	tNuVGBS0pG4aTaMRJq+n1wJxoDau97lkT7teCHno6eIH5iOWyMvJumI2yluL0IeSy1LUgikqIRb
	icc2CVcgvmMclFptWynKBMlb124tmcHV9izGxHDTSww36ZbDhSKuPM72xEg2jRZGtmK4yEDeMe+
	WfOTHWyU2JtHMshC6mtmiYuMpeW05nZE8csLTLfkfZP2mB8xOFRd9AagDnUBTwH
X-Received: by 2002:a17:90b:184d:b0:37f:9ce1:736a with SMTP id 98e67ed59e1d1-38dc77759a8mr5253734a91.32.1783849490211;
        Sun, 12 Jul 2026 02:44:50 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:28 +1000
Subject: [PATCH 09/12] arm64: dts: apple: t602x: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-9-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=IymUvUUOlIyUk7vYIWm4si7rSp3+FNzQ5/l7gdZ5Phw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU8TKxXf35MvkalK6o9K21j6o2hri+zsdi739T66n
 gVl/Vs6JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAU73mGcP/6g7/K1G3BJf84hN0Dj9n3f7JvSm3bfVEBzG/sKObqph/M/yv6OBu21D
 FyLQ8yndOkFnH5fQwsTVZeY93/Tr60nQP+x1GAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6021.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6022.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6021.dtsi b/arch/arm64/boot/dts/apple/t6021.dtsi
index 62907ad6a546..5175797baf62 100644
--- a/arch/arm64/boot/dts/apple/t6021.dtsi
+++ b/arch/arm64/boot/dts/apple/t6021.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g14c", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
index e73bf2f7510a..7585fd609d34 100644
--- a/arch/arm64/boot/dts/apple/t6022.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022.dtsi
@@ -347,3 +347,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g14d", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0

