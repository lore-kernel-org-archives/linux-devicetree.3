Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567102;
	b=KblukgbHwwkN7y0oUBVjaAlIk9OObutH2aT13Z0+IDR3YjSZf12e7+nmAnwVHn5EPgVT
	 Vk1e/GBJc16hJFT9VurIOV6vQARbAONr+xwb3geMPTgr7OWPGJdnGm0m2EL8f2qDAjL0s
	 5XAhE/W/Jf3tAFif0MmMDY4DEFbmOR0nWkCo8fZ7H4ERNLthVglFlUj9B/12U+uSsF6U9
	 9eOSzruurRw2fNpiqYV6lURxh2s8l9D9s+KmbudedPkCTr8F/KhDRd/MR+8IW5MYS0T8A
	 d08l/2iZITdE7U/lr8bNGLnUfo0NCM34QsbMhO8d0g3MX/lnaV6xwSPaJl1kgnEM2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567102;
	h=DMARC-Filter:DKIM-Signature:To:Cc:From:Subject:Date:
	 Content-Transfer-Encoding:In-Reply-To:Message-Id:Mime-Version:
	 X-Mailer:X-Lms-Return-Path:References:Content-Type:X-Original-From:
	 Received;
	bh=PvWgb9sB0gJNLtO8374oDyk5f8yiTyQ7HhcAVQ4G2sk=;
	b=Sbd0JCagv8M6a8s3Y7269+TwGt1JVewKoOE7iA/paGUfUzZOFXKJhytp89rdF9c6F9qL
	 qPSrsW1/ImhlA3J+lb687BeGYxdUeJ3JDS128u+HDDyEutqVHQG7aEA08Ok8b0AepaJJB
	 GDRoJboxFf4+bxXxyE3h38NU5TV6VBR9fNw9A8gflk126M08ygeViFnzZb2Jj/kfsU12M
	 a4ADDX3W04bS4jO56LmrQH/NzYTlmPV6ZlzOhbwyTpJrAUJXIeG6eAlYOgRzOyxca8YWM
	 SF/xgQ+XjELUgEZ3iMzaBdkmB5KNOVuPx13xw/HBuhd6bDjvC3M9XSLCDAn5iNPRewA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=Re34KgrV;
	arc=none smtp.remote-ip=209.127.231.45
Received: from va-2-45.ptr.blmpb.com (va-2-45.ptr.blmpb.com [209.127.231.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B78606B276
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B78606B276
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=Re34KgrV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567100;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=PvWgb9sB0gJNLtO8374oDyk5f8yiTyQ7HhcAVQ4G2sk=;
 b=Re34KgrVf1edZ8RdP7wG3V/iHinLsMfPkF9AMJE2bMfTLcazy6zk7lHv/xfSYkXESgyAnj
 L5dt1TKOuozj5RQh75h0PET5CqMfuAmVvjMX9oI680TCvqYU1eppkrrN6ClDwOXdd+AXXo
 0rSDp2zCaHBLrpyLIDLiGy2H9zQilV1fjr6jHaKVJ3c0uvcDDy14kDGZz3BVNW5YM7dM0/
 3MNj7gdNfuQHmgJgbkOHhA7EB7Y/CPWsrSO0mkRz+ElhQBUNcUQXuStLdAHHDvctxrhvQN
 JhtqM21QVkkqe+pxwBrXTrcwWQbzNlt2cHDHDSFNnsCbT9/OiY9sPkBCqJHA+g==
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
	"Rong Zhang" <rongrong@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH v2 5/8] MIPS: Loongson64: dts: ls7a-pch: Add miscellaneous clock node
Date: Fri, 13 Nov 2026 18:51:12 +0800
Content-Transfer-Encoding: 7bit
In-Reply-To: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
Message-Id: <20261113-mips-ls7a-wdt-v2-5-e8abd6b2f77c@oss.cipunited.com>
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
X-Lms-Return-Path: <lba+26af6ebb0+58033b+vger.kernel.org+rongrong@oss.cipunited.com>
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:28 +0800

The Loongson-7A has an internal clock source for miscellaneous
peripherals. The clock source is nonconfigurable and has a fixed 50MHz
clock frequency.

Add a 50MHz fixed-clock node with label "pch_misc_clk" to represent it.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 9f0a183bd348..2ef1ad10a8ec 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -1,6 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
+	pch_misc_clk: clock-50000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <50000000>;
+	};
+
 	pch: bus@10000000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.55.0
