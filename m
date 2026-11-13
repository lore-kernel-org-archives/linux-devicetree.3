Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567101;
	b=zWSPIH45V27kznHPoQt2pADzuOfYQOQGR/XBhbPaRw5xhFO5yrW6u0PvTdMuTJWiVJ8H
	 FXE0nHECDxH9Bnmevn11YRtN0x/fiGPji9D+M7JZUr8Rd7qFLx6Bc1EeSZgMZ58CugHs9
	 E8KMzwRhKo+uPZbeAMA/xWLR794iFhH3DHq+b9cMNRfbNFQRoy3lxEXaUsBNXGxM/AFDd
	 tBnxORQzyZs821eqr76nfEYXhvq9j/jnqQFxcPx9HoZt8Vd++8Be1gcfTBqq445KyUFKH
	 jRIrq77ExUwArSCDeeHZZ22YUa1EVtyT0q21btgGHVSbROUXWILu/knvwU5iPDrObhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567101;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding:References:To:Subject:Date:
	 Message-Id:In-Reply-To:Received:Cc:From:X-Lms-Return-Path;
	bh=Q08JydL98fy47nVJqLqGFTrZaaBqSEW743Jy2fzuf48=;
	b=pZYAKgUZ3s8SwPhHsjPg81/43FbRXMQkpH+Rae1Ys5Bggbr7N0QEz3+/H81vKaGgmXum
	 pqUln26U978PMUSOVmfF5ppdzNDMk/bZwVVMIP3F4+/HNGJg2nFvHAbYnVdtMEZy8oL4P
	 TVkqS+O8f1CM/bcv17cdcIj/m7v7vdrlFsUMzb4/CkcgIb8zeLpKmDpCMPZLAfjc2fOA9
	 ZVeOPQBpXo8S2QHjnOR5iR9KTn9fMRJNtf2lCUpxmqrKf0EtqXUVpywYR/0EB8YpBMQqF
	 bR1waeG3Ecfnt6+1ziwX1UobwFDqlj1Oa17FUGpYxlezgQNqSLsC3akbG0QI61AKu6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=NBvXPIJe;
	arc=none smtp.remote-ip=209.127.231.45
Received: from va-2-45.ptr.blmpb.com (va-2-45.ptr.blmpb.com [209.127.231.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965E4606B25D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965E4606B25D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=NBvXPIJe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567096;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Q08JydL98fy47nVJqLqGFTrZaaBqSEW743Jy2fzuf48=;
 b=NBvXPIJeAwsGVemlL+AyS/y5rVYY/U/aRagK6dtGNGt02kxhPff+0Lpp79J/g1Z/zB9HYn
 oVHYzkSNTnOHX6iYyx/lE9kmJOELjxh8SGTkTmZXICpaQ+weqPgNypaXFS3lxwbfYY1cq8
 2Yvcld6xaeeGDKubOif1zGpiLCXEan0xgIKTwSfbNOeIMWFGloV32Ahz4qe+AlsVRdzCA1
 v+hjZG9oyaI6XfLdd1whVW0DT16TuSelWz2yq/nEyMJPOzgYLNVNiisBaveqdvMkccKii9
 /AOtpTrzOlQr4E9guMiQbfnXTTAWWdKZEZgP10EJBx7pW+s/Ub6HDg36lg8xmA==
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: b4 0.17-dev-ce4c1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH v2 7/8] MIPS: Loongson64: dts: ls7a-pch: Add watchdog node
Date: Fri, 13 Nov 2026 18:51:14 +0800
Message-Id: <20261113-mips-ls7a-wdt-v2-7-e8abd6b2f77c@oss.cipunited.com>
In-Reply-To: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:33 +0800
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af6ebb6+66998e+vger.kernel.org+rongrong@oss.cipunited.com>

The Loongson-7A has a watchdog compatible with the one on Loongson
2K0300.

Add a watchdog node with appropriate compatible strings to wire it up.

Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 7ba7bbb9c013..498abf1f9a85 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -75,6 +75,12 @@ ls7a_uart3: serial@10080300 {
 			no-loopback-test;
 		};
 
+		watchdog: watchdog@100d0030 {
+			compatible = "loongson,ls7a-wdt", "loongson,ls2k0300-wdt";
+			reg = <0x0 0x100d0030 0x0 0xc>;
+			clocks = <&pch_misc_clk>;
+		};
+
 		rtc0: rtc@100d0100 {
 			compatible = "loongson,ls7a-rtc";
 			reg = <0x0 0x100d0100 0x0 0x78>;

-- 
2.55.0
