Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C573BC69D
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509024; cv=none; b=hWr/LzVYV2nh6wCBaf5UkmGzwbg2txR0UfdCmoe+XIGdQIgjzo6rrs2b4rKw/I2A3UDNXZZFAd0qK19fCjFkSK1BkIqodlR+e0RwimODdGzHrW8WPPubme9z4bmnnS/Wtn9pNbTLKxxjEKFWn/G7J7NE3vZuyxLycYuk6JXWoc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509024; c=relaxed/simple;
	bh=ODdOiDhcHx8qx/yPMvHe4g+dqlfWo7rhm1eUhxstSPY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XxWlLfdzRV9sh1VAbqHdN2RUfF+78pzxus8NnZhimZ4hfY6t/46C8cEBCv+q6wojR6zSOqZjIMBcjKSS4A84Bt4TcCYx/T+gEzVtT6a8s3TpU8MktVfLBrY7bDrmB0gcWpDBI0AtHbOxzZM4gvYVR5LtkoWSZJzjmZojI8yDn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZM80/4XB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZM80/4XB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fd4531020so463256f8f.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785509020; x=1786113820; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cyy+oP+EjOkrUIeC+os5Q3YS9QMtMM2KpazhpIYQiig=;
        b=ZM80/4XBDInwxi9eX8PBSFU3QAyaMlmSRQWDNpoG4eZYSLcZHnrMLhiKFzXXGYD/1/
         h2ToytJHAk7CGK/5oQUBVOs5qBgmAOk+jhW1LS4PxyKTZwEplGyR6WVHZY42uM59mKYC
         7AWAhoQEe+wxuyUYLLJNMcHmSq6YxXVUf/zg1rwmLO7bvIiIQwBKt3ueMHS7TKKUiZxP
         mJRfSzBMlSywDobiCV4PXjE3OVb7ijBy/+nr2qG9uFT2bJh0i+iJEyn55R+FiAG1qGNE
         17HBMnbcgGWRTZsCjuTD0v6bhRdgN2kOyplPDseY1KU+DpIsL+AKlVKILjXpOkj+Uenl
         dZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509020; x=1786113820;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cyy+oP+EjOkrUIeC+os5Q3YS9QMtMM2KpazhpIYQiig=;
        b=dRdSbc5hpFhWk4RwUxc5+1R0mH33aFrSCfdo8aCNswmDpg1Pke4RnRqpKrDG9NQEGv
         NGO2bRnu4l2JlbvgF8yy+Vo2MCXZNU2iKVeBOhPMBgHpMWYhGQKpg3KfOS0ealEOA26t
         ONuy8l3j3R9p01+LweiMXbFEGuC5T+3buyo5Mb0OPnKj0NwswyPprpegE6hPFopK5nJZ
         6YRLIubOP+7c3lNTpjKpOYHviGdnfeUQLSgJOFXX1dYDYzYPYVPvNGbTuCgTbwtgXg5X
         IG7cBN/1n1dPJyJDd8uH1vxnEcROj6UWl45LCmQOQQWvuLbCU4oIXalwVyOLiwACcbGj
         q5/g==
X-Gm-Message-State: AOJu0YxI5VM1tYT8NhcIjI3mNtgPrNMkuCyln7kpHZK/kSCnCny0MV5m
	REND1YPbxtGJ24XB1pfCpBTUPTRlsoYnlpyQ4fWXKn9NVZ0PJekepuv0xYQUXKLorDA=
X-Gm-Gg: AR+sD1167vHUINFGemFQFr1qv7zsM6W1TfUN1TqzuQG3FnPHKUmrVoe/MXA7iwHWCT1
	NvH7vwFUvOeYG0osMYvDofh9msysR0uXF52GxiOrP0qyOjYXX4srE05o9ArSGGy/0Xa8v+OBOLh
	hkpxjYUdoxw13zYHMzbBLvoyYk8gjm/1CkzewRky/yF5A76nownHE+3uYCgSP0kEPswu9G3VNR1
	1jhvLcA0ik5vo7lpnwn2x4h5bCMkRrMTXuqtX5HJctjrdL854xV4ZCuxsbBcpjDfeZXGK230IGg
	kGSG4j/Ps/IvFs35PFq7ENxLWQMPBYZMdbJyko5xk+wROrhvP9StiwMynrGMA+rJo5khEF7C/TU
	DWIHdwPYGICuQCTWhGVLqVVQ0KVzzZdfNPlNrauRDMIFqNBAovmC0Polx0IWcRGjTD3+/1R+G7h
	GM//ek/O5jCF7fwI8KWdU6YFxste5phLo8Fp4AX5o7ismS3DFmiWq3wELdJw==
X-Received: by 2002:a05:6000:4202:b0:47f:6e23:64d6 with SMTP id ffacd0b85a97d-47fd2ac9317mr5177340f8f.16.1785509019796;
        Fri, 31 Jul 2026 07:43:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd41d1756sm5427758f8f.4.2026.07.31.07.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:43:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v6 0/5] regulator: Add X-Powers AXP318W PMIC support
Date: Fri, 31 Jul 2026 16:43:25 +0200
Message-Id: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI60bGoC/4XPTW7DIBAF4KtErIvFrwlZ5R5VF2MYYqrEtrDjx
 o1890KqSlFltcsnDd973MmIKeJIDrs7STjHMfZdDvXLjrgWuhPS6HMmgomaGc4o3AbJ9zTh6Xq
 GqU9USa20QylqHkh+NiQM8fYgX9++83ht3tFNxSkXIfUXOrUJ4YfWnAnOuWBcViK3WCYpp9D5h
 NWQPpcPSHCEdKlcfylCG8dcvTxWz6I0/TFwFpRRRB2403WjbDg2sJxjk+3ClY2zfDbMhiGzYYz
 1jjfWeK82DPWfobKhGYRgDdsr7zcM/WSIrb/obACHAAZRqGB/Geu6fgG9SyPk0wEAAA==
X-Change-ID: 20260710-axp318-regulator-43545ce3261f
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, Sashiko <sashiko-bot@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3666; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ODdOiDhcHx8qx/yPMvHe4g+dqlfWo7rhm1eUhxstSPY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbLSTZY4KhpuDWKDVI13miNyvmhg8hM1xu7G+h
 tkoAYHvhtCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamy0kwAKCRDm/A8cN/La
 hdn1EACiMpRAOecpDadjIq/VgRS82qyhxC80w1GTFjHS0Wo0z7jEOhKmd9P8rVBsgC5pHiA2+2m
 eUE7+yTh3mQkdtjXti/bZz5Um9t53550u1+73Gfr4Us8x+RKVyHF9XUzUU6BEfKDxihZYJkhHOt
 Y6WQLXN8vaJJktLk1PYwaVZAsmmpOMTISNh29x42o+c8VLs7GaeV+4KfqNTtnJejkcXM7hP1LZu
 HEXtk5Us8Je0ef2eWkMtMFf3MQJ7FYyza2z4Sk6+403Terzs+edgEqxyt9FNmU0fsNjKoBc3/9x
 zvIpq8ShevFiPDfOkAmt72I8a3bbfiQMjOB0iQCrQKnAa6f3btoetNOmmQD7VdvywKiibnf7W06
 CeFrCLpZMjJAtSOJLRx/eyYi13t//tQ8Xnn79oTCKeamZ8SvMYU9OJlzm22ie8hDmllHM/oxxdg
 sAkYJaib5dGnX3DRMf0RvCb6O0ArSqsF38A0rm2Tr0SQXIED3qhoTwe05bgt/iVHRB5OA8fLzlW
 /ifdcoq1Yi1BcTiMAAm9ErLe7X5p9jVQug7UMbbd0ModQ3XfnukCnMfSGrhK8h6RpD7gW6ZtpEG
 BAgQUpWJtayYyCmsMaxWWoBB2egdKgGcw9OA+pKipCQ969cLo8xwXs3Kco7l2lwiQqm5Ft2VaeD
 g9Ry4u+L7NGUdqw==
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

