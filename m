Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2EA41C71
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453639; cv=none; b=AXvlaZrOclQEUQmi09Lmk48SkRtoYXKGtsgwItHlAfURBNq9pNI5KWIbUnXWS8g8DPvRu8VIDBmOYlW7ZFV6o9J/pVzf+BWsrerIErqDJ/K1z4oGSfbe6Ezq0nmF+Rkd2Oky0YNP/BN/ZtQgQBhoal8qJcF6b2++meV3NkoURbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453639; c=relaxed/simple;
	bh=GKuU865fhJdyAR0TP7O66B01STqs4OXEY13Yqfza5bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jJYZalDD5Q0uu4PojDVopNd2diZ9ewAXFKxbx69Nqu9uFaLPwt+nwn6udK5dMoNRkI3qhhkOgFRLt+HWMwnPLQHqfznaW3NsIt3mvR5iga/ZbWQFZ78xriu6dHUUBt6pc+IOHtDxjGbO1QeRGf+kl/APxEiQOc9heRyZMu/dK0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TapLIak7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TapLIak7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd0209f25c1so1202805466b.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779453636; x=1780058436; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8/1QwPDT3p0DppjyzD2CwRhU25CR8Lvlf63nPxbD6A=;
        b=TapLIak7TJssjArsCmRZT7giWktxmQL4+ZxuyfHswsA7VctRCrmuILDapHdmgDRcVI
         KHjocnGnzk6FY6AfpWmODuY53mFGP5zFE1auV+A2vMWLIdbOvd2kih0T9k3jxmRgbMiN
         wlIATcklOPNjO3pfHzp+GT5Hyy8FNSsbPOgjFFDYrW4t2ejI0kjUk2Ci6rCuAF5YX6QB
         ajSnCxq1aFrwtm7QufJScGWOPhx0wBdR3xubVDUC5mXHeZOldQ+CxLoPMns/Ix3CUEnm
         HD4zbdbZUkKKnHqbOeKKE8oyDLqQKZXbruTXVfMUcA7twGfWM5jgJTxer7UiCJwYQt3u
         3qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453636; x=1780058436;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8/1QwPDT3p0DppjyzD2CwRhU25CR8Lvlf63nPxbD6A=;
        b=K/7kpuOE1MnJsM1r2EVcXUP4qZ4MCfSdc2cAt3VvurEwFklVCfgmrrgpV2VZ1bin+r
         eyp2e6cma8f5VS8CP6P55jeAXxjBXHyJQfO7Ubql6B2pQ8V4hww8NhUdnZgBXIusAAUY
         +3jZjhxu8E9ymuXE23AVanl7gNwSsnWwfWnyJInlqKRMTWLPwYboh9SirfMsfOe7geBU
         H9ruxX9IfhllgVcuusI4DxVGC8igJvL3yoIesPFYMIa/Jg6GheF7xf+rLwoovA1ePKUb
         oJG3w6vsPRGFfq1ZYhQ8EDZH0PJ3pwJVtzRQdlggttuIfTOKJDOK2vtMXVsY5B44K+CU
         l19A==
X-Forwarded-Encrypted: i=1; AFNElJ+tsHJoxBQvdTewO9RV9lV/BR9DSSYrxjkhNujjf+qRYektmuSwADN4lkhQiKacG9Y7l4dROM97SUoS@vger.kernel.org
X-Gm-Message-State: AOJu0YxLvTtclL9K9NS5WHCy1JFkEFqxYTrIvFvLMSjxDChm/BbBzoTA
	o87+AxHDtmmi+85bwk4/9PUfwuw6C2a5LbcVS9x61yKBrGt3RMjcWiXNnamY//XnKAo=
X-Gm-Gg: Acq92OHBqElc0byjhORsr/3kj0LXbi7QsYtmWJ1tp7eBntNp1A/WOJcvtNQiwitXkDN
	RzlaAfZfrEG4kHsFM9v2H0/JAs7GI0QxfT5/E/UUNw3mITWVr/N3hUy/vmSzwUxwudKx5JSWVSA
	0w3ZSwKCGlnZ6qCbYfHn752Grqh+y9ihXVu2zRh+bYjo2gskWUjiw6LseCEqHKLZ6mPdK7LDcQ1
	17jAwTWYZaZgBiXF3ScypRvHPYElbzdE1nm38iJm+Nu5vUHomKsYLP62UlvKZZ27703ue3B4Qur
	gqfRQjCEqEn7ukFbRYXPfo54ICNS4aabamTmqIRNdlTYkhqXCGbwyKli1n4WMkbCy1Tg7ApHwB6
	+4wd2I9X39CrKo9jfPxXtXkceSNVKrjmxX9NJTEPfpBlSYDXnw95ng/GOwqNV9P3U/ZBDt1vBe5
	riV+HIYvB9eepmj6dd2bd3vQA2F6Qrt6dH+6wQ+2CAFveOTAL5KS/9vf5wIZoIJFAzZBOE4KUAq
	ytHLg==
X-Received: by 2002:a17:907:388b:b0:bd5:ca8:768c with SMTP id a640c23a62f3a-bdd2a4fdcf4mr227820266b.31.1779453635971;
        Fri, 22 May 2026 05:40:35 -0700 (PDT)
Received: from [172.16.240.102] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264d87dsm52301866b.2.2026.05.22.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:40:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 22 May 2026 14:39:41 +0200
Subject: [PATCH RFC] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261
 amplifiers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2O2wrCMBBEf6XssylJ7B0RQfADfJU+JHGr0d5s0
 iqU/rvp5XFmzs7sCAY7jQYyb4QOB210UzvBdh6op6gfSPTdaeCURzTknBRtSMQ3SXjEiKBcSoq
 BjNIY3EXbYaF/S9sNrpcz5KtpevlCZeeeDevw07stu7FSGCSqqSptM6/GnyXbHpv5Co0RyyeZd
 1gDlnBOUxr5+yBOw4QwMojy1Ar1Rmt91TTlEfJp+gOXHI143wAAAA==
X-Change-ID: 20260522-fp5-aw88261-a02bb0e4b697
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779453634; l=3190;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=GKuU865fhJdyAR0TP7O66B01STqs4OXEY13Yqfza5bs=;
 b=vFt59t/6uyXFNQFXMq8hCqeigkTmEiHrO/WtAyYMztfHxTmYezS6wVtMz3rxJg1iLi8eQJ29c
 0+3Yqs8hn5PDUcxHC/6qfUw3WCk7OU8MoFVG0lqxLlf2cJF82TICJLb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add nodes for the two AW88261 amplifiers, for the top and bottom
speakers of this phone. Hook them up to the sound card.

Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
RFC because the AW88261 patches aren't merged yet
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 59 +++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..b1f489a9f449 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -866,8 +866,35 @@ vibrator@5a {
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
+		awinic,sync-flag;
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
+		awinic,sync-flag;
+
+		#sound-dai-cells = <0>;
+	};
 };
 
 &i2c4 {
@@ -1161,6 +1188,13 @@ &pon_resin {
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
@@ -1238,6 +1272,11 @@ &sound {
 	compatible = "fairphone,fp5-sndcard";
 	model = "Fairphone 5";
 
+	pinctrl-0 = <&lpass_i2s1_active>;
+	pinctrl-1 = <&lpass_i2s1_sleep>;
+	pinctrl-names = "default",
+			"sleep";
+
 	mm1-dai-link {
 		link-name = "MultiMedia1";
 
@@ -1246,6 +1285,22 @@ cpu {
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
base-commit: 1e45adb287ae5d431afc9900b4d387f4e73d9406
change-id: 20260522-fp5-aw88261-a02bb0e4b697
prerequisite-message-id: <20260518220906.347958-1-val@packett.cool>
prerequisite-patch-id: cf63e24b374691738276d00e569ffa2d8b94ed72
prerequisite-patch-id: 9a075067099bfdbf52eabfe3f7121909955c8726
prerequisite-patch-id: 5453ac079d39ea13d849f880f9dde4b0a2192b91
prerequisite-patch-id: 3768d28b288dbb7d3245dc0de3a289303c3e45fd
prerequisite-patch-id: d84da7eec6f3755985ba55676a3bc893b89f002b
prerequisite-patch-id: ea19cd4cd8cc8519786c6f05cf4e35ccadd70839
prerequisite-patch-id: 6847a49b36dd8bd4cbb422b6a2b269faaca6c873

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

