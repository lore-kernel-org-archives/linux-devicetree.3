Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197110;
	b=BWcGnnpCiByvPJd4mV+U7A35g+WxCOfoqeycbL7e791vKL48F0lbGZaostVB0gRJR1IO
	 1bT6Bckk5be0BlfR7eghyBI2glqCRQRmXesSe5saEF7r/Pv5fueP3vQiiAZa+Usbkv20b
	 iTrqITU7GMA+pEymKQ9j6bbVHoErkX63RfN+hYVUbzf0e156oyhHsdxsLPQa6uDfi7GXl
	 Y32/ENJfIR2J94mXeyuLqWRtjkwfi1xQcqtc+nzDZuzDdAiVi1M5tbd0M+ZfrJPZuR4kp
	 xML5HZ7A/jgjyY1ZiottHR2AoeqLI8Z1Zu8pEzbam7vuX4h+reT1Lrt6mIEMYqQ3vgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
	b=VYDpSrcfasc11a+nVSxlCKBgV8+5F8r79VBL7YG5Ozt1/3B0wxW92Y6dCn2k6MEF80Jo
	 ImlVmmW+UsVUZyBvke1oCx4bNclCyOv/O7eeRoxm8QpvRkTsBJWQa86/s6AnHRgG1Squj
	 aaG2F0pookYeH9ZqYqeKadQnQFc1U5vhhT6jXMboZHM9JH6UNn8/VgoEugmBC4b/wLIZS
	 R267Q6tRPpN/s6Cna6x/TL7sDkfrwH0LA62rQBWxIWAo//SwafYjmbNiF4oA+NL8ybaPO
	 tSwbyFolM6V731Lhxe4EtcpjU/btcRYAGjuuprj+N70n9Qez1p33rALMde5zwDq2eTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZiRYbUw;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB0606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98BB0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZiRYbUw
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b001cd92bso545050f8f.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197108; x=1793801908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=MZiRYbUw3vu/n705zdVdufSW6EK6eIz97/8saxgeiKk8iXED76RAEEbra30G3ZabfJ
         xzDFmrUsihijre4Z9NbVReIgAttNVps8dkruAMlUu4nrY/6jX9pVT/UMPQIPlSmjywS8
         0HsYoGcrDk6vQDoD830jbDdUWuKB/KvFcizhqQmJaLTYjQx59opSnIeaAlQBKthQl51t
         EIODiMd7vrlNHdTSuuXyKO9jWlF2kA5NH/b6AnUvlqI4/nlONrxyUxHt3bfcNT38u1GC
         B/F5ZEflqt1dX0tX9YbpWlVIH9m6fKYc9e1gna5YNrSnVZsSWuiwEiGg1yTH0B7DFMK3
         Hefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197108; x=1793801908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oInV8X/kpsTReR0GbICzmQIbB4dJNZpXCGXqUrcWEM=;
        b=fCTEnEnLnNDeG8NXsYvFIql1J6cTKu7WyIcuRMFx6V7PskcXOyxhISYXPNT4g1adi2
         91mkVj/JkUmnRc12MVYLHbBf9HhpY/SSaEJuVikVdE6YfBMGnPm2Smjo6y3nLtZidegd
         M6B9WnF/bhx1sUAWHP0DA7YKt6GhMF/a80+DLJHivWStE3PyhZCXOzUYQiBK6lRSIxWL
         dEt2SnYU1pMUK01M/8HZphOtdgGCQ741KQrv4BbfHh6LgxSlaPCdWQCf0NKOlNfYKdZ2
         cbzPmyJRfG5kXBpYR3dQoadlMYrS8oezwFq1VP9MvDQtY2JYSrraMwSnW4lMn8tKyhua
         mYBA==
X-Forwarded-Encrypted: i=1; AKwUvByCGdgVmeKeqjD9S3T7KVYEqMmJfh7/Qy/EcK11fyTVu4UvQ865IJxktByJ98OwghGQM1CljsAW7uJQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIPCtTz7cfDdI0gpM1WUnxdpdCzWCkJ0XEfiXutyiG5Cyeqa/9/
	UpvEgFdSUryeJKmet5mNcSANzvj+mIc/YxAZw7NAWndLYJ5CE7ZqR6kA
X-Gm-Gg: AYBFou3K8QWEOW+f8ZAMxH+KMKTsrSznMGlJ9IaTKNnL2ChCjw93dwr6eIIS+F0hnct
	rlECxo+I40Ml9NtlN/FcOrMsPenPVmE1u+AuzWZdvPngJS9dYMm2Wc/eBumTKVtL93PAUSETrvh
	sCnunhnH6lz7kAceLUyoqEUZa+HPXJmRKkRotjb73GRdMG9vWOT8Ye/ikgciOpzlW2wST6LUFph
	U59Oo6rlPh5jnfu7NEdeA4Hy+JUFjhlE/9aF6fQCipbFTOwFL/CPw0QKLQWNFueDjHm5uo2h8pf
	gjL8xWoWfsh5/32dHzPveZphZMOxpgaXlxPR+4huhWJ00KujSxjNR/uX9ekPV17EN/S7MZqmyZp
	ypH9M6FQ8288hF1yYyxGrU3Gcr/N5niChHboMJPi/W7SU+Ups+ggNcY4f/hPIXKBEBsIowH5ue0
	E0uyYpKBhQIDSavOyl4oKu9orqAPxHa9QCpJRBnNm0q71vWVomBqjyKXymw+T49M/TVcBfDonr3
	mF0zJ5vQZul6WQvCHiKPiDQKwB/WdAuybvetajrNyqJSo67x333x/eLkSztI8t0FY0gW9YPHZ//
	a7idPcBw/bzYCdpffjoH7Ql8dxHIcSiX7SaV0Gymyy+oLqCTYRBP+iQGNJ4RpuBy+0zq19JIs/A
	lh/WkpJSuf2LpebammHteQn+3TH509lbnP9rEyk+wCIqye2u0d0hrhhY9T5RY9kE57o8hfOnPzf
	TiDLwpvjKmmpZQkqHVkYHCbv4KC8HvB8zkFhl0
X-Received: by 2002:a5d:5611:0:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-48e5d5909d7mr4371586f8f.11.1793197107788;
        Wed, 28 Oct 2026 07:18:27 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm27122688f8f.22.2026.10.28.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:18:27 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 10:18:22 -0400
Message-ID: <20261028141822.136982-1-lefteris.koutrakis@gmail.com>
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

