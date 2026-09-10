Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFEB45A28B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037094; cv=none; b=Dw5PiB/fL0VpsokQcQ2EiA6yu4CxluBFrs/N+3T+lvnxVvwy0f9ufviTTyaaDMd9meMq3x+ccIcY4By1xqs1ByQrxk/be7zHQP6xsOaejeMaKdF1BvwdXKZgcjhxexEjHcKBQvvEOKcV5Hd5O4xaIxhIislyGbyJdgqeyXzhhIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037094; c=relaxed/simple;
	bh=v9SvlQTTPC8msrAjpqACpgkRhrk2SZByhdgymL5efvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J8sncevvNdQJPY2ULWMX3gLfE+eSUKwOn3w3Tf0BENZ4LW8aYiKcjmVqyl6SotkBW5tE9WD43e0TL6jftGB6JuYuuYm3AQ9tibYW61p9wM/vgcDwp/o/PiI/iMyp1D1SBUxJ4c1kl+FKVs9FnyjbKXMoWrwSWBka1CRiFuona1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YV1jXMSq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YV1jXMSq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so87991935e9.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 03:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789037085; x=1789641885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eocd1TrCP06USmsC7lSoJaG2tjHqdhNNAT5kckVmtUY=;
        b=YV1jXMSqe4naj/m+XzR2Qj6CPY9M6IO9g2e8WbGxjSUzRq4BN3CcehIUnp3RQkX4uZ
         sSVIh7rF177bvGr4GNsqyioTzR2aMuWYpxIGQ4MDpsFQqKvrO1cGtQ7yUoC2Q6VBcBB0
         Cfm42laucgAJ+BAthEbSig9ma81abcLiRP2iQlri6ac8+5XWDktpqym6VD44/gANymCS
         wCvwHZOOxrciELx8crvQKUv+lQNbbNaA1XNa3WH1Lwundowck72rYZeN4IQq05WniYtx
         xn5mWxYOmx62ZA541Am3AivZ+eE+BhyJqOA/A0uXFq7S2iKDcqrngx9LVLkrGd8qbS/F
         JseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037085; x=1789641885;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eocd1TrCP06USmsC7lSoJaG2tjHqdhNNAT5kckVmtUY=;
        b=k/fx0epGBgB2a0EB0bW5oQHNHbfDr+1EjVpCGM+nKwHsmjSHSSNicCSqWixNQ2x8rZ
         ALOwcSikYeceW7UKMbuZSFw8xdmD4sVuapAHCdY0gGcwCm3Bm6rpD5XwueSaOz7s5KDQ
         ev0JfExxyKHt6eyARARDqNtjqX+QAtPS+xWbrVu+U4tMh4gLdo3R1B3jlIeVl4etatdx
         fL5NiNB+4HSx7g1oXgB29B7tfcCf24A9m8Lq4LqlZweYLSPN3ad1CHQY5lnUTh0KyiY/
         jDjqs14N/0sqdR+TZVIsa2NY5O9Jykbrj4Le4NrhFHqZAoMne+wJ/RG7Ha3aa0CNQYHZ
         mwbQ==
X-Gm-Message-State: AFuF++lCS1pay61Pm5Ec0m7eDnefSq0Jx3AIdUyoHczK84mzFZgzwL1m
	Kec95OCoA64WcrNHOOcp1BPs8I8FjRHMJ5whe1HI+ayv/ARvEonLSpBSlbhxYBRtrp8=
X-Gm-Gg: AYBFou09XSg7k6eevntZhKOP8tfqq/nNx+ZPskC713FWTIOlPxgQGkKMWOqjAguDJ4K
	2x3RKHO1MuHrlBycGh+j1MIt5gbL4V/gVSr35qeS9EA2UWdqsChO9LQZlcGPBEN68gHL0DkuZQL
	5qg+Ef8QZrF0sQTxUxNmvIFOeMs0TuSMVX6KhKAVJVQHwsun/qoiAjSIqs+yppUAh+PxoQV+RdE
	N8CQwWW9jilcGm/xKN1zlM/UKNIj4vqpxL8cQob/QlMztVGUi1/FVkcVWy7B73wdK2rrLd8x2T6
	16Jd+rtXW17zcw3gaLFcx2Fa7NzwRHyH+C7qeM10R+BcvVBEP+b2TPzraEQi7PhsEun2njZKWbj
	GUPncp17O3iLYSdQhQ2dwcXqudcM8ESooP5ooCBrl7F/ALLEe8vNKadKtPYuVZmbUdI9Crpk6KL
	bAW8PVrCwsQQBQUHJgoM0NDlo99loEMHTVMJmg+FmkZtlwmmcZP3q+LYWXBUlhnRgz4G2RSoyPH
	5VUliBM/MDWzqR4Jg==
X-Received: by 2002:a05:600c:354a:b0:49c:fc6e:8cb6 with SMTP id 5b1f17b1804b1-49cfc6e8f48mr382783535e9.26.1789037085141;
        Thu, 10 Sep 2026 03:44:45 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm137213565e9.3.2026.09.10.03.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:44:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
Date: Thu, 10 Sep 2026 12:44:34 +0200
Message-Id: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKKomoC/4XQTW7DIBAF4KtEXpeI4ceErnKPqosBhoQqsSOcu
 HEj3704VdWoQu3ySfC9B7dmoJxoaJ5XtybTmIbUdyVsnlaN32O3I5ZCyY3gouUGOMPrScKGZdp
 dDnjuM1NSK+1JihZiU66dMsV0vZMvr195uLg38ufFWU7E3B/ZeZ8Jv2kNXACA4CDXorRYLhkw7
 EKm9Sl/TO+YcYv5uPb9cRH2aSjV0331KJamPwaOgnFGpCN43Tpl49bhdEiu2Au3bBzlo2Eqhiy
 GMTZ4cNaEoCqG+s9QxdAcY7SGb1QIFUM/GKL2Fl0MBIxoiISKtmK0D4aEitEWwykySmstUOqKY
 X4MW/1TU4xAZaMnZx36X8Y8z59imNoXWwIAAA==
X-Change-ID: 20260710-axp318-regulator-43545ce3261f
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>, Sashiko <sashiko-bot@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=v9SvlQTTPC8msrAjpqACpgkRhrk2SZByhdgymL5efvw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqoooVp1GIj89lIXLk4kqEA11q4ukkurtJ8IqnO
 UIG4WWF+heJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKKFQAKCRDm/A8cN/La
 hQ7pD/sEPON2uG18ftINPRBNQANqgW0FluxFbJcdfnrxgg564u5kIOIwi9cm9LSPpUlCXzWGRSe
 HxFB/WBCgiKEZsBQYj/WEcySspTINF2EBFdby4xQOYPmLCJQHcgX5rq2oJfWVaRQWDu/fw+jyWg
 QbBhUS0L1XNTQLBbCImcBSpepewRDNQyYRQNscdkfRiALGsJYqCOoziOVOaC0v3LLiwmId++6Gz
 UTQ5Mxssg/JM7ZylIgkvFivr4a6BgIPOOMSmO7gQh2C1rueHdlwyt7msIHgsptvIhEaSaa8LZAF
 st0AjKcSWZF+tV324IRj6iQcf3ShoLl2pTw1/mXfch/hZ2BhWukeUYOQFyn9m5/kbw+IlIObx3H
 U1JtDxw/Njt0nVFFZd9Hfpssl7lzaFV8UaDj+fzJCgiOcmkrMquXOXDCOZIl/Jn2AIuhBOXdSc4
 6lZK+3BqnnIT+bfc2fsqc7RkBSHmugIx9dCyobaVHg0jk6nWuC8M1RcppNBUvDfxJCp/Gy0+ahO
 lqznBTcxgKWG6udGe3YJT4/IUjwPUqdmfaWcdQtF7ypQ3VtaSLLezWqwe9p7k/Ut9mmdsngF9Is
 VkUvNbcniZSnpZ7R1MeX4GW2zGJGiLxEQm1JUZaEdKx1NO1925+eQCQ4oT40o/fTl0nY+/btrwu
 O1+4NV+9/d8E2og==
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

Changes in v8:
- Fix interrupt optional in the binding (mis-understanding on my end)
  Resent quickly to avoid wasting time on v7 over this
- Link to v7: https://patch.msgid.link/20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com

Changes in v7:
- Rebased on v7.3-rc1.
- Applied Chen-Yu change requests.
  - More complete register definition all in the MFD change.
  - Add writeable region holes.
  - Fix invertion between short and long press IRQ.
  - Drop confusing comment about DVM.
  - Use MFD_CELL_NAME() for the regulator device.
- Link to v6: https://patch.msgid.link/20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com

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

 .../devicetree/bindings/mfd/x-powers,axp152.yaml   |  29 +-
 drivers/mfd/axp20x-i2c.c                           |  26 +-
 drivers/mfd/axp20x-rsb.c                           |   1 +
 drivers/mfd/axp20x.c                               |  93 +++++-
 drivers/regulator/axp20x-regulator.c               | 319 ++++++++++++++++++++-
 include/linux/mfd/axp20x.h                         | 148 +++++++++-
 6 files changed, 590 insertions(+), 26 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260710-axp318-regulator-43545ce3261f

Best regards,
--  
Jerome

