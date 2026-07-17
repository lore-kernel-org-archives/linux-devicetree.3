Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2284F2C326C
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298716; cv=none; b=uNcHjjY8lsl2PxVMlFgKEcCVjLvFm8S2QroY/rOsldvlNtejYoBWDlWQVh37JsXNKhislYs8WojLIism3At8hxhMDAiEd3kZZnkZWwqHjieobCGSi7i6OWPWSJ7IThsg7UM2++Z5ZiSsueKr5MHs+XgKktFzKYJpqF6t1ZogX/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298716; c=relaxed/simple;
	bh=+rr+KmpLCNDKL7QcaKiYFQr7QzqUbAXa0sPkhwxIF44=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cj/+gwD3+xjsZRYhvG7hLXa5P9LYwTlcvbw12i3FF54VrWioVd4YqHHQBp29xBcxjIr5RhBXIdw/KMXTP9tKrA4O6DcXsCUsdpz8vzKYhLZ0bdZ/cRrQhvdnXLLd59QdXCw+8n6PDz4rhtwP420XNmy9MTLsM6MPaPmqE/KTcEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pen5342Q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pen5342Q"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4032963f8f.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784298711; x=1784903511; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9CTm+jVqyYW5bK6Ctc5EWtTc503C5QuL6aCxe6OFSFM=;
        b=pen5342Qd27OuskJsi2iGclFIq1pvv6DOid8VqhLc3H619GzobbNM+c4EGkhws9ctl
         s0TRWYRMdf6sWcaONGFrtvx3K8rtUaFg6fb9+5ay94rL9it/JFmbQ/S1Yr5YfyH3+O/c
         xFNoLVKHdEDHRk0GpTDGk4qD9sABo1m+h6Tpuc2Vo4FuHzIVIp+EpmoH0XCL/V5VEu41
         jhVNoYFCj4oyhLkjY4TJqd4Pn2+4PyFqwIqcwgvIIAtT5xiN7rmzVJJIafhW+PwBB6LQ
         OFlziEXcAHSzF83tt2Hkhg+d6z7hKTaZbTwY/svaSq9XDmbjPGOnlFUA9sD6v+ttESm3
         gTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298711; x=1784903511;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9CTm+jVqyYW5bK6Ctc5EWtTc503C5QuL6aCxe6OFSFM=;
        b=U9zvwyIGfunD2pwbOifiFJlJBpe3lGU6YPOHa5kf7mTd0u10ZVjRLA+oVKRt7a1ODq
         VhDy74AP/5T/5Eji17Lubq8sy/3ZpIHKpnnhO0K7g4qtE3aWmKZSqAD84uGGQN9dz519
         aLfse4cf+sCSvIbCODWF8RKbvL4URjezzrk5+JFSkDHLgj+o/ayurXqEi05lPRhGa0KE
         Qzih86nv0++RF5KSiUrpDCFgIZ0DxcjPF6bpPp5IXNd2MU/EtTMtkfaDfKoTh8DBE7zQ
         DrC30cP4FHj715vl94u4EYcmYVlVCxNqN2AagfNUbMp6IIarzyFdYKSv8HEJGsrLDsPk
         hBRg==
X-Gm-Message-State: AOJu0YytfMIAiKdy+mwPN27J5ZRj8GYzlDJ8GyGFu9T2WarPWWexjR5w
	hm4y40wbob7+44C+1otABsA4eHdr8RFeIJVlbv549k/UVft+yz1JBdFi9SXFMYksnHIgN0MDeml
	1G4eP
X-Gm-Gg: AfdE7ckZtijq/AjPmbPEGQFq1EE12HtFK6LH9F5SyCfTCJSy5XnTvaehnjBCHoN0Hlj
	rpKKUxLE1Ne7YpOBAVZTo9D39CZbqqObPY0Wx7LM+d0MtpjkguMCltEIFmchvnT0bbnpt3he4r4
	jM/wL906zlNBVJeC4s9/0l0IM3qxpm4GK1P96nGi6999PRiP59LcVWVd+jO2PwC7cj911qlfrjr
	RuxsZyy5XFF9HcNew/Dfq7/XM8fgGbTSpED7XqPDUXMr5f74Pzfvq80saNtZWJ0ArqzRWElYooD
	ksPNYG7zEWnfjSeBGCKCicmW0TZscm64ol1qeOas0FLa2I3J/GrCjfh4sBFinYxGw/tVrpnGiVz
	52KLGhDdHOwStehEwa72rYON3EOyR8LFvsmN3UWYGp+MWcyol4peQr3fyA9W1K2k8okbqk99Pu8
	OF
X-Received: by 2002:a05:6000:71e:b0:473:1ccc:15cc with SMTP id ffacd0b85a97d-47f622c57admr3674873f8f.0.1784298711214;
        Fri, 17 Jul 2026 07:31:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63ee0086sm4733123f8f.30.2026.07.17.07.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:31:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/5] regulator: Add X-Powers AXP318W PMIC support
Date: Fri, 17 Jul 2026 16:31:22 +0200
Message-Id: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALo8WmoC/33OTW7DIBAF4KtErIvFADZ1VrlH1QWGIaaKfzQ4b
 tzIdy+kqlRVVZdPmvneu7OEFDGx4+HOCNeY4jTmoJ8OzPV2PCOPPmcmhWyEAcHtbVbwzAnP14t
 dJuJa1bp2qGQDgeW3mTDE24N8ef3K6dq9oVuKUy4CTQNfekL7TdcgJABIAaqSuaUVigO3oyesZ
 vrY3i3Zk6WhctNQhD6mXL09Vq+yNP0zcJVccMQ6gKubTrfh1NntErtsF65sXNVPw/xhqGwY03o
 HXWu817+Mfd8/AfdST1RLAQAA
X-Change-ID: 20260710-axp318-regulator-43545ce3261f
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3136; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=+rr+KmpLCNDKL7QcaKiYFQr7QzqUbAXa0sPkhwxIF44=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWjzOmrpRWT2dTxnqDlaBslTwzPVRKaRNh4clG
 rG4rZh4E9+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalo8zgAKCRDm/A8cN/La
 hXcdEACgZuaFSdUVTyc4hzgngFGQMxL9CFnlWQDcBL2rtHDkbZgdddmN9VLp3AvmJMVBdjZztIw
 T/y90+G99aU6RFGfF0lDdh+Y4jnI23ktEuPPsYvUlwItUiH/Bj405d3iAcj7ojns1edCXij1/zY
 VlY69BLxF6a+6Pw9WvOsAtYHMd7xkPvdHmTLp8qXswm2sffyU/J8Ytsb22kKFOUKukmysR04Iwz
 LU2XgA+fdeVhIz+v1iYY9XjUzljvVUXtLH2KMNPxsgb1vVD2WlgY4MP9uP2qoPhT5ArhfN/Xu2l
 uRuC/DYca579hzM3c79/L/Y/tA141b78eEI45TvOyXS8pw+8S3V0JTqxxbKEDfOywDLVYCkADxb
 Gch3QN3nuiesCFuUxFpNM0nQ6BTkllVq1Ka651e0SYCCE5kSycLwge2J+zAqpCMh2+mSIRPeCQe
 yq1eTbWQi3TKosuNpjszBsIdmTl3/q1GnCvn4bD3w5kdukr6IcUMXrbH/osa5B4MwFmF/9iocgs
 C8Zj3IQhXurLQW94ZxQRyqjqWVOSxhNS7XoNXSCnrdJWegU3+qhd0FRshS/MbYugWVTGlarNrWi
 xFe5l8krVgjuGLvrt7AF9seg6IwLfst0PullNv8ZVGEUngTOY7n82z/hCY2JVwN050Wq8KEC+qO
 ghOtrnIN1kI3j1w==
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
- Droped _NUM_VOLTAGES macros
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
 drivers/mfd/axp20x.c                               |  83 +++++-
 drivers/regulator/axp20x-regulator.c               | 326 ++++++++++++++++++++-
 include/linux/mfd/axp20x.h                         | 131 +++++++++
 6 files changed, 571 insertions(+), 24 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260710-axp318-regulator-43545ce3261f

Best regards,
--  
Jerome

