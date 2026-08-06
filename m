Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438933AA19B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 01:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979473; cv=none; b=PVZfWyVcOTxVGJVTg12YRzwyG57Ci17dhfzxJJBojl6jNdElepQ4ofElxKgPO2DDYUEyKruiab6KmljdJYmg3uSA4WddQW6QnAvgLY0UDwQ5ooH1Kc0Y6ru7q311k/+Kicm/dB3XlhsiCyvh3L7RKXeEQCxh1whODCxlgeqf5JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979473; c=relaxed/simple;
	bh=qQFBJzFLMWyKwoFpmu6UQo1ju/fdD1C3Jwgv1sGJZkg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cAy4erEaVmn7MJ0LZ/0ljv+yyoMoqgqUY6Hthql6gcDQ5UprZPAjowssMYsWT85YSgVYfMNcXR7YdrNYjAVEaI7pdb1IOnTPRQ4JSd1nMwHWrn/yNHaCi0g1at411dkHgqxLWgggCMJJlbbldvdy3GpwOgBZ/PiZua386PKFSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGERV3oG; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGERV3oG"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4ab70b882c5so1141894b6e.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 18:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979469; x=1786584269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hgNyPDmiWf2JyFcdGsGo7TCFxm1Nw/oDsN4ntI4YuJU=;
        b=aGERV3oG7OB2HfVnKeynI/yanCQQMKZ6uMgEy4JmEEg5wLXhU3zky0Amjbp0s5tURz
         cB7fu8DUNxak01HuSpN9ip007fYmoICSRMST3IeMibwZDRWN+PQjk+1O8FDUmuUsGM3x
         kLf0c460mN5Jk1HgWd9D88cRHtWwkriXOpQ+GxhJDsN7+7yBUN9UKupj7RBuVpm58byR
         Z7BAIFq1fdCZmHMtfUXzAsICdJohk2aihazuf2tsVYpMa2w6rv5qivra4oPBSPKe5T1C
         T14gw/dFqQcd1KfmlyjVwfKMyAryJ2adNQUFuCI0VmFDOGm2+kWM1qikDrPauvmGt2Wh
         u8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979469; x=1786584269;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hgNyPDmiWf2JyFcdGsGo7TCFxm1Nw/oDsN4ntI4YuJU=;
        b=q1iWT/JNKq7U6/pZrDbTVk9G0QlEfZXvUjTYbEGP69b7QXTEZN/1hPXu6/tdt3ent+
         +dDW5tZtW7aw44dAPAAjJOyiQAWx8E9Udleir77jn8tW8vEXgB2TE5o72zosggYHWUd5
         2pse+Qez8jAXK1l8RVrRrq8PAnZaJl7w0AViEbMMQHkFJYDteTO+n0phxF96Rtg47RvK
         qe9olw52t9HiOGYl+wJRwBYLEcJb8DbM2Caqq9D8YkFJjH4z92XU9vHNOGI2QVJ6D95S
         4Y29owgbZbzsSJxxd3+odOCBJ5kOLQ8F+cPIQQxNw2K6n2nbN1Og4aFT5orRguSz/XOv
         HMbw==
X-Forwarded-Encrypted: i=1; AHgh+RoirbYNBx1+DzktKMR+qWQCyYwJQX5hrRJT7eFhySZs3P4yoePuH1AVTkOS9nDSazm2xSv/lF7GnntB@vger.kernel.org
X-Gm-Message-State: AOJu0YwNwjVcM8w2SMmbP7XwFuU6tV/7kaZC1aKSMTcCJIaqEIUTWUHN
	pTJtP4Z9MkBl5W3q5BQH4uTs4Z64ZM5sQ7RYMkjaz52j8/rV2DmqLPTr
X-Gm-Gg: AR+sD13YuUMdnR9Ecus0a2P/e/V76Qx0+y73WhAkxSoN/re9B4E+IhJbjkCSQ5E3Xl/
	asnb3a0VoArDwrUWECp6zQFw1amuaT3yPsHFdmmQ7/VjGZys324pxrj9P8oG/gNyqgjy19wc6CR
	is+FWDo0623VtdgqmI/dOyF8xk+XoDXEWPlHJQvtSzxdniw3yA5ZBnEPHN/diPemD+EcVP4ackI
	I8U1t31vs6N47IlNVH2sgVFrn3jppa3lbtQOb1psWhtvypMyuY0dlNE8xxKjhruRfBEEIGh5JyR
	S9gBJBYVDiKJasgMkHLnZeRtAdnUcHkZPr9yZpvWXn8ufAW8eE2d1betd2zYFGk75IwhduYg9kl
	wSimL+A4PPTM7RiqS3InOiQcphVNSW0TXDbiBV0ZThMdn4lSJUjkIhH5YJN2Ml/iBP9srk4Bn3K
	nAez/qeRFmwtl98wHzeD1dnwJLcXpQm3qAaTPTuVH3oSOTkFjO3sQhCMUe4E40kPW5RVOGkziYD
	jkYP/Bb5QBBpg5BwSmEeLnBU6BYlpgZ3VXk5ysRiwzI/JgDo5Hm7kMWhKlEWBU1HqrKNt9D9nFt
	SVrTICJeXVhnNRacucz5IpsBtSW9HDm7gyZVvWHbt0fm/4OR7twxLBj3Laezogn9imBPMNPn0J0
	7FpMsTwUbc3Dao5vo
X-Received: by 2002:a05:6808:c14a:b0:486:4892:d553 with SMTP id 5614622812f47-4afadc03178mr6289641b6e.0.1785979469032;
        Wed, 05 Aug 2026 18:24:29 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae75db20sm3274755b6e.14.2026.08.05.18.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 18:24:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v3 0/4] net: phy: add X-Powers AC200/AC300 EPHY
 support
Date: Wed, 05 Aug 2026 19:24:17 -0600
Message-Id: <20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QrCMAxA4VcZuTaQxR+mryJe1DTVCOukraMy9
 u5WvTwc+BbImkwznLoFks6WbYottpsO5O7iTdF8a2DiAw3EmF/X0Qo6qUQ4BfTv6EYTnHs87hx
 56feBB4YGPJMGqz/8DFELRq0FLv/TnIdK+dqwrh8UZN2iiAAAAA==
X-Change-ID: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2

The AC200 and AC300 contain compatible Fast Ethernet link PHYs which
report the same Clause 22 identifier and use the same link-side register
layout. The link endpoint is inaccessible until package-specific control
registers have powered and configured it.

Version 2 represented those control ranges as separate devices. Following
review, this revision instead models each variant as a standard Ethernet
PHY package with one forced-ID link-PHY child. The package reg value is the
link address. AC300's control range is a fixed package-relative offset of
16 and is accessed with the PHY package helpers; it has no separate DT node
or MDIO driver. AC200 references its I2C MFD because the corresponding
control registers reside in that multi-function device.

Fixed hardware uses an AC200- or AC300-specific package compatible. Systems
which can contain either package use the ACx00 package compatible and one
packed SID configuration field. Bits 3 through 0 carry the analog
calibration, bit 8 selects AC300, and bit 9 selects its low-calibration
tuning. The driver chooses the backend before acquiring any backend-specific
resource, so an AC300 system does not instantiate or access the AC200 I2C
device.

One xpowers-acx00 PHY module binds the link child, joins the parent package
and runs the selected AC200 or AC300 backend. Only the link PHY registers a
driver. The backend source files are linked into the same module and merely
keep the I2C and MDIO implementations separate. Thus the PHY driver owns the
complete Ethernet PHY while the AC200 MFD continues to own the shared
mixed-signal chip and its regmap.

The series contains no generic MDIO reconfiguration. It has no hard
CONFIG_OF_DYNAMIC dependency: fixed descriptions work when their provider
path is already enabled. When CONFIG_OF_DYNAMIC is available, the AC200
backend can activate an explicitly marked fail-needs-probe I2C/MFD path
after the packed field selects AC200. The AC300 path leaves that candidate
disabled.

The common link implementation performs the vendor analog initialization,
supports MII and RMII, preserves automatic MDI/MDI-X, and restores package
state across suspend and resume. It preserves standard MAC-managed EEE
advertisement while disabling only the vendor PHY-autonomous Intelligent
EEE mode.

The four patches add the minimal AC200 MFD binding and regmap provider,
then the AC200/AC300 PHY-package binding and combined PHY driver. Board
Device Trees and optional PHY features remain outside this initial series.

The AC200 portions build on earlier work by Jernej Skrabec and Andre
Przywara:

  https://github.com/jernejsk/linux-1/commits/ac200-v4

Public AC200 and AC300 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation completed for this revision:

  - arm64 defconfig vmlinux and module builds with W=1;
  - x86_64 allmodconfig object builds with W=1;
  - a built-in AC300-only configuration with I2C disabled;
  - dt_binding_check for both new schemas; and
  - strict checkpatch checks for all new source files.

Hardware-tested on an H616 board containing AC300. The generic package
driver read the packed SID field as 0x106, selected AC300 without enabling
the AC200 I2C path, accessed the control range at package base plus 16,
bound the link PHY at address 0, applied RMII mode and negotiated a 100 Mbps
full-duplex link. Bidirectional network traffic and cold-boot testing
passed. The AC200 backend is build-tested but was not runtime-tested in
this revision.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - model AC200 and AC300 as standard Ethernet PHY packages
  - remove the standalone AC200 and AC300 control bindings and drivers
  - put the common link implementation and both private backends in one
    xpowers-acx00 module
  - access the AC300 control range at package base plus 16 with PHY package
    helpers
  - access AC200 package registers through its referenced MFD regmap and a
    managed device link
  - add an ACx00 package compatible which selects the backend from one
    packed SID configuration field
  - combine calibration, package selection and AC300 tuning into that field
  - optionally activate only a selected fail-needs-probe AC200 path when
    CONFIG_OF_DYNAMIC is available
  - preserve standard MAC-managed EEE advertisement and disable only the
    PHY-autonomous Intelligent EEE mode
  - reduce the series from eight patches to four
  - Link to v2:
    https://patch.msgid.link/20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com

---
James Hilliard (4):
      dt-bindings: mfd: x-powers: add AC200
      mfd: add X-Powers AC200 support
      dt-bindings: net: x-powers: add AC200/AC300 EPHY packages
      net: phy: add X-Powers AC200/AC300 EPHY driver

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  69 +++
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 208 ++++++++
 drivers/mfd/Kconfig                                |  11 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 184 +++++++
 drivers/net/phy/Kconfig                            |  11 +
 drivers/net/phy/Makefile                           |   3 +
 drivers/net/phy/xpowers-acx00-ac200.c              | 374 ++++++++++++++
 drivers/net/phy/xpowers-acx00-ac300.c              | 415 ++++++++++++++++
 drivers/net/phy/xpowers-acx00-main.c               | 536 +++++++++++++++++++++
 drivers/net/phy/xpowers-acx00.h                    |  28 ++
 11 files changed, 1840 insertions(+)
---
base-commit: a23b36233d4103def55dc8cf65698106d0bd1e62
change-id: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

