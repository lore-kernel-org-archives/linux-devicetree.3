Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA81309DB1;
	Mon, 30 Mar 2026 12:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872947; cv=none; b=E18Oo/vHpji6L9iX/t3ls8Efe+uB8BD80LNlkUWrVkEEMEgSIrXlG2ZpsgCyex+GRo2oziWyhYDc8qe6QtE7lXONezUfYELWgX8gq7g1Vb5CIlES1BS2YJuY8/qhv9Prxj3q4y/5YrkwL6Lv+9kJBq+LAulq1Nnp4VGBQCiPESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872947; c=relaxed/simple;
	bh=xVUcmfduypkog0Ts4OgYZx4Y4alW8vHomSxuHp689Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MHJLvR7Z5Oo5uNYFW6u9tEdNzB35mwjxuP3FpfW/JRX8FiawmIJ50qgZn/LwG/p2E16Ii02A5o3cGvHqyVTQdSeyEB0GO1jlq1fXsHqfCWs7JSoKKEaHFT40BlIcd8Zf8U1QWtS4Wuu5zBfel/fAEV1tZ+7zwBXwH5onr72LCG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=sLfjiDPl; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="sLfjiDPl"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774872942;
	bh=xVUcmfduypkog0Ts4OgYZx4Y4alW8vHomSxuHp689Vw=;
	h=From:Date:Subject:To:Cc;
	b=sLfjiDPlp3MMpmzVuy3aO04stshQ+TFaMkY+jL51L6hDoX2nVunINKeH3294yIxU6
	 WQq+IroKiUqlcgpbuWeyGWIYD/x51qakxziLv6/3wMgOGiVBxY33tWQNZ3pAGLRAo3
	 0W6U1fUvLBlx4ULqSLcdmGYqea6dDQzVwek8bAHg=
Date: Mon, 30 Mar 2026 14:11:21 +0200
Subject: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSw6CMBCGr0Jm7Zg+EMGV9zAsKJ3KJATIlDQSw
 t2tXMDl9z93iCRMER7FDkKJI89TBnMpoB+66U3IPjMYZSplrcLAH+QpdSN7XGReSNYNnaNb6Rt
 rw11Dri5COXfOvtrMA8d1lu18Sfqn/hlMGjVSbZq+9LWqevfMPo3XINAex/EFBk6IIbcAAAA=
X-Change-ID: 20260330-fix-invalid-property-bbe54d933f71
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774872941; l=1587;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=xVUcmfduypkog0Ts4OgYZx4Y4alW8vHomSxuHp689Vw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFe8HkgC5Tzzi505mPD+oo6xvu6CJSbvqSzoHf8z7fQX4YThiWYbKanG0BszCUiQodatWAkaYjr
 nqaW0+XUyGAc=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs

Fix introduced invalid property for Khadas VIM4 sdcard regulator.

arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp@intel.com/
Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v2:
- Add Fixes tag according to Krzysztof's review.
- Link to v1: https://lore.kernel.org/r/20260330-fix-invalid-property-v1-1-e829c4d806cb@aliel.fr
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 11bfbc99191b6..003b3bcdaf2bc 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -65,7 +65,6 @@ sd_3v3: regulator-sdcard-3v3 {
 		vin-supply = <&vddao_3v3>;
 		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
-		enable-active-low;
 		regulator-always-on;
 	};
 

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-fix-invalid-property-bbe54d933f71

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>

