Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296477;
	b=ykOy8Jm7di9kZagP+lj+SQ4ksbsZdgu0Oi+SGl9EdrAA61Zlu/uTQNdhMoWN9o64TgtM
	 erdDjfX7VAIlgFSi1zHKFLkl4UoMILM5ILs6VKtiPYSTKxuI6GOAht7r5s5lGxbx2CR+Z
	 4waOptovlDvLsMEZd6IDvr5C7ZZ866GExGZPbP9xvKPEmOfzMhjpxTKPrWBnCzKGRkcfZ
	 pVv4bDSYp/0P5oqN+Rql39YWEzu954Iinh6pNr9+oQK8RtAGCKR1cxaNA/TK+XHjV5Whv
	 3pYFpWk6txsQdWHW/KjHNgqMApCcd54HUbJAmOEx9USeprCyBc/urIWftK3VdeAfqJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
	b=qeG7pJqBFiF3FbitHu3KXeC6Lvv/8kKSRIP91DaSX4I1ZPn7SgjGOT2/V/x0lemNMMNX
	 Bt+o1Dh6jRliIPEKqjPHraxSqLQfsG67V64g2WIJVgxxQSF1OrV96Sma4dMxnhXJAGb7o
	 L5kXkc3o+JNn1rvmDuEhHZmBGQkJloJQItqRzlVT/tWzxlmf3GPOQrrvvzcFEs5yVBTdH
	 XO46wrVc0U6o64a6kSVwma9YelvWVInon4G5elpoAIJiSta5zzIQAQ/6UE6G5PEuMfft4
	 8C/ImErUPdraDHAO34iA6rmTApre4Rwvuj4HkZGuqAbNE7XU1CjvxAgAhA8DwPngaQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nO4QnoUR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2577E606A339
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2577E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nO4QnoUR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so18773085e9.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296475; x=1795901275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
        b=nO4QnoURM0p05+PcDkufepKHoZT7l1C+SOuRKiUyo7uVLO5+m+zLlffBNefNr6fH4L
         9G4Zz91l4lA0e0N1k7RCRAYybFWnv1QztUO4JfhQWQ20c9Rk7/VKbVXgH24WupRLST96
         JmKF3wGnRezV/a53SRk3Ie5vnbo/Bx113DBY0yr53jQE5n9a66lnji5zl5e6kPrNVSFe
         Ion9R8cOQ03TJhMPoBeJkrmBRO31BjFCAUfANiS3E5E+Az5AJye4bmF9tND7N830skvY
         wZLa5tZdEgWo4P32GUoVNo9dnts9p7F5sC5LYtK5FCS77zBJ+RmH456eU9FtzZrbMwe9
         eTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296475; x=1795901275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
        b=ve0QLLiD6cnwklKpMzK95faXVwqfJDhrIj6kpaHcmhitHepMfNHRJ35j+Hd9m80QI8
         9QLYYf2p8B69UdMyV5mGVogNqdJZlhlehGJdbFP3a0a082vKjNlqRXCWSZ7+QbkUfOIM
         L+lXhEnErk9disNvwO6oaK/RAkHKx7o2ZBBg+pbvZzZp/wijGHxBgp4c9eg98oqHC/dR
         gjzmfaLfsHtZhWoWQ8TFMNeKF+aGZW9zbaGIIds9Lrq4iCuD3sHkU4OEHD9ATIvnQt60
         QIosa+2DiwIWKBuFsEx0FY7jUxYQY597+j04Ji2t7ZpcFhdBLuHWw+s47g7T6qde85B5
         yjOA==
X-Forwarded-Encrypted: i=1; AL+hErFIv5RUMvUcdY1SSeL87CFpeb/xo52bMNp9Ocb0ZUqZBrEinltBDlDznL1ZWisftdd0I5Q84H409t64@vger.kernel.org
X-Gm-Message-State: APuU4Z/ddyaYHSewSJFsmBJZs/qX2gyncVaF/uJHneHfhbwS1eTeBIqa
	rnaeUo2Ia+TneWXG/BhHj0jARvxJdas4FaL15BbcrKpwyp2ukFKOFaHu
X-Gm-Gg: AZFdTZe63hNHCyG9WEf+BmEPLI15tLtyJPwV1kMn8ALt63AHMjzhrs5frAD50g+TLa7
	l0e9MM19Gyj+BYa7j1RKwTAJYc0MYKRv60VM2q/jsydNxeeJtre+rfufqLwnmId1PH33fTa5RkS
	Y/Ba86KOC8FKtPo4yDfOjIzkA0teyq3eLOuuQLeFJIGQ8cgcxPUUwNCa2wijpF5uY5RHjuS4LML
	5btr/HJ98EvEVo+1sH3JZeaZQU9h6qBa6z3/LXWvpIM2LQVGGJrD0BN3T+R4BnEjI6OXducjUrM
	Xdrdajpvff35GsrHsKtwqnE4T9HmuPzyF6q+k/V9ioRD7tz2vdZMVd1be8ogL9nBv67O4XrVpDi
	cjaOLIAeY7nTYuJ93pUz9+8HOBHEXEjKh5o1VOyJZJn8NK416Sduz/QQuw9aTwQ6ILdN++4nXWB
	8LCIJqKjUIYtelemHkj0K5Vl97luDOHH8ZXWd340KUJ2PkH4mM0PQzj/Hn9DyKseAxm/Qkjlxd7
	eNPvhAKgFS0SG96I8atk18oPV/yxHq5iJJdGfyH1oEleYj93fafeJVrg/RZWg+me8EAbbt1xFP8
	doAGXYnF17fCy/N5WIVxMy5uuFQBcjaea/sYPUbLejUGIq+YC1OS3nrSmQJz1jPwbgJtO9TueCG
	T7g/L5wwN/qPT80XoKmkRU+u10uWHQM55wv1BK/H2q/xmoel+Afw=
X-Received: by 2002:a05:600c:c173:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4bb8881d00cmr154697005e9.9.1795296475433;
        Sat, 21 Nov 2026 13:27:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:55 -0800 (PST)
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
Subject: [PATCH v15 3/5] clk: en7523: protect concurrent access to reset and PCI register
Date: Sat, 21 Nov 2026 22:27:33 +0100
Message-ID: <20261121212738.170775-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121212738.170775-1-ansuelsmth@gmail.com>
References: <20261121212738.170775-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c | 104 ++++++++++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 9e92586f207c..12a43562929b 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -150,6 +150,7 @@ struct en_clk_soc_data {
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
+	void (*pci_unprepare)(struct device *dev, struct en_clk_gate *cg);
 };
 
 static const u32 gsw_base[] = { 400000000, 500000000 };
@@ -584,53 +585,95 @@ static int en7523_pci_is_enabled(struct clk_hw *hw)
 static int en7523_pci_prepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
+
 	/* Need to pull device low before reset */
-	val = readl(np_base + REG_PCI_CONTROL);
-	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
-	writel(val, np_base + REG_PCI_CONTROL);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
+		writel(val, np_base + REG_PCI_CONTROL);
+	}
+
 	usleep_range(1000, 2000);
 
 	/* Enable PCIe port 1 */
-	val |= REG_PCI_CONTROL_REFCLK_EN1;
-	writel(val, np_base + REG_PCI_CONTROL);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		val |= REG_PCI_CONTROL_REFCLK_EN1;
+		writel(val, np_base + REG_PCI_CONTROL);
+	}
+
 	usleep_range(1000, 2000);
 
 	/* Reset to default */
-	val = readl(np_base + REG_RESET_CONTROL1);
-	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
-	       REG_RESET_CONTROL_PCIEHB;
-	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_RESET_CONTROL1);
+		mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
+		REG_RESET_CONTROL_PCIEHB;
+		writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	}
+
 	usleep_range(1000, 2000);
-	writel(val | mask, np_base + REG_RESET_CONTROL1);
+
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_RESET_CONTROL1);
+		writel(val | mask, np_base + REG_RESET_CONTROL1);
+	}
+
 	msleep(100);
-	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_RESET_CONTROL1);
+		writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	}
+
 	usleep_range(5000, 10000);
 
 	/* Release device */
-	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
-	val = readl(np_base + REG_PCI_CONTROL);
-	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
+		writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	}
+
 	usleep_range(1000, 2000);
-	writel(val | mask, np_base + REG_PCI_CONTROL);
+
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		writel(val | mask, np_base + REG_PCI_CONTROL);
+	}
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
 	u32 val;
 
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
 }
 
+static void en7523_pci_unprepare(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
+
+	__en7523_pci_unprepare(dev, cg);
+}
+
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 					       void __iomem *np_base)
 {
@@ -648,8 +691,8 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	cg->base = np_base;
 	cg->hw.init = &init;
 
-	if (init.ops->unprepare)
-		init.ops->unprepare(&cg->hw);
+	if (soc_data->pci_unprepare)
+		soc_data->pci_unprepare(dev, cg);
 
 	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
@@ -670,10 +713,16 @@ static int en7581_pci_is_enabled(struct clk_hw *hw)
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
 
@@ -683,10 +732,16 @@ static int en7581_pci_enable(struct clk_hw *hw)
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
@@ -787,11 +842,14 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
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
@@ -832,6 +890,7 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 		inverted = true;
 
 	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+
 	return inverted ? !val : !!val;
 }
 
@@ -883,7 +942,6 @@ static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
 	struct en_serdes_phy_instance *instance = phy_get_drvdata(phy);
 	struct en_clk_priv *priv = dev_get_drvdata(phy->dev.parent);
 	u32 reg, mask, sel, val;
-	unsigned long flags;
 
 	switch (instance->serdes_port) {
 	case AIROHA_SCU_SERDES_PCIE1:
@@ -970,12 +1028,12 @@ static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(priv->base + reg);
 	val &= ~mask;
 	val |= sel;
 	writel(val, priv->base + reg);
-	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
@@ -1220,6 +1278,7 @@ static const struct en_clk_soc_data en7523_data = {
 		.unprepare = en7523_pci_unprepare,
 	},
 	.hw_init = en7523_clk_hw_init,
+	.pci_unprepare = __en7523_pci_unprepare,
 };
 
 static const struct en_clk_soc_data en7581_data = {
@@ -1241,6 +1300,7 @@ static const struct en_clk_soc_data en751221_data = {
 		.unprepare = en7523_pci_unprepare,
 	},
 	.hw_init = en751221_clk_hw_init,
+	.pci_unprepare = __en7523_pci_unprepare,
 };
 
 static const struct of_device_id of_match_clk_en7523[] = {
-- 
2.55.0

