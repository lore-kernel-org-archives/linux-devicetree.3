Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC347207C
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323387; cv=none; b=GMqOnowMdU65h9vyigWzo1mOC0ruc2HBTlXeVxbzbr/LzlvfBQRHxk2R7Fo03yfApsgRdGecZK/Epu/NFDU3P6Yu/73anzOVAL+0AP5/wiuSa9CPb0XV/AwuSqDD//qehzjBsgPRzBHjo1IkEDtdwPehVcfngYe4upz2/pmmxBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323387; c=relaxed/simple;
	bh=8IF6z+YkTpvsCKmT/hFF80C11KUezqy6SDi0dife2Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fCyHfAthBMGUmf/Sa5OzAOEqs0zK+gQM18fvko8WN4pHQpYMwfpW5+m6R5oemgBIAgNJcYjIMWSOWOZRIyFfsq/yRlYl+1ZqEjL97xa+oD+iGutMaYmMlNCUouv0KrKeubQK1QA6SctMRvqHc1tvbE+gsSs98pPZ33YFAOnUVSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=dWHRyY5v; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="dWHRyY5v"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af22f8e38so15269866b.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790323383; x=1790928183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KR0mL9J3pFxTuxFhHbavstVLXuIlIRgXe/fcgJ1tOjw=;
        b=dWHRyY5vOkaqxoJIhW7NKdkPvG+ZbiksXYGqeZTFYBZcIEEtzs3KwuzoQMd6jpk7f3
         g/YrLkhKs/6iweMmMTFfHmlE/XM1eo7XSvu1rLdqngnk0E63tArrsusHHNb4MunHwzqt
         Zr/NAsbwflpryyWkFOz7dFWvwsweT0rMn9u86l9nfE0oGElmSgXE/iwTHBXmIWU4OzoY
         r7F9uNNtl0Ip9NkefBVfBfUgk3dXlsH+6T8W5DBnjnJPfNApfcGpqWIL4C1SoEIxzBk7
         tmMwPSBbpIjzb+/WZm0sV6t+qhQcXYBtvzZeugfSAcZVFjdxnWgNxZYVTaIVznAEIuZv
         vhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323383; x=1790928183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KR0mL9J3pFxTuxFhHbavstVLXuIlIRgXe/fcgJ1tOjw=;
        b=zNwd6zbCu92siTL9e2Sc3CVM5VKDA9b+eH+q/7quNnVvDQpF0sYxLhFrUFP9huX9lq
         onX8wDrXT3A8TiDuUuxlUNxPsVkyXGqyVPt6WBzPR2wEhAFGLAAiDI47J++CYZxuSOTB
         NJb1r56PYEngytffSpdbxqe5CYVuQQbS6OY4k9QwPhQGmOoY05MMU8a7gy6yahIXgqCd
         944cKci6ZXn0FRFW+gZ4Ez0dD2qZdXtPp7ZI+PCal/cRGwYMVfIjbKsZ6Qi0IeZqKwV8
         SGI7KpAtL+bai26RGn9FY3Za2tJkHpWAVLQRkVnQzUy8rcgtdcnFudj5LdFb/SGVarLw
         5i3w==
X-Forwarded-Encrypted: i=1; AKwUvBzgNx15PsVOXIrIqLmnOqlb3AVP/Z9QKK6W6A06bqftKYM5gbRg7K9Qa8EkfNBnOr9twgm62sGc0eu4@vger.kernel.org
X-Gm-Message-State: AFuF++m9dH2v6tISZ9TfjK/54SeEYrZUjAKJe5NYYZfWGS11ESweYSuU
	kKtsRycmjReWBuE1PFMg3GIZusJUDmKSp57+M8iBhxb7RYUkEK5HGHM/FFeXicRm3Z8=
X-Gm-Gg: AYBFou1sElIOwBbadgaN6Xk7SAc6NRm5ViEWyKbHGMpebhcT9U6NquaOVhpp12SCAbC
	DNxV9qmuPBAQVczJIIYjuwa1s4UVF1kf/vIav45LELz2iTtt1DxKZXJQOrKUdaEzsxbPnOXBlgi
	UIeyhtlCIfQgrFNS0u9ZIUtzGNyT9jRpMsG0BRN8nzEh8yAVFlLwsXtOOLXcKuw6/7IyHSfhqbK
	ad86TIsWdKSILTuvVmBKngh2ppTbHw66ZDsxcOmEeX63uzlvnjx3NbAMaEUX/nvExuTLcttnEhh
	DYgZKOpK8YJEk21gUcca2yAH4p6q9zK27ld2InTQOpQ904lE4SBfJwKISKET+ii/FBXviedlKVs
	Qpwfr3JDRAihjm/yXglZFBrH9gyu5BSMHM1mXZ85rfpdA4wxeqWCuOsIckjvFQBsGSbsz/pgXOu
	scGe2BIw6wttYsIVKqecUKkOMgOdOhXxbFWB3KqnSKJ12HC4XCDa16J7QxV88s72qxax91GSOsy
	yLq7AuzRP1sOMsvf1H1CMLJIZ55Pmv5ZHrt2hd62mdxGj1grrjZK5Sptg==
X-Received: by 2002:a17:907:6c17:b0:c29:f5d5:5a9d with SMTP id a640c23a62f3a-c2ac246608emr448681066b.39.1790323383296;
        Fri, 25 Sep 2026 01:03:03 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm76976966b.33.2026.09.25.01.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:03:02 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add PWM fan and WWAN overlay for Radxa ROCK 3B 
Date: Fri, 25 Sep 2026 10:02:56 +0200
Message-ID: <20260925080258.46489-1-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Radxa ROCK 3B has a 2-pin fan header and an M.2 B-key slot
intended for 4G/5G modules, neither of which is currently described
in the mainline device tree.

Patch 1 adds the PWM fan and ties it to the CPU thermal zone. Patch 2
adds a device tree overlay for the B-key slot, enabling the USB 2.0
host controller serving the slot as well as its power, RESET# and
W_DISABLE1# controls.

Pin assignments were checked against the ROCK 3B V1.51 schematic.
Tested on a ROCK 3B with a SIMCom SIM7600G-H module and a 5V fan,
running Linux 6.12 (OpenWrt) with the same changes applied.

Changes in v2:
- Move the USB host1 enablement and the WWAN slot handling into a new
  rk3568-rock-3b-wwan.dtso overlay, as the slot is not always
  populated (Jonas)
- Drop phy-supply from usb2phy1_host, as the M.2 slot has no VBUS
- Put the fan patch first, as it no longer depends on the others

v1: https://lore.kernel.org/linux-rockchip/20260924071445.441822-1-adam@wermuth.pl/

Adam Wermuth (2):
  arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
  arm64: dts: rockchip: Add WWAN overlay for Radxa ROCK 3B

 arch/arm64/boot/dts/rockchip/Makefile         |  5 ++
 .../dts/rockchip/rk3568-rock-3b-wwan.dtso     | 65 +++++++++++++++++++
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 51 +++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso


base-commit: 23d8f49fcae5d72b77744c7f349c12462c3bb748
-- 
2.43.0

