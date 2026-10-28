Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196365;
	b=QYzT9BBN7iessHRD1qPKZUJVzGnQ9+DngWPUCBSxVzxDyW25nCBfxh88vxfDNgPqa4Ee
	 Oa3ZQZbe8YDvGpGDwbhwCrhuzYdmqvIL9nlZJwoGQxzJH40IU+j7VWj/CDM2kWgBkqmcQ
	 OPzxaOvCoFpDmAoy2uXDyUUDMGMOsnPZK7FjPQ3E7Lah4/fbqPbi0ImLRCJ1hYWuGv4hd
	 a6QrBdfYBFdQvdsgWLrflGUm7AYPhIbVzIU4/oQ/BX063vMjru8lkr96Vk8h43C6fLrPa
	 Wkoj4H100v7Cx+cWuVGAeNISuHEYwG230PVh/oqE41Wh9Uwkii5XjN6byWsRYjLiP+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
	b=uhC8THupOjn+vpMAhT+nguTypBBIq8My67usAQ1Gz13krtfqJCKXGc8zCoEreqSKL3UF
	 WN8yDuRaKDYtFFmqIHtORrxkLkIwGTJv1hciQ6qemKBjMgSalaaJYg2FxWAlfHroo6kNC
	 Sx6n9IhjmXW1qTHoYygRMmZzQxqmESB3EJBLCZSWeZw2C6kEffvliJiGyZjKan02QtwDW
	 dyJutKTP1SFjEQrCJ0rGjviu4oQlRpU5t+5DEGcjV6DLYSqU0cPsS0ImReuwyCLLDRWbk
	 0hwyMqzdSEL6O9qYQM0XUmMlNO+Enl8j5/+HeSqE6VGqxulR7EReFS+gpZ3pvvA5Ysw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YydVNc5M;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC65D606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC65D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YydVNc5M
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8985045e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793196363; x=1793801163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=YydVNc5MceqShSejrFJ6Nbtu3be7qW5NHv4WumUtkz4Pyxan9pBuYLGklrIxcec97j
         KqLu41w2R98DMnDnh/e4Rs7oRHTyIP9bj2QzNmoftVEs/c+kL7i+32izAwqh1kWkcRu5
         HhiEO7WglZ65/Ao+0d0mvvNZkv3vp+ZvmGJRTXtT28EPYId3p8pmirSeu+6ajrV/P9ko
         9e+eKG4VHqzicDn8IocsbMBCLapeKesDE2TiGYLjIpeOAISEDmM7Rhra31uclXHTia0v
         ILWRx1yTrdS10eku7/MBgnRNPoJ9vdg+b+EL4X0pfTqEd/ZDY8y+QXGKFGD7QYyCgvQM
         THvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196363; x=1793801163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=1ZMStFnnLlSvL8V4227YFUEcpNzaBIgwKUcJETd+nNQZ0kUzUuXsqTOglm7cZyxYwp
         HvgIev9rZv1LxnHGQFbvgNaI5mGjSuf4ckyyNRtN/lLxCMMYIQvMKV/qBDJvePickRur
         nfXe59VLgd56Q+Imknrrs5Gc2etUoIz4vOaD6/q4b71dW0XghGibizh62qpqjEO3L3If
         KAoRlV0JZwKJG1NELW8qaIG0cOaRr8zQFzYPQlqeaqVtNsmcpW1/M6AI2XUitPE8MQe3
         7SOI80bYuv+In7Y7YcGFoLGG7N7I22hF16NcV05R6p+7y1RqAKfee2a6jgOZ0iCGPhQG
         Ff0g==
X-Forwarded-Encrypted: i=1; AKwUvBz563NtaG4j8bhuQEWzmgxucVF/bQelkiB7m3JkLquksmtzojZ+dzAF/WMFMuORSy5mJ3pHv+vwMtGH@vger.kernel.org
X-Gm-Message-State: AFq9FYLUUgVKlvXOQDTi2uaKUmiB5PFxn/GNR12bHBUMb1+hI1mfjhzZ
	uHazMkWp69XoDsaRG6yYVySaxB3UJ4t8TT3Z05vinQpUlWNMLE8MUgOF
X-Gm-Gg: AYBFou3SIaPr0nHAU4TaIFQDIPqGSiGZ2MODfWL0d6MTi2L2dqoFzchWjUqQNwE8wNw
	XNA6c5CwWvLmPm1K+MuQCPJdnBgDD8aG28OsFuyqBpfYavjjnxbWuuowj1KJfStlCeKw/9ohWSp
	QBknkwgkQB3234UJA5OpEfndnNHIBPz3sgTxsywZtYYBifPvla31xFh8KPTy8umk6UT2seB8vfl
	DmC5w7OFtKu8F00t/0Eg3hdL4P5xrt19wuyKxsoVolWUHjgQYdZfzHIo6DRjYoLkGHIlk57WeJo
	Eg1ZojIbe+mwmfPXRnB2Bu/auRt6GgrdBou12zRSCD5A2cBa4gmpnK+PFVjMNIVPwArsR7+ueEh
	LuvqJFXHUYGD5leg4C4PNO61ZE5vRCLh4zQ3JssGpXNAxg2dtjFQZyvsLRzbHuDkyDMC+WBhlSh
	I7A2WF4Lm+YJJniouOSePh0qCEvzKtCsUPKpAwn8o1y/PnRxb04NQrX2H585m6u2lVw5qT9+QX7
	TXoFrNW4lzExZJNUPJGJkP0iLNqeD6Pc3FV/7rjVH18kmtJs0RLNGsZORa3MJP5geFpWZT+Ok9R
	I8YAUQFpLkF4qQPkdPJiA2bz+F1jUulvjWSyF1rjM7Puhh8zcMJUlSpY2BLO4M7k+pWAIXi9KvT
	oI+g5r8PVI/4nzBDmieIpq4gSkTTHT3LPLNJXULLGlngDGd/u30bfWtTgv0rcOmycA3L4V34V94
	JrPNA9fOwnivq8GII=
X-Received: by 2002:a05:600c:5308:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4a96855295fmr50429605e9.35.1793196362728;
        Wed, 28 Oct 2026 07:06:02 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a977edc08fsm45906435e9.4.2026.10.28.07.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:06:02 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v2] powerpc/dts: Add Device Tree for WatchGuard Firebox T30
Date: Wed, 28 Oct 2026 10:05:56 -0400
Message-ID: <20261028140556.130612-1-lefteris.koutrakis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028110951.101614-1-lefteris.koutrakis@gmail.com>
References: <20261028110951.101614-1-lefteris.koutrakis@gmail.com>
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

---
 arch/powerpc/boot/dts/fsl/Makefile        |  1 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts | 23 ++++-------------------
 2 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index ebbf301e1..0a5c8b596 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -45,3 +45,4 @@ dtb-$(CONFIG_GEF_SBC310) += gef_sbc310.dtb
 dtb-$(CONFIG_GEF_SBC610) += gef_sbc610.dtb
 dtb-$(CONFIG_GEF_PPC9A) += gef_ppc9a.dtb
 dtb-$(CONFIG_MVME7100) += mvme7100.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += firebox-t30.dtb
diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
index 546e98938..6e9ec7f90 100644
--- a/arch/powerpc/boot/dts/fsl/firebox-t30.dts
+++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
@@ -4,30 +4,18 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
-/include/ "fsl/p1020si-pre.dtsi"
+/include/ "p1020si-pre.dtsi"
 
 / {
 	model = "Watchguard Firebox T30";
-	compatible = "watchguard,firebox-t30";
-
-	chosen {
-		bootargs-override = "console=ttyS0,115200 rw root=/dev/mmcblk0p2 rootfstype=squashfs rootwait";
-	};
-
-	aliases {
-		label-mac-device = &enet0;
-		led-boot = &led0;
-		led-failsafe = &led1;
-		led-running = &led0;
-		led-upgrade = &led1;
-	};
+	compatible = "watchguard,firebox-t30", "fsl,P1020RDB";
 
 	memory {
 		device_type = "memory";
 	};
 
 	cpus {
-		/delete-property/ PowerPC,P1020@1;
+		/delete-node/ PowerPC,P1020@1;
 	};
 
 	lbc: localbus@ffe05000 {
@@ -158,9 +146,6 @@ sdhc@2e000 {
 			reg = <0x2e000 0x1000>;
 			interrupts = <0x48 0x2 0x0 0x0>;
 			interrupt-parent = <&mpic>;
-			fsl,sdhci-dma-broken;
-			fsl,sdhci-ahb2mag-irq-bypass;
-			fsl,sdhci-adjust-timeout;
 			clock-frequency = <0>;
 		};
 
@@ -410,4 +395,4 @@ ath10k: wifi@0,0 {
 	};
 };
 
-/include/ "fsl/p1020si-post.dtsi"
+/include/ "p1020si-post.dtsi"
-- 
2.53.0

