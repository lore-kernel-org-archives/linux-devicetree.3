Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D5837F8C9
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567014; cv=none; b=rbe/edYpYshUAVXEPpY9T5io9n6R1BdKcxGqZwUCuo3Fb2GXgD3QfdopLpLc/e3EAvH7F7dI4eHjaWSblFJPRCDTOJ+qgLuedmAKmUNK14xbi5fr0+vXip//FV2dVlTqTF1SIWiz+ugVAKbdRb2n1Wud1huZQZv75cLInNL3A+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567014; c=relaxed/simple;
	bh=S5X04OlM8U/d1OghNt6LGWawMPoFYhnTE144LY0HR78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b2gTWe/1DeXOLyXCgbLXvUQmvU8+mVbB07FsRpWZ4J6+PgdyclR4lg6/juI00Gb5dCquAyNQvYOC4fDW28bsmRX5VtO4hlAeNy7kRIaH2dWlhNbajnbGxpRC65lQMwbFCjWGXxiQRiS60PB7CDUd5L7igrgdI7I6a8MTR8T02ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZwqTK2w; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZwqTK2w"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b915ded5so4110205e9.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567011; x=1781171811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aqWGrFvBW1qnB8VQMYujgvpQqp10gPwxWFXNFPBUrrQ=;
        b=HZwqTK2wxySSBTSyJF3/hk/tCzveJm1j8I+E71X6mevT77vlb/7gZyX7fg2kRKJ+y9
         i6OMrTHSXo+cgqdZZBLl8TCqe8nQ4RQmuxh7GNDV8qpnXrU9tS85S3g9hzwar9Ouz6nf
         QnxEql7iBKSY257fAEQRdL2oGiaQ9aLXRc+6Q3EMuxM3pb5j5ZwbxrFYehPMIsidqh6Y
         16Spr2bvM2Lh0RRA4dq369pUGjAoqpur6Pto1xAnNTELduWld5ioLTYI90Lc6NuX2ntV
         /C8FJ5JfEBU/BpyFj4guF358qXsblOM1B7sLapQOjGvrl1B+gfvXx57wKcAdMJHmf+us
         0SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567011; x=1781171811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqWGrFvBW1qnB8VQMYujgvpQqp10gPwxWFXNFPBUrrQ=;
        b=beORbRrlyxFEtaEbAS65Hd8MEpc/1UfgVOsxBv7MWzkkUF82vVka6PPhLbnP9teGKI
         YqAc+7Xh0fEL84+yx8iaYskpYEGRnp/84nIVWw2qIyex1d9rGMMcJW6ZU0hoqobzUX1W
         FoDpHOSYxeyiGG3MH9JsHPOFKcANQwfApWxCmro/3RePDSALQi1+GzFNwSJt9LQw6lBc
         +5l3FbJAT6cUcOsJGEtH8G96HG3UjDV1NPqyKExomKNzAtieSn0QJ9BFKojGfsaTX1mM
         wleahPaOm6UdiD6vQshiRzIIM4A6mr+oN2V+PV8squhSbFpNsHqpDUQeQKBdS5UHSN5B
         xZ+g==
X-Forwarded-Encrypted: i=1; AFNElJ85uc25/gfwoVZnXWqifwcouMq1mlQW7RlPm02mi6Az+S1vXZ/XMc8t9E1+fPTFkD8pJDr8kOfF1/pz@vger.kernel.org
X-Gm-Message-State: AOJu0YxQALAqI9FlAvxSSz5lNJ8/OnyC9upNeqq0zaFPI4FKw3Q8CLpP
	xofgZEtF4W7YjtzOdoMHqvw3VOGNz4DYQBVDo0UQW4CAL/fe6dsNr/w1
X-Gm-Gg: Acq92OG4BmrRE21GKQbfLMZNINuWoGJ1VNGQBv9csyUgFjEhn6VqxBFtB+rs9ofqSCr
	Vf2QDmlOk7sT6k6B9Z/VTQJ8Kbw3iufvcASrZiKEK0k6AG6efI+oOS2JCurg0phv7bUSnFD7vpu
	AGJsk5wolI0nBC2COhPL3jgZ2PfUXYTqDP4dMUqyAiC7mKlfIltl4MVbcqpxW0Tipf3ll5B7RPx
	hpKvq+cijsYwNjGBZKT+G2O9t/GWMhjJVXdMIDah/uieBU6W+0EocgwLp21SN/QsZ7kiMZWvUtE
	s+nIW8ua8Mi5d9gCbZVX5b82sxEJMTz9eu+3dd8Kgut96inV84huaRyeZ9zw2AvaUzW/cZXlKFH
	pAE0zUNJZs7EEHPhUDRnDclIEB+X9iacgCpFACVD4ckJinFNWRECAlqMx5vJI7oPXcxtVxYuGHA
	iNxXf8AaJKxzKAzt6u21V2comY8wURKfB65XRQaX9ZmeBQf+Bkg8dHCCgUFtE=
X-Received: by 2002:a05:600c:4748:b0:490:6e11:c303 with SMTP id 5b1f17b1804b1-490b5ed6ad0mr117157585e9.13.1780567011084;
        Thu, 04 Jun 2026 02:56:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm38037335e9.8.2026.06.04.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:56:50 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 00/11] Add Renesas RZ/G3E GPT support
Date: Thu,  4 Jun 2026 10:56:30 +0100
Message-ID: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This series extends the RZ/G2L GPT PWM driver with RZ/G3E SoC support.

The RZ/G3E GPT has a number of hardware differences compared to RZ/G2L:
it exposes 16 channels (across two GPT instances of 8 channels each),
uses a 4-bit GTCR prescaler field (versus 3-bit on RZ/G2L), and has a
discontinuous prescale sequence with powers-of-2 scaling rather than the
continuous powers-of-4 sequence on RZ/G2L. It also has additional clocks
and resets (bus clock and rst_s).

To accommodate these differences cleanly the series proceeds as follows:

Patch 1 fixes overflow with period_ticks variable.

Patches 2-3 add DT binding documentation for the renesas,poegs property
(allowing GPT channels to be linked with POEG for output-disable) and
implement the corresponding driver support. This configures GTINTAD to
route output-disable requests to the correct POEG group and sets GTIOR
to tri-state both output pins on an output-disable event.

Patch 4-5 small cleanup adding missing newlines to dev_err_probe()
messages and removing an unused parameter from
rzg2l_gpt_calculate_prescale().

Patch 6 migrates the driver from the legacy .get_state/.apply ops to
the new waveform callback interface, introducing struct
rzg2l_gpt_waveform to hold the hardware configuration (gtpr, gtccr,
prescale) for a single channel.

Patches 7-9 introduce struct rzg2l_gpt_info to capture SoC-specific
hardware differences, adding fields for the GTCR prescaler mask
(gtcr_tpcs), the prescaler multiplier (prescale_mult), and a
calculate_prescale() function pointer. This cleanly abstracts the
per-SoC prescaler logic needed for RZ/G3E.

Patch 10 adds DT binding documentation for the RZ/G3E GPT
(renesas,r9a09g047-gpt), covering its 16-channel layout, 64 interrupts,
dual clocks and dual resets.

Patch 11 adds the RZ/G3E driver support itself, wiring up the new
rzg3e_data match entry with its own prescale calculation, prescaler
field mask, and prescale multiplier.

v5->v6:
 * Added patch for fixing period_ticks overflow.
 * Added patch to add missing newlines to dev_err_probe() messages.
 * Dropped extra space in poegs variable assignment in
   rzg2l_gpt_poeg_init().
 * Updated the comment sections of rzg2l_gpt_poeg_init() with POEG and GPT
   in upper-case and replaced configure->configures.
 * Format specifiers in dev_err() changed from %d to %u in
   rzg2l_gpt_poeg_init().
 * Dropped local variables pv and dc from rzg2l_gpt_round_waveform_tohw().
 * Dropped blank line in rzg2l_gpt_round_waveform_tohw().
 * Moved assignment of rzg2l_gpt->period_ticks[ch] to *_write_waveform().
 * Restored clamping of duty_ticks with period_ticks in
   rzg2l_gpt_round_waveform_tohw().
 * Simplified rzg2l_gpt_write_waveform() using else if statement.
 * Dropped local variable gptr in rzg2l_gpt_write_waveform().
 * Moved mutex after early return in rzg2l_gpt_round_waveform_tohw().
 * Dropped extra parameter rzg2l_gpt from rzg2l_gpt_calculate_prescale()
   in rzg2l_gpt_round_waveform_tohw().
 * Updated comment in rzg2l_gpt_calculate_period_or_duty().
 * Updated rzg3e_gpt_calculate_prescale().
v4->v5:
 * Merged GPT linking POEG patch series here.
 * Dropped suspend/resume patch; will be added later.
 * Updated commit description for patches #2, #4, #5, and #6.
 * Replaced return type of rzg2l_gpt_poeg_init() from void to int and
   probe() check this return value.
 * Added more error checks in rzg2l_gpt_poeg_init().
 * Added a patch to drop the unused rzg2l_gpt_chip parameter from
   rzg2l_gpt_calculate_prescale().
 * Updated rzg2l_gpt_round_waveform_tohw() to initialize gtccr when the
   period of the second channel is smaller.
 * Replaced period_ticks with RZG2L_MAX_TICKS for the duty_ticks maximum
   value check in rzg2l_gpt_round_waveform_tohw().
v3->v4:
 * Added wave form callback conversion back to this patch series.
 * Updated rzg2l_gpt_is_ch_enabled() fit into 80-character limit for
   consistency with other functions.
 * Dropped field_{get,prep} as mainline now support it.
 * Updated commit description for patch#3
 * Retained RZG2L_GTCR_TPCS bit definitons
 * Replaced gtcr_tpcs_mask->gtcr_tpcs
 * Updated commit header and description for patch#4
 * Renamed prescale_pow_of_two_mult_factor->prescale_mult
 * Added RZG3E_GTCR_TPCS bit definition for RZ/G3E and added to
   rzg3e_data.
 * Added error checks on suspend() and device set to operational state
   on failure().
 * Added Rb tag from Geert for SoC dtsi.
 * Added SW_GPIO9_CAN1_STB check to gpt0 node.
v2->v3:
 * Added Rb tag from Rob for bindings patch
 * Dropped wave form callback conversion from this patch series as
   it is covered in another series[1]
 * Added suspend/resume support.
v1->v2:
 * Created separate document for RZ/G3E GPT.
 * Updated commit header and description for binding patch.
 * Added waveform callback conversion to this series.
 * Collected tag.
 * Added link to hardware manual
 * Updated limitation section in driver patch.

Biju Das (11):
  pwm: rzg2l-gpt: Fix period_ticks type from u32 to u64
  dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
  pwm: rzg2l-gpt: Add support for gpt linking with poeg
  pwm: rzg2l-gpt: Add missing newlines to dev_err_probe() messages
  pwm: rzg2l-gpt: Drop unused rzg2l_gpt_chip parameter from
    rzg2l_gpt_calculate_prescale()
  pwm: rzg2l-gpt: Convert to waveform callbacks
  pwm: rzg2l-gpt: Add info variable to struct rzg2l_gpt_chip
  pwm: rzg2l-gpt: Add prescale_mult variable to struct rzg2l_gpt_info
  pwm: rzg2l-gpt: Add calculate_prescale() callback to struct
    rzg2l_gpt_info
  dt-bindings: pwm: Document RZ/G3E GPT support
  pwm: rzg2l-gpt: Add RZ/G3E support

 .../bindings/pwm/renesas,rzg2l-gpt.yaml       |  23 ++
 .../bindings/pwm/renesas,rzg3e-gpt.yaml       | 323 +++++++++++++++
 drivers/pwm/pwm-rzg2l-gpt.c                   | 379 +++++++++++++-----
 3 files changed, 634 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml


base-commit: 5b5e33c44a491d5b5e019f527e028bd567a226fa
-- 
2.43.0

