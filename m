Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695235;
	b=bH0o94of3b2IOjxI/f2CzBBkSvPCLW5GR/EcForfoI/6ogG7J7J+A7+gDBYU3GpJy1Ss
	 +VNXZdOC7yQncsoSEfBWo1l45jT4TiNR3A9S5/pXl05mu5W/OhC2oq5siZUhWNRRpr+98
	 3uf7Tzx6Fyvokzw/YA1AvRinKQ8FVyvk31yQzEKyGWlTxR8gN+enrAVpn9hfJYHbGwukl
	 Xc4aRC4oYlA6H/p3JIH66OyIhU1bydVEytPoXSDGg8t1BzZSsUUh7wZdZUd2eaXdpHKMv
	 Qe6XOZXEuPVDsVG1wK9xrOeI0vdDcAEtFsyaAMrRBjURhQihr1QIM6ZDDo/TBtZj3CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=gKEeZqtZAu8+s0Ua1x2I8P/JLZraxDn6ha7UOnJcDMc=;
	b=sg1sv3ed7D/0SFVBo1Gdhut9/QGpCVCgAdld8EEulSwHhbXtm5DW0bw812XILukzD7ph
	 OxjBtuy/7vZQa20tfTDHpSFm5OK6Y4DCQeDt/vpiVKxl/Q+GrY4KtsLfdNrxPAjkoCu6o
	 T28gV4obmvYJXyQIjKn0Q2T9yo08mZaS3/FUP/DNc5nsrVnhExCEeD2HJupe/iniFj+Q1
	 /lXIbixcKHl1ET4ZoHpsHyYvLSoxWr+c7x44UzuYrudAhHFEaLzf9F2x0QeePUuo8jTmM
	 L9BS6dk6/VbFz0/fpfntWIvLH38ZqfGcUvTg+Y+/ssJPq+mhLCsTDTiPWI415V08Lrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8N8NxfK;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E969A606A954
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E969A606A954
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8N8NxfK
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6ddef424972so2826503eaf.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695234; x=1794300034; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gKEeZqtZAu8+s0Ua1x2I8P/JLZraxDn6ha7UOnJcDMc=;
        b=Z8N8NxfKe55ZfisRV2CtgbD6yovTTTG75ThMC1uRTU8S+zsUPDuQjpOZU5FtVmcI8x
         26zJ6B+PBaD4RSCDAASvYPR2yBYkPtLdLHmHMrd0+5OIOHvqmJ8MeuQeO562bhTbBEHJ
         5ChQsjlBUU/TDIcnf/Z8MksW0WaTb4XI2hOpMtlqQ29k0/bz1cBZxIVyhpkp2R5/Qjrz
         tmiF9SFI6x1YVrBG4e9+fHggOx9Cjd/wAJdB3aBE8ctpgWP708MLigr53S/17jrAVSwq
         qsDsr8LkGEM+381fJMBpJxRlbMw8pbDrpduq1rVR3DUlwspZ5tFGsC0TrWJppZo95EWM
         l5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695234; x=1794300034;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gKEeZqtZAu8+s0Ua1x2I8P/JLZraxDn6ha7UOnJcDMc=;
        b=KTAIiuxjlQsbaKofWhISYFsZ1wnq+KM1l9aVB0o/031lnq6veqAcm3xks/GoNSd67C
         yTAUiYLgTosQdi+WIaXuga8FExJagv3d8U6vDIhJfRY87Qpad3lv0HTMZfaLOs4IwEe3
         gy/MCUeXLnVT55KrznMgKRwxeQ3AbH8w90DiadlbDkqK7R2hjCcmr8jiVkpKK+7E6oMp
         uQeNHLJ4G4UTJQdF+10IPiB/8aM9YJ5G1pWEH+/OsjOk80tYlW44tk3wQq4F1HH/51W9
         pcTG7LQlk8YAZPJQfmIQydZl+Tb8FI0vzn5sWEcA71ZpTRk3dRqDajpcPe24TlwWkc7U
         I+Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzhJNv5sxRqCDzgf5eYt0eo/Vzd28LQKxBnKTzVQx23LhMHok7CzBoM5LeMkJXMsJPh/LTE7Qu5aWXd@vger.kernel.org
X-Gm-Message-State: APuU4Z/rc9lUmL5nJWGeWA6pwLHD3UTnY2i/biEMUu9DIElMG9IVol3U
	GfLmqlm+5dE3NVxvOtlsWCod3sX012hdmzwwJYkq0a9vog157wyQInW/FSzT8z8W
X-Gm-Gg: AYBFou0SQfw7zvST4QS1qosa7Yg4RGN6nfFOLpjnfiXLgXDzIN0b+b9oaVxa3t/V3zp
	e6uiDmXTOGBvRZj/2M3Ms0tycR1zAKKWAWAmKFpVXRQyb8gEGOWPZTXRsGinWNmaM5D2IqzBE3A
	xRVHW/a+9Te9x1+JwAzm1588xqy1jHxlJ2gWsNG8lHl6NMN+nt6i8gda38Zmbn7lzPvTEMhUB/H
	zDzdALDZfLMHIXQZ4b+vpm4wAVlgJNP1jzOE92Ymk+uF/a9Yp7p8UmQKaQyCXHjjSKu6aEPK2Jn
	xvzBK+yt28eyFFLvfKQG9X5mgq15aTLvkzS5C5sJYFxxYcyLKSVKsTHdNZZbZQJzIhubK9uLL7k
	BDy8GcMdoCTDpfbckeD7ZBF9gDx1sr4d1e0zoW3NKBRkinwwvAIIYR647y0RRfP5iXmKQcQxwik
	xWyTSgbsFNXTyDbnz5dipdg8eGCXEZphNouRx+PoZOKgqDWiMGJVDBXyvGjEuYuNS+CO4mC7Zud
	RHH07Za7Er2+P9Znb/Di52417lQBLixcL8FSt2bj6Yxd3TJVVSN95AJFvXcaIrQcG2NqfoW6sHv
	u3oWWHZWoSH7s/5/CIH7bgTBgqKb5OVbWkIsNoquTAAVTu5yDhPzT1Eah6uMiqgdy8MrTe0aNoX
	899K7KzYR2/+ZbZ1Jxyc/GDSl2ZhCMWzD2VjdnPxcGzIgch552yG7xJIeq8sPpDLWEeoaGg1RlO
	hjQbHAA0iT+0V9ZXZLEXHNpLGkQG2cBiNOJ//rn2aiotsdgCMxAY4=
X-Received: by 2002:a05:6820:4888:b0:70a:598b:12a9 with SMTP id 006d021491bc7-714f2a077b4mr6082560eaf.53.1793695233866;
        Tue, 03 Nov 2026 00:40:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v11 0/5] Introduce Allwinner H616 PWM controller
Date: Tue, 03 Nov 2026 01:40:25 -0700
Message-Id: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XSyWrDMBAG4FcJPldmFq095T1KD17kWKW2g+y4L
 SHvXjmlOMmhuCAQEvr+GSSds9HH4MfseXfOop/DGIY+LRCfdlnVFv3Bi1CnjYyANFhg0WrU4vj
 RidkKT1g4kgYccZbEMfomfF7jXl5/1uOpfPPVtEQsJ5o4dGJqoy/WVAOMighVjo6scgJFDKl4r
 POD74dTvS+HYXoPfV4N3RLShnEa4te16RmXYkuQQgKFAMQuR6WZFf+dtHQ40w1HA5YUyNwCkd6
 A+RdrQGJwzEQ5Mhm2bgOXK2dQ4NApl5NiYCM3cLVyiRoZJbp8uco0b+D6gctUNnENis0Gblb+v
 we8artqC/LuU6UBoi7ZFKXVJAu/P3RFeF+tW60jvLcuWTalrzQBNo16tAi3mO4xwlK5qnxZeiy
 KsrnVl8vlG6RM7EguAwAA
X-Change-ID: 20260803-h616-pwm-v8-e21a92470923
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

The H616 controller has six PWM outputs, paired as 0/1, 2/3 and 4/5.
Each pair shares a source mux, gate and power-of-two divider. Each channel
adds a prescaler and waveform generator, with a bypass for clock output.
The bypass can supply the input clock for the co-packaged AC200/AC300 PHY.

The series separates PWM waveform support and exported bypass clocks into
distinct patches. Internal CCF pair clocks model
the shared hardware, while PWM request/free and clock prepare/unprepare
arbitrate ownership of each output. Active PWM outputs and prepared bypass
clocks protect their shared rate against incompatible sibling requests.

Firmware-active outputs are preserved until a consumer changes them.
Hardware-enable checks protect their shared gate and rate even before
Linux has an owner for them; there is no driver-local unused-output sweep.
A conflicting shared-rate request is rejected while an inherited output
remains enabled. In particular, assigned-clock-rates cannot override an
incompatible firmware-active output. Firmware must leave a compatible
configuration or disable the conflicting outputs for that request to work.

The clock-provider interface reports the actual pair rate and makes rate
protection visible to CCF. In contrast, drivers/clk/clk-pwm.c advertises a
fixed frequency without checking the rounded PWM result: a 42 ns, 21 ns
request selects 24 MHz bypass when available, but can become 25 MHz when
a sibling holds the pair at 100 MHz. The direct provider still permits
CCF rounding; it does not guarantee that every requested rate is available.

The bounded TLA+ models and accompanying implementation checks are
available with their assumptions and limitations at:
https://github.com/jameshilliard/linux-h616-pwm-tla

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Assisted-by: Codex:gpt-5
---
Changes v10 -> v11:
  - rebase onto pwm/for-next at 9ad5602d4943
  - compare candidate waveforms before nanosecond rounding, retaining
    period-first ordering across pair rates and bypass half-cycles
  - protect the pair rate across waveform readback so an exported-clock
    consumer cannot mix a new register configuration with a stale rate
  - use the provider-owned handle for the temporary hold, separately from
    the PWM handles used to change the rate
  - Link to v10:
    https://patch.msgid.link/20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com

Changes v9 -> v10:
  - validate the single clock-specifier argument before reading its channel
    index (reported by Sashiko)
  - Link to v9:
    https://patch.msgid.link/20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com

Changes v8 -> v9:
  - split PWM waveform support and exported bypass-clock support into
    separate patches, retaining internal CCF pair clocks in the PWM patch
  - preserve unclaimed firmware outputs instead of stopping them at
    sync_state(); replace the empty disable_unused callback with
    CLK_IGNORE_UNUSED
  - embed the fixed six-channel topology in the pwm_chip allocation, remove
    single-variant match data, and use a channel-indexed clock lookup
  - store bypass clock state directly in each channel and recover the channel
    from its clk_hw without a separate wrapper
  - avoid module self-pinning by acquiring internal clock consumer handles
    only while a PWM is requested; use provider-owned handles for notifiers
    and rate readback
  - use scoped locking and protect rate_exclusive with the register lock,
    keeping CCF operations outside it; remove ownership WARN_ON_ONCE calls
  - explain unsupported pulse/dead-zone reads and rename the waveform
    conversion helper to match its callback
  - pre-encode waveform registers, isolate update preparation and rollback,
    combine candidate comparison/selection, and remove redundant rounding
    corrections and private waveform-field checks
  - normalize polarity readback, use ordinary boolean waveform flags, and
    remove the redundant bypass recalc_rate callback
  - clarify the clk-pwm rounding limitation and correct the v7 topology
    description
  - Link to v8:
    https://patch.msgid.link/20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com

Changes v7 -> v8:
  - require both the module and bus input clocks for H616
  - clear the complete two-bit clock-source selector field
  - leave rate and period registers untouched when disabling a channel
  - distinguish PWM-owned bypass signals from clock-owned bypass outputs
  - round shortest-period requests using the fastest achievable clock
  - encode constant levels without overflowing the 16-bit active-cycle field
  - require #clock-cells for the H616 clock provider  (reported by Sashiko)
  - allocate clock topology state per device, use the fixed two-parent map,
    and use managed clock registration
    (reported by Sashiko and suggested by Philipp)
  - deassert reset before registering clocks and keep the reset handle local
    (reported by Sashiko and suggested by Philipp)
  - arbitrate channel ownership in clock prepare/unprepare and select bypass
    only while the clock output is enabled  (reported by Sashiko)
  - roll back failed PWM requests and serialize channel release
    (reported by Sashiko)
  - protect the shared pair source while either sibling channel is active
    (reported by Sashiko)
  - preserve the 65536-tick duty intermediate before polarity conversion
    (reported by Sashiko)
  - keep the hardware-waveform state within the PWM core storage limit
  - clarify that either co-packaged AC200 or AC300 PHY uses the bypass clock
  - drop driver Tested-by tags after the clock implementation was reworked
  - quantize inverted waveforms in hardware ticks and report their
    physical offset
  - force released channels off so stale waveforms cannot restart with a
    sibling
  - track the active and pending cycle for the period-update handshake,
    adapt the sleep interval to bound MMIO polling on long periods, and
    honor the PCLK rate constraint
  - quiesce rate, polarity and bypass transitions before reprogramming the
    output
  - clear unsupported pulse mode when programming periodic waveforms
  - describe the bypass clock cells and simplify the fixed parent topology
  - avoid resetting active pair registers during probe
  - model only shared pair clocks in CCF and program per-channel dividers
    directly
  - make pair-rate changes transactional and hold exclusivity only while
    an output is active
  - implement formal waveform rounding across all parent, divider and
    bypass choices
  - preserve firmware-active outputs through generic unused-clock cleanup,
    stop any still-unclaimed channels at sync_state(), reconcile empty pair
    gates through CCF, and reject pair retuning while either output is
    active
  - clear dormant dead-zone state when both pair outputs are disabled,
    while rejecting active dead-zone and pulse modes which the PWM API
    cannot represent
  - correct the hardware topology to show the pair gate before div_m
  - Link to v7:
    https://patch.msgid.link/20260703152215.192859-1-richard.genoud@bootlin.com

Changes v6 -> v7:
  - Cc Common Clock Framework maintainers  (suggested by Uwe)
  - add missing static before SUN8I_PWM_X_BYPASS_GATE
  - reorder code in probe to fix potential lifecycle issues
  - set pwmcc_data[i].parent_names to NULL in sun8i_pwm_unregister_clk

Changes v5 -> v6:
  - remove trailing junk after the patch 4 commit message
  - remove Tested-by tags where they do not apply

Changes v4 -> v5:
  - fix bypass handling for channels greater than 1
  - add colons to clarify two debug messages
  - switch from H616 to sun8i prefixes in code, filenames and module names
  - fix consistency issues in macro parameters
  - rename confusing macros

Changes v3 -> v4:
  - gather Acked-by and Tested-by tags
  - fix a pointer-to-integer cast size warning on ARC
  - add a managed action for clk_hw_unregister_composite
    (suggested by Philipp)
  - remove the unused pwm_remove function  (suggested by Philipp)

Changes v2 -> v3:
  - use U32_MAX instead of defining UINT32_MAX
  - document U32_MAX usage in clk_round_rate()
  - define clk_table_div_m using macros
  - fix formatting
  - correct the parent clock order
  - simplify code using scoped_guard()
  - add a missing const qualifier and rename to_h616_pwm_chip() to
    h616_pwm_from_chip()
  - add missing error messages and remove redundant ones
  - rename cnt to period_ticks and duty_cnt to duty_ticks
  - fix PWM_PERIOD_MAX
  - add the remove callback
  - replace DIV_ROUND_CLOSEST_ULL with DIV_ROUND_UP_ULL
  - add H616 prefixes
  - protect _reg in macros
  - switch from apply/get_state to waveforms
  - shrink struct h616_pwm_channel

Changes v1 -> v2:
  - add missing headers
  - remove MODULE_ALIAS  (suggested by Krzysztof)
  - use the sun4i-pwm binding instead of adding a new one
    (suggested by Krzysztof)
  - retrieve parent clocks from the device tree
  - change num_parents to unsigned int

To: Uwe Kleine-König <ukleinek@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>
To: Richard Genoud <richard.genoud@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pwm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Richard Genoud (5):
      dt-bindings: pwm: allwinner: add h616 pwm compatible
      pwm: sun8i: Add H616 PWM support
      pwm: sun8i: export the bypass outputs as clocks
      arm64: dts: allwinner: h616: add PWM controller
      MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM driver

 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      |   33 +-
 MAINTAINERS                                        |    5 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   47 +
 drivers/pwm/Kconfig                                |   12 +
 drivers/pwm/Makefile                               |    1 +
 drivers/pwm/pwm-sun8i.c                            | 1317 ++++++++++++++++++++
 6 files changed, 1414 insertions(+), 1 deletion(-)
---
base-commit: 9ad5602d4943635ea2b3b73d1a720161f88da1a1
change-id: 20260803-h616-pwm-v8-e21a92470923

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

