Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369C041D127
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576136; cv=none; b=IrDwQk5zYEYUBEKRk87+N0OXswRiB6EE7JR/ZMV09jHfJ69fyKqL6dCdwU6xAi4kR0nXhFfaNES3xdDYB6QVP2hrjTbXEdFo2KVBmITTkTm0GprjXMTvi5KZwocewCzBC/sMbU23777WoXwQ1eUUG5yKQ8SrmQI4tNTl1r/cdkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576136; c=relaxed/simple;
	bh=oDQxqAZ/MFegtTTo3io2fPNAu4P0qICklONKgl7Gz7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDNKmhYdkeF9HPMzalGTKQyyN1OVxZwqJ73xbziVJz2YsnbEjNxjcfDzaWluLqF120arRX97Xl4gJVmkiXg/t7F6rra2TFZjz3z+S6iofaDpLAW99Hc3n5CAbPQGGoWEZ/n9aJZRW/vIAljUVtvSbfM2dm2ysaJJjt7GRtZ2FeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mocpuwda; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mocpuwda"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso483402866b.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576132; x=1788180932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAR5+9e9wgGWBAz4ZXWOeogWsdn7LcyNvWkJY/5ZCD0=;
        b=mocpuwdahEs9Ip4uxKr4lOvoZ7tW0VAUGHes9zVbqvCu0Jj8xlJifpv4Dh+8bod5pl
         9llIb74j+bI33H+cEp93s8/77u0jBvo+zV9e1X9++nTfPR98LhYwaXoEc5ptdwx7ne7w
         Mx6xi+4ad48QP/ZKijLeyzcpo11ODW3Z8jY8SEVDpSD+Yf7taY65WBjm2Z6DWpzOvg6G
         gYobZD0dHFnXPBl6rCm/KpXYeCTW2tEFZk1qecxEA3SrfXzp8Fa0IYR+xQoXJVko/XRt
         EkO8vhq85CsYdowy1SW2nSIEly/xFu28DQvv3/dWxUXp9Hw2YYFPY4Logn1DdowknHHN
         /AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576132; x=1788180932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAR5+9e9wgGWBAz4ZXWOeogWsdn7LcyNvWkJY/5ZCD0=;
        b=AtqA/oXk8/HyRPSMigGNXPE1uzqMqgZEmBCDp19XzKQDbJQR8/+f3DhGFlmeDMx2I/
         manVSGEEb8/BdixJ70qrHqgRexv5egkq51aa8s4JgL4d9TFf8DdzW8svGjphfoKjKieP
         mib/mmrusIyaMTOKocV9OqcuXcNCpxfzHx3jorVfWRVgMbQRvj9rMN9LMErx43Ft+/tI
         KlmLLKikw3zNYXBB4n/4IOdC8Lmqb/6dqStqGsgooxm87YTA8zdExO5GHvz+QHgGT1N/
         SIup5y8vJK4LjmuxubWMkcc8AgFeIT0k3v29zVspYdFrD80jYW0LO3s6OnAWOo6DVlaE
         4EwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpg1ojUm/a9uX4uPzokBVnKf9MhU69jr2ZuHDp6s1b6iCyp2+lnww0ookKBg7zyMx02RIU2M5zQqdef@vger.kernel.org
X-Gm-Message-State: AFuF++nk+SOlvNL9q7vXG9M3D++auQx1f7yZetF2sxCac41tEClVfwMG
	hpZ7i1uMJscy5jrzKaS22RDJC6DOnXpAgK1aPnndtsNU0KuyyXmcN2wi
X-Gm-Gg: AR+sD13JFdZDMcnQMUfUvUPk+5psit7eVrAUYda/BQRGDcCPBkBvYOmQ2fko9bj8jKJ
	gWvizV/CifqHkYnC2pIJ4/rvLwSVeZM1pOgzK0MYJDd+bRjW6MbNIb/sScmb9njE8pWCgIDFNO3
	YwQfVrgM0Bj/0QVEa7AGuULnK4R/E8P42jLD4FzNHULbwbPxXdsLoTEwQKul5Oq2Yn6aw4pcfBO
	KTWB442FSyO2ez3BoPD+DgIY1/qdWF6ycWbQKdD0L7BtS9lHG4XHrDr34TUzkYvlMDa71y+ocfv
	dSKhBc/zdvhPrhTsfW6dn9wzZMSLWEbKpTZVXTG//2TZvdU9f9CDF5BtW82BjcJzbB2eLjDmNZa
	RXqvTDVjyvuFSUJuSMLCi2n9CCeOzMzULkp0bcOSvfOCJMd5lhiwrusq/m2DmVMVcGGaZ9sx2dh
	sjnEqSBSBVXVmJq/9MjxfxYOuDAvKnHxmIvDd188RtMjBvOvs54M+ArABXtUPiIdGVOUiOAdUOj
	WwM+Sh460353w==
X-Received: by 2002:a17:907:e14b:10b0:c19:80cf:4c75 with SMTP id a640c23a62f3a-c246a6ab42dmr2489326766b.20.1787576132074;
        Mon, 24 Aug 2026 05:55:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:dea4:599b:49a8:96f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm1245403066b.39.2026.08.24.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:55:29 -0700 (PDT)
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
Subject: [PATCH v7 0/9] Add Renesas RZ/G3E GPT support
Date: Mon, 24 Aug 2026 13:55:06 +0100
Message-ID: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
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

v6->v7:
 * Reordered the patched moving POEG support to last.
 * Replaced USEC_PER_SEC->NSEC_PER_MSEC for period/duty cycle
   conversion.
 * Avoided recalculation of prescale, if is_small_second_period == true.
 * Moved `wfhw->gtccr = 0` into the if block in rzg2l_gpt_config().
 * Added rzg2l_gpt_poeg_link_channels() and used __free for deallocating
   device node pointer.
 * Replaced dev_err()->dev_err_probe() in rzg2l_gpt_poeg_link_channels().
 * Replaced local variable cells with num_poeg_pairs in
   rzg2l_gpt_poeg_init().
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

Biju Das (9):
  pwm: rzg2l-gpt: Fix macro used for period/duty cycle conversion
  pwm: rzg2l-gpt: Convert to waveform callbacks
  pwm: rzg2l-gpt: Add info variable to struct rzg2l_gpt_chip
  pwm: rzg2l-gpt: Add prescale_mult variable to struct rzg2l_gpt_info
  pwm: rzg2l-gpt: Add calculate_prescale() callback to struct
    rzg2l_gpt_info
  dt-bindings: pwm: Document RZ/G3E GPT support
  pwm: rzg2l-gpt: Add RZ/G3E support
  dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
  pwm: rzg2l-gpt: Add support for gpt linking with poeg

 .../bindings/pwm/renesas,rzg2l-gpt.yaml       |  23 ++
 .../bindings/pwm/renesas,rzg3e-gpt.yaml       | 323 +++++++++++++++
 drivers/pwm/pwm-rzg2l-gpt.c                   | 376 ++++++++++++++----
 3 files changed, 634 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml


base-commit: 17b4db6750cedbf4b22fa3895631465a5688cff0
-- 
2.43.0

