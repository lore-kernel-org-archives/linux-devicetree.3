Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05853A1685
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849505; cv=none; b=Bw+FVGmV4gaEP6HesVjh6JIN6SwTiz5ev3M0Zl0EGXfm/sJjXQcf8M9eiUTzcWTNPgCjuejYk3HmdeirKy8xJKy1LcAyxMiIHra8BO+5j69zlsKUR1cNKVS51Y2FB+N1es1sst8n/FWG6oEUcbmfzhbTVUz2i1QnAEn/6dPf2Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849505; c=relaxed/simple;
	bh=x8Grz8Kqtnr/cWgyc/taQbax1eaDHX8U8ipxLd2qWVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtH2DWx92X0ukNDdTXtBChUWjnBT6KC4XuXAqdlLdUqGxxGxQOjZjS4Rp8p9Ki2U+MsyFuVVDP8YyPP0vJNazfiUWxorE+2r42Y+aLEkBPstzxS/syR8M3OzOCMJaB1VHDCJYBY0SQliQT1XottGcXWeuCFH4nnJk+PbbJol0Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfhgD+f/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfhgD+f/"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38df94d4dd8so6585a91.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849503; x=1784454303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvzgOVO6jhm4u4fWUb2VkpKCzhTp79gobTgqrCwBTWQ=;
        b=FfhgD+f/ZXQm9LSyjsDYHMvT6/VdWU7shqDx9LX3p1TCpeA7Em9mvPkmamGz2fL5y0
         qnFY0ObXzKJlx2Nb9/aG3OUM1LoQm+MFWg2cUKcyD4n8CLv+76Fb4n0CubHM+T0jkqbN
         yMJVNaB42TtdN0saO+GV5V7AFaQxxcmCb2HR551iO8L3zuEFkgRsuMiKkbWrHAXaXLox
         XROU0tWvMKo16DWtHOExk8qQNhLtnXOCF6yVv5mD6GFiQYZ90sdTvyZac/tlRsQQ54oc
         c9kbfeio6pmrAWOxotI2az3cDENiLHEH8/HehUgoGtOY6ZnmR9UkckIgP1dDN35+Wrzz
         dpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849503; x=1784454303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvzgOVO6jhm4u4fWUb2VkpKCzhTp79gobTgqrCwBTWQ=;
        b=OolPH9sngLWntbDfkspIfZihl1QcsvSp6+BqkJQxmOquAHQ5MFPcyN8ofhXUGbnZ/g
         OOokL1kYRnRlP4Ua7Od+vRaI23ub0OSdRwj7lGX3Rl3EHwXu23tDaNw2a+fLtUGQ/DOT
         ZdNWOVGYSo+7LYqo6N2fQTtKpsQ0ipQZTq7fLyYeZ3Jns9Mvd78Y39wnlDqunLQKvdNF
         ras8j3hszLEr9jyMrNGiEKydYctFvzStt26xrPkdVEXDnYvBxEBRDlpnemFe93Lp0auY
         2F6ffCzVd/G6t8R1t0AMQQO0wTMmaaVFgO2Uyyt3t5qsqz6nuo3hdE/G8WchpGjbbUav
         XMFA==
X-Forwarded-Encrypted: i=1; AHgh+RpiAmGbRvDiXZrF606HOvrZtt80UZPA2lCbmuUGHPeslKTljbED+jlIXkGE0TP7ewJW4wxFGwzj4FwO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+Zw66AJ2GBKslaatCGgBg8ov2J8kJC1qQOvk5DUDYBmndkPN
	8GVO29jsnTdEjQ0HWYQIftd85CJDlDv6zPuJGoB1PoguRMLaBmCcVq3x
X-Gm-Gg: AfdE7clU0dDHCMadH9hOD0Mam1rKWER9G1ctA2d/uqcUmk71uXRACw8YctwuoBtyTEe
	BLvNlVJVEK1wKfGFXUtCSxYX9uXk5im6f2FD0GNhA4axPAldtOnpW8VsHaZEdz7jhWeOKa6lK7Y
	Rl4/XK9fRy/7PpVWxL34sBLZAVqhLYdvRWJPrRuubSwi+e+D8/fQ3aVivbVqFpYygo5EPjxsL3s
	DCswNObdUHwk1xHqsn13V8wIQzOtxXqbhkMqlBsb6p+5j4RA/MSc1F+wpDGJ99AZ79a45rmlS0G
	fDCW+FpgrZTMrF+f5dUPhti2ORZQgvhnwUXIMP3Oz58M/pqVI1Q+NAjG2pS1aSaw3OlVJatvs9Q
	aARgITQRccTwusZzu6Ifvk1aw9gAOWm+qyHx3RGy6MjJwr8G3EGvxWq1e7FCcZQwTUGcpD1PJIS
	F+mDse72mlNVQLybESjMrXEOx+EFFeU5InMv+KJS/pIm/znCtWzypd3/QcAvaDMpQnDX1XGiNQi
	n/NEMGVzKcgpKUYvS0acgauuKSXvKSLQX6/ce5sHAlts9lWjZ9Nt5fkVwLlt9hq
X-Received: by 2002:a17:90b:514e:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-38dc77cf117mr4925674a91.40.1783849503296;
        Sun, 12 Jul 2026 02:45:03 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:45:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:31 +1000
Subject: [PATCH 12/12] arm64: dts: apple: t60xx: jxxx: Add device-specific
 SMC hwmon sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-12-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2858;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=x8Grz8Kqtnr/cWgyc/taQbax1eaDHX8U8ipxLd2qWVQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/3dR4qK5p210l/pqS3Vv7mW7v7f6a3pPXXqx/VN
 NhzM2Bmx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqPH2H4p/mTUfXNvp1bmnnO8ZfNF2XfMTfIIE8nf0KO8IfHMRJzGxgZOuR3r5H
 uuX197szpeboFmqt5+zey2S1qsSyYfvZDi9V6LgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the device-specific hwmon sensors for select T60xx-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 2 ++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 2e7c23714d4d..08276114c1d8 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -24,3 +24,5 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index a2a24d028cbb..e6eb6b6c386d 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,8 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+#include "hwmon-fan-dual.dtsi"
+
 /* delete unused USB nodes on die 1 */
 
 /delete-node/ &dwc3_2_dart_0_die1;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index fee84f809a9c..caded1636f3d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -367,3 +367,5 @@ &atcphy3 {
 };
 
 #include "spi1-nvram.dtsi"
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index 7c7ad5b8ad18..e3c2635d84fa 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -45,3 +45,5 @@ &pcie0 {
 			<0x200 &pcie0_dart_2 1 1>,
 			<0x300 &pcie0_dart_3 1 1>;
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 533e35774874..82689c380cdf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -35,3 +35,5 @@ &port01 {
 &pcie0_dart_1 {
 	status = "okay";
 };
+
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 31f24bbda968..f50a6d56f3d8 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -44,6 +44,8 @@ &typec5 {
 	label = "USB-C Front Left";
 };
 
+#include "hwmon-fan.dtsi"
+
 /* delete unused USB nodes on die 1 */
 /delete-node/ &dwc3_2_dart_0_die1;
 /delete-node/ &dwc3_2_dart_1_die1;

-- 
2.55.0

