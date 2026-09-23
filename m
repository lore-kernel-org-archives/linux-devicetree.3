Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4739249F13B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160080; cv=none; b=IYUCHrskuoSZPtn49SMCeFYoqvcFZZ6nrL6XcK9nIqh9zKmLbQ89Yr9U3j5H2o7mWhLKwEkV54j8DT5DlIPsiJoBuBIIjamVwV6i+RYXjfE4BT09OUD1TaHxHKvl5PmHu6S/Fm5eDsUUT1+9sttsRiQOHIUOB84NwbBgkkdd4Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160080; c=relaxed/simple;
	bh=5PxAU3paz52Mtr8Jp7nt7QVnPTjaM1KWEmISoLCTxR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jhNMeQUjtaWDHsg1amaedbN0CbZwTnx+0gWRoDCkTn+6kpbIMP88azGZ/NNoisNY5FYeSds9DVG8/xqF2vDCVCEFP0LNOBf0fQmouxTFaC7oiPc5LONqOKRvrQ62uSlNSGX8qnmgG9vP3gLIG19QXkl1W0TOcOdhsviAcqDS9To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gT5252TO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gT5252TO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so5390715e9.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160059; x=1790764859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXUSqDqmWGsUiKj+kk0gzwU59ohBd+/qcFHp0F2IbXo=;
        b=gT5252TO7b3cbPpVLNSSByHVIfFTHAPa/Hor83BOJw3cjUetXBPDN/KYrgMekO2aGy
         KSHwV0avJ+L7reBPXQqwpVtCcopslvTYpIvhwMh7oGbYBDrqAX0DhP3A4CHEmXpMjxmb
         0j1BVXjjrSISF/iXaVFsXPUv9RwY1X30q0MVKXS763ZwSKWR0Pp0THge2HOr0LdsY67a
         IEdGsqfRRKocB3Y+cx0CKW75aPuXviPPh+O7Kmz1CMgyhbe/V/aiW1LW6VCTm8VgJqK/
         wSIP1xU/5ZkV7joikgLVH9VtAgilA+6O0HHPoSjMrczO1hVVWPiPdFTIRLeBOVHMhPbt
         +xKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160059; x=1790764859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXUSqDqmWGsUiKj+kk0gzwU59ohBd+/qcFHp0F2IbXo=;
        b=N5CubncXC7FEcVnAKYs+NHGI0MTG2gSGj8sxN33slxOGUtgALqFl9P0euIw/O8XG2/
         En+oCWK4UYwuVMVk66aTZ8dH7k2mdfI1NAtFXbO9s/pOhVQ6fKq0uob82lGR9eB26c90
         UR+/A86QpL3L9Ea2EjLv+ug4edRegECUnXbKm+A1FlmBopd6T0R4wAfNYVj8DcVv/Zau
         c4Fv/1VrAN8yJYvRcCcfY86LsUNkAj/nHDUnxrkjADNiqmiakz9WNCP13UPpF2rrYMpD
         e1bYj+pd9OouSbb7OsyiCddV1m8+ctFVupotG85NxTQ6wbc5proGxHaLCJS+WW8jN8fF
         0S+g==
X-Forwarded-Encrypted: i=1; AKwUvBw/hy7vqEIWcWORFmr3ZsHymjiNeDdZDr7Yrk5f5e2Aktzve6QXu7KLinGv300yW7LqUZIzVNkhhbih@vger.kernel.org
X-Gm-Message-State: AFuF++k318TZFLEvR0ci/lRhX9SOqfzeNTVYmESQPmZvd1naBTgTLn2U
	h+C2EQGTEdF1WxMD59f5GiWlc44kjRY8GqrQ8zAFripqwY1pk73Ef5JT
X-Gm-Gg: AYBFou0yxNCphPp+mrbKlIzvgb25EE0I2x72UVfS+WdpntoUutMjkWx23sEJoZgBtta
	4AT+sNQniOhgcHgquSiMaN8UtGeFPJxe9lB+Sd2i00ZJ+iHMJ4JWKTeurwwWX2pIgVCsc1GCjn+
	xUfnvMvEIRee+8X7M4YW2sqSFOlirDdppl92RbOHbidGYWawc2TjKX7D7OVmPTP3P6O0vo8FVKS
	kf/NSAFJqKXG1NvfCtvtuQJ8Ubn1ERHXd2wQ+G5393rA3CVuaVWErutwbhcD00hbO9FlGIgwz73
	t8jikkj5TzdfLntV4XSu9C3Xty9VQQvxo+XVNsamowRBebGTOEeEbo4SQGnSQmwas6nGEyf75cy
	PWFbIocJsIovviukH50+bn0r3Lv2ORN5pEpU9cxvH62Uetbywe8J18fJLngiYemvmoB5TstKjQy
	EEhxm8bztdfHm/z2LqXOAWzJSfJlo8n5j/Rd7PvXcfe0ypMd1xJ/hq0jUtmXJAzIwCgraTGBKAN
	yaEzwtBOpr2c2v5sBKFQFphrvhMAmMcL5gDGz9DUGhyZpoKziASAF+8SUcE2e3qATjeMM4Bw6sC
	IlkSHZ90anBUa6uwaNQ=
X-Received: by 2002:a05:600c:8b64:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49fdee0a0ebmr25441525e9.4.1790160059161;
        Wed, 23 Sep 2026 03:40:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:40:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 0/8] Add syscon support for Renesas WDT driver
Date: Wed, 23 Sep 2026 11:40:46 +0100
Message-ID: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Merge strategy, as the WDT driver and DTSI changes are interdependent
the driver patches can go via renesas-soc.

v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
- rebased on top of next-20260922

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
  watchdog: rzv2h: Use pm_runtime_put_sync()
  watchdog: rzv2h: Drop enabling clocks in the restart handler
  watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
  watchdog: rzv2h: Propagate WDTDCR access errors
  watchdog: rzv2h: Convert WDTDCR handling to regmap
  watchdog: rzv2h: Add syscon support for WDTDCR
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi |  24 ++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi |  24 ++--
 drivers/watchdog/Kconfig                   |   1 +
 drivers/watchdog/rzv2h_wdt.c               | 136 +++++++++++++++------
 4 files changed, 123 insertions(+), 62 deletions(-)

-- 
2.55.0

