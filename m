Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7529036165F;
	Tue,  9 Jun 2026 02:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973555; cv=none; b=m+rCRm0t64d482SM8YxKUmZajOtt1S9/1gqRsXGZCcB+XNhwKecxqJEowHtx9RcL7hyvNM7/vLP2f/mtKUUDbF358L/gQNklHC+RHpz2ynxDlVH1eJrxu7PNAztXNq4ZKaDjHfwKwXk4Gke7aOfDudZ23N9Fm/8p+FHZRaEM37A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973555; c=relaxed/simple;
	bh=EBITMQDVMIBNjYv1BqeOz0kQOoDsTctmA4eqzlKyya4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XN4jjSOeWoxqlfkQ3TGIxs5PhrAicmszmv2uO1epOO5XvlMVFCVUe8ei41DGqKJ3uOImpRWBErSGRsxw6oGpc5gVjj9nWwdNpbkRGyI8of+w/RTfHoDrqDWi43MTjHQuNzsXLRmJQO50GsEiNy1Fw6wjsqUVxiR/yH3Iw50lMmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 9 Jun
 2026 10:47:20 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 9 Jun 2026 10:47:20 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Tue, 9 Jun 2026 10:47:19 +0800
Subject: [PATCH v9 2/4] arm64: Kconfig: Add ASPEED SoC family Kconfig
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260609-upstream_ast2700-v9-2-f631752f0cb1@aspeedtech.com>
References: <20260609-upstream_ast2700-v9-0-f631752f0cb1@aspeedtech.com>
In-Reply-To: <20260609-upstream_ast2700-v9-0-f631752f0cb1@aspeedtech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, "Drew
 Fustini" <fustini@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<soc@lists.linux.dev>, <linux-riscv@lists.infradead.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780973240; l=790;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=EBITMQDVMIBNjYv1BqeOz0kQOoDsTctmA4eqzlKyya4=;
 b=+ySBhANUhCDR83sBpIy8ULzxKDOd4NgF2sG3COLXTWRK5kgvxZLO61u6rG8I+TjkBHgmPtAfq
 F+fDuIE2J9ABoWRKIidD2MKXV9XwRWKC6/gRbOZDYkL2QLlcSQedXD0
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Add support for ASPEED SoC family like ast27XX 8th
generation ASPEED BMCs.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index dc995a732117..d2acfac73003 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -48,6 +48,12 @@ config ARCH_ARTPEC
 	help
 	   This enables support for the ARMv8 based ARTPEC SoC Family.
 
+config ARCH_ASPEED
+	bool "Aspeed SoC family"
+	help
+	  This enables support for ASPEED's SoC family, such as the
+	  ast27XX 8th generation Baseboard Management Controller (BMC).
+
 config ARCH_AXIADO
 	bool "Axiado SoC Family"
 	select GPIOLIB

-- 
2.34.1

