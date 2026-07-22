Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DB743B6DB
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752450; cv=none; b=NN7ewRGT3YFH6tKLo61hhYehqeByLVrypoqmbZRDQxn5qgOgQiF9BSOWhdO9YbPD+qgBFymCBsZ9ZR6nxhj6tNYHxz6v1Aq+rAzDcf2oICfBUydvdPitmNyK7Ng8vHaCBEz8LhmhdSPpzp9wOO7SkEmqLlrBjG/P4l4lCJAtJ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752450; c=relaxed/simple;
	bh=6esLaWMxVzWgBgD3LBUpQLC+g+cCbkEItwcvYGe7Tc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XtzhIlXMSxllpHEtlxDsaUZrQAjVim4jCGh0X8DNgBFLLQbpnoofnVO+b7RnHrWJGRucGJRO7rPcWEoFq8UG+GJerpZMQIkknPZGSztDwFYywubX8RIClPrYcTrnE7Asotm4vrC68mf9ycc3MygqjBm6qt5hjqCND316XQZkUB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKub94+c; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKub94+c"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso49883305e9.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752442; x=1785357242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=;
        b=AKub94+cdO/vzVJoDB8o+/wBEWWTXCGwD7BZOODijafDKZa6BNOG84txtRQTU4GLJj
         7Rk9r/P1DQ5OEjIf7ga6FxdloZUUwPlZ9BUodWG7/qwf5mnPlBpiYDJAuKD+KrWYaIJ3
         tUVDyyhaiuhu8jCjPMX7gmBF5vvtNY1EmHhIQ4wIT70CdAKWmLFEaTX6vt1q54xWo89Q
         Qg72JkXFUz9HPd+lWwuFK8ObWqWgU6pQP+IRi8fn3URQZEkZ9QIFM9LCnwt7GbuGU+Cu
         v621SqcA2F7v+bNXhuY0FPcVLht/xFt1co7AIy8vHQeYET7ya3RWs1Zg1Hy9vBVblXtv
         8z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752442; x=1785357242;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=;
        b=T6Ie3tdxYcpAtCLOw1kT5QBQWjxCLxvDdFQeiNqsCSQOpx0WLGOClc74p72NQfgf/5
         yL2wo6Z42Ws4iMD9+MC+Xus/JpuZfHaBpGrPu81mG3BLm++fRHENoH68C8k6hESB9aZO
         rNXDicQTea5qhpPhWLHKLXdwg6xxY+yyu1O7czvaY9IKnsz0rD4ZBF+AhHrJiWDofvcA
         jFCmcIKkvKkKvUYVwTEvIM2U2vMG2xqkMDf4uVE+RJZMG5jUxfB2Q8GvU2i6qRXR9Lrm
         nvsiFLhBYifLzFIT7IMayOw7S7Dm6TEPHYFXzQgaK55M4Yt41pgB8Cdq7fne8OXOf1bL
         KWtg==
X-Forwarded-Encrypted: i=1; AHgh+RqNOBSGXGdjjrG31BZk/FcAFxDiugJYNTrrLMRhigdcuSzmuEZxZ55vunrxR2y4jJBYlGT6O+2FFUAk@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAOIAkvWRlHSqHiz/F8B1kYoxEMzwASe8FB3UHyLWgpYAr7MN
	hZovsSeAkeZAt2SsdkquFmcNhoWzMIYuTnhtm4Dc4wOlooSFtoyUxyV8
X-Gm-Gg: AR+sD12Pw5TWHA/UJ+GNz1KzgNMopvk0TT0HflXwJzQWDFa+xlwhbOn8WyaiG+DymYn
	o+ZWYV/V4PBAWe1dhjmLbLPZp6tzheJCQmh5IAlYdI+PXFEUb1wrvoAGrGcgEErXZ2AhrNmOnsR
	5KJdelG/WXt9ave7iqWHJprxmIzz+1f9nkycY+sojMqETy+k6vTKEQ4Y6Flfc4P96rRd6l7RYWg
	xaLmVGYTU7V99u6l+ZtCxgaJESsGspnswc6CBYZF7InzEnczaK33logBl2yxKP2MxQ2Y3cWUGK7
	TX6ZzigDv/HXHr2W8irEG0fptIvrr7sTAVMnowv3e1Dt7KUGePwCIj3QkNoSpV1yLOz8chts1PF
	C9EeXtuC0xBan8p+3HKLViCIAp8/fWfp245MRozdpHk6COSyXhPyVdnkLuYH+XfvaVg/f7YK6FJ
	6wcB9uyjxlAgOS1JmawbyA1QBF/cg+u9QXr70=
X-Received: by 2002:a05:600c:1390:b0:495:5a0e:6d8c with SMTP id 5b1f17b1804b1-49573ce8e74mr3160235e9.27.1784752442311;
        Wed, 22 Jul 2026 13:34:02 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab2f0a2sm63134945e9.1.2026.07.22.13.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:34:00 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>,
	=?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
Subject: [PATCH 3/3] ARM: dts: sun9i-a80: Add thermal sensor and thermal zones
Date: Wed, 22 Jul 2026 22:33:41 +0200
Message-ID: <20260722203341.2917852-4-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722203341.2917852-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philipp Rossak <embed3d@gmail.com>

Now that the A80 thermal sensor is supported, add its device node and
the thermal zones to the device tree.

The clocks and the resets are shared between the GPADC and the THS
sensor. Sensor 0 is located beside the big CPU cluster, sensor 1
beside the DRAM controller, sensor 2 beside the GPU and sensor 3
beside the little CPU cluster.

Signed-off-by: Philipp Rossak <embed3d@gmail.com>
[soeren: rebased from the 2018 series, fixed the interrupt number
(SPI 115 as in the vendor BSP; verified on hardware - SPI 31 stays
silent), added critical trip points matching the driver's emergency
shutdown threshold]
Co-authored-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Sören Hantel <fugininsane@googlemail.com>
---
 arch/arm/boot/dts/allwinner/sun9i-a80.dtsi | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi b/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
index a1ae092..8e7f8cd 100644
--- a/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
@@ -941,6 +941,16 @@
 			#reset-cells = <1>;
 		};
 
+		ths: thermal-sensor@6004c00 {
+			compatible = "allwinner,sun9i-a80-ths";
+			reg = <0x06004c00 0x100>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_GPADC>, <&ccu CLK_GPADC>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_GPADC>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		timer@6000c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x06000c00 0xa0>;
@@ -1250,4 +1260,62 @@
 			#size-cells = <0>;
 		};
 	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 0>;
+
+			trips {
+				cpu0_crit: cpu0-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		dram_thermal: dram-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 1>;
+
+			trips {
+				dram_crit: dram-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu_thermal: gpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 2>;
+
+			trips {
+				gpu_crit: gpu-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2_thermal: cpu2-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 3>;
+
+			trips {
+				cpu2_crit: cpu2-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };
-- 
2.43.0

