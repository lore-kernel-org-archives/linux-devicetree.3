Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAC43D47AF
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268770; cv=none; b=i+qYn6doahwx3GegTJ1PL1FAdZeYZoFqiRwsRbxOCi7+rAjluU2AXprxBqapjNXO1XVYkTJxS7hBczmWr7zbqReeRrrK1EifboMK81sa7Bg/tqidbx+7204VaJQ6QrB/jgSJn4j7wPMV/4daIIqULTaeNJX3DQnYnmcHhRzcfm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268770; c=relaxed/simple;
	bh=+gJoHyGsiFiNaIlHB7RgSHLds74RlNXffkN/maQntfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XVUoheRawgTTXnmIhYew0oGgNrQV3UP0483h7djyJ/ILn2YPXYuY40MEMLRvUPq9NS5yUhO3o4zWN9uQ5Ea3pGocY4I1vmP2N05bEZsD5FVcScORsG7zgky0X8YP8bocZbNuz0GOjmSzelIQEsZgBKTN8ZckOK/ph0B7Akyiv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cuwJq4We; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cuwJq4We"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bebb72b845aso156643766b.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781268765; x=1781873565; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q6boKDQpN4ENAhHPbAvIJHcNbXUFoJdy37O/+JGrt8U=;
        b=cuwJq4Weasr8kyaVwhIvSaJh6R+L9O/J6VUXnnI/TFRmx6LrfnOptNtc9HQTWanNU3
         UV3TUbSUEqjDsqksJUkA1dyUIq3fOPcWx0MGFWRzTMxXVZNRbk1JfGxDc2EDCA9AlQY3
         wmHcDXo8/UEUFmTTfnrlC+TwPMzRtjcRIpbs173p/tbCVN+6EZJYG4C+K6zRF+8wUZvW
         nIavBcrgLP5lWYIIN/VWOE1AkcrC37TObuqV2WgfH3lNjrKfQ3RP20fngCXYfnynS1uq
         l2TknREudIdCZEaIpz8/BwIDttpuO2Z9f19pOOSmCfRbiMPfqqwt2qaHmaTsL04jUB54
         0yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268765; x=1781873565;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6boKDQpN4ENAhHPbAvIJHcNbXUFoJdy37O/+JGrt8U=;
        b=owUrQpcmHDBF4JTffTXWyukclGKti0dRpf8xbiKVU6PjlMxao4YiS1FSI3oITRQz2j
         9Sc0DyxRQ1oy/fNvKkUVTYx8KZiHrqI/LweUfMl8FqN/6axOf8eSNu/FJEjp2fhK2t8h
         OUJ1xdV+Xq7jVVsKkO/iOIgmPbhXtSerGyKAqxEAuQcCt0+Wr4apHAQYvvgjuyGL2jvy
         pFKiECu2NkLRissTT6rZ3pBniZio4Tb1Urbk/TRSPvnMGTLKu3BfgFLqhZZoHhpoC8Z+
         /imePs3I2UisFvfyxdLEguXg6sKz5a2fnVnExpPUfrQkKUXCdXIYzqkC/bM62s76x60a
         1/dw==
X-Forwarded-Encrypted: i=1; AFNElJ/+qQ5gcpJ/O9augcnIh2axmcp0g+Bvtq3ZsHz5E/J4nCJlQaShX6iZVezdMFtSyQJOpRqMHIL8UdJi@vger.kernel.org
X-Gm-Message-State: AOJu0YxSXoVoPdiuETIHBVcSrwGXMA1gMeL//kjUxZyb9HxL570Kd4+i
	F/eL21gJeD/PxTpJcK3y2VfhxEdEP3bmSh3qSi4ix2tbJAGmmOOT8Jt3ojVZNAeTtQNiftPHmFm
	KndLGnbcGNQ==
X-Gm-Gg: Acq92OEZi1kt7+GqSruzscFLuAxptR7TriRIxfV0UhENV0Z4oyR16cTaMnuCb06318U
	OSiawCWLFjENYD/DD0Sq47TzXcrzRXGMDfqQnMiRi4aePpeGH4W+pe+G96muEZkxfBOswdZF07A
	q9qm31rzb/P3n5lFdjzjIq/jEEmZCoeI3s0u/BoJ/4ZbYc8qvkcvGBDUmZ/sh4qNUZXZJZcZsiw
	OWT6lH8wqvGL3Brt6jcHcBOk2cITeX+BviJr/BacHHjrnr1bQUYl4C1wPt8jivCnSRMVA5iLIHm
	5fkiRXCJ2Orh3PeIvYYo5vCjSSPFFovsyfFalOhWTfINUd73FjAhaQmHzv5pltWTGAqPcgliGit
	FE5QFWNMkuKp7R/YHKl6yhpj4ZVWwYAe6oMUEDbdsijmtK7c591XDgEmZQ5nfSUjvtYJek+xJUx
	ZP1Xjboju5xBQPFRTi4RcRLI5of7zfT0kQWSsOqwqy2qeWZ2SIMUs6K0dRhE5rSEbAvtfREmzUe
	owewRl69/X48RFXTagQqllfdCPVCuYHMDvHjKwWr6O5ynW8VsjzRs1JGwA=
X-Received: by 2002:a17:906:4794:b0:bed:a213:a89b with SMTP id a640c23a62f3a-bfe2b0f8f54mr142133466b.37.1781268765453;
        Fri, 12 Jun 2026 05:52:45 -0700 (PDT)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm57823066b.1.2026.06.12.05.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 05:52:45 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 12 Jun 2026 14:52:43 +0200
Subject: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261
 amplifiers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQ6CMBREr0L+2hralIquvIdh0daP1IQW24IYw
 t0txaXLSea9mQUCeoMBLsUCHicTjLMpsEMBupP2gcTcUwZWMlFWjJF2qIh81zUTlMiSKVUiV+J
 8gkQMHlszZ9ut2XMY1RN13BS/hsfXmGbiXgMlAxLt+t7ES2FxjiRPCUphU3QmROc/+d9EM/H3y
 kQJTSRyylBxzfHaSuOHzlk8Jjs067p+AdXc6g3tAAAA
X-Change-ID: 20260522-fp5-aw88261-a02bb0e4b697
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781268764; l=2873;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+gJoHyGsiFiNaIlHB7RgSHLds74RlNXffkN/maQntfI=;
 b=5ftPVdQT3awobwhdIKpoO8iBgTIf1JN92Puc7p1+tF6/AWKV+9xg1A4MGMO8NQVwuWmKAqkc0
 NzuiKq3ds/GDe/tNM5BeoXHNWRhS0S1ykKsWEiIsRWgqoFfm2xmAJRE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add nodes for the two AW88261 amplifiers, for the top and bottom
speakers of this phone. Hook them up to the sound card.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Remove awinic,sync-flag for both amps since it's actually not needed
  (Bhushan, off-list)
- Remove RFC prefix
- Pick up tags
- Link to v1: https://patch.msgid.link/20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 57 +++++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..6ed34b5a99b6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -866,8 +866,33 @@ vibrator@5a {
 &i2c2 {
 	status = "okay";
 
-	/* AW88261FCR amplifier @ 34 */
-	/* AW88261FCR amplifier @ 35 */
+	/* Top speaker / ear speaker */
+	aw88261_l: audio-codec@34 {
+		compatible = "awinic,aw88261";
+		reg = <0x34>;
+
+		dvdd-supply = <&vreg_l18b>;
+		sound-name-prefix = "Amplifier L";
+		firmware-name = "qcom/qcm6490/fairphone5/aw88261_acf.bin";
+
+		awinic,audio-channel = <0>;
+
+		#sound-dai-cells = <0>;
+	};
+
+	/* Bottom speaker */
+	aw88261_r: audio-codec@35 {
+		compatible = "awinic,aw88261";
+		reg = <0x35>;
+
+		dvdd-supply = <&vreg_l18b>;
+		sound-name-prefix = "Amplifier R";
+		firmware-name = "qcom/qcm6490/fairphone5/aw88261_acf.bin";
+
+		awinic,audio-channel = <1>;
+
+		#sound-dai-cells = <0>;
+	};
 };
 
 &i2c4 {
@@ -1161,6 +1186,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@127 {
+		reg = <QUINARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qup_spi13_cs {
 	drive-strength = <6>;
 	bias-disable;
@@ -1238,6 +1270,11 @@ &sound {
 	compatible = "fairphone,fp5-sndcard";
 	model = "Fairphone 5";
 
+	pinctrl-0 = <&lpass_i2s1_active>;
+	pinctrl-1 = <&lpass_i2s1_sleep>;
+	pinctrl-names = "default",
+			"sleep";
+
 	mm1-dai-link {
 		link-name = "MultiMedia1";
 
@@ -1246,6 +1283,22 @@ cpu {
 		};
 	};
 
+	i2s-dai-link {
+		link-name = "Quinary MI2S Playback";
+
+		codec {
+			sound-dai = <&aw88261_l>, <&aw88261_r>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai QUINARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
 	displayport-rx-dai-link {
 		link-name = "DisplayPort Playback";
 

---
base-commit: e7b907ffb2cd66314df92360e41f7bd5fdaa8182
change-id: 20260522-fp5-aw88261-a02bb0e4b697

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

