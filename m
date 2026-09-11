Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FC13D4116
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125481; cv=none; b=Hrev2fFKImfuAwNXCy06v4jjYS6UYHZ1Gy9IeuTvOuBid3BGFXAmzvYA4DndRoPXK+6fonkfRkC3yvNqpwDwjt2sJttHRJ7EE8eQ/ohorTYADUmB8iqYVIumSv/bFE4nQVP26LL4OQM/Tm9UY/kXEvzpy77XZoVDzHIEP7yR0RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125481; c=relaxed/simple;
	bh=BP803oURR/lN8mCs4lhT55YLQxArhtFJ/cLKl3zfk0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fHQiV5bbHnsJ+LoPxQ4CUfuYMUyt+tx6ZiulpaPOI3G/E/ZvJDf/5P7ubeaL4BmjuBuZ6IuF2oblyOnE7dxkosVPd4D5708Urpgb7QlAVc91nbbA2Ltan4E359gEik0ff0HqcYSAoqoradJg3az1LTbA5OZb4Bv4IewcXrFA3RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgxYvuu9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgxYvuu9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1249841a12.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125465; x=1789730265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EGymmArXv4evJmXGsdnDdmakRi+qhuX+cQlFqwWpb8A=;
        b=MgxYvuu9WAINZLrlXY8oj0LQQuraqCWwcCOdzY9kBKp0x05pNms4Y4IzU60eQWEIZP
         GDQmVmp6vJv6OAbTwzu+0q4lOtskFY+TnUz0VVOHMGgm4zhNAz/vfyKicym3949kPmSz
         z8teXUI8Y1Qk31epJ9SGu0Q1tjZV5VF8hc5u+djkhw6nyLt/5BW6pR9UmIne3P+bZEMp
         ggM3GrDIsyhLlkkaECUSP9mMQmNa3ejndFyBDv0WhFtq+5cadX21ZEfr811Q8FViyDm/
         nga6/H1pwgyxpYdlB2RugXzXMSdCgOy6dM0K6fdFU0g2IndkT/T2t5r8JXRumEftn8md
         JCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125465; x=1789730265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EGymmArXv4evJmXGsdnDdmakRi+qhuX+cQlFqwWpb8A=;
        b=AWBQnAxxH3ePq/PnOvUNoJEJuGJD/j8dgmLAfneAm0jQghbum58P+1UlldxvRstooY
         snqm4U8eZBZWD7hhh4YEN2HAJKV4RIKH2BxGsk5aii78DEM88hwyIVAhfYvXej5F/fXj
         VCJAEUmH155lfkKkuQfbKpx9Rw5DsZyKsMCTe7k/bGDI2kyZ6iXaSCZPQKQUz+cRVHjL
         xCnPtQbU/+Tf0CbiXgufHku8Eh6EVMkIQnVjgRPFX8sFkOENsyglTDJp00ytZDnnpptq
         7o061et3m12wwtg1q5/WRHe4QVgTO2fWSn94U2A10IkPmQGgnzpJd2NDPCrBS9xG8PLy
         UIow==
X-Forwarded-Encrypted: i=1; AKwUvBz+n9yNQLA3uvCc5hC8u7D0oHTNLLVWXM9JEcIMEdJmjPcD7cGUkppfDvXARAYPlpXvxoxVXNLpdxUG@vger.kernel.org
X-Gm-Message-State: AFuF++k9P2VY18WvJCIkLUfGFtRcadPWvT3JpNp9OvPn1tre6/GUlrp3
	nXcttd79P7iQW+JYkubEiw6ebuOh0xkPEeyUdLfT3ErEcNrw1k3SK3NY
X-Gm-Gg: AYBFou34p6mrLqYIs5/Vzdr3IEi7oflH8aHhbBEGvbgT2DUnemlLYn+AvEJKID0eOYs
	tCW/aDTXL5VDMVEqYmedYtDki/8Bqra3t73rx1XQbO5BeUo1VMJTeEqKgAQJWHgOk6Kezl8aEnG
	VO0/JJdPvTPtsL7/C8VKOpbmqju451IrWlrQJqlogqR62WaKx5/6sRUmKRFAyff/xW0H1w7RKnK
	1lxLWPdlMVrPJlDL/TUTgz4N3Tiyg0ifDAQ4GmUirpVUa911nsXaPtgyyekqg7VJlWGNRwAJ2KH
	Lez658vvk+bOhaE1G3VcG0BfQP62xLtW6lA5Kseni97wXLKhFe1Iskwe0WYahXThGLbzNr34cWN
	3spRXFp85yzIjlaK0GWTCYoMW1zd79q3kg0X7axiU3aF5+KX+l7H5F56e5rNZKYEDYR9uf9/Mlo
	3vmrd7tWVRY6lqlRWQ9T2CcZRBN6cJXiTZad7hs7qOCfp/UfJdZAKg6nOq377QLQzsWjAlLgNLQ
	NFyacJIBJdnIjNokEE0wPhCJld9vK4nOox62URZWi+TtO5jP1+nmZYfIHGGtmPu7KKRsF+N7TAH
	gMgRIN6NYnPRj3cHZXA=
X-Received: by 2002:a05:6402:1587:b0:6a6:584:d9e7 with SMTP id 4fb4d7f45d1cf-6a9b5626b12mr1656298a12.15.1789125463808;
        Fri, 11 Sep 2026 04:17:43 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/8] Add syscon support for Renesas WDT driver
Date: Fri, 11 Sep 2026 12:17:23 +0100
Message-ID: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs in
the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
which the CPG driver registers SYSC regmap. WDT driver now uses this
syscon to access the WDTDCR register.

These patches were part of two seprate series [0] and [1], out of which
certain patches have been queued separately, so I have included rest of
the patches into this single series.

Merge startegy, as the WDT driver and DTSI changes are interdependent
maybe the driver patches can go via renesas-soc.

v4->v5:
- patch #1 is new addressing Sashiko's comments to avoid potential deadlock
- patch #4 is new addressing Sashiko's comments
- Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
  restart path.
- Handled the regmap locking in the driver and introduced nolock
  version to be used in the restart path.
- Added review-by tag.

[0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (8):
  watchdog: rzv2h: Drop enabling clocks in the restart handler
  watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
  watchdog: rzv2h: Propagate WDTDCR access errors
  watchdog: rzv2h: Use pm_runtime_put_sync()
  watchdog: rzv2h: Convert WDTDCR handling to regmap
  watchdog: rzv2h: Add syscon support for WDTDCR
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi |  24 ++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi |  24 ++--
 drivers/watchdog/Kconfig                   |   1 +
 drivers/watchdog/rzv2h_wdt.c               | 134 +++++++++++++++------
 4 files changed, 122 insertions(+), 61 deletions(-)

-- 
2.55.0

