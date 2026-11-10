Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294177;
	b=meWZ0PPoEGqyt/2AiwReXwBE83UmnLyK6epLOZItLTI2ldENkCG0Wym6rq93YFbYTfZr
	 kX0kS0Njgp5Vi7oxQdwLoLkZ9A4TBFFAUBUqcqbA+LtEy1mrOeKUttnsOve3VHvnPPyri
	 ZeGV2p3x+8Binjz1eH+OdzG19a31X0sE3f/K8MAWQUnWdyMkXW4qS+1JntJRUuMFQgTqw
	 IfuWPTYAVt42hGYZ6LEw/Aq3whwfdjiVzIY9nFwDx7qreyGQKZjxTFh/1F/yikuWNVu3F
	 N+Pr2JgO4CRW6JMGkQMeYnu5gRV/kjOdmLanC+zBfnImZsWxm2VBBPL9AN3c1Q9u7rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294177;
	h=DMARC-Filter:DKIM-Signature:Content-Transfer-Encoding:To:Subject:
	 Message-Id:X-Mailer:Cc:Date:X-Lms-Return-Path:Content-Type:
	 X-Original-From:X-Change-Id:X-B4-Tracking:From:Mime-Version:Received;
	bh=UleRd71tSF6eVZUuoDFDW/IbSpmyxdNph78pCLJH6Zc=;
	b=XF28/oqJtS7n2kVyvc5uV6B4pv4kMOWjWfARF1+xVMcB6G2tED5GB4DQ2TGIVdWZgnhu
	 u6Vg/t4e4SibyTmzq1Bh8HRxkD7YQwKBMpotkAcEqU4G6FFjKps5VNKRPjclvnWSM2684
	 qPeRQm5FfRUtuEJLnnOlCcI84nxeqlrr+yVowPBTBR95rh5QjDWI/iKYf1hKmMI/IrRcK
	 Q+v2i0lc5DHycM3+GlzkMAJttIhPcKaZ6AHHyI/JVFjiuNtMvKYqCEpTvOtUnxYPQkPsO
	 n0nm3RwSLiFTNy2aL+ibYkZc0wLkTSq3RYPRYKz8A52PuHG66ZI7ohX0VVhX98zQ7LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=0mHHzO3h;
	arc=none smtp.remote-ip=209.127.231.50
Received: from va-2-50.ptr.blmpb.com (va-2-50.ptr.blmpb.com [209.127.231.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F339606A325
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F339606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=0mHHzO3h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794294170;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=UleRd71tSF6eVZUuoDFDW/IbSpmyxdNph78pCLJH6Zc=;
 b=0mHHzO3hdDm+ZqSmeePie3b7fSizRXzVc5ISORKVWO/3kMoCUKn/YYe1Gd2lzn/GfJoG99
 VwKnnnWYfQ24n6lcS+1SLnM+XU31eB8yyR9dut/ff/ZdO0J40b4AXhv/2CDWMgSu5RBtTY
 EGR8bRzLCKjhcMAmMsWlqQrHKL9RttmkGu8zWMMiW6DpO5/PzJwnO8slzwIWYTRk2aGL/r
 alMNMEAbn/m54u36R2uqggVVy/JFyF8DRWDX3IwGbt09fZ6Cq7vxuLo/OEA4liwLnt1jus
 U+SYnJkX4mOfuwvT9PDhZ9ANE+SnmKM3fk6ww4NT4Jon28vsR7a7kQSJvdVkKg==
Content-Transfer-Encoding: 7bit
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 0/4] watchdog: loongson1: Add Loongson-7A watchdog support
Message-Id: <20261110-mips-ls7a-wdt-v1-0-968bb85122e6@oss.cipunited.com>
X-Mailer: b4 0.17-dev-ce4c1
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Date: Tue, 10 Nov 2026 15:02:29 +0800
X-Lms-Return-Path: <lba+26af2c197+d3af15+vger.kernel.org+rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
X-Change-Id: 664fad58-mips-ls7a-wdt-1e614643b33d
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE vPSU3UzU4B8JTMzk7TEFFML3dzMgmLdnGLzRN3ylBJdw1QzQxMzE+MkY+MUJaCegqLUtMwKsHn RsRB+cWlSVmpyCcgQpdpaAMP50/FxAAAA
From: "Rong Zhang" <rongrong@oss.cipunited.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from [127.0.1.1] ([1.192.71.23]) by smtp.feishu.cn with ESMTPS; Tue, 10 Nov 2026 15:02:46 +0800

The Loongson-7A watchdog is similar to Loongson 2K0300, except that it
has no clock controller.

Add "loongson,ls7a-wdt" compatible as well as a conditionally required
field clock-frequency. The driver will retrieve clock frequency from OF
to make it work.

With these, add a watchdog node to the LS7A PCH dtsi to wire it up, and
enable LOONGSON1_WDT in defconfig to make it work by default.

Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
Rong Zhang (4):
      dt-bindings: watchdog: loongson,ls1x-wdt: Add ls7a-wdt compatible
      watchdog: loongson1: Add Loongson-7A watchdog support
      MIPS: Loongson64: Add watchdog node for LS7A PCH
      MIPS: loongson3_defconfig: Enable LOONGSON1_WDT by default

 .../bindings/watchdog/loongson,ls1x-wdt.yaml       | 31 ++++++++++++-
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi          |  6 +++
 arch/mips/configs/loongson3_defconfig              | 54 ++++------------------
 drivers/watchdog/loongson1_wdt.c                   | 29 ++++++++++--
 4 files changed, 70 insertions(+), 50 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 664fad58-mips-ls7a-wdt-1e614643b33d

Thanks,
Rong
