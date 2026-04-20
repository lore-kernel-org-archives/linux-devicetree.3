Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723A3388E60
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681819; cv=none; b=LecpGh2qSgcHvHXKbNeUKfqyIbOXcz3L5OzCwrM06dXCt+Qi8HSIiKZyTYP94ZijC2MRBYFcZroMxOaDJIwd/H3/0T0oKcBJq3y69z8/pReWKkpClGP8RKtLQizVi5dH6B4FnbCv0U8h13LLOyoTPH83sWug6/SFIU56WhCC020=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681819; c=relaxed/simple;
	bh=6K3LBwKZtl/O5qux1dZKU/P19V+qTupizNtd2usjTr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYbFdjRGjG1vD+fRNjb2vNNiPcaY0fzxPVWl01AZMkkjvzz1zT4rgiUpwamvp9oyGDQ0pItRP3GhJVXVaUExeGqoSNqJB/7NGv8LYLqzMvuLGl3wOMGhThi3Nkjf/U3HaEqeKY8R2GGgAaItxJKazkweTgOilkupSEEGltb4pIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpYPIpNB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpYPIpNB"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fe608cb92so1879079f8f.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776681816; x=1777286616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r+YOFEVCA4Qb/vVfgbvY+5B7C1GS5CQEkyZ79MqsT48=;
        b=dpYPIpNBtVaMRlo374KMURJjoFUHHwvAvNPVqm5Z+ONcSFjKojQ9ZcI6KP1Ky5y9ta
         PjRN6rfPbOubK8YLfSPfO59XsTtMmSkC0cL9QFXQEs4kYOnF97hs3gUVDNYhm6PciAsQ
         PsUn6lxgucsKoeTgk4ozWmg/7hBNlKi47MH71pZ5Ak01c1w5ZjdpycG3KwUCYp3oLKr1
         ohXK8zwoHI100ilYA+oT5xFz+a1MBzxjXGKc+qSJd/gDH925ozHBu91/so2cZccUksh8
         LCQS6pVaOq8pmaRLSS9pu0gxLh9xYZUs58ML7iGVc4KX/9sNV7b9iBzBsI73uZLJEhKy
         32kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681816; x=1777286616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+YOFEVCA4Qb/vVfgbvY+5B7C1GS5CQEkyZ79MqsT48=;
        b=TxUlyLlOZdckY1Mra20EhaYhRzCzBObbdiBAmxHTHN+cOG/wL4pd72D1sUCAtCQXD/
         PUVMYwcIV1VcH5aIhr2T/nvIE0+3Bf1BX2KmNDeQyW/Kt05m5f1x6Hsssq4Pselcj/PZ
         g/lM3OH31BBQGIowuRrQ1RslmtarMFIFz9QujruN6AdVEU+KHS2FmJ/5JP/+9AHX+HK5
         TtNLQvDlGgyxk+08vuhp+43i7VqX2syySaCqi5Yoi+5X6o6dThRzTzbvpXy7OjQ6OCSX
         YLOBRr/sQxXIAUQr5+8vvfLMlyvvgIWwWZHuIhNdMCtGAkf86IcHRu8XzfVCOmOTiGpI
         +/FQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SsxBmT4l3Jh1CnWNCVFC+qZG0dOrF/1g6nuOJtr5TlCDN2ms5PgnCL6sjTEPrH993MVSGDH8Q4eMB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7jJFibbYjXlfqNXo5UvJzD1HyU0WUT7YEfjf3siA2KbGiyKqj
	AK9EPSJkA6q2KTyeIZ913yPl/2KZHra1VFhATw93h1Mi6HSrxONrVOKW
X-Gm-Gg: AeBDiet+haEP8jRa9zLebSSKL/kSG5nK10o5GpUwODjTkTdFJLReaEpKMb1sOMqnuWK
	H0I2hqW4fOHkYrdbItC5IuleZi2fCX+PXLRAPRU8SJRgJMwqqNdnGn9ziWmMqUj9WXgLcVZD/4/
	hsN6ELymx310YEuM6u1QKFdf8E/Mn9AbXCLnwbwu7cIsOt0mBygwSUdD6PlNBjunJVjSVuozW5F
	UeuOIwDj20tLk214LyZd/sGTEiUvr/hmhCxlEWP1bRfD+tqNjJYCqiZizQbmu0hCe7shqHaHoy0
	k2s5WgyRPMtXjfWVqujEujzTWhUpz6vauWt/nGdgibzUvZK2as/YJ8Ci7IogSbjGPwZVga+6A8T
	KqPH3xC+x0Z3Wu4hJuYxH7EpK3YlFytLpOEN/50P20HA4yNjyeqDhD6MyFPzrufndylbwjT1eI3
	ClbjuqHiB4RMz9vGhhbLn4YZojOXdA5CTDduU8YXh8OrnM6uxLSPi2/2Xgqdg=
X-Received: by 2002:a5d:5f92:0:b0:43d:71f4:7ed5 with SMTP id ffacd0b85a97d-43fe3dc54famr20093995f8f.17.1776681815619;
        Mon, 20 Apr 2026 03:43:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm28038301f8f.0.2026.04.20.03.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:43:35 -0700 (PDT)
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
Subject: [PATCH v5 0/9] Add Renesas RZ/G3E GPT support
Date: Mon, 20 Apr 2026 11:43:17 +0100
Message-ID: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
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

Patches 1-2 add DT binding documentation for the renesas,poegs property
(allowing GPT channels to be linked with POEG for output-disable) and
implement the corresponding driver support. This configures GTINTAD to
route output-disable requests to the correct POEG group and sets GTIOR
to tri-state both output pins on an output-disable event.

Patch 3 is a small cleanup removing an unused parameter from
rzg2l_gpt_calculate_prescale().

Patch 4 migrates the driver from the legacy .get_state/.apply ops to
the new waveform callback interface, introducing struct
rzg2l_gpt_waveform to hold the hardware configuration (gtpr, gtccr,
prescale) for a single channel.

Patches 5-7 introduce struct rzg2l_gpt_info to capture SoC-specific
hardware differences, adding fields for the GTCR prescaler mask
(gtcr_tpcs), the prescaler multiplier (prescale_mult), and a
calculate_prescale() function pointer. This cleanly abstracts the
per-SoC prescaler logic needed for RZ/G3E.

Patch 8 adds DT binding documentation for the RZ/G3E GPT
(renesas,r9a09g047-gpt), covering its 16-channel layout, 64 interrupts,
dual clocks and dual resets.

Patch 9 adds the RZ/G3E driver support itself, wiring up the new
rzg3e_data match entry with its own prescale calculation, prescaler
field mask, and prescale multiplier.

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
  dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
  pwm: rzg2l-gpt: Add support for gpt linking with poeg
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
 .../bindings/pwm/renesas,rzg3e-gpt.yaml       | 323 ++++++++++++++++
 drivers/pwm/pwm-rzg2l-gpt.c                   | 360 ++++++++++++++----
 3 files changed, 626 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml

-- 
2.43.0

