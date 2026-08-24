Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011043.outbound.protection.outlook.com [40.93.194.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617A13749F4;
	Mon, 24 Aug 2026 04:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546948; cv=fail; b=r9Po3RE/UivuMsc0qRZeEjog5xdElesZmiqvAjRvtwKoiWLxoOyfddApijdiZdTmH1Z5F/EkKsNvBOHE+QRhVhBaVFeewNrA7qVycyDjBDl+1uOusjRQP+nxXjf2x6AijUDnDhArPZs7L8o6kWkztu4gfvnl27mYS6b9h9P+ZVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546948; c=relaxed/simple;
	bh=6kKA4t4gyMU4XRGma43lV9Vt8gRl67tN68cZaqnYEs0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SKl2DWMWvH/2ILrHDWUkUF25BequNP39bXHEBf56NFUF2OPkciqh+eQAi8/Qm8KesPWQIaWDLSHsH8P4x5aQAS5vavFZL83xBBKZ3Hve+FiqNXw76URGl5/FHAMOC1LmUcOv8js30lZ2BF1dPOds48L9DHl76LFK6+GXGB2Gb8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=05V5IgCq; arc=fail smtp.client-ip=40.93.194.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="05V5IgCq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cg2aOV7mdR2ylNnX0mNfn/lYkdu6IjSVwwYmObyC09aGr5NkSndWkd+vwQdk8Ruee7CR4vAZUwVBpX94fcVjh/7DwCYx14jr4g8JEXCQKybrBPJ7VuP8OZ5Pf0Zxv51PPTiJPbDWMNL/eUq1gYITP1Smh+gyL7aJM568HotWQzCw+MsGH1m2ORHlKL4aCWENgK8XUwQduAbVobQFgW8hA/ROiPT4v0qF7Oz0jhPJpgiZGR7XPWZbUbUQobwG6U7Fm6IKJdngMfDZqs/2tQzVwMutzfH9avYASWsRMfuncxiunsmMvH3mobNt8M4RUFWenfT/xNroyfI3AwRjd7pGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6L00UH4RVeMjq6M4wjoROUBOBFXWHo5sgHAvMQJMZY=;
 b=eryiOE8WM12iDwqcCmLzOVD7HPT0OoqUY+VQ8ME1pSbvWWo0iAvXuImv/atbw5Fh0hO3wHVE0RcDj9mjqcwH4O3zJQ4sPlPitUHw7Act/gwgA5e63YnqrP2jnk1txXxLpq7Xj+mS2OLCjTSm0t5ueoJCwVXy2RG92LqDKM0BflGjWX7nZZztdzhUXguFYO7gwVElKPLCujvOan1EQzIkSw95bIp4O1rCvUAVCqgXhXk/h4vsq1BHfng1O9y1g7JrQcDHCvVMh+B5Pufw/yeNpZWeJVXUOb5Uz68BaYELAHU+COuqiCIScT6wwfiVd0qC9r5F0NAVd0761vdYYXfUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6L00UH4RVeMjq6M4wjoROUBOBFXWHo5sgHAvMQJMZY=;
 b=05V5IgCqAi4/PVYMLHXZusvbdJLnLjRyPhVRSbHWceO1GlGhbZoJW6WkgDWtuCk3PkvqfCYXTH774fTe+Mjyd+N5dPgJyphr8+I+GsxbURkRA9ElwAp3YdCgO2AroyyiJBhT5WvZNWAQ9fA9I5CjKvB8SlYhataXILxIE4JsnBc=
Received: from BN9PR03CA0138.namprd03.prod.outlook.com (2603:10b6:408:fe::23)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 04:49:00 +0000
Received: from BN5PEPF0004698A.namprd02.prod.outlook.com
 (2603:10b6:408:fe:cafe::45) by BN9PR03CA0138.outlook.office365.com
 (2603:10b6:408:fe::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 04:49:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN5PEPF0004698A.mail.protection.outlook.com (10.167.245.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 04:48:59 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 23 Aug
 2026 23:48:58 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Sun, 23 Aug 2026 23:48:55 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 3/3] i3c: master: amd: Add hot-join support
Date: Mon, 24 Aug 2026 10:18:35 +0530
Message-ID: <20260824044835.2924141-4-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
References: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698A:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1f64ff-de2c-4640-bfed-08df019b036d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|10067099003|3023799007|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/xTD99vbXD2HgRTYRPpQc8DriipbaQREk9LnF8EeqoFUI/jm9l1hloo+Wul8McZkf+yZILXJKJXvPkJhTaun3EHsJ79/6HYYl4pNsXRbuCH4nLAK2lUmAEtHWsopoGzxdd2UBK6tdwrae/Qw12NPx2Ruhd7ER5EOoKBFhenim3V3Immqd1WkcNEfyLKYqi/rZbkPbL+ufMb9L4Kgo1hlz1bvO+cI+ragcdId2lhv5KE47LyG2ja31q0F3+yKEC3AmLKOOuLwyTsjeTLSHd2H5Tbtc+MlRAIb9KK9g+vPJJZB+zNlbUT1ztOA4UW1qY5tcx2y2TYEUiK3cQU+NSXnyWXTH8Dkjf+REysGfdZ5AH4J6MWp5ANA2LDzKToEWQ3sSHHFWNGxGBkbGyE7j+eexC8rslkUsX2STa5v98dd3a6nax4PeJ9JwPRplmBHl2UzcwHLebAB/n7TyQfWKAqp7g5sltxb0Q56zwS3JdjvuhHioLIt2nKXCqu/H/fBzB0HBKdPeTE1jscunEVIAHTBWIDXnDbbgbkgPqOLLXhH4yS404SYdcg4rxaXx2B5Vf/4YqquHbfNW575eB3oZ+RdUNlUGd45NfOvry5TDxMiNv16HdG5GXsFWaM6FbmntEoZvBFuub8/JeLgnalPd4NfDLJXcoyNFv/Y5WM3yZ8vPpidXBPfYX4t4Mr0V7mJ9AusGRRveUdyNX1y9qEgEvmHZg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(10067099003)(3023799007)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z7StdHjcrPmdPHzX/4sM178vt00RQDpbbwVvNou+Ro69wJMwrHAAoKh/BHqnPh7QfU8O5skOtZpqj4WHOP8AxD+q6CYSmXjCrpSfCh7xU3BNZDD7nNvykyf8ExRaUtFBHqa+c6uZkXNY7Q6MwnHTSayPXh999aotzGP+g1/gjPKi2hAU+hdzs9n6cacuR71WJiC3RRQSvnR3p83gG5oKvzC1rY1AydFMF3dha6tGRDJ98+o0uxMmFDR0cjVXpE6ZTGfbItjxfPKZzqdxrO7OLDUZk8K0aa7x43dMgIfuyHfVZH8qxjJ32gI88i1OhyzfU27GFNPqKqP2E4j9Yxx03gokDTA5HxG1qmjSCpDHtBAIlzqnelOvm7RKxcxkOL8o4PwzSO0DtIw7FkjWj0RAmzwcM0xCdausaFQUD1dT2FTXaXQ5JoSCWD7EACAaX6dR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 04:48:59.8548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1f64ff-de2c-4640-bfed-08df019b036d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432

Add hot-join support for the AMD AXI I3C master controller.
By default, the hot-join acknowledgment is disabled. Users can use the
sysfs entry to enable it. A hot-join event is handed to the i3c core
with i3c_master_queue_hotjoin(), which runs DAA from the core workqueue
so the new device is enumerated.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in V2:
- Use the core's i3c_master_queue_hotjoin() instead of a private work
  item, and only queue when hj_capable is set; the core owns the work
  and cancels it on unregister.
- Update the commit description accordingly.
---
 drivers/i3c/master/amd-i3c-master.c | 67 +++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd-i3c-master.c
index 92a9f43f8934..26ef2ba9f651 100644
--- a/drivers/i3c/master/amd-i3c-master.c
+++ b/drivers/i3c/master/amd-i3c-master.c
@@ -55,9 +55,11 @@
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
@@ -191,11 +193,14 @@ struct xi3c_xfer {
  *	       @xfer_resp_valid is set. Guarded by @lock.
  * @xfer_resp_valid: True once the in-flight transfer's own response word has
  *		     been taken from the shared response FIFO. Guarded by @lock.
- * @irq: Controller interrupt line, used for IBI events. Only valid when
- *	 @ibi_capable is set.
+ * @irq: Controller interrupt line, used for IBI/Hot-Join events. Only valid
+ *	 when @ibi_capable is set.
  * @ibi_capable: True when the IP was synthesized with In-Band Interrupt
- *		 support ("xlnx,in-band-interrupt-capable"); also the
- *		 condition for the controller interrupt being present.
+ *		 support ("xlnx,in-band-interrupt-capable"). Since Hot-Join
+ *		 requests are ACKed by the IBI machinery, this is also the
+ *		 condition for the controller interrupt being present at all.
+ * @hj_capable: True when the IP was synthesized with Hot-Join support
+ *		("xlnx,hot-join-capable"); implies @ibi_capable.
  * @ops: Controller ops handed to the framework, assembled at probe time from
  *	 the base ops plus the callbacks the design actually supports.
  * @ibi: In-Band Interrupt slot tracking.
@@ -224,6 +229,7 @@ struct xi3c_master {
 	bool xfer_resp_valid;
 	int irq;
 	bool ibi_capable;
+	bool hj_capable;
 	struct i3c_master_controller_ops ops;
 	struct {
 		spinlock_t lock; /* protects slots[] against the IBI handler */
@@ -1243,13 +1249,14 @@ static void xi3c_master_bus_cleanup(struct i3c_master_controller *m)
 	struct xi3c_master *master = to_xi3c_master(m);
 
 	/*
-	 * Disarm all interrupt sources and the IBI ACK so the controller can't
-	 * assert once disabled; reset the refcount that tracks them.
+	 * Disarm the interrupts and the IBI/Hot-Join ACKs so nothing is left
+	 * armed for a later bus_init(); reset the refcount that tracks them.
 	 */
 	scoped_guard(spinlock_irqsave, &master->reg_lock) {
 		iowrite32(0, master->membase + XI3C_INTR_RE_OFFSET);
 		iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) &
-			  ~XI3C_CR_IBI_MASK, master->membase + XI3C_CR_OFFSET);
+			  ~(XI3C_CR_IBI_MASK | XI3C_CR_HJ_MASK),
+			  master->membase + XI3C_CR_OFFSET);
 		master->ibi.enabled_count = 0;
 	}
 
@@ -1550,6 +1557,32 @@ static void xi3c_master_process_ibi(struct xi3c_master *master, u32 resp, u8 da)
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
 static irqreturn_t xi3c_master_irq_handler(int irq, void *dev_id)
 {
 	struct xi3c_master *master = dev_id;
@@ -1570,6 +1603,9 @@ static irqreturn_t xi3c_master_irq_handler(int irq, void *dev_id)
 			xi3c_master_handle_ibi(master);
 	}
 
+	if (master->hj_capable && (status & XI3C_INTR_HJ_MASK))
+		i3c_master_queue_hotjoin(&master->base);
+
 	return IRQ_HANDLED;
 }
 
@@ -1590,6 +1626,11 @@ static void xi3c_master_init_ibi_ops(struct xi3c_master *master)
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
@@ -1625,10 +1666,18 @@ static int xi3c_master_probe(struct platform_device *pdev)
 	master->ibi_capable =
 		device_property_read_bool(master->dev,
 					  "xlnx,in-band-interrupt-capable");
+	master->hj_capable =
+		device_property_read_bool(master->dev,
+					  "xlnx,hot-join-capable");
+
+	/* Hot-Join requests are ACKed by the IBI machinery. */
+	if (master->hj_capable && !master->ibi_capable)
+		return dev_err_probe(master->dev, -EINVAL,
+				     "hot-join-capable requires in-band-interrupt-capable\n");
 
 	/*
-	 * The interrupt only carries IBI events, so it is only described for
-	 * designs synthesized with that feature.
+	 * The interrupt only carries IBI and Hot-Join events, so it is only
+	 * described for designs synthesized with those features.
 	 */
 	if (master->ibi_capable) {
 		xi3c_master_init_ibi_ops(master);
-- 
2.34.1

