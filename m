Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992301;
	b=FXmzk62OVBdgHeUerAttdskD0GZwH0d4196bJa/suAn4TLeizvisLF9JgulplTCZt5Wi
	 DqMzqABKv/L2tPVOKy84/BqlFbJ1GSacqhzsC0m6+H65eGooPddTASwj/j7NjkL/owb4s
	 j04zIWxiLf4pjCT3AxUtF8UaaKdPgTqrxoiVpgnOEVCDvAY0j2qf3/1AiLluo9mwOj4um
	 Gpj4zbeGKOeWpTpxNaZK/xPyZTcoKG2gq7eV2j5YyjOA6xNza35Kc7ypZHCqwzaDThi/I
	 0+qOm1SpftPlZNgr1SQTEJ4nM6AUevzcWibUpbJYAivYsU5Y2kiFjWa+4/mNuo1mQzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992301;
	h=DMARC-Filter:DKIM-Signature:To:From:Mime-Version:X-Mailer:
	 X-Original-From:X-Lms-Return-Path:Message-Id:In-Reply-To:Content-Type:
	 Received:Cc:Subject:Date:References:Content-Transfer-Encoding;
	bh=sveQCqM0T8TQXebLs1ee5J0Akp/eUy4wpp9ckOQs5CU=;
	b=kFn58ddlCARzvqUtteGEDK/DZAjqd+0IQF4F9cDmNJgAF71dSLd5d4Dp7AHoAcllWLrM
	 CNPLzTNAEPIlZQ2nGyaaIoGNS/T7DuSotZhwWuZqyL9cfoIQ0ycmda6qPD/zBrA8TL5gu
	 MTgjM0wIE2qXwykQ3oE6waSw/AYpEOU1gct6H0OCPLI0L+NhFdiaDVwLBEyH5Io3RWvud
	 T4RfG/QI08laxhEagQrHeZztnL24clF0xSEOyeE6bicDii8vPdtm20IS1yxB/55RozzqX
	 ZUUhFOhpzsn4ZDhmVL6zazvV3b9q6U0ileM8ImI5VnRJ6Ni9ljh2JwDcuZoAQWGqcVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FsenHpfD;
	arc=none smtp.remote-ip=209.127.231.59
Received: from va-2-59.ptr.blmpb.com (va-2-59.ptr.blmpb.com [209.127.231.59])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E8606A338
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112E8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FsenHpfD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992296;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=sveQCqM0T8TQXebLs1ee5J0Akp/eUy4wpp9ckOQs5CU=;
 b=FsenHpfDmPTX/Bv1PN4d8ayLPq6yaQTPA+iE+hEfIVLCTvRCgNYa5LUBuuY2vaDcnHI0gJ
 GV1+cjVdoztYQdtEPb25qV7xfLKHvHsa+gaEERlaTA/bOVzhC4hn1a1rPnNGShnpAHwdZm
 5e+2Qxq3cRg6sLbkZX5vGnOWoz//Sdmy3Gtij7ujVc+5uChLpx7fVVUU9LuzHqfCtVNl3+
 DC+sGKHKLBptjpexEYiXVwV0uwwO9CqsPv6k1DnXNyJ1EqmJi+TXpu+/7ycTUP/88mQc0E
 azlPrY0qhUSJia6nkyLsZ5+/ZznzE29+a65v+IuT62di8c6ljAJcQ2zUDQ/sfg==
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afd68a6+a873f6+vger.kernel.org+yang.wang@deepcomputing.io>
Message-Id: <20261118085742.1817536-8-yang.wang@deepcomputing.io>
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:13 +0800
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 7/9] riscv: dts: spacemit: Describe the K3 eSPI controller
Date: Wed, 18 Nov 2026 16:57:40 +0800
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Content-Transfer-Encoding: 7bit

Add the disabled eSPI controller with its memory window, clock and reset
connections. Keep the board-specific EC child out of the common SoC
description. Other K3 boards remain disabled by default.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5c..d859c84bb 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -648,6 +648,37 @@ gmac1_axi_setup: stmmac-axi-config {
 			};
 		};
 
+		espi0: espi@cac8c000 {
+			compatible = "spacemit,k3-espi";
+			reg = <0x0 0xcac8c000 0x0 0x1000>;
+			ranges = <0x0 0x0 0x84000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			pr-mem-base0 = <0x84000000>;
+			pr-mem-base1 = <0xcac8c000>;
+			clocks = <&syscon_apmu CLK_APMU_ESPI_SCLK_SRC>,
+				 <&syscon_apmu CLK_APMU_ESPI_SCLK>,
+				 <&syscon_apmu CLK_APMU_ESPI_MCLK>;
+			clock-names = "sclk_src", "sclk", "mclk";
+			resets = <&syscon_apmu RESET_APMU_ESPI_MCLK>,
+				 <&syscon_apmu RESET_APMU_ESPI_SCLK>;
+			assigned-clocks = <&syscon_apmu CLK_APMU_ESPI_SCLK>;
+			assigned-clock-parents = <&syscon_apmu CLK_APMU_ESPI_SCLK_SRC>;
+			operating-frequency = <20>;
+			io-mode = "single";
+			alert-mode = "io1";
+			alert-type = "open-drain";
+			watchdog-timeout = <0xffff>;
+			crc-enable;
+			auto-gating-enable;
+			peripheral-channel-enable;
+			vwire-channel-enable;
+			oob-channel-enable;
+			flash-channel-enable;
+
+			status = "disabled";
+		};
+
 		eth2: ethernet@cac8e000 {
 			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
 			reg = <0x0 0xcac8e000 0x0 0x2000>;
-- 
2.43.0
