Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD73C378D7D
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042706; cv=none; b=PgRamLp8y3SPs8WWCdzg5OvA/5On2ZhlUH9NQyAjQXs8YSxFnlELQbITD7oG2dsBREGMnoOMgVtofIvLx17KiflnQChAp+tQMGxzFixrwgUQjxPduKdBZMcdLk2pRX6Z7VkapqFz9qcV2uP3xzZLbFT+jODd02NQ2rD6dvkKloY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042706; c=relaxed/simple;
	bh=HvirOnuefVGWNKsnryLN6yYRfQyFfutoqMFctbzoY0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qdnd6h/MKz6dhh+vGiE67iSWDHWp788xOowPqpzNDeMkSCCU/+q+08mIr8IjUOoEwBH/HdgrNaZoXAGSgZb0Wj73h6GQ7eswq6RSMfA/hcpBCIxQmkNOwD6BcsvuR6PkO14VwsBVr0mOCWmcAbp9g3WEz36umqqu/5hEZXGRphk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWpoTsNU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWpoTsNU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425681F000E9;
	Tue, 18 Aug 2026 08:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787042703;
	bh=NgWdBFCBLseiBSl6XM4e9FMluiT3yCJkcVlKb8+Vu/A=;
	h=From:Date:Subject:To:Cc;
	b=XWpoTsNUweyjd48vZKYbitbipNx8UoWm5NgnWdulIUyGHNXeTZcbydAjvTFI2B0tL
	 AFLTQMtW5AbxK5fq9ORLuB+G5v4dUjkZsIWmCjDZ0wbFj+Nk3TF4pOO8XoHsaSTXx+
	 LcBdCyo8KGBbAb/6MHwWym1K7tivcWbOQ7zD8IBjUE9LdCboq+EBdkqQRyES0xeoRe
	 fqlox+r9TEmtiUHNANItFHnEuH43nCJmK1Xp4+Xs+hSwSedNf6W4GB5mXaxWaWb/Qw
	 oRoEPW85dkYefN7SzkcwbnNYrRqIgtAgE7ZaEMxzl5tpT3aJsCvDe9RrlKZmm/PieC
	 a4B4tzKpaWydw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 18 Aug 2026 10:45:00 +0200
Subject: [PATCH] ARM: dts: ux500: Harmonize GPIO key names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ux500-dts-golden-voldown-label-v1-1-3edd581b09df@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBAAvyJ77sIaqKb9ivSgycYuhKQkGoXg3
 xs8DXOZqZA5CWd4dxUSF8kSQ5P+0YH5zmFlFNscFKmBdK9xP59EaLeMa/SWA5aGeAT088Ie9eI
 Ujy81GnLQIr/ETs57MH2u6w8UHPrWcAAAAA==
X-Change-ID: 20260818-ux500-dts-golden-voldown-label-8bf2e7927c0f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

U-Boot want to use the volume down key for activating fastboot mode,
however the code there relies on using the key label, and this
differs betweem Golden and the other devices, so harmonize this
by using the same label as the other devices.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index f736888474e7..12f5a13ec77e 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -391,21 +391,21 @@ gpio-keys {
 		label = "GPIO Buttons";
 
 		volume-up {
-			label = "Volume Up";
+			label = "VOL+";
 			/* GPIO67 (VOL_UP) */
 			gpios = <&gpio2 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		volume-down {
-			label = "Volume Down";
+			label = "VOL-";
 			/* GPIO92 (VOL_DOWN) */
 			gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
 		home {
-			label = "Home";
+			label = "HOME";
 			/* GPIO91 (HOME_KEY) */
 			gpios = <&gpio2 27 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOMEPAGE>;

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260818-ux500-dts-golden-voldown-label-8bf2e7927c0f

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

