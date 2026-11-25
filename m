Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594988;
	b=ybDuhl726SAy86rFv65QH9ChV+OsnJHmsXzc+Xr8rnGTo93BQGAxcB1oZ9ZRI3SLH4iG
	 5Owt+E7iDfIhqSzzovkXxV/s+ctvo7ajCTOGoD6iZOPJ0oftljVvZ6kIi5c3jmM9x0sLe
	 MlILMFDGOdc+K2elAvu2s/zR9rJUkRrbIE7+fZ7t6BsMg8noX8SV+6rWEJ4+uNn7GiOYf
	 EJpfouxfpbd5ixZn+LFt2kVsTLRATLgbHqzzkJfbszyp4jmP2lanuhEJ019e1NjP5bxa4
	 cS+pfNfHhogbvKLEDlrdBjxvbBkn/Z47x3s9S98UXRoT9cq9JHPQL1V0VWn1vVN9d/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gJRjpT+Y8kTUcTvkPCm0oLmrvJH7/YI2O0Vn29/eE5E=;
	b=RD8N2Vf8M6D7OZubEWfrB822nL/81g90tM19GtqbdmTPI28f94R+lq2aypBfkwBHjsJv
	 Up8VTCgbkdZRb26+Rq1ZQHs3iW+5fuOr+oPdDtPXW66Fy6g+ZibmYIfsFy1yk3oj7xL3F
	 Ri07ZpDwd1/lzO0zGqIUj15fx+VvGB/ncxbQm41X0LaFVx4hTGCO12GF5isiMwSKQ+cLC
	 H2E8oWYSxcgHWqV41sA0UWJyUO5PVgH0cLxirGBvqr++3pM9X+EIOuOgvoNrmRqnJrPhT
	 3GOTHwKeB0powtajuPL6Yh40g51iV3C43aLlYOwpfujSsF4LwXqrvZ7y0YO3L1J0C4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHvJx3em;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7656F606A334
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7656F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHvJx3em
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2543057eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594987; x=1796199787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJRjpT+Y8kTUcTvkPCm0oLmrvJH7/YI2O0Vn29/eE5E=;
        b=CHvJx3emEUG8/6M78vogP7tXqFU0iD3zbi1narNhlm4XbVrHQMxuIxHNWe/2gv/GSw
         pEPkvC88mA2gxKDm/o4pgxHoGoAvF0KtRbGp4FeFoYAydKvI/6PhV1aUe8xn17de8Isl
         vbGjsYqOFARzRB1c48SyfOKkIP1rcEEvPoIrQGzZ0mLdH1/KImKxxCEubVES2Fe4hrBq
         6SNqkdlfiFn/WA4yq8DeEc1u97FWeGVzi8nfTFAC0EnZJ1OwojI5khie4g3QHGfIGrGt
         3aCbml/DeAg3is6AEsT30IdEJFwCTiStAZvTDoSNmqYm2wbZhxgI7EL5zoWeIb75pEW3
         2uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594988; x=1796199788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJRjpT+Y8kTUcTvkPCm0oLmrvJH7/YI2O0Vn29/eE5E=;
        b=ZCLls7sW89+wSJTOVPIVBrRCzujtvzST6esTFsjHZXYeVOLtOQf6187BIny1ZkIDAT
         pLaM0Z7wz+QeYt6uqYDCaksZBWMysdV326kUsaEVjICdyT8A1DRd2Ob1xhnCFIgHpJ7f
         j49FtBy2pJpZAKfHvtl6oylEqZOAC4hRtNY6CDqLANoR9x3qq5kmreJksgp7fTZb+EEJ
         kv+aejSjzTvUqcv9TfDWouvas+UuAQ0SwvXf+/d4IqwfpTJoNEf/K49VufS4pD6ZONoZ
         x6Oxt+XMprChMfs4L3b7P9iAHf4IwEQ+14likS4Z3f5ajytg1gYIm6r0VOrsP6NleirT
         qHDg==
X-Forwarded-Encrypted: i=1; AL+hErE6igQjWnbMhxx4opq6Ia+FTWupHoxkdzRv9ix6DHSkm6C5QT2RvUtwp28Zya2a2f4H12O80AIhmIH6@vger.kernel.org
X-Gm-Message-State: APuU4Z8SodBL/vEiEZD2WC0fRBNz6g2v25pCac+lxJSYjq8YiuDRS6SI
	fYC7xmqnB6CRcObQWga9CsBQ0CDPd9RY3cuU1qIEw5/ITG26PQiMYtWh
X-Gm-Gg: AZFdTZcEDDJdhJUtLTCuoStopwXM3/1Z07vd0zsaceiCs/8QPhEg3RBbnLz+Ex71Rvw
	fgeg6QQ4zT6ibAvRNfEAf0C5Q8Qkmt4MCF7xVubwpwJoYmJTRzgrWDqjF+KueHjyAJ8s1o4ArV5
	Uecdeb2CGTvzDn+NT4qGhNEhXQKka9fACUzS2YKVf1+6nGmR+K9PcoZYcRlF3tBTV0keLfuryaq
	SitKz3vDlHkBQ3HoS57/0FkEjJxdLS66GhdDqiiI09RJPZLtS4Wd9pRRC5WmjuhCxVdEN+fUvjt
	Cifer2ZEeFKKhIA6e0dJe+ai43r4uJV/bTjevRKQUWH4nUIGcdKr97GbTWaelRIZepb8qVILctf
	sDu0yINdf/bQBWxNmO7X3ZOn96RN4Reuv578E3ZTZxWY4ew5UYiSiS1f2pp5rytOiFGRS69klYR
	EtMFgvwnPZlxjKIgeHHqlHq5QpEBKSIP20Mc62joCV7Qw4bsLnZdo4iF9UE9GVfx9ST+pf7jQ2P
	QTaOSIQy8AKN3I6PlzM2Jd8Z5XcjzZ5pdiMhXr2UMWKFzxv6vI2WmZdcBCOtSPYJcYPe3qkT3pX
	PjDPimHKf562Yr1c4Y89WXGxb0HmsX1hWS5aXZxQtCL3IHEippZmMfn9W4SBv7ED1PZiC47k
X-Received: by 2002:a05:7301:6e9a:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3856f14b9edmr16776266eec.11.1795594987278;
        Wed, 25 Nov 2026 00:23:07 -0800 (PST)
Received: from adlinkccoe2-Dell-G15-5511.adlinktech.com ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm50919906eec.23.2026.11.25.00.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:23:06 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 support
Date: Wed, 25 Nov 2026 13:52:19 +0530
Message-Id: <20261125082222.136238-1-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree support for the ADLINK LEC-iMX95 SMARC module with the I-Pi SMARC Plus carrier board.

The series adds the ADLINK vendor prefix, introduces the LEC-iMX95 board compatible, and adds the module and carrier device trees.

The module-level components and pin configuration are described in a common module DTSI, while the carrier-specific interfaces are enabled in the carrier DTS.

PHY interrupt properties are not included in this revision. PHY interrupt operation currently depends on U-Boot initializing the NETC power domain and leaving the PHY interrupt GPIOs pulled high at handoff. Mainline U-Boot does not yet perform this initialization, so the PHYs remain in polling mode, matching the approach used by the upstream NXP i.MX95 EVK device tree.

Changes in v3:
 - Add the ADLINK vendor prefix and place the board compatible in the appropriate location.
 - Move module-level devices and pinctrl configuration into the common module DTSI.
 - Keep carrier-specific interface configuration in the carrier DTS.
 - Consolidate the USB3 DWC3 reference.
 - Correct USDHC pinctrl configurations and high-speed pad settings.
 - Add PHY reset GPIOs.
 - Add WDOG3 and RTC aliases.
 - Move carrier-specific chosen and USB configuration to the carrier DTS.
 - Correct the carrier GPIO expander interrupt configuration.
 - Retain PHY polling mode until the required NETC/PHY interrupt initialization is available in mainline U-Boot.

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 147 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 631 ++++++++++++++++++
 5 files changed, 787 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi


base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
-- 
2.25.1

