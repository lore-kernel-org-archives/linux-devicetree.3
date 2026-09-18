Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411A94FDA76
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752812; cv=none; b=eUtRaVc6/7IoZtqo4L5QHvSJ/iVwtWyvo57cKffqfzDcLN8IgiwbGcFVVIBsPpwxC3XXO5B1oi16qmuaJynnrWoo24xWwQUYY5zaasq/VYdvGi43XxJ/mdOSEI0rBJqEpeBwCep0uvxN1HuO1NA1jwSMNWsEkxik/1EKaY/bb9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752812; c=relaxed/simple;
	bh=TkeK6vGmZcwODlJlEq5gVtqOmy+dm0WEcZnbleLPAiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3PX/wAaGok42Bz2As198Z78CDxUce2I87EGlD5Ym+LcK7EIvHoKEG4vY2OHYOe9fH6DapXJgy8DGcPS2vQNCYv0ytjz/sKoTOpfjeqCn3olq4mw+0C/fPjEH/ncaWfNmAd734mGPPVQeH5rr4YdwWn8ltPXGKyBuEpCi8PTv/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M7BK05bY; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M7BK05bY"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c627f291so264997e87.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789752806; x=1790357606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=;
        b=M7BK05bYyo7PmAkRPHH4wSQu8S94IPigbvXVqTIXM43uWTF4Zla3tm43mbsyW7veER
         /s/HY0344RXbvfoMzkqRdkarP/zDa2yeMoDt7wQKjNZ1WuChwi/f1vOibZMBeSdYx0kW
         p3uH1IInyVgrA5gKQkhl9OlzfQ1mBGgEO4J51RTb0Uq//YKmabI6/u9gBxqcXtlOhUQw
         6ZBTL8sxobsfO4pD2RFT/pqhJ65Ry/ei5qYJTp1n7GTjz9fyH+yJjq4pnvL4PiSctniq
         VyrOYQsZmpr752FJsAQGVI0VCUBOZ/PBKeABc3+4xekrPSlAdmDpH/2Uv/V8GSENQimg
         d8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752806; x=1790357606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=;
        b=nal1wrMThLDoxA7DDNT4G64Tgi9R3JBN+0kYIC2GBryQLAcm99L5SAh0FaItvTlxdi
         /XiKVGG740RkY5OzSOAMPZnh++FStPpx56JLXSgCMaVR/aA31xUYTGtica14fuw/sola
         OOOnRQB3Bd5I1YBSG4tI+Ixuy3IOaB+EAlvnqg+e0aUzmYIGpJFEwCZa5cKx62g3f5xR
         t0Zl5Sm99zhYF8jMoL9SQ4F+UWEPvTafdC0bYytP97C9fY56vSF2ib2gPmxscoWOoAlt
         70fFscqZneIJoKmvPBP61UGFir3vIdUxLRL7KSSs2tVrBw37OftCViuJLXd06jJ1/LkE
         LNdA==
X-Gm-Message-State: AFuF++nvje12tj5BVgD2UTjjuyUPkOpFOh7kml5QJJe/EdGlub3uK1bF
	rFjMEw3x3EdubAVBtb+XIYSAQDf+g9hqFdbGdY9/apw/DtUVnA1EFl9FDISSlc3tFcyzHbxJUWw
	Q7FaBpoQ=
X-Gm-Gg: AYBFou3WFV8sVyGOOhZGmPgwUhIweEXWeF2EyHkjXFQvcT7KvdGEIl2I3/ZhOjKHv5B
	AU1xab9y7efZGQ64k4l3rFk+zWA6O79SOfvTDJczI/cbgAdsnk73o4CUOXnn4yzkOTb7v1pBFvi
	NkQ39wc1yVqptWF5rZi/sBWXtTLyr8lVI8P2W3BaU7AspBTTUj5Zfg9rsIUjRFadMyT0YT4g6zQ
	ToRRBXMaYz7ZST/ZaoGppH8MAI2kBcCrbsyQ3ZT10f5NkHpIGe6z9sZ9IC3ing7g8tMfBgEqt1+
	F9C8+M0gh0jKs+pnOq0Irx1O+3cSra6rl/2ulwmXulCYWtdKJ36sEsv82nSVWYmtsepnpBvYRFx
	qPhyj/Hkl5s5FagFRRqpZYChVXU/rsuADl6Or6/9gt8nqpFAHewcq6DUupYfJL6bGsLFzFJdlff
	Se6bpnR5M6SBZLPBh8TTswv3jkvjyDiqDaNgLPVEtGchpvUp4lu+PU+7zuJU92hIS3aZPILvlXN
	8YhdvcI8NYp3ei94vfGTmxIm7VzRY9vHnAv2z2X40p1cffBGgVSqjgGJAUZ0hezVw==
X-Received: by 2002:a17:907:971e:b0:c25:fdbc:52df with SMTP id a640c23a62f3a-c2a15699d4cmr283478866b.10.1789752410253;
        Fri, 18 Sep 2026 10:26:50 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701d8bsm902966b.27.2026.09.18.10.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:26:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 17:26:35 +0000
Subject: [PATCH v3 2/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v3-2-c94e51140509@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2879;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=prHtn5W9Y5dmFFjTBpt1J6sbCTHN8IgoPCiN1ehs4ME=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrXRXFTEYAGEsoS7MUfIrg6CjdIOaifPmsSFmo
 QQ8leTp7q6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq10VwAKCRDO6LjWAjRy
 ug/fD/9Urr6DgBP6/xSBuCZzkbqwlAfIRnR0z+L2WO+ksdtXeV/usopNI2AWlnxNecYkTWIZGJa
 nEg5M1CL0S432JJKZVtOBTqNyd3O3himpBwj8neXDBebwgX61R3vSYad2+Ux1jX1O/Klpi4qnPb
 oOqdhdPqvqxSOVUE2sk8HR53f0KERaeGyP0yrfXHq+bYR1M/KtSQoUGXuqfDH/0dIHedUIYy/dh
 X5jFUZvD4fhLsridougvieTgMWG79r/RcfaeeakcMYvEjU2eOgZWA2vxlhQpsHd/T0aBahZhRHr
 VYTEMfKs2DWxuMakwGN39vpfRy630y/vqTowyXYfAUZqFM8Iw/frDfJTm61WD6dvAB3rVU6ToZt
 pEcem4gWuKQcuROBYfK3PepyoPV2dWpA+kwsYy3tMGkw5z334AP7kqOxBt5A83YssgBip21tv9+
 Fp2Fwgi7hYNtNCTiGOEn9mqSsp6ysDQYA9mf/0b7wIehZUycnJrVRAYijVrhOH2K62bvqeMH7ZA
 8Ini+nFiLhcz+uYLVsqNuJfSY8lZ185M79jJY9EzEVarntgmQhWexSBmttBx74LR64QRnudxm1i
 f5x2MsrmsBrVPnJIml/VkouixLbIM9jrTMEqGSfCLiDTtIrDIP1Bh5z7dE3Icy1rqDk8mVlHF51
 btmyUow4Did/arA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

From: Douglas Anderson <dianders@chromium.org>

The first four Google Tensor SoCs were offshoots of Samsung Exynos
SoCs and their device trees were organized under the "exynos/google"
directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
Google Tensor SoCs are now of Google's own design. Add a location in
the tree to store these device tree files.

Changes by Peter Griffin
 * update config symbol help with at least 4 lines to avoid checkpatch
   warning

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS                         | 1 +
 arch/arm64/Kconfig.platforms        | 8 ++++++++
 arch/arm64/boot/dts/Makefile        | 1 +
 arch/arm64/boot/dts/google/Makefile | 1 +
 4 files changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06760c45c582c..bee67180e93e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11245,6 +11245,7 @@ F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
+F:	arch/arm64/boot/dts/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/phy-google-usb.c
 F:	drivers/soc/samsung/gs101-pmu.c
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 1489bad527d8e..c52dc955df5f0 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -154,6 +154,14 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
+config ARCH_GOOGLE
+	bool "Google-Designed SoC family"
+	help
+	  This enables support for Google Tensor SoCs starting at the
+	  Google Tensor G5 (Laguna) found in Pixel 10 and later phones.
+	  Tensor G1 to G4 are offshoots of the Exynos family and are
+	  enabled via ARCH_EXYNOS.
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select SOC_TI
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index fc726b215f125..f2d7cd6eb5695 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -19,6 +19,7 @@ subdir-y += cavium
 subdir-y += cix
 subdir-y += exynos
 subdir-y += freescale
+subdir-y += google
 subdir-y += hisilicon
 subdir-y += intel
 subdir-y += lg
diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 0000000000000..a6b187e2d6318
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)

-- 
2.55.0.1082.g2b9226bbc0-goog

