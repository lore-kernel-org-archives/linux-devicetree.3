Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008661;
	b=E5d3m2x1fn0+mZAfX5TCmPBQVeo2Z8fxHm2fubx7cG9BRz+wqNHU2Mwve1+qBOge97oS
	 INu4jpBYACyckHvXSI1aOX6VR75D7eSVbwqbTB8exU10uLRKmqUsJCTkJkcjvuUdXKGjI
	 BfBLRpasnQfF3NlDHxf4clBA1cx5zOHC0fy23RIO+ZFfai+U8nOywPdsZ5HIrY+uLUf0f
	 x8fpeGOGV7jrsvjW47GKLXgm3tmiVwO3IhyYPuknhHu+kc0piNkRNMfmHxcULeIszYMww
	 avI1ocWwxrtXHpOMpRLfYeyUCYQL0YIHrGRIfFYvVIffa1oPp5YNpePQX+X6KQCLiPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ru9WJD/77wcdb27Qp7kbTXOCJ++kNaqReohvkAqpaW8=;
	b=d7Ej/m5JcEaPGx8WbEzCQoxtur7HPKY/kIqYSWoOncu1HqxRQEN6WcDoqydWnCrs/sO+
	 1tmyMZQmUjrVWebh1dHeHKcfMU5gqgiAF7lgGnjcmtPGL5K1UPF3cEziPxWR4xOP5+nA0
	 /4cKfPHi0h9Lp7tvaJQFf1ZL47dsqFsCXg6vE7YAMYRMe7+FXaMKpFDumUvTIodVR+1uQ
	 i7DnwyJtlgPFCdn8PQl7KglZIvgZ6n/O/iirLWjmUwYRrpsXRN9vW/L5SoNgB8vMuTT1U
	 9LcoGVlbxGAqi0UhaxjLDv6zA3V8etgQtNQghacZZcm4IHzGsj7WVRFRYLOkIjSt2Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=smgC9F7n;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6370E60A5BC4
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6370E60A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=smgC9F7n
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso28502125e9.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008660; x=1793613460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ru9WJD/77wcdb27Qp7kbTXOCJ++kNaqReohvkAqpaW8=;
        b=smgC9F7nTkXaaPUocsT+v+reAxp3hs8j5JZu5+RSkgmW2dWHf1fgCwGnZhW6DDs6zE
         wczVWDSHjJE9yOSPEu2W+wYDXy+OaJR+uxuSBOjZ3GTbCBgzIvzZJtzuGDjJRsWWqjT6
         DVOMKURdJo6v/lSeUX1X47C1YSLovqlUciBK684RaRI4KrRXo61RSWVLYPjbt8y0WgQg
         LV168PQLMfUxCfj6ZJqhunnQSnkaqjHxNKjLzSABI28Jz0uD+XQLv7RbPAal9YCDpcxp
         K9thwBZvYjusLjiHElWsAvlm1adqGemGr+bbmDy0chdxJvSrw5pf6FF44W8tPvcigjCt
         iSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008660; x=1793613460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ru9WJD/77wcdb27Qp7kbTXOCJ++kNaqReohvkAqpaW8=;
        b=ez8DnJuiqAwx+0tTtsiG4fhryYn3eEhVK/mwj1Ls3N/vwzaS7H921SbYWLYlQGQNaV
         5Xe4TWlhlVbEqBRmndEkY0ZhLVxouwZhvz66/x9bLBODniHBrVoCHX2MkWrpTkKnjbo7
         4JcocESqEzan+e2LfXQWW4FRDULUDwD2iSYlK5R1kKXSacHR6167VysZXh6z/2GgYE/J
         HkwM27hXXASFPxWJZyn6qMp5wbVtYYhUTbfAgiCMtoQaHuZG5n6SouAql0yzIMUtz5LL
         b8/bCmO06wiGfuae+tLCWMrqqunJzK8CPE3PvmtMsNPckLmP4S9Rd5Vu1w1i4BjfjBSU
         ttKw==
X-Forwarded-Encrypted: i=1; AKwUvBxIf1ZaPUwLNKYbZxQZomrHZUbmiNKsWim4+Gh/e+BmussWZg2g9mmje5G/rEHG2Eu6Vb+/vYQoPXN7@vger.kernel.org
X-Gm-Message-State: AFq9FYLPE8ROQOwMDwShx8A6VwiQfrZSnE2IcOda346+5cb+Fq1WAzj0
	sj1mEl3llpfxBQVbb6IiyKyOdd4dVMwhtICHeaD4ZXY0uLwrJAJxjuxD
X-Gm-Gg: AYBFou0rLVXlcqBDOsLbWeUIC7JJJcvJFSiDZKgk5LUzIJ/X53oEby00+jFUvd4iLEl
	M7jq46T1o9k2njWx7bRWFm6DSAHPYU0j8JnbAN6EgxqZrw/RfotocfO1UQ8VmvMm+leYMMrN+4x
	/TJDmXG97lHLr2ctHQtx/95oif9dAl0ssnq0Vgzul2Mmyqm/Ici7jA4+Le721IJcRBjZLxoxbb2
	tptZDZrpLqCshJEVmdNImEff9LJ2fsurPTgjb2yH5Dg0hIF4yIW/Gsee9sr8nMiI8HxFAFvvczj
	NDHygXTsdq8ybSQNc/XD9bSxhDflo0MOGUpx6BRGdOVk4LHa5VvZ/Ff0evEs33cQJHIO+F4vxm4
	jLQwqaE5oIyWV/VxULIlIeh4gzlW3cyGMKnlHoGqK8kC34npMweCDnmrbgNR/PFGqB4+c4nb9KU
	BFxgX/TMxN4NrotVp67u1Bo1SBeuq9bKv1dU2xIhqUrFqgU7LvzgoyqxLY5kegH6JglwFzUO6KW
	kG/9UOE6m/BMyqMk3lTNFiaf5wO197MxlszhEhFqqFUiuY5TKphyp61H6vUq8qyodHDGfmJU7j2
	ZwgbYCbp/zt1/EGrtE6NGHZyxFXcByeN6CIKMqFPcSkVtXfCA4tX9wM3z8jx
X-Received: by 2002:a05:600c:3b93:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4a35ac96004mr129196455e9.12.1793008659520;
        Mon, 26 Oct 2026 02:57:39 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:39 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: airoha: en7581: add thermal sensor nodes
Date: Mon, 26 Oct 2026 10:57:10 +0100
Message-ID: <20261026095727.31708-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add thermal sensor nodes and attach them to the CPU node to control passive
throttle and define critical temperature of the SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index fbc5ee47523c..58bd8b318910 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -81,6 +82,7 @@ cpu0: cpu@0 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -94,6 +96,7 @@ cpu1: cpu@1 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -107,6 +110,7 @@ cpu2: cpu@2 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -120,6 +124,7 @@ cpu3: cpu@3 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		l2: l2-cache {
@@ -293,6 +298,39 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&thermal 0>;
+
+			trips {
+				cpu_hot: cpu-hot {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_hot>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	clk20m: clock-20000000 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -319,6 +357,15 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		thermal: thermal-sensor@1efbd000 {
+			compatible = "airoha,en7581-thermal";
+			reg = <0x0 0x1efbd000 0x0 0xd5c>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			airoha,chip-scu = <&chip_scu>;
+
+			#thermal-sensor-cells = <0>;
+		};
+
 		spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,
-- 
2.55.0

