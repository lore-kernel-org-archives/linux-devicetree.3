Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FC032B10E
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781768452; cv=none; b=R+YWO8T69fkglyHaO3I3FqihjkIqKIfCI6kslSD0kjupCAa1HUgOxJc6Hvmjp3dUpxHB1a8Hw4lwKnPcTEoEA9C5uv1Hx7GJMwV7xgVOTpDt+27gbIxr0cIE7kAGTI43cN5oj3jT8Qctxj3kXyADEgnJn4WQU/sNTaOwm4eAXD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781768452; c=relaxed/simple;
	bh=IGy8dSwMRvN0RUNzS4yQN9vBjblujibQ6wVZmTxzM6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AA59mcZh1+lfrxWES2A4+fSIc4j0Ejt4IgH8hyEp6YUuM2p/s+35oNKhwEYm5xR1WyxGsvgvyHp9anvRDxCIW5+pixRrH0+4qQ0zltX71KEO6ywzNmjqMrtANGZ8yc375AoBILgB0C5eQ03wV0+dwltz46314HpBGxAoPRJ/sMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cs2oZ0Pu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cs2oZ0Pu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6ec0af575so2598485ad.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781768451; x=1782373251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2/FZLzoVxADBjl0oAzsk6lNUq7prryi/YMGy+b9ziM=;
        b=Cs2oZ0PuyrHHJWvNW1Un4g0jwgP58pNGhpzXV2aI2SehrXWlnF7cxri0kfHYFi76Sh
         OqtvNuWe8iRtPBHgxVvhB4+yeJ+nqXYtRRBGjv4k4gyKbIN3WLmEpANJpa2fXJPh0jxS
         gYosgWzSuc7yQ9Irjzzkx0d8kwUFqwpCUM5twAin/kj70LRgxiGza8XDizUlkI9Lrnf4
         EjLtu7rCVTzfMbbxv9ACxK8BIq2/RnmPOjqs9phP5McL9kp8Jyt9MHogkLouP1CT73Y/
         pPrmi0QMFSS/SZpZDu73AyEli4LaoxxAu7COfTEE3mUF4F90+usPNY0YbSiqcVxVx7sy
         66mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781768451; x=1782373251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p2/FZLzoVxADBjl0oAzsk6lNUq7prryi/YMGy+b9ziM=;
        b=oyg2hg9eC7EaD04GPftpCZWcy/P3xLnhvEVXfrjcpiNcJzLvGh5Je9Odv0p1+Wg8tl
         z7FCgE7oiMaq77HPHm1gr+fRIzv0sbecFDdjEVseYilf6bg4VmJzPfDekyjlzL8yikNQ
         +EwH0GutjqTsggniGs4S1t+E/KxI73SyaugLMWtu2ZTdGShhEod/ZHfNEGPA2O8MTHFL
         W9oijzOqeVYziuUeRPOUdlMlJYg7vwa/AqBLo+DFWIoqNwnYfK9xZg0j9Ahq5wECKzWo
         V8glwfADT1ZpFyXlqObOUnq9cOIklHtv5iCkQEzh+f4LEr1PzPKumlPYjDE83aYP6P3A
         wGKw==
X-Gm-Message-State: AOJu0YzWrfaHTaz0Gp23T8LOWhsrtOr5VEmxaUlu46ZF0ITo7eZyIqFy
	jDJ1HBUhvwOMYRKliQVqCbbgkHm4KjP6YOLH/4umiYG1yjWxU04y08Ix
X-Gm-Gg: AfdE7ckeGYLMpzXTS9y8woyK6TXfy+AaT4D1+v2f8hkYBPyneeKUuiVCFzB8zCriOZQ
	mv4Aj+/X21dXzk0fO6valPiFonT5aSYgDFajYPgmZioEYGIB3QhNbMFihf1SWerQjKVdglEY1jk
	41boPsR0rZtZwqrgQEW5UmZHc7c+sPG4jCfCSHFHtbb+Gp3CeJbu4La1ToPs2z/fFR7ec5hTgtk
	p2XcZwSrqdxNt8tM9LmfdI7BGbJ2hpn0sveKpbw31/bHTvAJ8H8xBQYnBCtAhOp4yoRd31dET0M
	8fKawq+0wqUGFcAPijb+TJp/eYsfPQBGV5q/lSXvu53RED5VKsMjxnCNLTmj4Gi7WuBNrYhg4yX
	iW/wN+/Tf4Tb3o34oXOBP5zjQR4Z9125nXSYtXN7kWEuj+jBgvUY3Ou2LcOXbmdCISP00flOVI9
	VZDFn8eZ8TZfEcgPqILzQMCRpkCRunwEGWZ29jxLMRsyGVC5S552L3rNlS
X-Received: by 2002:a17:903:2990:b0:2c0:b9a1:6493 with SMTP id d9443c01a7336-2c6bc0b5814mr75341575ad.10.1781768450629;
        Thu, 18 Jun 2026 00:40:50 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac80asm170465445ad.39.2026.06.18.00.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:40:50 -0700 (PDT)
From: Mike Hsieh <mike.quanta.115@gmail.com>
Date: Thu, 18 Jun 2026 15:41:44 +0800
Subject: [PATCH 1/2] ARM: dts: aspeed: sanmiguel: fix PDB HSC shunt
 resistor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-1-cccf959c9b78@gmail.com>
References: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
In-Reply-To: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mik Lin <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mike Hsieh <mike.quanta.115@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781768507; l=1735;
 i=mike.quanta.115@gmail.com; s=20260522; h=from:subject:message-id;
 bh=IGy8dSwMRvN0RUNzS4yQN9vBjblujibQ6wVZmTxzM6A=;
 b=cbfHOcPtJb1bDBHBy3LMkGMxGonf7vsB8e3wJhKElSpx0qCCCNUODeAjxlx7HFfDxdrU3ZWvf
 Iz8Tq3lbjvMCBCJfUp0WenMWljz5JEkNQpngeuvlpn5ytFygSFQaUon
X-Developer-Key: i=mike.quanta.115@gmail.com; a=ed25519;
 pk=DRIErV0xX0KMBlR/irAsbuN4L3egitHbC8FHruUH4HE=

Correct the shunt-resistor-micro-ohms values for the four TI LM5066i
hot-swap controllers on the PDB. This ensures accurate current and
power sensor readings from the hardware monitors.

Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index d7ed497d7227..3faac0925a79 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -450,7 +450,7 @@ pdb_mps_hsc1: power-monitor@10 {
 	pdb_ti_hsc1: power-monitor@11 {
 		compatible = "ti,lm5066i";
 		reg = <0x11>;
-		shunt-resistor-micro-ohms = <763>;
+		shunt-resistor-micro-ohms = <1000>;
 	};
 
 	pdb_mps_hsc2: power-monitor@12 {
@@ -461,7 +461,7 @@ pdb_mps_hsc2: power-monitor@12 {
 	pdb_ti_hsc2: power-monitor@13 {
 		compatible = "ti,lm5066i";
 		reg = <0x13>;
-		shunt-resistor-micro-ohms = <294>;
+		shunt-resistor-micro-ohms = <321>;
 	};
 
 	pdb_mps_hsc3: power-monitor@14 {
@@ -472,7 +472,7 @@ pdb_mps_hsc3: power-monitor@14 {
 	pdb_ti_hsc3: power-monitor@15 {
 		compatible = "ti,lm5066i";
 		reg = <0x15>;
-		shunt-resistor-micro-ohms = <294>;
+		shunt-resistor-micro-ohms = <321>;
 	};
 
 	pdb_mps_hsc4: power-monitor@16 {
@@ -483,7 +483,7 @@ pdb_mps_hsc4: power-monitor@16 {
 	pdb_ti_hsc4: power-monitor@17 {
 		compatible = "ti,lm5066i";
 		reg = <0x17>;
-		shunt-resistor-micro-ohms = <381>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 
 	pdb_ioexp_20: gpio@20 {

-- 
2.53.0

