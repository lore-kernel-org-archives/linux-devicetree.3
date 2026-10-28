Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196602;
	b=aTaboB9xJ1x9tzeI4Bp3nW/luhIc1bLrxSvzmFOitkm5D7zwi3kmLSC+kAnPT+uOQMSk
	 CF0hUULSoQ0IHa6mhVkPgCvevNSStjXj3oL9bssGlZUbNx+qxuSaVYw+bcOKAEhjorBwU
	 mBeOeor6epFRFZz/4dXZ7kjo/M2OJabPqZJEmhTMpqY7J3dbe+++D7D1CKub4Q3ztFDDW
	 sE1qyYs21D/9Rg0xArNr8scYKS6I2KD48Pp3q4JwzzgZol7kzm7YLsXtv3sK8vtWAmrrM
	 BahmWDaOrTBbiYhVYCtsIi/7DkNnajBs2b5zpBk8yJSfYTKjiuwS1qdVNe2lox4rLFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
	b=ntzuPWkBOKJq3Dmse9NBRT19t6TSVALCnFzYozB555BIGurqakOKIKTXV6Bu2GdjGDvQ
	 5TIoJpW7Xgy/OqhUtm5f7nJhRg+mzk/U8pSUa3UEmAzm+vmF9v/7Ywtnn/YDoIGGtx0Zo
	 S+vl6EFpqDWqzcrjuKeCzbfvcSXMsRBA65tQ7nH7fP0sXZK3E7qV0vyHWzEuUjrZtKgl8
	 h+6x0Pbz4Zc4/pLXm9H4xcg/P575KIAvcRQb7PCVg7qhCffStT8H8DXFRRpQpqk11O3Eq
	 25TSeIQt2cmTf2WqCQspS7phZzth5mxuvJ3Z8Px7imsc+7u3pwF5bn7VAIEpWnmvyGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fItpK7tU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E5A606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fItpK7tU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8402265e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793196600; x=1793801400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=fItpK7tU+NEmkJyPe0T8FEJf11agbSjrURWFXVx78eaDbD9REl9rKSTwCb7pIWizIS
         gYvGm6zryzDCc5+aCvSRiAa7yaXh/cPRYBVf9m7yWUUmTMCnr+8qJm9Rp4op7fBAr+KA
         EqrZrwjhpoXrsLMX7m/hcQwcyQHVOMhwsed1MlTgXTDOzaXBBMX5rSePJUcXOpn7qgwY
         Nb0ZGQmWYGBAAk0ecyYcJir6SAHyU28IcfDC9y6kfWqaaY5hgNQ+Fko361DvZpTHRUQG
         ANS3HbdamnRppqwAqykntd85DHoKLF+7eQFbRisFCIzigQHJmg2SaRlERbWJ2tFL5k86
         TvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196600; x=1793801400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=d7d6Vm0+W2wmMaCMsi4CKRyOEAaXn8+I8Kq3fx8tzTB40R5CccBcWPR6IlnPAF6ecB
         W/w/t5wTHeWPBwBtfX0Fml6QpjjcNJ5qIMVT8uSQaunKK7QpQfmDMvf8d/vdEStx6DYd
         E2eIjrZjn5lAaD1c/rOAd3Syi2/BtLKqbKHuodwxpKMl5X/t1Fh+laZSzl+Kz/9iMDQd
         Fp36400XQe6mchclPEBfxPMcsoAmMuzgSlQeZnSd+63uo+IJezFRQv6w3Tf37Ez8hVd+
         00vABHgC8oJ5MBGIa813A/5Eh0RDjkRbK3myafdtxCES1xOBhg0bfnaeAZ325eTqyhmg
         xeRA==
X-Forwarded-Encrypted: i=1; AKwUvBx0hHGnePC3HnQ4amPbUPdSOgGSXkpmWuA2RceJPPEHjcDzBMQrPgyICnxTDkUHECeE5NpGeukEaiTP@vger.kernel.org
X-Gm-Message-State: AFq9FYKrkJg25eGC6fX4fgCTv64ywLDXsJPlUrprCsKnbZupU7BfUllR
	I0BqzN30AT6HH9hgeceQtNjffEjxbQo4fiQTK3o3AMzBmlhf11q+60IA
X-Gm-Gg: AYBFou3wSyYLJsK/Ejs1PDh7os5Eo3w4D55aV/B6o3JE8LQKFPSmoW4mij1RJ74UCWU
	PXAw9HorCP6YS5rxWmFA17DIvfD5PD+Q0hM822QgT8SU7j9WGb9+gpo9TLYsP9tCNNNvLagPucL
	R+zXr6zn2v0ALgn0lCmI8JwWoipKueo1w2Ek9nPzelyxLERK9kBxRjXVb4XcqigpjITU2i+k3zq
	UlgnYPpHiOMN3PxR1Oo6FEzQcsAb0747OYLQETxEBwfM0CJ6hlymrpIvNODqwlib/xpsIlU5A5l
	HjaT7k55y5RZJT9orj/3UsqOwu5ArZWJsgHSQR6v2IUlABX68VM8E57q5NYyDy+L8b9ai65DlIh
	mRJ32P9g5P+jmvyyYCLYMsVhmpuXNSmcUSSFPgGgleykO0eJVGCpizf4YceVWajg8xaH1+j/pEa
	yQu9pb1d5jCbYYxLVXxQyzImJNdLq5XK39aUHV3sredxIWH/BomeScPcADaAVRhuhS9WBkBLyPr
	kofbKREP+WLE6tQu97lrvZ0DjVyQQiCr/1pvx1J8Ifv4vml75MOvDTznI9+jl0sRpOnH/9IyMwg
	sIrnOK0tqNGvXFEIbAnLKR6e6q2halounWMohGqwAi+GYTTPhmPpovYhcnri/IUQLyEKuMBDhAZ
	cui9D//h6PKmS4vg39IQPAwmBNG0ku7jpF7r7JMbiRAsSCWdMyxkZSJZi32LhBJwrQb5ywToc9O
	oKQ8R543l0m9/MfrKv3f9vKPIpaaUr2xZXxWrn
X-Received: by 2002:a05:600c:27c1:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4a7c385745cmr111726335e9.4.1793196600041;
        Wed, 28 Oct 2026 07:10:00 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm28585676f8f.54.2026.10.28.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:09:57 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 10:09:51 -0400
Message-ID: <20261028140951.132607-1-lefteris.koutrakis@gmail.com>
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

