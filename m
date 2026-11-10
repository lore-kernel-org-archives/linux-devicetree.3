Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294183;
	b=JDqNTjpMewberVxe4T4+0fNPgshjlpERZA51wertYZHWKOBDxNKSpMEWh9uxkSjYJpI+
	 5Kr0oxYqIWQOUSjR+baMuWvvMO+Ga9BA0zaH2ZqinCKUVyrT7X9mZykiDiutCqCJZY3EQ
	 lsAupQ5nEaCSKb3HEdhxAnnFlK2xRumR/E2n6/IIk6a2wu5XTGXBbXuZFM+00Sr1IL3kj
	 1+TG3qTlO3NSz6T5HGvsfdhvqwelEAvyKhqXaEwZvqUsVnFcYfYFW5sEnW4/ohk/YFPck
	 RG1Vtdb8r4ObDAKbEs2gHd2n4atcXZkAoLy2SvNEpJbQjVF+BTvj6LvWGNqNFiY1XjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294183;
	h=DMARC-Filter:DKIM-Signature:Date:Received:References:
	 X-Lms-Return-Path:In-Reply-To:Content-Transfer-Encoding:Cc:
	 X-Original-From:Content-Type:Message-Id:Mime-Version:X-Mailer:To:From:
	 Subject;
	bh=TdtHdBztAO/0JtU1zECI9wziZwsMfxOqTiJiU6DPEOw=;
	b=iFgnKyovO0esoWdtZSc4mRR0l2aHfo8fgTDznvk2rEuaWHiruwNEfKAjVz2yyeepulAP
	 iJUtfwulOchlwv2OvqNRp5T/YbOU4kSbeShU69RKWJllIDtxX9ldvRqUJCweatomkkG6E
	 wz0GAW4nR4UdmHK3kW/vnkU/jy7chFCS065fpIevw0AcyF688kCYpW62RpIUn94UFhewu
	 HY0/Qc8/D0hHhax4NKDrDszSDc2VenqHnBSJPLwJ29EQv6JwRxgj226pJnOOZv+HDLc1x
	 hNTThU5IpcCQQTz1Vgxj0+0mzXmf7HoojVt4MVwCzl/8HX2ePjEb1eAsll8qLJ0a2NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=yAAOjEOr;
	arc=none smtp.remote-ip=209.127.231.19
Received: from va-2-19.ptr.blmpb.com (va-2-19.ptr.blmpb.com [209.127.231.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACE660A2620
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EACE660A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=yAAOjEOr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794294178;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=TdtHdBztAO/0JtU1zECI9wziZwsMfxOqTiJiU6DPEOw=;
 b=yAAOjEOr8pUEewHf5Z0VcVZbO8/QAVfzBlloj/iTWVO03HDRYr30tYhPGRwcBIZmmSZlpj
 gt4ybpdLSGVmPBCHWLCueEcdIsf+OSaKApHH8V58+1o9S2NQCXbxRykVu3FM+O0pQs8fzy
 xJTUd7eSSkkqmFQrAZrSuGCCpZeSPEkbfchBvS0wG+m3zGCqm9oh0y7AIRx/6yTHeQuwPK
 nxMNrZRnMaqlXJtmAe2m0ppV0VBe8NimWfN774CriLQ5e00akP0VoquFAMGI2s0/L1HeMh
 Rn30SRhhDMZr/Uss2ye1zBwoR34t/uKxlK09TUn6kpgcw2q5IX1GEsV21wcnSw==
Date: Tue, 10 Nov 2026 15:02:32 +0800
Received: from [127.0.1.1] ([1.192.71.23]) by smtp.feishu.cn with ESMTPS; Tue, 10 Nov 2026 15:02:53 +0800
References: <20261110-mips-ls7a-wdt-v1-0-968bb85122e6@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af2c19e+93210f+vger.kernel.org+rongrong@oss.cipunited.com>
In-Reply-To: <20261110-mips-ls7a-wdt-v1-0-968bb85122e6@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <20261110-mips-ls7a-wdt-v1-3-968bb85122e6@oss.cipunited.com>
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
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH 3/4] MIPS: Loongson64: Add watchdog node for LS7A PCH

The Loongson-7A has a watchdog. With proper support added to the
loongson1_wdt driver, wire it up by adding a watchdog node to
ls7a-pch.dtsi.

Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index f304f99946f1..770c96e9b908 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -67,6 +67,12 @@ ls7a_uart3: serial@10080300 {
 			no-loopback-test;
 		};
 
+		watchdog: watchdog@100d0030 {
+			compatible = "loongson,ls7a-wdt";
+			reg = <0 0x100d0030 0 0xc>;
+			clock-frequency = <50000000>;
+		};
+
 		rtc0: rtc@100d0100 {
 			compatible = "loongson,ls7a-rtc";
 			reg = <0 0x100d0100 0 0x78>;

-- 
2.55.0
