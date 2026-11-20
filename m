Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181599;
	b=SgpIRDWS6t+JKquaqqKImcy0JSblCu95T3o0xhoPugGE/jb/zGljvoQiuHUdghHnGh8e
	 +yj8gVMzmkA5NX69BEFoMGW+m2dTnrsL9vrjQ+7JlswYxpg1Ph1Numpr+CNaGWHHo49bf
	 9YQHApFvL8guAci9AlgWtSNVpPOHCX6F3KtHZ7rchJgfMiuf39gUC34qMk24AhvM17QJO
	 wEJCPFtux37fJwuGxnqaI6/9s9BGlOJJPEp/LIv93KO+DrTHrF0hYUT7hZFE7Hxdi4Gb/
	 yFomgBvW2TvEjXHiHySS1NtLGnBYQjc6qEmKxdBOGUGSZyxpyBPexNTfu8YiwMGPJzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181599;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rmF3PBjYjmcGICpHqzXZYxMwQUARFEhP12AnfntWJAY=;
	b=bBpwrj5v4aYVTHBaL/WthSBxR/XTzBoHn6yPm1A32+66r1yPdMtTqAv1UWJkS/3dqVr2
	 zr3v81oj1mjffXYIgr1NqOCWwxlNRXKiUv9BIRFN5MZ94HZI2oePAR1hbwFAn56qd69DM
	 6Hr5KmtRaAv5xdmlHkbU7U9peTd9huvYXTCXHLphBJrpo96HcF137rtBrhcKsTN+cUsfP
	 iDbJZKNMuI2Sl80hYlFdZ+Y9CgDe+bbu3FwHxCVix5dymGbxYZvKrNPHmE02r2thajrOL
	 mSqDwDwbmxpIX9bwYGY5tuVzpLl+gEwUGcRUiekrlNMMm8xIPaOa973ElAp1SSEIKSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bvyARTtQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A4606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bvyARTtQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706581F000C6;
	Fri, 20 Nov 2026 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795181598;
	bh=rmF3PBjYjmcGICpHqzXZYxMwQUARFEhP12AnfntWJAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bvyARTtQhbzLq+MzZPFBrXNYM/dhsXH38aoGvZWBteEOfRfH7Ogzsm1//OWvDwdxG
	 rWDewpnO8Y/OiOrzZo2X5Nc1wIQawnxh5LLR26uyDtLAZRuGTptI7w6KjMTWAts8Zh
	 cGwZaYV+jwioNHH7dgw6KGQDMuotFI7FjLXK/LZBdYr9U+xjHuaXfA7L5NXaVwxhpX
	 ukHFHNAYItMtpit7rmtfdGWOkVY0IZSyrWfjHB/4BP6u4EiX6w8GCe9bp9Rgl8HypF
	 qbz8+D7OFu0LI4TW/OmZFJSo5Ho29UGpApIf74GinWj2GlFfEybrCOc7excTApGUnq
	 yIW+tbV7Ttybw==
Message-ID: <sashiko-outbox-225247@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] phy: cadence-torrent: rewrite Torrent PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Robin" <benjamin.robin@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261120-phy-cadence-torrent-ng-v1-4-da2db7125cd7@bootlin.com>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-4-da2db7125cd7@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 13:33:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 14 potential
issues to consider:
- [High] phy: cadence-torrent: 32-bit shift overflow in
  tp_write_pll_regs()
- [High] phy: cadence-torrent: CDB register access before apb_rst
  deassertion
- [High] phy: cadence-torrent: DP init and configure break cdns-mhdp8546
  consumer
- [High] phy: cadence-torrent: missing mlane shift in
  tp_dptx_set_pll_en() and lanes
- [High] phy: cadence-torrent: nb_phy_on underflow in tp_phy_off() when
  preconfigured
- [High] phy: cadence-torrent: tp_resume_noirq() leaves active links
  held in reset
- [Medium] phy: cadence-torrent: REV_R110 enum typo in
  tp_write_pll_cp_padj()
- [Medium] phy: cadence-torrent: unreachable FBR mode in
  tp_calc_pcie_pll_fb_div_mode()
- [Medium] phy: cadence-torrent: stale SSC and divider regs in
  tp_write_pll_regs()
- [Medium] phy: cadence-torrent: unbalanced clk disable in
  tp_phy_cleanup()
- [Medium] phy: cadence-torrent: skipped refclk check in
  tp_ref_clks_init()
- [Medium] phy: cadence-torrent: missed PCIe ML flag in
  tp_check_multiple_pcie_links()
- [Medium] phy: cadence-torrent: rejected standard swap with clk1 in
  tp_find_link_cfg()
- [Medium] phy: cadence-torrent: unchecked tp_dp_run() and missing reset
  rollback
--

commit 3480ec972d0cd2d542d547f1d45d7f4f38415bc8
Author: Benjamin Robin <benjamin.robin@bootlin.com>

phy: cadence-torrent: rewrite Torrent PHY driver

This commit rewrites the Cadence Torrent PHY driver to compute clock and
PLL register values at runtime and look up remaining protocol, revision,
and process-node register settings per register instead of using static
register tables.

> diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cade=
nce/phy-cadence-torrent.c
> index 1e178aa2ffd76..74a65f0f4b242 100644
> --- a/drivers/phy/cadence/phy-cadence-torrent.c
> +++ b/drivers/phy/cadence/phy-cadence-torrent.c

[ ... ]

> @@ -394,5453 +515,4629 @@ enum phy_powerstate {
>  	POWERSTATE_A3 =3D 3,
>  };
> =20
> +static const struct tp_link_cfg tp_link_cfgs[] =3D {
> +	{
> +		/* PLL 0 M0: PCIe, PLL 0 M1: PCIe, PLL 1: None */
> +		.std0 =3D STD0_PCIE_SL,	.std1 =3D STD1_NONE,
> +		.pll_freq =3D { PLL_10_00_GHZ, PLL_8_00_GHZ, PLL_8_00_GHZ },
> +		.phy_pll_cfg =3D 0x0001,
> +		.pll_clk_sel =3D { 0x0601, 0x0400, 0x0400 },
> +		.xcvr_diag_plldrc_ctrl =3D { 0x0012, 0x0012 },
> +		.xcvr_diag_hsclk_sel =3D { 0x0000, 0x0000 },
> +		.xcvr_diag_hsclk_div =3D { 0x0001, 0x0001 },
> +	},

[ ... ]

> +static enum tp_pll_fb_div_mode tp_calc_pcie_pll_fb_div_mode(const struct=
 tp_phy *tp_phy)
> +{
> +	u32 tech_tag =3D tp_phy->tech_tag;
> +	enum tp_revision rev =3D tp_phy->rev;
> +	enum tp_pll_fb_div_mode div_mode;
> +
> +	if (tech_tag & (TECH_TSMC_16 | TECH_TSMC_12)) {
> +		if (rev =3D=3D REV_R100) {
> +			if (tp_phy->plls[PLL1_MODE0].freq_khz =3D=3D 0)
> +				div_mode =3D PLL_FB_DIV_MODE_FBR;
> +			else
> +				div_mode =3D PLL_FB_DIV_MODE_D32;
> +		} else {

[Severity: Medium]
Can tp_phy->plls[PLL1_MODE0].freq_khz ever be 0 here?

Every entry in tp_link_cfgs[], including single-link PCIe (STD0_PCIE_SL
with STD1_NONE), sets pll_freq[PLL1_MODE0] to a non-zero frequency
(PLL_8_00_GHZ) rather than PLL_UNUSED.  Because tp_init_plls_data()
populates plls[PLL1_MODE0].freq_khz from pll_freq[PLL1_MODE0] before
calling tp_calc_pll_fb_div_modes(), single-link PCIe on TSMC 16nm/12nm
REV_R100 hardware always selects PLL_FB_DIV_MODE_D32 instead of
PLL_FB_DIV_MODE_FBR, misprogramming the PLL control, VCO calibration, and
lock registers.

[ ... ]

> +static void tp_write_pll_cp_padj(const struct tp_phy *tp_phy, enum tp_pl=
l_id pll_id)
> +{
> +	u32 tech_tag =3D tp_phy->tech_tag;
> +	u32 rev_msk =3D BIT(tp_phy->rev);
> +	const struct tp_pll_data *pll =3D &tp_phy->plls[pll_id];
> +	u16 val;
> +
> +	/* PLL charge pump proportional path adjust register */
> +	if (pll->freq_khz < 8000000) {
> +		val =3D 0x0B17;
> +	} else if (pll->fractional_mode) {
> +		if (tech_tag & TECH_TSMC_7)
> +			val =3D 0x0B17;
> +		else if (tech_tag & (TECH_SS_5 | TECH_SS_7))
> +			val =3D 0x0309;
> +		else
> +			val =3D 0x0509; /* TSMC_5, TSMC_12, TSMC_16, TSMC_16_0805 */
> +	} else if (pll->freq_khz >=3D 10000000) {
> +		if (tech_tag & TECH_TSMC_7)
> +			val =3D (rev_msk & (REV_MSK_R100 | REV_MSK_R110)) ? 0x0023 : 0x0035;
> +		else if (tech_tag & TECH_TSMC_5)
> +			val =3D (pll_id =3D=3D PLL0_MODE0) ? 0x002D : 0x0035;
> +		else if (tech_tag & (TECH_SS_5 | TECH_SS_7))
> +			val =3D 0x013E;
> +		else
> +			val =3D 0x0028; /* TSMC_12, TSMC_16, TSMC_16_0805 */
> +	} else {
> +		if (tech_tag & TECH_TSMC_16)
> +			val =3D (rev_msk & REV_MSK_R100) ? 0x0028 : 0x0128;
> +		else if (tech_tag & TECH_TSMC_16_0805)
> +			val =3D 0x0128;
> +		else if (tech_tag & TECH_TSMC_12)
> +			val =3D 0x0028;
> +		else if (tech_tag & TECH_TSMC_7)
> +			val =3D (rev_msk & (REV_MSK_R100 | REV_R110)) ? 0x001D : 0x0031;

[Severity: Medium]
Should REV_R110 be REV_MSK_R110 in the TECH_TSMC_7 check?  REV_R110 is
the enum value 1 (equal to REV_MSK_R100) rather than BIT(REV_R110), so R110
hardware (rev_msk =3D=3D 0x2) never matches and programs
CMN_PDIAG_PLLx_CP_PADJ_Mx with 0x0031 instead of 0x001D for 8 GHz
integer-mode PLLs.

[ ... ]

> +static void tp_write_pll_fd_div_regs(const struct tp_phy *tp_phy, enum t=
p_pll_id pll_id,
> +				     u32 div_ratio)
> +{
> +	const struct tp_reg_base *base =3D &tp_phy->reg_common_cdb;
> +	const struct tp_pll_data *pll =3D &tp_phy->plls[pll_id];
> +	u32 tech_tag =3D tp_phy->tech_tag;
> +	u16 high_div;
> +	u16 low_div;
> +
> +	/* In fractional mode, we use default/reset value */
> +	if (pll->fractional_mode)
> +		return;
> +
> +	if (pll_id =3D=3D PLL0_MODE0 && pll->ref_clk_khz =3D=3D 100000 && pll->=
freq_khz =3D=3D 10000000) {
> +		/* 100 MHz refclk, 10 GHz PLL */
> +		if (tech_tag & (TECH_TSMC_12 | TECH_TSMC_16 | TECH_TSMC_16_0805)) {
> +			high_div =3D 30;
> +			low_div =3D 12;
> +		} else {
> +			high_div =3D 36;
> +			low_div =3D 6;
> +		}
> +	} else if (pll->ref_clk_khz =3D=3D 100000 && pll->freq_khz =3D=3D 80000=
00) {
> +		/* 100 MHz refclk, 8 GHz PLL */
> +		if (tech_tag & (TECH_TSMC_12 | TECH_TSMC_16 | TECH_TSMC_16_0805)) {
> +			high_div =3D 16;
> +			low_div =3D 16;
> +		} else {
> +			high_div =3D 28;
> +			low_div =3D 4;
> +		}
> +	} else {
> +		/* Generic calculations */
> +
> +		/* PLL high integer divider val: EVEN(div_ratio_2 * 67/100) - 4 */
> +		high_div =3D DIV_ROUND_UP((div_ratio >> 1) * 67U, 100U);
> +		high_div -=3D (high_div & 1U) ? 3U : 4U;
> +
> +		/* PLL low integer divider val: div_ratio_2 - 8 - high_div */
> +		low_div =3D (div_ratio >> 1) - 8 - high_div;
> +	}
> +
> +	tp_reg_write(base, CMN_PLLx_DSM_FBH_OVRD_Mx(pll_id), high_div);
> +	tp_reg_write(base, CMN_PLLx_DSM_FBL_OVRD_Mx(pll_id), low_div);
> +}
> +
> +static void tp_write_pll_itrim_reg(const struct tp_phy *tp_phy, enum tp_=
pll_id pll_id)
> +{
> +	const struct tp_reg_base *base =3D &tp_phy->reg_common_cdb;
> +	const struct tp_pll_data *pll =3D &tp_phy->plls[pll_id];
> +
> +	if (tp_phy->tech_tag & TECH_TSMC_ALL) {
> +		u16 val =3D (pll->freq_khz >=3D 10000000) ? 0x003F : 0x007F;
> +
> +		tp_reg_write(base, CMN_PDIAG_PLLx_ITRIM_Mx(pll_id), val);
> +	}
> +}
> +
> +static void tp_write_pll_regs(const struct tp_phy *tp_phy, enum tp_pll_i=
d pll_id)
> +{
> +	const struct tp_reg_base *base =3D &tp_phy->reg_common_cdb;
> +	const struct tp_pll_data *pll =3D &tp_phy->plls[pll_id];
> +	u32 fd_div_prescale;
> +	u32 div_ratio;
> +	u16 fracdivl;
> +	u16 val;
> +
> +	if (pll_id !=3D PLL0_MODE1)
> +		tp_write_pll_vco_regs(tp_phy, pll_id);
> +
> +	/* Divide ratio */
> +	div_ratio =3D pll->freq_khz / pll->ref_clk_khz;
> +
> +	/* PLL feedback divider prescale */
> +	fd_div_prescale =3D ((!pll->fractional_mode) || (div_ratio > 512)) ? 1 =
: 0;
> +
> +	/* PLL integer divider value */
> +	val =3D (pll->fractional_mode) ? (div_ratio >> fd_div_prescale) : 0;
> +	tp_reg_write(base, CMN_PLLx_INTDIV_Mx(pll_id), val);
> +
> +	/* PLL fractional divider value */
> +	if (pll->fractional_mode) {
> +		u32 den =3D pll->ref_clk_khz << fd_div_prescale;
> +		u32 rem =3D pll->freq_khz % den;
> +
> +		fracdivl =3D DIV_ROUND_CLOSEST(rem << 16, den);
> +	} else {
> +		fracdivl =3D 0;
> +	}
> +
> +	tp_reg_write(base, CMN_PLLx_FRACDIVL_Mx(pll_id), fracdivl);
> +	tp_reg_write(base, CMN_PLLx_FRACDIVH_Mx(pll_id), pll->fractional_mode ?=
 2 : 0);
> +
> +	/* PLL high threshold value */
> +	if (pll->fractional_mode) {
> +		/* EVEN(CEIL((fracdivl/65536 + (div_ratio >> fd_div_prescale)) * 2 / 3=
)) */
> +		u32 num =3D fracdivl + (div_ratio << (16 - fd_div_prescale));

[Severity: High]
Can rem << 16 overflow 32-bit u32 when computing fracdivl in
tp_write_pll_regs()?

When rem >=3D 65535 (for example, DisplayPort at the default 8100 Mbps rate
with a supported 156.25 MHz reference clock, where den =3D 156250 and
rem =3D 131250), rem << 16 overflows u32 and corrupts both
CMN_PLLx_FRACDIVL_Mx and CMN_PLLx_HIGH_THR_Mx (producing fracdivl =3D 0x004B
instead of 0xD70A).  Also, when fd_div_prescale =3D=3D 1 and div_ratio is o=
dd
(e.g. 20 MHz refclk with 10.3125 GHz USXGMII where div_ratio =3D 515),
div_ratio << (16 - fd_div_prescale) retains bit 0 of div_ratio instead of
using (div_ratio >> fd_div_prescale) << 16, double-counting the odd
remainder already included in fracdivl.

> +
> +		val =3D DIV_ROUND_UP(num, 3 << 15);
> +		if (val & 1)
> +			val++;
> +	} else {
> +		val =3D 0;
> +	}
> +
> +	tp_reg_write(base, CMN_PLLx_HIGH_THR_Mx(pll_id), val);
> +
> +	/* PLL delta sigma modulator diagnostics register */
> +	tp_reg_write(base, CMN_PLLx_DSM_DIAG_Mx(pll_id),
> +		     pll->fractional_mode ? 0x0004 : 0x4004);
> +
> +	/* PLL high and low integer divider value */
> +	tp_write_pll_fd_div_regs(tp_phy, pll_id, div_ratio);
> +
> +	if (pll->ssc)
> +		tp_write_ssc_ctrl(tp_phy, pll_id, fd_div_prescale);

[Severity: Medium]
Does dynamic DisplayPort rate reconfiguration leave stale values in
CMN_PLLx_SS_CTRL1_Mx..CTRL4_Mx and CMN_PLLx_DSM_FBH/FBL_OVRD_Mx?

When tp_dp_update_pll_freq() -> tp_write_pll_regs() reconfigures a DP link
from SSC enabled to SSC disabled, skipping tp_write_ssc_ctrl() leaves
CMN_PLLx_SS_CTRL1_Mx..CTRL4_Mx enabled in hardware while VCO and lock
counters are programmed for non-SSC operation.  Similarly, if a DP PLL
switches from integer mode (e.g. 2.7/5.4 Gbps with 100 MHz refclk and no
SSC) to fractional mode, returning early in tp_write_pll_fd_div_regs()
leaves the previous integer divider overrides in CMN_PLLx_DSM_FBH_OVRD_Mx
and CMN_PLLx_DSM_FBL_OVRD_Mx instead of restoring their reset values.

[ ... ]

> +static int tp_dptx_set_pll_en(const struct tp_phy *tp_phy, u32 num_lanes=
, bool enable)
> +{
> +	void __iomem *addr;
> +	u32 pll_ack_val;
> +	u32 rd_val;
> +	int ret;
> +
> +	/* Used to determine which bits to check for or enable in PHY_PMA_XCVR_=
PLLCLK_EN reg */
> +	u32 pll_bits;
> +	/* Used to enable or disable lanes. */
> +	u32 pll_val;
> +
> +	/* Select reg value and mask, depending on enabled lane count. */
> +	pll_val =3D tp_reg_dptx_read(tp_phy, PHY_PMA_XCVR_PLLCLK_EN);
> +
> +	if (enable) {
> +		pll_bits =3D ((1 << num_lanes) - 1);
> +		pll_val |=3D pll_bits;
> +		pll_ack_val =3D pll_bits;
> +	} else {
> +		pll_bits =3D ((1 << num_lanes) - 1);
> +		pll_val &=3D (~pll_bits);
> +		pll_ack_val =3D 0;
> +	}

[ ... ]

> +static void tp_dp_set_lanes(const struct tp_phy *tp_phy, struct tp_link =
*link, u32 num_lanes)
> +{
> +	u32 pma_tx_elec_idle_mask;
> +	u8 used_lane_mask;
> +	u8 all_lane_mask;
> +	u32 pll_clk_en;
> +	u32 pwr_state;
> +	u32 value;
> +	u32 mlane =3D link->mlane;
> +
> +	used_lane_mask =3D ((1U << num_lanes) - 1) << mlane;
> +	all_lane_mask =3D ((1U << link->max_lanes) - 1) << mlane;

[ ... ]

> +	/* Clear requested power state set PLL clock enable to 0 on all used la=
nes. */
> +	pwr_state =3D tp_reg_dptx_read(tp_phy, PHY_PMA_XCVR_POWER_STATE_REQ);
> +	pll_clk_en =3D tp_reg_dptx_read(tp_phy, PHY_PMA_XCVR_PLLCLK_EN);
> +
> +	for (u32 i =3D 0; i < num_lanes; ++i)
> +		pwr_state &=3D ~(PMA_XCVR_POWER_STATE_REQ_LN_MASK << PHY_POWER_STATE_L=
N(mlane + i));
> +
> +	pll_clk_en &=3D ~used_lane_mask;
> +
> +	tp_reg_dptx_write(tp_phy, PHY_PMA_XCVR_POWER_STATE_REQ, pwr_state);
> +	tp_reg_dptx_write(tp_phy, PHY_PMA_XCVR_PLLCLK_EN, pll_clk_en);
> +
> +	/* release master lane reset */
> +	value |=3D 1 << mlane;
> +	tp_reg_dptx_write(tp_phy, PHY_RESET, value);
> +
> +	/* update the number of used lanes */\n+	link->num_lanes =3D num_lanes;
> +}

[Severity: High]
Should pll_bits in tp_dptx_set_pll_en() be shifted by link->mlane?

Unlike tp_dp_set_lanes() and tp_dptx_set_power_state(), tp_dptx_set_pll_en()
computes pll_bits =3D ((1 << num_lanes) - 1) without shifting by link->mlan=
e,
so any DisplayPort link with mlane > 0 modifies PHY_PMA_XCVR_PLLCLK_EN for
lane 0 and times out polling PHY_PMA_XCVR_PLLCLK_EN_ACK.

In addition, tp_dp_set_lanes() only clears PHY_PMA_XCVR_POWER_STATE_REQ and
PHY_PMA_XCVR_PLLCLK_EN across used_lane_mask instead of all_lane_mask,
leaving disabled lanes' PLLCLK_EN bits set when reducing the lane count.
And when both set_lanes and set_rate are requested in tp_phy_configure(),
running tp_dp_set_lanes() before tp_dp_set_rate() resets the lanes, clears
PLLCLK_EN, and updates link->num_lanes before tp_dp_set_rate() transitions
the previously active lanes to POWERSTATE_A3 (while tp_write_lanes_reg()
also only programs link->num_lanes instead of link->max_lanes).

[ ... ]

> +static int tp_phy_configure(struct phy *phy, union phy_configure_opts *o=
pts)
> +{
> +	struct tp_phy *tp_phy =3D dev_get_drvdata(phy->dev.parent);
> +	struct tp_link *link =3D phy_get_drvdata(phy);
> +	bool run_needed =3D false;
> +	int ret;
> +
> +	guard(mutex)(&tp_phy->lock);
> +
> +	if (tp_phy->already_configured)
> +		return 0;
> +
> +	if (link->type !=3D STD_TYPE_DP)
> +		return -EINVAL;
> +
> +	ret =3D tp_dp_verify_config(link, &opts->dp);
> +	if (ret) {
> +		dev_err(&phy->dev, "invalid params for phy configure\n");
> +		return ret;
> +	}
> +
> +	if (opts->dp.set_lanes && opts->dp.lanes !=3D link->num_lanes) {
> +		tp_dp_set_lanes(tp_phy, link, opts->dp.lanes);
> +		run_needed =3D true;
> +	}
> +
> +	if (opts->dp.set_rate) {
> +		ret =3D tp_dp_set_rate(tp_phy, link, &opts->dp);
> +		if (ret) {
> +			dev_err(&phy->dev, "Set rate failed\n");
> +			return ret;
> +		}
> +		run_needed =3D true;
> +	}
> +
> +	if (opts->dp.set_voltages)
> +		tp_dp_set_voltages(tp_phy, link, &opts->dp);
> +
> +	if (phy->power_count && run_needed)
> +		ret =3D tp_dp_run(tp_phy, link);
> +
> +	return ret;
> +}

[Severity: High]
Does moving DisplayPort reset deassertion and tp_dp_run() out of
tp_phy_init() and gating tp_dp_run() on phy->power_count break
cdns-mhdp8546?

The in-tree DisplayPort bridge consumer
(drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c) calls phy_init() in
cdns_mhdp_probe() and phy_configure() in cdns_mhdp_link_training_init(),
but never calls phy_power_on().  Because tp_dp_phy_init() no longer
deasserts phy_rst/lnk_rst or starts the DP PLL and lanes, and
tp_phy_configure() skips tp_dp_run() when phy->power_count is 0, the PHY
remains held in reset and tp_dp_set_rate() polls PHY_PMA_CMN_CTRL2 on an
unstarted PHY.

> +
> +static int tp_phy_on(struct phy *phy)
> +{
> +	struct tp_link *link =3D phy_get_drvdata(phy);
> +	struct tp_phy *tp_phy =3D dev_get_drvdata(phy->dev.parent);
> +	u16 val;
> +	int ret;
> +
> +	guard(mutex)(&tp_phy->lock);
> +
> +	if (tp_phy->already_configured) {
> +		/* Give 5ms to 10ms delay for the PIPE clock to be stable */
> +		usleep_range(5000, 10000);
> +		return 0;
> +	}
> +
> +	if (tp_phy->nb_phy_on =3D=3D 0) {
> +		/* Take the PHY out of reset */
> +		ret =3D reset_control_deassert(tp_phy->phy_rst);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Take the PHY lane group out of reset */
> +	ret =3D reset_control_deassert(link->lnk_rst);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Wait for cmn_ready assertion
> +	 * PHY_PMA_CMN_CTRL1[0] =3D=3D 1
> +	 */
> +	ret =3D read_poll_timeout(tp_reg_read, val, val & 1, 1000, PLL_LOCK_TIM=
EOUT, false,
> +				&tp_phy->reg_phy_pma_common_cdb, PHY_PMA_CMN_CTRL1);
> +	if (ret) {
> +		dev_err(tp_phy->dev, "Timeout waiting for CMN ready\n");
> +		return ret;
> +	}
> +
> +	if (link->type =3D=3D STD_TYPE_DP) {
> +		tp_dp_run(tp_phy, link);
> +	} else if (link->type =3D=3D STD_TYPE_PCIE || link->type =3D=3D STD_TYP=
E_USB_TXRX) {
> +		struct tp_reg_base *reg_base;
> +
> +		reg_base =3D &tp_phy->reg_phy_pcs_lane_cdb[link->mlane];
> +		ret =3D read_poll_timeout(tp_reg_read, val, (val & 2) =3D=3D 0, 1000,
> +					PLL_LOCK_TIMEOUT, false, reg_base,
> +					PHY_PCS_ISO_LINK_CTRL);
> +		if (ret < 0) {
> +			dev_err(tp_phy->dev, "Timeout waiting for PHY status ready\n");
> +			return ret;
> +		}
> +	}
> +
> +	tp_phy->nb_phy_on++;
> +	return 0;
> +}

[Severity: Medium]
Should tp_phy_on() check the return value of tp_dp_run() and re-assert
link->lnk_rst and tp_phy->phy_rst on error?

Right now a timeout in tp_dp_run() is ignored and tp_phy_on() increments
nb_phy_on and returns 0.  Conversely, if deasserting link->lnk_rst or
polling PHY_PMA_CMN_CTRL1 or PHY_PCS_ISO_LINK_CTRL fails, tp_phy_on()
returns an error without re-asserting the resets it deasserted and without
incrementing phy->power_count, so tp_phy_off() will not be called to clean
them up.

> +
> +static int tp_phy_off(struct phy *phy)
> +{
> +	struct tp_link *inst =3D phy_get_drvdata(phy);
> +	struct tp_phy *tp_phy =3D dev_get_drvdata(phy->dev.parent);
> +	int ret;
> +
> +	guard(mutex)(&tp_phy->lock);
> +
> +	ret =3D reset_control_assert(inst->lnk_rst);
> +	if (ret)
> +		return ret;
> +
> +	if (tp_phy->nb_phy_on =3D=3D 1) {
> +		ret =3D reset_control_assert(tp_phy->phy_rst);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	tp_phy->nb_phy_on--;
> +	return 0;
> +}

[Severity: High]
Can tp_phy_off() underflow tp_phy->nb_phy_on when tp_phy->already_configured
is true?

When tp_phy->already_configured is true, tp_phy_on() returns early without
incrementing nb_phy_on (leaving it at 0), but tp_phy_off() has no
already_configured check: it asserts inst->lnk_rst and decrements the u8
nb_phy_on counter from 0 to 255.  A subsequent phy_power_on() then either
returns early with inst->lnk_rst still asserted, or after system suspend
clears already_configured, sees nb_phy_on !=3D 0, skips deasserting
tp_phy->phy_rst, and times out waiting for CMN ready.

[ ... ]

> +static int tp_ref_clk_init(const struct tp_phy *tp_phy, struct clk *clk,=
 const char *name,
> +			   u32 *p_ref_clk_khz)
> +{
> +	struct device *dev =3D tp_phy->dev;
> +	u32 ref_clk_rate;
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to prepare %s ref clock: %d\n", name, ret);
> +		return ret;
> +	}
> +
> +	ref_clk_rate =3D clk_get_rate(clk);
> +	if (!ref_clk_rate) {
> +		dev_err(dev, "Failed to get %s ref clock rate\n", name);
> +		ret =3D -EINVAL;
> +		goto disable_clk;
> +	}
> +
> +	for (u8 i =3D 0; i < tp_phy->nb_links; ++i) {
> +		if (!tp_is_ref_freq_supported(tp_phy->links[i].type, ref_clk_rate)) {
> +			dev_err(dev, "Invalid ref clock rate: %u Hz\n", ref_clk_rate);
> +			ret =3D -EINVAL;
> +			goto disable_clk;
> +		}
> +	}

[Severity: Medium]
Does this loop skip reference clock validation during probe and reject
valid dual-refclk configurations during resume?

In cdns_torrent_phy_probe(), tp_ref_clks_init() is called before the child
subnodes are parsed, so tp_phy->nb_links is 0 and this loop does not run
at probe time (allowing unsupported clock rates, or rates < 1000 Hz that
set ref_clk_khz to 0 and divide by zero in tp_write_pll_regs()).  Then in
tp_resume_noirq(), where nb_links > 0, tp_ref_clk_init() checks every link
against both tp_phy->clk and tp_phy->clk1 instead of only the links using
that PLL, failing resume with -EINVAL when PLL0 and PLL1 use different
protocol-specific reference frequencies.

[ ... ]

> +static void tp_check_multiple_pcie_links(struct tp_phy *tp_phy)
> +{
> +	struct tp_standard *std0 =3D &tp_phy->standards[0];
> +	u32 num_pcie_links =3D 0;
> +
> +	/* First check if the first standard is PCIe */
> +	if (std0->type !=3D STD_TYPE_PCIE)
> +		return;
> +
> +	/* Count the number of links with PCIe protocol. */
> +	for (u8 i =3D 0; i < tp_phy->nb_links; ++i) {
> +		if (tp_phy->links[i].type =3D=3D STD_TYPE_PCIE)
> +			num_pcie_links++;
> +	}
> +
> +	/* PCIe Multilink configuration can be supported along with a non-PCIe =
protocol.
> +	 * Such configurations are handled by adding a flag named STD_FLAG_PCIE=
_ML
> +	 */
> +	if (num_pcie_links > 1)
> +		std0->flags |=3D STD_FLAG_PCIE_ML;
> +}

[Severity: Medium]
Does tp_check_multiple_pcie_links() miss multi-link PCIe when a non-PCIe
subnode appears first in Device Tree?

tp_add_phy_from_of_subnode() populates tp_phy->standards[] in DT subnode
order, so if phy@0 is USB or SGMII and phy@1 and phy@2 are PCIe, PCIe is in
standards[1] when tp_check_multiple_pcie_links() runs.  Because
tp_check_multiple_pcie_links() only checks standards[0], it returns without
setting STD_FLAG_PCIE_ML, and when tp_find_link_cfg() subsequently swaps
standards[0] and standards[1], the driver matches single-link PCIe
(STD0_PCIE_SL) instead of multi-link PCIe (STD0_PCIE_ML).

[ ... ]

> +static int tp_find_link_cfg(struct tp_phy *tp_phy)
> +{
> +	const struct tp_link_cfg *link_cfg;
> +	struct device *dev =3D tp_phy->dev;
> +	struct tp_standard *std0 =3D &tp_phy->standards[0];
> +	struct tp_standard *std1 =3D &tp_phy->standards[1];
> +
> +	/* Verify the validity of standard index in links */
> +	for (u8 i =3D 0; i < tp_phy->nb_links; ++i) {
> +		const struct tp_link *link =3D &tp_phy->links[i];
> +
> +		if (WARN_ON(link->std_idx >=3D MAX_NUM_STANDARDS))
> +			return -EINVAL;
> +	}
> +
> +	link_cfg =3D tp_find_link_cfg_from_standards(std0, std1);
> +
> +	/* Only swap the two standards if PLL1 has no dedicated reference clock=
 */
> +	if (!link_cfg && !tp_phy->clk1) {
> +		link_cfg =3D tp_find_link_cfg_from_standards(std1, std0);
> +		if (link_cfg) {
> +			/* Swap the 2 standards */
> +			swap(tp_phy->standards[0], tp_phy->standards[1]);
> +
> +			for (u8 i =3D 0; i < tp_phy->nb_links; ++i)
> +				tp_phy->links[i].std_idx ^=3D 1;
> +		}
> +	}

[Severity: Medium]
Why is swapping standards[0] and standards[1] disallowed when tp_phy->clk1
is present?

standards[0] and standards[1] are populated in DT child subnode order (lane
order), whereas tp_link_cfgs[] orders entries by PLL assignment (std0 on
PLL0 clocked by refclk, std1 on PLL1 clocked by pll1_refclk).  When
pll1_refclk is provided and the protocol on lower lanes (phy@0) uses PLL1
(for example, USXGMII on phy@0 with PLL1 at 156.25 MHz and PCIe on phy@2
with PLL0 at 100 MHz), refusing to swap standards[0] and standards[1]
causes tp_find_link_cfg() to fail probe with -EINVAL.

[ ... ]

> +static void tp_phy_cleanup(const struct tp_phy *tp_phy)
> +{
> +	reset_control_assert(tp_phy->phy_rst);
> +	reset_control_assert(tp_phy->apb_rst);
> +
> +	for (u8 i =3D 0; i < tp_phy->nb_links; ++i) {
> +		reset_control_assert(tp_phy->links[i].lnk_rst);
> +		reset_control_put(tp_phy->links[i].lnk_rst);
> +	}
> +
> +	clk_disable_unprepare(tp_phy->clk1);
> +	clk_disable_unprepare(tp_phy->clk);
> +	tp_clk_cleanup(tp_phy);
> +}

[Severity: Medium]
Can tp_phy_cleanup() call clk_disable_unprepare() on clocks that were never
enabled or were already disabled?

In cdns_torrent_phy_probe(), jumping to cleanup when tp_of_get_clk() fails
on pll1_refclk after acquiring tp_phy->clk, when tp_ref_clks_init() fails
(after already disabling any clock it enabled), or when tp_phy->already_con=
figured
is true (where tp_ref_clks_init() is skipped, which also affects
cdns_torrent_phy_remove()) unconditionally calls clk_disable_unprepare() on
tp_phy->clk1 and tp_phy->clk, triggering clock enable/prepare count
underflow warnings.

[ ... ]

> +static int tp_suspend_noirq(struct device *dev)
> +{
> +	struct tp_phy *tp_phy =3D dev_get_drvdata(dev);
> +
> +	tp_refclk_driver_suspend(tp_phy);
> +
> +	for (u8 i =3D 0; i < tp_phy->nb_links; ++i)
> +		reset_control_assert(tp_phy->links[i].lnk_rst);
> +
> +	reset_control_assert(tp_phy->phy_rst);
> +	reset_control_assert(tp_phy->apb_rst);
> +
> +	if (tp_phy->already_configured) {
> +		tp_phy->already_configured =3D false;
> +	} else {
> +		clk_disable_unprepare(tp_phy->clk1);
> +		clk_disable_unprepare(tp_phy->clk);
> +	}
> +
> +	return 0;
> +}
> +
> +static int tp_resume_noirq(struct device *dev)
> +{
> +	int ret;
> +	struct tp_phy *tp_phy =3D dev_get_drvdata(dev);
> +
> +	ret =3D tp_refclk_driver_resume(tp_phy);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D tp_ref_clks_init(tp_phy);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable APB */
> +	reset_control_deassert(tp_phy->apb_rst);
> +
> +	ret =3D tp_configure_links(tp_phy);
> +	if (ret)
> +		goto put_lnk_rst;
> +
> +	return 0;

[Severity: High]
Does tp_resume_noirq() leave active links held in reset after suspend?

tp_suspend_noirq() asserts lnk_rst for every link and asserts phy_rst
without changing tp_phy->nb_phy_on, but tp_resume_noirq() only deasserts
apb_rst and calls tp_configure_links() without deasserting phy_rst or
lnk_rst.  Consumers that keep their PHY powered on across suspend (such as
am65-cpsw-nuss for SGMII/QSGMII/USXGMII) are left held in reset after
resume, and sibling consumers on the same SERDES that call
phy_power_off()/phy_power_on() across suspend/resume (such as pci-j721e)
see tp_phy->nb_phy_on !=3D 0 in tp_phy_on(), skip deasserting phy_rst, and
time out waiting for CMN ready.

> +
> +put_lnk_rst:
> +
> +	for (u8 i =3D 0; i < tp_phy->nb_links; ++i)
> +		reset_control_assert(tp_phy->links[i].lnk_rst);
> +
> +	reset_control_assert(tp_phy->apb_rst);
> +	reset_control_assert(tp_phy->phy_rst);
> +
> +	clk_disable_unprepare(tp_phy->clk1);
> +	clk_disable_unprepare(tp_phy->clk);
> +
> +	return ret;
> +}
> +
> +static DEFINE_NOIRQ_DEV_PM_OPS(tp_pm_ops, tp_suspend_noirq, tp_resume_no=
irq);
> +
> +static int cdns_torrent_phy_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	tp_reg_bases_init(tp_phy);
> +	tp_reg_fields_init(tp_phy);
> +
> +	ret =3D tp_read_techno_revision(tp_phy);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D tp_clk_register(tp_phy);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D tp_of_get_reset(tp_phy);
> +	if (ret)
> +		goto cleanup;
> +
> +	ret =3D tp_of_get_clk(tp_phy);
> +	if (ret)
> +		goto cleanup;
> +
> +	tp_phy->already_configured =3D tp_is_already_configured(tp_phy);
> +	if (!tp_phy->already_configured) {
> +		ret =3D tp_ref_clks_init(tp_phy);
> +		if (ret)
> +			goto cleanup;
> +
> +		/* Enable APB */
> +		reset_control_deassert(tp_phy->apb_rst);
> +	}

[Severity: High]
Are CDB registers accessed here and in tp_resume_noirq() while
tp_phy->apb_rst is still asserted?

cdns_torrent_phy_probe() reads the PHY ID registers in
tp_read_techno_revision(), writes CMN_CDIAG_REFCLK_DRV0_CTRL in
tp_clk_register(), and reads PHY_PMA_CMN_CTRL1 in
tp_is_already_configured() before tp_of_get_reset() and
reset_control_deassert(tp_phy->apb_rst) run.  Similarly, tp_resume_noirq()
calls tp_refclk_driver_resume() (reading and writing
CMN_CDIAG_REFCLK_DRV0_CTRL) before deasserting tp_phy->apb_rst, which was
asserted in tp_suspend_noirq().  On platforms using the torrent_apb reset
(or when re-probing after driver removal, which asserts apb_rst), accessing
CDB registers while APB is in reset can fail probe with -ENODEV, lose
register writes, or fault.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-phy-cadenc=
e-torrent-ng-v1-0-da2db7125cd7@bootlin.com?part=3D4
