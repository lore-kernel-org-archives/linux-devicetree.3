Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D8039DBD7
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419306; cv=none; b=FuPXbcer4Mi7XqCv91KzfTp2ClbOBxOebeJtvPvCm7KEMpTwVSb7Z/arHAldqAGOKrBCsKp3DFb8FOA1cgxR8eCkooo5h59uTqsWvBIoA3bS0zwQeCEXVV4Ss851np4QyWRlKuaaP1HhYwjo+akrFf9PNk5eXPdheLacvwBvvkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419306; c=relaxed/simple;
	bh=nw/HhI1mJyZTd0IgP5FCBwNyg8lk2tTXYVNSdjiwp4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ipbqIzwtK2N2+r0IgGMdan9NkJKekqWYKKiUefAY4Y3OcnfKoAYLYtpaVD1xcUe92pkE8LjcoKv+iZnb69XH0rxDPYCt6vNVXY1IqDACO/gXzvS6KeZGl7Brg8tBdlMp5bO6UOWvuFrtzXSU0NlL3b8FKFAYwZl0icexAEuk/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sHKfF06U; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHKfF06U"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso570984a12.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785419304; x=1786024104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2H2DIuEhnzrfQ1C6Brzjicc8cP53KTk+BzeLhmkkFD4=;
        b=sHKfF06UUKMJwjWW0DnVfAGQJalM9e1hM4eVJ+9EVfWJ3bFX0iPgDtIXS8O3v4H/bO
         7mNrimuqA0iRkUJWCecdpHKfoxQseKfT/dTnDCRWq0kpLt5Zi/qwPWiEFYUmPmjh3S7G
         Y2e3+0JY3ORo1n54KL5dqA0M/Yqp22sbggAgSRzGzPEZnmysu8GI9r1mraviQ4zB8Vn/
         jG0EDYNfuJz1KBntgv/EruxNnnbkhlG86y+SbRE22cAxqdTasbvtaH9OCiOMTV+Xyk/O
         XdflW5Zp5nLm3imAI0kzwP0YhqsB/HsRTEEAZxwfOCw6x24/jTytdhKwRcZ2kPZKPUnG
         U42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419304; x=1786024104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2H2DIuEhnzrfQ1C6Brzjicc8cP53KTk+BzeLhmkkFD4=;
        b=a/W6cPjnEoxfyf4KnM0AIv8tIxi5ElXhjcEeFTZ9iglVHSvDVHrtycdMKEdPcD21C0
         87yxxdkiQdnSJR5fs1BUa/gpXOAdk/Ix+0OMc8CB7iBro4oFrcCGAWSyswGZJWZH0J11
         GjddF7A7Pgeju7IxcKC19IKI16hIqAMlO+8nr8vLLVtfOY1W0NrIPHUCBZlPMSRT8JSO
         +QNXeawfnwCNRf6yBZMkH39SO6YXglgsuVoanXZiOtk8IOiwO5DNwjkFyaqRvDCdtMGz
         QCEGNZHqd1ZBI7jxKS/xL2clbnBS30tTCSf2A7HuWcb5ew5BI7CW6VPqVRM8v2Cn4vfC
         G7ZA==
X-Forwarded-Encrypted: i=1; AHgh+RokwnuL7WAsDS/Pe5n5Dr5bk6ESTBUbCDJP0yzX4YWOYAUBepvvbzO5yRrZ3p+k6ZfnCQwHTc4jYlfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzrmmIWPNbCTaKUJ1o2xf16kHwKVVqiTZlj2eI+UCNmWolxbgBH
	2gquNdgezP59VY+d0dkRp0jCpkC5eqGSryevNSV3pTkJbmkRI5z2SQTC
X-Gm-Gg: AR+sD11Ucp9uClir/xsxPM2Cn0xQyj5pLHYFSw6/kfrkOa9BiEWkeFxvqa+vEm0zVS8
	CHg/Qa99+p+TSkZ7uoyL6rFakSgPPQCqJQi2ZCtfq76MFfBgQhRl5Px9GP0ST4+XCgLKvGRtQ8S
	GSCstQmJzEeO7DTOFn0RYcl6sgtc8jmBFQdE0wQmtQbOuFYT89MFFd+WaYoYvVlj7QvPK5JA0Q+
	l/2Yqv/blaX4H94waf+OqOgKZFaPh4wH+1B+ElWLoS1hRHZK3s5G9lsCLh2sCUJqXDUV4j3nkl6
	oQBin1+7pYY0KtsJvoz6UKkAOrGMEBt4Hql5tKCMIN1HJaL2DUkLO69WuxKHhEc8UYO46RGNDAE
	giGXAnRxGunIgun3kZozHKaHuT+bpY1RZzqW9Jl0gCswSnGhjrMmKbHw8ehsATQpoGprDOm0zL3
	g7QA0jkJU0yAubwRUr/GDAeJTk7CINgmGQiJUk496JbWTuaVyWTJVelJ8ljmqAmbKTonfWuYgKk
	gOZFQA=
X-Received: by 2002:a05:6a20:244b:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3c90d768ae9mr393785637.5.1785419304267;
        Thu, 30 Jul 2026 06:48:24 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b670dcsm20692047eec.7.2026.07.30.06.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:48:23 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/2] Add support for Vicharak Axon Lite board
Date: Thu, 30 Jul 2026 19:18:13 +0530
Message-ID: <20260730134815.434654-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Vicharak Axon Lite, an RK3576-based
single-board computer.

Patch 1 documents the "vicharak,axon-lite" compatible string in the
Rockchip arm bindings.

Patch 2 adds the board devicetree, enabling the RK806 PMIC with
CPU-big, CPU-little, GPU, NPU and logic regulators, Mali GPU, Gigabit
Ethernet (RTL8211F), eMMC, microSD, UFS storage, PCIe0 and PCIe1,
HYM8563 RTC, GPIO LEDs, and UART0 serial console.

The vendor prefix 'vicharak' was previously accepted via:
https://lkml.org/lkml/2026/6/24/929

Tested by booting to a userspace shell over the serial console and
verifying eMMC, microSD, UFS storage, PCIe, and Ethernet link-up.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Axon Lite board
  arm64: dts: rockchip: Add Vicharak Axon Lite board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3576-vicharak-axon-lite.dts    | 700 ++++++++++++++++++
 3 files changed, 706 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-vicharak-axon-lite.dts

-- 
2.47.3

