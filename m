Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7EB400DFF;
	Wed,  8 Jul 2026 22:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549507; cv=none; b=A3VREVyblWw6RJWZde0lgAJB2sCrMJXes7k4vsyKZc8+8CJNhR83r4koMkWN/3YXr0fUfjLbZHyNaf6A6iSOsyfozTqaaLsT9LI7OQiAM9OunIPKOEgz49mz/DJ8LSfWap9Fin89+AeNpDPjLytw9aCJ96oqGu3HmGY+SFeShCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549507; c=relaxed/simple;
	bh=gEoIsRuiUSM2Cue35OOp21eBjDa8vV2pu7mTlNHO8Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LstQGSkjDg30ydDYOeTYwaXQ+GSbbGfXVXmPwiPDgB3RUdC1fAh6I14UfFn2xsxawRCWH8MW8P0Aa6DFAJx0JNldqBLtQd0ZklUjdIdxw2bcAU3yqVGY0OAR29AVX8Uq5J58Xoz+DvL1VgdG/qDv+9O+tlEYYTVIDMtbJUMcnos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/VUTdBU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/VUTdBU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489941F00A3D;
	Wed,  8 Jul 2026 22:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783549506;
	bh=fNdlD17+le7OWabglfycXZnoWKec0Rc5Ynf/AvD7l74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D/VUTdBUOnQaqVvY1CC8TphDejeuhGNxErlCIBHLnXRz/hxabGV+Qrc4TrwI7D5x+
	 XyidImsDnRXNXcdm5CBBnYCiuEBXPR1k3THmMUoVkhnZ/kQhq4VqqNBDjUQEB0A+17
	 ZptIE3NKrsjuW7KK0Xk4JGAf7EaXOv0KAjn5IYwvkwbJNkZSbEgYUhai8Qc6Hk7kI0
	 7UrKH5eTtrZW7iB8s3Zb8C0kdPfsThBXQxiGhEsi/p217SX+8jRChaXummaw+ZVV21
	 HcW3/5WVXMgcXkTWo8uen17F8DPWrQFtMG0v6NljT+jatCNai9bOjg4TtME1NIj9Fa
	 TUOYDhdXLm2oQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 09 Jul 2026 00:24:56 +0200
Subject: [PATCH 2/3] ARM: ixp4xx: Relax endianness
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-ixp4xx-little-endian-v1-2-e9622d0ba9e4@kernel.org>
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
In-Reply-To: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2

The IXP4xx can now boot in little endian mode so relax the
endianness requirements.

This will make IXP4xx compile to little endian by default
like everyone else.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/mach-ixp4xx/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index cb46802f5ce5..2bc8a497d318 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -2,7 +2,6 @@
 menuconfig ARCH_IXP4XX
 	bool "IXP4xx-based platforms"
 	depends on ARCH_MULTI_V5
-	depends on CPU_BIG_ENDIAN
 	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
 	select CPU_XSCALE
 	select GPIO_IXP4XX
@@ -12,8 +11,8 @@ menuconfig ARCH_IXP4XX
 	select I2C_IOP3XX
 	select IXP4XX_IRQ
 	select IXP4XX_TIMER
-	select USB_EHCI_BIG_ENDIAN_DESC
-	select USB_EHCI_BIG_ENDIAN_MMIO
+	select USB_EHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
+	select USB_EHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USE_OF
 	help
 	  Support for Intel's IXP4XX (XScale) family of processors.

-- 
2.55.0

