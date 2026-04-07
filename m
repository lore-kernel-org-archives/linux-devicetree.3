Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E6138C2D0
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549876; cv=none; b=V0C16VnZEKw6xYZ/6RsWO06BR1Hl7WrBqQAEFIV03RSSPdEh5mSsZ11tYFombqqOH8pUhvYsU5uQN7hdrLOd4ZPcniEff5j/+GV71Hirxkmx8+9SB1Lpv/LgOnyqX1NscvaLLXlsXV1LPyzBdQyYLDYUhvQrec6u5GOHNE7ZFO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549876; c=relaxed/simple;
	bh=zSet0VkXWgXP1bzyNSYd0i0Mgmh2vhWQ85m5c1aKvyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WxaiDptsk9Bq8EhoatUX65jkRklST2vJ6p0iGq1hQF/GZQ28RZPbw2IYHRG5E/t4T/2lt921CpqQZi2+2TExafzB4PQWf00xGRgDr+xOdOg6Ak+sOTY6PsghsHwEncPIsAixIwE1ERg6lmGwnn6+9vFtoWodhEaWrAl0Cyebhd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSDssRZX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSDssRZX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35c124d2613so2730739a91.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775549874; x=1776154674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpY4U27Y71SwDzYx6NrKHrnXl79ZOYWYmPRAEotSW3Y=;
        b=KSDssRZXyVaZoyEa9pVqAMbxR4EX/CRwYT7WXgkhqbw+94LukUMxW0bJb3A681FTZu
         5JWNL/a3zBSKl1rLXwn9fzv2TwFNybF6Dmj3nA6frB7FLl/QaT5EDa4NTo0odINWQYCb
         7a9bsF3Gle2MWthcPHBhz44jv6puPbJQ8RgsFf5CmSdUO0uQ+870sRbimLGCnD6Ti1cE
         WP27EMtdk2yTwU3vX6UjhGpoHxkshn2xCyEgQoV5aIlVBibgsiF79CSYWoypFrdYZw/S
         ww/Kem6MAvUgoULioLjvI33FJ0TLN5+0MtmCBqZ1/aw6mgxA/9z1y6IUkpOgARcr1/Lh
         k8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549874; x=1776154674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpY4U27Y71SwDzYx6NrKHrnXl79ZOYWYmPRAEotSW3Y=;
        b=EtxPj5UkhXqx4pszJUTyrsOh5zU8+pRbuErHAgpZYtPomPrZ3/cogslo4cQkWy/b/A
         D2KoliKlQxYShhX3gmzJdyxXXS/BXoYdZhOXEgcFI13nY/1rnha4Rp301o6Aup+4WqxW
         R+ZdYwNDci/N8xF5aSwrz7MN8ODIJDM+kyUK4Wn6dx92llEOUDfn9ZWC3e7bEDquW33t
         v9CJj7j37lqatMT/u6M60MUuCcpNXM63yTAyqFKOBnQYPN6wtCcYMnlRdbc54puJPnG8
         yq9MyNjqPvoXgrz8LRrzt49/hVcdt8OuR7CbMguSeCWEcPl1S6gruWv0BUcYJv7cFlvB
         cuig==
X-Forwarded-Encrypted: i=1; AJvYcCUQfLLfh+jm+WewAFAUCgi/V4+0afQPdBCdY+U47BH43by2fRLiBTOrWmT5pIxfh5hSFe9pGz6hFFKn@vger.kernel.org
X-Gm-Message-State: AOJu0YwioL1/3c2qotSYFvn5e3xSGJD6E2QxpSHvcqF3Pgk8r9/x20xj
	QwzeP9LetB4/e3BNSSTta3SAP+w44Fwrhnje2VTxJJ/UsutwFaPneBd6
X-Gm-Gg: AeBDievXXCbc45sy0gwYwNSiu4XEU85Ps+vT9WgeBBJCIqjuptKsrZdvFEjccmFWHA1
	qNkdXaBKaX4juG6KurY5IumCQiE1T7ZpT9skQ7ar9xlW6kUJp/mTUsz1Pt8cuGzvIrTkNVDp2kg
	yFaEzO48iO0rDflr75mD12FaTwmTXWYmiqt6qtVP3FVLI2GUBk85xKM5UnY5ooCtWOHKccVacRX
	a7tlH4i/p0dtVtgUABLcMXLZFHeMMUwYZGCJ1a623DzO+pN1SK3BIMnYQbL9cbo4a/163xiZ51K
	DDnrwZcZE+5V1JpuT9kuQVAMgB+UJ4zPxccvU6XGGkAoPH7aL32RN9Es1oJDhEcflIrjg71TS1p
	BRl1+bUrPpljXzeMpn32M4DJGV5VQkSSllrp1tTWa9Wd8eXaYacmPvo5uaP6aONCuNTjfDPfRVG
	x/cAPuWJz+5wd8kVHo37v2n0leMY80xMGLh1hZBQKpXzSaHbG8biZZr7TLISU+NSoZPHOtjChYB
	Whl7qDMFB2I
X-Received: by 2002:a17:90b:2b4b:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35de69aec1bmr15940483a91.28.1775549874412;
        Tue, 07 Apr 2026 01:17:54 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6a2325bsm4592889a91.12.2026.04.07.01.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:17:54 -0700 (PDT)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v13 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
Date: Tue,  7 Apr 2026 16:16:58 +0800
Message-ID: <20260407081700.2658011-1-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Linux device tree entry related to Meta (Facebook) Ventura specific
devices connected to the BMC (AST2600) SoC. The purpose of Ventura is to
detect liquid leakage from all compute trays, switch trays and rack
sensors within the rack, log the events, and take necessary actions
accordingly.

---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
    1. Modify email content.
---
v3:
    1. Add mail list.
---
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically.
---
v5:
    1. Run scripts/checkpatch.pl and fix reported warnings.
    2. Remove unnecessary 88E6393X CONFIG FRU.
---
v6:
    1. Add a new stage for the DTS change.
    2. Run scripts/checkpatch.pl and fix reported error.
    3. Fix the issue in a separate patch.
---
v7:
    1. Fix broken indentation in the device tree file.
    2. Sort nodes alphabetically, then by address if equal.
    3. Rename fan sensor nodes from 'hwmon' to 'fan-controller'.
---
v8:
    1. This patch series has significant changes compared to
       previous versions, and quite some time has passed since the last
       submission.Therefore, previously received Acked-by/Reviewed-by/Tested-by
       tags are not included in this version.
       If needed, tags can be added again after review of thisnew version.
---
v9:
    1. Reordered the node sequence under i2c5.
    2. Added a description of the platform's intended use to the commit
       messages.
    3. Added 3 GPIO expanders to i2c10 and defined the necessary GPIO
       line names.
---
v10:
    1. Added IRQ support in GPIO expanders under i2c10 to handle edge-triggered
       events.
    2. Reordered the nodes.
---
v11:
    1. Modified the position for i2c3mux0ch6 and i2c3mux0ch7.
---
v12:
    1. Added a GPIO expander at address 0x11 on i2c10, and assign an SGPIO pin
       as the IRQ for it.
    2. Fixed the "failed to match any schema with compatible" issues.
    3. Reorder the nodes in alphabetically.
---
v13:
    1. Add two GPIO expanders (0x16 and 0x17) to i2c10 and assign two SGPIO
       pins as IRQs.
    2. Move the RPU_READY_SPARE_PLD_R and RPU_2_READY_PLD_R pins from
       SGPIO to the GPIO expander (0x10).
    3. Add all tray PWREN pins to the GPIO expanders (0x16, 0x17 and 0x1b).
    4. Add explanatory comments for "unmanaged mode" under &mac3 and
       "intentionally left empty" under &mdio.

P.K. Lee (2):
  dt-bindings: arm: aspeed: add Meta Ventura board
  arm: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1636 +++++++++++++++++
 3 files changed, 1638 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

base-commit: e11fa6b1ff6c27c808d17e479bd7d5582e772062
branch: dev-6.6
-- 
2.43.0

