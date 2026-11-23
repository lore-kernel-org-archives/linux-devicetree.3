Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416655;
	b=1EPMWH87hVzM2jRU1u/gxYSAYGarD4JIGwSJftqrkMr7K8+oZgxBme65xGNvP2UnMgIx
	 QfvHx1G1lNXyzUzcZwlaojdIdaAbHSXmqXP9/SXmyqxL00E5rqGZp+BsZ94U/oHnGEkBU
	 sXVWAn+tu53BGhpVANz0rmO2q/iJWVz4RPqYLlPepiKsFKY7TWQzpoEd1b9U3GWEWnlKd
	 JKWdGt2ATp6tVD+g+cRU6sQSLoeLZ7KTff9gVwF7pk0RHIAohHlx5vmp/JKyeeIUEcfSZ
	 iCIZK+MoMPnNwG+4BU7t2+x0h5tbh0iEmMGbsuwZ+BK1x4z7soKeigpyANvlxMSk1Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RsghqF/m5W3+Sk6FDMeWBFDKibQsse7a2Bj9+KgEx1c=;
	b=k5Fe71kvNc/f1FG68ytbEf2XHcEH44Iw4UIY8o+UMX95yiZ3pF5Q5HJbVb7dcXIIYfn/
	 Iz6URx9sB4+HrSj8Wyowt7oLHJH5XMuSwDhfb+Pn7eNv/IgBIdMMUWOJ17VnawdmbOPS6
	 iqghdLwM50Y87g4h1lf5ZGvw+67ozLbj/m3SBa4giMbue7iIXWrzSKR+wHwjfmX8YCMnw
	 7F9efxNxkhXhUS6J9vVdV2ESbHVMS3zwb0CGb2q47aIM/K/tvwjiFdoKvnNwbD2gYkQD7
	 XLcn2fc7jRcQ6xgfRZtjPdnvmQEn5xmgBx/565/NI8EOBnDAS8rq8bNV92pIa8CEqNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OEE72Kfd;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F298A606A331
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F298A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OEE72Kfd
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b413997581so2461304a91.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416654; x=1796021454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RsghqF/m5W3+Sk6FDMeWBFDKibQsse7a2Bj9+KgEx1c=;
        b=OEE72Kfd+Obfg8FU0f9Bf+u8OMdyF8baJf2O5azWAUnPrPx7XI3CPaz1RAVW2h/vza
         6Kd+aRUE3Sa3hJVDYGhr+tLFcd9Z9jC37/g6rrluW3PSOPQvMkYAmmEdAsHdS73c9DFK
         eZj9eElKxaMZh8zBzNgD7zKAcwDb2hjLqWVvir52pqyhk9oWpPmuVD5vZ1gryD7Ow8Ve
         1at8ctTxVFINOIwitHXCv58Py0mcgn/Sjh0eJv2ly8NQmpI8jWa3146YYA9s4Z3JGI1X
         TeGDdvV0Sue9L20dz0aEW5w7wtFbekF3wJnkaCKEX8XDrAkzQVHw2SMhODtnCHW4npzb
         QOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416654; x=1796021454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsghqF/m5W3+Sk6FDMeWBFDKibQsse7a2Bj9+KgEx1c=;
        b=VlSbZF3Sj4LRDEwcSstNwH7YE/X0hKTbQXeLstww2hSUKkKN2oK9BQAAw/sbAHs+0C
         BLS0njRQ0r1EJGtZ6nP2NvfZZWWxqoSUrzUnJ1xEi+s98xcnwhfVxMqwNrpR3kL/GQFO
         jryedwuPKN26bahPWa7ZGG17JdAOQuug3kC3jUcIZ79WVUaX2P/qmpHFhrTZWsO90hCC
         YZIMpqGcZLVAtfY3+84gn9UvGP3d7IWN2fDRK85D97QYRgq9ittfW04haKh6zOJQmAnY
         bnBsKvYA46YLcyOUi0IP4VJ0GOy1/7sbzULEBqCkY7B6y54MSCPtGJPomjea355D93jR
         6wBw==
X-Forwarded-Encrypted: i=1; AL+hErFbdL3+KGfMNkNmJomsdDTamKYVGoTEkvsrrEum1H3e8JBh1GvUD4bFLQJjfLo6yHVg6UeWImjDUwVK@vger.kernel.org
X-Gm-Message-State: APuU4Z9j6D/Mq9b+JfjYnhm5frl4eO4N2me3WCf39jP+RmohEh1rjOCR
	9Y9nWcoJh76P4sAGzYXcfwOIs7soOSeiP0mH7/ufYjMMDnw/diDQk51T
X-Gm-Gg: AZFdTZdBsUFvMXiak+1pf90brDnYcw/00/d8D4fWJ5/WR6TqjE/xg3i8hfAscbxocwb
	e+UWk78JZGVCiqHaCZL5bUlMbwW4U9po59MJHvlCLEAHvXgmNL2S6Gyn4hUZiVfEvfYKkxKiW+l
	ZJJYwz1sFplqR8mL9k7fpLhPDkHS0s5LKvHhXrQ/ikAvJSRCGz06tQHrMe5+kKGJIlypSLwW9+Q
	P9VYSFo5D8rRTDcQjcz+NmjkkgaORL0nO2DynxBkros2946X1QHWURJvIfTt9/HyN/5xgygqnm7
	/wC8D3vleEuOAmFNeBxsFx3IKDQehEArDMLbT12Vlz4DIVdQwWjNavrYSzuHm3/4fgaY0fHToyz
	b8aLVA/Cbfy6IT/KuBhIBifEuV8CDmFhuNVLeTxVwMD56XDOD9/RCHUxtPlvNy/PBPg/8DrNzE9
	IceHujymyn1SP6os065iZHzB0OXYgLy4YOmUEROdoWypB2pIXTcaU8GWUtC2cf4LKACuo0eHfCw
	9KmL7B/VansAhUFl3CziTBjmCjlJjCIPwEgsFsk0IVKHszzgTz1S2kTKqf1BipeEMUJvhIFu8gs
	3YzrN6XaatAybLpamxhzyw3Lhu/nTk6PSF9iWK4L4iVOca6mtHNPa8gyO/jPy39ks7d6aog6Vit
	pAwsttdszCsQwiJM=
X-Received: by 2002:a17:90b:55d0:b0:3b0:92be:ea4a with SMTP id 98e67ed59e1d1-3b41c9830demr9484321a91.45.1795416654083;
        Sun, 22 Nov 2026 22:50:54 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm5224811a91.9.2026.11.22.22.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:50:53 -0800 (PST)
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
Subject: [PATCH v7 0/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Mon, 23 Nov 2026 14:50:04 +0800
Message-Id: <20261123065006.28768-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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

Changes in v7:
- Rename register macros to match the EPWM register names in the
  reference manual.
- Rename bitfield macros to use the corresponding register name
  as a prefix.
- Rename CNTTYPE and related CTL1 field macros to match the reference
  manual naming.
- Keep short register update calls on a single line.
- No functional changes.

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

 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      |  45 +++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ma35d1.c                      | 382 ++++++++++++++++++
 4 files changed, 438 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1

