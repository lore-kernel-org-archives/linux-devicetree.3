Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65C734D385
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788036790; cv=none; b=M7Mb3qhUisr8RLuR4zRw1Cnno3fB3kbwBmj2AuHN74FrppG/s0Ds5i74XzEO21btQp/1WlgDejFOpt7ppxVXwvEKO8T4i0u6ZyVqhQKVEJ4ipT2BWw6dpTq93kDN6cMIHwUU4cnEeFHIgXbKJJCkdXNDZEJA67zOHYJKHOoA4SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788036790; c=relaxed/simple;
	bh=pT8Ko0/c4eySlc9+PwI5/4NMBjgQS+yfWqpd40NW6pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IU3eWbpX/WHviYaOo+T2lSERfWb2VshZgfAUlLLj6qBzxbJkK0Ai3MloY9LQeOyBGSaBvivXtphXSlgQrtDD63fOzCuNTB8FqsifCOLYcc7SNEHehYZTly3d25Ifyi+7ZlK1wEGcZWBa+kjQbpHnnbd/5kugjjK3spMt+fT+GVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpXBkmQo; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpXBkmQo"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b4a95ab94fso3297775e87.0
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788036787; x=1788641587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3Uy0TOuIul9efNHzUpq/ykIN1z+3xgY/HMWCteDfWM=;
        b=LpXBkmQokLfMedkHYLtRsh3n4rwFznM7DpwARevOdjTpF8VLWsGnNiSXv2hWkI5cL9
         635ViI0g5XkPCmmkI3LCCNZmwe7GwwR0PuRRSbOvqjYUKx7egC+iMuTw+RppXlIrrsn9
         c2G+RLmYwrmc8zRMK/irs5KqU++foe4ruEGkwPiqdI2f7HEKrT2OHdttJqDBznJgV3c2
         9IYuUJH3v2BGsbBf9RGL9SwUzcKYv1G+i2355BariXTjJYkrobwt5Ez+blhE9Oj+wJkl
         2Pwq6Wjkqti4wBANnXgVVzwin8VjYbS7bHIwdcgXpVfwsWjgOIVmHEPdmlvMNuMBPhQT
         3JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788036787; x=1788641587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k3Uy0TOuIul9efNHzUpq/ykIN1z+3xgY/HMWCteDfWM=;
        b=PPpZmFbetbPKCwmvZV4dJ22YKE2y5k2kIAbe1TULedcWA/8Wtwxikl9WjJA0dd+sYz
         0u+7qy8A+1XF5EC6PzOD2fJajft0GsRBeo7N7XvIMDLy/8eMgXxJshpHu1dUsvwk8RVc
         HgeBNzgyvFYpfjfFs8r4iLOwZx1iteRw4aA/REk4/uFppS9HSD8XFCoVrkHAwjcqpYUX
         1JcpIiP3DoIf32w0+LXxjsYpUjVRgdDE2LePd+Xat4sSlGVlVp64dqtSpTuRoNL5833B
         q99hUTsKN8lrygLv1Lgp8cNOGusCVxuBUxhp/+KgyXybo3sRvBJLefaw1fINRNnKDwe7
         RDMA==
X-Forwarded-Encrypted: i=1; AKwUvBySCodMzpI7lhVhuO2XsWTLcFUzSs4bK8wP7gVa8w9PYIqpXBxwr2LyCj2XnGv0QMvBnn1eeq6MGOoK@vger.kernel.org
X-Gm-Message-State: AFuF++nIFW+AfpWPV7Y7l0D3RJbAC1WuWBwv1ObqS/TUC1jkA16CDfWV
	7mVx8cy0gog5IjXk9AqiuFdn7RllOLyzh11SRmwkwZ2zGPj12IuN/nDv
X-Gm-Gg: AYBFou0olnsK0XgE/UGyHZ6oDgVTd6SiaBpOfdqHqqqs19CooZdy8V2WqkJF1pkA0y3
	p2bna6G3rN0QMPTyL5bhlTwr9Ly2bOZff3NUOxmA6yN4eIOIzlSktOU2zQp0tWgKUqMItv1h8ir
	tIVgPuX8dDqUJZwxDRMepLiNsWxcFP8G52jsZ8LC8J8JYtEdv2yMIGXWBbOqk0Kj+ECh3ERb2fQ
	w4PAYyGi2eRFnMa/W6s5rYIaBpWTh4P8u/0JBqfIyUQavZZ4sIVPCammnN6Vy65ItDRckQXuZVJ
	bU1zKbVHJq9ZXYYMKwN23Q6NIuvRAyOFtDN+kYtm+VvhDrH2Vpf8WvIM1ZWFlnWMNKXmjlyL2QY
	jrPNkkLY1Oa765cHAGmLmBLchtCQswb+nnA3bHIJVHQsVbE0mqs1ZLjg2wroRpWJx4S0inNpxiS
	fC4+tLK6vDAQ+laC1iiVpHCsZXQ5RiVKSPTXuRW3XigQVKtqLCwf817DgbIbGA9PIQP1w4aSkZX
	Zh/MadgJepFqpXn8yqS35vuK7KMFw==
X-Received: by 2002:a05:6512:1093:b0:5b0:113e:9c77 with SMTP id 2adb3069b0e04-5b5edba4c66mr2026170e87.4.1788036786257;
        Sat, 29 Aug 2026 13:53:06 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a0f52dsm1192510e87.64.2026.08.29.13.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 13:53:05 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Connolly <caleb@connolly.tech>,
	Frederic Laing <dev@fredfunk.tech>,
	Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v2] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge compatible
Date: Sat, 29 Aug 2026 23:52:58 +0300
Message-ID: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fuel gauge at I2C address 0x55 on OnePlus 6T (fajita) reports DeviceType 0x0541, identifying it as a TI bq27541 rather than bq27411.

Binding it as bq27411 selects the wrong register map and produces invalid voltage, state-of-charge, and temperature readings. Use the bq27541 compatible and rename the shared label along with its fajita and enchilada consumers.

Tested on OnePlus 6T (fajita): queried DeviceType directly over I2C, built the DTB, booted it once with fastboot boot, then installed a locally built postmarketOS kernel package. Before the change, readings included about 65 V, over 10000% SOC, and -273.1 C. Afterward, the bq27xxx driver bound as ti,bq27541 and reported 3.835 V, 42% SOC, and 33.3 C.

Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge")
Closes: https://gitlab.com/sdm845-mainline/linux/-/issues/36
Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 948a0dd18d13..f3459226bf7b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -790,8 +790,8 @@ &i2c10 {
 	status = "okay";
 	clock-frequency = <100000>;
 
-	bq27441_fg: bq27441-battery@55 {
-		compatible = "ti,bq27411";
+	bq27541_fg: fuel-gauge@55 {
+		compatible = "ti,bq27541";
 		status = "okay";
 		reg = <0x55>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 5f01115e2322..21ebd3f67155 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -44,7 +44,7 @@ main_cam_ois: main-cam-ois-regulator {
 	};
 };
 
-&bq27441_fg {
+&bq27541_fg {
 	monitored-battery = <&battery>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 7ffcad24d505..d640b38b53f4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -67,7 +67,7 @@ tfa9894_codec: tfa9894@34 {
 
 };
 
-&bq27441_fg {
+&bq27541_fg {
 	monitored-battery = <&battery>;
 };
 
-- 
2.55.0

