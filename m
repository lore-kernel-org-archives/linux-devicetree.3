Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D193EBF3D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779718777; cv=none; b=QhryVKwRI686VDyxLOy6pFuhBnz3fVIC5Z0u8vDo8GhPPjh+fIKki01g47fOmrkuIbMnlhIBGstIKvvg/SmQ3CWv2GXGb7yWfZ4ThzabVsKooa6hKUfdGCD8N2qmK/Iyrsu01KjvoJQ9lURm5WJsini1yJdHjlgJAUcZQBEHNpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779718777; c=relaxed/simple;
	bh=3454wlriFBYA1PmIAk/pGLH1G5fs1iNZBJZwMOMScAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWNuoXZu2Kfi7jHmvV4hlYh6ZcfSkAQIHRrQJkYqsZwnOF097ItZxBPTv8gmYHjdGzEFjNSEEuwIVij9zOq0qo9V5JIzkv2tyrExPv7pgVeMA0AJfUfY+zXf1cpe7+SOkhDsrGiExlWyImoMqjkAAj6owbnrjoTTJz+6Afgfb68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MuUrOMR6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MuUrOMR6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E88E1F00A3A;
	Mon, 25 May 2026 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779718775;
	bh=bPu7j/mMHJlEE+0Cgycs0SQITX74H+h2HkTBrHZqBMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MuUrOMR6rcurzMMB4nRyiG2hEVzBzqU6B6Lp3bdj1TI0y2xEAq2vWSJtvPtSJSmTN
	 UmE2ERXJB3NOfAax94J+jOv3bsEA2WQN2f1U9rRTpUzu7TSwzVBva3Ep5Aub8atT8d
	 IVpFjja1vBFovgd1Dw0swLLqvSl0EWL6U3yr9YfU7pP5AEeBNkI0KpCOJvX6ieqJLR
	 tZrOFTIOJfJNCyDGMWCtaz70DbND/kf9+cpVXGDNvl3Eh5d+QnvydYLOup3lTv8VkP
	 Z+S6HW3NLPw7tZD//a8NHhH3V1dqZESB/qWezN3iab1Qnb06HsH1eUbiMwWsOwd1+t
	 ytcgSZR9S9A2g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/3] i3c: dw: Add apb reset support
Date: Mon, 25 May 2026 22:00:18 +0800
Message-ID: <20260525140018.19598-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260525140018.19598-1-jszhang@kernel.org>
References: <20260525140018.19598-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support of apb reset which is to reset the APB interface.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 7 +++++++
 drivers/i3c/master/dw-i3c-master.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..9de54d584bc3 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1591,6 +1591,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
+	master->apb_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
+									       "apb_rst");
+	if (IS_ERR(master->apb_rst))
+		return PTR_ERR(master->apb_rst);
+
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
@@ -1765,6 +1770,7 @@ static int __maybe_unused dw_i3c_master_runtime_suspend(struct device *dev)
 	dw_i3c_master_disable(master);
 
 	reset_control_assert(master->core_rst);
+	reset_control_assert(master->apb_rst);
 	dw_i3c_master_disable_clks(master);
 	pinctrl_pm_select_sleep_state(dev);
 	return 0;
@@ -1777,6 +1783,7 @@ static int __maybe_unused dw_i3c_master_runtime_resume(struct device *dev)
 	pinctrl_pm_select_default_state(dev);
 	dw_i3c_master_enable_clks(master);
 	reset_control_deassert(master->core_rst);
+	reset_control_deassert(master->apb_rst);
 
 	dw_i3c_master_set_intr_regs(master);
 	dw_i3c_master_restore_timing_regs(master);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index c5cb695c16ab..a4ba60043288 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -37,6 +37,7 @@ struct dw_i3c_master {
 	struct dw_i3c_master_caps caps;
 	void __iomem *regs;
 	struct reset_control *core_rst;
+	struct reset_control *apb_rst;
 	struct clk *core_clk;
 	struct clk *pclk;
 	char version[5];
-- 
2.53.0

