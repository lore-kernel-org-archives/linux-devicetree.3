Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD732E6BC
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 19:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956467; cv=none; b=UoBQ/B1/97tAqQuRW7bcGIL77y0KMLRMcXaqn4ctAozb/mSWhI5VXdJ6flpeGOwxtD5BzUfbBxwp1Ab/6byzQ+t5srXpvYNTeGruYcLazu8HIXyKFhBme6x5WyBWJr1iWbaQvT0VQUFLVOKc5t7syF3yFA5tYlq0onKnWy5iW+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956467; c=relaxed/simple;
	bh=YEqM3jlAE4iGEPPbDOWq7T7UoHO7+oz59bOb0F9ROg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TJ5LbM4KHFK6eXnsfdEAHitzFp0WImMy/t6XDzEl2Wg26SvmA9hBE7JC7t3sP7UU6d3Fj1yEduyCPpBS1Uh7tuFUnulljXWfOSN248Knh+X0YdmC8GGKZ7KLKmCCsu/O4W9frpur6zArypWSUb1Nx4midhVluzuImIeBsqqSTyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue/g+0Y/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue/g+0Y/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1306653a91.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 12:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956465; x=1786561265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lY8ZEQ2hlKG5xfE4pkvXblb/dffG7Wh4lNbHjY9KfTc=;
        b=Ue/g+0Y/wWfosiAw6o5Q8XhdM6ouKauEmitYecOMVyeAVrOcFzBCvv1biVWIJpNuiv
         a+zLdrXTPM7DiQYWBqhcmagB96laAky/TSdxzvpBiA+HVdXop2NbxlxLNBuZ3pfOvePM
         vJ128W0Z6nh0iWnMAkc7rzHHohHM1DjxuLs4JER0g3IO6xNeTJnJ5XWDhoAZ69eIn3LV
         gO9i+iub02nBzHeldqO+8orJsXAgNiJeijyFyqQSDujWof6LFeWIY/OmnVJrRsrGzGBh
         Rk5rr2pkuI6HhomcuWN3Ptmw39c7uLQQRaE9IPXPyzFH4n79l8db0zEyf9DXYPKVQhzg
         +Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956465; x=1786561265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lY8ZEQ2hlKG5xfE4pkvXblb/dffG7Wh4lNbHjY9KfTc=;
        b=fuiDdylkP2Tpig8ldyaWZUpqyUB09AkSGd/QmYieQy0YrhBGegbax6yN/wWXx4gsw0
         tgY0hgLOAJxqX+9KbLr/XSNCaDLn/xQevpwveUSt0PdvXmYlIbcDNv5F/WTePkX69VX0
         Me6PB6eqV/Et/Wkn49I2iLJdrth48D3ybk4YHDUIFLc0xqOT9W+CyTqC4DK84iJmaQ5E
         C2pJmioF7IqcrLMdlJyDAF1p0kQIFQK0lp99ZH6INvI5ITobaObTp3rmXmMjb5FdQb3c
         xvF5Um5kUCNVNs03UbXu/Mqgf1MnacZqr2YhLe4dg/eC/MDJDhUXIUKSAMaObzM0eCA8
         pLKg==
X-Gm-Message-State: AOJu0YzbONuypVLHrHlNz90VSqzdYZn32xX3OWYFV9di3kPnelHg4ubS
	RRz2HQb4Mkc/KmC/u3WoKdgb+tnR/uJTC6Ai6W9lO3v2myvjTdD5PNUmtMJS2g==
X-Gm-Gg: AR+sD12NsndglHCWNssTwwAO9zCAoFe7UDTXxc5XMRRTuoYcGGJGrwgf6o4CNmH1psc
	fWBfM88KGds/wVbS3huz2EpmJPWvksgGGhKrQiAKOn5ArqF2fssKiUmvbVmq45jB8byUY4Ngsv9
	HN8w/wRbo6BSGRx2m9ON408si13xj4Pds2RHVdEbLRxvFeuBpBmRSzpSNvmef6fgvzyaLOYjehe
	aVwPe+hMm/MDu1ZZGA1j3KBB5E/F3S6bhsHx7eYsWbMwQ037KEoP0kKWy9I3R6z7ndHfg94/04D
	UB04nYWnBbVQSVOv3wcAA+dHn0fcij99nU67F657/yJROcNU2BTelGImDo2fhSBcT57Xsh4Ay7D
	osmBWiaflehn9/SCCrj2umvJUEN+XgTjDHUkdXQnngodgygHyCDW3Ljoy2/eOdVaxISWGlpGHOP
	w/TlJEayj5LKQQA49GJ4GRmyT6NyCHZQaqWXY6zXhOlJuvZowPUOmawxTGI46qYJ5G8EozX9uaO
	0pc89Et9LuQn7/i1OgGY5K+41wa5bhh9PaRAJGlXIxecnCnzgUZ8LI9fOY6yNHIx3Uh5X7YC0VE
	KCabtkyJQS5WsORBIwGW9piikltuNtaIAE/RHw==
X-Received: by 2002:a17:90b:46:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-3903c5363a5mr10200520a91.6.1785956465025;
        Wed, 05 Aug 2026 12:01:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903d183dadsm2136925a91.0.2026.08.05.12.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:01:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: AC56U: set WAN MAC from nvram
Date: Wed,  5 Aug 2026 12:01:01 -0700
Message-ID: <20260805190101.6773-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
userspace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index c80ac16ad949..df59136b076c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -92,3 +101,49 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.55.0

