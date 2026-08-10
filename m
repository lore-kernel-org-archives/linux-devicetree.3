Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C743BE144
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359243; cv=none; b=S2dYvAoBnhlYZJrvG7UC6ad4Ri9RVh9I0QFGvXhGCFzRtz0Dz0ZX9jAVwGMsRrOr/mfFKTdiqJyAMexxY0Fxo6YuK+4dGRI/q1yEyobOyNpcH3ID8b4uaCTHG91MjB+TxNTetPPZA6NgY9tdVe3G8JhE+UkV52QWki511lmKkwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359243; c=relaxed/simple;
	bh=UY04sXqtgfZuiIRe9CNmz8m46h+7PvdCRxQvkLu8ep4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SuekuN8QXFd4EWBnt/mZAJli3ahflQ3fLiTQm+FFgIztllytamog33rpXydb4czoegtsyWM6UWo9L2Zb3GmI1Rj/6cxIRc/RfGyF/9rhdImbGeJTPhfB4WvHYhugTqqF3ZAmqcG3EQk8wx4bsoOtOJDgJIN3uDJKBKRiSuI8Rkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7uqM297; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7uqM297"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso18808105ad.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 03:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786359241; x=1786964041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geEdsZdmCC6yete2inWMzdlKXghMwGUV4jpZ5rwFRqI=;
        b=a7uqM297WYUMzAxpzyB62NLjxNGL2bWrio3KWDLg5TadD1YA4YtrAyLYPS2jZ87rG9
         vgQFVMcXuQwJb2ofKqKbHA1IUFnY58T81XGy24NxlKMv8MjgyKpkyGtQWFfsncQHtbUJ
         xoQXZMBhnfYuMnjxot/zabT+IZYNMNbkhIK7stArXPhBPM3V8b2Rx6I7GrHI1ueFYRxg
         4iUEOGUqAq1CZyZm5c/Z9RR+FVGwDk7+wq1a03TgKWa8A5J11mCZCf5maddzzJntiwpb
         ME8bFLR1wc7MQILMuumlIRK3j5ZZXATfeCjRVftQ32xniTwyT+h6UInM+LiUPCwW+TKk
         D3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359241; x=1786964041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=geEdsZdmCC6yete2inWMzdlKXghMwGUV4jpZ5rwFRqI=;
        b=qJ9FfrSM0C6EbOobpzbmehqa5xItEIdd2hujSuLj0dPiSMP0z3Ia3zBCObF2I2oEIg
         J2UyqiNJPf2kd7q14eKufKggE42WwBJF2iD4VeA8atVN2j61PqaqVfnUA2Z7SvPe7irR
         64fzPloijq5sbWcSoKUz+FAW78xBAWWva2SHwXylfmkCCGSqDm+jyc51yJxZ7O2xsDMF
         126XW7FGuiyBffYceVQrC3A1e9H9669uZjtSL/ESt9aODMx6tmBqu7TsMmsQ7lQmDGvr
         P+/4KPu9b5ZOyVIRsEmsDoByndSVCxVZZSWhLtmH6WHCPSzzI2QAHDXdFHkw7BMkIqHH
         Nw3w==
X-Forwarded-Encrypted: i=1; AHgh+RqVUddM0N42I6/DdpFPcpIPC/wthiYd7AukC6QTh6kft073K/LJyDnLDRw82Ydl6T5B8wxO2c2Q6Kmf@vger.kernel.org
X-Gm-Message-State: AOJu0YxaJ0/+IR7L0wsDckaazuTc70jqvR8OGgwLwyB/bOxasA9Zh6Xo
	1TXEifTPkq8JkRI3Xumu2P8thb1OS9Pp+Izdvl07KJBtcKB69k3YeZ1u
X-Gm-Gg: AR+sD131q4zH5gsZXotGxEa0aP9RVTyWV4XUgYXAQ5gJ6MRrC22HepUM0fLY4XYQtgm
	U7QsfdABdvjwBod47kAMfIe/Ut4FEC43pi793+swPstcazEOzIPxVoMfxjEahusS674SLt6dy9V
	fb9jPODNGt7ZQC3eEFH0CDaINP3LmoP+n0n1q25IbXd6I51cUZmx6ATN8Mqt9FPSFf9oP0oQvbi
	Z+g5hwaCaohAcM6HVtG5+UIBT1hstrxB07XKm2VuaNKua0VeHcjarf43Sux4yvyTKEsexgDWOn/
	UATRwrpJn/nhO32wWEpN+8Z46l8UWRAgl460TnkAHZnvlsMFJFiNAslTTa5bmZ3oTLqU4BGIYZC
	Lh4lWmlWBXABKR8SNz+rwn1hk8SU7OHATlU90swkil77xAxVpxJD9CVp9DzvB2CqyEwpFn1EpTG
	II8adUsl3BQ5MLvvje0XuWMoowlcApZ/d+Fp8V8H9WncaX+RFG9qU=
X-Received: by 2002:a17:903:1a67:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2d0ca82e229mr421183815ad.16.1786359241002;
        Mon, 10 Aug 2026 03:54:01 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7028:5cc2:57f2:a6e1:6be7:bb30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d15ebfcb2fsm32890075ad.55.2026.08.10.03.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:54:00 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: Add notification LED support for Xiaomi Redmi 5A (riva)
Date: Mon, 10 Aug 2026 17:53:37 +0700
Message-ID: <20260810105337.855546-4-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810105337.855546-1-imkyufie@gmail.com>
References: <20260810105337.855546-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index e6e708601..e74433f89 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "msm8917-xiaomi-wingtech.dtsi"
 
 / {
@@ -34,6 +35,28 @@ vibrator {
 	};
 };
 
+&blsp1_i2c2 {
+	status = "okay";
+
+	led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+		vcc-supply = <&pm8937_l10>;
+		vio-supply = <&pm8937_l5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "okay";
+
+		led@0 {
+			reg = <0>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+		};
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
-- 
2.55.0

