Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4F13D886
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008024; cv=none; b=XHm/sLnYpwZ3iLBqS81LkbrnNuAGoZdJ+3GFp1Oz8H+0ieEpYQPXz7rdqk4V/V7cB4kRKLFY8eYynBtvea9rZV3q5MBxmpS514ojPQ6/+deGA/zP5uaUBQO9+5I8EYaFfwUJh1JSFZWpgTfZ/xqqxj4VZtk/pfjiAr4B4HhGDHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008024; c=relaxed/simple;
	bh=c2X98V4fASjwVedjA58Z386P31W+8gbtnDwBFhcqNZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeXS1X3n3D1RAJ7u8m2zUP+I/fw3XlVG6N5vmFJaqMepUlB6IHFK4HK31FyyZec6S8D83NUiHmUt8HkIdiyiaWMA14qf3bUHvW6ZRewaaiVvxMw7BbZu6U3Oi7sCStq9hhoheb5K3q2RzvRKlt0UeZ/FbZUJZD0SQmVKCIY0dCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVudUCZw; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVudUCZw"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso2189577b3a.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784008023; x=1784612823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCH472Fm/tovXRRz59mCJ5fU+hD6fMIN1TYNRbso0Bk=;
        b=TVudUCZwQeQwP/ubEe1aTby/NbgUixAtVLoI2vo1qknz8KDdHXsRVpq/AT/PDdIcF3
         l+VWU2Csh6gxo3sbAS03VF+GoGuwpTkMWCbkRQh891Q6ll+NZRmshQjFWfxmt8sjNYNa
         0sol06vqG68PO6g1T1IE3y+q1sA8F8eH3FTEb4X9qEW2OwwQH8oUgYT/0ao6yAeEV7Xd
         3r+GyNnDDwpjL/AEhJPLLd232lLtap4CpqCq+9z3OWGUWG/yyuZObrlKjcWKP0F9vGv1
         fcxYVQBzyWaCgG4s6THvaTVu/QbZeSKwpxtZVEIiJMG0IQMppWCVtDBmiZh3WcmMFjzd
         o1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008023; x=1784612823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCH472Fm/tovXRRz59mCJ5fU+hD6fMIN1TYNRbso0Bk=;
        b=rqMQ0omodTJdnqKOFIunCpJd/SIOrUxluYN060u1m1YxwrtN/QAafWSl/4FhhYBg6b
         EGm8uo5Tsv7oXbszgqI+YnziEpm04ptT7EfpWPIB9myYoT4FB2i4dUK8P2rP52ZLpEjZ
         S/NwijFajwlLLefkaaKnNc4/OJ09qSFb7WW28qt6wb3K7EVg0mjRPt28LEevBL27LYcx
         s+i88+CnT79rbEF3137EIcRVabKRWa20ahxMHyzyx7oEokBC+Y1hTXUrIeEgeOKANDEx
         JNZRproAm7tLJvHIpwcHa6RFcDuMiWmO4F6nWvN397GLLepchUPVKKVwvAcrSU97sA/F
         TEBA==
X-Forwarded-Encrypted: i=1; AHgh+Rrv0oaCGfLb04GsGUlkz3K639j9CIUk/1KhfDMHJs2O+cM3/CkkMKknOO1D6FMxePVn+svW+NMDWDGr@vger.kernel.org
X-Gm-Message-State: AOJu0YwSsHEj+iE1myNqeoOMU2NjexkvROulCEY3BMV1vsVE2GwlWnsN
	hSe+58qEsdq4Ns2ACZTzOQ/N4Vwu6kZYdJjB6xZheO2Skoh8aJbXZQPiRefunIQB
X-Gm-Gg: AfdE7cn4sFN1WqzV6yiL7MQfRSUvm5OHBpdAb8/8bDQlMjaPpmwo0/RkX+D/D8GMZyn
	rsuWEa6dGB/dDPci4yux9hvuF3Q88OOYPgw67kflAj4k69qe9LOVdDEGrf3EWfHMO/JSS12IaHg
	bG7q65t7CT4s14dYxEF5ptDOtx4TjAeBWJyYc9nUQahzOwVkx+xlfDHvWcr/3zQB1XZPStq8i1m
	5CsX6l+BFC6MuoYgkSarDRoJmB0SwzMjDLOmA1jNXqA97ZNCNyik+kQQ8oyZUMHCqjIaEdXvkZe
	LP7ALzygZKoWNAtd/nZvpAEzlQXIxojbqC25fJDJE58mRkSrXJR5pvZn/o799MHf7oO/bSZB1D8
	FU9dh1P86mHIkUyuf32rMrNKDt1IZuT6P3AxU820Lu94NSb6wSvz9RmmYfHHa60c9y+eASncfs9
	SYJFX0ARIdoLkU++zpOrY=
X-Received: by 2002:a05:6a21:730e:b0:3bc:5235:f386 with SMTP id adf61e73a8af0-3c35741635amr1111837637.32.1784008022663;
        Mon, 13 Jul 2026 22:47:02 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483dec6sm77965054eec.11.2026.07.13.22.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:47:01 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v4 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Tue, 14 Jul 2026 11:16:51 +0530
Message-ID: <20260714054653.266842-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds device tree support for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

The Vaaman2 board features include:
  - RK3588 SoC
  - eMMC storage and microSD support
  - RK806 PMIC and multiple RK8602/RK8603 regulators
  - Real-time clock and status LED
  - UART serial console and SARADC

Note: This series is generated on top of the Vicharak Axon v8 series.

Changes since v3:
- Removed accidentally included unrelated netdevsim patch that was
  sent with the v3 series by mistake. No other changes.

Changes since v2:
- Moved 'compatible' before 'reg' in the PMIC node to follow DT
  coding style convention.
- Verified with dtbs_check: no warnings.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman2
  arm64: dts: rockchip: Add Vicharak Vaaman2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts

-- 
2.47.3

