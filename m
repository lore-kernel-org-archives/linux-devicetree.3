Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CCE473C98;
	Fri,  7 Aug 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106901; cv=none; b=s3iXBw97w0JZwm2Fo3dERLV5CR8rUDexZ3hNDdhXzZzdI8nqq55yzwMWrBmf0OA6rvmDwjAcVSTdbDZkZ9Kp+P3WFmCeTfq4+wNh6lQ9wx2YqQ4rP4KasDUf3hcIBwvyiPwooaabNd8B659MZGTmF6wIwoiqtk2zw8/8Atuwutw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106901; c=relaxed/simple;
	bh=PxHfEB9Y1v2ILSRL88PHMNz+StiF/mHkYuq+FoVQISc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9lmY4CA0gdid8naxQWFDe7wjKdQnzRWrAQ2P7IXYZY8sYv7kTsR0ohy0OXV7jmrBFvmBXBMYKHM8LaR0fbOczewelpSFcXuW7xcpEqBl7MTRPJsmRHHOBqZlBitS6w5vKFYNgw++e8HBeCd+DcKM5vtY+2STaVzPAl4TzpBez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWfYP+qQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWfYP+qQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8071F000E9;
	Fri,  7 Aug 2026 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786106896;
	bh=02le9TIYUJajsnxfzn/O9e46NaSWCjzzgI7j+OcWoP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BWfYP+qQPalyWYo2IQ8GGwWKMXbevehSKKcioJCmU85DkOjS/LNA52/7L3/bdBEEo
	 io4dRQ4FGdDJRscPL4CizUKIt46z2JDO5lOjxZZhGeyIos82HGX5xTIeACJX6RXYiK
	 mJJBJlofbp8LOv/1++/t7vX2uepxXOoWxQFRyP/a1veL7zV2anuPowWRbZF4HkejLd
	 4XtYeaSYlhk1s9suyZ2zgJIVWRtcm0fUd8eyzwRqTfJP/mCFfDkqmtHHdgZqFPRB8I
	 t4wshEgAHX1n2NQYyPcksMCJ8naE10IwxHLEgWcXHVVaiAve0SHutBcXuJgTmurwFQ
	 NPGVvKttDp37g==
Date: Fri, 7 Aug 2026 14:48:03 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com, 
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, Mika Westerberg <westeri@kernel.org>, 
	Sven Peter <sven@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Message-ID: <dgvdvug7zeoommfh6iszybwzpcm6f5vz3pwkpamtezjxenx4ua@ew5xgoc5reqd>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-3-ccf0f7ea98b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-topic-usb4phy-v3-3-ccf0f7ea98b5@oss.qualcomm.com>

On Thu, Jul 30, 2026 at 04:19:15PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> a flavor called USB43DP, which as the name implies, features USB4, USB3
> and DP signal processing capabilities. In that architecture, USB3 and
> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> The DP part is roughly the same as on the instances without USB4.
> 
> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> Only one USB protocol (and flavor of pipe clock) can be active at a
> given moment (not to be confused with USB3 not being able to be
> tunneled as USB4 packets - that of course remains possible).
> The DP PLL is still used for clocking tunneled DP links. It may be
> turned off to save power when no tunnels are active, but that's left as
> a TODO item for now.
> 
> Due to the nature of USB4, the Type-C handling happens entirely inside
> the Host Router, and as such the QMPPHY's mux_set() function is
> nullified for the period when USB4 PHY remains active. This is strictly
> necessary, as the Host Router driver is going to excercise manual
> control over the USB4 PHY's power state, which is needed by the suspend
> and resume flows. Failure to control that synchronously with other
> parts of the code results in a SoC crash by unlocked access.
> 
> Because of that, a new struct phy is spawned to expose the USB4 mode,
> along with a .set_mode callback to allow toggling between USB4 and TBT3
> submodes.
> 
> Thunderbolt 3, having a number of differences vs USB4, requires a
> couple specific overrides, pertaining to electrical characteristics,
> which are easily accommodated for.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
>  1 file changed, 322 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index cdcfad2e86b1..b80eac9d7140 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -22,6 +22,7 @@
>  #include <linux/usb/typec.h>
>  #include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
> +#include <linux/usb/typec_tbt.h>
>  
>  #include <drm/bridge/aux-bridge.h>
>  
> @@ -61,10 +62,14 @@
>  #define SW_USB3PHY_RESET			BIT(2)
>  /* mux to select USB3 PHY reset control, 0:HW control, 1: software reset */
>  #define SW_USB3PHY_RESET_MUX			BIT(3)
> +#define SW_USB4PHY_RESET			BIT(4)
> +#define SW_USB4PHY_RESET_MUX			BIT(5)
>  
>  /* QPHY_V3_DP_COM_PHY_MODE_CTRL register bits */
>  #define USB3_MODE				BIT(0) /* enables USB3 mode */
>  #define DP_MODE					BIT(1) /* enables DP mode */
> +#define USB4_MODE				BIT(2) /* mutually exclusive with the above */
> +#define DP_TUNNELING_CLOCK_GEN_EN		BIT(3)
>  
>  /* QPHY_V3_DP_COM_TYPEC_CTRL register bits */
>  #define SW_PORTSELECT_VAL			BIT(0)
> @@ -77,6 +82,8 @@ enum qmpphy_mode {
>  	QMPPHY_MODE_USB3DP = 0,
>  	QMPPHY_MODE_DP_ONLY,
>  	QMPPHY_MODE_USB3_ONLY,
> +	/* USB4 QMPPHY mode refers to both USB4 and TBT3 */
> +	QMPPHY_MODE_USB4,
>  };
>  
>  /* set of registers with offsets different per-PHY */
> @@ -89,6 +96,7 @@ enum qphy_reg_layout {
>  	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
>  	QPHY_PCS_POWER_DOWN_CONTROL,
>  	QPHY_PCS_CLAMP_ENABLE,
> +	QPHY_PCS_USB4_CLAMP_ENABLE,
>  
>  	QPHY_COM_RESETSM_CNTRL,
>  	QPHY_COM_C_READY_STATUS,
> @@ -2198,6 +2206,8 @@ struct qmp_combo_offsets {
>  	u16 dp_txa;
>  	u16 dp_txb;
>  	u16 dp_dp_phy;
> +	u16 usb4_serdes;
> +	u16 usb4_pcs;
>  };
>  
>  struct qmp_phy_cfg {
> @@ -2245,6 +2255,18 @@ struct qmp_phy_cfg {
>  	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
>  	void (*dp_aux_init)(struct qmp_combo *qmp);
>  
> +	/* USB4 specifics */
> +	const struct qmp_phy_init_tbl *usb4_serdes_tbl;
> +	int usb4_serdes_tbl_num;
> +	const struct qmp_phy_init_tbl *usb4_serdes_tb3_ovrd_tbl;
> +	int usb4_serdes_tb3_ovrd_num;
> +	const struct qmp_phy_init_tbl *usb4_tx_tbl;
> +	int usb4_tx_tbl_num;
> +	const struct qmp_phy_init_tbl *usb4_rx_tbl;
> +	int usb4_rx_tbl_num;
> +	const struct qmp_phy_init_tbl *usb4_pcs_tbl;
> +	int usb4_pcs_tbl_num;
> +
>  	/* resets to be requested */
>  	const char * const *reset_list;
>  	int num_resets;
> @@ -2286,8 +2308,12 @@ struct qmp_combo {
>  	void __iomem *dp_tx2;
>  	void __iomem *dp_dp_phy;
>  
> +	void __iomem *usb4_serdes;
> +	void __iomem *usb4_pcs;
> +
>  	struct clk *pipe_clk;
>  	struct clk_bulk_data *clks;
> +	struct clk *p2rr2p_pipe_clk;
>  	int num_clks;
>  	struct reset_control_bulk_data *resets;
>  	struct regulator_bulk_data *vregs;
> @@ -2306,6 +2332,10 @@ struct qmp_combo {
>  	unsigned int dp_init_count;
>  	bool dp_powered_on;
>  
> +	struct phy *usb4_phy;
> +	enum tbt_phy_submode usb4_phy_submode;
> +	unsigned int usb4phy_init_count;

There is already 'usb_init_count', so can this be named as 'usb4_init_count'?

> +
>  	struct clk_fixed_rate pipe_clk_fixed;
>  	struct clk_hw dp_link_hw;
>  	struct clk_hw dp_pixel_hw;

[...]

> +static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_mode new_mode)
> +{
> +	dev_dbg(qmp->dev, "qmp_combo_reconfigure_phy: switching from qmpphy mode %d to %d\n",
> +		qmp->qmpphy_mode, new_mode);
> +

Looks like a downstream debug leftover.

> +	if (qmp->usb_init_count || qmp->usb4phy_init_count)
> +		qmp_combo_usb_power_off(qmp->usb_phy);
> +
> +	if (qmp->dp_init_count)
> +		writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +	qmp_combo_com_exit(qmp, true);
> +

No delay required between power off/on?

> +	qmp->qmpphy_mode = new_mode;
> +
> +	/* Now everything's powered down, power up the right PHYs */
> +	qmp_combo_com_init(qmp, true);
> +
> +	if ((qmp->usb_init_count || qmp->usb4phy_init_count) &&
> +	    new_mode != QMPPHY_MODE_DP_ONLY)
> +		qmp_combo_usb_power_on(qmp->usb_phy);
> +
> +	if ((new_mode == QMPPHY_MODE_USB3DP || new_mode == QMPPHY_MODE_DP_ONLY) &&
> +	    qmp->dp_init_count)
> +		qmp->cfg->dp_aux_init(qmp);
> +
> +	return 0;
> +}
> +
> +static int qmp_combo_usb4_init(struct phy *phy)
> +{
> +	struct qmp_combo *qmp = phy_get_drvdata(phy);
> +	int ret;
> +
> +	guard(mutex)(&qmp->phy_mutex);
> +
> +	if (!qmp->p2rr2p_pipe_clk) {
> +		dev_err(qmp->dev, "missing p2rr2p_pipe clock handle. Update your Device Tree.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = clk_prepare_enable(qmp->p2rr2p_pipe_clk);
> +	if (ret) {
> +		dev_err(qmp->dev, "p2rr2p_pipe enable failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = qmp_combo_com_init(qmp, false);
> +	if (ret)
> +		return ret;

Missing clk_disable_unprepare() here and below?

> +
> +	/* USB4 mode takes precedence to USB3(+DP), force reconfigure the PHY */
> +	ret = qmp_combo_reconfigure_phy(qmp, QMPPHY_MODE_USB4);
> +	if (ret)

Missing qmp_combo_com_exit().

> +		return ret;
> +
> +	ret = qmp_combo_usb_power_on(phy);
> +	if (ret) {
> +		qmp_combo_com_exit(qmp, false);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Due to the SoC design, the PHY only has a single valid consumer and
> +	 * preventing it from having sole ownership of the PHY's power state
> +	 * makes suspending/resuming the router impossible.
> +	 */
> +	WARN_ON(qmp->usb4phy_init_count++);
> +
> +	return 0;
> +}
> +
> +static int qmp_combo_usb4_exit(struct phy *phy)
> +{
> +	struct qmp_combo *qmp = phy_get_drvdata(phy);
> +	int ret;
> +
> +	guard(mutex)(&qmp->phy_mutex);
> +
> +	ret = qmp_combo_usb_power_off(qmp->usb_phy);
> +	if (ret)
> +		return ret;
> +
> +	ret = qmp_combo_com_exit(qmp, false);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Mark the USB4 PHY uninitialized and wait for a mux_set event to determine the correct
> +	 * setting. This will always be possible because USB4 requires Type-C.
> +	 */
> +	qmp->usb4phy_init_count--;
> +
> +	clk_disable_unprepare(qmp->p2rr2p_pipe_clk);
> +
> +	return 0;
> +}
> +
> +static int qmp_combo_usb4_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> +{
> +	struct qmp_combo *qmp = phy_get_drvdata(phy);
> +
> +	if (mode != PHY_MODE_TBT)
> +		return -EINVAL;
> +
> +	if (submode == PHY_SUBMODE_USB4 || submode == PHY_SUBMODE_TBT3) {
> +		qmp->usb4_phy_submode = submode;
> +		return 0;
> +	}

Idiomatic style is to error out if the condition is not met and return success
otherwise:

	if (submode != PHY_SUBMODE_USB4 && submode != PHY_SUBMODE_TBT3)
		return -EINVAL;

	qmp->usb4_phy_submode = submode;

	return 0;

- Mani

-- 
மணிவண்ணன் சதாசிவம்
