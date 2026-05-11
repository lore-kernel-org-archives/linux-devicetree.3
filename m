Received: from mail-ua1-f100.google.com (mail-ua1-f100.google.com [209.85.222.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4756366816
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468041; cv=none; b=aeYjq6M//ei/bQXl3YFhdhTGCcPqzxM1DK1wewGp24MAmqV7hSD9yYuklr83jaGY1HJUXPkRxFU8dek8eDw+H1XUcLq4HUVf180S6r3+dJQti/IPff45HINIimoZHjU7VnA+5ruByJ1a1az7I10yfjyfaCOopj8USvAauyDH3ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468041; c=relaxed/simple;
	bh=6WMVx93p4ItMVAYRLpAKRX1hMg55RrIEQpJ0SbB18Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+Mlh7tR9LwRjzwsO/tnhWcW3ozhFtkQcdjf4mKAsvfHNTyh9gf4xuZuz+AdHxugTqq9Fcwk/YFjr13YHqOfcszrGZCQ3JuFk6NLMAHxy1c8R2dk1F1G+rJncRohzBF0ZGBvRThqpa7LjJMPJROhd24LuwTJW7Clrh9vcBKzQWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=GKiqurXY; arc=none smtp.client-ip=209.85.222.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="GKiqurXY"
Received: by mail-ua1-f100.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so961727241.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1778468039; x=1779072839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hI3It/TBwNAH4is3Y19ZdHuT8VgKHisEZqEHUOa55pA=;
        b=GKiqurXYZ1OJ7QbXPIQzndQh1EfRV76pNQfQooYAiEGg6cbboH2NcFiqQVTYdlVSnh
         j2ihGsgbSgIfzSpbrBvkFC0ENV5AmQ5OnzsTEFYggbiTW0xG4BOttiKBJth1P2pIR2tE
         ++dQ4evo00hDnkVnS3Joc519y2ja8utJTOPmb2Xt3NZCSespAJUTmYswLukS+52OVgKu
         xVaZr00KPg3UJoKoyCKvwmsYKrNen47Qai+xOwK9/Da6FMuH4qI6ygH9kC3yW9yw9nlC
         NOKyMWkA/EgR9SAcJjwsk8Utsh8HE5Y0FU7iQ4ICpFJg/BCz9TQgiDaMGhzfutTZ0V9D
         0oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778468039; x=1779072839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hI3It/TBwNAH4is3Y19ZdHuT8VgKHisEZqEHUOa55pA=;
        b=QjJ/S+uAC/OYV0mn9RnTVRJtugddISovS4pnoP3poLb+YiaCtcsytIdiwwI80oqgPY
         nmF8qeBnJQmQkPMsfq3Kl39o8kXj6RJdzYPcpBbPTq8bqXYAvzw5uB0VbYlTGSVNh0lY
         3HlysPiFzXxa97GfXACL2dfMHv2vPtQU0OL5CAFFdM62CRCJOZToRdAmycD0sQtZq1KN
         IxXVm24mn8k1qpJy/Lt3DYZSL0liqSi0fNO7OAA0Qp9GD/u+IoPIXESqG+6pq9ad78My
         181uu8MGxm43+gMVOljIsu6LfRtM6bqKH8Jpw+rT7rwVgw0qdqxBseckVZYZmQH48sBs
         KPgw==
X-Forwarded-Encrypted: i=1; AFNElJ9TDd0uiZ3mD0qprwLv/m2JTx+x83mjEl1mmoCJ40ZpQoNvUFwHCA0gic+JI8IaqcJxOqFjy9Jkibd7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu/BYT251XYd0mgQOhOZL6Tc5FFPAAKY+psT5dHp4fJw/GbCub
	oQP0gwmFcjqp38GU6Z58ZBz2B9lyuSj2vuUnU8wHOlNJq8huek90pQPavVG8zmDx8kJl7yHSPlf
	9HuhoqXSz9PJjoaHlZWWVBPpoUvlfMosGOd25
X-Gm-Gg: Acq92OH6iCaASRQyDLXwgGHBzkQD4pVr2fnbOdG9tCTUPjhUJR2I9IkbqhCNZvqD1vz
	xg6KUz1lyAZO4gfFFPH4cEyVUsbP2+t+M62+Zd9emR9r71Mv5cHfgkWtMw6Z2v6aTEG1Z9cooAK
	MuDK0F+yNYCIhQQByO6tsQeJd5R7MI4nf7xH2hHzePqvcEjl7ct1XnVIK1NPXpiYL+DLSTiLLbl
	94Omfs2yPBIfQvCQEtP/sQrkp4J2+Jos9sGJHVnopf5cMXc+XyRCVwm20nU7NIbnZucKVuJfAsK
	0d/D432Zbi85g+IFyHnTxg6fyS/bFlKrvI6M9HcX+0txbPJgwENKNa7V7N+FnIpS7mW7u9wh6dN
	5TKfAv6+r6KKYm5Jc7V15Nrn0CTmaUJU+bt41p2XLx3NO
X-Received: by 2002:a05:6102:8551:10b0:631:26f6:701c with SMTP id ada2fe7eead31-63126f6ad99mr5986189137.31.1778468038687;
        Sun, 10 May 2026 19:53:58 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-6313ff6c191sm698744137.1.2026.05.10.19.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 19:53:58 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v10 2/4] arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels to match schematic
Date: Sun, 10 May 2026 21:53:48 -0500
Message-ID: <20260511025352.106126-3-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511025352.106126-1-dennis@ausil.us>
References: <20260511025352.106126-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orange Pi 5, 5B and 5 Pro schematics label the RK806 PLDO outputs
using the pattern VCC_*_S0 / VCCA_*_S0 / VDDA_*_S0. Rename the base
dtsi regulator labels (and the es8388 supply references) to match:

  pldo-reg1: avcc_1v8_s0 -> vcc_1v8_s0
  pldo-reg2: vcc_1v8_s0  -> vcca_1v8_s0
  pldo-reg3: avdd_1v2_s0 -> vdda_1v2_s0
  pldo-reg4: vcc_3v3_s0  -> vcca_3v3_s0

Also update the saradc vref-supply reference to track the pldo-reg1
rename. No functional change.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..fd5c6a025cd1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -274,10 +274,10 @@ es8388: audio-codec@10 {
 		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x10>;
 		clocks = <&cru I2S1_8CH_MCLKOUT>;
-		AVDD-supply = <&vcc_3v3_s0>;
-		DVDD-supply = <&vcc_1v8_s0>;
-		HPVDD-supply = <&vcc_3v3_s0>;
-		PVDD-supply = <&vcc_3v3_s0>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcca_1v8_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcca_3v3_s0>;
 		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
 		assigned-clock-rates = <12288000>;
 		#sound-dai-cells = <0>;
@@ -441,7 +441,7 @@ &rknn_mmu_2 {
 };
 
 &saradc {
-	vref-supply = <&avcc_1v8_s0>;
+	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";
 };
 
@@ -666,8 +666,8 @@ regulator-state-mem {
 				};
 			};
 
-			avcc_1v8_s0: pldo-reg1 {
-				regulator-name = "avcc_1v8_s0";
+			vcc_1v8_s0: pldo-reg1 {
+				regulator-name = "vcc_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -678,8 +678,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_1v8_s0: pldo-reg2 {
-				regulator-name = "vcc_1v8_s0";
+			vcca_1v8_s0: pldo-reg2 {
+				regulator-name = "vcca_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -691,8 +691,8 @@ regulator-state-mem {
 				};
 			};
 
-			avdd_1v2_s0: pldo-reg3 {
-				regulator-name = "avdd_1v2_s0";
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-name = "vdda_1v2_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1200000>;
@@ -703,8 +703,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_3v3_s0: pldo-reg4 {
-				regulator-name = "vcc_3v3_s0";
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-name = "vcca_3v3_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <3300000>;
-- 
2.54.0

