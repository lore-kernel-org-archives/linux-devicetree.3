Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939896;
	b=nR59qQtv5T1/TXAEWfnygjo5TGTYcxGTIUZ4GA1fIy2X93PsLxVMzoQbL+vvsEGuhkCk
	 jXGAC49KKz90Wpg8iXxMKjsyKLPRIWQIMIy7Taofxqq9nfSDktd4siEteM2EjoJkjqDeN
	 2cdRhpRBpwSgxJzIcd/AbdZmXSrnUPdjn5RidZTlgje8FfvBfwG5tZWtAjfrA+DN55XAJ
	 WhV9uMLCSC1lNHqB/GMIV01ueUWZ1KE3p6Rdk9feQIlHPiKaorkJuOMfFwm1mD/dpWfr8
	 m63o2cTb/wVZazfLPHCSNwwUfH6gYTbE0N0sHz8c6iM/lWNV+RywTt8/MER3lLBI98A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5CzSb8wdSxzWAkv/Sr8RJLeUEI0rsl5TBunUD7515rY=;
	b=rRHB9WXbogWj0gdl+HqLMZbx5Dey3tSaQD0ZkZAEYJsjHjS0IM14GuEu9002aPG28MjM
	 VkjvfCpjibcRVHC1nuiznJYU3BvAKgzBH6YaUuKNTAzuH8zW9JrJwL/NveBVcC1bIcFa3
	 Fw1BgpU8FU5Rkbgc6X/lRRW7cALSA23YNqWMRsu1C95ZdnPoamvsv3JtO/20/8utn4ARZ
	 AaExeh9D6sYT1gc6gkaBcRgZI489zDZtnhveecxRSCuQuAmpCZaBn162wsxKQtyO5HONE
	 HTZOBDhIXrTiSNrEX+VBtylAxEcan0fcTZNqZb75Y8BogrI/DC/yS+X++pSK0P3PNlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtgNpqpK;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C50F606A89A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C50F606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtgNpqpK
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso10190565e9.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939894; x=1795544694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CzSb8wdSxzWAkv/Sr8RJLeUEI0rsl5TBunUD7515rY=;
        b=gtgNpqpKoLO3Hy8BfEW4SPpvwXhIeMtrfAaN+QJp1yH2EfsBgf6sFpL2O0toOdlUBs
         AvXCC2s1YfVzxDa6L/BI6QenRZnCRHo8g4xlslFRXg1CPfX/5kgl8A7KIrSM7CP9QqN4
         r77/NzhNkCRzHFc5vi/FTrOSgFP2WCLLI97arQiom/HibQV6lPPih1f+fmurgnmxgvaM
         eIk78bqM1KdtXmn9uSGOsU8xHcL1B9bQ6sD4QYjv3LLUtDgggjoIOPBf+OCUYbE6O+nF
         PGMIc8hTF9z09M7VwXyGArErmBTeEe4UJAqNBJ1CsGlYnKSpvE3yvyXH82nIUw3DqSn8
         Zevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939894; x=1795544694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CzSb8wdSxzWAkv/Sr8RJLeUEI0rsl5TBunUD7515rY=;
        b=kCQTvmk/jV5NHkNEko0s0VTyUoVK/fH3/1OsWPUJ8bhT44MlmsxCWXysGtGWAIt9tm
         lNxReh5O1GDlYW1tYyEYyq1W6HsE5U9ZXWhKV3tXawY6Zad7qEXxnBb/YFMi9GAnFCbQ
         6LVhhCS37Qsg157QBC7IF3vwxOnmqIJMHCU3AG6NHXu2HK4E/OR8LhNmSRuyq6a2yFuQ
         V2J2uu5osudNcCRZ2sBtJuIgIgbxb7Sf1iTn66cHLZwixoirbEWXzO4jtxeuQaJnQDo4
         Rc+Q+es0fH2yVD0kABc1utmztodtXCTTumljdcflabDfGtuB8+61DGX/QWJcyoEceq3r
         +Jhg==
X-Forwarded-Encrypted: i=1; AL+hErHkl/Ygd5P95MuWHkaHYNw6YUC5wDf1oZfo/Tx4twnStAKL8DrFBI2EvtMa40XM1zDvDFldRyUErJ9C@vger.kernel.org
X-Gm-Message-State: APuU4Z+bFpjhtyvGeQ2x3HxnLCGBxCYViHS9PSoEmt8eg50mBdhZUGd7
	IQ4KQcstC1udWeTcxFeIYcCUkUvLkT3yYcGpjH8NbencqIjgI7KxCjjI
X-Gm-Gg: AYBFou3hsNt3I40T7jXBj+hETP7D7fbTBR+SRRK8U1+KMpftSviBDsjuAUVL5M9Lfkc
	vhKedzWCyd5oyJw+cEVm+ongkV2WYVteWgAFVErqJalKtDxw/T4zXG7lpXaoQksH1qbPqHoja2R
	v3OBWVXFjTngROvN7leJzdKAVXsM9kanzYVh0osuSLzkMWjpo5sbydgp7ux+dTVTFh4SNULmKYH
	whgIbfmJd8QeLphWJEldj7eQ/BogGsVXlvwT4j9RiAfYV0UbevB3wJYvlnJmKtbd7P44bKtSYGV
	gDCLBDn26y+IJaBhSLuzKxtApknL/C9YhJ/RCwTDFr/vKwBsXERSVXAOuqSiYZJiR8z+d+Rm0xy
	f3gQV1gr1/ZYoDSHJ8pnMa6fnnIjRQRwdOYQrGmyJjjodBSWUBMKLzWfGlSX9mc69pdp8Z2Sa+n
	BfRHRVdab6XaYeFAh2c47YILvg5mwdShqx5QlbgMGe6kwVg5POvq9VqpH7mgQhI0mSGgrIrPs44
	4NA32O6t3+IhuMN3C+MWOgYeVXqtGhZHiZaSiKWEwWZDFh4vzs5USzVga7iNePuWdC0uGRlLpm+
	wo++wxGtqe7cEyMBzofuLbKdEvBZOTn7G/Eauy63k2JhZ+GyCmZ/vvOjY0Yq0Uezp7gBzdHVhCD
	DoRYL38z5BTkid95Os5R78FYWndhxATx+qA==
X-Received: by 2002:a05:600c:a216:b0:4bb:6a60:56fd with SMTP id 5b1f17b1804b1-4bb78372f01mr58042285e9.1.1794939894530;
        Tue, 17 Nov 2026 10:24:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:54 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v13 3/5] clk: en7523: protect concurrent access to reset and PCI register
Date: Tue, 17 Nov 2026 19:24:41 +0100
Message-ID: <20261117182444.103123-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117182444.103123-1-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use spinlock for concurrent access to reset and PCI register to catch case
when clock is enabled/disabled while a reset is also operated at the same
time. This is needed as register are shared for both clock and reset
operation and rmw operation require protection against writing inconsistent
data.

Some minor rework was needed for PCI unprepare case to permit calling it
before clk_hw_register and reference the global spinlock.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 74 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 9e92586f207c..6aa6dfaf414e 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -150,6 +150,7 @@ struct en_clk_soc_data {
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
+	void (*pci_unprepare)(struct device *dev, struct en_clk_gate *cg);
 };
 
 static const u32 gsw_base[] = { 400000000, 500000000 };
@@ -584,51 +585,95 @@ static int en7523_pci_is_enabled(struct clk_hw *hw)
 static int en7523_pci_prepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
+
 	/* Need to pull device low before reset */
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
 
 	/* Enable PCIe port 1 */
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_PCI_CONTROL);
 	val |= REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
 
 	/* Reset to default */
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_RESET_CONTROL1);
 	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
 	       REG_RESET_CONTROL_PCIEHB;
 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	writel(val | mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	msleep(100);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(5000, 10000);
 
 	/* Release device */
-	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
+	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	msleep(250);
 
 	return 0;
 }
 
-static void en7523_pci_unprepare(struct clk_hw *hw)
+static void __en7523_pci_unprepare(struct device *dev, struct en_clk_gate *cg)
 {
-	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct en_clk_priv *priv = dev_get_drvdata(dev);
 	void __iomem *np_base = cg->base;
+	unsigned long flags;
 	u32 val;
 
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static void en7523_pci_unprepare(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
+
+	__en7523_pci_unprepare(dev, cg);
 }
 
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
@@ -648,8 +693,8 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	cg->base = np_base;
 	cg->hw.init = &init;
 
-	if (init.ops->unprepare)
-		init.ops->unprepare(&cg->hw);
+	if (soc_data->pci_unprepare)
+		soc_data->pci_unprepare(dev, cg);
 
 	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
@@ -663,6 +708,7 @@ static int en7581_pci_is_enabled(struct clk_hw *hw)
 	u32 val, mask;
 
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
 	val = readl(cg->base + REG_PCI_CONTROL);
 	return (val & mask) == mask;
 }
@@ -670,10 +716,16 @@ static int en7581_pci_is_enabled(struct clk_hw *hw)
 static int en7581_pci_enable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
 
@@ -683,10 +735,16 @@ static int en7581_pci_enable(struct clk_hw *hw)
 static void en7581_pci_disable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
 }
@@ -787,11 +845,14 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
+	struct en_clk_priv *priv = dev_get_drvdata(rcdev->dev);
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
 	u32 val;
 
+	guard(spinlock_irqsave)(&priv->lock);
+
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
@@ -832,6 +893,7 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 		inverted = true;
 
 	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+
 	return inverted ? !val : !!val;
 }
 
@@ -1220,6 +1282,7 @@ static const struct en_clk_soc_data en7523_data = {
 		.unprepare = en7523_pci_unprepare,
 	},
 	.hw_init = en7523_clk_hw_init,
+	.pci_unprepare = __en7523_pci_unprepare,
 };
 
 static const struct en_clk_soc_data en7581_data = {
@@ -1241,6 +1304,7 @@ static const struct en_clk_soc_data en751221_data = {
 		.unprepare = en7523_pci_unprepare,
 	},
 	.hw_init = en751221_clk_hw_init,
+	.pci_unprepare = __en7523_pci_unprepare,
 };
 
 static const struct of_device_id of_match_clk_en7523[] = {
-- 
2.55.0

