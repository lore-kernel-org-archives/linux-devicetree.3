Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378474;
	b=rVYnbN2638BoKtA/aOLQZjrI472NJk7f/wUl8q/vgDduhdOlcTLHgJDL0EvadABZiZAW
	 OfFNSHl8Pt+aqortVNMzhNH1ZH3HRfYHb1G3H2WZaLkqgp7MCpIY68rtggTiUS4SYXCu6
	 7z6mErbmHmO+Jinfy5qxn0MA+t5NBe6DLjN90noR64VCJ92gD5TRqAL8T+RHS8YTpL+lZ
	 nOCcse566MMqjlp3UQ+MHqxD/DekLLwFQ1nhE4KplFDoHMmJ87RIQTTqX//SIIfD4vq1+
	 zl0GHR/Dyy/5Wv0P2SlmURiGcXixO5exZlsx0riqKNJLbFYWf5t5mHjAMfcuvb/KlHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=43C9bHqJisdAiTlKpHe0KRIkeYtDhHYePbH6vei7RK0=;
	b=OJLTyUwcBg9xfpZywWh94TRrvZgpuulhR1K6b876bEZFH88Vn8X8l1Rc/Wxbar1YyqxP
	 cjCOTD1R2gu6qWqA2ClJJhMFT+PP8/Z6B+u/YEEyDaTu+/xT7nkhV8yZOhtXLRqkPue4h
	 hT+NN4tpTtKXr4WICGrZ5zz1ZH0QOgC7odB5bVmfN7bLP05Z63AKQZds+QfGraj6Y1I88
	 5I/R6tgmkJsI8cdcclLuTmC27gD/uLUI4TCZmTFgA9XlusKoreoiQTd2ilEkcD89nuvag
	 qweqxuRNlx7kuLvL+ykh3ib1/prIxBsuzzclM1bcBDz9jjuF7oO2qbpuus/CuQBIbew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GD11zxSi;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A755F606A338
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A755F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GD11zxSi
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so597798a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378472; x=1795983272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43C9bHqJisdAiTlKpHe0KRIkeYtDhHYePbH6vei7RK0=;
        b=GD11zxSiqy4Bn6JUPtpI2nzRDhPvnQ8oPMB0enhNHvhAbU8Tug1YknC/gXCIwxymdV
         zidBrWfwT2WuR3UnCSQiFs4Z1VtoIf6wwSl2MBzxqx7XdZ7iQZj5kYNdd/+/D1WV8yqB
         Z5kO0WaWrD8prhA3s38DVOvV/2aPBJ9AYsxiBd/1Ec+kbPguwKTYSBp8+NqH4TkFpVXJ
         nZEOru06DOxWW89F/wjAS/t8FlrX2Fl/cUHdShpSjgEQjDBr5kCQNQW52/fZWZ1c6LHd
         pg6cLdYJAWzQc73ppZJeBQD0NaVNEuuavBE8Ma+Avp0I2QL4P8oj5rxf6coc2MzOeryP
         0hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378472; x=1795983272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43C9bHqJisdAiTlKpHe0KRIkeYtDhHYePbH6vei7RK0=;
        b=XcaNeKO0ePddj98cP+/ZUFiEdVLYatZGWIyNj/t3cfYNimyNvoQiIKODNZQuYXTuKb
         y/PHkh+wj1EeJQnKQTw9RdrOyybWrVjWGWorZX6Uni1gO/VztVzbbJI1Tky8cG4SBUq8
         KWBkR6PfLzepXh6VCcvXz1vWU6tyAsW4QtXbArTq6YxCb0g6yGDj1vaumHOpN2r7WRpK
         oXqxdWuazi1j4awdEmu6spY/hNGjlhVcowWtIO1pYydYysShZqqv7l/VQEzb1KTJigKa
         brKFypamdDBLm8GH2i6b+CpDVaZtQlQuQrF6yrPRKU41kV3a2SsHmd71T5r6PNE5mopy
         wp1A==
X-Gm-Message-State: APuU4Z+5KQ+VTw+QkUX0NKZwHtLLFPuQQDcx4Ht4RW/8dv6TzDiIqlfL
	Xa6lRb9WgO9LTDd/pnxRzzDkwUJbcJyy2TcY36D7dQKugVj76xoJrvyB
X-Gm-Gg: AZFdTZf1gwrjt1xacbW/XmHoFADtssxhSGud8odRebRB34KAWH47DsbgQpznrLSgtvz
	5C4ikqD/774Abxk1hTsWfvfP9kJiukwPwCauvjeBU4HL/F7rMvFtXZfJ36WEJxEaT0QqMTdtK5Z
	GqbYTwgZ5BTHByJGrqDeQvSxC6QSrkhNcOXONLZafbnzBGFgSlV8tr5QXAWVMC5Ho3M20KjZvf9
	iQFzSFvkRSrr8YmzA0fR6ylld32f3EPmrmVBacNuyzTyz51ligVRdi0gspod2IbYmOOhTYeQ+Vk
	dAeEQsTFpeGOGZAuGHQI7NffFTZ8CBp68MwsLtGIUxs5ZN6+qGLSIWsPpvdD7khL5kidgjbH0qf
	r534cFgHzekoprGwYDmHO3mpwLre8CzN8oqyR15tReoSmeHEaVkDlqUYk/cdf5I/b+v9ILoERIZ
	Hy3yhlwAeLzdmbaA4Drztr0nQL3hl9TNGFUt7t3ch82ELOQLb9j3of8c5MKJYcSWLngL5D4dwkf
	0daC7ccWmsxEReJIQmzYwcDOkH0ZfdfOUE75MZQxw+DAG3ujZfJ/imN6nOUsZJnXzSW6G73PODM
	ihZ7Vwk/Zeh9pHOl8sHy/q2YcBH4y1PyPcaD4ptCDsd7a0tOlYblWdcJa1becTLlDyMTaB4lUub
	eb95fvv3niQ==
X-Received: by 2002:a05:6402:5652:b0:6b7:6485:2413 with SMTP id 4fb4d7f45d1cf-6ba1fae101fmr5953289a12.5.1795378472042;
        Sun, 22 Nov 2026 12:14:32 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/18] ARM: tegra: Diverge Tegra Note 7 device tree to support its common versions
Date: Sun, 22 Nov 2026 22:13:51 +0200
Message-ID: <20261122201407.23742-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegra Note 7 has at least 4 different revisions. To reflect this, the
existing Tegra Note 7 device tree is set as a common base, and the
differences are placed in separate trees. These separate device trees will
be populated in subsequent commits.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/Makefile                  |  6 ++++--
 .../dts/nvidia/tegra114-nvidia-tegranote7c.dts     | 14 ++++++++++++++
 ...n7.dts => tegra114-nvidia-tegratab-common.dtsi} |  4 ----
 .../dts/nvidia/tegra114-nvidia-tegratab-p1640.dts  |  9 +++++++++
 .../dts/nvidia/tegra114-nvidia-tegratab-p1988.dts  |  9 +++++++++
 5 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
 rename arch/arm/boot/dts/nvidia/{tegra114-tn7.dts => tegra114-nvidia-tegratab-common.dtsi} (98%)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts

diff --git a/arch/arm/boot/dts/nvidia/Makefile b/arch/arm/boot/dts/nvidia/Makefile
index 7fc27cb8e74ae..f06b2595bcd86 100644
--- a/arch/arm/boot/dts/nvidia/Makefile
+++ b/arch/arm/boot/dts/nvidia/Makefile
@@ -5,8 +5,10 @@ dtb-$(CONFIG_ARCH_TEGRA_114_SOC) += \
 	tegra114-microsoft-surface-2-0b.dtb \
 	tegra114-microsoft-surface-2-13.dtb \
 	tegra114-microsoft-surface-2-efi.dtb \
-	tegra114-roth.dtb \
-	tegra114-tn7.dtb
+	tegra114-nvidia-tegranote7c.dtb \
+	tegra114-nvidia-tegratab-p1640.dtb \
+	tegra114-nvidia-tegratab-p1988.dtb \
+	tegra114-roth.dtb
 dtb-$(CONFIG_ARCH_TEGRA_124_SOC) += \
 	tegra124-apalis-eval.dtb \
 	tegra124-apalis-v1.2-eval.dtb \
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
new file mode 100644
index 0000000000000..1b50d5bbbbdf7
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra114-nvidia-tegratab-p1988.dts"
+
+/*
+ * The LTE version of the Tegra Note 7 appears to be identical to the P1988
+ * revision of the Tegratab. The main difference is the modem, which is
+ * connected to the second USB controller configured in HSIC mode.
+ */
+
+/ {
+	model = "NVIDIA Tegra Note 7 LTE";
+	compatible = "nvidia,tegranote7c", "nvidia,tegra114";
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
similarity index 98%
rename from arch/arm/boot/dts/nvidia/tegra114-tn7.dts
rename to arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 4b1e47364fdbc..e4ba975fcc3db 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -1,13 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
-/dts-v1/;
 
 #include <dt-bindings/input/input.h>
 #include "tegra114.dtsi"
 
 / {
-	model = "Tegra Note 7";
-	compatible = "nvidia,tn7", "nvidia,tegra114";
-
 	chosen {
 		/* TN7's bootloader's arguments need to be overridden */
 		bootargs = "console=ttyS0,115200n8 console=tty1 gpt fbcon=rotate:2";
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
new file mode 100644
index 0000000000000..409df3de17a82
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra114-nvidia-tegratab-common.dtsi"
+
+/ {
+	model = "Nvidia Tegra Note 7 (P1640)";
+	compatible = "nvidia,tegratab", "nvidia,tegra114";
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
new file mode 100644
index 0000000000000..00126da319ec7
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra114-nvidia-tegratab-common.dtsi"
+
+/ {
+	model = "Nvidia Tegra Note 7 (P1988)";
+	compatible = "nvidia,tegratab", "nvidia,tegra114";
+};
-- 
2.53.0

