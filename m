Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C93FE369;
	Wed,  8 Jul 2026 22:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549505; cv=none; b=dgB5vBj63MXWGsggcyenOIhTaLVMsQGyyB3i6QYsgS4j2qKPIVxJagETsaFho2AzMR/gn2zDKQQ7x4e4MT6DMxJ19MVK7llKTMTfNpgCNzS97EhEwJcQYbQR7+qVAzgCVOvPw+3yEYaJLQxBYJXDf0OcKTIVGiAEJFHtnfjeu3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549505; c=relaxed/simple;
	bh=tPLbBGlEVWzuS9+r4+i+9kkqD6pi554QrA2ZiVsGV5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxHaDn1nBnEWmqDL3qdnjg+vZLGop7s6Ai1QEO/W0XkndStH8n6ks9YF+FfC5oo436aqGHLKNpMwW/ir4scH0+QuL9ZcgDyFLENbb7yKMHa6FFTrL/SXxkvwVaxGiaaVrNl8y43U2hE1IckkB59NXqTwI8OzN69uDAIuUupMWRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9hs8D6o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9hs8D6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836E41F00A3A;
	Wed,  8 Jul 2026 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783549503;
	bh=U9POfuivaTVjX9Vy76XJNvHAcLnkxPAcYHR9KgfQVJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D9hs8D6oNxhQiffR7mtHaK/HA8Mi1W5vohcKpBZF6+OZ48kbEWI4i1JqCTPQXXtw2
	 gFlgL0NN1hkOJUHVnPl3w2tsQbiypz0H8lKgCY+y4sfOae6fTmlzzF8HXxoKVsVkPI
	 GSAURFWWS2aOIsDg2wJL2uZf5KTligk683l0w+rUFk288HGmR2XEfHUKyX7AknPG5S
	 KxN4Da+iUJAtKf/CK25WE6Txbm+w1qAFOmGjxZLyA+Gi7+1da8rp3fp/EOLF5wzW45
	 DpOV9F6QcIP0tXsWJZJzw4e4tUeDeXzMWTp4dW4JUNTikHNBa9PfAs8r4SqOqOob7k
	 STAl24+5nrHzg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 09 Jul 2026 00:24:55 +0200
Subject: [PATCH 1/3] ARM: decompressor: always set endianess on xscale
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-ixp4xx-little-endian-v1-1-e9622d0ba9e4@kernel.org>
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
In-Reply-To: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2

From: Arnd Bergmann <arnd@arndb.de>

In BE32 configurations, endianess is always set to BE in Control
Register C1, originally to allow booting BE kernels from a LE bootloader
on IXP12xx.

To also allow the opposite and allow booting LE kernels from a BE
IXP4xx bootloader, moving this code into head-xscale.S along with the
recommended serialization sequence and flip the B bit into the correct
position regardless of its original state.

Note that both the endianess switch sequence and the cp15wait I add
here should be harmless on all supported ARMv4/v4t/v5 CPUs, but the
existing cache flush code is not actually defined on ARM720 and may
cause problems in multiplatform kernels that include both Xscale
and CLPS711x.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/compressed/Makefile      |  8 --------
 arch/arm/boot/compressed/big-endian.S  | 14 --------------
 arch/arm/boot/compressed/head-xscale.S | 12 ++++++++++++
 3 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index e3f550d62857..5993dd1d0ee9 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -41,14 +41,6 @@ ifeq ($(CONFIG_PXA_SHARPSL_DETECT_MACH_ID),y)
 OBJS		+= head-sharpsl.o
 endif
 
-ifeq ($(CONFIG_CPU_ENDIAN_BE32),y)
-ifeq ($(CONFIG_CPU_CP15),y)
-OBJS		+= big-endian.o
-else
-# The endian should be set by h/w design.
-endif
-endif
-
 #
 # We now have a PIC decompressor implementation.  Decompressors running
 # from RAM should not define ZTEXTADDR.  Decompressors running directly
diff --git a/arch/arm/boot/compressed/big-endian.S b/arch/arm/boot/compressed/big-endian.S
deleted file mode 100644
index 0e092c36da2f..000000000000
--- a/arch/arm/boot/compressed/big-endian.S
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  linux/arch/arm/boot/compressed/big-endian.S
- *
- *  Switch CPU into big endian mode.
- *  Author: Nicolas Pitre
- */
-
-	.section ".start", "ax"
-
-	mrc	p15, 0, r0, c1, c0, 0	@ read control reg
-	orr	r0, r0, #(1 << 7)	@ enable big endian mode
-	mcr	p15, 0, r0, c1, c0, 0	@ write control reg
-
diff --git a/arch/arm/boot/compressed/head-xscale.S b/arch/arm/boot/compressed/head-xscale.S
index 20fa44d59f82..86705c865be6 100644
--- a/arch/arm/boot/compressed/head-xscale.S
+++ b/arch/arm/boot/compressed/head-xscale.S
@@ -14,6 +14,18 @@ __XScale_start:
 
 		@ Preserve r8/r7 i.e. kernel entry values
 
+		@ set correct endianness for ixp4xx regardless of bootloader
+		mrc p15, 0, r0, c1, c0, 0
+#ifdef CONFIG_CPU_BIG_ENDIAN
+		orr	r0, r0, #(1 << 7)       @ enable big endian mode
+#else
+		bic	r0, r0, #0x80
+#endif
+		mcr	p15, 0, r0, c1, c0, 0
+		mrc     p15, 0, r0, c2, c0, 0
+		mov	r0, r0
+		sub	pc, pc, #4		@ flush instruction pipeline
+
 		@ Data cache might be active.
 		@ Be sure to flush kernel binary out of the cache,
 		@ whatever state it is, before it is turned off.

-- 
2.55.0

