Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C5C3AEF2D
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562509; cv=none; b=BBLYn3GRVxC+O6K/tFsE4gscNPNWqP6EtcdL37WklaA+QB4rdpq8wwWDD1OrewzgToPGo0tNSuwkfJAS++O/xvDJcOgHrWEJS/Dpf8h5RVLvGq/JDDV3+chKw+IPhurQ+QJCrj8JNKxCGbWVTjiVwY3dV/jKRRjleaMsnsKGKEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562509; c=relaxed/simple;
	bh=eCjKiSsxMp3e7aAVuQZl2wQDtfBKEbKNnbzvbF592Vo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=meRBuWMTgnewDDvcBbHS6DwIAnWTap+utQUN/RNGq61wyw5iwMfXPogNz8jriS3bQFktiIBkjI5nOEhPssAwkyH1G15qT0b30zCeEaXy8fmkeKJ9alxFhii1HjoMrVfw22N9I5XKWwsBOejJd0Le4ZEvICAsublHT/2HskmmSfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=onW1Zxnj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="onW1Zxnj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49270f771c9so3703655e9.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562503; x=1783167303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=onW1Zxnjm/SHXdOCYYr6ERHsg7Rk+AgzfZYKu4plkq53gY2BLFHuJvcJBJWVgmx/zk
         0d/kugJjjyUB4v93iZAym7b0a6+rhei0GiMzX39Nwdj1XonRP1MnPG8BrxdDjCA3lDQt
         hepg+i0cjKdFHhLKr9FQQWGpgNmsoPbl/c7cho6lUeg1WorVvse5mREJ0pp3lmZsy8Ku
         GKIvAQVH0HlemKHaCI9by24aPHlDyA2TMTxkbTeIo0QF9/hxY/rNjTTzbs1yT/a10tU5
         T2riE+ZgvAc/owUZ6vrtUlAmJy0dehC626IivVI9Wwo6Tin+jhEC6q7zu8Z05j7VqkRg
         jijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562503; x=1783167303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=eCYq7pXLhDVAq8Sw2zmcianJauDled000Uu2paANQh5M2OI7L+wAbfoo/rs7Z405CN
         jZ72mCvj3vitLIOF9hgFhtzYZApusIkBp+ZZf+n7uAGNFTPw3wdMEqpv641V+nUm5Rfk
         mH0LJgZHhPpf8LzoGoWsvWV+5i3G0V/pHbG964bsTdXffX8bXKRuB1LQzfz8QpOwH84u
         DUyI3B1jC34kfTA5uWdUbD1bvIrDcsmMhOcTWXf8i7cZqdQFQb/ApelIcEyaIVw180nU
         Yrcoc45tfi7ZKNnlh29AOp2U5wmzSilS/TJolzTtH/8De9ayNsDgat94ebH3llsl20T+
         n9rg==
X-Forwarded-Encrypted: i=1; AFNElJ85ZlJvYXHiMvRaPXCfLqRY+fIOJYWRrSKLVV4TYv9lRiKx6zE5415L6P3XPnouT13MB1/mCwZtYM+c@vger.kernel.org
X-Gm-Message-State: AOJu0YwHvenFhS+kJKfFr3cN4MT9ct56yrFvBkXJlt2R/x6j+i0hGNAD
	W2xLG5U2/2m0JEcX4ofqPD5yNn5+JIfUtYroz+sYidYlZv5l3km1aI6z
X-Gm-Gg: AfdE7cnxANsZRo3PGryOlG3vGOZklGDyof5W+GeVY66nEeJtzZDXd0s226tlApgwPc/
	wUosxi5nvRVFm7csQk6hV36d8WL/ySNCeJOJxRrVgrus7p3puADLNSGS8MC5//f0wrWLM/nyhjC
	48Af6fudD529rkw1LQd55gz8YyFX3SiUX9Ad8PQ9pw6KMXOv6admGYmn9JqriHPNs7RIz1TVzjx
	q+iGApJ6d0AqSe53wp35VbK4H0nGW+9NorFDXqZACHrSkgmEskAlZQ8ezmuP0vxBi6z22WfQglj
	RhRx8IG595VvglCFeEGQAVb1hpUL/pAzX4gBW/vEGYo7pC0bfTOLs2GHwoUiP40Qd1TIaiFd1iB
	OHi1TaPI0I+OY08pQjN1cvT+onAF52iqXPWNlJJcYfZFyFDw50LuDGVcuTY10poImveawK2q4e7
	HoAiNSfvgiI1LfQlbwhyErQ+gyQt6rpBn28AxPT/nIDizfnHddFgWmgeSCHQWRzw==
X-Received: by 2002:a05:600c:4fd6:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-4926684a3cbmr149652815e9.6.1782562502910;
        Sat, 27 Jun 2026 05:15:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:15:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Sat, 27 Jun 2026 14:14:43 +0200
Message-ID: <20260627121450.3529133-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627121450.3529133-1-ansuelsmth@gmail.com>
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for resetting the PCIe lines with the PERSTOUT reset. These
special reset are controlled by the PCIC register and are specific to each
of the 3 PCIe lines.

Notice that reset logic is inverted for these bit where 0 is assert and 1
deassert. This is intenrally handled in the reset function.

PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
reset handling.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..c9b21d9bf2f3 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -338,6 +338,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
+	REG_NP_SCU_PCIC,
 };
 
 static const u16 en751221_rst_ofs[] = {
@@ -450,6 +451,11 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
 	[EN7581_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+
+	/* RST_PCIC */
+	[EN7581_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
+	[EN7581_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
+	[EN7581_PCIC_PERSTOUT2_RST]	= 2 * RST_NR_PER_BANK + 16,
 };
 
 static const u16 en751221_rst_map[] = {
@@ -635,9 +641,7 @@ static int en7581_pci_enable(struct clk_hw *hw)
 	void __iomem *np_base = cg->base;
 	u32 val, mask;
 
-	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
-	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
-	       REG_PCI_CONTROL_PERSTOUT;
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
 
@@ -650,9 +654,7 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	void __iomem *np_base = cg->base;
 	u32 val, mask;
 
-	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
-	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
-	       REG_PCI_CONTROL_PERSTOUT;
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
 	usleep_range(1000, 2000);
@@ -754,14 +756,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
 	u32 val;
 
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
+
 	val = readl(addr);
+	val &= ~BIT(id % RST_NR_PER_BANK);
 	if (assert)
-		val |= BIT(id % RST_NR_PER_BANK);
+		val |= inverted ? 0 : BIT(id % RST_NR_PER_BANK);
 	else
-		val &= ~BIT(id % RST_NR_PER_BANK);
+		val |= inverted ? BIT(id % RST_NR_PER_BANK) : 0;
 	writel(val, addr);
 
 	return 0;
@@ -783,9 +792,17 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
+	u32 val;
+
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
 
-	return !!(readl(addr) & BIT(id % RST_NR_PER_BANK));
+	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+	return inverted ? !val : !!val;
 }
 
 static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
-- 
2.53.0

