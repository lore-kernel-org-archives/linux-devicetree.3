Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4D1FC8
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784357950; cv=none; b=iZ/zYl4l49XMYaLFaY7EBXJU4FDMMgXjTfviirqGkILorYdOlxJidJDoiU2t8GBQweuQdB9r3pEsXVw6fvwJytGccpI5VPn4PXybOi1UMGPR7G35KhuTpxaqolaDuPsxv6B1m44wuiuEj7FIKgIEFtw6ENU2AdZSsP6pZ6/p7eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784357950; c=relaxed/simple;
	bh=3CEWfrM8epbvugGBRW7VbGIlaAMHZevhPiYoSea+v+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uyFWVrk1h028hhMjwBYS40Xe2sm5jl3VOuFLaWKw8ZGRzh9Zuc3rly7l2gggt3qRZdQvzL8bKE83C2CMcsFxAj/J0QOaTWykFpJhn6Qr+xA/dyK+kY6r9zqiFDAbN4pD1reFYaGPHFD4bbaTfykVKvtk5nmJbQkySEx63++Owmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRqwpZ1p; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRqwpZ1p"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9aea40d799so2438810a12.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784357948; x=1784962748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbNJCbR9fwKlsvB8FKMzu9iZUQ3KKsxGZYdnUhTBU4U=;
        b=cRqwpZ1pBRAkDxLMpmhoWWUWdhNL0UEGDiTVlM648Z335gESRYjCctUdnv0hDqg23y
         qKsN70xSpKWw49EtqRrBvrhyjLlrzI6OclYvlpSw2+6JsWpSC9cdk2xxViCYJBymh549
         8Igy1PQL7Ok2tn6EzN00ux72MZbKnHXmhsvtfxgvLSYMdk6MPzHVxmO329p15pGP0Z2A
         MeAbCM3ANr8kSgwmh44Lzf9FqO6/da720l+BJ3F8XDgPd3K7NcCw0duqv/vYDEE8MT7O
         n79xoYny1/KlXCxm5oBlgxhiQEv3ePYm+ZiME82n4x4KpXuqsHp8VOshUTGfOT7bTe0b
         WWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784357948; x=1784962748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbNJCbR9fwKlsvB8FKMzu9iZUQ3KKsxGZYdnUhTBU4U=;
        b=KHTeU/rUugyHrhEUyKBlFSnD1LLJ5yfa1Qz0FPWMGkJE5RFZ1VyB3rCjEJl4zLn6qD
         As6B+TUUwQRTJ185rtOTSIr/W9rDeeA3e7Gj/YWPMyUK/uHP5JaxNmBaUceP7qs3kb93
         FFzTjJTuLSx/xejErv447Bh/Ws7U4LK8pUBt31Vm7IAhnvU5oBn/xTad6LqWliX6pQmP
         8bPD9eiozD6fBxZuzxuDVhNywpXn9DeSMPr1PnqrJljF67q/vTalrs0PpKl/0RiMbSbi
         4WDHdLsrhjm+p3SZ2GwJGeHzpuOnwJ1w2uQqb89PdYeo0NuUkFgFKQMTLWWrfazHRGA0
         4ayA==
X-Gm-Message-State: AOJu0YxfGsu6eOOrPbDkCjI9Yh3QBakk/3g2YGZmlmbZQJbSFL1/MCts
	LYVRlDhsd8CR/8PHAUi7EOv18YSXE8aIPAmHQhep19odFmDSdXa3x1Fi
X-Gm-Gg: AfdE7cmnxuD4TMECeo7CoByOOYVzCgavh/K09e8cHIzS5TUUtDVtjZi+SaXeTz/L27L
	Hvg+HFffDm9oM7nLDJn/3J9NtsTI3xsr9Z/lvBzyk2bhloAbp5PsYsoyawRJ7MLmsswN3peCp9b
	360RIdKlVUIXXxBy5wLmQw1qh5SBzyM7jW08v63gtugnfoTG9eWd8XwJnDSak2a1rle8Rmght73
	MkHx0yjjJ48iLnV3smD6nEOSzSp8BngfMleQdmUvObQk1wRPWO831CPqyG5Ftl62bBJ1Ryy3JFU
	SfmX98OvmWZGKE8vF44ZCsFHsrb6kTcoDwy7XeLun0IHQ8om9rupYOf+nzuJse3UbRZZdka83yg
	iPlXuyASq9AgP/kJRdHhOK1Ms5AaZn6FD3LPgB65IkWnY5X+Q41nuS9AES5ysT6WMTSTS9X7EUc
	5lFzClV540fu0x+BpWMnOQ
X-Received: by 2002:a05:6a20:734f:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c3ad9dfdecmr6595081637.55.1784357948230;
        Fri, 17 Jul 2026 23:59:08 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm13426133eec.2.2026.07.17.23.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 23:59:07 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 0/2] Add support for Vicharak Vaaman board
Date: Sat, 18 Jul 2026 12:28:58 +0530
Message-ID: <20260718065900.755631-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Vicharak Vaaman, an RK3399-based
single-board computer.

Patch 1 documents the "vicharak,vaaman" compatible string in the Rockchip
arm bindings.

Patch 2 adds the board devicetree, enabling the RK808 PMIC with
SYR827/SYR828 CPU-big/GPU regulators, Mali GPU, Gigabit Ethernet,
eMMC, microSD, SARADC/TSADC, and UART2 console.

The vendor prefix 'vicharak' was previously accepted via:
https://lkml.org/lkml/2026/6/24/929

Changes in v2:
- Fix fixed-regulator node naming to use 'regulator-[voltage]' prefix
  consistently throughout

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman board
  arm64: dts: rockchip: Add Vicharak Vaaman board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3399-vicharak-vaaman.dts   | 438 ++++++++++++++++++
 3 files changed, 444 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts

-- 
2.47.3

