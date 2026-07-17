Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C463A3E51DB
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277905; cv=none; b=g8x/a36oqbnNXodW1/yP29EAujSdEUqDASHyCpGwf2cImGA4S41i5nCT5MNX8hvJow5R9Dmm++35EPXnRM+sHDrmdNfIfsOO3MpT1/lBFSEv8Lfo17V+XlcP8s8koSAVk+jWCJY3wv+1LuMk2hCfCT6FjlA/aRCz+0rcpEibZYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277905; c=relaxed/simple;
	bh=TY+YU5a9iqTTbb7/SdZ4PF4LekOg3SWJNhmfiHO9Bx8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oTBeB8f/ze5GZsqua9SxpDClbSLB09fL0oDH59lnpKaGTJqL8biefwdr2NnIjZxCWH1PNbJm2auCxRaO/SW3qCbmLgstv6LeVxWQUkcMpZ59pgichj+kkkbnokht95l8CGNYbW87KoA/RfX6SkypGYIOFqToDWsaoRgU9twGL30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oX7a9pyX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oX7a9pyX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47d6c634f45so4252528f8f.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784277900; x=1784882700; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dGYNIupAZOuusCqORjx2aWQ4VAaQw8kK8o4FOx698a4=;
        b=oX7a9pyX6i7yTcLqVhC+OlYo3cmT3Zn4nb9prmFBdYO9OW17u69hDIWtWn3de1UWPU
         Ap5bq7QC+0TavHCWnhMP1fjFeTgimPgD7nRefktzY5XHwfUuSNxC839LPSwD3BRGzlJ0
         wrxLW2Gr8Wfx+vjUx6O/PDE/ltixo6yxI5WqUSZCdPeA9059EJneOHaNPTCq/p9wbYWc
         FnIvmMFawhigmwBO2/0nMx33yGPNEvcqZGESA70Mpa5p8vMlTOFlAqMC8kFvr5eL3BVZ
         pQqrhyOuogPsoVCVgFfyXmw8GzZSrXf64lxYB191nNfSLdvxFd0vEXkXeF/eacTB+NLA
         W0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277900; x=1784882700;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dGYNIupAZOuusCqORjx2aWQ4VAaQw8kK8o4FOx698a4=;
        b=NalBrZ1YXxFJQR++uYPze7jpzrSTF1bwA8uFG/pkAJcBkiapBDCRCiCZihyEY5YFHc
         XF/BxjAOWABSfcBukf0zqrTIWP/CddvMyje3uluLz6fRYSkHBjIkVhxMQNgY9rM+IQDl
         gncz2WyHN+xdr1acOTI/3419MjAcuvd8Ya3jXlzDHuq0+9IqOURvM2IvhE8gVj9Z8pS7
         kMOL2sf5jOd79mi2VOWmlns+h8IPbxijxzoV/n51A+68UZc+qF2UY7JbomFSo7LDzLgz
         fIR1HXKdw6hRwv8VtINWAuR6ol2g1a0WQ87gRHgWqchkG7wB5uoxA8eH3CbqL5HgzXqi
         yGAw==
X-Gm-Message-State: AOJu0YxHFUlNloD2amL2l2et+n00N53wEo1YbKIEsmZRV2EZLoBEX/UJ
	Qweeoi/7hvubilanpxkNlwZP8yMHD0FowrqcvUFswI6k7T4HTL9hQgQAUa+oGJDAZ6A=
X-Gm-Gg: AfdE7cnb5/HUdz+JDEX11vxwYH+9GZkZFFi9F3geUc9nHGVNyeJu6amlrygepdiOJIL
	uSeiVL3gAe+pEwborXFaxaare9zUzvz1TG8uoCL6N5KjDX4oToe4wQFbKX1Im51gEWGmx6NZUb3
	D6HTSdtYFsuJjG8mZuHFdktjUEiUerIG+sZqeZ97zWy+VEJm8BUhWQv0B0E+BMePqOwwO7QkvSh
	cq4zQfwV7IcZjLvLingvV4tzJQ2/W9oL8qUuH5v0yY48yVONLq5bJdFBtO+eNRzVmLbd2gjSWfO
	9bnbBU0x8y/g4lw5G5HFHMbvNWGKizY7rhU4ca89ZpqIVIZJJVekbnddVLm9IPWmC/vZCTNjJ89
	iOMJfGnMvwqYK7rRxSJokTMBewB3MTMyentwuuWcaxjzc5wBgZ7Afx4oXf1ZTAWN2VtyymJyGS4
	Otr0Al1vCw6Eg=
X-Received: by 2002:a05:6000:41de:b0:47d:ebac:409 with SMTP id ffacd0b85a97d-47f623416ccmr2141344f8f.60.1784277899919;
        Fri, 17 Jul 2026 01:44:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63ee0086sm2170944f8f.30.2026.07.17.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:44:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/4] regulator: Add X-Powers AXP318W PMIC support
Date: Fri, 17 Jul 2026 10:44:28 +0200
Message-Id: <20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzrWWoC/32OzW7CMBAGXwX53I28dpyWnniPisPGrIkr8qN1C
 ASUd69N1WuPI+3OfE+VWCIn9bl7KuElpjgOGezbTvmOhjNDPGVWRptGv6MGuk8WP0D4fL3QPAr
 U1tXOszUNBpXfJuEQ7y/l1/GX07X9Zj8XT7kIMvYwd8L0p3aoDSIajbYyubLXFhBoOAlXkzzWG
 wkdSPrKj30xdDHl9PpavZhS+mfgYkADswvoXdPW+3Boab3ENruL7rht2w8XRsNYBwEAAA==
X-Change-ID: 20260710-axp318-regulator-43545ce3261f
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3285; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TY+YU5a9iqTTbb7/SdZ4PF4LekOg3SWJNhmfiHO9Bx8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWeuBtKz+fr/iaUvTVoErBJgLImo+3wh5pGvqt
 DBXYa0rAraJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalnrgQAKCRDm/A8cN/La
 hR21D/966vv8CeAg3F3K70v/OsxCsO9C5tsWsEkyQ7PwOdj1FkP/LgbOfkNUxKr32I7cKOf6qKn
 IGwZ5ITS7NdhDUdVUffUoBNr4dZUL2+7cNLltpaudwbBQa56XXCL7AwYz3gfE2P9p/iNN65NwwF
 2u+Gw+ghB+uEysFeb4YV0BRGxvhRhUBg6ffhfyzexAtQ6D6Gl9TWhtLSfrkbqOmrhlpoEt/steI
 IFV8BvIIZsw8MxLS7LJLG5WUjH2Y5o/Bci/Cy4C0eMzRB8Z7hkSA50NL4AoKH6Y9iGMBXPvH6Xi
 TcPg+HGjN2KbfDzftOQg6ugns19KTdG3QDh90Vt7gi/t5oIgkbuKn+T8IDYFRMPXD1jX+ZpWjVT
 yY8UxNcrNjThC/C2jXzL4XyP0h9jJEKGQAXbtonj4JMN0LrUbfystopwCFJUCt2FggrT7HIKtBn
 kV8se3hpmhMc6R7T/7ztm9/onovgfOUBBA6tWC7IfCPKoIRVb/kO9hJlS1LSYfuzai7i+EysPVB
 9Y1XGyvS2B1PfZOg9GxhIfnm6z8ik15JjAPf2/qBP8eavxoB7pDvlpaAwvlgUxf12esUi5/sHXh
 EamEi0T2LZ46sUBfGxvTgy2mysjq3ZSNR+EWvEYsLFlNuCXjOZDKfs7hd6nzXBgSn9aDf/wS+BB
 xSViuwiKUTaUTZg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patch series adds support for the X-Powers AXP318W PMIC, which is
used recently on new boards with Allwinner SoCs (the A733).

The PMIC features 9 DCDC buck converters and 28 LDOs, plus the usual ADC,
interrupts, and power key components.
A datasheet can be found linked in this Wiki table:
https://linux-sunxi.org/AXP_PMICs

Patch 1 adds the compatible string to the binding document, and adds
the additional input supply properties.
Patch 2 is the MFD part, describing the regmap and all the interrupts.
So far we support the regulators, the ADC and other pieces will follow later.
Patch 3 follows up one of Sashiko recommendation regarding const data.
Patch 4 adds the voltage regulator rails, this part is crucial to enable
any board using this PMIC, as we depend on those rails even for basic
devices.

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

Jerome Brunet (1):
      mfd: axp20x: constify axp313 and axp717 cells

 .../devicetree/bindings/mfd/x-powers,axp152.yaml   |  28 +-
 drivers/mfd/axp20x-i2c.c                           |   2 +
 drivers/mfd/axp20x.c                               |  82 +++++-
 drivers/regulator/axp20x-regulator.c               | 298 ++++++++++++++++++++-
 include/linux/mfd/axp20x.h                         | 130 +++++++++
 5 files changed, 528 insertions(+), 12 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260710-axp318-regulator-43545ce3261f

Best regards,
--  
Jerome

