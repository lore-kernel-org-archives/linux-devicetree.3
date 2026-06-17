Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1FD18BBAE
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781665173; cv=none; b=NAgK/TNxQzhrIWcLRfNQI6jxpsp82WERDuRVDcGWmQ1jvz9GXUUS5x8yaDSDVAEe1t4Y1fUGxaXZ5yhhhw890zzeEu35L0T1xfT6Un4PvDs25ITOVfwuhoDmHb7+GGQ/qmgyjzjgwRpDEx1RW/Plj55Y1eFKGWNMBwra/53jIIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781665173; c=relaxed/simple;
	bh=mkBhvigEenoV7hVsKrScF2k37dBKNOTTn+0E9rJ/vAY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tdo8HHcRmvXT7ei/zVPt1xhO3pupWfCQYNq1txEfP0AVaiu3ZhSFMfmSZ2Nm48fek+4kOn1SVb4NSy1K4bodNp11JWhUPmGvyuagD+ehKMjbnSnvqT45o0UeW+bpQ0MeEVVonCyDcjMCbrIEDL49QDAr0ZC3urmHnztxSKC8NuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNudawiI; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNudawiI"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-842307472d4so2010730b3a.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 19:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781665172; x=1782269972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TBin7H0Wt7Oi8P0z8wsZgQQjqhBwvW2vxMHjxdsEcyI=;
        b=hNudawiICVnvIJbq7BFPLhcs2D6VhH0mROmU56PWBB4gUjIg3/1cluK7wFZPmGQRAK
         jGRfq1tY+tPaBSw4s3ZTA6Oor3yjsMvtmpMdPiFRYW5jm2ZHx2ncGB1AhPaj2eAuy4aD
         M0YRGV0A/d6AKwWgEjp+HeduDSUCFsXfJFxQ7P+0/2YlfB2IjsZFX1BPBlhkwPB2A4dH
         e8hbybM0cHps52NsoDXs57jyFSQ6/bVjjSy9EJLMbTNsc7V4OOL14yaPN+ZmUYcPqhpL
         LiuGiv34FnQ9VTt8iPstP9kHMK9uRJAwEA7VJRrnVHb53RBZ1uSF2imQAwznLdfyAFSp
         m84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781665172; x=1782269972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBin7H0Wt7Oi8P0z8wsZgQQjqhBwvW2vxMHjxdsEcyI=;
        b=YxOh6qgvToTGN3yaSHJ0PshsauF97T9o4tVX++X8/suoGa2LpMH0Z4qjyqRcOSgirj
         bEQ1iV6N2gb5w1v1N2g/cHLZetye9gbeGmMg3O8FiJYTgjTOcv91AYw3TAiy4b3gqVHz
         YzFa5yBePWSPiJsKfk/Zz2Vvd4gQ7AXy58r02KGJeYmspRD1hekv7vQrKdEqD61OS1g1
         Vkm29BNyvnmiaPzsXIK++EXw2mi/N/Yk6GTdvk5M6h8xVjljeb8OwN3zNWlxjR9edaie
         c/ylesu/cOE08qpBoa/wRAnWXnQIdMW2jf9pSkcmsHu9ezh62eElkqp5s7aYNGzyN1+i
         dp4w==
X-Forwarded-Encrypted: i=1; AFNElJ+xtixmsXpTsulDaOVafInMhxAxvJwGFl3hvKqf7TpK40ZslryHrQOMwT9bX+IxXAK/xW8rhtNQsQSU@vger.kernel.org
X-Gm-Message-State: AOJu0YyXexo2bq9deDjYKlv8CHF0fVwfnuIelfaT2vD8+yrRxmUYy8bS
	hNM5aM/vLH5FyOLYrG7HzGwn+PGzbShqADiX0X5uzBAqte9d+yUTa49F
X-Gm-Gg: Acq92OGctBRcfijTUj4MQ7L5FJoom9bCy6IcY7UHDdbKTYfjKYB0DjGJF7Tfhc75R46
	jWpnw8EKSJLQ3+PjITvx7Ih3lrHrpCm7M4la2v5rMl806zVnk0h3ABpL6B1tBgkCrKKDlfFofeO
	YUZbd5cAXvAeAHpIK1PVroGz75jWt802CXYHzvdlRDyyeyUKYVsB0KXkqWuJViFioUI2TtoisOm
	SnRMWp+mMQOk5Ajq2ymLQ9e4JU6ndAq2L7hYxbGYbWz747Mul2gfFH8Sfx3xrv0dlN/SdXs0nZE
	n6s+BBvwX7uRkYcMb/TYcqNN0ePpNbfoQM7MlgjlUcoXtEhV4OX/tJNW5Wto7m8oN7ZTyMYaWtn
	z2+JO+ukLaNXJ+52RVQTldO7FoxkSCHlzNttBPxdkGGBai7hH0XoxpbJ6JxB0Y0HH6o1WW0/K3i
	ITeWvFKgoBxZZmKBn3Fi+efyOlTtN9xaHhVo1eGP/F86EGm2AEA6AOjU5s+6iEXbIt9bhcRuhDB
	IU=
X-Received: by 2002:a05:6a00:2987:b0:836:3f6a:3e7a with SMTP id d2e1a72fcca58-8452454cd35mr1655165b3a.26.1781665171696;
        Tue, 16 Jun 2026 19:59:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc825csm14212821b3a.36.2026.06.16.19.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:59:31 -0700 (PDT)
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
Subject: [PATCH v4 0/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Wed, 17 Jun 2026 10:59:23 +0800
Message-Id: <20260617025925.2539334-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds support for the Nuvoton MA35D1 PWM controller.

The MA35D1 PWM controller provides 6 PWM channels. The hardware supports
several counter types and output modes. This driver configures the controller
to use up-counting mode, auto-reload mode and independent output mode. The
waveform generator is configured to drive the output high at the zero point
and low at the compare-up point.

For the up-counting mode used by this driver, the counter counts from 0 to
PERIOD inclusive. Therefore, the programmed period is PERIOD + 1 cycles. The
hardware can generate 0% duty cycle with CMPDAT = 0 and 100% duty cycle with
CMPDAT > PERIOD. To keep 100% duty cycle representable, the driver limits the
maximum PERIOD value to 0xfffe and reserves CMPDAT = 0xffff for the full-duty
case.

The hardware buffers PERIOD and CMPDAT updates when IMMLDENn is disabled. The
driver keeps IMMLDENn disabled, so period and duty cycle updates take effect
at the end of the current period. Polarity and waveform-control changes are
applied directly and may cause transient output changes if the PWM is running.

When the PWM output is disabled by clearing POENn, the output pin is put into
tri-state according to the MA35D1 reference manual.

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
    - Increse "#pwm-cells" to 3
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
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ma35d1.c                      | 344 ++++++++++++++++++
 4 files changed, 399 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1

