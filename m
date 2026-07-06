Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD12E420891
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360310; cv=none; b=u6OTuSsMX0s5sgFqBzGl/vPn4M/w41haiUJd2wdz+yGOk6+IsrCt9G8PhZPYavUj6Nzu6n06pCxVsdH2sKZsQjm99XjASWbiclg4ZAva/WYLVNTSIu0lb4lMNfOBgd6mDTjmgW1+/xQZsyEtZ+hYPUaq+cOhmJ/7mr564CFNOvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360310; c=relaxed/simple;
	bh=K89syd3g6tBclCMV6bI9+wkGYB7Ri8EqjsqIU7uC7FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ASiHNOL6Lh8qSfD4puKMvfHAU22ibpRQ7x6QCxsBb45cxNMEGUommbxr+2Sjakl69yMbnleDbmGNmdaKf3YJ4Re/Be+nwmZ3aweXzjJq3sTTA6ZOE/Q2wRyaCFrVVJk0JjyyOEp7eQReAvPvii5df30RRei13RtqZFLezviP5vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H28pe6VE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H28pe6VE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c1950518so377555e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360307; x=1783965107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lerme4TogeB5JN8nH5z+DAPP85cQrCMzcy5A3WRT738=;
        b=H28pe6VEgxuuFE5gLSk/NsuExJw2o8oGKG1HVC1IZEGH3fRb3QOoXk3eHlbB5fRDoA
         WKa54c8huZhTvaLOkdF4IkYsHQBfeE2VqanqrGe30HksG2wo3vx/HmgxvFGnXBJ8s5S9
         RtnWKBqSx/fV4ztcnFPGxzcLzELxr/oKt6XI+ePSxiTJUKoiNEQtPLuf1eO9bwZ3HJpx
         sViG+uR4hPGmY7zsMBIf5vzJulRM/C+/JP1hBw/2QDFbzLEdrJc2d8uVBDIAxGb8UD9c
         WDi845bJlbNgeHdsfQc/c1Tv7Qs+DfOruhydgaPL4PRzwaJXdOJk1SAp7kVIxoAWaSau
         LX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360307; x=1783965107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lerme4TogeB5JN8nH5z+DAPP85cQrCMzcy5A3WRT738=;
        b=RBq0L+fPS69+2G0TD3qbvRBZJwB0ZSlIQIl3pUw2vtTII8iQcWtZ4TMUPQ5O47Q5SR
         pseekcc0VMu+OBBCkNP/AHx8OMFiSB3/nJtExPKYaNV+XZIOMnw0ytLIiZPR1zMsh9/E
         1/oPWm1Kyku4IgEJMJJK7OvsRwY5EpKV7G7IT5LYPETVrKgGcVwO0wmuezW7097zMjCg
         cmQn2iUbJeL3+fXoTaTJ4Qy63jkgKOfhIIzP2YnAouFNEgvUejZEFL7KB+/KhQQhdP03
         GbjpzJePUNhYRVL52rF7RXnx4BnKAaCT8ixYk5CwtxEb7KedbCLSvpL9e+N04TqRm7jI
         3JeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcvX6FfPj2p8PKYaqWxQFVPY8Tz9ZS4OhDW7BgJdrxZJw7mS1RT2fza9Ngy456C+NhUQBi1U+7RuIZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvrrIcSBg2KRBbfH6Sti9OtWhW6knpWOmgt3YDdlOLGKDqzAJz
	bPBTf1jezTWUvF2DK4nvTFwCXOXRa7fAOy8zG17rmzUijjURKNJjJ5cX
X-Gm-Gg: AfdE7ckPB7fLEQq4cEm6dgG56hSM1M6zJOjtv3/Op2394fBwpEcUfVcoDNWNdHFPAtC
	N4K1co5WdV5htcZLBVZW13o1ml8wcCJnjasGlARCugazN/F6zZbTX+piVZvpCdGUtTROI4op5zg
	Rdj9MWTMf8rOX8UpKQOjGIPxlN2A76HztyBkJ8aj4OpPXdixh1SnaeRa9VU14bWxAvX9TwDSU7F
	RNtByL5RHVpi8UBh1A1ww6e4zIOwMCI+rzb60HKsOf5q37uGXI8TiW6WPpuO3fd8oAoh1v0MamX
	2+x2JQFjXOaIfWJsS66+4yUo7Ilq5Fq4+fWQ71pVnx8yAj7Gz33/FnMkI0VUqcJ4i7gdAuBHCZU
	5BeEnibtLCB719/+7QwxhwAgexr/pV/inAb/3nqWGCjhrakJacIdHZeytTAaLw6eMjOK3mgAwcC
	i9vkakRzSr3Xe8doR6LsQiVWT/gPIOxYNRTcPVaPVctcYBz3xiFbYYowzGkmwyABlK/GO/WpIjw
	Lo5BzwPTzeV1yO4eDRMOTTMgjs=
X-Received: by 2002:a05:600c:811b:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-493decbf15dmr20138875e9.7.1783360307120;
        Mon, 06 Jul 2026 10:51:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 00/12] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon,  6 Jul 2026 18:51:26 +0100
Message-ID: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This series adds support for the RTC IP found on the Renesas RZ/T2H and
RZ/N2H SoCs.

The RTC block is closely related to the RZ/N1 implementation and can
reuse the existing driver infrastructure when operating in SCMP mode,
which is required on these SoCs due to their 195.3 kHz RTC input clock.

While the RZ/T2H and RZ/N2H variants do not implement the RTCA0SUBU
register present on RZ/N1, this register is not accessed by the driver
in SCMP mode, allowing support to be added with minimal changes.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Patches have been rebased on top of next-20260706.

v2->v3:
- Added new patch to fix weekday underflow when alarm crosses month
  boundary.
- Make use of devm_add_action_or_reset() to simplify driver teardown
  and remove the .remove() callback.

v1->v2:
- Dropped wakeup capability support patch.
- Dropped header sort patch as it was already fixed upstream.
- Updated commit message to drop reference about RTCA0TCR register.
- Added Acked-by and Reviewed-by tags.
- Updated Kconfig help text to keep it generic and not specific to
  RZ/N1 SoCs.
- Initialized rate variable to 32768 to avoid timeout_us of 0.
- Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access
  instead of 0x3F.

v1: https://lore.kernel.org/all/20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (12):
  dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
  rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
  rtc: rzn1: fix weekday underflow when alarm crosses month boundary
  rtc: rzn1: Fix malformed MODULE_AUTHOR string
  rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
  rtc: rzn1: Fix alarm range check truncation on 32-bit systems
  rtc: rzn1: Replace remove callback with devm_add_action_or_reset()
  rtc: rzn1: Dynamically calculate synchronization delay based on clock
    rate
  rtc: rzn1: Use temporary variable for struct device
  rtc: rzn1: Consistently use dev_err_probe()
  rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
  rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  35 +++-
 drivers/rtc/Kconfig                           |   5 +-
 drivers/rtc/rtc-rzn1.c                        | 159 ++++++++++--------
 3 files changed, 116 insertions(+), 83 deletions(-)

-- 
2.54.0

