Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378494;
	b=wFuSzGYxIXr4gvXDdZqTg+ital5m7RrPQl/1YSUGOYadUqFdY5oTvRZ2XwyFASd+tyd+
	 B73pcNwB+CP5glkR3xtkLfMJ3Qy/Ha6CNlsB2S72BCEKF9mfBs1gRuKrKChzbhONV8Vnh
	 VF+KyLEBxO0wRhVAn9WYeMrdupXosORQW3rcNadXXZ1kevvlM2SLOvBXj3N3KlHcPmsIJ
	 5HVwf/ohNbJBbqSn70KOceHmfH39uUrFiPUdbbf2g3Stb019UuG9/zi2XY+SlwwHdghLL
	 +kOKLGK6nj7OhHVeOdk1o0dGJX6rbq4yz9oMkvbTlwJx48muscXzHDNpEdB1YAqGh7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W3DOibmTouZHMicE5mHPj229m6Ggbgawt0BEFNpJyE4=;
	b=unGaWsvLhRm1p4m5amsDDn1tvYoqnFHl0Ohkd+hxGFFCGVCu2aI39HSUL0waaSc37HaK
	 z34jJM6l3/53RlHqytpmHefQeFXV9+jrYKr/i67+9X2L47p1PytuRt7UTEb7EiEclTCQb
	 B7znFV4BC0K8M7ygmxUO+cYwS/H3kaX0/0LNb/jLmcTdsvsRld9oklVFk2BAUyhQ3wW41
	 sicLAxhL1ijokOzddO3wRsSKJHTy+B8aH21KiM73hB6q8GSnrk7IdbHnQ0PbaEnxsxV8c
	 uCduripRLNS5l4wrPpi5U9CVAkPkuBv+bAA61Zfqo7825yVtRC6PPFPkT23b5J7Tq/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILYBHBS+;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF8606A683
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AEF8606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILYBHBS+
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so2776035a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378493; x=1795983293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3DOibmTouZHMicE5mHPj229m6Ggbgawt0BEFNpJyE4=;
        b=ILYBHBS+B3TI7PbTogIuuMAICxrVMAFQyhYm6WTkVWi+mzR6iuxrb3UvF4rVAp0YDt
         LGnESxqxjrV1Y8HpHmyJMURjL2kZUhp+wYrs1p9M84UbMVBFPy2G+wpY3mlQe76PorIj
         BdcFJgbVl3flZoIBXTKuAEy5QyDrvk550CPBuM0BaPiP1ptobzKyoMexCMnhAyyWYhb2
         eroduMh5Mo632NnK1R1O6c+XXXbgDUgXK9GkTR8xuj+RWhStwEU3LdCaqpLTuP5BAyom
         JLuLtzxnLQts4q/BRop4L8fa1X55fFIQ9lfZCzZc9l8GO+rLqQBnXU9BuGzfziBF/XDD
         VVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378493; x=1795983293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3DOibmTouZHMicE5mHPj229m6Ggbgawt0BEFNpJyE4=;
        b=C9notTb3xahrqM/lhAb7rDKciKkxgNT8TuQw+LkL8Rjnu8RzUfqkyMulnkHRMq1dvg
         1LQj0RFRY9f9FBbbvZaS+SC8qwIvLMXL60EDsmLF+yATsyl6XVRyeOsdGIOInD63ASkS
         s7SGnn4292zmyQdUSI/2RNkGQ3RazLYPONVlZkTDL0VaDA8Bm7NHscu1R6LAaWPlgPW6
         NKbCCsKr8rg6JsjRzRxrA6YVVbxM857Nkax2v/U5R3P5eoEHKRovomwT0lXJhCHL6M0j
         3cdYLuc0FuZVKLd1SgtAKeEZfFgBBcjCXyXCUu5CZA9c+6Cw+uw2zLj2CNLu4N6xl9R6
         w7Nw==
X-Gm-Message-State: APuU4Z+DsSnUdxexQVVKGP2ttnssoFq1Xe7JxgzcOZU92lEo5lB2ogJ7
	fLR78xgkljwIK4oeVBrbzJHaCTSMCrqKPDXl8nGYmMfY8VX2j80ONOb0
X-Gm-Gg: AZFdTZf7KozIGav/uAKHPiusSrVoQH/Hf9dnkOhGQ5nxss4mJTSPctBMexMnE1EjKzy
	IFOQ+mZunXV/NMv1NQykxbXvlzRVqbEz/GOEPQXvCjnWDVHshe/6gK6o4rs0TSqfc0DGAqYsEwm
	qnBmbYLGHtWZdSLGCKEV5SKIAEAOSxRaEGH+FDBOWYF64iOrElxLavxuXN6/Me8yiaZ0h5ane8M
	QsbeWM3Y+DZ0tltK/6NOre3/ocLP9nlVNpg5Ump6qMZAeoxCiQ4caQ0HPPla3u/GcgLxfHYtWYu
	Nz/8myP6j72vXg6R12DVH/jOaPx5kZ6ocTBwyLUDqT+UNoKS2KnJmN1xpZ0/v0/pgP7qlPil7+2
	NZPIhBjmB6golq3yda/Uqh33kmc14FTYOt9CqdYGgCX2AY2aDjCIXFHuqpXc1ecUGJen9JvAdh1
	ttfzlwVkMFiNP/6QgfTO8q2esPv/ESE6mif360K+y7wIBjjeAtLwUZ0vQ/8Py/M6rsLjLe/RAba
	vYOlOoHAhqDTK/ObL6XzGJS0kG0i7z554/PuF7cJwuyfqeYwdeohV8EUzqOK2yqlz2lHJmdZ1q/
	gN7SgfPoDWHrU7/gUUBCKfXw9A5HDWjmpf2jzyl2jkd8tFph0AKnyxHbTEquupvy3cezsVTqCx2
	nteSnNdBpbA==
X-Received: by 2002:a05:6402:42c2:b0:6ba:b1ea:398f with SMTP id 4fb4d7f45d1cf-6bab1ea3a36mr810664a12.10.1795378492739;
        Sun, 22 Nov 2026 12:14:52 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:52 -0800 (PST)
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
Subject: [PATCH v1 12/18] ARM: tegra: tegratab: Add common sensor nodes
Date: Sun, 22 Nov 2026 22:14:01 +0200
Message-ID: <20261122201407.23742-13-clamor95@gmail.com>
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

The Tegra Note 7 uses an InvenSense IMU with different per-device
calibration matrices, a Capella CM3217 ambient light sensor, and a Lite-On
LTR-659 proximity sensor on the P1988 board.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 37 +++++++++++++++++++
 .../nvidia/tegra114-nvidia-tegratab-p1640.dts |  8 ++++
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts | 21 +++++++++++
 3 files changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 07091ffa6df19..c839e6159de5b 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -989,6 +989,13 @@ gen1_i2c: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 
+		light-sensor@10 {
+			compatible = "capella,cm3217";
+			reg = <0x10>;
+
+			vdd-supply = <&vdd_2v85_sen>;
+		};
+
 		rt5639: audio-codec@1c {
 			compatible = "realtek,rt5639";
 			reg = <0x1c>;
@@ -1022,6 +1029,36 @@ fuel-gauge@36 {
 			wakeup-source;
 		};
 
+		motion-tracker@69 {
+			compatible = "invensense,mpu6050";
+			reg = <0x69>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(R, 3) IRQ_TYPE_LEVEL_HIGH>;
+
+			vdd-supply = <&vdd_2v85_sen>;
+			vddio-supply = <&vlogic_gyro>;
+
+			i2c-gate {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				magnetometer@d {
+					compatible = "asahi-kasei,ak8975";
+					reg = <0x0d>;
+
+					/* no DRDY (polling) */
+
+					vdd-supply = <&vdd_2v85_sen>;
+					vid-supply = <&vdd_1v8_vio>;
+
+					mount-matrix =  "0",  "1",  "0",
+							"1",  "0",  "0",
+							"0",  "0", "-1";
+				};
+			};
+		};
+
 		bq24193: charger@6b {
 			compatible = "ti,bq24193";
 			reg = <0x6b>;
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
index 8177e4f7db489..866158f055913 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
@@ -7,6 +7,14 @@ / {
 	model = "Nvidia Tegra Note 7 (P1640)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
 
+	i2c@7000c000 {
+		motion-tracker@69 {
+			mount-matrix =  "1",  "0",  "0",
+					"0",  "1",  "0",
+					"0",  "0",  "1";
+		};
+	};
+
 	pwrseq-wifi {
 		clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
 		clock-names = "ext_clock";
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
index 9447203eeda36..7ccda46c42af2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -7,6 +7,27 @@ / {
 	model = "Nvidia Tegra Note 7 (P1988)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
 
+	i2c@7000c000 {
+		proximity@23 {
+			compatible = "liteon,ltr659";
+			reg = <0x23>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_EDGE_FALLING>;
+
+			proximity-near-level = <50>;
+
+			vdd-supply = <&vdd_2v85_sen>;
+			vddio-supply = <&vdd_1v8_vio>;
+		};
+
+		motion-tracker@69 {
+			mount-matrix =  "0", "-1",  "0",
+					"1",  "0",  "0",
+					"0",  "0",  "1";
+		};
+	};
+
 	i2c@7000d000 {
 		pmic@58 {
 			pmic {
-- 
2.53.0

