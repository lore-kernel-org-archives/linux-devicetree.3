Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE82380FD7;
	Fri, 19 Jun 2026 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781869725; cv=none; b=b0n0YtnBCMOFG/BwORvMMJOEkgzS5YhBVBzQgDruSKbRmfkuJyMBpGantq2rbnvOB52eFDta2rCU41eVIamqKBA7yeRhlxhloAcF4FhBiZU14UdFYuP7lVmR1KwVMAJ8tGnVYZNRFkYvrSTPYtbiB3JcVdvxTZ9HeRoUqHXTiRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781869725; c=relaxed/simple;
	bh=8pE5uci6v2CZNI1o/avZs8P5awOWab1pEnR7W9rgM0o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y477YwyVvMGPby5AEV9xuNxq78wHy7Ifzdv9lAJdRWFF/KIKMXKoPL00jDpXiojRNBm9/1iAbX1lA7HdwJm6ypygJ39yxxw/P22DUapTJl3KSED8mOcORaRd0tX0QjzNlYMoJbwayolOg1KhoJxQOQQhYI+Q3W1euezIEpMHP48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=njGbOzo0; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="njGbOzo0"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cde9:cd00:e6e2:e9fd:5a78:7bbc])
	by srv01.abscue.de (Postfix) with ESMTPSA id 9411C1C4F5B;
	Fri, 19 Jun 2026 13:42:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1781869335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iG4wH+vYkP28Rnk0p8yUH5GZZ63elhQlRjg0BgIv//s=;
	b=njGbOzo0EU0Eloxbz/V3kqbc86NQHiOXE+4WGTcrxzcp8JV1fNMqHJZaYBwA5IQ8pYTG/h
	q3rTdXArGV0WfEXny2xnqy8//+b4Y0JJw7b9QaQTfbyseYae3WJ77fUI2/Yyc6Dzvv4bPW
	y/y5007lUt8DGilHiTCMq9g0wAaJqVpQoMcTceBTINzVrGSfPYtIDBJxpAbTTBGgHk4uhD
	I7ZZMiYFQ/X2BxtnmLInKMq41Uz6MfLkkjHqRlfpPo7d4ZZHPwPXddQiTLDEKyh8GAn4Wz
	AYsXdT7hnDNfJ15kyT/qCJ0nokf9q2tBhakZNHF4tmsLDgam7IE1Ue4VlAJEAw==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH v5 0/3] regulator: Add support for Unisoc SC2730 PMIC
 regulators
Date: Fri, 19 Jun 2026 13:41:46 +0200
Message-Id: <20260619-sc2730-regulators-v5-0-0a24c7ed7a97@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPoqNWoC/23NwQrCMAyA4VeRnq00abutnnwP8ZB2mRZEpdWhy
 N7dbggO2fEPyZe3yJwiZ7FdvUXiPuZ4vZSw65UIJ7ocWca2tECFlUKoZA5YayUTHx9nul9TlqA
 91Y2rDJAR5e6WuIvPydwfSp9iLnuv6UUP4/SroVrQepBK6g69D45DB2ZHPocHb1oWo9bjT7DQL
 AlYBEfWa6o9sHH/gp4LbknQRbC+U6zQqpr1v2BmAsKSYIoAFBrS3nLb4FwYhuED7MGEangBAAA
 =
X-Change-ID: 20260216-sc2730-regulators-13ba789641a4
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Zhongfa Wang <zhongfa.wang@unisoc.com>
X-Mailer: b4 0.14.3

Add device tree bindings and a driver for the regulators found in the
Spreadtrum/Unisoc SC2730 PMIC.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
Changes in v5:
- Drop conditional binding patch, will be sent separately
- Rebase on next-20260618
- Link to v4: https://lore.kernel.org/r/20260521-sc2730-regulators-v4-0-1ac8a3b5ed82@abscue.de

Changes in v4:
- Add missing patch for MFD cell registration
- Use conditional binding for referencing the regulators now that the
  child node cannot be distinguished by its compatible for validation
  purposes.
- Drop requirement for removed compatible property (sorry, should have
  double-checked this before sending v3)
- Link to v3: https://lore.kernel.org/r/20260519-sc2730-regulators-v3-0-5bf0e02507e3@abscue.de

Changes in v3:
- Drop compatible property
- Drop unused VDDSIM0 and VDDSIM1 IDs
- Link to v2: https://lore.kernel.org/r/20260518-sc2730-regulators-v2-0-9a5b3a7b1e49@abscue.de

Changes in v2:
- Use lowercase names without underscores for device tree nodes
- Use oneOf for binding reference instead of making it conditional
- Remove some excess line breaks
- Fix author name in driver and add original Signed-off-by
- Link to v1: https://lore.kernel.org/r/20260220-sc2730-regulators-v1-0-3f2bbc9ecf14@abscue.de

---
Otto Pflüger (3):
      regulator: dt-bindings: Add Unisoc SC2730 PMIC
      mfd: sprd-sc27xx: Add SC2730 regulator cell
      regulator: Add regulator driver for Unisoc SC2730 PMIC

 .../bindings/regulator/sprd,sc2730-regulator.yaml  |  44 +++
 drivers/mfd/sprd-sc27xx-spi.c                      |   1 +
 drivers/regulator/Kconfig                          |   7 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/sc2730-regulator.c               | 411 +++++++++++++++++++++
 5 files changed, 464 insertions(+)
---
base-commit: 598c7067dd8b65b93f3ccada47e9014a13137f1b
change-id: 20260216-sc2730-regulators-13ba789641a4

Best regards,
-- 
Otto Pflüger <otto.pflueger@abscue.de>

