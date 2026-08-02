Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2583BB135
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682286; cv=none; b=YvT8ILbQrwfuOAuij2JMtSE2UMh5cq4pTs1qsYDraNmvc9UqbKwMihrHbiZYKPJDt97romowI0IrZErZP/hfEJY+BARMfD1BTFkLVM5GHiQ9uxa5eq3f3xexjs0PT67kUuX8nxAbf/fbcwysSxKy183HuWNYTybfNgaCq+Toeec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682286; c=relaxed/simple;
	bh=iatHbSUAx6NqX4truyW0dLU2vWugwQuggWIUae2+bsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDzWB2Q4NVfiwoaRlvJyQyHP3hZwjRKEi4MgTqSBf/VmpMqwpRSYlVnN16VXRZcD3zxzzJojawS0STLzbemGuV+9/y2d6trkH9uTX9Qwx6s3S4D7l4lf+LkpzV31shuJohiRmEAHYMb7iDBeI8GKv8C9KovaORUOxyt/XfWI4Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHmlsh68; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHmlsh68"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso7626465e9.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785682283; x=1786287083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92K+kN30Lx+dxFo4FvP3f0D5FrIqEMjJrJBXkirUl40=;
        b=mHmlsh68WPgp4zppz7LBtn6iYDSUGpuVjJYN5mdD7MeE/JPMoT5aNfI4rjvA0I9U4W
         HgSnYF3kCjvBdwHoP4Cvkuffie0pppLzeF3l19NwabwQWR0im3ZB6QOx93+1ouv0J3+T
         cm+jrgAI2KAZ9v4ur6YyuS2j+gSqaZQxn2xl8xbCQ38fDtCEyFkQOj/40VuZBhWLj8bs
         4K2zCLFTeP5cL2hzOrwCnprdQ+1iKwoUYzJKxXfsBa2lQOv7K4aSz85tquF3EJWqtTRW
         pAqp4GYWFPyhBohauKZ7OBmwRbBWQ08fhZX/ooCtN9PBDgCBApJ1dppm2/41ggcEc+Go
         EVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785682283; x=1786287083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92K+kN30Lx+dxFo4FvP3f0D5FrIqEMjJrJBXkirUl40=;
        b=kHHyPgjk/5DJfuCQB3W+MxDhNVjsjoa5RNpdg5d62+ys9ofoXQVD3kM9UhYsXDS131
         IfYm6shHqeEAHuOo8rWpbQxrh1DBhOktcyDd0wg5+HXMb9wvh+Rzy6O1d3hujbirQ6Ce
         iuYnnEE9FAIpw9cHcGLGqhubTp7U5zvSD2r+F2fck5y17lI4CJXCz4S6AaMeaT6V5936
         VC2ZcGRCjrZl8BWlKc4domhXucGzDJMq/8NWgFQfd6IbWJIpVDNGVfMTfEpDce24iKsY
         Z2B/Lx7o/7ny61Nss156Lz1bc542dbmU9rs9DKuAbMoVRE5hMcD0OnXbRxQTHpDCxCeJ
         WVww==
X-Forwarded-Encrypted: i=1; AHgh+RocRmLlUN29rxNqDbAgj6iT7mZEy31jSpFvR8MK+Vrgla6Rq4Zd3VfesS32k6v5KvyjEyGxIqn7H1ha@vger.kernel.org
X-Gm-Message-State: AOJu0YyhtYX8BcOWjSsCs+yhQReSsDvYqxVygCsUUj8VdGcNfufAajMF
	MXtyBa04S39vsYWrA8Dvr559K6ym5gMHXyiKizeskt7m5C9QxnUzv/r/
X-Gm-Gg: AR+sD12n6eIJu4U4BWkTpm8COIr/qQzMNrgAHm5QoV0FwQ1CGBxzZmtnXJbxyZ1j5Ys
	6qmxv2e8fXjMJLXsC5temSLoVWASRQ3sYtHo/NTsG10+PSR9ZXaxtrOEKzMgHH10aSFbW/92OdF
	pdEbsZtH+eORSdFK41+UP948zIT9JUYe2/ieJiTFsYHklFq9FCjjTMxlYv5sChhUL0+Sc6XyKTS
	71Xrkn45S0L7Lfvn5aO9aiUR4IcL0DNfhTDtjk+eIFZmfStZgKsUahXbfjQujOjJIhpVBNdOyhF
	oZKWFE5zIc0eoRGEGT/HUgLFOKAXlf3vdQ84XRHC6RudJ9FxVxTnUuRdorwhNPUJlsbEdiAgFzx
	Zsa9TdUATWed37BhJatmpAWmm5TIG8tUojMVHMxDj+lsqY6uzLHbLsrEQP/z61e+Nwm2Ee+62Z9
	9MAnj0HL31JiRFZUE2fDHx2gGfc6o4zIz5FmiTOABt4p5REE+0+9f/yFiZ+8XSMXh4QFZTLXDPk
	Me/6AKeBkDBUl6sH0Y8hK6sTN+vbID07j/mZrdXoxy85Z8GRrZ3zbkDZJUZIj6Mw1hZ82x6W2ne
	X/ww9SqN+ooZ0V3fWrsKZhyhoBc2atJ0g+bYRzgQucptu+MHeFlCqo8pHV5TNoDxJiDBy/7tAOR
	0nQm6ie+fLX0XJubvsirrwuCfZKVobNMM0RYK3+Irjw6fG/PrGji1W7t8UHmn
X-Received: by 2002:a05:600c:840f:b0:495:4b24:1b64 with SMTP id 5b1f17b1804b1-4980c601d19mr130181345e9.0.1785682283088;
        Sun, 02 Aug 2026 07:51:23 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm234526335e9.13.2026.08.02.07.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:51:22 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add USB OTG port
Date: Sun,  2 Aug 2026 15:50:54 +0100
Message-ID: <20260802145109.728793-4-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802145109.728793-1-pbrobinson@gmail.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 5 has a USB2 OTG port wired up to the
Type-C that uses the same IP in earlier generations so
wire this up so it can be used.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
---
 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 +++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 25 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index d998bfae91acb..e5030da60f9e7 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/power/raspberrypi-power.h>
 #include "bcm2712.dtsi"
 
 / {
@@ -239,6 +240,11 @@ bluetooth: bluetooth {
 	};
 };
 
+&usb {
+	power-domains = <&power RPI_POWER_DOMAIN_USB>;
+	status = "okay";
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index c73ed9e066662..f650a5cd8462d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -55,6 +55,13 @@ clk_sw_baud: clk-sw-baud {
 			clock-frequency = <96000000>;
 			clock-output-names = "sw-baud";
 		};
+
+		clk_usb: clk-usb {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <480000000>;
+			clock-output-names = "otg";
+		};
 	};
 
 	cpus: cpus {
@@ -693,6 +700,19 @@ v3d: gpu@1002000000 {
 			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		usb: usb@100480000 {
+			compatible = "brcm,bcm2835-usb";
+			reg = <0x10 0x00480000  0x0 0x10000>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk_usb>;
+			clock-names = "otg";
+			phys = <&usbphy>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
 	};
 
 	vc4: gpu {
@@ -756,4 +776,9 @@ cooling_maps: cooling-maps {
 			};
 		};
 	};
+
+	usbphy: phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
 };
-- 
2.55.0

