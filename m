Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8E6344036
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063418; cv=none; b=js7lG/FPC13tVVghONaXOHpqWd8YFchYBzGpdRs2y7t8tRSFh1TOBmouHsUG+wWKa8Hr0FaFpdpVHCmB42iaU+jrMFBTPT16c1vvOUDVFQ3i6HRGv9t3/Z5W7fAUm6cTXEkJbj+NQCj5u34jyaAhQjAU5F7i6dC4YAP3SP71zkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063418; c=relaxed/simple;
	bh=2zGPgT53nMyKtGN4bplmgmbVd+Cg1WvfyXIJuEqowq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6D6nJ6Yu1CZ7HTRsZze2V8F6A3du65E2VuAvxhmGjizHcZSn/RSaWF2EPvCFQiB8hQhUna+QnCJ4b5kjsi0JUozki3Emem+xgB5up1RlbjeQQ0kStX9zfOyJ8L+jqlzfgA5NeCYCRV8QB7JSQEG3a/JeE/HuPOwekS0hVHH0pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYoyPS+Z; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYoyPS+Z"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbe41618110so303340a12.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063416; x=1787668216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Shib2rntu2e/Z5UR8HQqW2K03GJsazba3W0OpgQm6G4=;
        b=nYoyPS+ZMPPvddDFZE8AG33Q+GktB9s4k8cTI4i3nqoa81DTZPRP+sA4Yy17Sb4olC
         k7/tuVZOV1YEhnxwKVGdAcgT6wrvuoBocG25AFto7CKMEFdInSbjtDLKghlkOJQqetpG
         4NwbmzajPVH45HpJMRgOwrfH1AHyxRXSXSZFLRBbp3BRqrsyV5hJ2tj0IXjF2TWnZwup
         CBsYEHIn4WtJvpYFwRrDplNz3WnqajPaakG1itnhVEOEQI8EbKmG0SgxEl7WMceUELzF
         NrP5sOyrUedVkVnvWS1A/X4EF6LqZt9zHPbhrjFWOnMBcIpVtVXXgKgqjm6cQn9iQhDK
         u2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063416; x=1787668216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Shib2rntu2e/Z5UR8HQqW2K03GJsazba3W0OpgQm6G4=;
        b=PDDwo4LbHGAQ72Woo3GBSr42hrW8YpmiokSyTOj7gazzmQ5XotQwvpEHQNfUElTqwQ
         esRf+JHckT2OUl4/g3lEnKs1sjPnICw9SzfUqeXH+6HJAO1PtbQ5eOA9J2pd758ioAuz
         0rdhPACjl8H4W6z7es2w+305HBQCO76IzMubJJ9sxGxy4GH+S3dPuYpmzLbgkkvjhUED
         VWgm+JSlKNPp6ibuQmCKg2E7V9BnyM+GXD4nv5CqkOVgd9GocFMZuy6VfdwaQFRff8X8
         peSVUIr6ry1xtOqH/26T4O1L9CM6dQTIBf8LW4ulL1Wuaq9vNrnO5EvNHpay/1JapljC
         xk+A==
X-Forwarded-Encrypted: i=1; AHgh+RrMCz+NuMfyQFhIZQge4j9xFCJ1MOnMeHnvgWIygx34XqoeT/m9rttRxgvDeJj0CkUnnj9iY3iOed3H@vger.kernel.org
X-Gm-Message-State: AOJu0YzPJRBmtmpSrextX53mIcnRAufaJFH1eJ7HBQsWPEWEMsv/XH0V
	ZejDQUm/Bc1BKcbym89S6DE7EEXfsZj6TnOLA9OEoBacF6NzbYjMvueR
X-Gm-Gg: AR+sD111ayUVb0iMZfw4AsuV7rBxBDtVzHH37QuJObScR9ADM1EiN6DyiwwxXBPTpew
	MKpYI83tY4Ue6j1+zTGm7apuNNpmBHro3ItUbmT8dyb1WczpjFANCilcz9TcaRR45TItuWMn6HJ
	R7kL3hsoGT++VaO9pfHaaJ4jJR9aCDI0WKLtPxTq2t+KTriNBX5fersgb+U4bef1scF3tX8IS4X
	sYlIwgd9phyvEStidBlmyqdsS7sodo7/HStL5YVicZUjk/SeF6S3QJBUD0tEZv0WsNMleyGljux
	zmVs4b5kY4lwwTWf/Ya5UDMKUcl9zNAZdWUQHZnmTeqTCXLfFhfjLEiqbsNDlw/xU1Z3BPExc+7
	Vu8i3HFbnUgwdCB5i9/o9NFm41CVB/PKaChHdLrNtUuwzk6oZUZg1fou6MZeOynmRNqpGYzDANA
	s75zGBrgt6L7ZX34fogvobWTiA7MibFm1mzyroe/OIrU2jUpTATyLH6v4Xf76JcekNbpERAGB9
X-Received: by 2002:a17:903:3847:b0:2cc:f4d4:29a0 with SMTP id d9443c01a7336-2d3b0c9938cmr295090215ad.3.1787063416121;
        Tue, 18 Aug 2026 07:30:16 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:501a:6e15:dc3f:c23f:e55e:d03d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327b43d488dsm9043527eec.29.2026.08.18.07.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:30:15 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:58:45 +0530
Subject: [PATCH v2 3/7] ARM: dts: ti: am335x: Fix redundant interrupts
 property in USB nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v2-3-66fd44d66824@gmail.com>
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
In-Reply-To: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787063337; l=2514;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=2zGPgT53nMyKtGN4bplmgmbVd+Cg1WvfyXIJuEqowq8=;
 b=U44CBfLq+mbjkIIztglKnpvX2Szjq/KUNnCaHfRupVE20B/nuOBZ8VDQDiniFFo7nOR6ojcl5
 a0qkQIOtaOKCZggjOaSYj5Lei+aZaYsAaMkpyryBk3CoRhEFxzruH3X
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The am33xx.dtsi defines a single interrupts property for the MUSB nodes.
Several board-level files override the usb0 node to use
interrupts-extended instead to include vbus interrupt.

Since both interrupts and interrupts-extended cannot be used
simultaneously, Add /delete-property/ interrupts to the overriding
nodes to resolve the schema warnings.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi   | 1 +
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts       | 1 +
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts  | 1 +
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
index 1d83fc116b66..c436edd98e10 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
@@ -197,6 +197,7 @@ &uart0 {
 
 &usb0 {
 	dr_mode = "peripheral";
+	/delete-property/ interrupts;
 	interrupts-extended = <&intc 18 &tps 0>;
 	interrupt-names = "mc", "vbus";
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
index d430f0bef165..7da2fb782ab2 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
@@ -304,6 +304,7 @@ &uart5 {
 
 &usb0 {
 	dr_mode = "peripheral";
+	/delete-property/ interrupts;
 	interrupts-extended = <&intc 18 &tps 0>;
 	interrupt-names = "mc", "vbus";
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
index d21118cdb6c2..6bf388c4abbf 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
@@ -35,6 +35,7 @@ v3v3: regulator-v3v3 {
 };
 
 &usb0 {
+	/delete-property/ interrupts;
 	interrupts-extended = <&intc 18>;
 	interrupt-names = "mc";
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
index 23caaaabf351..068ea23bbc0c 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
@@ -376,6 +376,7 @@ &uart0 {
 
 &usb0 {
 	dr_mode = "peripheral";
+	/delete-property/ interrupts;
 	interrupts-extended = <&intc 18 &tps 0>;
 	interrupt-names = "mc", "vbus";
 };

-- 
2.55.0

