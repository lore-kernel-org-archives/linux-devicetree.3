Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F363333B6F9;
	Thu, 21 May 2026 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380325; cv=none; b=tYrz6Xiygwt2XXWzIcIZSrkU9PV0L12QfED9kJVXljxCZfn0aa0oD3VGuUXoWRhLT56HL17zrSGfwKadNRU3A/58Q7J9l6wSAgu7pE2o5upqud07iFDz6tH/BVyFyjnvR2WQAST1VG68MVAgpoXSN2XsKJtOgp0/vHWbjCSzYUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380325; c=relaxed/simple;
	bh=0YwTcn5UZCuR7slzy/6UFt3CnMDrIbdwSBIOnTb9K0g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OLU/aTtniNnfaVBxhf6HvWa2O0VQccG0nhUEXWiXElxwDi9jd9BUv7U+hYe8yqmTTp6MLaTUD+Shdk1zo5zG7N3ZwP+4fTZbJwyLx2aYsnPpgLCZNJzUSRJJTwieBaIYpstUtTEgztGY3b1b8v97NIq9W3HBkw12D13Ny1iqQkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=EuEk8Ig1; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="EuEk8Ig1"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdfc:e00:ebbc:d4ad:bda4:649a])
	by srv01.abscue.de (Postfix) with ESMTPSA id 67D211C698B;
	Thu, 21 May 2026 18:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1779380313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n7cUyFtCpLGNIbBqPrT3hsFxfCg5RcZ5fcuGngD9Vaw=;
	b=EuEk8Ig1SzXeJOql/JCzDTqkKzDmcjuNQ0DmWmHsA37woncwTzIfZHj7UckvUhLlD2V+9l
	Y7xjMNmYlqvJJSoFOVpmS+X7mmqsKjZYSnNbddP2DL/yxDBRYvzJ6XABB053Rnfonje6hF
	MgpWxhx8KinMyWlxF9j/O3j7Bmj/7eta9MDR6oBjWWATT048REIP35H24UCwFma3GKLLxH
	Z97/hmNPGF90+qor4YZhcnPCb66N0hkZ07Sk5MhtjonSgcdBJTMdZ/B5+C662KxenlBDG4
	QumQjK6KkMRTCI7r00J5QfxCEKcsETm1y8wzcoW53fUVUJJ2o8rtqKXg6HleEg==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH v4 0/4] regulator: Add support for Unisoc SC2730 PMIC
 regulators
Date: Thu, 21 May 2026 18:17:05 +0200
Message-Id: <20260521-sc2730-regulators-v4-0-1ac8a3b5ed82@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAEwD2oC/23NUQuCMBDA8a8Se26x3aZzPfU9oodt3nQQGltKI
 X73pgRJ+Pg/7n43kYQxYCLnw0QijiGFvsshjwfiWtM1SEOdmwCDkgEvaXKgBKMRm+Funn1MlAt
 rVKVLyY0k+e4R0YfXal5vuduQ8t57fTHyZfrVgO1oI6eMCg/WOo3Oc3kxNrkBTzWSRRvhJxS82
 hMgC9oUVhhlOUr9L4itoPcEkYXCeoYMCqZQbIV5nj99M9BGNgEAAA==
X-Change-ID: 20260216-sc2730-regulators-13ba789641a4
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Zhongfa Wang <zhongfa.wang@unisoc.com>
X-Mailer: b4 0.14.3

Add device tree bindings and a driver for the regulators found in the
Spreadtrum/Unisoc SC2730 PMIC.

The second patch in this series depends on the first patch.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
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
Otto Pflüger (4):
      regulator: dt-bindings: Add Unisoc SC2730 PMIC
      dt-bindings: mfd: sprd,sc2731: Include SC2730 regulator bindings
      mfd: sprd-sc27xx: Add SC2730 regulator cell
      regulator: Add regulator driver for Unisoc SC2730 PMIC

 .../devicetree/bindings/mfd/sprd,sc2731.yaml       |  21 +-
 .../bindings/regulator/sprd,sc2730-regulator.yaml  |  44 +++
 drivers/mfd/sprd-sc27xx-spi.c                      |   1 +
 drivers/regulator/Kconfig                          |   7 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/sc2730-regulator.c               | 411 +++++++++++++++++++++
 6 files changed, 484 insertions(+), 1 deletion(-)
---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260216-sc2730-regulators-13ba789641a4

Best regards,
-- 
Otto Pflüger <otto.pflueger@abscue.de>

