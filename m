Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013062.outbound.protection.outlook.com [40.93.196.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1729937B019;
	Fri, 14 Aug 2026 11:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786708343; cv=fail; b=bU4a2JwhAT1CcSbzqV8MdiXm7q91I2FVHbCZP36EEH3Km6BtRRodvE8vo3O3rcNFu0uzv5P0TOxVNdsTHzbwAbwKY9CfDCvNmqxSsuM7tQAZjczUsTHFsNMPUVEths2yxobaencHwQz8pcrh6hoGlUP5/fTG0PUXTmYxUkLsCDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786708343; c=relaxed/simple;
	bh=mqG4LxARd+hRvR4y1C5iyZQZx2KleRe589X/3Dtipao=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cMWezT/JXM2NMVn3S1NEph6tz0nh8rdZxNJpnNglE4kIlVw00bFwT27aawdyiInQcdvws/qOD/rwCXB1Vb7ukFed7hUToqdi27EmKqskb3iWNX/Emft7HU52Bz515T7IAMCJbM318qbUulVGsYBwJCDQkemVkLcK1AKWEeiNDzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ehzXB3gn; arc=fail smtp.client-ip=40.93.196.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ehzXB3gn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYlMpWN6iG+ZCfA8iBDJf9bMWYEMF4lrAM02ZPn3Esk+F9hgKVB9YOwGRo4E60677cy8dorRUUdJBV5EYFHocKfKAYCRqeDBnXE5/uxbfEXrEOdkbrfQBhd4V6Wlil9aMflWXOnFpjPd40V+KjjcJbc7GQF5M7wyCRMrQaQU2DKXOWk8UBOw/zpdiizBuQxBmYRkM1PFCPdFxevziQ/QISvqXtvoZQ/wHOsYUxLF+f2WxrU/7y1TFB2PPlr/8kVxXsPQ4dk7dTJXTDaqX4L54DHLrAHbco/sOS5GvqnIi/lo0MyUO1WytR6eb1XJ5Msrz6P/k5JSMkoifl/fyJPzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0c9xvH/QHVuTn31LrEZ8f1536VOL6Kl9GQlBp5V1/Q=;
 b=sbF9GDC3arYSHeYExQQx41aqBsOHRPDDVANuyEBDdsM0GDFtYEaQ+HJiilto6BXsYfJEWLCp8P6WjGHmuuJRjJ3Y/Uu2QeEd2aORMQk6HsqTlZvmaMUyRtIjz7eblS8fn/qILHFWYpx46xfIqEv5mNYB7xmEqqxIcC9bi9OF57IKAwvf08HZrUx7ajd28vEnRjdiKiPPSFzXQYQJthFuIw2EIa0uo4IAqtYV/IcfkSQCbgIeJ+tqhKO4bP+6ZYCvAkNyRVFJxOUf3Smks5uXGnBfn55icZNDNdTxqcJBpiS2cFiQpDmOSsaG6rG1dM+6CgbHeZYblkigPqxtr+RfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0c9xvH/QHVuTn31LrEZ8f1536VOL6Kl9GQlBp5V1/Q=;
 b=ehzXB3gnradwkA4byaGIW1MyXvn9mgI51u9HQeIGI17uR6N3yPkEeD2F/ypUU5+PqSV/TQ3WtxCWLHWnzuRHbPFcDP8rQNyWbYa/aEVkvxVOjMjZu+QzhvF7R52Ra2TeZUTyXDoUhAyuCPfPP9umgON09BwXaPRqrGP8Qs72fdU=
Received: from CH2PR16CA0005.namprd16.prod.outlook.com (2603:10b6:610:50::15)
 by MN2PR12MB4471.namprd12.prod.outlook.com (2603:10b6:208:26f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Fri, 14 Aug
 2026 11:52:17 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::8e) by CH2PR16CA0005.outlook.office365.com
 (2603:10b6:610:50::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 11:52:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 11:52:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 06:52:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 06:52:15 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 06:52:13 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH 3/3] i3c: master: amd: Add hot-join support
Date: Fri, 14 Aug 2026 17:21:55 +0530
Message-ID: <20260814115155.3974988-4-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|MN2PR12MB4471:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a88001-3cfb-457f-7e8c-08def9fa7d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|22082099003|18002099003|11063799006|6133799003|5023799004|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	MfGmX/ci+laxSXR+4RbDTfhGd1zS+ykE0AJ40Ns+ck5wB2nHa4eaHIxcVqTf41zVT302cQpeSeehG2LwmU5DCbvrmyFxvu69DKf96/As1c2qOkb8tQ6ps1UWI6nzrCTeb7Uvmv/pNNOCQLllE/PuCYqGNBc7v1lTRysLnWX+NHOToH98puKzb8fs/ecIvsc0SPbg0eFvcHr/Tsiq10TUrpG4s0bzhlCdI4Sm9LD6WWG9jYD88sl5BWhLcvRm7p+tbuDsdE8LRbRwFKYftDe6q0P4bWyyzgP21MMwMKG24gwanL4+8Yb1O8xJf6KFbbJrUy2BYPWCRNI8suZcLL5sTygCI67Z1YVf+5A7IqmadVcN7D//wV6kqGX1tdBz0p3blAdmWv5yU0xse93lDtcGmYgcF3BjZFi2cutmw6WWxsO7ixErqN4+vfMI0ADjF1Ik7cWpfYCdJV2Doee+5NX51nPn7PbcKPwlJtPoJdIUBRd1ZAC65uFCr1vgmeCaSedYaXWkiqqeROQuauhOCRrizOA5V3ySB8RFw0gZs83EZa6oCdlayBRl3D12Nam5jToXAyHxQatEyAEUHpQDoCFyvdcQsefuJTKfrFL6Aqz0uMdHfjAEf30W2idYwU1iM6DLBvQxJPx7vCJGZIFZKE80Mls4JU1zCo0geMRKbn9jjy81WqiOyECjgCQXV7FTlAWtMiyyERfRogUKS5T6xAHKsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(11063799006)(6133799003)(5023799004)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bYfdhrlBfLNE/3yGNJ3X5yOCi1dJPhcVaj/ay1j3BmZqNUznMzke5jRQfkrnU7/9VUtxQW4EzeS7EwaAzSq2Hytez7kpc9TB4CEAWLO2+emBV8mF1vERCs4syQHBoeUnnG+HMkn4M9aY3SlNK6sy3x1pC14bOkM6v3SYzAa/Rc6Zuep9x7Mx3NmGCKpUdHTSQEzCzYF6CsSWk27ylrK8MEzPpNc3Cl0vc6FPk8IgTvtGtI1cegeRta7c4AMm9nUpanwg9mnW0zRz/VJzVEdjcaZYRIpY8mk0I0Ye2eoyuUo7rTNHfgGwq+daT/XKB7IMrBwDxad/vhm92dQrgB6Glg0N/w51JKQowmVGAKC8BduxWXS6el9vBhnWCXQEHw/uVwKJ8zNVcn2aCACQUU4jgRkWODTiQc56UMo59t7yLp9ftB7p03hbW1CjcSJ6xTmG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 11:52:17.0373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a88001-3cfb-457f-7e8c-08def9fa7d34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4471

Add hot-join support for the AMD AXI I3C master controller.
By default, the hot-join acknowledgment is disabled. Users can use the
sysfs entry to enable it. A hot-join event is serviced by re-running DAA
from a work item so the i3c core enumerates the new device.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
 drivers/i3c/master/amd-i3c-master.c | 77 ++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd-i3c-master.c
index d47b04326ea4..62221b138bfe 100644
--- a/drivers/i3c/master/amd-i3c-master.c
+++ b/drivers/i3c/master/amd-i3c-master.c
@@ -25,6 +25,7 @@
 #include <linux/spinlock.h>
 #include <linux/time.h>
 #include <linux/unaligned.h>
+#include <linux/workqueue.h>
 
 #define XI3C_VERSION_OFFSET			0x00	/* Version Register */
 #define XI3C_RESET_OFFSET			0x04	/* Soft Reset Register */
@@ -55,9 +56,11 @@
 #define XI3C_CR_EN_MASK				BIT(0)	/* Core Enable */
 #define XI3C_CR_RESUME_MASK			BIT(2)	/* Core Resume */
 #define XI3C_CR_IBI_MASK			BIT(3)	/* IBI ACK enable */
+#define XI3C_CR_HJ_MASK				BIT(4)	/* Hot-Join ACK enable */
 #define XI3C_SR_RESP_NOT_EMPTY_MASK		BIT(4)	/* Resp Fifo not empty status mask */
 #define XI3C_RD_FIFO_NOT_EMPTY_MASK		BIT(15)	/* Read Fifo not empty status mask */
 #define XI3C_INTR_IBI_MASK			BIT(7)	/* IBI event (INTR status/enable) */
+#define XI3C_INTR_HJ_MASK			BIT(8)	/* Hot-Join event */
 
 #define XI3C_BCR_MASK				GENMASK(23, 16)
 #define XI3C_DCR_MASK				GENMASK(31, 24)
@@ -191,11 +194,14 @@ struct xi3c_xfer {
  *	       @xfer_resp_valid is set. Guarded by @lock.
  * @xfer_resp_valid: True once the in-flight transfer's own response word has
  *		     been taken from the shared response FIFO. Guarded by @lock.
- * @irq: Controller interrupt line, used for IBI events. Only valid when
- *	 @ibi_capable is set.
+ * @irq: Controller interrupt line, used for IBI/Hot-Join events. Only valid
+ *	 when @ibi_capable is set.
  * @ibi_capable: True when the IP was synthesized with In-Band Interrupt
- *		 support ("xlnx,ibi-capable"); also the condition for the
- *		 controller interrupt being present.
+ *		 support ("xlnx,ibi-capable"). Since Hot-Join requests are
+ *		 ACKed by the IBI machinery, this is also the condition for
+ *		 the controller interrupt being present at all.
+ * @hj_capable: True when the IP was synthesized with Hot-Join support
+ *		("xlnx,hj-capable"); implies @ibi_capable.
  * @ops: Controller ops handed to the framework, assembled at probe time from
  *	 the base ops plus the callbacks the design actually supports.
  * @ibi: In-Band Interrupt slot tracking.
@@ -205,6 +211,7 @@ struct xi3c_xfer {
  *		       controller-wide IBI ACK/interrupt is armed on the
  *		       first enable and disarmed on the last disable. Guarded
  *		       by @reg_lock.
+ * @hj_work: Deferred re-DAA triggered from the Hot-Join interrupt.
  */
 struct xi3c_master {
 	struct i3c_master_controller base;
@@ -221,12 +228,14 @@ struct xi3c_master {
 	bool xfer_resp_valid;
 	int irq;
 	bool ibi_capable;
+	bool hj_capable;
 	struct i3c_master_controller_ops ops;
 	struct {
 		spinlock_t lock; /* protects slots[] against the IBI handler */
 		struct i3c_dev_desc *slots[XI3C_MAX_DEVS];
 		unsigned int enabled_count;
 	} ibi;
+	struct work_struct hj_work;
 };
 
 /**
@@ -1474,6 +1483,40 @@ static void xi3c_master_handle_ibi(struct xi3c_master *master)
 	xi3c_master_drain_ibi_fifo(master, len);
 }
 
+static int xi3c_master_enable_hotjoin(struct i3c_master_controller *m)
+{
+	struct xi3c_master *master = to_xi3c_master(m);
+
+	guard(spinlock_irqsave)(&master->reg_lock);
+	iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) | XI3C_CR_HJ_MASK,
+		  master->membase + XI3C_CR_OFFSET);
+	iowrite32(ioread32(master->membase + XI3C_INTR_RE_OFFSET) |
+		  XI3C_INTR_HJ_MASK, master->membase + XI3C_INTR_RE_OFFSET);
+
+	return 0;
+}
+
+static int xi3c_master_disable_hotjoin(struct i3c_master_controller *m)
+{
+	struct xi3c_master *master = to_xi3c_master(m);
+
+	guard(spinlock_irqsave)(&master->reg_lock);
+	iowrite32(ioread32(master->membase + XI3C_INTR_RE_OFFSET) &
+		  ~XI3C_INTR_HJ_MASK, master->membase + XI3C_INTR_RE_OFFSET);
+	iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) & ~XI3C_CR_HJ_MASK,
+		  master->membase + XI3C_CR_OFFSET);
+
+	return 0;
+}
+
+static void xi3c_master_hj_work(struct work_struct *work)
+{
+	struct xi3c_master *master = container_of(work, struct xi3c_master,
+						  hj_work);
+
+	i3c_master_do_daa(&master->base);
+}
+
 static irqreturn_t xi3c_master_irq_handler(int irq, void *dev_id)
 {
 	struct xi3c_master *master = dev_id;
@@ -1494,6 +1537,9 @@ static irqreturn_t xi3c_master_irq_handler(int irq, void *dev_id)
 			xi3c_master_handle_ibi(master);
 	}
 
+	if (status & XI3C_INTR_HJ_MASK)
+		queue_work(master->base.wq, &master->hj_work);
+
 	return IRQ_HANDLED;
 }
 
@@ -1514,6 +1560,11 @@ static void xi3c_master_init_ibi_ops(struct xi3c_master *master)
 	master->ops.enable_ibi = xi3c_master_enable_ibi;
 	master->ops.disable_ibi = xi3c_master_disable_ibi;
 	master->ops.recycle_ibi_slot = xi3c_master_recycle_ibi_slot;
+
+	if (master->hj_capable) {
+		master->ops.enable_hotjoin = xi3c_master_enable_hotjoin;
+		master->ops.disable_hotjoin = xi3c_master_disable_hotjoin;
+	}
 }
 
 static int xi3c_master_probe(struct platform_device *pdev)
@@ -1545,13 +1596,21 @@ static int xi3c_master_probe(struct platform_device *pdev)
 
 	spin_lock_init(&master->ibi.lock);
 	spin_lock_init(&master->reg_lock);
+	INIT_WORK(&master->hj_work, xi3c_master_hj_work);
 
 	master->ibi_capable = device_property_read_bool(master->dev,
 							"xlnx,ibi-capable");
+	master->hj_capable = device_property_read_bool(master->dev,
+						       "xlnx,hj-capable");
+
+	/* Hot-Join requests are ACKed by the IBI machinery. */
+	if (master->hj_capable && !master->ibi_capable)
+		return dev_err_probe(master->dev, -EINVAL,
+				     "xlnx,hj-capable requires xlnx,ibi-capable\n");
 
 	/*
-	 * The interrupt only carries IBI events, so it is only described for
-	 * designs synthesized with that feature.
+	 * The interrupt only carries IBI and Hot-Join events, so it is only
+	 * described for designs synthesized with those features.
 	 */
 	if (master->ibi_capable) {
 		xi3c_master_init_ibi_ops(master);
@@ -1588,6 +1647,12 @@ static void xi3c_master_remove(struct platform_device *pdev)
 	if (master->ibi_capable)
 		disable_irq(master->irq);
 
+	if (master->hj_capable) {
+		/* Stop new Hot-Join IRQs before flushing, so the work can't be re-queued. */
+		xi3c_master_disable_hotjoin(&master->base);
+		cancel_work_sync(&master->hj_work);
+	}
+
 	i3c_master_unregister(&master->base);
 }
 
-- 
2.34.1

