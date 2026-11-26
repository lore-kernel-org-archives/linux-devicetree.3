Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690970;
	b=gpgXDMczh5vY92ixWj6Z/LTCO+yaihUXK2ufNXrzWi8uSRYzPxjz44Asl3Exn+6bc7EM
	 Kp3sAMrL2X14CGrRZLFeKnhU4kxtXx4ACtaytysEdlIDj3MflNzSyzdxESHUzsbyZNsnV
	 CRv3r9c4+lPf+949VNeOFec2xoIWKJoWptKYTttFa3ZT2BQIk+0Ub3eIyzoKfiYDsvppT
	 NOElCLN3Pp2yYKTumlWHct2bxNXmCVKJNvgNHsTiALfHRnbKhA1Mcw5yhKEfFcdprTKDW
	 G07xQBGd9N8Pb9G7lEchNDWbgFw+qJCorT45q+MMXBEGBS521CrMU93jre6qUgMSNAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690970;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=A2bdft652fdVAAhhhUDBYGj4mjukgD2GthVq1g6a6+8=;
	b=Bnr5JfIre58gAuySDCUKjqWQmx3z/vvIZBI3UfdsgGbM7V5Gq2a2fX7sbw9UDf+t6E07
	 Ii6ZTCSs9wq2sruow9oKQ66XaJ78atAiQ33ec+e3WGRglvjotZL8AZwYQRJFfWHEjvBGi
	 USz2Pzg8unLlhKf1SpMpFhV5/THauKed1d1raUHxva9BJ7mlYnC6Z3I9mhBzY0RQg6+uo
	 bxCF2+LV656WIiIWTcmUw7OnoruN9vshR5L+Hnq/jhUht9D0AnNYSGuzPmYIQqyrsqV0B
	 t4Ew3ecMYKX2kAusQuQgQTGWfIwzrKNK0lkk+ZaiaOuh8SEKThdEYNPrUHZyRwlET+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=SmPzq15c;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9121C606A32A;
	Thu, 26 Nov 2026 11:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9121C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=SmPzq15c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=A2bdft652fdVAAhhhUDBYGj4mjukgD2GthVq1g6a6+8=; t=1795690969; x=1796900569; 
	b=SmPzq15cu9mebd8aS6urSXtMFXvNXkFtkwjH9XWtHNu5yxRm9WB3N+VjZw4iQIqiSPt7+YnPA5A
	06c8LC773iLRLepqLEuVhknpFy0rywQgZ6vJIqsixtvR7OhrE03HOOQjLx2OHTDMUVxReu9qugJMZ
	ue8eiqVRClwb9Vjsk9dFvqcYQ7Uec2mbnuTb/LZi4iiXzJiSrwumnl71cv1AL+Y2Mg8JrRShYMAMq
	3oTnve52rpM4kG2Eoy7+bt1osrMclxbvX0zNFzqV2h+p59fepB78jkZCwE32bkCYj0wti6e9/SKWm
	x+cODgy8XizteDsP57Ith7XZM2V5OFFidYcA==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 26 Nov 2026 12:00:54 +0100
Subject: [PATCH v2 1/3] ARM: imx: enable STOP-ON mode in idle if wakeup
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
Message-Id: <20261126-imx6-idlestop-v2-1-c6987e7a392f@kemnade.info>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
In-Reply-To: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
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
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=5480; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=yjfM1ZMU5BXbzh2pdCc5rlFOp5ocZsDyiRAVIpWxHHU=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBG5QSNfJgeOOzypfaDHl5JACFfaJ+frZI/Gi
 Pn0aUyuVZuJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRuQAKCRCEYUX6QCjc
 8RfKD/9+WvcFw1A3jGqoK5T6l7T9Sm2YUhu/Qmww72jzEMtrdCAdJTQ/VPyFO6sY0557Nyde1JF
 zgRMqImCag1I4MX/l919zgMtu+lW+TDJjwj6bzooVHzcS/KyR5z7w3wYjCDT2BG9QNxkEhqsPts
 iXsDaZQix1yu5QDu/m/SgYccbLhv6i0CF54jXH28qjGqJFoEpwKfrO+BKZXmwla0TgvUIe56WtX
 2NjTKZch64EKex2iWBrgjtiCQxhbuCPv4alIhqXpSMK180R7i5yMU0kPim0po/u1h5NRfXSDqdq
 aKU5FD0ACYejokTmQNQDd9cG5iitIkyQZLwwR8kONwLz2evyuY6eL1Uj1LaiELgQzY81OahC9nR
 RNtLe0ae+/aLD8VeEBa+JfE/b3HsUcTry3RyEpEg/8uFQVjz5SODzQvj4OSthFjm2j4InfWnRjB
 ip8J6unG5Li+p/YHu9uO9rp7DL2Efi/o7aMdm3bLThTn9o6Npfd9sMbT7s9lz50U4R4vpuylYyP
 zpNQzX6CO5Z0Eg7ncyEwPXIr3kIwNwESVpBrKwNXLR2bR+VIdmvoxIx0C7NG9kemMZzoKmzQvkG
 vpY9hJvKbvNpctoyfGZKuj6xaeEB5O3iDcn6Z4c1PUTs1G0tdh+qqJiIO4X6zP9GCiARpn50Sp+
 +FbcZegWnf36WiA==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Since there are situations when only wakeup from some GPIO IRQs is
required (besides the timekeeping infrastructure which can be fed by
an always on 32K clock), add another idle state to allow power-hungry
PLLs to be turned off in that condition.
Since some clocks are not turned off by RPM and
implementing it seems not feasible, keep a list of clocks to be ignored.
This includes clocks marked as CLK_IS_CRITICAL (romclk, aips_tzX clocks).

Collecting references to every clock feels a bit too much, so just list
the bits with comments.

To avoid spurios thermal misreadings, disable the new state when thermal
might be on, until these misreadings are sorted out.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/mach-imx/common.h         |  1 +
 arch/arm/mach-imx/cpuidle-imx6sx.c | 54 +++++++++++++++++++++++++++++++++++++-
 arch/arm/mach-imx/pm-imx6.c        | 31 ++++++++++++++++++++++
 3 files changed, 85 insertions(+), 1 deletion(-)

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
index 83c5cbd3748e1..d2e8a98cc6ebb 100644
--- a/arch/arm/mach-imx/cpuidle-imx6sx.c
+++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
@@ -65,6 +65,40 @@ static __cpuidle int imx6sx_enter_wait(struct cpuidle_device *dev,
 	return index;
 }
 
+static __cpuidle int imx6sx_enter_pll_off(struct cpuidle_device *dev,
+				       struct cpuidle_driver *drv, int index)
+{
+	if (imx6sll_check_pll_are_used()) {
+		for (index--; index >= 0; index--)
+			if (!dev->states_usage[index].disable)
+				return imx6sx_enter_wait(dev, drv, index);
+
+		return -EBUSY;
+	}
+
+	imx6_set_lpm(STOP_POWER_ON);
+	imx6_enable_rbc(true);
+	imx_gpc_set_arm_power_in_lpm(true);
+	imx_set_cpu_jump(0, v7_cpu_resume);
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
@@ -95,8 +129,19 @@ static struct cpuidle_driver imx6sx_cpuidle_driver = {
 			.name = "LOW-POWER-IDLE",
 			.desc = "ARM power off",
 		},
+		/* STOP ON */
+		{
+			/* times not measured, just hopefully safe values */
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
 
@@ -114,5 +159,12 @@ int __init imx6sx_cpuidle_init(void)
 	imx_gpc_set_arm_power_up_timing(cpu_is_imx6sx() ? 0xf : 0x2, 1);
 	imx_gpc_set_arm_power_down_timing(1, 1);
 
+	/*
+	 * play safe for now and try to avoid spurios false thermal readouts
+	 * and unexpected actions on that
+	 */
+	if (!cpu_is_imx6sll() || IS_ENABLED(CONFIG_IMX_THERMAL))
+		imx6sx_cpuidle_driver.state_count--;
+
 	return cpuidle_register(&imx6sx_cpuidle_driver, NULL);
 }
diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
index 3c73e2cdb8ceb..2494ee4d20c3a 100644
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
@@ -287,6 +295,29 @@ void imx6_enable_rbc(bool enable)
 	imx_gpc_restore_all();
 }
 
+bool imx6sll_check_pll_are_used(void)
+{
+	/* check for any clock active which provides more than register access */
+
+				/* uart2 | dcp */
+	return readl_relaxed(ccm_base + CCGR0) & (BIT(29) | BIT(11)) ||
+				/* uart | gpt_serial | epit | ecspi */
+		readl_relaxed(ccm_base + CCGR1) & (BIT(25) | BIT(23) | BIT(15) | BIT(13) |
+						   BIT(11) | BIT(7) | BIT(5) | BIT(3) | BIT(1)) ||
+				/* pxp | lcd | i2c */
+		readl_relaxed(ccm_base + CCGR2) & (BIT(31) | BIT(29) | BIT(11) | BIT(9) |
+						   BIT(7) | BIT(3)) ||
+				/* lcdif | epdc | pxp */
+		readl_relaxed(ccm_base + CCGR3) & (BIT(11) | BIT(5) | BIT(3)) ||
+				/* pwm */
+		readl_relaxed(ccm_base + CCGR4) & (BIT(23) | BIT(21) | BIT(19) | BIT(17)) ||
+				/* uart1 | ssi | spdif | sdma */
+		readl_relaxed(ccm_base + CCGR5) & (BIT(25) | BIT(23) | BIT(21) |
+						   BIT(19) | BIT(15) | BIT(7)) ||
+				/* usdhc | usboh3 */
+		readl_relaxed(ccm_base + CCGR6) & (BIT(7) | BIT(5) | BIT(3) | BIT(1));
+}
+
 static void imx6q_enable_wb(bool enable)
 {
 	u32 val;

-- 
2.47.3

