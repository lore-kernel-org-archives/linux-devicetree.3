Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E633C51A
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883676; cv=none; b=Ohkul1QnJpksUFtnP+oyLDkzKYkn0vw6Zh9puHUkwWIneWmZCZofjJuI+cfbsoe6QYtNXTPqxdmG/52z3AT2VNFbyiPOMeOR0gQk6+TGFEb+3UA6s/TW2Q0XGpi5iumwDJN1JQXu9DNWZ0yXNCKC4ESuasjHeU/uKDiK4zN1cSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883676; c=relaxed/simple;
	bh=MFHGdaWeQdwYwq1z/tlpFsZNA+Rvpo1qMjjaAD5jbE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BIkAwF9BQF9tE/+XK6MYVP1tVxgq6LzWXQTq9y6anJO29l4KbYnFRTbDTWOhYTRFBMMn0o2OHmjDblrzGsS1ymkh8CjgwuSc16qWudm54tgpL6XE5eeRYKIXNOcFWP1evg8jXUz7rN0c5BBDVk5nO5L5ls/1vWsNtbGhSVZnW8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ki3z1kQM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ki3z1kQM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so57766975e9.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774883673; x=1775488473; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rzFAZvt5pxx46xkdGuHqSP7rsRJaHifBLFVik5CnMGo=;
        b=ki3z1kQMPX84V+tmyq4x7sQxmawPYK3ea5jxO7XvMBLbSeb1X6z6MdkJDEcZIjGSR3
         lWkg+kStuU00JepQLPKZ0Pwle+2cPU/A9H9peylwNDfH+tLLZk6fCwZ01Vdi2vixnM8B
         gGIG+El9o6y3zzaPaaGoIav7Me/oEs3JqJ5a0DqEYBxE3X805dkY0/E0fOOFWoE5FXa8
         3p/63j+TlLexVS92tJEx9tF8G828ML+k/pcrWkY2xgNFz8ujmVGVvzkM5nZ3CCIDisF/
         ugoF8t7znF53tBZdZz/VITVIoS7o8uAKa32sYUskJ3aBcJic9J2EHX8Ok99Ck6480+fd
         JkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883673; x=1775488473;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzFAZvt5pxx46xkdGuHqSP7rsRJaHifBLFVik5CnMGo=;
        b=iNFjitqZEd0SE92fNRAseCFmdwRs/ewS7j8mB5b/sG8qCp60nvEhJY+wRIs95gS1vh
         idk4wK7P7YUsE6Ku7wbRDiexRzLbcCzLdGQddAyOK6aSEhmB93LO5QMwn20FW9nVc0/s
         2n8sq3+97I9Gtynh3uzOV6QxnAPyQ/Kj8MoyLN2zbmjYXTvZVfTcK7nu0TwbIMgJFPs6
         kk9eOL+uagB4dT18b7blR2O0qC1briUmzgvMbYVvfFEaH33TGBnKe4qbQECMNlcjGGxT
         NrlttCq/umZ7vt22A957/serCX4gS304eJLNGRxEeN1BOKuxglwjkJG7dxXmYYk0bqXb
         u8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCV3jPj5ycl9SKJl++PpVwyuroeirX2rDYM7ZMGjk8U32c6NzQ5txtegTj3XsAmQpT/fIIaSUfbQVptD@vger.kernel.org
X-Gm-Message-State: AOJu0YxbHIAVJY5llF3G/MNQh7raekSsBMbbL3ZcdeU+W9ttwemSfyDi
	0E9VJr5ch8/KJUO03Mi3D4IFlHJ6JE83/s/xlhVjPNKQu1/Krge/ebzlQMs3Z4UaiuY=
X-Gm-Gg: ATEYQzy/+s+FIGmplK6A467aIei2I0zFDgJxYj2WwBaWjNYE2W+aJiST83/Mk0ebUl0
	skz8iocO8XdrBU4nqBbW33TuIKytE2yS/sbcGt11AWxHmX6uZ6b5J/FFhkq9UzDPH4Nz5JCN+W2
	G3Ib0EbVJaEjoZFiqeu5qDsDEmeZH1Nq2QTnsP/XMF4Ad8zvA/PFu6BVmiMMun3c9KwtArY/Xo2
	RpHSMRJzwLRiBujbpCv4hWJQeExXaolc/C+aut3ZJ6yzeIn85aIBQbeBnxYcukQudkXrXgb9XU3
	8x6b9TMB6Eb5y1KjsPRMiEH1e3cAtibj8LVsUNJEcb/xPskVV2DsjoaykNJs7r0/ke6945f0CEz
	cKn5ybfAqruzPzV6s1vwzWOule+YAxBE/EIweSg1Xxs5MjFvgmcGGqmSXHfahgrW01fGeSvpH1e
	g9mI1gZqK8Yfp0PWN7qyQwFUoKmnheSjgIUqJqAyag7dRgm/UuDnKxbhqddgEY2cURCzyHPNQEU
	8D+6w==
X-Received: by 2002:a05:600c:8b88:b0:487:219e:416 with SMTP id 5b1f17b1804b1-48727d7f415mr214050575e9.8.1774883673527;
        Mon, 30 Mar 2026 08:14:33 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873cd7d039sm72764705e9.15.2026.03.30.08.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:14:33 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v5 0/2] Add support for Texas Instruments INA4230 power
 monitor
Date: Mon, 30 Mar 2026 19:14:14 +0400
Message-Id: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEaTymkC/2XMQQrCMBCF4auUrI3MTJLGuPIe4iJtpjYgbUlLU
 aR3N4pYxeUb5vvvYuQUeRT74i4Sz3GMfZeH2RSibn13ZhlD3oKASiB0MnZekwJptQfS4NCoIPL
 3kLiJ11fpeMq7jePUp9srPOPz+m6Q+TRmlCAdVRjY7TDo8tBc4jBw2nY8iWdlplUqoFVSlsZU2
 gV0gXz1L9WXRFilyhJKXylvbW0s/Ev9Jalcpc6yRlZINbjA9lcuy/IAJQby8E4BAAA=
X-Change-ID: 20260219-ina4230-74a02409153d
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7602; i=alchark@flipper.net;
 h=from:subject:message-id; bh=MFHGdaWeQdwYwq1z/tlpFsZNA+Rvpo1qMjjaAD5jbE0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSemuxv9PK95eSmM8n5SU8Yr834vs5lWuGZ5ywRS/L09
 sassuhh7ZjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCqaxcy/BV5NWPtAuOowO8fO50UN+1IjnOZ4XnhEKf0WY6KW++WyWoy/OFiK4q
 Yv+bOouk58fufRQi+jnqkxrjOznbB64P51fWcvYwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

TI INA4230 is a 4-channel power monitor with I2C interface, similar in
operation to INA3221 (3-channel) and INA219 (single-channel) but with
a different register layout, different alerting mechanism and slightly
different support for directly reading calculated current/power/energy
values (pre-multiplied by the device itself and needing only to be scaled
by the driver depending on its selected LSB unit values).

In this initial implementation, the driver supports reading voltage,
current, power and energy values, but does not yet support alerts, which
can be added separately if needed. Also the overflows during hardware
calculations are not yet handled, nor is the support for the device's
internal 32-bit energy counter reset.

An example device tree using this binding and driver is available at [1]
(not currently upstreamed, as the device in question is in engineering
phase and not yet publicly available)

[1] https://github.com/flipperdevices/flipper-linux-kernel/blob/flipper-devel/arch/arm64/boot/dts/rockchip/rk3576-flipper-one-rev-f0b0c1.dts

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v5:
- Reworded per-channel subnodes description in the binding for clarity (Sashiko)
- NB: Sashiko's suggestion to allow interrupts in the binding sounds premature,
  as the alerts mechanism is not implemented yet and there are no known users
  to test it. If anyone has hardware with the alert pins wired to an interrupt
  line - please shout and we can test/extend it together
- Avoid division by zero when setting the conversion time with all inputs
  disabled (Sashiko)
- Added the missed HWMON_I_ENABLE bits (Sashiko)
- Dropped extra sysfs attributes for reading/writing shunt values, as the
  implementation was potentially racy and it's unlikely anyone would resolder
  the shunts on a running system (Sashiko)
- Skip pm_runtime_put_noidle() for disabled (not just disconnected) channels
  in remove and probe error path to avoid refcount underflow (Sashiko)
- Mark CONFIG2 register as volatile, as the reset bits in it are self-clearing
- NB: Sashiko's inquiry about the update interval being underreported due to
  not accounting for the number of averaging samples: no, the hardware still
  reports updates after each channels * (vbus_ct + vsh_ct), but the reported
  value changes slowly due to the averaging
- NB: Sashiko's inquiry about regmap_noinc_read(): same as Guenter's AI
  feedback. No, it doesn't break the byte order, as it uses byte-sized reads
- NB: Sashiko's inquiry about potential falling of ina->reg_config1 out of sync
  with the hardware upon failed regmap_write() calls: yes, but it will be
  written at the next successful write call, so the worst that can happen is
  the averaging / conversion time can be wrong for a while. And it will return
  a failed status for the failed write call too, so no big deal.
- NB: Sashiko's inquiry about reg_config1 not being written out during probe:
  it is written out when the device is runtime-resumed as the refcount gets
  incremented during the probe function
- Link to v4: https://lore.kernel.org/r/20260326-ina4230-v4-0-c1e312c09de7@flipper.net

Changes in v4:
- Aligned the maximum value of ti,maximum-expected-current-microamp property
  in the binding with the one expected by the driver (Guenter Roeck)
  "2147A ought to be enough for anybody (c)"
- Actually requested the optional vs-supply regulator in the driver (Guenter Roeck)
- Program the ALERT_POL bit according to the value of ti,alert-polarity-active-high
  even though the alerts themselves are not yet implemented (Guenter Roeck)
- Added a check for manually disabled channels in the is_enabled() function to
  avoid reading invalid data from them (Guenter Roeck)
- Dropped support for the single-shot mode as its operation is not clearly
  documented in the datasheet and there is no pressing need to support it (Guenter Roeck)
- NB: AI feedback regarding regmap_noinc_read() producing incorrect byte order on LE
  hosts is incorrect, as its implementation does a byte-wise read and doesn't care
  about the regmap value width or endianness flags, so it produces a 4-byte output
  buffer in the same byte order as the device returns, which is BE in this case
- NB: AI feedback regarding fail-path pm_runtime_put_noidle() potentially being
  unbalanced if the probe loop failed early is technically correct but practically
  irrelevant, as the driver will simply fail to load, and the usage count won't
  decrease beyond zero anyway. The alternatives are cumbersome for no real benefit
- Link to v3: https://lore.kernel.org/r/20260310-ina4230-v3-0-06ab3a77c570@flipper.net

Changes in v3:
- Updated the description of the ti,maximum-expected-current-microamp property
  in the binding to clarify how it is used, and drop the irrelevant mention of
  the PMbus (Guenter Roeck)
- Use div64_u64() instead of do_div() for the final division in the calibration value
  calculation to avoid overflows in the denominator (Guenter Roeck)
- Avoid overflow while scaling the voltage values on 32-bit platforms (Guenter Roeck)
- Use regmap_noinc_read() instead of regmap_raw_read() for reading the energy values
  to ensure that the regmap / bus driver don't wander off to adjacent registers
  during the read operation (on INA4230 the whole 32 bits should be read from
  the same register offset) (Guenter Roeck)
- Remove redundant call to ina4230_set_calibration() in the current read path,
  as the calibration value is already set when enabling the channel and restored
  across PM changes via regcache_sync() (Guenter Roeck)
- Add missing write_enable() function to make hwmon_in_enable writes work as
  advertised in is_visible() (Guenter Roeck)
- Add a check for disabled channels before calling pm_runtime_put_noidle() on them
  to avoid refcount underflow due to imbalanced get_sync/put_noidle calls (Guenter Roeck)
- Dropped unused include of linux/debugfs.h
- Add missing return checks on regmap_write() calls
- uO -> uOhm in the error message to avoid confusion
- Move probe-time calibration after enabling runtime PM to avoid it being reverted
  by the PM sync
- Link to v2: https://lore.kernel.org/r/20260302-ina4230-v2-0-55b49d19d2ab@flipper.net

Changes in v2:
- Replace u64/u64 division with do_div() (kernel test robot)
- Add an example with ti,maximum-expected-current-microamp property in
  bindings (Krzysztof Kozlowski)
- Include the newly added binding in MAINTAINERS file (Krzysztof Kozlowski)
- Use dev_err_probe() where appropriate in the driver (Krzysztof Kozlowski)
- Switch to devm_regmap_field_bulk_alloc() instead of an open-coded loop
- Add a bounds check for the calculated calibration value,
  and a corresponding error message
- Link to v1: https://lore.kernel.org/r/20260225-ina4230-v1-0-92b1de981d46@flipper.net

---
Alexey Charkov (2):
      dt-bindings: hwmon: Add TI INA4230 4-channel I2C power monitor
      hwmon: Add support for TI INA4230 power monitor

 .../devicetree/bindings/hwmon/ti,ina4230.yaml      | 134 +++
 MAINTAINERS                                        |   7 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/ina4230.c                            | 986 +++++++++++++++++++++
 5 files changed, 1139 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260219-ina4230-74a02409153d

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

