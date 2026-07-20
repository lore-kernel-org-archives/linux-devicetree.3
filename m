Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63CB33893D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546448; cv=none; b=eaBQynWN67mbEBIUqUkF6gP5hwZd3RXXhs2sC1fEVXZsHikaMDRvMQSZ3Ug0ESgHBvh6aWxczBhhtoG/wyn0MX9MdhcH8Qdsr+YYJae834mO7eI7r5ScvxwojbG/aJZxqMenwQ5GxheK9aM5TVRJAm6LwdnhX+jI2/u2LBPeUrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546448; c=relaxed/simple;
	bh=7hXfXp2iPFfLdpPOmtt4ta2acd7kzImYjUePoMQPBqI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GFxJnX2rPGNyfrESD7USEHWENMRMVWzsXDpyZhD7FRVf5NZ+YbgPl2GU1HozftjK1gpH8IJVfXFqDnsoQyeYapYTtEHKTruUrwcTYTL6YM6a0zEkygSYPbEiBxbpiyhElsxHTwN6+lUrcQ/j9gu7Jz788Z98fyXGYegn4sj8Ovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Hmzx5v0f; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Hmzx5v0f"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f6609c657so969635f8f.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784546443; x=1785151243; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UFzDthWZuD0wGEOvKbHxesSYNKOS0nLI5fec6P9r/QE=;
        b=Hmzx5v0fDY+hNr1vTWbXlugpSGlhjJdPPbTNU7GLHs0PzsBYPnzBwo/Vta1uCmAL8J
         CjVVEXJ3UPyJXCk+J8bJn6InBNN11jy2THG/0Mv/OQKIO7vR2ajqhwmwzSYSwNER++4A
         +gwy7GLznMSBZ59159O/1ojQVx4VJLA4pd1Azl03FR/pbPgIewrsLnD8W8OZtLpqM8zB
         tkQT4nigrKgaaAvsENjsvxe2RuHOBaUpJSf2H4z0UR6OCSCoqjv1AhnwKxH3Z5HhRTva
         Pqnzr3iv+0S89VbbGF6ygiLHKshlzpbwtIq4M2ODC44OopX9oD2x2QOWoRRnrQmXjn+P
         Tl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546443; x=1785151243;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UFzDthWZuD0wGEOvKbHxesSYNKOS0nLI5fec6P9r/QE=;
        b=TCexmH+K1fzjFbqhqhIJI+eGUkmB2vKomM7RJvP/MTjR522SglCW/Qa+A079hbRDTH
         bfaGAuWq8Yf+wOFStkFPIrnPIs9MAZYJF4bW8LI2RJJDnkrpUTuMqgBlAn8KU0ZYrjbQ
         uhBq18Jb9eTomVeo7vnv5cFF1n4YrRlP+u/6HWSjp4vyYFarc7x/tnKb8Nz+ohRqOq1J
         Dvf9VD5wEUcBPv/rmputGU/l7XzfPgLceoI6HdB7XY73RAqrOgQr8t7haWFOfoUrOu8F
         88OqoOXcefuBjNJfwb50f9NKeqDCsiMrdqLXuGDebxqa341BlRccyqjvT39J54fwjwwY
         MfRg==
X-Gm-Message-State: AOJu0YwTXyJxswsGgjok4+nLPm7vP+xcGQV7odgbvpAa43tPjObnCeVu
	mqmhJ9kwlJJZLEhjCbczZHssVhnUQWZHBABjw7q9/6Fj0fGUR24Bcqi+lMnN6L7TCbY=
X-Gm-Gg: AR+sD13c3z62C1b2YpWg7nMmBvv7juTwh7i14zAuyiCKhZkX2cvFXCgmLbRn4rrVHsw
	nxxnlCfD5943S9vzhHA32aELT63AFV/cJ7U/uIClaC9P1E8qBAik+7eca5ZGuVGmFpF9rR+8dj4
	sfGJBB+KqznX2zDWOs5MR/CBge8u1bToWElGjmPAHP8gRAN3uzYXunZrUsGr65+Ff+DeekE6KWz
	XLxFH0nZBOIAOnZvZ22yXk4gjXq8FlI3TX8FdXG2VPCrwiR8NJTrDyeVWz+EUO3wu6C2kQNT9Wn
	tzmnimmjFHb+A0RVKDkH5Xd4eFkCBKo0aHelBCgNU/sspqlhUc5TyVqUK8roK+qW6JsaBtXuJcV
	Ai/FX9DBjyV34nkCtomtl7I7MD5GIwVcfTISohVL3gyLhndoAvpkDDgaHSyWf3Es0A7E71MUmlg
	Rq
X-Received: by 2002:a05:6000:29da:b0:47f:6d57:5aa0 with SMTP id ffacd0b85a97d-47f6d575ce8mr5335243f8f.46.1784546442822;
        Mon, 20 Jul 2026 04:20:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f341:e28f:dde9:3687])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e499c2sm27424593f8f.4.2026.07.20.04.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:20:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v5 0/5] regulator: Add X-Powers AXP318W PMIC support
Date: Mon, 20 Jul 2026 13:20:27 +0200
Message-Id: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHsEXmoC/4XOTWrDMBAF4KsErSuj0Y8Vd5V7lC5kaRSrJLYZO
 27c4LtXSimUEtrlg5nvvRubkBJO7Hl3Y4RLmtLQ52Cedsx3rj8iTyFnJoWshQXB3XVUsOeEx8v
 JzQNxrYw2HpWsIbL8NhLGdL2TL69febq0b+jn4pSLSMOZzx2h+6YNCAkAUoCqZG5phOLAXR8Iq
 5E+1ndH7uDoXPnhXIQuTbl6va9eZGn6Y+AiueCIJoI3daubeGjdekpttgtXNi7qp2EfGCob1jb
 BQ9vYEPQDQ/9n6GwY4WJsrNjrEH4Z27Z9AjXIKtqPAQAA
X-Change-ID: 20260710-axp318-regulator-43545ce3261f
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, Sashiko <sashiko-bot@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=7hXfXp2iPFfLdpPOmtt4ta2acd7kzImYjUePoMQPBqI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqXgSAyrvkPkp1XvSGXP9Y8Hwgo5PQODBYt82S4
 Vo+DWjcRcuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCal4EgAAKCRDm/A8cN/La
 hTrzD/4t9wVWGWjTgF6S7MEVC+e5yOBGUrZxRfSDuqEcHxmStRhzhf54/im6VS4liJecY7GIOnN
 OugW9Ois44fwRy2XmeIO1WeH5Zl9YKMtbLhzhsgFikhuZ7FnmXHdLwtorQHn96EsD7Lq1YbCxKD
 5/rqhyqVeOuY2FlfLhXBDUZtL0iHWjbNKTIUHvAD+F1aLEggq6wpm+4BO/Ulqv7Z4uLNFyB0IEQ
 hCCfVKJtDNUOxPHQGUGqdBbyhLeeu0hDkp3soY1jyelWOoEbee+sDm43ks/e0KDuSrHMpwsKkPi
 Hyt3N3T9jjLUdDDdBR4y/UNED87XSrd4FO3+LFknBqe/QzQxwBQuqFuVjikv2QCqpdRjh3YmIft
 YDxjmNnnS/mL2WAAjmKBXpK8bn9EvZEXFP7GmOmJYWeovHYJjvhvWz8a9j34aPIsfsJ92f5brfZ
 7k+bmL/Vhxzu2/k/bw02HvTjRGYkNS/TaMQeMRbvo8u9oh3jNYom5PkoqjetPlxWv9oGvtaIrZ6
 vV6Yc/I18qOiCS4EIQblGI8IyDgBt4nFgGXtIQNQGFMyVXKlqtgeYbygjjKMc3A5ASUA/yrbaRB
 HsKR3s9uV+Ij11mYWtGk/Yn7tB3MXPEJUz6erlZQnxoSKWPnkI1OjFyrQh8mNJ3sdfVZcFHtGy7
 r61FXpGLL+LMoFg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patch series adds support for the X-Powers AXP318W PMIC, which is
used recently on new boards with Allwinner SoCs (the A733).

The PMIC features 9 DCDC buck converters and 28 LDOs, plus the usual ADC,
interrupts, and power key components.
A datasheet can be found linked in this Wiki table:
https://linux-sunxi.org/AXP_PMICs

There was an unclosed topic regarding the handling of LDOs output
voltage being limited to input voltage being provided by the supply.
Chen-Yu noted the min_dropout_uV would be a good fit for that but
the actual minimal dropout value was unknown. I've arbitrarily picked
1uV because it is the minimum the framework supports. Realistically a low
dropout regulator is bound to have some dropout. This choice does the
trick for now and is certain be less restrictive than what it is in
reality.

If anyone has problems because the dropout is actually higher
* it is arguably an HW design error
* it is a good time to let us know what the actual dropout is

Changes in v5:
- Fix shutdown register offset
- Re-order patches to put fixes first
- Tighten DT regexp around swout
- Other points raised by Sashiko on v4 are unrelated to the addition
  of the AXP318 support and pre-exist the series. They are not
  addressed ATM.
- Link to v4: https://patch.msgid.link/20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com

Changes in v4:
- Capitalize patch 3 title
- regulator: add support for workmode and poly-phase.
- i2c: fix probe through i2c sysfs
- Link to v3: https://patch.msgid.link/20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com

Changes in v3:
- Correct mess up v2 errors regarding ops and ids.
- Correctly propagate errors when checking axp318 threshold.
- Fix DT binding regex regarding dcdc max ids
- Add missing RTCLDO.
- Remove axp318 PEK MFD cell:
  As pointed out by sashiko, the driver name did not match anything in the
  pek driver. While the device does support some handling of the power
  button, it does not seem to match the existing driver. Register 0x36
  relates to DLDO3, not the power key, as expected by the misc driver.
  Leave this out for now.
- Constify axp313 and axp717 mfd_cells array for consistency.
- Link to v2: https://patch.msgid.link/20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com

Changes in v2:
- Dropped _NUM_VOLTAGES macros
- Use min_dropout_uV to limit LDO voltage to supplies
- Add bypass mode for EDLO4/5
- Prevent crossing 1.54V threshold for DCDC6/7/8/9
- Link to v1: https://lore.kernel.org/r/20251021112013.2710903-1-andre.przywara@arm.com

---
Andre Przywara (3):
      dt-bindings: mfd: x-powers,axp152: Document AXP318W
      mfd: axp20x: Add support for AXP318W PMIC
      regulator: axp20x: add support for the AXP318W

Jerome Brunet (2):
      mfd: axp20x: Constify axp313 and axp717 cells
      mfd: axp20x-i2c: Fix i2c instantiation

 .../devicetree/bindings/mfd/x-powers,axp152.yaml   |  28 +-
 drivers/mfd/axp20x-i2c.c                           |  26 +-
 drivers/mfd/axp20x-rsb.c                           |   1 +
 drivers/mfd/axp20x.c                               |  86 +++++-
 drivers/regulator/axp20x-regulator.c               | 324 ++++++++++++++++++++-
 include/linux/mfd/axp20x.h                         | 136 ++++++++-
 6 files changed, 575 insertions(+), 26 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260710-axp318-regulator-43545ce3261f

Best regards,
--  
Jerome

