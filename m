Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE66288C08
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674406; cv=none; b=eq/UojrujWbufZYdSNdNlRlpoQ/eI7o16X5oaWVmVi4MMLQmETTPJlVDarOXotssSF4s4RBu1fx+XIPnmiifWmqDNLLnxeWwwA5vaCtvnY0DGGozc5oKcxzcreYOZhsFidwJLii4cLPRUIXT5XG8KgFpqvVBuFScPJa/AV7BzHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674406; c=relaxed/simple;
	bh=U9id1yMxeJM38JUaEp/Vl1TrVGsOQ2j4RKeSQBsasZM=;
	h=Mime-Version:To:Subject:Message-Id:Content-Type:Cc:Date:From; b=MgSqTGiw5UQlYB64JYdsEWx0nuykVep0W65R4+YucZCxiRCNvyn/JcwxEdSTyIKagRwKg6qkvAq2IA60dD/r8KrF184BMf6SsIsOQdf7Ma7ctEa62vlW+xiOJBtucWLUA7OrV3+1yQXpcL5Ab2/65bUsjd1kujaY9/oW+JWqSQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=vdl4jAgo; arc=none smtp.client-ip=209.127.231.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="vdl4jAgo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776674394;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=MgsWDHxYc7rxgoNpzyBF6OV65e+9SKz/yJepBjtWIeE=;
 b=vdl4jAgohEfm2zs8vuqnxQD58OjEU9Zqk7pgZKwmiXECYt4taCJS8QHaLqhwMjsYUcLxZH
 /iN7SceptB/ETmTtMQvEQE6HWk5Rqik8kRPLvfv2HQtJVPrJZg6foLA9QY95wAUSEwXVmr
 v/mcXXeUgf3u/Jkv2ID1BbfndGL85Bors7AFC7CE+Mz2G9s5HAi51LsJB/zjigxGaeEa9g
 YeDLglaJ4zwVQPmO7/ZUIuHfAS3R2z7JWcwVFssq26xEb4YyrxV6UALTKLPKjFqcsn+qiM
 8h1S7HJBlUsJJmt2xo0pQ6xtew6f8c1kmvJW/CwrfJ4GaGt24Rv9jkxwxaBOmQ==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+269e5e658+7b9a48+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
Message-Id: <20260420083931.1427703-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([113.110.140.180]) by smtp.feishu.cn with ESMTPS; Mon, 20 Apr 2026 16:39:51 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, 
	"kernel test robot" <lkp@intel.com>
X-Mailer: git-send-email 2.43.0
Date: Mon, 20 Apr 2026 16:39:31 +0800
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

Fix dtcheck issue: compatible:0: 'spacemit,k1-i2c' was expected
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.com/

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 815debd16409..9a3d2e8cdfe8 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -556,7 +556,7 @@ gmac2_axi_setup: stmmac-axi-config {
 		};
 
 		i2c0: i2c@d4010800 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4010800 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -570,7 +570,7 @@ i2c0: i2c@d4010800 {
 		};
 
 		i2c1: i2c@d4011000 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4011000 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -584,7 +584,7 @@ i2c1: i2c@d4011000 {
 		};
 
 		i2c2: i2c@d4012000 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4012000 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -598,7 +598,7 @@ i2c2: i2c@d4012000 {
 		};
 
 		i2c4: i2c@d4012800 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4012800 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -612,7 +612,7 @@ i2c4: i2c@d4012800 {
 		};
 
 		i2c5: i2c@d4013800 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4013800 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -752,7 +752,7 @@ uart9: serial@d4017800 {
 		};
 
 		i2c6: i2c@d4018800 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4018800 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -784,7 +784,7 @@ gpio: gpio@d4019000 {
 		};
 
 		i2c8: i2c@d401d800 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd401d800 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.43.0
