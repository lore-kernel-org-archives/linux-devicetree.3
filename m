Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9631B405F7;
	Mon, 30 Mar 2026 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866154; cv=none; b=TlmGQQKZmIDJcpU+DkgpGDD8vXM9GgAOJIhd2fD9shLa9RUfLQ3wDfnFXj9ffdX43gJk7oW6CcKjTSu4jZTEgSIwO13v9geY5lVw3y7rn2WiT4KgMHusD8CXCITpGbzYKSEn1n3Nn5M4tHVZ++eblz4FBVYCwJut4MRGcvDOdes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866154; c=relaxed/simple;
	bh=cHxCL+kgZEYYDlNTSJUvvX2k7Txna5iYqayS3SfoOig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iqPiw728XrXrTHoaEJu7q9hklabRC6Ii83tArIK7ShYZ83qC/tskRXVo0szsnKHmIsqu2Ag1exS7/CTbRSHfvCaehO8j/ED4QftjXoRJPTAHumNGIQGReMscMJWKxYyBC1XH+2gAKRiB0e6jR/pP4k83cbGDoZdeYBeW96Cl/fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=UAkIxsmH; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="UAkIxsmH"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774866149;
	bh=cHxCL+kgZEYYDlNTSJUvvX2k7Txna5iYqayS3SfoOig=;
	h=From:Date:Subject:To:Cc;
	b=UAkIxsmHBUhDJTThHvm72YM6MyKL+0rWwYa/mOBka0JeZFkLXdFbC4QfxW3PFBfbx
	 aAFRXkhJ+JSEnkFwMMF8x9fA4OQSOFw542w+j18ZUySXzMt3np5b0jmmCETAwOMFCB
	 K+G7hu1skHHZaH24EZvNAoUyA6VYrtjWOVWAsTFs=
Date: Mon, 30 Mar 2026 12:21:38 +0200
Subject: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-fix-invalid-property-v1-1-e829c4d806cb@aliel.fr>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAv1JyNlBbF/Qr4kFt1IDUkooo4t8tH
 gdm5oFIwhShVQ8InRx59wnyTMG0Dn4hZJcYjDaVtlbjzBeyP4eNHQbZA8lx4zhSWbjG2rnOIaV
 BKHn/tuvf9wMinlkYZgAAAA==
X-Change-ID: 20260330-fix-invalid-property-bbe54d933f71
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774866148; l=1261;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=cHxCL+kgZEYYDlNTSJUvvX2k7Txna5iYqayS3SfoOig=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIq3EbCbzSFk16GagS7tZiZDzrUW8C9xkwkL4RQRuXb+XUI1pPI4dT8GmIlRE9C2b717YFqr5VQ
 Nc/hZ8T2OUwc=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs

Fix introduced invalid property for Khadas VIM4 sdcard regulator.

arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp@intel.com/
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
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

