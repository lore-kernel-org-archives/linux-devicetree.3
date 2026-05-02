Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36AA2C15BB
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 05:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699173; cv=none; b=fUm1D67mYZWduQ7MWdzcpSaQIKq0UWLFTRTaANpds2/hKdauhtfcvZeBMMNd+wNwo3VBdxt0wjE9sgNaMP8dlxYotbpQ6p0nG2TbJNJnMawUt5D1kvfZYooYXzgMLeY70wnjWN1ykU7JMFn+MczavFGlf7lyMOPapXsjcSaSXJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699173; c=relaxed/simple;
	bh=W/6cljk+sGAFN3rf3xVcfXdvrFmF7fbNtqEJTfycZ7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLjl30MKz+Xif7OmGVZcNjXKJsdIn+Dk6oUm/wgqDA80N3BX1Tg1ajBYFuUeZoRQ06P36BxUW59Emil0BrLK5B2Qy1KGCHEr+K6VBj5s/ZeNt0pZIC/d/hqEHGhFFwnPxqFMlE5CDflLa/PM2sZvZxxXAGu3ZlYMNmWYfY0RbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTQiy8I8; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTQiy8I8"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82748257f5fso2631088b3a.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 22:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699172; x=1778303972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjH11zgHDCyhbF50r0nTJm8SjfZvEtgEk3MpR/mQFEY=;
        b=mTQiy8I8vWokrO77641z3iglyKTJhBWBQRFfZlCvvTSzX9iOql7NELpG9rJhjI3sLK
         6qBztoGJlaVAVtx7rH6LKks5DCka86MpErug+nzD4aHu8eqryqppwCGdSaGtOjTHyvM7
         dK/F0ws2LuwdCKJYfsO4m/5x3/59bcBJ/6+TCVEQp80xcH1vEAYH7ulfn7QcUf20bAv1
         mxfvPpCXMZ67SjUCLPxLvctBhRp9j5SYgTwCU0UEYZ+t2DmtEA6tCViuAlwrKmlufxxe
         4h88ClpYaDXDY10rZUAG/kCZlJ91IMh72iDPK/c7uxindTWrJggOm+MNu6pMAYyarG3m
         6Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699172; x=1778303972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjH11zgHDCyhbF50r0nTJm8SjfZvEtgEk3MpR/mQFEY=;
        b=SKnFl/9PKkaJKG+w6lnpex11cnAHSdm+Ww6+x0zngw5lKh64zVUq4ZJur+jy7bCBa5
         MdaiecIwmOxcE/avmfGh8h9NTNa6BkCewkZjowgo2hVdFwlRuB4p70fJFNT1A99PyeNh
         yxEa/fR/2ub8h4uDlDX8sd8U2T1zuUIosKMSD/M4ea59pdcJu8By033sCJ2ZTfjueljr
         RpyA9WJHoq6h0jh+qZO8NkcHlG4PZVRUEOmPrJsQ3KbAk5z60IQc0x7CGo0LyW+DM9FI
         2gO4iiZFZoI5G8i4zUfKKxK/v1T3TJKA3qgYfiLm1smFUHhDohgaSFdRxdbNBONqAJG+
         Dbdw==
X-Forwarded-Encrypted: i=1; AFNElJ+jHxOsjtTYTBd3lJPg9NiDov1IJjRiE9LySWc6o+EvMyVixMQyuzJFCo39raiE6KvKvoklyxOCs40A@vger.kernel.org
X-Gm-Message-State: AOJu0YwcD2EKqnPxhm07VEQL3c4VaKELfudxI6R22GKZJ17P2KxxAjzL
	5Wt+rSHvk9/CISDhBOL0QND2Vh1sxcYXpWQKxM2n3joxflrS8zCQt5qu
X-Gm-Gg: AeBDietu9G6EG0k93/Hg88vjHyInCwkbBRHPoFM1yR9ghm3RhH4OlquHB0ntg1MkSVt
	ejPVUOkjjHCJXhulL+tndXxbho5HaIpRY8qnPL4mnitTxkGlNzf908JpJdt5XfzEx3wQ3sNWgux
	lX8bYYjh1mkrwQF4W5TSMRBf99WclBm9Jf7DnP5qWFESA0Sa+Qgl/g3zqvf6Qs7hJtdTan7hKVg
	1R15qMXVUxzWNZK90pBuEZF4ROmSDDQ+bmpCnUzeNFKjdB5Fc7BnxsWIdLntmNFfS8mVJAPe61z
	OLR5myX8UW6ao4BSm9+etk2eIGBksPIXQjM8jT6oLEB2W4cgPE4lI41FGF48Wj04O2lfBAZYChp
	vTlLqCeAtObRqr3dXmN4b5euA3wLs55qhXF8OrHZxgKvL1cQsq85ETHfQZgV4wuRMpVnEeMBSgc
	Tc9XqbL44WIINdTnfWp+jUMPg/EZ5H+KMgGbdipDX9
X-Received: by 2002:a05:6a20:be07:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3a7f016aedbmr1363896637.12.1777699172056;
        Fri, 01 May 2026 22:19:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 2/4] riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard usb and label
Date: Sat,  2 May 2026 10:48:55 +0530
Message-ID: <20260502051906.8160-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the USB regulator labels to align with the board schematics and
power hierarchy. This change renames the regulator to reg_5v_vbus and
its name to 5V_VBUS. Additionally, it fixes the vdd-supply references
for both the USB 2.0 and 3.0 hub nodes to ensure they correctly point
to the 5V_VBUS input source as per the board schematics.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 9727ecdd9f6b..c35f4763c800 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,9 +70,9 @@ reg_vcc_4v: regulator-vcc-4v {
 		vin-supply = <&reg_dc_in>;
 	};
 
-	regulator-usb3-vbus-5v {
+	reg_5v_vbus: regulator-usb3-vbus-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "USB30_VBUS";
+		regulator-name = "5V_VBUS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
@@ -366,7 +366,7 @@ &usb_dwc3 {
 	hub_2_0: hub@1 {
 		compatible = "usb2109,2817";
 		reg = <0x1>;
-		vdd-supply = <&usb3_hub_5v>;
+		vdd-supply = <&reg_5v_vbus>;
 		peer-hub = <&hub_3_0>;
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
@@ -374,7 +374,7 @@ hub_2_0: hub@1 {
 	hub_3_0: hub@2 {
 		compatible = "usb2109,817";
 		reg = <0x2>;
-		vdd-supply = <&usb3_hub_5v>;
+		vdd-supply = <&reg_5v_vbus>;
 		peer-hub = <&hub_2_0>;
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
-- 
2.50.1

