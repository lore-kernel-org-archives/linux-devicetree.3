Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567092;
	b=y5yY6HyIPq1umL4RNhKJkLvpXj0Wmgiv5c69zNJgEn0Xuz7CQD0CJ5hGLCemE19xn58a
	 /ooGt0dZqw47IMu3KywJIwEP3DB9/wZZ/uolz7cC3sirgInlOwS1wCLK9KWWTOSST1Thh
	 +9v6Ifoo4981TiThwYOzeXrIKyot9wybRjMEoyYqvIEqPzjAFtyJO9MdolXprAodIECfL
	 bUYfohIN1F+y5MMpLzJJwO8i0iCUOTYrF9QoEt2TP58w8V4Is01w4edxP0h6sbGPtpH/i
	 u5kOGw3WcmNTV9M88bN9vETa7SSop6L5ebISaXKSbn8OMRauvMDkysfAbcqxicNZz3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567092;
	h=DMARC-Filter:DKIM-Signature:Cc:Date:References:Received:From:Subject:
	 Mime-Version:Content-Type:X-Mailer:X-Original-From:To:Message-Id:
	 X-Lms-Return-Path:Content-Transfer-Encoding:In-Reply-To;
	bh=mLawhZvKrIFm4yo2XvBdNR8zXNDb1wduQA11H2HTQAo=;
	b=vun3Mjk4mjbMdxEZEH7cyhudreA0hOZ4eQUtpwf1pe1cxxmABdcGYjF0Zo3HnQ3LcyBh
	 Y1m8vYsIVaeV7ZIjPM5B3qA/ZaIazYoYJMGO9lFLHGxQZImSfAna8yPANXj2QpUBCp4WQ
	 +AB7xus9IoVHmyJUTehKD1qw1mErv3GuQw/vPHkAoqz8/nQ6Q9gRHRxqngsVKPZw23VjM
	 LrKqfxwke6T67WOgfPla9KX2cb7/JL0rChPx7zjjUAd5L13NIumPdk+gZZXKDaHPkZQaT
	 ol26lMcwaISTuOLcvgs/l/9QGKSCO6yQJw+p8tw6HYLXIz3Z6zVAsktCI8PHuKkx4zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=3Nem4hIy;
	arc=none smtp.remote-ip=209.127.231.43
Received: from va-2-43.ptr.blmpb.com (va-2-43.ptr.blmpb.com [209.127.231.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0A606A8BF
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC0A606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=3Nem4hIy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567086;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=mLawhZvKrIFm4yo2XvBdNR8zXNDb1wduQA11H2HTQAo=;
 b=3Nem4hIyt/d7eHxBVorbb+zJ/WVyJeFZ46sDYL9L/e6thhebRrfiPbysgnaTKxPpqQ3aLm
 7SxBYhLLUhsdL9ulnrwZ5T0aO6K53rxpuCcu0FTF6mkTnGlEhSFi1SyyiwxpRXcjOw66Vx
 e/exketQd5ROSPnMc+f7dAf0P83sXuVNmUJaKdi9QZQ65m6vbpzLXWghGmZnYXdNfWjlkA
 avrHeNiBJ114aOQ1Fom9O4rjNIosfnP/uGANOBfP365Pw57N0/rTZ84xLo73mAL2vgHqeo
 +7ztKDnHYXxqrKt/LE12dq1HX9kM8v5K7GkT26isSxDDyoM7iSZSsqZ6oRqFlQ==
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Date: Fri, 13 Nov 2026 18:51:10 +0800
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:23 +0800
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH v2 3/8] MIPS: Loongson64: dts: ls7a-pch: Add missing #address-cells to interrupt controllers
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailer: b4 0.17-dev-ce4c1
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Message-Id: <20261113-mips-ls7a-wdt-v2-3-e8abd6b2f77c@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af6ebac+aa4500+vger.kernel.org+rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>

The interrupt-controller nodes of Loongson-7A lack #address-cells
properties, causing a lot of dtc warnings about them falling back to 0.

Add the missing #address-cells = <0> properties.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
This series will modify ls7a-pch.dtsi here and there, so I fix the
pre-existing warnings to make me more comfortable.
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index f304f99946f1..28038b8cdd14 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -17,6 +17,7 @@ pic: interrupt-controller@10000000 {
 			interrupt-parent = <&htvec>;
 			loongson,pic-base-vec = <0>;
 			#interrupt-cells = <2>;
+			#address-cells = <0>;
 		};
 
 		lpc: interrupt-controller@10002000 {
@@ -26,6 +27,7 @@ lpc: interrupt-controller@10002000 {
 			interrupt-parent = <&pic>;
 			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
+			#address-cells = <0>;
 		};
 
 		ls7a_uart0: serial@10080000 {

-- 
2.55.0
