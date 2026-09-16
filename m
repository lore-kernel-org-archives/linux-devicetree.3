Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA714F4755
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564409; cv=none; b=cHvkmaVw7bQOUefzwozlaLB5pxt7oTwzWqBH1atcp1640ArdwocuO1Kn+53YRhqPuFdcZIV2SmJWm8bMXrNNRIAPes0lfWJc4ufnCq0aOi6bwCbSKE5V6iWqVYyDwF6vQ4Xg0aIF7CxCsJXZy5dlARCRz+2LBWHrwgi0j0NeP+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564409; c=relaxed/simple;
	bh=aHPHyLZqMZcJhOAzQJstjzYjyL4IWgz2sZBsyH3+fu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2e6CVf18Tsp6XdjQ3+j2CIQJzmAKbDbAjMoIV7Rot6L8zr3B7onN9dOOeSrRGi0uIpQPrdifkQ986jibJ7cLZeReJNd2aX8MCzXcKS8oApA11+aYagNVg5pBZHNzrNVm7lfc1A4x6N/MZoVr0MP9JBQY4s2CGBanvNodZWjY2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sh7cnkW/; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sh7cnkW/"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39dfedbf80fso84852a91.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564407; x=1790169207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzUOoJ26Q4wpXLMeAMsRdvt/sheLzu215cuCrI0jbd0=;
        b=Sh7cnkW/R5aMNww4funAQvaqvz3zTv4Blsds5Ph4JjJbV5TCJaqNdX8J+j21O+q96b
         vC8hhkdJStraBDw+qS1IRmfWV80F+g7pXEbeWrBV2dI55tSQqyLlDkZ+QzLM6IMUx6wD
         agATGiHoUiT4t8JqvJjZxocBIdRiX2BG/LTEgtmAv6jonVfqUceDYCmzpOq1G8I5c8bT
         6wxgSZLtYN/Uw2FMtv+X5IutchxuuP9Vb9aCF5/mk8Z79HnsDULkrSVwmdlvQ5bm5siH
         W2aAKFAQPleocQnbdh0fjgFptAMoKRTuKokBYNdTywxz6VUAh1hlr3RRTMw5ciXPBKSe
         m2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564407; x=1790169207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzUOoJ26Q4wpXLMeAMsRdvt/sheLzu215cuCrI0jbd0=;
        b=ffvn4HE3WDw5DKHOn/VOuF3zxRRhEuuIx5pM1kOLX1649zN6JSTEibi7WGYlIM/2nM
         qM2f8yhKw+ZwQit5Ag+U1ehmPFtIqjOxok5GfqrHqWeHvlzA6ibZb4sntkXGlF1RApdk
         lSjzstydVFalwkpeoMhERxLx7FYcfBkIBlQc3OvvT2xIrBesfqIh53G0NzATvrBrrEHS
         4EMAMdAtA4+JlicBNZ802aFYeg0rEycr5rTgVFzBaNHP3z+THL/yTz3N1Ir3vamSZTTS
         rTlbc75CDeMIZH7DS0sgOSxDPKs+ZRfFxTRWQqKgeRMRso6VKy+bw8SXqZjBlq28FFTK
         OzmA==
X-Forwarded-Encrypted: i=1; AKwUvBz+0MCrPXXwny6FommdX4xBZcBrsfhiv5tz0LSM8ospPgxdbeH2gUJQjYFkcLvQnj/3kUcbB7acvzmU@vger.kernel.org
X-Gm-Message-State: AFuF++kmqEpjVG27k70lIapqJ3kU3+fglNsfd0JCONPeHoYt8bA1PFW2
	eiRVc7CF5/WztVAWbRW/c8yrtwwiQhG2MjodFwkUfVTxCn7StuJKdBpD
X-Gm-Gg: AYBFou3ZozAR2fZqBDrdaVzbfX2fF5KSrv/U7nEO4D7ZLp9P9JPbIfalpET/Q1bFXLu
	iIGGH/i7hv253LyevuCozblBa5bSnoSwQ2QDw6harQTa+SQa9hxawUu0wBaObvEdui1xmhlY/vc
	ZxS8O1Ao52Ehhvo7weVZck1NBxpUKIIafJeJFwJT5HHc8aSYToxKZUwbWYZ3RZwLRQAcVpOmKlT
	rltlTeiP4+WLXxbpSYtHg/fZHEN4ojcd4HaJnZy+ar0To3hoksV+Swouw2iAqAlTz4czw23OVLt
	AIVfFbqyxZTG/1IO8b8LSGRCatWmYgGKeAYBiukPaK+sI0zO7i6dhhOI7LQDHeC9lePd38/Yxau
	itRNC2PVkt/TW4oXeX+AdEZ+HB2flbswCTEMfaaqidpyvh7yde86f6KOyV+YKfOTAXlTuUDXaNG
	Wygr6Z1A9FHvBa1+Ob8qzJgmSFLFqi2FRDo8V5nkOy4gn/1uNR2Bw5hQqs+YnjPv60GKtK7s1UX
	5HUefRjJ0k=
X-Received: by 2002:a17:90b:4b88:b0:39e:24fa:eb0 with SMTP id 98e67ed59e1d1-39e24fa1fdemr2789608a91.2.1789564406661;
        Wed, 16 Sep 2026 06:13:26 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:13:26 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 18:41:27 +0530
Subject: [PATCH v2 2/4] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-tps6586x-v2-2-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
In-Reply-To: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=6082;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=aHPHyLZqMZcJhOAzQJstjzYjyL4IWgz2sZBsyH3+fu0=;
 b=Zyn9uuqtMLE6P6V/CbvuW8eCHKeuxp+3aE/AhaNrteVq2K3hGIsuOnJHvAezB0hEfVWZL5/8a
 oMfrd1j9AAOCwNTYfFd4qGnIlYgOZMf7onSipoYbow5/MWA8F824x3c
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
Set additionalProperties true as this is shared schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../regulator/nvidia,tegra-regulators-coupling.txt | 65 ------------------
 .../nvidia,tegra-regulators-coupling.yaml          | 76 ++++++++++++++++++++++
 2 files changed, 76 insertions(+), 65 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
deleted file mode 100644
index 4bf2dbf7c6cc..000000000000
--- a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-NVIDIA Tegra Regulators Coupling
-================================
-
-NVIDIA Tegra SoC's have a mandatory voltage-coupling between regulators.
-Thus on Tegra20 there are 3 coupled regulators and on NVIDIA Tegra30
-there are 2.
-
-Tegra20 voltage coupling
-------------------------
-
-On Tegra20 SoC's there are 3 coupled regulators: CORE, RTC and CPU.
-The CORE and RTC voltages shall be in a range of 170mV from each other
-and they both shall be higher than the CPU voltage by at least 120mV.
-
-Tegra30 voltage coupling
-------------------------
-
-On Tegra30 SoC's there are 2 coupled regulators: CORE and CPU. The CORE
-and CPU voltages shall be in a range of 300mV from each other and CORE
-voltage shall be higher than the CPU by N mV, where N depends on the CPU
-voltage.
-
-Required properties:
-- nvidia,tegra-core-regulator: Boolean property that designates regulator
-  as the "Core domain" voltage regulator.
-- nvidia,tegra-rtc-regulator: Boolean property that designates regulator
-  as the "RTC domain" voltage regulator.
-- nvidia,tegra-cpu-regulator: Boolean property that designates regulator
-  as the "CPU domain" voltage regulator.
-
-Example:
-
-	pmic {
-		regulators {
-			core_vdd_reg: core {
-				regulator-name = "vdd_core";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1300000>;
-				regulator-coupled-with = <&rtc_vdd_reg &cpu_vdd_reg>;
-				regulator-coupled-max-spread = <170000 550000>;
-
-				nvidia,tegra-core-regulator;
-			};
-
-			rtc_vdd_reg: rtc {
-				regulator-name = "vdd_rtc";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1300000>;
-				regulator-coupled-with = <&core_vdd_reg &cpu_vdd_reg>;
-				regulator-coupled-max-spread = <170000 550000>;
-
-				nvidia,tegra-rtc-regulator;
-			};
-
-			cpu_vdd_reg: cpu {
-				regulator-name = "vdd_cpu";
-				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt = <1125000>;
-				regulator-coupled-with = <&core_vdd_reg &rtc_vdd_reg>;
-				regulator-coupled-max-spread = <550000 550000>;
-
-				nvidia,tegra-cpu-regulator;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
new file mode 100644
index 000000000000..248cc98b6af1
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Regulators Coupling
+
+description:
+  NVIDIA Tegra SoC's have a mandatory voltage-coupling between regulators. Thus
+  on Tegra20 there are 3 coupled regulators and on NVIDIA Tegra30 there are 2.
+
+  Tegra20 voltage coupling On Tegra20 SoC's - there are 3 coupled
+  regulators:CORE, RTC and CPU. The CORE and RTC voltages shall be in a range
+  of 170mV from each other and they both shall be higher than the CPU voltage
+  by at least 120mV.
+
+  Tegra30 voltage coupling On Tegra30 SoC's - there are 2 coupled
+  regulators:CORE and CPU. The CORE and CPU voltages shall be in a range of
+  300mV from each other and CORE voltage shall be higher than the CPU by N mV,
+  where N depends on the CPU voltage.
+
+maintainers:
+  - Dmitry Osipenko <digetx@gmail.com>
+  - Thierry Reding <treding@nvidia.com>
+
+properties:
+  nvidia,tegra-core-regulator:
+    description: designates regulator as the "Core domain" voltage regulator.
+    type: boolean
+
+  nvidia,tegra-rtc-regulator:
+    description: designates regulator as the "RTC domain" voltage regulator.
+    type: boolean
+
+  nvidia,tegra-cpu-regulator:
+    description: designates regulator as the "CPU domain" voltage regulator.
+    type: boolean
+
+additionalProperties: true
+
+examples:
+  - |
+    pmic {
+        regulators {
+            core_vdd_reg: core {
+                regulator-name = "vdd_core";
+                regulator-min-microvolt = <950000>;
+                regulator-max-microvolt = <1300000>;
+                regulator-coupled-with = <&rtc_vdd_reg &cpu_vdd_reg>;
+                regulator-coupled-max-spread = <170000 550000>;
+
+                nvidia,tegra-core-regulator;
+            };
+
+            rtc_vdd_reg: rtc {
+                regulator-name = "vdd_rtc";
+                regulator-min-microvolt = <950000>;
+                regulator-max-microvolt = <1300000>;
+                regulator-coupled-with = <&core_vdd_reg &cpu_vdd_reg>;
+                regulator-coupled-max-spread = <170000 550000>;
+
+                nvidia,tegra-rtc-regulator;
+           };
+
+           cpu_vdd_reg: cpu {
+                regulator-name = "vdd_cpu";
+                regulator-min-microvolt = <750000>;
+                regulator-max-microvolt = <1125000>;
+                regulator-coupled-with = <&core_vdd_reg &rtc_vdd_reg>;
+                regulator-coupled-max-spread = <550000 550000>;
+
+                nvidia,tegra-cpu-regulator;
+            };
+        };
+    };

-- 
2.55.0

