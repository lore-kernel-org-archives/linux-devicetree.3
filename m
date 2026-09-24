Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2D40961C
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234108; cv=none; b=rdsoKmandJI61sTsd/n1s4DwSPVexsGxoBYcqMKelwFQve1P1JVuZ6uxka1vMUJsoGmAIsu9JMdWplaE15qU4CvhhTIGvI+Jm/pssmzxhF3+TibPIuUyp36spBw+kGM196d2ZfG4acnsk+YrL3m9T5lvUysZekZye800Rtlt34Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234108; c=relaxed/simple;
	bh=6eVxT8+9oSfFOe4kUJFBQgPhIl74kB3Vc0rCC/OPSNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nb1K6bCQbaO/hhyMUdOPfJoZwoNMuG5jL5LZshQR8xTcoukq2nGMjyRebXr+XEMABzLjyNVoIVlLB/vT1+NdambfwQD9cFDuMPBuPCWckMa/a/51AqiNZj/ML/Q80++Vz9jntsPfktuItBVdT/N4Ep1ls01W5xTuhcx9Dg5hSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=wKMJHl2g; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="wKMJHl2g"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso2603349a12.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234095; x=1790838895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrjq9fQeRRT3Dkn6ja90PvKLpuXI2Gg2RkQogJKUx6w=;
        b=wKMJHl2g2/1dcja9ttGPpkH6fKaG4eJ3lz5zv3tSxNpNxYHods6NvoUSrko+toPkAR
         1q7aVdme2uBkQEpWikmxx5ZdJAx+QHT+ndzLWh0Wc07ZezT5BVM+WoGgSJ3CZxS8xlzl
         zK1jdkXpGYrNi6afLKgkB+C6n5lvECkUQOD9iqwo6TBysxQ2AYbMgmlR8rZASaBlZoE8
         HpK4W3gCioqIUgzoa8RHhgMAvRvAF9wXnvhcI4ywxwEWaXFfROXGQwiKAp6Eau6vHBh6
         GA9NX5bj2Sq+Qx8xbvjJ7iiQ1POqj82sI9j2CH5kiXKEKP/W4rKI3R7OxUF6k23AlI0S
         63/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234095; x=1790838895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrjq9fQeRRT3Dkn6ja90PvKLpuXI2Gg2RkQogJKUx6w=;
        b=0T1r2mnDU68XLFuZuw7jZESahQvhlpqGliWfYhOyjNugiMdwNP37JyB6WZe6eui3uq
         bOZLLvFHI59HwticF4CdOm+eAq/QP/YjIXufgv3Ih3ZzHcn8RF0NRpA3Z4tmrhHfwou0
         Af8n62gvm2E7kAKub+SJAOiAnEDNaRh6B2OySm7HYbsKmLbhrANyLXkxUksgAXGQnWpf
         kfb9zj3i5qU4cK6e8+2fvMSq1ZzGmHvrcod+dVGIDmMCTzWHEeCHBY+mV6HdscLAcHNo
         zzrWL/MJ9rF24LTh4z+4Mg9NYNRnuvT9Nq+iMYyZI4F3cjawl8A/9Kdn6urD+he0KU1n
         xtrA==
X-Forwarded-Encrypted: i=1; AKwUvBwYu80tsIaV7BhqjMO3KVuf6nvRFnZsuMYO9m83kn51ppt3+Z8ygY+c2229a2v9dOGRRT71UmHDLylp@vger.kernel.org
X-Gm-Message-State: AFuF++niQL4X+pUSWdeYT1BvtNuREe864Mq/zaBV+ExdUlz2D9stxS+F
	zjM8YT9qOpmHX38IsUWkq0+HJuqu5HrW8e/uhkWcgDUT4Kob3sEMNYBj4o4DSC8dSUA=
X-Gm-Gg: AYBFou35M0kLOIZC+z8INeKJvoInwmh+7g5BtqJJAPrrRBOR4lPHapNxzsdNY8MB4aP
	TAGnzJlz6MV6az2nT1gYV3WVGMBjqncFkirmZlrsWMaTao1AZqNZMc6yhktILiwLvqVF7o2rD13
	hBlouN8w1CdYxbV4rUdyLdaHFrWVLCV7ka6ZgpOcdsGOgr/XhDi8iJtFbeWTbS8M/9PJdmNs97w
	NGb6eYjL3tNROoQtHuHFcrNV/+sULpPDOTV+SNxyDWw+cYRwKDmViULRBwxfDnAU+Koqm1THPxT
	1gBch+YkgwFycfHVPb0pbj7UGLwzqZUTv8GrbG6w/Sh9KQrbxmu43FO711MGq6ioPREWpx0nAMa
	x85uEozz5xLVNeVNwd+j2azrLLQMO/p5eu9/2342oR/DxzCNa7zqn/di6vywXxl+7FaoH0MZKvI
	iTmq7Yo9MpvNcZpZnFmCJzHgZgPYCfDumpPk4qViuvOwOGYkrd3FVrWehclLmEr4lPJXMoD3O0Y
	JN4x+Vb0Cu7bC3zs0LaYY17GAVHhEFxurHQwl49/434jSE=
X-Received: by 2002:a05:6402:1599:b0:6aa:936f:5d2c with SMTP id 4fb4d7f45d1cf-6aacc83e324mr889306a12.23.1790234095400;
        Thu, 24 Sep 2026 00:14:55 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:54 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:45 +0200
Message-ID: <20260924071445.441822-4-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924071445.441822-1-adam@wermuth.pl>
References: <20260924071445.441822-1-adam@wermuth.pl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROCK 3B has a 2-pin fan header powered from vcc5v0_sys and
switched by a MOSFET driven from PWM8 (pwm8m0 pins). Enable the PWM
controller, describe the fan as a pwm-fan cooling device and add
active trip points to the CPU thermal zone:

 - 50 C: fan at 25%
 - 60 C: fan at 50-75%
 - 70 C: fan at 100%

each with 5 C hysteresis. The existing passive and critical trip
points are left unchanged.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 908bb4425e81..815f67988ab7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -24,6 +24,14 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	fan: fan {
+		compatible = "pwm-fan";
+		cooling-levels = <0 64 128 192 255>;
+		fan-supply = <&vcc5v0_sys>;
+		pwms = <&pwm8 0 10000 0>;
+		#cooling-cells = <2>;
+	};
+
 	hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -200,6 +208,45 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_fan0: cpu-fan0 {
+			hysteresis = <5000>;
+			temperature = <50000>;
+			type = "active";
+		};
+
+		cpu_fan1: cpu-fan1 {
+			hysteresis = <5000>;
+			temperature = <60000>;
+			type = "active";
+		};
+
+		cpu_fan2: cpu-fan2 {
+			hysteresis = <5000>;
+			temperature = <70000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map1 {
+			trip = <&cpu_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map2 {
+			trip = <&cpu_fan1>;
+			cooling-device = <&fan 2 3>;
+		};
+
+		map3 {
+			trip = <&cpu_fan2>;
+			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
@@ -708,6 +755,10 @@ &pmu_io_domains {
 	status = "okay";
 };
 
+&pwm8 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8>;
 	status = "okay";
-- 
2.43.0

