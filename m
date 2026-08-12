Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74593FF1D0
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 21:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570258; cv=none; b=cnkbOn0d+cEl8J/M4WxNYUDj4aH2jvwT1h4AXWhvni6i1FZHYhG8QYpeMTT+PlPX1eKkk4F88x+KzFPw8EwhYOuUlg5uJVl+XhF5dPHW6XHJw2PjOx058sEZHJV/V/ySwrjiAWzKBp/hmr4Vdwkskoy5arn9ruU3kXdIfJWIgtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570258; c=relaxed/simple;
	bh=Forc7/S+UZvQxT4wewf/pjUKaTT0/cvNsaap5BUgekA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l3HoNDigBTxZS0baFMA54TJ4e1waUffNPMYh1yuGuyyYE+Muhn67GVLR2pCbf9aLlmhzTveF0836E7aWez6EXwR0l513GrO0Hr6qjL+vo3a0nm7+YkW6z4oSXiaosu7+jXYsYiwLSVV+OEGQBehBEydJRHlT2+uSthfncuiwpS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fqNHGjTu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fqNHGjTu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-481412f1828so7223f8f.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786570254; x=1787175054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0i+j6ezVQ0GGXleWYAlCXqjP5HGXscyN9g/xJP3ecwo=;
        b=fqNHGjTuO24Liq1TIs8hv+wMxVWKAbPHHfLQiZSypEbQ0/3L2mllhRnJhIDtpP35m4
         RBxuvwwl35VxG9J2vyBMWYJV4duSJZkBZnzWPcUgWM+P7MlVBSwZ9vvHP5CIXJVeqqlN
         UcTes0yCPb1Gt7c4l84Y0ilW49/aSh930SlZ5RhjgSW+xf/lGi4XsCucXlgKJQG154vs
         dsMre+yNWZCI/1SsN0Eq+TsAdOlGIb28Fi1npQ3daAO/rh9duGN1iRJ22DgsykzicM1W
         SMF1pbsidtXqrPI7zpvlpihTkx2R9EGr173ETlA4GqaNFt1iL0WZnQdK4D50n9fPkyRg
         d5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570254; x=1787175054;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0i+j6ezVQ0GGXleWYAlCXqjP5HGXscyN9g/xJP3ecwo=;
        b=g7dEdn+7TciJc7+JuN48BggOVwtV4PQURfSUKIM38ALSuLFDRgte+iq2f3qcC6/UGq
         yc8pRPUwde10pH7Ggcno7Z7fZG+AoBbRyapr1HUYZuLiyn+SEV0TM8NEcKj2V5eznDkZ
         hKexPeWx7cthhiosnejvzMIKySVDVGmT8zwjPFrRIuaTqMTTRlUy4A8OLP8t9cLCYSCi
         SkaV13qHffV2xxqrxwb+YgtX/0uMJjkSWCuF8XvtT6JE2lpKbINr2TkLJijE8aMdRrLc
         4wcnWPYbu+JudZ5qrGwve4tRQVLh89IHKODz/MG1o8ai9UuGjcUsrafYk6HeIjr1abt/
         OoQg==
X-Forwarded-Encrypted: i=1; AHgh+RryIFJVPH6OOzQ4nf3BqmnAZ0Y0sASdhiTaG5AHFnkuHbtfIOyFGfz6ZHwvb7RwMM8pTiLXE7Ql1BYM@vger.kernel.org
X-Gm-Message-State: AOJu0YxPN5T/ZBLP8PUuPXzJpiTdIGd6vqmQIjCmG+YvDMSPcWZ/RqKa
	DFvcEZno6JL5OVVcvj6df8fs402Fd8lGZfbkT6zlthifPC3MGSDyjvoJ62uSJH6pBAY=
X-Gm-Gg: AR+sD12P/dHpGkuqiAv5yO5NYv4QZqlriu18upHNpZJRDbR1cxFSPL1qkQBqVPoFncA
	UN0h51qUspJM26EC4i5VmRa3QNWD6P+OTVyTBZUyaHkbB4UN/uaGgCzaeHd2OJGFKwflVJTqv0/
	I4eODRka841LfKTlZZAGhEgP7ogVWzrhLQ8Uiov6LsfRx/+g89HG17QmR7OHzxf28Joa2cfznet
	jCFUz2HLXHJSthLZR5CnByvrt3wUl0JbMENBnOxZjXcLxu9yl7lY5ww2P9zghVKfy0tHT0eTRR2
	P0ZZLLIzpPeohQ8RrIupWZ+rk7CTKDx2FRtCdOTRF3BDAtqjYNmtITKNBWFwbuWP8KWPi6sB+5y
	dEZBhK0vQFyKC6JBoToZMLtz0GjYxEh+q2wHEhFPOHUEiltLAljKctEtbLWaZn3Yq7cACsYOFSK
	enlW2CoqSS9Q5ZUqYT02vRtqNjI0G2VofnSOL6yZrqtY+m9Us4GbFMd2QoZAc=
X-Received: by 2002:a05:600c:8b55:b0:499:728c:4704 with SMTP id 5b1f17b1804b1-499821e800bmr6594875e9.12.1786570253985;
        Wed, 12 Aug 2026 14:30:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49982165351sm6309585e9.10.2026.08.12.14.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:30:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v6 0/5] regulator: Add X-Powers AXP318W PMIC support
Date: Wed, 12 Aug 2026 23:30:38 +0200
Message-ID: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3677; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=GZDBt+o42QhMrq9hnguD60kn3uE3njjO23Z934dOXq4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfOJ6svVw2n0d0Peb7cQWIp91QBo/kcu9cHAF3
 PRmTj3qie2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanziegAKCRDm/A8cN/La
 hYG7D/0Uiw9tv9Bze9149H1z+a1cxhhwVwuENnb8yJnNMGEpS/jTZNKfCUGzke5nKVSZ0gPgHmW
 sddyZMD15rEFPhUedH5PM4kCqV2lbSLWQ+5bf3bAcgFRTh6bnZ/FMo16NmldCFWiZ95KtfSU1Hx
 9T3Safc0Yj15Bk/ZGxk+cCNqXIwPb9QGpT0c1AA3DxJV3oA5qzGj3UOfh8nrMrinirtu1e+PSMo
 hvJ37IrlLOboBfD0IK6IpJIaqI4dJaN29JRppPKEQDQz8jeL2cFW1Rzj0U/Z50W4YIBZpxo7AGI
 0xbvM1Me57ugyqoeM0cRHfJ39/cMw1OdoGyQiOk/UvYnaK9gjxJE/UifcNtDYJQ64jAs8Kl25re
 J+zFPaL2b2Btn+/HH502MWHrw2+5levQFs2W7EhAFnnv1s+HAurDrP0MlMjvdU5k2d4n7E0wRg9
 94YZ4mBTaM1+t96Z1u+PqTRV1oLt7IOHCJxCSJy5ZDYvat1YmASm+9IXXsgG5zrHQNtDQd2PCQD
 trkv3kZEMzOBKHWXFWszAfwrUUTYyBn7/fi1unrWMB/ek54hRv58DR6oNrxrthQTZxSJtguNC7g
 zOphYAweLIlW8efqTrAI2xziV0dOnR0a0HegYEvjHZLbcJR1iamY3OZ3yu8uvXSxGDtQS7d+pnA 7mSNaguLw9ZiKqg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

This is version is being resent to include the new mfd mailing list.

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

NOTE: Sashiko has repeatedly complained about PLATFORM_DEVID_AUTO.
The line it is commenting on is not where PLATFORM_DEVID_AUTO would
go, AFAIU. I already commented on it on v3 [1] but it keeps poping up.

PLATFORM_DEVID_AUTO would like go here [2] but:
* This is a pre-existing problem, unrelated to this series.
* I don't know why it is using NONE to start with and if
  it changing it may break anything. I don't mind sending
  a follow-up patch if such change is considered safe.

Sashiko is also likely to comment on the interrupt controller
in the bindings: no, it is not strictly required.

[1]: https://lore.kernel.org/all/1j5x2eeyfn.fsf@starbuckisacylon.baylibre.com/#t
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mfd/axp20x.c#n1452

Changes in v6:
- Apply wording suggestions from Chen-Yu
- Link to v5: https://patch.msgid.link/20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com

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


