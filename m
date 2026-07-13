Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9787384CDE
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940426; cv=none; b=Kz81AT6XT+hN9g9pmXEM0DyiFDSxf/9kJo/2p/SabKqBfzhV970cP6VEDxc4dYn49as9yo6EcMH0lvknCFcOPvYGyJJ+EmLmBCAOolAwbH0XLMGwRua+sFezB9mQIJQJdB1xDdKc/dRAaOWLr0GyoJn2HraOiYFQcXsDUtFON3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940426; c=relaxed/simple;
	bh=f6iZUJEfQb1Bf022sh8AjFMkxBGtXM649nnF+HPVp98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLMCBPh4tX/kBHx4X9b2M55UnWDUStR0txH5xTr0MzWcA4JyDKxvM0XQu/bETgiO5H8qj5679gkioxxkewkrQkaEDJnLem5TwWUP//j6d/RBLRlrbLTlRBtqpJmiGvj54hEl9laD07gegObAAk3+p1HCNzN/bkzzRcli7pe6fZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=h0W9mf2P; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="h0W9mf2P"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8487b7b3fc7so1086989b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940425; x=1784545225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHMZx75Kp4IqzfyIVXcCNI72mZZvOdecszaJSRJoUdk=;
        b=h0W9mf2PWkBFmZX7+5GkGETsns5BvHw4R1lIsokbWGyj6+k8KiTRmjPVB/w29kaUGZ
         AzXfLZASHuAVzTqbm6A56oIp7IsEziz+QBkUqAGWLFG1BsGSy3cOQuTMbt5zUf+kOVm2
         oZthZoDIwtWBB07XwSG12NFALIBLQgOlI6SuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940425; x=1784545225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHMZx75Kp4IqzfyIVXcCNI72mZZvOdecszaJSRJoUdk=;
        b=CYhD1MFiyDPlDtXMmMxWPSKYRZRdYoYYwf47HesJonRMUO5Xm7iJ2lQAutHw6s2r2Y
         wVZqtIGRoZ/byhyToEQA2yi5j7uk8FoRmGUGcC9BPvxYSBqh7A5YKeBvF3Q5zXSwQoVH
         Hra9muNJA+dv9hGI2Hl67AZ3kRBjC8spiEwZfU5bfh7MffoAhPDK+ogmvjwTwptxv1vO
         obNgFXqk0Sn0B1DsOfOLclmCIZ+ZyGBA2ZMp8FWnDFPyFfIMQqGR8zwgmXMQ/JIRqJYW
         8cFsLWe5WFXuDuO2HrDuY968fQDWwCvVBpD2qlDxaYNYRoMEzoEkHOh3LPhQRk9qdVsN
         aGMw==
X-Forwarded-Encrypted: i=1; AHgh+Rqp3GyFW37JcTzi4f1BLE31CtUszsRilTeSViup37GioYlxQa49fhNPiLVY60VrKq+zjQraEaIX74zQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwEdBEoAf1WI/A0BggB0LLgqoekvqLCgWyvoFOV6x5woZhTQXwB
	I0iQ1hxUU5G2ggZD7S55t32yRlewFCkoYQyYwxJEh2aQ3S08LKgnMpeEs0kH27QbMz0=
X-Gm-Gg: AfdE7cm2GpmvpQq7BOBL2DGNkwYwaGSpQ95kYuXNP8Usxwvf8lWfiupddr7wwtiFRNn
	OkeiYrlSASFKrickf6izWK4bAgjaG3wI55WcSBDqdegb/oZrRKsPakHRzVSmQVrvdOe4UZWa2IO
	DJ+XymuKMcsfqhcic+kzvpvEJIP57aDeNmXuCJwyk0xjv7l7LRX+D7goAQLLdNMnj8QyOZ4pJmx
	RcEkPoE99dWGVwCXhcvH84fHaWzH7Eqx+EBGttz6TE4nUTSRufrLoVYI5hbhrvpH+WTNTqg3xOO
	VvQEL1eJJxsq4BDlCIHODvTwIdVe7VBKzsqZ+vap6ysDnxvwS1NXO0TJHrU+slTt774Kw3mSUqi
	HtlolXajGdssgLabit7OrGQG0OwuvHEK8vbiiKPbTm4QLXKvnq1I5/Nvw4Tz1JEMLorsQddEMJB
	VMR721HO0jOJsbZsniUF0Aw/eaaw==
X-Received: by 2002:a05:6a00:a212:b0:848:79af:8b2a with SMTP id d2e1a72fcca58-848896863bcmr7700636b3a.27.1783940425055;
        Mon, 13 Jul 2026 04:00:25 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:24 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 6/8] ARM: dts: mstar: miyoo-mini: Add vbat switch
Date: Mon, 13 Jul 2026 19:59:48 +0900
Message-ID: <20260713105950.1346962-7-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Palmer <daniel@0x0f.com>

Add a GPIO controlled fixed regulator for the battery voltage rail
on the Miyoo Mini.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts
index 5e927f41fa73..fde4703eb52b 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts
@@ -7,6 +7,8 @@
 /dts-v1/;
 #include "mstar-infinity2m-ssd202d.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model = "Miyoo Mini";
 	compatible = "miyoo,miyoo-mini", "mstar,infinity2m";
@@ -24,6 +26,15 @@ vibrator {
 		enable-gpios = <&gpio SSD20XD_GPIO_UART0_TX GPIO_ACTIVE_LOW>;
 	};
 
+	reg_vbat: regulator-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		gpio = <&gpio SSD20XD_GPIO_GPIO85 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &pm_uart {
-- 
2.53.0

