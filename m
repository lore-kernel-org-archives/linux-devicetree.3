Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2292E3F5BCF
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002773; cv=none; b=Wfc+JYWS81gTk/Z4VZrEgNZvfzhX8bw8lm8xIYFKtzCbHuYytVdW81s9y5syUgpdyK06E1gZHat/c1uRicYFIJ8dAfQphMka+JinLPWCXiHLpHJwBCXk9xZk5YDf66Lu4S22tzNNi+wMa9XfHks8fkSckV5Qxkuf88mVE78TpT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002773; c=relaxed/simple;
	bh=n87GT43w3DdRTkTnhNUWVAKarzjSVs0P2+42rKxMlLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VF2VplQ+NB4TWnhuqBG6zbF3ihiSvor4XIIWrCnHM2YHrpAUS4oh2v4vkahbgYdOIk76Li5QtsIIQw2G7u2W4U4iJotpqePwOW+H13smfCt5UTyvIGrjzt0ymPe+rZEEPqB0VYIY9lq+mRvSlMruXuovN0qV1/c8KaIzg4bIN+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLkPF3Ok; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLkPF3Ok"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so68919655e9.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 03:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002770; x=1781607570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Awp9o+G4t/KB8Nuw9M9eoFnlOxMqCJMqbpEUDuh8Jz4=;
        b=fLkPF3OkYbZc9tpACZedzC/B77KDwpmd40jvpMIIdp+1VWCX4wcHYF9Np6S1rYZ7qz
         8fg3nFsWI4MqWkc4OWbWmiCUwEC4jHbnmTjw8SVWn4bkkioiiuMgrEMjz/3HwM1i6O6q
         gxV2s9jscKeAaMrNdAJ/w5SuqJSJJu83lGo05+s3qEtDHmIsmCKFqHBv5hO+a+n9mzOg
         qJhaBxsysD37WhY+AfKcPs65IrSfIECQvkTOzDuvZOngxDmBbrSS/8BNHdXFv55eguSW
         XklSldjrMMLlfdLMvPKgXQvhX/6xu8CSrv4Eb5Kj57lE5Ye8WVRMDWWX/n8HDqvMnzho
         orxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002770; x=1781607570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awp9o+G4t/KB8Nuw9M9eoFnlOxMqCJMqbpEUDuh8Jz4=;
        b=R5KeAWzxI81tS7Rh/Dozl6PajPzbU/fxGsjauytjQ5aaym7Vzwvr96aNECFXlssYhA
         dk1NU3ZBf3L5iTyk0t87J0f5mY6R7QhzGySfC8GbAnqCChyh6f9svvOxn7jA6dSO8Z4y
         iH5pOF2kSPqa0lGj5k5NBCSrP+HnpqpVOKgB3OX4G5wurFLD5M5aROg4uNJ+qaBNBJfv
         wcGrSTwsEpYbJCMmpV6TjbBGD4D81uWVIZ/GojImjDCMaYSqfi9innmIO/3+Y3HV0Utt
         eGZpsCHep/plNBKIkLgBaHOyYqT8TRqtcPVZeSkiAPN7Ve5DV0MbU01CTi2r3lc5xQ7Q
         hdrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sOvteKMRm+t9+Vf6CCEp7Gqy01BC86ipy1FCQDzGXr4Rlow78yUw0+viODlMp4Cx42gR4+tP4y/fh@vger.kernel.org
X-Gm-Message-State: AOJu0YxkoRnCq9WdFu3opuohT3d8eDw8phT6PF0gJnzIx2QaKW70ocIN
	MCF066kXi92+3SfWhk1RFEM6HyShrVjUfZJ9Jw5Ky6cHh99JbV2QdoOGtyGgCYdk
X-Gm-Gg: Acq92OHLHh39kaVnNl6xULX6kzHkdV+g2cq5f8M9Bhr2xJhWHduwkxZ4ISLCq0vJEs8
	k/FG4FFi6Jw6m6c0mwy9CM+hAJkcN4wfq4cn6yV5OHONG8AZiOgmsOabgdCzKf0UiE47UMvdrSP
	91T8aA9wFBpnf4xctnyFZmfAfl0f2e5UxmK0U3rm+y1Siwh66FxT72n5qwwLPR3fDsaWM/TDNBJ
	DKJLUlCSlVScB2l9u5seOvD4qdE+qKz4NNw9Ut8TV4nO54AgNaGV56iL8uc6ZrGsfa3Nk6C96ob
	JTqmiVb/0JmoTQt9T3diOmwAk5I99MvK6RGQzrZQb5Q8Ked4B2DJbS7WCWYElbD3uW/90+jypWL
	S8bXmKDFhqgZEFFoa72FhjhEGA9SFM+Rg4pOqhIdyJJKDL65yr4zH7eiwET4/RVLw66k/4XlV7A
	v8ifnCU3uuB2O9gy7UZFpBQxoMyrHaRW4hJrKXLRIRGfeee3bKwGa1NjG4M0IM5YSnZgIMkEz4v
	nvwrV+y7BgP4PzS+F8xsW75GkgYyNYx9cbB6/1GTV2pV4hJLPO5ycrubg==
X-Received: by 2002:a05:600c:620b:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-490c25cf45bmr337771525e9.28.1781002770128;
        Tue, 09 Jun 2026 03:59:30 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] Add PLL3 and LCDC_CLKD support for RZ/T2H and RZ/N2H
Date: Tue,  9 Jun 2026 11:59:19 +0100
Message-ID: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PLL3 and LCDC_CLKD clocks on Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. These clocks are essential
for the display pipeline, specifically feeding the LCD controller.

Key Changes:
  - PLL Reference Flexibility in  the RZ/V2H(P) CPG driver
  - MSTP Dummy-Read Mechanism
  - LCDC implementation in the RZ/T2H CPG driver.

v1->v2:
- Dropped RZ_V2H_OSC_CLK_IN_MEGA macro in favor of direct use of the
  input_fref field with a fallback.
- Updated the doc to specify the default value of input_freq when it is 0.
- Updated commit message for patch 1 and 2 to reflect the new approach.
- Dropped using table based approach in favor of direct conditional checks on the clock index.
- Added Acked-by and Reviewed-by tags
- Added new patch#4
- Switched to use the new library
- Kconfig now selects CLK_RZV2H_CPG_LIB
- Renamed CPG_PLLEN to CPG_PLL_EN_EN
- Renamed LCDCDIV to LCDC_CLKD
- Changed ctr0/1 in r9a09g077_cpg_pll3_clk_recalc_rate() to use u32

v1: https://lore.kernel.org/all/20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (5):
  clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for
    calculations
  clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for
    RZ/T2H LCDC and RTC
  dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
  clk: renesas: rzv2h-cpg: Extract PLL calculation math into a library
  clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H
    display pipeline

 drivers/clk/renesas/Kconfig                   |   6 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 369 +++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  20 +-
 drivers/clk/renesas/rzv2h-cpg-lib.c           | 216 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 186 +--------
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   1 +
 include/linux/clk/renesas.h                   |  28 ++
 9 files changed, 645 insertions(+), 183 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

-- 
2.54.0

