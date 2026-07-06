Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D89D31327D;
	Mon,  6 Jul 2026 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345517; cv=none; b=nNC4/PnuX2uFNbdH5bCawzO9JRbSO4RxfzNI/s0eUi7IfduGr97l0bLgmNkNU6iZL9LVnbFLgyIXGDsvQkuBwdOwepUro2lxo3sE9EBZhL7IQ80pTFFSeDxCm/hVoLIk4EKqMd0TI+3eTbftfXlCjQ1Mw4sGhqGf2Q2xHMT3Igc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345517; c=relaxed/simple;
	bh=CbtwH7ct89Y2IfSsUKd1NZgN+GgDKmoEfOcekMjK3LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2QxR4hCVrEEDWmhK14r5DHNAyTImVpiaonj+Q2Qem9ReobeGDmPu1GrqxBO2d/Hluhs8anMFSZWWKM+4197Iw4a81m+iBRQOnuaNQP0ePyVEVcnk/v1ORq8S5Nrf6As1Ku3bMtSKKjpSYbEYiBkFMVsw5VwkHobNsEOvLS1Kc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ANCszHiu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ANCszHiu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D01912BCB;
	Mon,  6 Jul 2026 06:45:10 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D1253F7B4;
	Mon,  6 Jul 2026 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783345515; bh=CbtwH7ct89Y2IfSsUKd1NZgN+GgDKmoEfOcekMjK3LQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ANCszHiu7/bac9OrHAcpdv3zTBl25v5nilv8Va3d2jxiGO9bgZGhoyBV3wm85RPQ8
	 UT9Wh3nBHO0BopK+M7h6HwLqq6JUlDtlak9THbRfnCkJCwnzpMVZsddUusDi/hw3gB
	 qHH3FYJoaP43vcR5D+U13jL81SsPWeAhfRfW2lbk=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/8] firmware: smccc: lfa: Add timeout and trigger watchdog
Date: Mon,  6 Jul 2026 15:44:43 +0200
Message-ID: <20260706134455.132091-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-1-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vedashree Vidwans <vvidwans@nvidia.com>

Enhance PRIME/ACTIVATION functions to touch watchdog and implement
timeout mechanism. This update ensures that any potential hangs are
detected promptly and that the LFA process is allocated sufficient
execution time before the watchdog timer expires. These changes improve
overall system reliability by reducing the risk of undetected process
stalls and unexpected watchdog resets.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 43 ++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index b333b1e28c0d..357e41f95206 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -6,11 +6,14 @@
 #include <linux/arm-smccc.h>
 #include <linux/arm-smccc-bus.h>
 #include <linux/array_size.h>
+#include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/kobject.h>
+#include <linux/ktime.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/nmi.h>
 #include <linux/psci.h>
 #include <linux/stop_machine.h>
 #include <linux/string.h>
@@ -27,6 +30,11 @@
 #define LFA_PRIME_CALL_AGAIN		BIT(0)
 #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
 
+#define LFA_PRIME_BUDGET_MS		30000		/* 30s cap */
+#define LFA_PRIME_DELAY_MS		10		/* 10ms between polls */
+#define LFA_ACTIVATE_BUDGET_MS		10000		/* 10s cap */
+#define LFA_ACTIVATE_DELAY_MS		10		/* 10ms between polls */
+
 /* LFA return values */
 #define LFA_SUCCESS			0
 #define LFA_NOT_SUPPORTED		1
@@ -276,6 +284,7 @@ static int call_lfa_activate(void *data)
 	struct fw_image *image = data;
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
 
+	touch_nmi_watchdog();
 	reg.a0 = ARM_SMCCC_LFA_ACTIVATE;
 	reg.a1 = image->fw_seq_id;
 	/*
@@ -299,6 +308,7 @@ static int call_lfa_activate(void *data)
 
 static int activate_fw_image(struct fw_image *image)
 {
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
 	int ret;
 
 retry:
@@ -314,8 +324,14 @@ static int activate_fw_image(struct fw_image *image)
 	}
 
 	/* SMC returned with call_again flag set, or with LFA_BUSY */
-	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY)
-		goto retry;
+	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY) {
+		if (ktime_before(ktime_get(), end)) {
+			msleep_interruptible(LFA_ACTIVATE_DELAY_MS);
+			goto retry;
+		}
+
+		ret = -LFA_TIMED_OUT;
+	}
 
 	lfa_cancel(image);
 
@@ -328,6 +344,7 @@ static int activate_fw_image(struct fw_image *image)
 static int prime_fw_image(struct fw_image *image)
 {
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
 
 	if (image->may_reset_cpu) {
 		pr_err("CPU reset not supported by kernel driver\n");
@@ -335,6 +352,8 @@ static int prime_fw_image(struct fw_image *image)
 		return -EINVAL;
 	}
 
+	touch_nmi_watchdog();
+
 	reg.a0 = ARM_SMCCC_LFA_PRIME;
 retry:
 	/*
@@ -353,8 +372,24 @@ static int prime_fw_image(struct fw_image *image)
 		return res.a0;
 	}
 
-	if (res.a1 & LFA_PRIME_CALL_AGAIN)
-		goto retry;
+	if (res.a1 & LFA_PRIME_CALL_AGAIN) {
+		int ret;
+
+		/* SMC returned with call_again flag set */
+		if (ktime_before(ktime_get(), end)) {
+			msleep_interruptible(LFA_PRIME_DELAY_MS);
+			goto retry;
+		}
+
+		pr_err("LFA_PRIME for image %s timed out",
+		       get_image_name(image));
+
+		ret = lfa_cancel(image);
+		if (ret != 0)
+			return ret;
+
+		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
-- 
2.43.0

