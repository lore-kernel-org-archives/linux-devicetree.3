Received: from mail-dl1-f99.google.com (mail-dl1-f99.google.com [74.125.82.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DAB381AFC
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 03:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777086627; cv=none; b=HwLOB5pv6fHFMql/qCrs5z7OshoFv0JHk2Rohu547IZrukH2nj16munkLUAc/akqQOKnxR7+XIMPPT/SRRz+A6HzWyV3NjLprmtHmdT/plOeVgPR4On7QH/zGqi4zqZtBYiBTzU2LGvcqkP5IZnCjTcPChSrEYvHO7ipdHhTITM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777086627; c=relaxed/simple;
	bh=62FA32n6ghYjgwrgVV2bEZChmkiSaw7eix9dVTqzEhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFFgTFW6hptdMBlfmFSUCLuAeVW/WA5LHYc17vugWjPcCk84sMJNxOq+e2CX4/IM8a/yeMcJs97OYzRFVMTd+5OzoFXt4J47BY7xvmtOlfIx7+nug9T0gW35NQ/uwvN+2Akm5lnB24idJN+APfnSOa74Hry5rJTxNyQ+/Er7fNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=iu8jYynY; arc=none smtp.client-ip=74.125.82.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="iu8jYynY"
Received: by mail-dl1-f99.google.com with SMTP id a92af1059eb24-12dca45ca21so1012242c88.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 20:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777086623; x=1777691423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Q87q408S6kD03eCdhgkumlXWLlyzkrJl5PR3laXuXk=;
        b=iu8jYynYGZj1oNHaIMBunbTynJanhZQ9YdbjR/A9teaF35Q7mAvLik1mYb/fdmK+UF
         q66eDsNhT3EHRuGfEJtD7gRlCEm3TunhZ8ke+miHpUodt3Dyt9EidHLVdEDqZi8cmZ71
         wdtKpkqDXWzt68Hz1HlV1IkgjbNk/0ihWd4er6W1D5WjXMgrDD3zZ4pYNHBpNm2iYRk4
         N7XtP9DEZSsRjSHK2CWZVJfETKynzG+3btKqF1asuduTDZneJZplE79obdsPJUClLmTf
         ffaotX+DVyKfIGJE66sez5GfMqwrfEUTt5+UVqhZ3BvdZI2ek0IvBPahTqiyYsMD5fIg
         opDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777086623; x=1777691423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Q87q408S6kD03eCdhgkumlXWLlyzkrJl5PR3laXuXk=;
        b=HdHttbKaK5T+jSRDQPclaKxvofqtG0ZwjErqQ2K8W49Yv9UV2DhbJhv6Q85v7v7CwU
         /+IbQxCKOEPgNAmp7cevQxdsfX8Q2S89qdV/RzrHVxf1ObnXR9hvhEqhFhfozYEFmFqE
         U1OqcvORnNogQMQAM6as0b/v83PY2gdPuh0I0yg2UtjMUD2xYxwKrJHYBqQ/cuBB8f/y
         WrmzPv25GamDruFK+iBFphajbd2iPRQ/1L5uEmnONyG0XqmeFn1ytA9jq0A7cPIzIn+K
         RuL7sizxF2Gy5BKJTUKSqhWsANiQaw+Z1SZ5vQaGp4Ko4hV/+VRWsBYT8n5ZUbJ01JRO
         5vFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qDMFAzp1izv7jUB/405KNyrwN0QyJJCm2EVM+G71OE3DYq0FREHRCK1YvWyovdVBUlM2gNTeYuADL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz64cbK8xnACPdnOtb0Mc/zAxsiHjLCeFygldph94Bw7bKrIACJ
	1rKQALYjOSnGoywjuF9E/cWlHh/MJud0y3GBFAJDOI4hSKa8aMWQ/PN4qjd6B58MIq+a7P1UiNh
	zfWvGMVkl+kWPTvAk+wnF3gan8tOgNQ7BtyNl
X-Gm-Gg: AeBDiesogcnsRq69bLLftB6RJhsAAq8sMKMvjMoxrdbfpNZAUg4notV9HVMJG5pyBRD
	nsuI1BMxfF2aQsvS2Q10MB95NdGc0EHJB5aFj204Su82qtbXSlmKLejwydIrtTahY6NbBfPqJyh
	GWOn6qcXVB3cOOySzUB3TSNas0nx43nfSCB/l50TS3xMfImSF+440K2qW9EU59Uf0wLWprT5REn
	+BVu3B5uYKnFxDHAK3p4nfw1QsEVwB2rdb0rHHOn2wjDbSVypUSTjgKtTlPeQJ+Q0FuzganiiJf
	M+lWemcmXWpC3tcg8MkqqLdh0rwc+6oMYaaDF50Y7AIkryF6HFo+lWsXGqhipe6Zw/LRSOjuurc
	dl2CUl4abcLG4hSfClPomQHg0NEJlVz91TiWtPABiyA3EzuEkFZx6p20=
X-Received: by 2002:a05:693c:4011:b0:2e6:e916:70ff with SMTP id 5a478bee46e88-2e6e916770cmr11635454eec.28.1777086623456;
        Fri, 24 Apr 2026 20:10:23 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2e53a3ae691sm1728646eec.11.2026.04.24.20.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:10:23 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v8 4/6] arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels to match schematic
Date: Fri, 24 Apr 2026 22:10:09 -0500
Message-ID: <20260425031011.2529364-5-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425031011.2529364-1-dennis@ausil.us>
References: <20260425031011.2529364-1-dennis@ausil.us>
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
2.53.0

