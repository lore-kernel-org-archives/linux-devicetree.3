Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF526221FCD;
	Sat, 27 Jun 2026 05:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782538125; cv=none; b=Ue8rwV5tRpHUZ/PN3F4tMGgSZIv7Gee129eoE0OqG9V3tZmUFMN9PCB645lxp2cnXsVwjcD0HBEHbA7FjO7bxZIja+UtL4I4MbkLBLBdUjqbLnio3TtzCwfvfgz/MaPssVMgYAWfOpPCCihEL4n4DoLjAkxKXl6lF5BCA+zryUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782538125; c=relaxed/simple;
	bh=hPhINhcx4YVoHZCH7POd41tsoj27nakwQpMuGaM6XSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vj7xJTl4ycNlSbBSSY4UGT+eQmYqKPsMuhM0x7c6iseRoGHwLzoAfpc93IezJEadDCoVvZH7Bnlj7CFiLP2Gwq4Ef/t8LT6/ZjesaYcjNgBWseerDLI8FwafAJjWRjvDmtWsYMikXvfez7x17694umWwFNkllJXY24tHvQ+g88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TCkjbpfR; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TCkjbpfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Sj
	Do9zkPqh5G3a4cJVEabwQF/qW3EfvDIzwridmYrhk=; b=TCkjbpfRH/7tLfUjmQ
	qzbCkOInafayZdvaCXmqft3mb286eZg7/1lTSWRC1pQdBbu1flSG7PRhq1WgEIyM
	FAoo4nzx1vL/wSIHWAbg8wM+LENOBProUGbnROs0me2vuPTNOJAE8VHriVp1U+AX
	90hIu53qkfUfBhSdBpOTQsKhU=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBXCwMxXz9qZPylEg--.40725S2;
	Sat, 27 Jun 2026 13:27:15 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: devicetree@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Haiyue Wang <haiyuewa@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] ARM: dts: aspeed: g6: Use KCS AST2600 compatible string
Date: Sat, 27 Jun 2026 13:27:07 +0800
Message-ID: <20260627052708.172918-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBXCwMxXz9qZPylEg--.40725S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4DCFyUZFy3XrW3AryDtrb_yoW8AF43pa
	909aykX39aqw4aq3WDWF1ktr4kJ3yrAF4DK39xAayUJF9Fg34IqF43tF4xKFsrXr4kuwnI
	qF18CFyqqr1DWr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRj0P-UUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzRRPumo-XzQRUwAA3Q

As the commit 2596f6b93a60 ("ipmi: kcs: aspeed: Add AST2600 compatible
string") does, change the AST2600 DTS file to use kcs ast2600 compatible
string.

Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..774d5af495fb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -585,7 +585,7 @@ lpc: lpc@1e789000 {
 				ranges = <0x0 0x1e789000 0x1000>;
 
 				kcs1: kcs@24 {
-					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					compatible = "aspeed,ast2600-kcs-bmc";
 					reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
 					interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
@@ -594,7 +594,7 @@ kcs1: kcs@24 {
 				};
 
 				kcs2: kcs@28 {
-					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					compatible = "aspeed,ast2600-kcs-bmc";
 					reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
 					interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
@@ -602,7 +602,7 @@ kcs2: kcs@28 {
 				};
 
 				kcs3: kcs@2c {
-					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					compatible = "aspeed,ast2600-kcs-bmc";
 					reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
 					interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
@@ -610,7 +610,7 @@ kcs3: kcs@2c {
 				};
 
 				kcs4: kcs@114 {
-					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					compatible = "aspeed,ast2600-kcs-bmc";
 					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
 					interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
-- 
2.54.0

