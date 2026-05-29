Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8347C3446BE
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062539; cv=none; b=GyuqnoelevMwS4SeFHl0xgUrbpSKxFPyYVKiSX+o5Na/P74dno13GxTNNP+6EJBWgc73wBs6tOm1JQf4Xfz3sNSgB1lmVEV+L8zDCOp09/PjSMx++9R79COSOZKJpKn1Y/bgyjMv2zgxxBzTsLJz1j2TvFbusxLJABjCHaJuW6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062539; c=relaxed/simple;
	bh=/lPWWE9B0ZByTLrH/vobSrqzpYZiQP1AwrRHGr/QMHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPwo1cF5eESayzXkg2KeWKcPcme0b+JKCuopi7pSGL13X+pKWWLiSeal/6mESinWdE6+iLIninGnZjOwFkm4Kj8Y5d8mQWEJ/TlCzUJzs5rIV9wa8JY/xChE5BM4D2ldULU7YeUSwgSdt5QNNs9S6PkV2mUIpPnqyQo7ueuRenM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBFimF4X; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBFimF4X"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef29c5561so375336f8f.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780062536; x=1780667336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMxhIukJleY41vOIZ+SD59yfY87aAB1ancR/PBsfkqk=;
        b=LBFimF4XvVLA1+tDY9V12AIwAGKzTUGXa72so+h0d5XTshbbVSkugU0ufIiMcykqRJ
         uLrne6H4kBEW7B85aXid18LVQojJNfQpp0AtB22bb/M/pnX4FgkFFV6RdNlIbZD604SS
         c2bqjQuGoFu5l+kAK2xTZ3KYGYU5s/mRwIMVMWgb9g5pLbcFc4s7qq0sSpIyZ/ilGIuu
         aNVx3SaB5KrYtnHhEI/6R6eYbsOz1q6g7YE3fWv8qFK7y/MYaEH1zIgts0t9K2lVD4lW
         shvaln+iusuacB+lqt+sIBrw4HwTKSGTUBqzTLlWAb02DJGgZe2wtvG9jYfGXu+MUUnN
         V4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062536; x=1780667336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMxhIukJleY41vOIZ+SD59yfY87aAB1ancR/PBsfkqk=;
        b=c71C11SYEeuw+TbCfpnAfBgTQSC4k1YXxKx099GSGuN9LODAEHhveBu4Z6LBDWycjs
         YpoQyp3+xSmFjSbh8elff26NFiRO0hjAXAButr4J+tBIy0LZ6pZ5qUSGnwbOiCvdyH9v
         oCEOpK0ydNk7XDXMjjXB1j6A6OrN9u0DD9AuYv2DewSKp2Dt4Or/jkgQ674XkINeWa76
         F6BunQYer3urPwpPk5qghKP2St+K+7gokxMpDDTiNLk8yR32AfM7paXQnVGzE+eqdiqn
         NzlFldZE8u0Q3MQNfn40Ao9oyZRjYEbz0Q9gY3vsjMoUnutwJWv/MG0H0TQ0JfxrH/kA
         BbBg==
X-Forwarded-Encrypted: i=1; AFNElJ+LZq/uOWyR7jfc09KPIewXhFYdoJ3GaVSLE87tv0EysIHkrKZsBrXa4qJdtC36+fIwxNqem3js8y3K@vger.kernel.org
X-Gm-Message-State: AOJu0YwN+y+WUh2LOSTNffwe4rNz0nZdVmADL1Q6+CEJIFslorHYYnHq
	7ja8bpZgDSV7QgdaWMnMFzYsLbLneo2X8kbGlChFr+SQo323QFk9cMg5
X-Gm-Gg: Acq92OH/seuPpP8OkMCpGzwrC8Dn5HWCCZEoD6gSD4K6CcWl9xZJvxybt4IsT/aGcAH
	H9vPEzfsXmYDBWhqMKosJfIzpj8kcviS0de1ljirLkkIFO4DgKlbORi2iyfZxJvlg6RBDOVdLvF
	C4Im2AxnVHoWk8EQgHYofZuGF6pLaGQ5BHYIGKI0pD+tHrs4Zgr1vCi9ZRkD0l9kI646IACCyRM
	W/maPZkiC/LnInGuM5DhVO920qtI9R7FhOuyy8DCiDbDKERH8SjmrTa30VRMw17oQXxhjE+siEB
	BoibV5G1PiXQt3PbPuyAgY6i9fcrgea6I2NVRPNmzY507kZOLe8I7UqURZHLhButXTIBLO6O0pD
	aWyxWFrrMIejsFNgm+O8iAydBLqKfxu7KJe8o9CKeEBeKfSCRzfRGlUEIMBSo9Rt3tqx3MyCo0i
	eWS8jkvn9tf8DDLM8+PS7dBL6WoYiwFG32fBA+3FmhpO0MyWDHC6sQoNc3FqjqUDFlUbgfk9M3h
	IfJW1fJsHFVZxnGjbyfYJomzR7aaqj7ZLm1qpMr7g==
X-Received: by 2002:a05:600c:a012:b0:490:9d5b:d721 with SMTP id 5b1f17b1804b1-4909d5bd98emr48239965e9.16.1780062535369;
        Fri, 29 May 2026 06:48:55 -0700 (PDT)
Received: from GLaDOS.lan (93-55-225-230.ip265.fastwebnet.it. [93.55.225.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm20777125e9.9.2026.05.29.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:48:54 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/1] arm64: dts: imx91-var-som-symphony: fix RGB_SEL handling
Date: Fri, 29 May 2026 15:48:50 +0200
Message-ID: <20260529134850.22196-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

RGB_SEL is a board-level signal driven by the PCAL6408 GPIO expander on
the Symphony carrier board.

The signal needs to be driven high on the i.MX91 variant to keep the
board in the expected display configuration. Move the handling of this
line from a fixed regulator tied to the PCAL6408 supply to a GPIO hog on
the correct GPIO expander.

Fixes: b3292129dcef ("arm64: dts: imx91-var-som: Add support for Variscite Symphony board")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx91-var-som-symphony.dts     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
index ac9fed58357e..c1e6c9978275 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
@@ -97,13 +97,6 @@ reg_fec_phy: regulator-fec-phy {
 		regulator-always-on;
 	};
 
-	reg_rgb_sel: regulator-rgb-enable {
-		compatible = "regulator-fixed";
-		regulator-name = "RGBSEL";
-		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -258,7 +251,6 @@ pca6408: gpio@21 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
-		vcc-supply = <&reg_rgb_sel>;
 		wakeup-source;
 
 		tpm-enable-hog {
@@ -267,6 +259,14 @@ tpm-enable-hog {
 			output-high;
 			line-name = "tpm_en";
 		};
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	/* USB Type-C Controller */
-- 
2.47.3

