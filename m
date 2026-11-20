Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182985;
	b=CUsxYwlfHt9zTUvE1pL0gAH05s2kfg11V0NtEbfAU8Ga2EAske4bIrC00uLGc8vBVex+
	 /2G+X4JkJBBWPXjg9eC4vo6do2Hjm5r79nQmOAvP6UtwxeGJDhopbLKNuQR6jm9aDSMjG
	 8l9/7DZBZ2VzGILjzBFSudolL+pMtuw5jAkRurUL9v5wfZaFmackhJeCE4iQipitkwWEG
	 crykgQTlilhBWlUC96ZIuDAe32gLZ4pyjCkyI8YOIIp0XrUWB9oqQ8kUizz28CO6EXVWy
	 6hN4JMxRy2Yw/EZFPNQ9ckbzu47xXF0EZWS/mTloWQKZoxYxpErRh8Xe4piG8ATokpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182985;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HUEP/0p+9k5IE/mviHMNkQgH46AfBL65dKNI7uo5/oQ=;
	b=H0Ne3Gyi8e9whBxQ4iilSO5JbsKJa6V0fpKFplhatLw4hvh3IOZ/CSklT1yjpxyQ8nI5
	 5LClj6sdjfp4d++sF9xNsglq20Pg8ZbumlIOFJpRS1jt16Bmh+0FeFLqxSGfLpKcf2aTP
	 16NCUKtSGHSjib/kvltjocIoD9oiZ5C9nGwthvNOyL9FmG5pn88yBkZOCUvmHTxmLaUyX
	 b6eRapWYmoGPUrevbNKq4u2b2KwHu+QfO4H41cp0WL5C1pCt/qLv1U06EQtsnb/poBoxo
	 mptWx6dN9y++q39cZ5xBdfeo5DxvBPC98WWD3dO/qlr5wlUV1AaEf7OrVsChI2mcUTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lE1EI0BX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DB760A3832;
	Fri, 20 Nov 2026 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lE1EI0BX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9262F1F000F2;
	Fri, 20 Nov 2026 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795182985;
	bh=HUEP/0p+9k5IE/mviHMNkQgH46AfBL65dKNI7uo5/oQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lE1EI0BXSyTZnzToAMJboTUb5O7YClbWtSgCkNpka4euf1b6LwFPB/c3bBpEP04xN
	 FZWbqO8BVMarjEUNneD5BXCgut0jAvz1KM/ZwrFgWTz5kYmjz2difkFEy+52rHHF+9
	 XcUrZ1sXiK6OYodAmQNbXnMF5KTdrhsydgLH3zphlHPVm21CY4vVK1XKkhYN6BKUhh
	 mlTYeasdCSdW1Zgiiti6EQL/j3yPlvljtrNxbHVnnB9NETaTrMyHbFKS/WCH9Ew33Q
	 YVBjcfzc+SBk9HKPgAoBDFRp+RoAfw3d1kvmEa3nkJRt3gAqEeFoPmNrFXJHMLCWAN
	 HWSVVpBrg5WRQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Fri, 20 Nov 2026 14:56:05 +0100
Subject: [PATCH v5 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-phy-qcom-snps-femto-v2-8255-v5-2-86a9880ee5a5@kernel.org>
References: <20261120-phy-qcom-snps-femto-v2-8255-v5-0-86a9880ee5a5@kernel.org>
In-Reply-To: <20261120-phy-qcom-snps-femto-v2-8255-v5-0-86a9880ee5a5@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sriram Dash <quic_sriramd@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12814;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=aV7O6WqGjf5Up9T8u/+eDnNlJDjw4OhjXzDba3DIo3Q=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBrAFGAUzryare53zk/q1itRwX14vRvAEd1eoy6l
 21EuWuoF6qJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCawBRgAAKCRAZDR20Zk4Z
 NcFJB/9qMS6aoSeS1vvFhBMybBSPV+fmfa/nMx+0akjwUlLy9goHByKBiqSJWanmBzN86i5lgKl
 EjmrjEj6UU0oYDga30aQLSVzSK9zbsQzRQIwtEFABLDhoC8kLE4MdI+wxIFo42sVqeUnio5UDkf
 W1eFPgT9if1o6uu1+75nOsf1K57iXoRF2zwGPPixxOufKGG+c388KsC8l9cZDo7cWD6CbePdUqv
 nxJO5BLsS0drJkFMtekDpktaS1S6rQlzVl0wygcoKu9461FYJGeDXqp2Xl/UKpJKLCVYyLEwwJV
 iT4qEP52YcNqIByz/hEeYCb+IPtdt5IjhlZBKrwluCQQ9Tox
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

From: Sriram Dash <quic_sriramd@quicinc.com>

SA8255p platform abstracts resources such as resets, clocks and
regulators in firmware. The SCMI firmware exposes multiple protocols to
control such resources which are identified by protocol_id.

For this USB phy, 2 SCMI protocols are exposed by the firmware:
* power domain management protocol (protocol_id=0x11)
* performance domain management protocol (protocol_id=0x13)

The power domain has 2 indices: 'core' and 'transfer'.
* core controls the regulators, the clocks and the reset
* transfer only controls the clocks

For example, to power on/off the PHY, we should use the 'core' domain.
To disable data transfer and keeping power enabled, we should use the
'transfer' domain.

Add support for the SCMI firmware-managed variant in the driver.

Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
for which we don't have any information. Since it is not mandatory
for the PHY to be functional, we have ommited it from the driver.

Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
Co-developed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 261 +++++++++++++++++++++-----
 1 file changed, 218 insertions(+), 43 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 0dae8369671a..0ec34bc5c26e 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -130,6 +131,7 @@ struct phy_config_data {
 	const struct phy_reg_config *post_tuning;
 	const u32 num_pre_tuning;
 	const u32 num_post_tuning;
+	bool fw_managed;
 };
 
 #define NUM_HSPHY_TUNING_PARAMS	(9)
@@ -149,6 +151,7 @@ struct phy_config_data {
  * @phy_initialized: if PHY has been initialized correctly
  * @mode: contains the current mode the PHY is in
  * @update_seq_cfg: tuning parameters for phy init
+ * @pd_list: list of power domains associated with the device
  */
 struct qcom_snps_hsphy {
 	struct device *dev;
@@ -164,8 +167,82 @@ struct qcom_snps_hsphy {
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
+		.pd_names       = (const char*[]) { "core", "transfer" },
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
+static bool qcom_snps_is_fw_managed(struct qcom_snps_hsphy *hsphy)
+{
+	return hsphy->pd_list != NULL;
+}
+
+static int qcom_snps_pds_enable_all(struct qcom_snps_hsphy *hsphy)
+{
+	int ret;
+
+	if (!qcom_snps_is_fw_managed(hsphy))
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
+static void qcom_snps_pds_disable_all(struct qcom_snps_hsphy *hsphy)
+{
+	if (!qcom_snps_is_fw_managed(hsphy))
+		return;
+
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
+}
+
+static int qcom_snps_pd_enable_transfer(struct qcom_snps_hsphy *hsphy)
+{
+	if (!qcom_snps_is_fw_managed(hsphy))
+		return 0;
+
+	return pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
+}
+
+static void qcom_snps_pd_disable_transfer(struct qcom_snps_hsphy *hsphy)
+{
+	if (!qcom_snps_is_fw_managed(hsphy))
+		return;
+
+	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
+}
+
 static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
 {
 	struct device *dev = hsphy->dev;
@@ -224,6 +301,8 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 					   USB2_AUTO_RESUME, 0);
 	}
 
+	qcom_snps_pd_disable_transfer(hsphy);
+
 	return 0;
 }
 
@@ -231,7 +310,7 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
 {
 	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
 
-	return 0;
+	return qcom_snps_pd_enable_transfer(hsphy);
 }
 
 static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
@@ -469,18 +548,45 @@ static const struct phy_reg_config hs_6nm_phy_post_tuning[] = {
 	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
 };
 
-static int qcom_snps_hsphy_init(struct phy *phy)
+static int qcom_snps_hsphy_configure(struct qcom_snps_hsphy *hsphy)
 {
-	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
 	const struct phy_config_data *data;
-	int ret, i;
-
-	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
+	int i;
 
 	data = of_device_get_match_data(hsphy->dev);
 	if (!data)
 		return -ENODEV;
 
+	for (i = 0; i < data->num_pre_tuning; i++)
+		qcom_snps_hsphy_write_mask(hsphy->base,
+					   data->pre_tuning[i].offset,
+					   data->pre_tuning[i].mask,
+					   data->pre_tuning[i].val);
+
+	for (i = 0; i < ARRAY_SIZE(hsphy->update_seq_cfg); i++) {
+		if (hsphy->update_seq_cfg[i].need_update)
+			qcom_snps_hsphy_write_mask(hsphy->base,
+					hsphy->update_seq_cfg[i].offset,
+					hsphy->update_seq_cfg[i].mask,
+					hsphy->update_seq_cfg[i].value);
+	}
+
+	for (i = 0; i < data->num_post_tuning; i++)
+		qcom_snps_hsphy_write_mask(hsphy->base,
+					   data->post_tuning[i].offset,
+					   data->post_tuning[i].mask,
+					   data->post_tuning[i].val);
+
+	return 0;
+}
+
+static int qcom_snps_hsphy_init(struct phy *phy)
+{
+	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+	int ret;
+
+	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	if (ret)
 		return ret;
@@ -505,30 +611,18 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 		goto disable_clks;
 	}
 
-	for (i = 0; i < data->num_pre_tuning; i++)
-		qcom_snps_hsphy_write_mask(hsphy->base,
-					   data->pre_tuning[i].offset,
-					   data->pre_tuning[i].mask,
-					   data->pre_tuning[i].val);
-
-	for (i = 0; i < ARRAY_SIZE(hsphy->update_seq_cfg); i++) {
-		if (hsphy->update_seq_cfg[i].need_update)
-			qcom_snps_hsphy_write_mask(hsphy->base,
-					hsphy->update_seq_cfg[i].offset,
-					hsphy->update_seq_cfg[i].mask,
-					hsphy->update_seq_cfg[i].value);
+	ret = qcom_snps_hsphy_configure(hsphy);
+	if (ret) {
+		dev_err(&phy->dev, "failed to configure phy, %d\n", ret);
+		goto assert_reset;
 	}
 
-	for (i = 0; i < data->num_post_tuning; i++)
-		qcom_snps_hsphy_write_mask(hsphy->base,
-					   data->post_tuning[i].offset,
-					   data->post_tuning[i].mask,
-					   data->post_tuning[i].val);
-
 	hsphy->phy_initialized = true;
 
 	return 0;
 
+assert_reset:
+	reset_control_assert(hsphy->phy_reset);
 disable_clks:
 	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
 poweroff_phy:
@@ -556,6 +650,46 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static int qcom_snps_hsphy_fw_managed_init(struct phy *phy)
+{
+	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = qcom_snps_pds_enable_all(hsphy);
+	if (ret) {
+		dev_err(&phy->dev, "failed to enable pds, %d\n", ret);
+		return ret;
+	}
+
+	ret = qcom_snps_hsphy_configure(hsphy);
+	if (ret) {
+		dev_err(&phy->dev, "failed to configure phy, %d\n", ret);
+		qcom_snps_pds_disable_all(hsphy);
+		return ret;
+	}
+
+	hsphy->phy_initialized = true;
+
+	return 0;
+}
+
+static int qcom_snps_hsphy_fw_managed_exit(struct phy *phy)
+{
+	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+
+	qcom_snps_pds_disable_all(hsphy);
+	hsphy->phy_initialized = false;
+
+	return 0;
+}
+
+static const struct phy_ops qcom_snps_hsphy_fw_managed_ops = {
+	.init		= qcom_snps_hsphy_fw_managed_init,
+	.exit		= qcom_snps_hsphy_fw_managed_exit,
+	.set_mode	= qcom_snps_hsphy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
 static const struct phy_config_data hs_5nm_phy = {
 	.pre_tuning = hs_5nm_phy_pre_tuning,
 	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
@@ -563,6 +697,14 @@ static const struct phy_config_data hs_5nm_phy = {
 	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
 };
 
+static const struct phy_config_data hs_5nm_fw_managed_phy = {
+	.pre_tuning = hs_5nm_phy_pre_tuning,
+	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
+	.post_tuning = hs_5nm_phy_post_tuning,
+	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
+	.fw_managed = true,
+};
+
 static const struct phy_config_data hs_6nm_phy = {
 	.pre_tuning = hs_6nm_phy_pre_tuning,
 	.num_pre_tuning = ARRAY_SIZE(hs_6nm_phy_pre_tuning),
@@ -592,6 +734,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
 		.compatible	= "qcom,ipq9650-usb-hs-phy",
 		.data		= &hs_6nm_phy,
 	},
+	{
+		.compatible	= "qcom,sa8255p-usb-hs-phy",
+		.data		= &hs_5nm_fw_managed_phy,
+	},
 	{
 		.compatible	= "qcom,usb-snps-hs-7nm-phy",
 		.data		= &hs_7nm_phy,
@@ -661,14 +807,42 @@ static void qcom_snps_hsphy_read_override_param_seq(struct device *dev)
 	}
 }
 
+static int qcom_snps_hsphy_init_resources(struct qcom_snps_hsphy *hsphy)
+{
+	struct device *dev = hsphy->dev;
+	int ret, i, num;
+
+	ret = qcom_snps_hsphy_clk_init(hsphy);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize clocks\n");
+
+	hsphy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(hsphy->phy_reset)) {
+		dev_err(dev, "failed to get phy core reset\n");
+		return PTR_ERR(hsphy->phy_reset);
+	}
+
+	num = ARRAY_SIZE(hsphy->vregs);
+	for (i = 0; i < num; i++)
+		hsphy->vregs[i].supply = qcom_snps_hsphy_vreg_names[i];
+
+	ret = devm_regulator_bulk_get(dev, num, hsphy->vregs);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				"failed to get regulator supplies\n");
+
+	return 0;
+}
+
 static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qcom_snps_hsphy *hsphy;
+	const struct phy_config_data *data;
 	struct phy_provider *phy_provider;
+	const struct phy_ops *phy_ops;
 	struct phy *generic_phy;
-	int ret, i;
-	int num;
+	int ret;
 
 	hsphy = devm_kzalloc(dev, sizeof(*hsphy), GFP_KERNEL);
 	if (!hsphy)
@@ -680,24 +854,25 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(hsphy->base))
 		return PTR_ERR(hsphy->base);
 
-	ret = qcom_snps_hsphy_clk_init(hsphy);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to initialize clocks\n");
-
-	hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(hsphy->phy_reset)) {
-		dev_err(dev, "failed to get phy core reset\n");
-		return PTR_ERR(hsphy->phy_reset);
-	}
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
 
-	num = ARRAY_SIZE(hsphy->vregs);
-	for (i = 0; i < num; i++)
-		hsphy->vregs[i].supply = qcom_snps_hsphy_vreg_names[i];
+	if (data->fw_managed) {
+		phy_ops = &qcom_snps_hsphy_fw_managed_ops;
+		ret = qcom_snps_domain_attach(hsphy);
+		if (ret)
+			return ret;
 
-	ret = devm_regulator_bulk_get(dev, num, hsphy->vregs);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to get regulator supplies\n");
+		ret = devm_add_action_or_reset(dev, qcom_snps_domain_detach, hsphy);
+		if (ret)
+			return ret;
+	} else {
+		phy_ops = &qcom_snps_hsphy_gen_ops;
+		ret = qcom_snps_hsphy_init_resources(hsphy);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * Enable runtime PM before creating the PHY, phy_create() only enables
@@ -717,7 +892,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_ops);
+	generic_phy = devm_phy_create(dev, NULL, phy_ops);
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
 		dev_err(dev, "failed to create phy, %d\n", ret);

-- 
2.56.0

