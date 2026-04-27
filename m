Received: from mail-m19731119.qiye.163.com (mail-m19731119.qiye.163.com [220.197.31.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BB733B97F;
	Mon, 27 Apr 2026 06:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777270288; cv=none; b=p9uzzGzkUfos7aZKCsd4Gfo4jr85o3Tdc9q8iUSYT6vo/0SUETpURP4n3vF053oO2XlbfRrC88s2mFP69ra13O/48jbfNSINtrULAOGt1V4s1frD5O0OFvPyk8tqHUQ/tntdUS0ITd21kRnh7Mb+2MMOGUsz8Lcid5nIB8Vfz0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777270288; c=relaxed/simple;
	bh=F35NhBgfXecgyVTVLNehcvh5eeYhUdwFgyO4pLr9voU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mY0Rk88OqyWBf84FQrDsRDiXItf/wrelfE/KaJnwgSCCe3sptw8MjtqJLtt7IOUwkhSllAQTX5eojvaoaVakCV9MNsRaqtTUS7ABhrPPXA1sBb4v3ZF9S5/YZ0/uW41bXpCpRMvNyTbkjLRQgo1myN6ZdDM8DZDhlXyhh0Hpqvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=fRY1XXe1; arc=none smtp.client-ip=220.197.31.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="fRY1XXe1"
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c3fc5fbd;
	Mon, 27 Apr 2026 13:55:58 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: gordon.ge@bst.ai,
	krzk@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Mon, 27 Apr 2026 13:55:53 +0800
Message-ID: <20260427055555.3693459-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9dcd82409609cckunme57a9fd319e3e6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaT0sfVh5DTx5OGU0fGh1JGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=fRY1XXe1X6E7DXG1eBYIZLDcL+GKo7mRmXNIKCE+4QHOBUpogWzrGlJfeJG2o+gvcrTAIhIZ0n5O5X9mC+7LqPModTXHazUis2W9cey2ymShpFrq97/8gWTCZ6azryBxXLRANw8D961Oscs8WnjHaWbqIHcScaArXmXSMu8qVlk=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=77u5SnqzYB1kLOAl7anj33qdv0Ahp9BFyG5sDgjr5/w=;
	h=date:mime-version:subject:message-id:from;

This series adds DTS and defconfig support for the eMMC controller on
Black Sesame Technologies C1200 SoC, split from the v5 MMC series [1].

The MMC driver patches (dt-bindings, sdhci bounce buffer, BST SDHCI
driver, and MAINTAINERS update) were merged via mmc-next during the
v7.1 merge window and are now in mainline as of Linux 7.1-rc1 [2].
These remaining DTS and defconfig patches are submitted to the mailing
lists for review (per Krzysztof's feedback on v6 [3])

Both patches now carry Acked-by: Gordon Ge <gordon.ge@bst.ai> (BST
maintainer), collected from the v7 thread [4][5].

Changes since v7 [6]:
- Collected Acked-by: Gordon Ge <gordon.ge@bst.ai> on patch 1/2 [4]
- Collected Acked-by: Gordon Ge <gordon.ge@bst.ai> on patch 2/2 [5]
- Rebased onto v7.1-rc1
- No code changes

Changes since v6:
- Resend with corrected recipients: send to mailing lists for review
  first, not directly to soc@ (BST has a platform maintainer in
  MAINTAINERS), per Krzysztof's feedback [3].

Changes since v5:
- Patch 2 (defconfig): fix CONFIG_MMC_SDHCI_BST ordering to match
  Kconfig position (between CONFIG_MMC_SDHCI_TEGRA and
  CONFIG_MMC_SDHCI_F_SDH30), as pointed out by Krzysztof Kozlowski.
  Confirmed via savedefconfig.

Build/check on v7.1-rc1:
- arch/arm64 defconfig: clean (savedefconfig keeps CONFIG_MMC_SDHCI_BST
  at its Kconfig-ordered position; no diff in the MMC_SDHCI section)
- arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: builds clean
  with W=1 and CHECK_DTBS=y (no new warnings)
- checkpatch.pl --strict: 0 errors, 0 warnings, 0 checks on both patches

[1] https://lore.kernel.org/lkml/20260123095342.272505-1-yangzh0906@thundersoft.com/
[2] https://lore.kernel.org/lkml/CAPDyKFrcXFAiYouOpjDx3NN-xWACU9jAzEfTU2m_-yvQ9SpC_A@mail.gmail.com/
[3] https://lore.kernel.org/lkml/12058c14-67c7-4b43-bbbc-ef0ccb813e61@kernel.org/
[4] https://lore.kernel.org/lkml/20260417.164709-gordon.ge@bst.ai/
[5] https://lore.kernel.org/lkml/20260417.163754-gordon.ge@bst.ai/
[6] https://lore.kernel.org/lkml/20260310091211.4171307-1-yangzh0906@thundersoft.com/

Albert Yang (2):
  arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
  arm64: defconfig: enable BST SDHCI controller

 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    | 19 +++++++++++++++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 18 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 38 insertions(+)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.43.0

