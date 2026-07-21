Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ACE2FF669
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784614998; cv=none; b=tVZmjiP1Z4E+mZFUuXErB4dy8Q389L/8njGu0L18LvMSJtWLo3obKaFYTQ1C1dd54Z9TCxADi/M7y/PzakTVmeNRjr3KVW1uwB0Hp3igbm43sArKmFc1FWM/KNuvFFiKbjLM/f2eedYqal4MPgtxVAe8QZMder7+QarnX6duWdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784614998; c=relaxed/simple;
	bh=jw2fmcByImpViBLWkKH+AnJV7BNqFs3aRwU2KR26HKc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VryT+oFl5jm6ncz+ReOfz/4c4tA0oMcI/zRwVE0kVaAf9zZ8afShJhQaFdHyT1DBLr0qYvv5MC1Zl7Bd0WC8xMyE/7Nn+h4ThTVQThIgWME3HNsLuRxCFCJDfiP5JXe8nxINa1IYv3m6rL2IPkRtAB/P5ZXTZWOO0L5NFN1Njp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1OSpZt9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1OSpZt9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so6017450b3a.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784614996; x=1785219796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TaN2NTDmPgA7xbWSLdWhOHnIhSnNjTOIfLYsD08nTAI=;
        b=I1OSpZt9heMlqrqbD8w0Pw+2rJ0KJuzq3i4otZojWqQN/gWBcBlyIgaCw+HrhunzIy
         uHQ2a7Lyqdf1pjid8ytbmDiLYlxx2EYN1HLW/LndVWWQL/d+XRW/J7htEIIDjen5WnyZ
         CUpt6l8Fp+FfOgvo78W4M2HtckuzMpxrFsEAIy+dzuP7vWuc2kDOBsgbEsMkacwlpSgU
         hEhXmAwJ36hSl+vMWBpqEz8DACGZxoewngKsTtmuGbOYMFSPpXw8p3bTN0/I3LJXu27S
         6IJcYxhYiN7XAko45B8uLSmYHcN6w4huqqBSCuNkvMnRCKVjUgHCNcYcyfXQ8zHdbE/1
         GWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784614996; x=1785219796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TaN2NTDmPgA7xbWSLdWhOHnIhSnNjTOIfLYsD08nTAI=;
        b=JuWfK8YzYxulrOYU3lWw/NvFV+mEkHa5Mh2KL/liynX/vOJr1cusoZtSaxVDo7gBvm
         8Q9Y9EGZI0sxX2PW6QZW/wYpmSVR053fTX75s8T2E62QIc0r+YE9uNRhvR965utyoHyl
         bM2Pkz3JUrtO8E05/yycFzNcD+uuNEhf0JN4DVpkGZ0FjrzCdiA/LPg8yJMoawbwy94s
         jQhLLa1XG8KzFnY/q3UUVzuDx+9f+na6eX1xU9qlLxeQVKUHHT22+tURB8MbMyKfpUg2
         mhG8z9EfV33G3SvLZtBw4RsnUOt/Qh2T4/shN/ewgXZof2xErVzXxFyzIhEMENfzxTmo
         Vo5g==
X-Forwarded-Encrypted: i=1; AHgh+Rqc88mL7TT/lT/OUYw4K4madA0BHD7s5JcsA+yUejxLYxud9urNw/8jIjgj+l2p66wbzljw29b6ZG1x@vger.kernel.org
X-Gm-Message-State: AOJu0YyEB/zdmlBZMAw2X93uT7+carHTsYvV8hJ0m8hCIewrmSsaqw4u
	uh+eqgB4gASSbWK8G/XepzcpHIMHgC51pg8Q7QUcmzx3TijtYCeEpGxf
X-Gm-Gg: AR+sD13ZSrm2yx/gqQh+5tPgv/0w5Yeaf0qBCr2hFeFgl7+pxX7Fy2a7A+KirUnCQgL
	JYy92YhZouAmxry7NAwDdppyeFrLZdmZ50b5KsIc8dSVjr0ceUt4E4w1lVztsIFgMxYHyTyyC2X
	DJYn2OX3O41YA3ofyYSv7aInJwp2IM9kWbAHHBGimt0KB4r95b+8szv5lLN2NWJMztjpb+kZWn7
	yr6U21H8XmKshC9vERxyiVSKdTjh4aCG7AGqXH3yBszkJif8sghuT/aFHjfeYvQHVdS7NYkYAcQ
	V7ljOJEJZmBPJ27+JPL58/vLzKwR4kyErELZ9A8eRxKiDNKITdKOScBH73c+cg2b6P8RWgyP3Fp
	8JtZf9Ho4v61BoiViQgSJhAhBLb70ckqR6dnff6bY5D4FfIWII1t+DGIImc7EdKI62xG76iVc66
	qSSkGnR5Xr7+jdBnEKJbImLvrkVGEef70J6DslvwspqNep8vEM+6saEnnmu8gKIfML
X-Received: by 2002:a05:6a00:228f:b0:845:3fe5:cddd with SMTP id d2e1a72fcca58-84c29501125mr17502562b3a.36.1784614995643;
        Mon, 20 Jul 2026 23:23:15 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c4b640050sm4020710b3a.45.2026.07.20.23.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:23:14 -0700 (PDT)
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
Subject: [PATCH v5 0/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Tue, 21 Jul 2026 14:23:06 +0800
Message-Id: <20260721062308.536947-1-cwweng.linux@gmail.com>
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

PERIOD and CMPDAT updates are buffered by the hardware and take effect at 
the end of the current period because the driver selects period loading 
mode by clearing IMMLDENn,WINLDENn and CTRLDn. When a PWM is disabled,
POENn and CNTENn are cleared, and the output pin is put into tri-state.

The driver does not modify the PWM controller during probe. This preserves
PWM outputs that may have been configured and enabled by firmware, such as
a display backlight. The counter and waveform configuration is changed
only for the channel passed to .apply().

Since the independent/complementary mode selection is shared by each pair
of channels, the driver refuses to change an active complementary pair to
independent mode when the paired channel is already enabled.

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
  - Update nuvoton,ma35d1-pwm.yaml
    - Add maintainers entry
    - Increase "#pwm-cells" to 3
    - Update ma35d1 pwm driver
    - Make include header and macros definitions organized alphabetically
    - Rename macros REG_PWM_XXXX to MA35D1_REG_PWM_XXXX
    - Add macros for register address

v2 resend:
  - Remove wrong 'Reviewed-by' tags.

Changes in v2:
  - Update nuvoton,ma35d1-pwm.yaml
    - Fix 'maxItems' of 'reg' to 1.
    - Remove unused label
  - Update ma35d1 pwm driver
    - Remove MODULE_ALIAS()
    - Add chip->atomic = true

Chi-Wen Weng (2):
  dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
  pwm: Add Nuvoton MA35D1 PWM controller support

 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      |  45 +++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ma35d1.c                      | 380 ++++++++++++++++++
 4 files changed, 436 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1

