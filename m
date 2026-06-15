Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B443F888F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533285; cv=none; b=NFHPeJQb0kLQ1acQDs6gRRLQ3D9zsSuR2p4dX0QVIT5tv7nZZGtbH5/KvM5S6BQVTYhlG6bmc2pFZfR0991vm602423oYuA6CLPwb/d72cHoYjDvHaqW8RTb6xIffZQnhmXRHabYPAQtKo+F5Dyd1SAwJeXpUVaOvTIg4VzfeRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533285; c=relaxed/simple;
	bh=xO8+tOhAoVY2wZD8CRVO4hfZHgP/NvW+7wG+cGq6C5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VBvkoifaq8vGn6/O2u7dwzFFhJx6QCgl0cErzEtkGQ99wfhbwGWKKb4BqoH1sZ06yu48tPxyt9bRC5AlAgShlko28t20RoCfngJSLGMhdwREMl3WLzSNPv/NSUGA9rV16UdYUVuepbnggP1hoBdUkYqeiP3m6ZNLNWuem8ij3us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhUli/Ov; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhUli/Ov"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1638101a91.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533278; x=1782138078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r0qS85tDOTQ0lyeN0lEC4TvTGSwDGHgz/zgpxV4/S1k=;
        b=mhUli/Ov9gJGeO9+nZM8PPTrWubJiLFEVBsRJHqJB7J5K+bRoOSLxenG3aM41SK85m
         6PxqJTSJ8byNVhaHTuA3P9ukT6IGvrJCwBaokZsw0dGjh52YLuysp5PaG6JZph/nuXlD
         eMtObZlVS7SRTJszvza0TQFIlYe5f2/RhlKHfnbGJedt2wK4NS115Mf455bZDIUI/5I/
         OrnULpBbfobYVm7L7PEK3tMedH5yr6AXGpMBWkaPrWs/deL33HQ/PFyPopAUH0fGFEUq
         Ne6l1+V241OPH7SgMHWGXax0OYOZ6nsjoWdhMLfO2Nb5blPWFsJzpQ+mxNrbg0vWUj2F
         CTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533278; x=1782138078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0qS85tDOTQ0lyeN0lEC4TvTGSwDGHgz/zgpxV4/S1k=;
        b=df7b1FG44qZsZwCDfHMN6fBDlsT5ywRSAHVB5kT/BFusfaw6njZq7HrU1G3ZuezuVx
         3Twr0+Z6bjncNf7RArTjxEUut9GZFqxPq8yXoaTQ5LhSQrZykbHqQ/UcXR2UoLwhQxoh
         F/yfCZKPAoAlXoR5F55QRsTPgNrefMYObciaLauhxpQ+62xSm1wXRaW05RP+oKlrCJpX
         2RgwtQhzJp7J3LVYAIyZ5G3nQYevnM8Qn8IuCawbq3yJRYwQ53uD6joxKK3bZZoHT1yw
         wVL1ezFOMJpOjBZaok30zsfkSUCgcJdx7vDcluELZOjeJSZxc2PGJOzp7rfStVywUIMl
         G8nQ==
X-Forwarded-Encrypted: i=1; AFNElJ968ukkliJ2ELVs2cNzhyRhHjxjH6Z24eQCPjiwphkjqZIuvG5KpjbgCvgIgiFWHGHZ2bZYWrpBV8Eu@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/pAxeeBVE8DTM6gIDeOLLysfb226R9jmFypZDaCH7c4R7dQg
	5/mdAgs/Mlkw5GqBjjlW6xjFHVs/pzRjPAvDmYA2GsXknbx76qRJoObY
X-Gm-Gg: Acq92OF+8lgCL7YDkCw5n/ekGk6RHF5QvzQeyrzZtHp8v6SyIg6aL2sT53mGb11IVth
	qkx/MNV34r2p2QlDVd7XfwWi3Fxmb1G+mhhOTa8a0qsVtEiU2lWMBZMs40k2zKC9276fj+IHzwV
	Atv8rpoo+ZSZgmVqB4dCuAM3LxcuAQVE0WwMMCXKiQN49rT9dJGD65JCOBPof9KC33DnRrtfDf/
	Fw5EHwAfad2gF1BBHN/fokVpzQxmpbILdmIode0XtI/9LypwQivod+8kYn2Ujb1gTV7xlaklnzz
	oXi4dU+2x2JMLoeJGCgSziSRAXvq/3hesSoBlvGlvYQpFCXowcW4zrqV5WV+zZxQ3in1Ggssznh
	yguutGFbH+PHrWIxQvCdsyR0U4UWFv89pQTOo76awDMOoWLrK5HPvNhYNspN5yjveafaGP6Uh4C
	Eq28znRswN0PgeAuZwHk3i
X-Received: by 2002:a17:90b:2547:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-37a03bd0b9cmr15408936a91.21.1781533278251;
        Mon, 15 Jun 2026 07:21:18 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm7178233a91.2.2026.06.15.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:21:17 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/10] Input: cap11xx - Add support for CAP1114
Date: Mon, 15 Jun 2026 22:20:26 +0800
Message-ID: <20260615142103.352163-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CAP1114 is a 14-channel capacitive touch sensor with 11 LED outputs
and hardware reset support.

Patches 1-4 perform driver cleanup and DT binding tweaks.
Patches 5-6 add reset-gpios support for CAP11xx.
Patches 7-10 add support for CAP1114.

Changes in v3:
- Simplified the logic of the reset pin operation.
- Adjust linux,keycodes configuration for CAP11xx.
- Drop unnecessary CAP11XX_REG_SENSOR_THRESH(8).
- Checks for the presence of microchip,calib-sensitivity and
  microchip,signal-guard properties before processing them.
- Link to v2:
  https://lore.kernel.org/all/20260612072237.1177304-1-jerrysteve1101@gmail.com/

Changes in v2:
- Drop LED property tweaks, keep only reg changes and node regex
  update in DT bindings.
- Split microchip,cap1126 LED reg constraints into a separate patch.
- Replace usleep_range() with msleep() for 500 ms delay during
  reset pin handling.
- Add missing <linux/delay.h> for usleep_range() and msleep().
- Add CAP1114 to unsupported enum for microchip,signal-guard and
  microchip,calib-sensitivity
- Add constraint for linux,keycodes to support CAP1114.
- When reading CAP1114 button status, mask STATUS1 to bits 0-5
  and OR with STATUS2.
- Adjust code style.
- Link to v1:
  https://lore.kernel.org/all/20260606150458.250606-1-jerrysteve1101@gmail.com

Jun Yan (10):
  Input: cap11xx - clean up duplicate log and add probe error logs
  Input: cap11xx - remove unused register macros
  dt-bindings: input: microchip,cap11xx: Update datasheet URL and LED
    reg range
  dt-bindings: input: microchip,cap11xx: Add microchip,cap1126 LED reg
    constraints
  dt-bindings: input: microchip,cap11xx: Add reset-gpios property
  Input: cap11xx - add reset gpio support
  Input: cap11xx - refactor code for better CAP1114 support.
  Input: cap11xx - guard unsupported DT properties before parsing
  dt-bindings: input: microchip,cap11xx: Add CAP1114 support
  Input: cap11xx - add support for CAP1114

 .../bindings/input/microchip,cap11xx.yaml     |  90 +++++-
 drivers/input/keyboard/cap11xx.c              | 280 +++++++++++-------
 2 files changed, 253 insertions(+), 117 deletions(-)

-- 
2.54.0

