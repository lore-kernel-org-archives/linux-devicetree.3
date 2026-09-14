Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390693B05AC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384068; cv=none; b=DrBMFpD99yVc2yEW/42oDJSkPnkuDK2MFtAeI7O5LH1zNGmDY1DFIAfTmQKFyVE0tDSs1xAfq4+wvFw44zQ4oGsEkFaJeB+W40acntk3TpFby9BBYI6tZmXlRWfhm/sE98/UjkyvYkkIPFr2TnqrJ5ZwmBucqiJdLtFT3Ukmmoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384068; c=relaxed/simple;
	bh=YIudiDYLGNoj4A9NVU9BgVrqbtIsGKctNV+f7EjqLi8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JP4FY0JRMYWDaY/nO9okt4uL90HmierDZaBuCkzl9XlpouzW5RohQxMVVKD/u0HZ1a/jRxrG5j+dAId0l2DRo12g3mMajxHbu4NWxbFMH72SuBgaaCSKipPa0zly1FFmcBtIatiy4pBGVwcqKGLdU5liyPWcmTY8WABlE9xCHt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7uz9Dfk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7uz9Dfk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398a5aad413so3038821a91.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789384066; x=1789988866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GG9giMI29wn3x6W3uRNMni+msBraAtSxPD+uXArV1c=;
        b=Q7uz9Dfk5UuW+4gSJf0nEBBfxuQE8I5bI2X83L4XfI8CTrwiDuBfa+aiWZbx3/Qsmc
         UzQPAaA82g0jJXKlR2IAYfGNmjZMRd8ovtaYFHdBV4GUMxziJAxh4avsQd4nSuMx/BS6
         TLJEjnv6mNBraiNIo6lkT8rfGpnP8D1sgK0eB4Udjgn7Y8zNDNsPZ3nxrt+awhvkhzVD
         22WXky3fU1/XHyJ4pamaZpzDpuGvEhwsnjM+wk49q+kstTDgZ+bT15+oDGEgFBqXxZz6
         ZpX6T1bX5i1YTLUrEx9ivqdqCyL7zwRTrhR6X7aGXZ1r4RwiaRfwRmPcPv1Ud9dwjNUC
         SLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384066; x=1789988866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GG9giMI29wn3x6W3uRNMni+msBraAtSxPD+uXArV1c=;
        b=A5+si74JsAxUojslKtqTyEeNu3fsoEcJWAdG7mcT331l1O5AjKI1gpBdBBeDfPTWoI
         PyazaiF/tkYgsfZmB+0ALwplbWkzrjZpwiwK3YiRulKq5hpfg2nca8J1nXU1CWUNkgTc
         K+tuPhzTRw1QMUULLbwul6AI+dIg6AH9DPkSVLQtDI4zs7G9C+8qWQCpQ7BsYLLMSCax
         kuOgLrOiCDvJ1NYXFqqFLCCG6q9bnOd//le/D977xuMv35n/IM65v5n2T22zn0eB1N9t
         alrSaiZasxAIwSQBw1J513/uqIkf0DtKt82mkCW0XdT5gtcCVKYGCbngCOuQOe9gPtO1
         m5FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzAl8dfTsllHMvM8UDnyDH4BYXgDey0ge2VqW7rK0TdJmBZXwh6pBfXmLqhqAhLt71U5O/mX/nPhF7@vger.kernel.org
X-Gm-Message-State: AFuF++lQI09sSo1wDjiLqfq6B4wmtF8szvFsFX4ppC6qAoBxLyd2L07u
	7nkLaFR7BjzyxqgY/H+AswgjEfSQSWcU1jAXSooafK8RACBuKoXp80xy
X-Gm-Gg: AYBFou2zSjx+gHG53jitmfrzxftVoEgcuwZUb0VQDEFICvr+N1+gWjHKzOxFVsnRkBA
	BFpH8+GNCAqU12y9fSyw7Tz18F4HbLKKRo9XIUuL+Jw46s0ptLIANLPsnwV2ii5zAtD5tslZlO0
	t5rzupZLbIcIBhtF+N1Qo1WWkMw525N7gWVZbmosBpPkRgB9RCrlvixg/WeSmOY0ebnhyd/ZIB9
	Uv76j1Jne/NKGCBq6RrpFwroUFpH0htlfIKQuSDq/OeDMXWfL3SffZeESsr88OBDz5AWo2wQJ51
	H7fnuuhEm1Bq8Q6iRypUbybb2a5n9gNqJNyvuZ9cSBOLblZceTXwqsaUXITwWCmBFHysvGou84x
	Q/uuBiB2Q+V2E8aWxPoDZvf37BdfH/OXebt3OseKxGEwFrWSMNHifnA6uL17g6nCbczaOh0oDId
	oqaWtLMvWuXt8GqCWgUHzK+bTTnC4F8ouwG5tmjpBqxXlPV9BH8dj3mTA1xTGdX/Qb0yRS33Jr+
	suievBUPLMXi44o9bCM9LQBjIRbkl35nGoSKWne9U4T2KjM5a/5rbrX7NFw
X-Received: by 2002:a17:90b:288a:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39debfc0f51mr4690532a91.8.1789384066403;
        Mon, 14 Sep 2026 04:07:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9540fd76sm22996627a91.9.2026.09.14.04.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:07:45 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v6 0/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Mon, 14 Sep 2026 19:07:37 +0800
Message-Id: <20260914110739.203479-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds the device tree binding and PWM framework driver for the
Nuvoton MA35D1 EPWM controller.

The MA35D1 EPWM controller provides 6 PWM channels. The hardware supports
up, down and up-down counter types, auto-reload and one-shot modes, and
independent and complementary output modes.

The initial driver supports independent output mode only and configures a
channel for up-counting and auto-reload operation when an explicit .apply()
request is made. The waveform generator drives the output high at the zero
point and low at the compare-up point.

In up-counting mode, the counter counts from 0 to PERIOD inclusive. With
the selected waveform actions, CMPDAT = 0 generates a 0% duty cycle and
CMPDAT > PERIOD generates a 100% duty cycle. The driver keeps PERIOD one
count below the 16-bit field maximum so that CMPDAT can be programmed
greater than PERIOD for the full-duty case.

PERIOD and CMPDAT use the hardware period-loading buffers. Since the two
registers are written separately, if a period boundary occurs between the
writes, one transitional cycle can use the new PERIOD value with the
previous CMPDAT value. The following period then uses both new values.

The driver selects period loading mode by clearing IMMLDENn, WINLDENn and
CTRLDn. When a PWM is disabled, POENn and CNTENn are cleared. Clearing
POENn disables the output driver and puts the output pin into high
impedance.

The driver does not modify the PWM controller during probe. This preserves
PWM outputs that may have been configured and enabled by firmware, such as
a display backlight. The counter and waveform configuration is changed
only for the channel passed to .apply().

Since the independent/complementary mode selection is shared by each pair
of channels, the driver refuses to change an active complementary pair to
independent mode when the paired channel is active.

Changes in v6:
- Document that clearing POENn disables the output driver and puts the
  output pin into high impedance.
- Document that a period boundary between the PERIOD and CMPDAT writes can
  result in one transitional cycle using the new period with the previous
  duty cycle.
- No functional changes.

Changes in v5:
- Remove the probe-time controller initialization to preserve PWM outputs
  configured by firmware.
- Configure the counter and waveform settings only for the channel passed to
  .apply().
- Keep the disable path limited to clearing POENn and CNTENn.
- Check for an active paired channel before changing a complementary pair to
  independent mode.
- Return -EBUSY when changing the shared output mode would disturb an active
  paired channel.
- Document that the initial driver supports independent output mode only.
- Remove the unnecessary <linux/mod_devicetable.h> include.
- Simplify the WGCTL action field handling and remove the associated static
  inline mask helpers.
- Rename the PWM field and period limits to clarify their different
  semantics.
- Configure period loading mode explicitly in .apply().
- Preserve the pair-shared clock prescaler and account for it in period and
  duty-cycle calculations.
- Limit the period to 0xffff counter cycles while reserving CMPDAT = 0xffff
  for the full-duty case.

Changes in v4:
- Add a Limitations section to describe the hardware capabilities and driver
  limitations.
- Add a link to the MA35D1 reference manual.
- Replace register address macros containing the base pointer with register
  offset macros.
- Add readl/writel/rmw helper functions.
- Rename TOTAL_CHANNELS to NUM_CHANNELS.
- Use unsigned long for the cached clock rate.
- Use devm_clk_rate_exclusive_get().
- Configure polarity before enabling the counter and output.
- Add controller initialization for up-counting, auto-reload and independent
  output mode.
- Configure the waveform generator for zero-point-high and compare-up-low
  output.
- Fix the period conversion because the hardware period is PERIOD + 1 cycles.
- Limit the maximum PERIOD value to 0xfffe so that CMPDAT = 0xffff can be used
  to generate 100% duty cycle.
- Use CNTEN and POEN bits to report the enabled state in .get_state().
- Disable the PWM by clearing POENn and CNTENn.
- Fix error message capitalization and trailing newlines.
- Fix coding style issues reported by review/checkpatch-style tools.

Changes in v3:
- Update nuvoton,ma35d1-pwm.yaml:
  - Add maintainers entry.
  - Increase "#pwm-cells" to 3.
- Update the MA35D1 PWM driver:
  - Organize include headers and macro definitions.
  - Rename REG_PWM_XXXX macros to MA35D1_REG_PWM_XXXX.
  - Add register address macros.

v2 resend:
- Remove incorrect Reviewed-by tags.

Changes in v2:
- Update nuvoton,ma35d1-pwm.yaml:
  - Fix maxItems of reg to 1.
  - Remove unused label.
- Update the MA35D1 PWM driver:
  - Remove MODULE_ALIAS().
  - Add chip->atomic = true.

Chi-Wen Weng (2):
  dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
  pwm: Add Nuvoton MA35D1 PWM controller support

 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml |  45 +++
 drivers/pwm/Kconfig                                            |  10 +
 drivers/pwm/Makefile                                           |   1 +
 drivers/pwm/pwm-ma35d1.c                                       | 387 +++++++++++++++++++++
 4 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1
