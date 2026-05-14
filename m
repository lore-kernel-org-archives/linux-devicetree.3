Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6D53F4100
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778728595; cv=none; b=LQcNxpk/H6h2OUtD6A6+2YDMv8XJ88XTZJaQ1uwxwrJTClpbdvIbMquFOkExQ3x6R5BcCWVuYaRRtRmcLV8y1yBsLnca7PC+276sPkRIrFncb6vywN/X96BFcg3tNyNZb7NHLSCciOu7d4JmpCFzrb5liA/QMGDP/9+lg4PhBFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778728595; c=relaxed/simple;
	bh=t36X9wQJmfIZ/tDNHMQ/7hAh2lzu0tY9hhhvvqaBQRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMAimb7yBXKmotZLAhLl27klL7QZltAv0Bz3X32shReMDyQPv2e8ODU7fNueoDZ4bgPGM1NgKfr0HkvgqsnrGRk0r89pq+ktdOIK748ofV5GcXZ5LtdHn18iDFXhUwnQrz9Sm68f6ynNv73rQG+j2o2MdBcljfxqy3JHTuHpz3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4B2tPQU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4B2tPQU"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-365e20fe3b8so4428531a91.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778728593; x=1779333393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac2bCkNoG8C1zHidrf71kjJ2gMAt5aTUT2C3bhGfMTI=;
        b=c4B2tPQU357BY6bZ3XVyed1izFcRZXZg+0BKO/v83yF93ZJ/uRwKZOeYada8x+6jZo
         QUs/0xEjiIHkeoFZhfwK6TMnb2UvGUsrevUzAk46NO9uEiVF8Fv9RVLpOGcZLZidt0+o
         iR9kVXqnv5efUo3O4QRc7eEHZB09KQL92FtqrDTC8u6eSZ3unJiw2hPa0U4k5aIcK+vH
         ljj0nR7stv4hwLToqdye51wZadZSuYx4Qimd4QnwwSA2ZEbh1W7oqroe8W5ir5M7MN++
         RAAhAcUA9W8Ei1xCtX8nhI7g1U9x4/bdFyjTO1YjUWyGjX2K6AX0qEwB0EIoySzssOzw
         QgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778728593; x=1779333393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac2bCkNoG8C1zHidrf71kjJ2gMAt5aTUT2C3bhGfMTI=;
        b=pDctrkdfBOGbSgO881o/bGiT7KMusQ6fwoH0YoLZB8tKQIJbkiGRFg86uey5+sNrhR
         wPbaagrtZroKt8z3Mwxu61Es7lgrhmBBWDhx+XF6RLzWkPiqCWusv79TjkyVQzGL0OeH
         B2ylDvrsuczPLk7iaifOSKR7MYqmeAkZJeiaXrXeh5CABGr+mhlCQka6ITw8x1Z0fcPq
         5FiFX5Jmkte3oT/qmOPa811DG2xx7EWzarJfrWy0a2rCD1PMk/hP/FfTKsPLrHIMdtCu
         lwN2jpLLgkz2b8MbiGd4iA4VgtD3XPX2c6nTOsdhz/ZV3AbulZj4h4Ignf0FfUNyalXZ
         k9IA==
X-Forwarded-Encrypted: i=1; AFNElJ9BABNozDpC8H0lFCt/pGb/eH4EaQtH8f0b+Xwugr9J8MOyQcf9FbUYLGAPou/qJCvDmRvZI3L749hq@vger.kernel.org
X-Gm-Message-State: AOJu0YyjzApi9psso4KTFEWTdOGwCyVKSreUZ6O5djfMDTlD2Za8kLHf
	w+j8T4qbaMdQkBYw8ExgpX52PJJQCd8LTqcOKSvYPmrNm8rsNQRo2Q0b
X-Gm-Gg: Acq92OHxoK4VnYRS/I9hY1FSeetkYWQYBByDrKMoI+IME5NnPW7oTUfBioud5oCHVDD
	q7iIX3srcq4ghGKL543GZ1ES6wus8iVZfDrxzH+icLZZJUBJsPaNuymjFVrX2dapshkMkGoB9XG
	uYbw2mArrNIqBMXfmLXTHhdol4CrrF68sTMoHwzHwAp4Mu5mzXh3lHGzaLCAdRgwT6Vp2jfzPX+
	XZDOzXsmLPP75L8HZc8puYaJM4yJQefLXAHCT6T8MOwEqGogUhJL454cVunjcOW5fcE6WRZfPo+
	r/DcNDLdUf3/sEULSLxDy+TyTwNOGoAGjPgubQ4AZbxTSTCefwKYTAnyAIU6mR+lI08HDob94fH
	7SR8qup1prZ+f+l0+7q8tn0qre3aDurAACKkEmav4SSExl7w4VVO8CV7/Vg/Ev0MHKVW/RElFAz
	2vZhl+W2zU741JoVNz/UnmCjfitHQNLdqvc3wdIpH0
X-Received: by 2002:a17:90b:4ecd:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-368f3ad4d10mr7021996a91.2.1778728593250;
        Wed, 13 May 2026 20:16:33 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692a94205asm320047a91.7.2026.05.13.20.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:16:32 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U support
Date: Thu, 14 May 2026 08:46:20 +0530
Message-ID: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial device tree support for the ASRock Rack
B650D4U BMC, which is based on the ASPEED AST2600 SoC.

The B650D4U is a server motherboard for AMD Ryzen processors. The initial
DTS describes the BMC console, FMC flash, dedicated management Ethernet,
FRU EEPROM, and watchdog.

The dedicated management port is described as MAC0 connected to an external
Clause 22 PHY on MDIO0 at address 0. The MAC uses RGMII with RX internal
delay, matching the vendor DTB description.

Tested:
- Built aspeed-bmc-asrock-b650d4u.dtb
- Ran dtbs_check for the board/aspeed binding
- QEMU boot smoke-tested with ast2600-evb

Changes in v2:
- Added MDIO0 PHY node for the dedicated management port.
- Set mac0 phy-mode to rgmii-rxid and added phy-handle.
- Removed unused GPIO include from the DTS.


Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 71 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3
