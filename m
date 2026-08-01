Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A0371046
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785603279; cv=none; b=gGex3PCM7EkpQ7h8gpqSMqdan+jUfCp2dJD+LZVILoBIMumx3sXDb6S5UoZFcQv2Sy2w7zeDV2+k+LukOYCT3IAuCD6CVg3JJXOEGDbJzMmcfG9k+Ov2CtyuVUfI4IKLvgwLEsuSktISo+M2aH6/l4+6nTmn9n5bR+m8aCS0S2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785603279; c=relaxed/simple;
	bh=ebqxqrF0JZx7PUIJTc0kz5J9imImwse8e/5JUg050go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JpHiUn/Gn07mMyHdPQYgjd3kc4sIlmNYsLVT2W/wC97518g8RzIl2h+yulQH8B58ROtPCAJtrKBuoEKjmICQW2uTWS0/6eBkxJU04Dk3sIIsqYYb8JKSWn/B3NZsMR15AekxjCLvxsKhgX6Uy8H6+7goidF4NplPV4OAAkwb9lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTJao+4v; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTJao+4v"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495590dde14so7689895e9.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 09:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785603274; x=1786208074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwjnT3EpR0zZcIL3ISuwV1cjbLAr+BETB7kkTqGtQmA=;
        b=HTJao+4v17YMSPNvbaVxXamG08GAI/DE0PKboN2utLVE6GI63DC7LfZ7inLIpDlVY5
         MNT87do9WqsaOLOeINd0DMIhmWOtBk2HaCluISuky30GJTpTq2+l8SFOJxmDW6DuN7+A
         DcWEKVR+Q8Kwq3EDOEEfbUEPW+lKeUf5+JuL42ma0fpt3p+5QNNmhGYJQUAin8m1pJYD
         l+Ny4bnauc10fJ9YTJPFr+TETysPSRhpTa3C97kSebFLhimxCRQ5roDyLoScCy5HL9WA
         1RWRVGjmxZ73NflE9GRepskY6YT07bOYhs8SRjr9Xnu9mKHsnTALqmWfXCMSIJ73G7su
         /C0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785603274; x=1786208074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwjnT3EpR0zZcIL3ISuwV1cjbLAr+BETB7kkTqGtQmA=;
        b=oKGHC8gVqvajg11I8BtI0VA0UR2gwxELlvAFh/BPrMZDNspSHh6J1ie/00A4Y004LO
         2yjUv43ZDdhwPK/NC2zc8j3yJLbI6ekp0ROpPU+uNelkpQp55Os0b6OhfdZ/8SIaf84B
         WEn312Yh+Ym6npkrGS92rFQzJNLtwzBGrU1H4fF62DMQmFbX4QrxN/QSYqoe6SOnYF5P
         XhSqVrlmMBl5o/bn/HNW7IDWA3Ku9k5lBNsRxnTNvAAAxQXWmYn+5jLoYN/xDSEmfVQ7
         uLlIfXxG3h5fWWYCnPUiAk5RzyGCngaI+kMxpGsbmcqEB6rbBdqF8pvwvMSnoI7JOs1l
         W6Kw==
X-Forwarded-Encrypted: i=1; AHgh+Rre2AarpDYH4LUX+/FDA9MHj5vvPU2Eii9yh9AjsdemfYhsfSd1NStzzQwFp7djjc9lC1sq74JVMPqy@vger.kernel.org
X-Gm-Message-State: AOJu0YzsOv3daH7DFjXdygY0F8AQ4atZ2r1GrwgonkYwWjwwjggQ9rMB
	sdpi0qO6es+iUKGRkHG0zpYtrgByOGftPyHPVPygl1FjqsIl9eQXP225
X-Gm-Gg: AR+sD120CSizWwHXoFhAfGxbgSA+aa+517stq3kqQntNJJZOa6dHkrRjOq2jXeOMDVa
	yGK3SLyjS8nBkPuH0pIpQlWS+zoLjXvibnmz0ST+IRemYQBPZPDUE3SvErGnAgvIbbqXAShy6/H
	MWMIEFFQovd9EhoIecKOrlZeTcV3Zvi1SHiax6eCqEpAbVAurmzv5FVKJkz7exfHkr8NUvZ0fuZ
	S1nPJ0gliqcPg/lcphCBA/pUZJ9nhl6AqL4rC+48nF72IdKmovzrjA5kwLI2akpS7ryK5iKltiy
	q+acGlJN+Jh0cdIwlgu7TnODQxPml8vgsnzsadt7i94+VG0N9JiO2rNlSHQCEeN28dsgc8b+H+p
	VKzt47r1fCC1iWOKIjm9kYcFJaGA+9bXAwatj+WExOXgxxmESjjAz1vzIM9y+C0C3OK0G+OiYC5
	Yj3J8IuEbvSmSyzLAZdP6Rsl2Z0qb9PHPyWRlCv73xcZR/seIJbb0mWJmlR1PJiwg3qp8lyaVGz
	6XrXkweVR66KQ5+7E5wcEnxUmmY9jHvBzlnQ5e78GVk3PGZmqTSZAmFoPNBi1xs5P+w0kGlHcKd
	H5ya0Ae9GBOZ9gN7vhaRwi4/9BzMBPnj3mdtnCnb4M1T6wB4QKJa9JwDpqZuTQTLn5gMGveQm5z
	40WTcaOVhXFUVWeOoK4ZdfZrMU4fudskSfLewln31d7KZDf30KS+86OqSlOGI
X-Received: by 2002:a05:600c:4685:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-4980eb66053mr51984885e9.14.1785603273675;
        Sat, 01 Aug 2026 09:54:33 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm63964405e9.4.2026.08.01.09.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 09:54:32 -0700 (PDT)
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
Subject: [PATCH v3] arm64: dts: broadcom: bcm2712: adjust display status
Date: Sat,  1 Aug 2026 17:54:26 +0100
Message-ID: <20260801165430.598302-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Typically non critical IP in a SoC are disabled by
default in the SoC .dtsi and enabled on board specific
configs. There are usecases, such as some CM5 carrier
boards, where display output may not be desired or
connected. So disable them on the SoC .dtsi and enable
them on the RPi5 board.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
---

v2: rebase to align with upstream changes
v3: re-add missed vc4 okay status

 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    | 35 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 11 ++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1ab..d998bfae91acb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -104,6 +104,18 @@ wl_on_reg: wl-on-reg {
 	};
 };
 
+&ddc0 {
+	status = "okay";
+};
+
+&ddc1 {
+	status = "okay";
+};
+
+&disp_intr {
+	status = "okay";
+};
+
 &pinctrl {
 	bt_shutdown_default: bt-shutdown-default-state {
 		function = "gpio";
@@ -230,16 +242,27 @@ bluetooth: bluetooth {
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
+	status = "okay";
 };
 
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	status = "okay";
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	status = "okay";
+};
+
+&mop {
+	status = "okay";
+};
+
+&moplet {
+	status = "okay";
 };
 
 &pcie1 {
@@ -250,6 +273,18 @@ &pcie2 {
 	status = "okay";
 };
 
+&pixelvalve0 {
+	status = "okay";
+};
+
+&pixelvalve1 {
+	status = "okay";
+};
+
 &v3d {
 	clocks = <&firmware_clocks 5>;
 };
+
+&vc4 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc9..9b36ecd7bba54 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -359,12 +359,14 @@ pixelvalve0: pixelvalve@7c410000 {
 			compatible = "brcm,bcm2712-pixelvalve0";
 			reg = <0x7c410000 0x100>;
 			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		pixelvalve1: pixelvalve@7c411000 {
 			compatible = "brcm,bcm2712-pixelvalve1";
 			reg = <0x7c411000 0x100>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		mop: mop@7c500000 {
@@ -372,6 +374,7 @@ mop: mop@7c500000 {
 			reg = <0x7c500000 0x28>;
 			interrupt-parent = <&disp_intr>;
 			interrupts = <1>;
+			status = "disabled";
 		};
 
 		moplet: moplet@7c501000 {
@@ -379,6 +382,7 @@ moplet: moplet@7c501000 {
 			reg = <0x7c501000 0x20>;
 			interrupt-parent = <&disp_intr>;
 			interrupts = <0>;
+			status = "disabled";
 		};
 
 		disp_intr: interrupt-controller@7c502000 {
@@ -387,6 +391,7 @@ disp_intr: interrupt-controller@7c502000 {
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			status = "disabled";
 		};
 
 		dvp: clock@7c700000 {
@@ -405,6 +410,7 @@ ddc0: i2c@7d508200 {
 			clock-frequency = <97500>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		ddc1: i2c@7d508280 {
@@ -415,6 +421,7 @@ ddc1: i2c@7d508280 {
 			clock-frequency = <97500>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		bsc_irq: interrupt-controller@7d508380 {
@@ -460,6 +467,7 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			status = "disabled";
 		};
 
 		hdmi1: hdmi@7c706400 {
@@ -489,6 +497,7 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			status = "disabled";
 		};
 	};
 
@@ -667,6 +676,7 @@ v3d: gpu@1002000000 {
 
 	vc4: gpu {
 		compatible = "brcm,bcm2712-vc6";
+		status = "disabled";
 	};
 
 	timer {
@@ -703,5 +713,6 @@ hvs: hvs@107c580000 {
 		interrupt-parent = <&disp_intr>;
 		interrupts = <2>, <9>, <16>;
 		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
+		status = "disabled";
 	};
 };
-- 
2.55.0

