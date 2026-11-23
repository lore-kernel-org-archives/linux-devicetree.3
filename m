Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465934;
	b=l+ylTQQy2fzIhp3YUXiLV9lGKxT3ZR3p/TRO3pEnuW1Ic57ZyHg7dnii4vqlKvh6CIJa
	 V9jbW7rvufHQrSzy54OtQF4Gs4AEvBILL9hJafRJzzKujhcXL/q/9Csyazr6ucLKROxRf
	 QB60dQe4KsQ4ODaAIv3P1G5tUItuNk1IWvfop0F28cOMmrrD0zUj+xH0Tszm/g8PsEiJx
	 g/SQ2QjEat19buUSBuGtzbeSxJRJtEylEgwQP9aNhuj6rnxHJdonYNfh58JEHz/u8EZIc
	 01OKFUn5/HCJeHf5/PTlUvfl0Zv2G5jyzoAh5iNON35umDZfBnBR3HXpN4D1BFjjbQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465934;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=crdpRbf/fj88j4MDqPdQowdHt/HZuMRPboLP7OQ8lXI=;
	b=qNtOI3c6t4+ZVdUbbppbfXl0MSygohY170fU4JdlDM4YZyFhVigincG4LR2+WC2b0SHg
	 T23bIstyIqIWFrudLTiV8ny18gomAwjKkBok+1hRtp6bBdesKoxxjD9079CrnEkJnzHd6
	 PWMI/FlKOZ6XNVvaYeK0DK6j5wnBJtbub+ZWRqA9hHkjwcyan5DI4Dy8AfLzcRvB6Ycd8
	 2QgYQSHX+Naylu01ZT7vK7rKWVyV2dE8ieYp5yeEYSA65iDX5sgDXH9mbLXHTNz2uCwJa
	 zGLAKS324cSFhRX2HbVG33EZ1u99pCdkq1XInMwg+6kpYUxNVh475wfSfk66BqF9vmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=aBI8Wuna;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993BF606A334;
	Mon, 23 Nov 2026 20:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 993BF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=aBI8Wuna
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=crdpRbf/fj88j4MDqPdQowdHt/HZuMRPboLP7OQ8lXI=; t=1795465933; x=1796675533; 
	b=aBI8WunaHJmSu5iLlWkpi/4obtoDGpw5moZ/mBU13TVAVGlfGR3rKwVjjwK7WubFfgXW49BZeha
	T6NSwBAZKxmjDUjMvqud0FTHcras109k05MAVUmILfcOGejRQv0dF73y88FhthlIWzgwxlkexFU6S
	0DPbkyyMQ78CNq9zFXzvLC7jFCyB9u1GLxB8vGSgW+4y3GRF4I7g3/Hl0tJTOFEW+tm80kmugi9F3
	xplXUwQAJZhCAqJSeFuhCgpoq0/WVQKEyzMzXxd8HvzEx1ZUTPydfNIohXLwmsa86Uey7IeGjmluS
	XLm9jslxdwZE2ej7D95Ro8sNJ4UuU3jtA4jQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Mon, 23 Nov 2026 21:31:19 +0100
Subject: [PATCH RFC 1/3] ARM: imx: enable STOP-ON mode in idle if wakeup
 requirements permit
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
Message-Id: <20261123-imx6-idlestop-v1-1-e32f1f44e46f@kemnade.info>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
In-Reply-To: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=4614; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=ntGS1US+arjnYdgF/bjGJOwq/Z9wV52FocMKZLs+wYQ=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBKKuXjetOqHBL7nFgfi77nvDEQFyNRKo3D88i
 usgEoXAdYWJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawSirgAKCRCEYUX6QCjc
 8eqCD/0f5ikBPNIahit9k7kHBrOI2CxnrVvel/0MvHfTBsT2hDec+c5y7FhKHqTd1B7O/l/DRo+
 /Y+FhH12SvFfaQ3jRRKhprP1HLR/uRxl6xBuYz6IGHkGwinecXxLVl0GmeE/8WPR/Pa8BF+XJEG
 oMU19OLjdmuYC+gYeixpJ46ypy13E1xlAzPBHDk4jjEMeA0+b1eItOgw296fDlTGoHKvzYjBK0N
 3O4WcUjHvArgbD5f0lhYNfzvdVX2a/prmj8qGwtW+d972OcJzrZ4NlhKwT5X0iv8u6YbjqRwQi7
 ei2ISCn1L5tUzcNqntpveuiozzQMyzKkMlJoi7khjSDEg2CRB8IwyYWX/p/fNxLK0urBFDdC1Bw
 XbIvUj6Yoz2UVMVSBPgKWyaCu1cndKlNHkn2eQgehs77rSZAxosyOcIKH9W/O8rKpTGOJLQfHLt
 v4P5LAgSMhWNZjlzMCKS7aK6NdEurIdsqmDNkChFRn53d5Y2vKhEGuYKvTHUha06oPV7CAFhChe
 rWKOywyq8O3bg/DETST1XSAFThiVU04hmcAOFmMGah1pxYvcs1bQ+u1OE1sKkjhck6FtB6er/Fp
 bR7cA4tshPViWmVom28AqlmDXX1yH/cx0YGS1D4z+5j6ZAL1k7m9s/YMJdDHDceqGfbOjGwR2v5
 xvuYEPSE7VFUOsg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Since there are situations when only wakeup from some GPIO IRQs is
required (besides the timekeeping infrastructure which can be fed by
an always on 32K clock), add another idle state to allow power-hungry
PLLs to be turned off in that condition.
Since some clocks are not turned off by RPM and
implementing it seems not feasible, keep a list of clocks to be ignored.
This includes clocks marked as CLK_IS_CRITICAL (romclk, aips_tzX clocks).

This is RFC because that mask check feels hacky. collecting references to
every clock feels a bit too much, maybe set a flag somewhere by
the clock driver.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/mach-imx/common.h         |  1 +
 arch/arm/mach-imx/cpuidle-imx6sx.c | 42 +++++++++++++++++++++++++++++++++++++-
 arch/arm/mach-imx/pm-imx6.c        | 23 +++++++++++++++++++++
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
index d7ecaa822adbd..7804cf5d83922 100644
--- a/arch/arm/mach-imx/common.h
+++ b/arch/arm/mach-imx/common.h
@@ -35,6 +35,7 @@ void imx_gpc_set_arm_power_down_timing(u32 sw2iso, u32 sw);
 void imx25_pm_init(void);
 void imx27_pm_init(void);
 void imx5_pmu_init(void);
+bool imx6sll_check_pll_are_used(void);
 
 enum mxc_cpu_pwr_mode {
 	WAIT_CLOCKED,		/* wfi only */
diff --git a/arch/arm/mach-imx/cpuidle-imx6sx.c b/arch/arm/mach-imx/cpuidle-imx6sx.c
index 83c5cbd3748e1..4537cb7b3a637 100644
--- a/arch/arm/mach-imx/cpuidle-imx6sx.c
+++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
@@ -65,6 +65,36 @@ static __cpuidle int imx6sx_enter_wait(struct cpuidle_device *dev,
 	return index;
 }
 
+static __cpuidle int imx6sx_enter_pll_off(struct cpuidle_device *dev,
+				       struct cpuidle_driver *drv, int index)
+{
+	if (!cpu_is_imx6sll() || imx6sll_check_pll_are_used())
+		return imx6sx_enter_wait(dev, drv, 2);
+
+	imx6_set_lpm(STOP_POWER_ON);
+	imx6_enable_rbc(true);
+	imx_gpc_set_arm_power_in_lpm(true);
+	imx_set_cpu_jump(0, v7_cpu_resume);
+	imx6_set_int_mem_clk_lpm(true);
+	/* Need to notify there is a cpu pm operation. */
+	cpu_pm_enter();
+	cpu_cluster_pm_enter();
+
+	ct_cpuidle_enter();
+
+	cpu_suspend(0, imx6sx_idle_finish);
+
+	ct_cpuidle_exit();
+
+	cpu_cluster_pm_exit();
+	cpu_pm_exit();
+	imx6_enable_rbc(false);
+	imx_gpc_set_arm_power_in_lpm(false);
+
+	imx6_set_lpm(WAIT_CLOCKED);
+	return index;
+}
+
 static struct cpuidle_driver imx6sx_cpuidle_driver = {
 	.name = "imx6sx_cpuidle",
 	.owner = THIS_MODULE,
@@ -95,8 +125,18 @@ static struct cpuidle_driver imx6sx_cpuidle_driver = {
 			.name = "LOW-POWER-IDLE",
 			.desc = "ARM power off",
 		},
+		/* STOP ON */
+		{
+			.exit_latency = 500,
+			.target_residency = 800,
+			.flags = CPUIDLE_FLAG_TIMER_STOP |
+				 CPUIDLE_FLAG_RCU_IDLE,
+			.enter = imx6sx_enter_pll_off,
+			.name = "STOP ON",
+			.desc = "ARM power off + PLL off",
+		},
 	},
-	.state_count = 3,
+	.state_count = 4,
 	.safe_state_index = 0,
 };
 
diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
index 3c73e2cdb8ceb..65a5268d31614 100644
--- a/arch/arm/mach-imx/pm-imx6.c
+++ b/arch/arm/mach-imx/pm-imx6.c
@@ -64,6 +64,14 @@
 #define MX6Q_SUSPEND_OCRAM_SIZE		0x1000
 #define MX6_MAX_MMDC_IO_NUM		33
 
+#define CCGR0 0x68
+#define CCGR1 0x6c
+#define CCGR2 0x70
+#define CCGR3 0x74
+#define CCGR4 0x78
+#define CCGR5 0x7c
+#define CCGR6 0x80
+
 static void __iomem *ccm_base __ro_after_init;
 static void __iomem *suspend_ocram_base __ro_after_init;
 static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_after_init;
@@ -287,6 +295,21 @@ void imx6_enable_rbc(bool enable)
 	imx_gpc_restore_all();
 }
 
+bool imx6sll_check_pll_are_used(void)
+{
+	/* check for any clock active which provides more than register access */
+	return readl_relaxed(ccm_base + CCGR0) & BIT(29)  ||
+		readl_relaxed(ccm_base + CCGR1) & (BIT(25) | BIT(23) | BIT(15) | BIT(13) |
+						   BIT(11) | BIT(7) | BIT(5) | BIT(3) | BIT(1)) ||
+		readl_relaxed(ccm_base + CCGR2) & (BIT(31) | BIT(29) | BIT(11) | BIT(9) |
+						   BIT(7) | BIT(3)) ||
+		readl_relaxed(ccm_base + CCGR3) & (BIT(11) | BIT(5) | BIT(3)) ||
+		readl_relaxed(ccm_base + CCGR4) & (BIT(23) | BIT(21) | BIT(19) | BIT(17)) ||
+		readl_relaxed(ccm_base + CCGR5) & (BIT(25) | BIT(23) | BIT(21) | BIT(21) |
+						   BIT(19) | BIT(15) | BIT(7)) ||
+		readl_relaxed(ccm_base + CCGR6) & (BIT(7) | BIT(5) | BIT(3) | BIT(1));
+}
+
 static void imx6q_enable_wb(bool enable)
 {
 	u32 val;

-- 
2.47.3

