Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F168239BFF2
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996885; cv=none; b=YLVqDRtnEUlVMoo812TIZZmw3DNCyZ0LLG+lhE9DkhEzxoItoCS/lp+KVJ5xHbWcDgqcuFh05JMjMtZL4+IXQJpQ9o2FKLU0WfghQyJ2+4PNYxT9kokC3VzqNevhDuRfPDrhtN99IrO1PEsp7ytPiNiXjHSFl1WV4R6xbZvxozg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996885; c=relaxed/simple;
	bh=4ndvc2eILuxEmOTjhb8/K7C6peesQ/1CAdTSpcZCAGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYHouUJubyQatJzGedYBqYTTDVfgRiAnyWvFrCojuu+NDO0zb5pF0KcGwsmvRdiHQp2I2GFFRwI6PSRGuCjaScagJtFRfZgbdkE6+1i9q5wpupMUd2Sfh9Ot+AyAUJmL6wLCHyyHr/UX/SSKU5P+YZbwNLxnm5cqlk0NecW1wNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b8687630fso11552735e9.3
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 02:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996882; x=1788601682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gisI60aIRI94sbsFoXYOhSYGpkylj0kQ6heuxGTepDA=;
        b=KU50NwwMC1xadXxTod0i61OyOZ0OtOw5VMST0ILYxAzUYv4Mp6V1jCabPiwhf7MHj0
         w1zC3pqkL7V0LaY2ZucZHw0pQoHSm8ngNOKWQsff57IlAQAbAzn353L1OVVOgLmVNRuN
         A7LhjIu0IY+wgCDpGSxET7OMpeTD5qSdQbs2rQ92BuwzamFKsFcGBhl4y1mIDxnwehFf
         kIc25hKDO/DjMjZfS5/HpcnbEh8jQvjC+yK8wIdPAdAvwBljA5907tDbGG46Kjn74G6b
         mSDXAt+0e6rbUFenFX4oWzgXWVVdUFuKdGUX1A9yzzbi8Y6jZOu4Tram4Tr2BtESSMJK
         YknQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFYlSewl3eKbFwk74yAPxtoMsbyYsDnToEIMSkbLW2oVAxMFcrciGNcqr0QiBN7IBYiX1nIesgo8kO@vger.kernel.org
X-Gm-Message-State: AFuF++ndToA3TV5EQLeUedm6EnMGlqrJMqPTpwqpnHVz5SomNpGHFabC
	YMaR3cqd/R4CScPZoLqUomXia8F7YN7KGO7c9ziURdQYon9vO8hz33FN
X-Gm-Gg: AR+sD11+lb8bTvxFg5pdT3Y4qE8GWZ4nvbcyEoNVt965iD4YhCG5C/9idDU1EAQfTrI
	yjlVSxWUyvfOz4yA3Y34oZB4JengPIL3aoKSMQF3BD7+bVZ6/R1WKzeR4QnMX7B6rw06GVlInJp
	KAXAvNmFm/zrZAFze4c6vtrezZ+erFweL/ZClWun7nOakSCp50gY9FBh33UUOBMCzq7TrBehQeF
	G6BzyYqiXkJf7NJQRfxTSyVg/RIF7xi4GE7FBWE56HmGSop8QIqO+/z7r1uWY7LLZVEZChybXvZ
	LgQLcnTMSXwSRVjAYNWrUslUvw6qiXHgSTFnSJmVKa6BH+Hk1CDiBhdelMNv9kDlcRGNCmsPsL9
	gG5d10MV5oRKeEnbkPQ/PT/VB0U8UI38UW60mOzUjwVt/UKqtXZsjFMA4D1jSLB60Q+EPxy6LD9
	LWMkPljAf7yoQJ7UQZfkOamXqq43P7eBj+cvznt7bHBjCRtPhq6SMBkti5/zBtKG1PBovGvWh56
	yLR7Z3AmsWtCbxSrJLHnsr/l/Q=
X-Received: by 2002:a05:600c:858b:b0:49b:928a:3f9e with SMTP id 5b1f17b1804b1-49b928a4006mr137978955e9.5.1787996881702;
        Sat, 29 Aug 2026 02:48:01 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
Date: Sat, 29 Aug 2026 10:47:56 +0100
Message-ID: <20260829094758.23248-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two of the PWM outputs can each appear on more than one pin, but the
description named a single group that does not exist, so anything using
it refused to start.

Name the real groups instead, one entry per pin, the same way the other
multi-pin PWM output is already described.

Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 32 ++++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c3dc479b137d..8c4bd683cce0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -458,9 +458,25 @@ mux {
 					};
 				};
 
-				pwm_ao_g_pins: pwm-ao-g {
+				pwm_ao_g_d11_pins: pwm-ao-g-d11 {
 					mux {
-						groups = "pwm_ao_g";
+						groups = "pwm_ao_g_d11";
+						function = "pwm_ao_g";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_g_d7_pins: pwm-ao-g-d7 {
+					mux {
+						groups = "pwm_ao_g_d7";
+						function = "pwm_ao_g";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_g_e_pins: pwm-ao-g-e {
+					mux {
+						groups = "pwm_ao_g_e";
 						function = "pwm_ao_g";
 						bias-disable;
 					};
@@ -474,9 +490,17 @@ mux {
 					};
 				};
 
-				pwm_ao_h_pins: pwm-ao-h {
+				pwm_ao_h_d5_pins: pwm-ao-h-d5 {
+					mux {
+						groups = "pwm_ao_h_d5";
+						function = "pwm_ao_h";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_h_d10_pins: pwm-ao-h-d10 {
 					mux {
-						groups = "pwm_ao_h";
+						groups = "pwm_ao_h_d10";
 						function = "pwm_ao_h";
 						bias-disable;
 					};
-- 
2.55.0

