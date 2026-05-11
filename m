Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A34136D4E1;
	Mon, 11 May 2026 03:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778470735; cv=none; b=p0cidQqTbr+3Hw/gWHLSYPPli/HobCAy/AYvqVqaI13wjZWobTJNCSLR4DB3ra7Nc6vxxDrXoPxXqSWi+9lxrJR/adGJBD85n1yCDESd/rRcSWU5OmqIXciyeKzzVMD5H0pRRh+qS8X/i0P8lfzjR6ytGOVHy2n61nyfxFWMhBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778470735; c=relaxed/simple;
	bh=3454wlriFBYA1PmIAk/pGLH1G5fs1iNZBJZwMOMScAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkU4gK9RlCGqE2e4DGJzSo1sZRpRrDQ/9iBRxOjkMKznmKG4DzLc8Tbg5VhCKI4OzwHM0JZtD2rcJULkjl6HmXrsBtfqt1Sb/J+kMPjXnNLSeVf42RAdFT3WigWRei/zzXjUjbiwJkN3QfB2TWPwQQ1BRyMoIUsHF9Me9b7WjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibSDnOdN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibSDnOdN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE8FC2BCB8;
	Mon, 11 May 2026 03:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778470735;
	bh=3454wlriFBYA1PmIAk/pGLH1G5fs1iNZBJZwMOMScAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ibSDnOdNyd2gnWmV+NNehOso6/U/BMH0iKY+X9yUw0n/PTQtILvN0NqQHiryo1Cef
	 /QeS1g9DlGjUeUjVysGmmVVS0pDrGepP++sa/OugY9+ru2vQV7gK9OzoSm82NpjX9C
	 Zg0KkhRQ5eciVL0vyNqKdlIWEHfNSnmevWqhkdbAh44hQlseQ7RAGAqAL15IMngXRr
	 Jqkii7e3pbR5YBVwqEcXswaw7bn8clwTbpKsDMp7W4sne0mzRTe+H89CA+TYn98cwP
	 1dYK+W27XFzuhtS1hqCVnXD098C5zxGBjwFdsyzjrqhsJrqoZ6tVVXVymtX9jHiiCn
	 pEimzSsud7jfg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] i3c: dw: Add apb reset support
Date: Mon, 11 May 2026 11:19:45 +0800
Message-ID: <20260511031945.3228-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511031945.3228-1-jszhang@kernel.org>
References: <20260511031945.3228-1-jszhang@kernel.org>
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

