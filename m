Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4243E9C1E
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465652; cv=none; b=EYVY2KuDt2G0XTWNceVlcfYNYsisniG68gfVOxFtDYQzgmWe6Jzs9aj9lXjEUu7iU/zes72EgG83mE9G5rhw0m6aq+D+rXG43rrOMbc/yf2rDdg2UoMUr1BcRpeEMP5OaWnSZHkkN5238w39PY9f3yo13oOJtgKBiFiW7YgrMx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465652; c=relaxed/simple;
	bh=eCjKiSsxMp3e7aAVuQZl2wQDtfBKEbKNnbzvbF592Vo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPU1cwPnfWn+wWfMIiRUC02JxacIxaLwTtFYSQIOZ6I3smFqZL4mO72uut4x+mKEYUipeMfJ44goHRQ33TPcqIyAM8pnNYjRLLEIZZwyuJmDvv95JxUPIymvyKG3UUpj5X+wnzMvkUCIEz+wyeEkEhGxPepjR7WDTJS2QoYoS0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QF9wnrLC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QF9wnrLC"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46db3c9a9e0so425636f8f.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465646; x=1783070446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=QF9wnrLCsAJ19Kxh7ZCW1INVyeUt9VM5FT3t1PcW6HLgtgTiaSJmt0az9QnwhWUH2C
         2MgUBrLp/UMBRW4nmcURn8oTJ0WiM38lf7JDgvCW/3gd7R6tDz5BbNWR81scus+uuVEX
         K1KT8lwu8FMoLvt57RKHNBXC5U5rxjt0BiWjh9KufcHJpBwOAOJ7dsVB+TxxqAt1aIMr
         ZgPkQhzXGYowH3L04GoE1k4XBV/3tGp+1Iwt5ltILsD60QgQswYZVZaQuBLLedw1Efqm
         aXbRCfMCEZbL/QtS0/0UbKen7uqUX/pnLYtp6xSJma8lTgFPOaMpLa3zsg2yPDUEpRDE
         7xiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465646; x=1783070446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=js/ywoIHWS1LeeDGOIHJ441S6MlkpxPTpd2ATZNntzvLbWKvQALn/hTMVoQWCMuXag
         LHDoFq82rubjCaV6BvEqRwGmWAJHfz7UV3FodnX5MeS8ZgmVn8yj5iSpI7OcNSZmJ1R3
         Fp9aEzG6nFQ21S8dHrzj09HeyYZcm0TuCultCKXucGKC9Na02xbBkIzwM6iWvPIFZ1M1
         noALomomZDO5TFJqO/3H6uWeuHqIKJqdansUIExo0k4W0XmTHiKJu8iT7WJluLEOvfJP
         WRH3vOaDTXJHN2KuC6MhB54lz+sxk7qmfTNt0FgEgwoHuHbbqv1NNOgNie6P/muGk1nm
         +aZg==
X-Forwarded-Encrypted: i=1; AHgh+RoleU2LJ/1+QEkClEb19/qVThzyqztfb3cPT7tC9y8LMu4g1oxIWd+P8EltKkaq7C33c9VFDaMSz3J1@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ4U+vL8RQmoBygr8oppISOsTJ8qsqPrulML9bmKpc3Bs+kSAw
	opH+Bl+qJfDc35bzD9dD97s2LVFDNJgh1OJjkzw0o8iuOLfD3jD7ZbNS
X-Gm-Gg: AfdE7cnJd25aRcUGMVj7NO5L4vTtZOrbGPSYJrOjd6i0V0JXEe3/gTGqkzKY8Cf3wjP
	dxpPvSoYGr4gfQ+OZnBI+9bbkeTbULbS4WBWSPlfCHHjyAXdn0zNBsxlHFB7Omf2iBow2kuCS6v
	mBKpwB2OUf36iXDw0nHzGIU1O/X0QUwMcLnPIl/uVEJfLv5mYULMv4Q93Hdvroe5EMK6AisAGrI
	17E8Ss0DLti3CWcK9tqIqWkuJnnTpo0+VD1dXn+zJCvfBLbCAaTKtRMJygSfzGaEaAnD82u+VXJ
	txF0P9malW/lyRE7MQ4GGUpvyc/0vXgfsEFQVkD9SLveM+foRZHY8eZtBe0rfNxr7Gu/Ad2qU+z
	C+fhLM0efbDEvi9Ylld1sXubHBWTq9XC/xhtH+AcsVSlgBY8M1tIOBXwXc2TXQ8JWkfiVuctEhk
	KK8i6yx5kPi38rEE5cEtw8sv+1XHhTrYlWsXhjxLnw+chR5d8Il2UWKsNE/I4FmtK3MVsqgD3jC
	jOy3I+64U20
X-Received: by 2002:a05:6000:1447:b0:464:8d68:616f with SMTP id ffacd0b85a97d-46dc2b0b64bmr10020789f8f.31.1782465645828;
        Fri, 26 Jun 2026 02:20:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:45 -0700 (PDT)
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
Subject: [PATCH v2 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Fri, 26 Jun 2026 11:20:26 +0200
Message-ID: <20260626092029.3525264-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626092029.3525264-1-ansuelsmth@gmail.com>
References: <20260626092029.3525264-1-ansuelsmth@gmail.com>
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

