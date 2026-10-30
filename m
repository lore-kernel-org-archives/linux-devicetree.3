Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323945;
	b=p6ewVXFkvquITfNtd4XNh2NIB+BLqczF27CFL/Kz5SNOSmwE0Ds5my6JPu0NgvxEGohY
	 nd9a2PAHfih4R8hfFv+B5qvfuGbghRpr5Elag3GzkSRSURT+pz1435pCR1LZygd43k0MI
	 nkA71IdMYhYmwt9hyRSI6xe18OG8B+yvW1hrqDNyg7GmiFtTuv0B88TrEvcXzzFc7+2uE
	 84iru80hIwCxF53ISmkUFDhdIrYsgqTCehoPYszLLk9r469Y9+VFxJ0yM9npRO5CRFZPI
	 QUVcNyoh9HF5EzC/0W2XkamFOw6F7IEPtpGoug0yHrohD7YtA6uke3X+S8ssq5+2PJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Nq5H3D0euCZbOqXD7Z9fPhPXwWstdtaDfGJwD5+ZOc4=;
	b=Upl+07WL/67/GCtimwaIL1ZzwOWinYDFU5hr/gJZsSeeyp4Oi4c9ejy/sWA5Bme3MXjC
	 gXrzBl3LCNbSwjdWGRa7NVwrDLlQj4aAy2kDH/diiATh6r1r5KRSfL2snjm0wsDX06kuJ
	 LCcOwEotxODPlxtQaHjgrbE9pI5jiFk17LT0UZ0v99h3dfgMIQ4Ld88qnWMG6SgaDVVmF
	 mdyHfKIVA4nJc8YteOPCjmvlr1W8LMgdYYzwo5QNIodPFDPiWjfBfzx4923iGKdBYjhB2
	 Fu8NkTewCOgSn66MFb5DEV6UnK8JK2g7o0Yi6Wky4v+7GTfKdjo4yqJXKFjeJRfaJOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e6/bSjPE";
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B51606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B51606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6/bSjPE
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2eb0f1b592bso628555ad.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323944; x=1793928744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nq5H3D0euCZbOqXD7Z9fPhPXwWstdtaDfGJwD5+ZOc4=;
        b=e6/bSjPExYAE08iP9BXgZtCJA/pAPuh+uQXUpMG6VAw4Rx/+O371EsVOT1hWKh4E/2
         5P7vwmC8HEMRm6FEKkjRilzkgATY3qs8I0Ldm6YYIH4+I517NqZSCT1C4g0nc/pMfZIe
         F8uuFmjfKqXMBlwpzoWNUUkF8q9VIdFmSZM9WDIeqEOK4OPmCpN8tnib5I4dWgMVZ7kG
         J6GeA3Av1zVevFv1tcCC2Z7bHwXnOmb30Z+oB0K9t8NhoPOS3Uc1I59TAz3afWYoFsm8
         fwEIx3YY//Bw/RubdhzKATFpUsinkz0Ckcq5GYguAUWpMK6WCqCiri32rY7UJcuPx9fF
         lnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323944; x=1793928744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nq5H3D0euCZbOqXD7Z9fPhPXwWstdtaDfGJwD5+ZOc4=;
        b=YcKsgwt34u4gRG4JuAeJ1Iyl/ad+e6Dyfbh/c5XRzU6GdXy/HbXqzp4VvCqe8wuUub
         +gzSDq5/FJIq3dBJUQsMSyp+Cp54SvmPJR3dpD5jGaxz65m+KlKG1qlW1Bm6FqRKPa+X
         YMudLZpVBTqiG99Lxx6wcQcsa/drWqxLBr6ZEjQ1IY5kfRbYJX2qojFQOp/z8hnB1u4F
         K3Wj15tk3Jh9fwyzbD9VKfK8sLAP68PooLih0Sf2hqPRit13LOM4Z9Wh3mn2UsAdnqJ8
         AV98UtqzCbFvcB0j9bMp4VCiCYepyqU7CBiNe6IXRHoFx1FVerKqO9NIv0YfwfMguG+3
         TkUg==
X-Forwarded-Encrypted: i=1; AKwUvByZHXa9W5to4Zjf9Ma24wDgn9ouo4XJHfGSrdhabAcXpi4FAw7sU28Aq44fX35VSDHLsWENHMh8MNSi@vger.kernel.org
X-Gm-Message-State: AFq9FYLPfpICLH69AmlxXPt+tRoQAIMmO1qSlIWr74ldVDq0bI9p8r3O
	Ccpd2afkIJPiN8fo6HJOWdH96ELu4v8sMMV31ZBONzPcyd7frwmmJ/keuYEB4H4Z
X-Gm-Gg: AYBFou3omXaZKsZ6B3MkAqxLGciXbZJ3DiPKFYXH9uC/TTjh+HWwOoTi6RXapOaHmV7
	nwPnDEXwGzmU2MtwC3SjTJg0S1qbj6xjlw/ANo7GKtTUCjzDkiWwKfOIsWgCdbZA0pu33xAiB7H
	QrTNe1WPkw9Atz9I99ohicjmk/74/p3Yk02XDWPI04kpg4iEBDGQJXdDM8fqo8yuF2QLTGHYJBU
	KJkaHtXfxa6arvRrC3Lhqo57UkyaO6fu9QBP+1ulTQvq67qthiDb6euw4bbmNTBV7Mv7qdZyXsG
	dpRrX2jC4394v/9bY3IoWjWtSBWPOc30+owvtqUH611jHLQAUQ2sX8BUX2vSYLyZE8IwtFGNa/O
	Ckeo33jXfKMKddux/3UXWFqO23DiJDzm2ZEHkPa/Pl3nTp3uMvS6vZEyHRzk+l/u/pI+idgoRev
	DCIzdAUkdNHtBlnuCIL8VD6eS8/Busaw3FwKnpveQ8BqLg4exRrkEbW3XxiJ4oJPFSzgbTLixge
	0amen/C8I6N7Aum51V3wAKJKIMI1A4X5vceVOq+0aM++lT8Ykg8taF/cIqr7A/O/YI84cFY9lLt
	JbnxPU2idzws8z+W9KN3hrbhzW9r3c9BiuAAfXj67KRq
X-Received: by 2002:a17:903:37ce:b0:2e9:7719:4104 with SMTP id d9443c01a7336-2eb36395be1mr10276435ad.8.1793323944232;
        Thu, 29 Oct 2026 18:32:24 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:23 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
Date: Fri, 30 Oct 2026 09:31:35 +0800
Message-ID: <20261030013135.158157-7-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030013135.158157-1-dc_redstone@outlook.com>
References: <20261030013135.158157-1-dc_redstone@outlook.com>
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

There are 2 LEDs controlled by PM8150b on sm8250-hdk
which are not added in the dts file.
The LED1 is for heartbeat indicator,
the LED2 is for wifi activity.

Enable the LED controller of PM8150b,
add the LED nodes with proper triggers into it.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index f25447f1d..58b58fca4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/common.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -618,6 +619,24 @@ &pcie2_phy {
 	status = "okay";
 };
 
+&pm8150b_lpg {
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		function = LED_FUNCTION_HEARTBEAT;
+		color = <LED_COLOR_ID_GREEN>;
+		linux,default-trigger = "heartbeat";
+	};
+
+	led@2 {
+		reg = <2>;
+		function = LED_FUNCTION_WLAN;
+		color = <LED_COLOR_ID_RED>;
+		linux,default-trigger = "phy0tx";
+	};
+};
+
 &pm8150b_typec {
 	status = "okay";
 
-- 
2.47.3

