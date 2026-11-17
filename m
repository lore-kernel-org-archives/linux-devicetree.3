Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895577;
	b=jAlImdjC8tZwCf22WZIfgAKH8p/jEcl+Y07b6LO4eU1ZiPcuAVbAgtwEnqlXUeXq6V5+
	 hDrkW+sHW3su93XmuvjxtLaN/CxC8yMV5Roht2bC0SYmFD5ccK6xnT0HRXdK/PQGtzDbI
	 0vcAUJGs7BM1bYWFbMm7+0Zouve63CCLeT3ceKk/DeGJLAoO804Yc0gx3BkGff2UiQ3pr
	 Uv42IVqzUFZYc9WLY5bZdIMfaMYKP+ARd7Za2msjkewiU2PpEKOKSOIez3Q3JFAuadIyy
	 tfIO+7Rc5TT1ZwkRQ7fKEtBGLZol8z8d7BAJRn49OZwJWVcDqxfZIji93SeQFxPeCig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L5HQEogAdp/4jA7w2UsfMfPzuR6qmlgb42NC9n7phLY=;
	b=vWqIIXIOXh/SEFNL519ovL5ShhY4rzEUBOxCaT53g9OkJtEzVTeizCQiEsziw9HPNQmF
	 WIUzO5NvoGSQjA29PusBYvGsNs7BYs0HEPnPagF5vNazKJzDJcmfGR9mqjfkpCIVHUxiP
	 960REe/QeMZQMCnfynwSHwEXZfpUYtbs+HvxaaT+8pBI5tkbyTdEgLngr2z/FCNi6Lvyd
	 hiDBI+C7H7tkyHXp6V0w2tZqfEvvnwOtXcZC1kJyaoe5lp4y+8T0xVsYS12iLkt3dh1pY
	 9Vh/W/x9/vAWs7wNFGQIKOFwRcEcnKqS3Z69m/rX6ozWlJo5CCnpteQPH20pBnXcHfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdZQ7pNY;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD0F606A330
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD0F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdZQ7pNY
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1812226b3a.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895577; x=1795500377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5HQEogAdp/4jA7w2UsfMfPzuR6qmlgb42NC9n7phLY=;
        b=kdZQ7pNYSU5yK2H9f3vmy46m99eGyCqQ0pzIxGYPEmGV8jzOQKEZ6R9an9qcxffvgg
         F43Cp4UfXZky2tLTxvXxqY93CQpvOK1T8N+COEoE/zcYwmD/yM9eO7N4qcyYtC4odqCZ
         aXBMQ6RS6FIpRMeRLJSR6C3uazGJRsunnB15mGasUnRb+sCDY+Pa483c/GfbTCaodfvo
         uFuyY5XiLw24QckdxpUz8itjhcbR+GBXbL5mGW7sato7PmAdcIamYYxqKwcItiqTHevY
         o4a9Dfil5ndxuih4YEwO/Hnwm3TQfy5BSijWBJOihtUFSTb79/wVVSB9Uj+naiBZRfI+
         bLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895577; x=1795500377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5HQEogAdp/4jA7w2UsfMfPzuR6qmlgb42NC9n7phLY=;
        b=qchXTTzcOhuayZ1fro7i6Vvzf+kI1/iF5tzIL33cWCTBqvVpVmMJYYeBbxeYfxQ2E/
         TgzIcXsuCOBOaYj+oq9O2285sXcFlL4cAZF169L2kIu4Sm0JxdXO98mLQoS0aG4KScaO
         8tKhfn9zOu8EUoakFRk7UEljumXiYTkScGKspphwmTAElGIj6S5ncXRVAEywtRE6WXv3
         mxnDT1uc+sfYGMYvTTecrTHyHziXGuL5Z6v1lB8exjTirnb0D85wwji0DtSao1L7ztDT
         P9nZLFmEk+V8nqBKn5roS0fkt/+sAkdDEMEIwojievL6heaVYBSie1ShC8D94vnWZGzm
         tO9Q==
X-Forwarded-Encrypted: i=1; AL+hErFe5keqawmrhRQV1vEm4EWMN5uZgUYlYRXrfJbaL64npYQreFnqEZEeTHqThsZE4YPm0nTpPEpvTPgH@vger.kernel.org
X-Gm-Message-State: APuU4Z+J7y3p9CTRVC6ia4wRpw5VWiK+BDpLW7+80sArzh3zWC6aP5uC
	wq6E9xTLzr3ub/yrH48L4xzHDhM4T4mqW2AgU9j72Ups7c2OLUaWgDIU
X-Gm-Gg: AYBFou3WFXlxVYsKFS3Pb10LWE32fk4f4AsxAkjq4x835KKYF9zvm1av97TNMx9uku/
	TTFH+SRtaXyUWKaAixgkwk4zB0G2T3XAM4n2Uc3yrU1kBQSemOMRrMDST7tKB2YmY/89SBUofYD
	n4SsBKsch6pEoaiYYzAnRkoJvGadL4fx6MnTlFhpFx8U0OhEzqlJTah1pmuqVFq31R4taT22OVS
	hi17Pp4rxGAiaEVT5ikDqsk8JvShq4oQTQU/7PwgwWn1pu2OamwfrWdUGg2xc1YTWNn1ia2MO3Y
	WbEIBzElsLzkDPg+KbeIdOFHrfD+OzuQEBkv0+OQzdDZY2Cd3jUq0ZIMR4klKbLCtJmQXaTsLgx
	It7lLiGVDpVxkSehloc8E60QNPdnmjvzsqBfAX/RSx8Dtv13WZtDIUHgKiyaNVPn+o93Pw+kvq7
	Jy6uPUG1Br17cB3xyoqnHOfYXl7OIYOAeZmYIS8aqhNWB0MwU7Qkrm0yYbHvr00Nl9uzo2i3b9B
	kfCbxOodYleRP5ugL2UlMVYuwRrX/cM3hXC3WsYj87vGynGh+K5a551x4S0TDKiOT0Qvr/lnLpM
	7SWsKA828AbEpkqjNIuNWUNTmJYZEf6VTuW+qCwU+ZYzU3kP2WInqOYFEADO3w1rlaSM7bM1Qd4
	SLHVQxSCMmNY=
X-Received: by 2002:a05:6a20:6a0f:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3f7a7fc6dcdmr10376493637.69.1794895576986;
        Mon, 16 Nov 2026 22:06:16 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:16 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 4/4] arm64: dts: nuvoton: ma35d1: Add thermal zone
Date: Tue, 17 Nov 2026 14:05:01 +0800
Message-Id: <20261117060501.2611071-5-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060501.2611071-1-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
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

Describe the SYS block as the thermal sensor provider and add a thermal
zone with a critical trip point for the SoC.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..986f3cc4176b 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -63,6 +63,21 @@ gic: interrupt-controller@50801000 {
 			      IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	thermal-zones {
+		soc-thermal {
+			polling-delay = <1000>;
+			thermal-sensors = <&sys>;
+
+			trips {
+				soc_crit: soc-crit {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
@@ -86,6 +101,7 @@ sys: system-management@40460000 {
 			compatible = "nuvoton,ma35d1-reset", "syscon";
 			reg = <0x0 0x40460000 0x0 0x200>;
 			#reset-cells = <1>;
+			#thermal-sensor-cells = <0>;
 		};
 
 		clk: clock-controller@40460200 {
-- 
2.34.1

