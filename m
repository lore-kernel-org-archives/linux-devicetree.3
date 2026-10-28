Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196796;
	b=GV00EiJe2N9Cx8ZJYIvbxb6WKfj9mJfEkW2uwty/nl9u/e1UitIWF515bIheRxKQwsAC
	 hKuDCi2vBEkflftJsTCawVfoYaNk9RBoIVgIIDxdAg4yqptplTyPA2WckRTatrU5lOwpQ
	 YzKCmCG82Ye5/4yHIdH3hT682WXCBM062iX9wMRLcyQRiH77rpw02tF2lGerxKILAia0B
	 CV6euSgqOwenorvPHk24UdKOqpyQlI9qMwRp7gBqZVAOpIia8jlWOeNm96q8nwjywhUMn
	 R8izJYykAb92oOb0hJr/dm4Z8o65wB6jv+5tSp3fkybjgVXuuawNc9sBTg5UXdNYxHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
	b=qqnNbdw4KmUwOXK3WxzSzeZwbUCPHvmGUU/7LmCyanWYKdcA5aPot9rmc/JIm14Ke9UL
	 o3OEWim2sKCuDg0YpqgPF+tRRh3VdT705k47q3UPsMwrM3ZKRceY+bCGCjMvokQl7sHQg
	 yz8pIB3+s5IIg6E0IG3E1RmHHFIiPmb4f2J/EXSCFBBzWxBkHYozNw9e0oLriEl21JOjj
	 eG43OorKYWK+Hcab7+4WkJQWw6SIkUQUkAowatKQMLAdC7B4JED7uLgo55iENTOb1qvTQ
	 X4nzsKdvbnIqKJJx6HYzB14cr8L55URvopxg/szJxDIspoiTu6yGF8M3cCiCQxFX3ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEkDtrmf;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48874606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48874606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEkDtrmf
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10872245e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793196795; x=1793801595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=PEkDtrmfhMSjaDzTEf/MvI9bOLokhLgNz/E7QNmjEAdRx937x4dYTvLxG8iuUrOkGL
         t9xNhkPV+fE9JAnuUkXl7kNKg02md9by5LhLYpLeMz1sMKarNAthXiw00M6bMl4ymhr1
         vD90R9zuLQL5fM0fOMeeetGEt8mDEMZCzVN0XOqYAfGjN15XLl1Xkz+iHy/ypoxL/WCn
         qqzDky4eendZqbKth826VX0dTG4122BpMdNQMS9Z1CLxGE1qwQFBKdfKbMmx8u7geO8S
         GUZQUpeYeKIEicQT0h1JlIb8Jpdh/eMZLADcK+Vb0c0EYretsmGARby4lqKl+jiLabuG
         QKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196795; x=1793801595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=CjryNlhK5cxFOjscCe5rxZ2+Qdsmxny6vHZO69f4hdGhT6AZdsZAfXKKvvPKyO5fBr
         C0cQEjHoG5K3phmyjm1fs2ai7MF++UTMjSt33GUmoB9aDKVvu4MXYmR6Wt/cXxa8CdS9
         z1J6RIRq6QD6945F+rxZx7/Ao6EvKBzZtK0Ocg50afuFKiQJfqzHZjGPyH4iFhnylucS
         50yLphaICzWm/G0B9MUW9sUSo2pcbA+kvyMCg0t5x8K048iKjSnWgzYtS5g1lPcy+4fh
         JI2jyd8eqdxG2+CazubzuIpJER7bV2uFMs3n06irIBPMN0RQ9Lqhqtg4M2DmEo3OuzsJ
         gepA==
X-Forwarded-Encrypted: i=1; AKwUvBzUSodDwNsioUna7DY+eFAulxGhnRq7/RpEuwKnZuIOlWBnZSbMszz237mhbPGQXW2Baa1mgiu8oEJe@vger.kernel.org
X-Gm-Message-State: AFq9FYKgPnqdGDSICea/IZrQ6h251KeETIa0bJbndhSy6y8kL361a8GQ
	jOKHT/oCmruru/D1WIfbl+OOhn/Y1dJqz1IQNLayH3uU+c7poU4T0qA4
X-Gm-Gg: AYBFou3hFREy/Oz0I6BF55dpzQMFk0C78cWw7j5t172mFwMN7+rCISUr8pqNvTUoF10
	jHVoJ6NSeQolClR8NS827gumfdAvtKm6DdFxQp2rZdrxY85om3TrXeRKdANnRyQwTKRO+7kKLaO
	f9fm7KS3IWUyYy1/WLIxT0mTmrhlZ4BToTLPrf0nxyhkfxqPLHgctP508FX7xp/VSjHGN+CPog9
	biQXQQEMsB7dBbG8AEm57IDU5A+UjqYT+39/jXT/eBDEgS/ymeOgA9i4xR05HE2zHjY+8KtNPi3
	2gfzk/rvG1wTYs2Xty4vr16mPTPr3nyaVHJAYRb6sur3WxeNmqFJtbhm7zZd7vaxh14z7z0JuO+
	8ru1K2YGpl8G3DQm32GBXalVWM53yHtvDtwRSk2AWz4vgefoKJaXsdYNpyG5EIVKiI6YnQnmo1m
	bVMbemotaXfww+pjcIcmT2R9MZC7wzGnmni/1oIJyEc0WWzMtmMrDw7/IjzosB109IlJ4JR1dJZ
	aMMPJClUbdpm6pDuo91soxBuWi9JYGYH2IGxF7UFgvU7LqANBrHFcXOct/C/uAutCsOSIqrLA+o
	wzjkwDS0NfJv4wUC33YhRqajmrAvNNyFr/rPfWo+7XL3IzLRBERecG+BdlzoUpXqcrZv5uFVXfY
	U0Fa0MWr5Y6HHsOJmaZtkd2eSWzo+Ix3/b5+0V4URJUJMXb43HxfiL0QM4m8+mYuJkuo4ytbMGh
	fizZfeZkf3GuUAle4d4CQl/8QqMmf1qAzlHnIG
X-Received: by 2002:a05:600c:46cd:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4a96695ec9cmr47593595e9.15.1793196794362;
        Wed, 28 Oct 2026 07:13:14 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm28345768f8f.42.2026.10.28.07.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:13:13 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 10:13:09 -0400
Message-ID: <20261028141309.134256-1-lefteris.koutrakis@gmail.com>
X-Mailer: git-send-email 2.53.0
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

