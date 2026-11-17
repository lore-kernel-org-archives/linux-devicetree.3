Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906592;
	b=0o5sjcrwXoGbVDU767cwysjKiBXbHXOdUwhisjojWtGqqh6KdG4z77XLolLpC64N9d2A
	 jSpuiLMVLZuHKPsWHGVWB/ftEKT58iBSkQEP0YXsV6W6dx+hcDTQjnlFpvnJzYfxlwS7h
	 FXJeE0RS0w7nZcUyZJul5GLn8kO2ohikfJujA+l1UaC1K53msjV2SOfNXDjf6SUhaY7sH
	 VangrJTn8BbMD/nV8axmRvPVJZrDqZCBb43VtPb3eRp6swF4PVNsJfI1CzZTdICmnZK/r
	 WTyvSkqshxjZ6NI62DY27DXu8iso8NdG8aAdRkEOUInG8AUaoVMLmIu2OnILKLtL/YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906592;
	h=DMARC-Filter:DKIM-Signature:Date:Mime-Version:X-Original-From:
	 Received:Subject:Content-Type:In-Reply-To:To:Cc:X-Mailer:References:
	 From:Message-Id:X-Lms-Return-Path:Content-Transfer-Encoding;
	bh=DRswDdQOboDC8jUvVqmXRjusKvExO2lbWDxBKXv1mvo=;
	b=U4zkYuK7rnn4Q2KaorDk8pVIJPk0IdizmGRC3iptUSo91wVEpCCnva0eKbm4HCrgd2YQ
	 kH6U7sLeg1Kskp5yMzToFZg/tAO+ls3CbXeueSJnrOC+YbPkwtMCSbh1lfj6mLn6NiSfg
	 SyP6YPnYtQLM82OnjOnyoAOlUo19BYOLrl8CDZOvac1qN12VotSoDAF7a3WlXqK8XxR6r
	 RNB0MtT3+Lpm6s7qcynh/5Re+a4acIIE0/Nk/0V0L+VzDvHcMjJdzcwVqo0CV9/ElemZf
	 4Zrgwul1xGwN4P/mU5zfpSJBNJShMMclnvro4P8llfe5gBQKohrZ2C7ivOd3fGm3u0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=0RqEURDE;
	arc=none smtp.remote-ip=209.127.231.45
Received: from va-2-45.ptr.blmpb.com (va-2-45.ptr.blmpb.com [209.127.231.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3ED606A333
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3ED606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=0RqEURDE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794906587;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=DRswDdQOboDC8jUvVqmXRjusKvExO2lbWDxBKXv1mvo=;
 b=0RqEURDEcK1kLmqRdRLe3zgyTBykkOzAEBheJxB3med4IYj8VKfNShg9pauwBb2EO4TkOd
 /81qVMhzJwf2tnGopDW+uQbvAJS2eoy6zLavFauNFI9h4lR8zSDjQNgZ3EqsNxhWwVkk6j
 3RpqrwIiEI8wWrEDxutxtEi+8HELD23ek5dxfK6icUdx99O2kV8GpzjCdJzSMbG4AWapeO
 dxKdCOPJUNJuZc7OnlFaCt9CwXZB7Ivr1XYUzVhoAQSKob8zYgyW7hUuupoxCGDdy+QyNX
 JJ3KD0xX9Vqea498Pi8k5mW1P7cO11Q7kD0b0/vhFDNOL+dMHMssfx44756fSQ==
Date: Tue, 17 Nov 2026 17:06:47 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 17:09:43 +0800
Subject: [PATCH v3 5/7] MIPS: Loongson64: dts: ls7a-pch: Bind UART nodes to miscellaneous clock
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>, 
	"Conor Dooley" <conor@kernel.org>
X-Mailer: b4 0.17-dev-ce4c1
References: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Message-Id: <20261117-mips-ls7a-wdt-v3-5-2e88f7e1d6c5@oss.cipunited.com>
X-Lms-Return-Path: <lba+26afc19d8+3629e2+vger.kernel.org+rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit

The Loongson-7A's UART controllers are driven by an internal 50MHz clock
source called miscellaneous clock. The clock is nonconfigurable for
board manufacturer and software.

Therefore, the LS7A UART nodes don't need to be fixed up by
lefi_fixup_fdt_serial(), and can safely use clocks nodes rather than
clock-frequency ones.

Suggested-by: Conor Dooley <conor@kernel.org>
Link: https://msgid.link/20261111-oboe-shack-11c3e3ce0830@spud/
Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index bd191336f14d..1793109281c7 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -38,7 +38,7 @@ lpc: interrupt-controller@10002000 {
 		ls7a_uart0: serial@10080000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x10080000 0x0 0x100>;
-			clock-frequency = <50000000>;
+			clocks = <&pch_misc_clk>;
 			interrupt-parent = <&pic>;
 			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
@@ -48,7 +48,7 @@ ls7a_uart1: serial@10080100 {
 			status = "disabled";
 			compatible = "ns16550a";
 			reg = <0x0 0x10080100 0x0 0x100>;
-			clock-frequency = <50000000>;
+			clocks = <&pch_misc_clk>;
 			interrupt-parent = <&pic>;
 			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
@@ -58,7 +58,7 @@ ls7a_uart2: serial@10080200 {
 			status = "disabled";
 			compatible = "ns16550a";
 			reg = <0x0 0x10080200 0x0 0x100>;
-			clock-frequency = <50000000>;
+			clocks = <&pch_misc_clk>;
 			interrupt-parent = <&pic>;
 			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
@@ -68,7 +68,7 @@ ls7a_uart3: serial@10080300 {
 			status = "disabled";
 			compatible = "ns16550a";
 			reg = <0x0 0x10080300 0x0 0x100>;
-			clock-frequency = <50000000>;
+			clocks = <&pch_misc_clk>;
 			interrupt-parent = <&pic>;
 			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;

-- 
2.55.0
