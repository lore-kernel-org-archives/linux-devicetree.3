Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185803;
	b=hUX1P4bdi8ZjgjVtSn53bf5Jv3rp2CL/94KVeFGaK94iJYHj9GoUF5nehIJ8PE9mFR93
	 wk0GdIp7Vovfcc9ICV0tJxvHdiDlttg1FKV1/WKwAai3S49VL+9Q/RG/RVtEdSE+kzFCQ
	 aETcwh9vmq6vCulaYXbVbvvv+ACkFovhNlwhLalU+h5h0KXJa8vyUGFMJgy4s9JKX97E4
	 Y49e3DZ9h4HVNgAQBT3NkotKUasbZ6pxvvei943dCyPdcM0ICjuW7HZrsT6DEuqTk5a8N
	 f/ZEhjuycNnfvNATNwFpwTgiy5Z6/QJN+c3cn6FYxofclOMbn5vJdscohzOU3lcEWyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
	b=qhwZOnH70K3u344I7mLqaiZNr3yaNMfy8ki9tyru0GbFZSCR4mHlZ6Mrr/n+SX6m/bUw
	 TgwZLB06Q1LYrO1F5NBaLw1AslgT3Aaf/a799LE3wKVnKjrPKVMpnICE9u2GWSUJe8+S1
	 r/JjakOtUWb4fCOR1s5WHnmZjlhNYrkP2vIS3eAmwtI8Ic9/6wwsqbCVFpccnbBHBnE8k
	 oaMgwcUwMFbOPndCcTaR1x1WejKQxMgcm+YoQO1x0j0pe+pYaSg33aUldRyYi4sb5PpyG
	 3HSATcXZJZk53hPsNwna/Patx9BmBNoAr7eJqNORa1AIxIPL41d+OrRkz4WgtKcZepQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPj49Iuz;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6386606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6386606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPj49Iuz
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so694903f8f.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793185801; x=1793790601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=xPj49IuzuZ1wi/oN8i5dMxmTGVoRVIXeRSPoIADYD0M2mQ2Aww3v2ag3C1IsfgcqzB
         cJjAxwHLh1ALNoimrVgexgVW5M4Di0vy2bWet40KIAVfZMRResj12+ytwvGRx/xMQ+tJ
         CEEbBUxgPKpLAvE//+2z8yyPz/O+YqCZpkGCAwuJ9J+0B0ZgFWZmdZ51Ckpw7dL2AgHK
         xK06TcNgvCq94dYq2OFd5EURo7pd/4RShU2MPeekiKacRKCCKmL+zXpPXuozNMo4rkKz
         BPTDtNaI/MID6Fx+2V2hu3ehUyMmvsrv28jUf7upwQJ1Vi7PJeen6hxxF/l9tIqRLK8f
         p7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185801; x=1793790601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=IL40nfCxsaj4LFa301T2yUP+mUU9fS5TAkuH90109T4RrVMEmd18Ag7Wd6rwTGRcyD
         ZR9sM07hVeTEGJzxf+jqFGqU1yc6juu8XE0EgGEMNIc+W4qbEr50knMwfX/daSYfZNX3
         MDWcCGXBaVOw6wkcRCi5Rl8JanGNNS3RPqkGXj7qg40ucO7QhWlOyK2WBKsb3CbNm5Uf
         hbHgjac5y2Cn1JxEn+oVd23RBfMimpgK2Yx3mqjeHKzOc6jJ+AVAC4DN0+EbkpJNm+/u
         qR7lpx8nlQUsmwqVqNQBzYJELaHoKpjJf8LO/HF71hRlS6enJoFyJHSVjb6AIwC/dfka
         DJzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzocobAvoTzTmMOkksALtTAjvCZ9DMoELCrTuCCX1xg4AuupCOJ04vQwyPk1JQIOO5BeC8o0hP+wiFf@vger.kernel.org
X-Gm-Message-State: AFq9FYKY4VjLjGxNsddq6/sUzAFFu8RWjd75GidXdzpqBsV7CEGlGsWR
	V2kFJf427AtB1YTwBIrI/jZuP5llSdP1uniG/fePnzBVAufrY2jfXAhP
X-Gm-Gg: AYBFou2+IGcszL2+JtCN/1enSCHJp27VQM1VSW0W9Q10VvgOUVgC86eSxMcBWXVWXsz
	J1My6+cQHo+WaDzlGLV/sOZniZVcY1j2HbedIQvTQVcej3JyGdMXmsSEVDeMyQI13e8fhgM9g5A
	Ql3kdoYKZY8gCqLOF2/fP5nGuoB9tZt1kJh4joty0Eb5oR0wKWHazGuTmhBGw0hQIxYdTuTsRI9
	PnKLrwy475B5xty3wbpekn3GcWgn2S8rJirwejLuV0BP6rkEEoRCsMYC/EkGgdVwh0AaA+b28F+
	d0evnG/6LkvCNvWpjDwxn8WLY9TN9gRFgQAZsW0x0y2KJtiNg8c/SdiD4x66Ear2LnmfL00sv9v
	Do3jDIiKQGwCIu8bCejvmFdYTS6jWGCoF8KNLcRXbLBiHMVc5VQhCBjCMXQ/FZpojG9sNnc2Zc8
	n12wG4twN+EiGC25ce1LZw4Sn9pRNNkChciRBGAfJsY9sLYA8+HYogrXRYWgO2rb+Lz5AGB/il4
	lvQ54S+3jYke9KHbqxs5gsaNEN1piTLopZyqNazLuKZ2gaUwADQP5IgZZCA1vr0qxpEkA2ZJ6aC
	JPRZZMpPyIyUkyPWc3A5o7ChMjwigyCDr22ZEeD1z9S1FLt84z4qBdR+RT4EvGqDGmVIVbMP3Eg
	xv3Ge5eawo20PV7mVtnxFebK2u/KCffcxNyQWRgDlSj1jDpCECraBHHNgy0aDcSxKv9qGa4BqR4
	7uj5DXcUCdMXBIwVE=
X-Received: by 2002:adf:e009:0:20b0:48e:5550:c64c with SMTP id ffacd0b85a97d-48e5d44e556mr3706276f8f.14.1793185800762;
        Wed, 28 Oct 2026 04:10:00 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm27760519f8f.4.2026.10.28.04.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:10:00 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 07:09:51 -0400
Message-ID: <20261028110951.101614-1-lefteris.koutrakis@gmail.com>
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

