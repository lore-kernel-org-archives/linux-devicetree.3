Received: from mail-m4920.qiye.163.com (mail-m4920.qiye.163.com [45.254.49.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EB4258EE0;
	Mon, 27 Apr 2026 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275553; cv=none; b=Pya2om83i6nptuAAopUBVQpXzGt3rFcM5/58t+CLzWrZOkMLxDjhGdun35cfafMLpWoPoX/Rf/ULOzabdvbsCBzvKjcXKToviDYt95s9ooaIksoZxl6DuFe1pIBHawBsJplB1J0DFVBqz1qsfAiNqHXucSvbGsvddNgjjD9vHaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275553; c=relaxed/simple;
	bh=qwW76CLWmNRGsuW0SKRXiavxkeIgUMY4k8Ecx+1HzmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=osI9kNL4SoJnYQQLFBKOs+S4Zs88UOKHeHrCCMTSG0YswR3QMN+Crjhe9FzIKNX0Kpkyw+cPRivPBZ4PPlfyQttYWv2x/p+mCKKyx4yRmwZjMjjOmzICcOoCJ/SpirmsP6W6oetCXWK5b01dNklT8rJ2MwpqxNE6a4g3y6g++zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=kWNXW7hE; arc=none smtp.client-ip=45.254.49.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="kWNXW7hE"
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c40faa12;
	Mon, 27 Apr 2026 14:23:32 +0800 (GMT+08:00)
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
Subject: [PATCH v8 2/2] arm64: defconfig: enable BST SDHCI controller
Date: Mon, 27 Apr 2026 14:23:29 +0800
Message-ID: <20260427062329.3715925-3-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
References: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9dcd9b7bcb09cckunmcd249b321a30e7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUoZVklMGB5CQhpMGhlLSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=kWNXW7hE4p3PjGCbDKhGT7cqTDPgKQ5L6RN6Rm2+wzQeSs9LmfPaMsXJzfI3ix3VNh3tBkXvGo/RWKEhhm2AFGF7stN8NHO3WQVkCHcAORCtiXyIxHWB3jllLP0sQGOCi07xHkVQ0Yx4p3U0i1VsmtIX/4jHOKDHLYyrWmK+Fbc=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=zLe/JUqnW5/3GA47FWix+U9BvqXd61kPAp78FpLV5z8=;
	h=date:mime-version:subject:message-id:from;

Enable CONFIG_MMC_SDHCI_BST to support eMMC on Black Sesame
Technologies C1200 boards.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
Acked-by: Gordon Ge <gordon.ge@bst.ai>
---
Changes for v8:
- Collected Acked-by: Gordon Ge <gordon.ge@bst.ai>
- Rebased onto v7.1-rc1
- No code changes

Changes for v7:
- No code changes; resend with corrected recipients

Changes for v6:
- Fix CONFIG_MMC_SDHCI_BST ordering to match Kconfig position
  (between CONFIG_MMC_SDHCI_TEGRA and CONFIG_MMC_SDHCI_F_SDH30)
  as pointed out by Krzysztof Kozlowski. Confirmed via savedefconfig.

Changes for v5:
- Split from platform series per Arnd's feedback

Changes for v4:
- Move CONFIG_MMC_SDHCI_BST before CONFIG_MMC_SDHCI_F_SDH30

Changes for v3:
- Split from arm64: dts patch

Changes for v2:
- Initial defconfig change included in DTS patch
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..304e12c80af9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1292,6 +1292,7 @@ CONFIG_MMC_SDHCI_OF_SPARX5=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
 CONFIG_MMC_SDHCI_TEGRA=y
+CONFIG_MMC_SDHCI_BST=y
 CONFIG_MMC_SDHCI_F_SDH30=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_MMC_SDHCI_MSM=y
-- 
2.43.0

