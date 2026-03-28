Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF63356A3C
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 02:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663841; cv=none; b=OfL7wrNvISoFTesyw5ZU0Zf5qbxBLvvjAAZqK3n0Y42sezUA2x9A7DfBGRzELZyHmw2VXPigHKRsO/Poh+ZipDYWgUOnx4Rj+oaQiOTaoTIW5geCXwwGFTzqqZ50bvrGokg0tgfhST/IgL9k7RtEUknRofeKsLaVQrI014glUOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663841; c=relaxed/simple;
	bh=W+TQhMNYqZr87339dE/iOc/6pEhejlYbKY3ZjAJcsWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtW2vlN9TLTy8JMXxhzqgaqEPRPROoR82W4RiUO6jGrhXRCh+dWPZsu03AWtvsa47P8YZecMFBjhxbgHkLNOUt87mDQeWJQZRQWXVzQ7exKyUG0IfgF8SXVFTvqDIk8nnOu805bop3BOQgizNnfuh56JqbZCmbduA2LwSPKr4ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fad2Qgoe; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fad2Qgoe"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50baafd6c4aso10885991cf.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663839; x=1775268639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=me055uooF9VJUXEMWA5n9SFzAa+xup4cKpJ/xh9KqF0=;
        b=fad2QgoeVz456d1syFLkj8xL168hH6G3gIUo59C6rY+u98f8umQNEpCUjbmy43QFpQ
         JlAOSx7/H0HD3g67Q8Z6wsqXMpfHK8dPFBotPwRCmUisKCJUhCumSfCsQ+Glhs/qcg9x
         Pi1kreJtBMCKZ8rp3KNxQptQmkiGWTIddZ0FSPtx34B6SJ+L/pEFEk2C0ASCV/1ERCyk
         SxuYweD7twnXoP68VEI0ZBHmjcPXTf+EctppyghlKxdp0/00MX38th+q35d91a/eVaNy
         wSLPSiy37WsEueyRfoxK1w9G5+IG4XdhVV5zQEU5CcRol4hVyyvA55wQTJ65dwwCS+A/
         pQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663839; x=1775268639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=me055uooF9VJUXEMWA5n9SFzAa+xup4cKpJ/xh9KqF0=;
        b=hi3qpA5OpqZPzL6XNfNGg/O1n1o97MWabtWrJPsTMAQJhEhis2xe3L99D+/M5BaMgQ
         9z3puqdRSRuoiC61kqaGqpoVWwY196zvfUWWBt1gQ1Y7181745Oj1rOyQwgABmCf77f+
         bQmjFNIVIID2WDIgnLkz5GdqBECf4XOy70cK4sHCIngD5hHFAbao+Bb14hM1RIOfVk3o
         gD38HMeZc428tu2HEkIw9fOKJq5qCs13P9cFPrIa2QDQw+2DdtL9akcasraMfnTtVJrh
         M1VmEK3fZ44Ci2Cp7v/gY9Ms/YtbqJ4rvIRd6uuQofXgH4qK0QlBy5P8OhmTl4AXs6nz
         YuCw==
X-Forwarded-Encrypted: i=1; AJvYcCVTEAHevEriwbYCy96nZpgFyO4KiiS5mImmLtiDhqm5EuYjuhDfKVgoJWkd6wj9w0D5fmlvByxuMXPU@vger.kernel.org
X-Gm-Message-State: AOJu0YxkB4tfMuviztgmx0u3Z2pg6UAdZ9Bze8bnutJXz/+zklQ7v9wH
	zvCDVPcihNKtgCfvJUiVVR/WT5gCm7cDY/5vznJM+Uq9ibKhCgBGVAMd
X-Gm-Gg: ATEYQzxdm8RAwb+7KaC76WIlvCTO9QsMo2Tb97Mx8g4bOlLwLW6GAwVxxxmVrteuu5k
	B1pYCr6npXsoQu2/qgSKdd2dNQvLagvhNDJZ5VMlZvALZcZ10fZo+cbSE1p+JIYPu5UcfHNIBOh
	A9yFNQehNKsdgxJg5M0F6KgaOJ00p87g8EBCuhwdvi5lFReUFl8l7549gDe7Z1JhlN7DV7VqVRX
	pGubio067C/OdweRBt54rY37O2vbV5acw2jWgFoDKTKrOtzbPSfFnFxWxsSgmAr79NqdhgLfoa2
	V9cJrs/8hlIgIN/ApAv1ME0vW5rK0sFEvlPFz/W+3bQadyrVAM1HJ/tFPEjI6VpASsPkugYmsTu
	8imQieXXnX9OzMgFdumhTDsCmOpv0INzPbuDpEFDe50GxW4+BXt9+57q6GyVc0alhhY2Mt8wlDp
	ezdj35+mm5cFvi/cJ6cd39/o3/v75OSSLG85GekVSypB7aPP/DdmqJ6fylj3n7s6w4gkwHXbzlQ
	uaiy76HYx6X1zI=
X-Received: by 2002:ac8:7d4b:0:b0:4f0:131f:66fe with SMTP id d75a77b69052e-50ba397bc82mr64885111cf.59.1774663839241;
        Fri, 27 Mar 2026 19:10:39 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbba4bd0sm7497766d6.11.2026.03.27.19.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:38 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 4/5] arm64: dts: qcom: sdm670: add lpi pinctrl
Date: Fri, 27 Mar 2026 22:10:35 -0400
Message-ID: <20260328021036.85945-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>
References: <20260328021036.85945-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Snapdragon 670 has a separate TLMM for audio pins. Add the device
node for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c5f7655421a3..85a34e2f0907 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -2346,6 +2346,79 @@ lmh_cluster0: lmh@17d78800 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 		};
+
+		lpi_tlmm: pinctrl@62b40000 {
+			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
+			reg = <0 0x62b40000 0 0x20000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+			cdc_pdm_default: cdc-pdm-default-state {
+				clk-pins {
+					pins = "gpio18";
+					function = "slimbus_clk";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				sync-pins {
+					pins = "gpio19";
+					function = "pdm_sync";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				tx-pins {
+					pins = "gpio20";
+					function = "pdm_tx";
+					drive-strength = <8>;
+				};
+
+				rx-pins {
+					pins = "gpio21", "gpio23", "gpio25";
+					function = "pdm_rx";
+					drive-strength = <4>;
+					output-low;
+				};
+			};
+
+			cdc_comp_default: cdc-comp-default-state {
+				pins = "gpio22", "gpio24";
+				function = "comp_rx";
+				drive-strength = <4>;
+			};
+
+			cdc_dmic_default: cdc-dmic-default-state {
+				clk1-pins {
+					pins = "gpio26";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				clk2-pins {
+					pins = "gpio28";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data1-pins {
+					pins = "gpio27";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+
+				data2-pins {
+					pins = "gpio29";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.53.0

