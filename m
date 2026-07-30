Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F643E099;
	Thu, 30 Jul 2026 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419919; cv=none; b=Ib8IEgNIYqbgYTwDgvPGlHaWe7mpwUshWf9q9wSZZdbEDWPOZnIxpMAv+Zp51Ys7GZwQW3FPilU0/g5xhVG2x0Y/MPNR/a6LmNtrfqNOzgGvpfBgam5K4Pt1aIamCT7+ey0wGuTjh4tIbscqWI0vbk8C/5MEQ8Cs89xU2rXw67w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419919; c=relaxed/simple;
	bh=XeekueWJYwgQlYnEaivAKVgGgdRAwaAuyxtEpguw2s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdU4porJQspwq2WAWl+B8dqKsgex9yzLVZ6w+iHEMLCL6bWPvzXtLirdMDRw9hInoRNhi3BheUK7m0Q6J1I6Ew5Ut7k9f0Zvf3GrDywWJco3YlHATLxPeB5JHYJRyf+r0oylXvvZ0Pyblt0z9pZI/RqFiLLSYgw+KpGZ8nToij4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmaMOyH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmaMOyH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643611F000E9;
	Thu, 30 Jul 2026 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785419917;
	bh=+bRP00Y/Lh1mlMJhSwPjEn3hhNuhovG3+2cB8O1T9uw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QmaMOyH5bqvLcU0/EFbiAJD1GC1e1H/BZTqGF8JpB+gK212ls54sd8kd4RhNy9Keu
	 hyD1NqVmByGWPIQLoVXu0Pac8ZZkHRyfc6Jmtc/9ZugT34pFtB+RyaJK91Uvl3pYwZ
	 sZpKfvfLf9KRAcG/TOG9OxSc8c/b+HY+Layn0f3WcjLRWYLqqAg8vJ7yceXGCO58rS
	 bQuzIIpQ+eTGcdjTCr3vkbQpX0V3OJrDs9iP9XEOKDQw6fBkiCwFqoB7abF7NN22e4
	 NT2e+L4RdaNiLz2T5YaM9A4hulCqzYF+j+c/6/Z/Gz1Su+Ly52+oBc8Xjf7iGfWHfp
	 pV8Cnsi8jUUPg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 30 Jul 2026 15:58:15 +0200
Subject: [PATCH 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-phy-qcom-snps-femto-v2-8255-v1-2-8b8bf5105a68@kernel.org>
References: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
In-Reply-To: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Sriram Dash <quic_sriramd@quicinc.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7799;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=Y6TF8AMFBwsqkJM0Ng49x8m0m4lDilv5hIIlxVZ9prU=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqa1iGubDVtPqHLXKLqi41ARmLOgVprBoTDDyXU
 /YVbFPih92JATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCamtYhgAKCRAZDR20Zk4Z
 NQ4XCAC+X/K50CNWuKeU6ezlMUzTbYto5jPKoly2t3YZ8dDEt41OCQIekkRAgPgHeTxWZ+2aqYU
 sOoo14qaaOcbOcYfYtKxASwDVGmvksU/zCbLjSFn/E4vSCXPRM84TJx+QyeLLnPG1ZFBTx4yewC
 geJ2THVOUa6vEuxLysoMa6RVkhzh03S6l7FlWnTgacM0ZUbI5fFNOiji83wMI25P7P5bE7D3Q3f
 KeXxwMRsurDB6ga8bKSiVdPm+5t70iFCw59RZ1oD04uRIegLiq1Z5M63tO4p0otRJC8xv5iivIZ
 MyzLK6gDzQeYHlmaV4YMw/eI+wd/UiFaYlWbRVKHCNUI5MP3
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

From: Sriram Dash <quic_sriramd@quicinc.com>

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects.

In this variant, two disjoint sets of resources are modeled against
the power domain suppliers which can be turned on/off to achieve modeled
device states. Two modeled low power states d1 and d3 are supported.

transition: d0 <--> d3  :: both core and transfer suppliers
transition: d0 <--> d1  :: only transfer supplier

Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 126 ++++++++++++++++++++++++--
 1 file changed, 117 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index eb0b0f61d98e..4a9bd3ae0e53 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -95,6 +96,7 @@ struct override_param_map {
 	u8 table_size;
 	u8 reg_offset;
 	u8 param_mask;
+	bool fw_managed;
 };
 
 struct phy_override_seq {
@@ -121,6 +123,7 @@ struct phy_override_seq {
  * @phy_initialized: if PHY has been initialized correctly
  * @mode: contains the current mode the PHY is in
  * @update_seq_cfg: tuning parameters for phy init
+ * @pd_list: list of power domains associated with the device
  */
 struct qcom_snps_hsphy {
 	struct device *dev;
@@ -136,8 +139,81 @@ struct qcom_snps_hsphy {
 	bool phy_initialized;
 	enum phy_mode mode;
 	struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
+
+	struct dev_pm_domain_list *pd_list;
 };
 
+static void qcom_snps_domain_detach(void *data)
+{
+	struct qcom_snps_hsphy *hsphy = data;
+
+	dev_pm_domain_detach_list(hsphy->pd_list);
+}
+
+static int qcom_snps_domain_attach(struct qcom_snps_hsphy *hsphy)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags       = PD_FLAG_NO_DEV_LINK,
+		.pd_names       = (const char*[]) { "transfer", "core" },
+		.num_pd_names   = 2,
+	};
+	struct device *dev = hsphy->dev;
+	int ret;
+
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &hsphy->pd_list);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "domain attach failed\n");
+
+	return 0;
+}
+
+/* d3_to_d0 transition by turning on all the suppliers */
+static int qcom_snps_d3_to_d0(struct qcom_snps_hsphy *hsphy)
+{
+	int ret;
+
+	if (!hsphy->pd_list)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[0]);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
+	if (ret)
+		pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
+
+	return ret;
+}
+
+/* d0_to_d3 transition by turning off all the suppliers */
+static void qcom_snps_d0_to_d3(struct qcom_snps_hsphy *hsphy)
+{
+	if (!hsphy->pd_list)
+		return;
+
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
+}
+
+/* d1_to_d0 transition by turning on the 'transfer' supplier */
+static int qcom_snps_d1_to_d0(struct qcom_snps_hsphy *hsphy)
+{
+	if (!hsphy->pd_list)
+		return 0;
+
+	return pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[0]);
+}
+
+/* d0_to_d1 transition by turning off the 'transfer' supplier */
+static void qcom_snps_d0_to_d1(struct qcom_snps_hsphy *hsphy)
+{
+	if (!hsphy->pd_list)
+		return;
+
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
+}
+
 static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
 {
 	struct device *dev = hsphy->dev;
@@ -196,6 +272,8 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 					   0, USB2_AUTO_RESUME);
 	}
 
+	qcom_snps_d0_to_d1(hsphy);
+
 	return 0;
 }
 
@@ -203,7 +281,7 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
 {
 	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
 
-	return 0;
+	return qcom_snps_d1_to_d0(hsphy);
 }
 
 static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
@@ -316,6 +394,10 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
 	{ 1310, 0 },
 };
 
+static const struct override_param_map sa8255p_snps_hs_phy = {
+	.fw_managed = true,
+};
+
 static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{
 		"qcom,hs-disconnect-bp",
@@ -390,9 +472,15 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 
 	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
 
+	ret = qcom_snps_d3_to_d0(hsphy);
+	if (ret < 0) {
+		dev_err(hsphy->dev, "Failed to transition to d0 state\n");
+		return ret;
+	}
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	if (ret)
-		return ret;
+		goto transition_to_d3;
 
 	ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
 	if (ret) {
@@ -472,6 +560,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
 poweroff_phy:
 	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
+transition_to_d3:
+	qcom_snps_d0_to_d3(hsphy);
 
 	return ret;
 }
@@ -485,6 +575,8 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
 	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	hsphy->phy_initialized = false;
 
+	qcom_snps_d0_to_d3(hsphy);
+
 	return 0;
 }
 
@@ -496,6 +588,10 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 };
 
 static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
+	{
+		.compatible	= "qcom,sa8255p-usb-hs-phy",
+		.data		= &sa8255p_snps_hs_phy,
+	},
 	{ .compatible	= "qcom,sm8150-usb-hs-phy", },
 	{ .compatible	= "qcom,usb-snps-hs-5nm-phy", },
 	{
@@ -565,6 +661,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qcom_snps_hsphy *hsphy;
+	const struct override_param_map *cfg;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
 	int ret, i;
@@ -580,14 +677,25 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(hsphy->base))
 		return PTR_ERR(hsphy->base);
 
-	ret = qcom_snps_hsphy_clk_init(hsphy);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to initialize clocks\n");
+	cfg = of_device_get_match_data(dev);
+	if (cfg && cfg->fw_managed) {
+		ret = qcom_snps_domain_attach(hsphy);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, qcom_snps_domain_detach, hsphy);
+		if (ret)
+			return ret;
+	} else {
+		ret = qcom_snps_hsphy_clk_init(hsphy);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to initialize clocks\n");
 
-	hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(hsphy->phy_reset)) {
-		dev_err(dev, "failed to get phy core reset\n");
-		return PTR_ERR(hsphy->phy_reset);
+		hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+		if (IS_ERR(hsphy->phy_reset)) {
+			dev_err(dev, "failed to get phy core reset\n");
+			return PTR_ERR(hsphy->phy_reset);
+		}
 	}
 
 	num = ARRAY_SIZE(hsphy->vregs);

-- 
2.55.0

