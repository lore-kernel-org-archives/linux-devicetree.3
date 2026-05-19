Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2FF382397;
	Tue, 19 May 2026 06:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171020; cv=none; b=H0VdH0dR1Ez3AJwIzW33FV9YYcchZkPQDyGoVfXlTCDG8L+L6vMe9Irx/6e2Z15FeiRYbInN90OXSRTTDTQY/xByMOymkr+o6DsgF7t6APR4m1Um1FA++lBB5cowbcFJMiJIjB6doC5KdEsM0up0TPUEmd9CRinw18XpbLpXDO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171020; c=relaxed/simple;
	bh=wpKGBlOYBdKJ4Q3xmvvS2FfxdbVWdVLuU4ffh+M1+ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8b11N2ZFzPmIDcdNYnYGw0M0Z1PjhUPATuDnrT3V8mMbopu8fYT+6oiyNBm2cDri4t7Jl0dc24HiuwVqX13ZXPyYOKSSoiLrgM7xiqroXaaCU62n3XSMRAkpG3mszBda9SdkAv/Aq1AFf8UkPsQzQk55x4vYTkq06SQqPypKj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euTm77qq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euTm77qq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20626C2BCC6;
	Tue, 19 May 2026 06:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171020;
	bh=wpKGBlOYBdKJ4Q3xmvvS2FfxdbVWdVLuU4ffh+M1+ug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=euTm77qqOUp4jCvU4+5FWlkNyePO9vaVjVdyEekosoS2uR1WHOI4eE2wOe+lYRJvA
	 epkCk1DzgqJw0ldntiv7TNjsQi7mHy58vkalUuI71Q5RpLjF/RqZNQREpqll7nyum3
	 C/Omy2aJWpBN0+VprN/WodxdGb1gAS/GpgCGs8Yah7qZvDMobEQEP8n1LLvAr5ujAt
	 HxsJUAOzcqGbT/DFAatNRjtJe3SVcNFz47tAWHZ73MVlxWtf0s3ka4Gm+kIGE/bBSJ
	 C7alvT1hTtCqlopqcW6VAivP3aIqMLj8ii2Hlumi3cdT5zo7p1ufu3znZ+kDMGmh5a
	 5YMtwkY0WZkJA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] i3c: dw: Add apb reset support
Date: Tue, 19 May 2026 13:51:05 +0800
Message-ID: <20260519055105.13079-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519055105.13079-1-jszhang@kernel.org>
References: <20260519055105.13079-1-jszhang@kernel.org>
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
index c4a848cc978a..ae7aa6880e8f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1591,6 +1591,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
+	master->apb_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
+									       "apb");
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

