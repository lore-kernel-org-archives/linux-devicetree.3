Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B334B04AF
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 20:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786998876; cv=none; b=FAeOAXA7EEcJ2Y0Je/ZG3D0BoQD+mmh0BIGC+9Ps9CQ5dG4v8qn9l8CWtbJXW7RwQOSIxRVV4D409Gh6n/E3YL3KLH6Dyba9c4xhLDBhhbmDNjIJ0QMwzRIsOlwZVzAR43ncCEiJgFULQ9pkn5nwmRe2zx7whFbfnT+H9QRZ9kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786998876; c=relaxed/simple;
	bh=UxAEYKesjKOYxvzdaF+Ryvlpd22NgqlLNvWUfKIUjYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YAOsov9naEh27x/5jkYWwG5hvGA7Q1opML50aGg/FqY3CABtwAnP92e+ZvVd0Y7hMQfR3OBC0a9Fl95v1nHjAOSy2qZkbx+AW/jrY0eXFuTdJhgIWkS5sKR4W4hLe1dM4ItYPZieO5jF68vrVam+rS1OpPMPHDDQiDU98BBBf5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMw59CKp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMw59CKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF8A1F000E9;
	Mon, 17 Aug 2026 20:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786998874;
	bh=7lA3sg9Ze5Hg1p9KNTE2Wkxzq7TpBw3xISkEF/MJsew=;
	h=From:Date:Subject:To:Cc;
	b=UMw59CKpg6oLomoZj9QSbzg3q4Z+FROT8CjN0hS773aDFHCKG/936vJLX1t2zWcQB
	 ZqdvBK3Z5lOM9uKdTYZl3AwuK1gelGw5Ml7TfoCwpfzxz6JcARzz2Xd7QaSDaOqFYs
	 9ZKYD+VPKbcRpC6bUs7cHvgdRwUCLrr37rvE5YdjaTzTf3B7uLal+3JPjz+le8Pkhq
	 qPmDnqMbsQ2XHVH9/lLEfpstoZXrfz7GLOMXF0+Db9r673GwgJiIdIuORy1mO0ZEAN
	 qbviu0rEE5koDYP9aTWkl9kPZ9RPDQDQISNI8wCsQEN7+I22QNRVrUuDM4FubXelnd
	 NEeXMqwhgYHnw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 17 Aug 2026 22:34:31 +0200
Subject: [PATCH] ARM: dts: ux500: Make panel regulators have unique names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-ux500-dts-fixes-v1-1-24379c6c2495@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avErBsww6iuEi1Mx5pNhVMhSHdPW
 j4+P4NQZBIYqwyRHhY+9oKmrsBtdl8J2ReDVrpTfdPhnYxS6C/BwIkEnR/aYPXih95Auc5Ifyj
 TNL/vB9r52O1hAAAA
X-Change-ID: 20260816-ux500-dts-fixes-cd93fa2bd985
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

U-Boot is not happy about regulators with the same name though
Linux can deal with it. Make the names unique, it's more elegant.

Link: https://lore.kernel.org/u-boot/20260817-ux500-external-sdcard-v2-8-ca9a110bd9c6@kernel.org/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index f736888474e7..d4f364ec8685 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -510,7 +510,7 @@ wl_reg_on: regulator-wl-reg-on {
 	panel_reg_1v8: regulator-panel-1v8 {
 		compatible = "regulator-fixed";
 
-		regulator-name = "panel-fixed-supply";
+		regulator-name = "panel-fixed-supply-1v8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO219 */
@@ -527,7 +527,7 @@ panel_reg_1v8: regulator-panel-1v8 {
 	panel_reg_3v0: regulator-panel-3v0 {
 		compatible = "regulator-fixed";
 
-		regulator-name = "panel-fixed-supply";
+		regulator-name = "panel-fixed-supply-3v0";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		/* GPIO219 */

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260816-ux500-dts-fixes-cd93fa2bd985

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

