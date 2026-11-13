Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567087;
	b=r0xKkLodcC8baovkcE1ebbg/0Z8q18Ey6T+8b9U2whW20Ied2ffOFydbHHlSk0r1XxtA
	 XEoxHSthLPLF+/WSk7FQNxI8KmdoljikixCJSeKTqsWIVm8Qbvc3YGqrJtR23rNGsObBz
	 D/wdvdBg706Vgv/juXoxzdkRAcSubUU9qiop//Rp9DsdldaqSNYnmP/+p2vm94y6ap0tN
	 GB/ZhEY2FLOpRHyKvTyhk5fS+aXH4Q6T0v4g5CmNa/LJdpOBt0wyAOz9UnuZZW/l5P9PH
	 IPy3XNpz1QugBpf4/ewZP9dCt81sqmzpxY/QpnR0TLzrMd5PJxxA1tBKeOlYWP8fvvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567087;
	h=DMARC-Filter:DKIM-Signature:From:X-Change-Id:X-Original-From:
	 Content-Transfer-Encoding:Received:To:Date:Message-Id:X-Mailer:
	 X-B4-Tracking:Cc:Subject:Mime-Version:Content-Type:X-Lms-Return-Path;
	bh=F6hgOSUU1qJlJq5eTJnjpotGytrQHMM9NPCx9pCTgCk=;
	b=rrU162A+62nH+Ok8ToiaBfpP1onUsbFYX2XuDZI2leHaL5sEJpbMmntnh0vwjMBi+QMQ
	 ssxS9oxvhxbXf6rqGqLB7jVnR/c5270ELhVjCLcwreBtjP9ei0onQAvD2LxiMJ/8y4+7/
	 V4BvvwvKnAnp+Cw1i9+FUfIhueFixIe/gWXKenJeBITMUfpLVUDje+WNnVKsRMQEhsPGu
	 nI672C/pprXjvApnPrki54l/rMuPUmueRP7QOs/x65+lvMNVsglGcHPvrzFraqps+l3dt
	 Jwk4GGYUGp9pudHoeQqHIHIlVeGxNyRkxbRN7tgMD1Z8K2vDuYiJPT6XsqSM+JPrXjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=Uj8aZMt9;
	arc=none smtp.remote-ip=209.127.231.16
Received: from va-2-16.ptr.blmpb.com (va-2-16.ptr.blmpb.com [209.127.231.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05070606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05070606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=Uj8aZMt9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567079;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=F6hgOSUU1qJlJq5eTJnjpotGytrQHMM9NPCx9pCTgCk=;
 b=Uj8aZMt93bivq4M4tl5EX35KlVWJ7qa6mAK6mO5vzCgbc90m4GSECWCDX+JK7RyD3lZeYv
 GK6UiS8TM2KwYMZaFl4Z/33xuf/OsMb+zSs0u3VKOlVSbLTJKIPiCiMcscOBYH3utu7XC2
 4+Y/EOM0lq0HwVB+dWiO1/4/+XNopm7tkyidcUIuipPdYY+I0B0OV2VI6pvW8+EObqmqD+
 eqFJwh+Ea0EWQlfbLOTZe0rXvOeQx4AzvXk+7GLuR2dGIkHrKBNINUktahzuT1x9cb5Ft7
 qks2mXdaZokaGAZlvrHoDarR7jKJbZuevBWN0FAOdPTEah39yM/t0ne0v2PRiA==
From: "Rong Zhang" <rongrong@oss.cipunited.com>
X-Change-Id: 664fad58-mips-ls7a-wdt-1e614643b33d
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:16 +0800
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Date: Fri, 13 Nov 2026 18:51:07 +0800
Message-Id: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
X-Mailer: b4 0.17-dev-ce4c1
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBBFr2K6toQpUNGV9zAsaDvIGKGkU1BDu LuAO5cvef/9WTAGQhaXwywCTsTk+xXU8SBsW/d3lORWFlrnTe2KUnY0sHzyqZYvFyWghlznmck yJ9bNELCh9967VT/m0TzQxi2yGS1x9OGzH06weUKlSgNA+teeQKbyrEtjygKUQn31zImlYewpo kus70S1LMsX+EDagMQAAAA=
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>, 
	"Conor Dooley" <conor@kernel.org>
Subject: [PATCH v2 0/8] watchdog: loongson1: Add Loongson-7A watchdog support
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
X-Lms-Return-Path: <lba+26af6eba5+400d8d+vger.kernel.org+rongrong@oss.cipunited.com>

The Loongson-7A has a watchdog compatible with the one on Loongson
2K0300. It uses an internal 50MHz clock source of the PCH, which is also
shared among other miscellaneous peripherals in the PCH.

Add a 50MHz fixed-clock node with label "pch_misc_clk" to represent the
miscellaneous clock, and migrate existing miscellaneous peripherals
(namely, ls7a_uart*) to use it rather than clock-frequency.

With that, add "loongson,ls7a-wdt" compatible to dt-bindings and the
corresponding watchdog node to ls7a-pch.dtsi. Afterward, enable
LOONGSON1_WDT in defconfig to make it work by default.

Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.

Since the series modifies ls7a-pch.dtsi here and there, it also fixes
the weird semi-dec-semi-hex style in ranges and reg properties and add
the missing #address-cells = <0> properties to interrupt-controller
nodes.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
Changes in v2:
- Add a fixed-clock node to represent the clock source for miscellaneous
  peripherals instead of introducing a new clock-frequency node (thanks
  Guenter Roeck, Conor Dooley)
- With the above change, "loongson,ls7a-wdt" is now compatible with
  "loongson,ls2k0300-wdt" (ditto)
- Replace pre-existing clock-frequency nodes by utilizing the new
  fixed-clock node (thanks Conor Dooley)
  - Suppress warnings in lefi_fixup_fdt_serial() when the UART has a
    clocks node
- Fix weird semi-dec-semi-hex style addresses and ranges (ditto)
  - Also fix pre-existing ones, as their context (clock-frequency) is
    touched by the series due to the previous change
- Rephrase commit messages (ditto)
- Add missing #address-cells to interrupt controllers, as its absence
  causes a flood of warning when verifying my changes
- Link to v1: https://patch.msgid.link/20261110-mips-ls7a-wdt-v1-0-968bb85122e6@oss.cipunited.com

---
Rong Zhang (8):
      dt-bindings: watchdog: loongson,ls1x-wdt: Add compatible for Loongson-7A
      MIPS: Loongson64: env: Don't warn if UART has clocks node when fixing up FDT
      MIPS: Loongson64: dts: ls7a-pch: Add missing #address-cells to interrupt controllers
      MIPS: Loongson64: dts: ls7a-pch: Use hex in ranges and reg properties
      MIPS: Loongson64: dts: ls7a-pch: Add miscellaneous clock node
      MIPS: Loongson64: dts: ls7a-pch: Bind UART nodes to miscellaneous clock
      MIPS: Loongson64: dts: ls7a-pch: Add watchdog node
      MIPS: loongson3_defconfig: Enable LOONGSON1_WDT by default

 .../bindings/watchdog/loongson,ls1x-wdt.yaml       | 13 ++++--
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi          | 50 ++++++++++++--------
 arch/mips/configs/loongson3_defconfig              | 54 ++++------------------
 arch/mips/loongson64/env.c                         |  6 +++
 4 files changed, 56 insertions(+), 67 deletions(-)
---
base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
change-id: 664fad58-mips-ls7a-wdt-1e614643b33d

Thanks,
Rong
