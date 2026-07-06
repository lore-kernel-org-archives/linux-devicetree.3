Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2508431CA4E;
	Mon,  6 Jul 2026 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345528; cv=none; b=uN9Vfe8msO5LXyRSEg7BizsUgOYb/uhAbVyIEddti1VmrAby016woXv9ZM9KtdlkyrCjjPoyKz1+XOACONEoJNeIJzjtnXv2X+wxbl9mPgV6U8ZESt8zPrq1li9p/78+HAIMEHwa/uTFezW4rHLJ4wNOMH0iYTFnOO7LordAsas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345528; c=relaxed/simple;
	bh=6oc6/bTeLii+gyqGBfBpO03hrZDYqWCiYlS78ZWZRog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnEqcMgo/V6HB8Ph8ZlwavYKywpoWbD2huqb4ZR7HEam2Odxd0sb4w8lPME+PlOVGu1mj3+aa1qbYkGUfjSdTRkK6lYqXit0b/O4B4SP3RlnhNFUXOac/iibU6qPvzaGQ4e/fLLpHpUOL+aS0gzXPMH4ysfTXG5wpuR0GKRzlOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pIHUxxuZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pIHUxxuZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68ED732C5;
	Mon,  6 Jul 2026 06:45:19 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A5F43F7B4;
	Mon,  6 Jul 2026 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783345523; bh=6oc6/bTeLii+gyqGBfBpO03hrZDYqWCiYlS78ZWZRog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pIHUxxuZR1rObtPAOIEdgjBSpmKUUdDPZooQyDqi7SIzeFBLRBCVoh3TuEqgBDax+
	 Wu5zjFzwVXxOpmiN8DvWH1+6KtMvBybzNzGL37pPpKflsWIONMD1OJ5gSWbXuVQpjl
	 NVLSysislYV4F3sDp/NvPLwuVK186aLO5s0Y8Y2Y=
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
Subject: [PATCH v3 6/8] firmware: smccc: lfa: Register DT interrupt
Date: Mon,  6 Jul 2026 15:44:46 +0200
Message-ID: <20260706134455.132091-7-andre.przywara@arm.com>
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

The Arm Live Firmware Activation spec describes an asynchronous
notification mechanism, where the platform can notify the host OS about
newly pending image updates.
In the absence of the ACPI notification mechanism also a simple
devicetree node can describe an interrupt.

Add code to find the respective DT node and register the specified
interrupt, to trigger the activation if needed.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index ce4f966db475..2a9c2a90b1bb 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -16,6 +16,8 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/nmi.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/psci.h>
 #include <linux/stop_machine.h>
 #include <linux/string.h>
@@ -832,6 +834,43 @@ static void lfa_remove_acpi(struct device *dev)
 }
 #endif
 
+static irqreturn_t lfa_irq_handler(int irq, void *dev_id)
+{
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t lfa_irq_handler_thread(int irq, void *dev_id)
+{
+	int ret;
+
+	while (!(ret = activate_pending_image()))
+		;
+
+	if (ret != -ENOENT)
+		pr_warn("notified image activation failed: %d\n", ret);
+
+	return IRQ_HANDLED;
+}
+
+static int lfa_register_dt(struct device *dev)
+{
+	struct device_node *np;
+	unsigned int irq;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,lfa");
+	if (!np)
+		return -ENODEV;
+
+	irq = irq_of_parse_and_map(np, 0);
+	of_node_put(np);
+	if (!irq)
+		return -ENODEV;
+
+	return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
+					 lfa_irq_handler_thread,
+					 IRQF_COND_ONESHOT, NULL, NULL);
+}
+
 static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
@@ -877,6 +916,12 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 		}
 	}
 
+	err = lfa_register_dt(&sdev->dev);
+	if (!err)
+		pr_info("registered LFA DT notification interrupt\n");
+	if (err != -ENODEV)
+		return err;
+
 	return 0;
 }
 
-- 
2.43.0

