Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99283C1F54;
	Fri, 14 Aug 2026 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786708342; cv=fail; b=N9ZZnWNWmUw0PGyCDcCkpoqXTxwRVO1DEU/KyWKyDijjg9dkoBFu+VjIULs2czXJlZwPcFM1N8L69khwViDPK70uH2vn5R13z/4TV3D/1W9YJcd4FgwVSdxXh5Wtk5+4CwkfIETDGAg7AH3BqdMw4Tlm5HYi+RgA6iNnDz+RKiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786708342; c=relaxed/simple;
	bh=zBASzBJ+uPuvqYZfMPeQAl8p0KQ7jgSkKVa0PcePek0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WtHBTFzOdWv+Z8mIuOMI0KvoHVqsNv/NjornAnxKYZYKgMTzkt6E1KjxmbHKGI9bb5v/aSuEttZ4+QRBHcYoGHcx+96E06VM9cUmIjE42rWYgEHujIWWBZ89ohI2c9uxaRBk8+27eFbZuj68rCr5H1gJlueJW5jfzoq65LNE3zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xaFTaFv2; arc=fail smtp.client-ip=52.101.43.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xaFTaFv2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pavb5DdFBo2pUR6zI9BDtr2+GNZsCHspkUfHwhhFQuCqVLRBGMu/QkBnWX7eBRd1gu45GdRgNEsfmqqh4BnGSTWOcBSxmGExcRg+bkLdnUUo/mKxicppaq2BM3E33EZvhLLahNjZ0S/ul7HDRhcnQfkrEjQaMCqAetAAHzNaDOw9jz6/zFTLTCrx1Ed8K3pgBZSOpjj1ody3PP5hTuvT3au5g6N5xnToMQHjK7jXmOJsTSlbYmyAd3tWXpFvPmBaNYQodu3NVX9vEebNoXRiWdtKQACRllxQqoI3+eLR1jroTPVxi4dPo7jcXwHsNqCHRmIlDe4aFnz+Bfl/huBQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywzbkT2SOalCtmwPjBmVO1O2IGa1WEYquigf5Wqn5O8=;
 b=rW5QCmNuEyMf0Te6YUJS7t/vyVmzyvZw1KJjHCq85/O5zoyGZ8PnvATyJB7e+8TbQjveEvzu0ODyCRguyrOpH9XTbOpEKqJoFGgKUPOckaRwdTbjsjqSaQHL1pXWOr2ug6SxxMotkOld2cf26oNlSbj/ZryWnFLxzGPfnGGaI0MAb/kfVIfNIF+OqHnEYGY+y7kml/sgFjRsAcrVk5Y/rCvyf5PfsWceerjH/ms9Ba7gVa1CjrfXMKg5G24jRXICw33dAN86hSoJyadjaAW9aaMrNOnG2rog3bcVHt4NZqk7uBl/4PiF3pztJ3PteX/R6NVdHpmtZBCOVM3nfSRT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywzbkT2SOalCtmwPjBmVO1O2IGa1WEYquigf5Wqn5O8=;
 b=xaFTaFv2F1yCvLonArSWs/e/VUwQLpZNbeAMkozlbxObsG+D2ZRG5b9wkKlqytcXbh3zZWNxgzlizPie9FHswCrIHsR9aqg0egh4WCthHwFoBZyQI8Thvmo3gTmS1/YnrPs29VVTHw0uttt8EtzG935zIm4e5wFBZocq6nh2fXk=
Received: from CH5P223CA0011.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::20)
 by SAWPR12MB999117.namprd12.prod.outlook.com (2603:10b6:806:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Fri, 14 Aug
 2026 11:52:12 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::f) by CH5P223CA0011.outlook.office365.com
 (2603:10b6:610:1f3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 11:52:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 11:52:11 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 06:52:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 06:52:10 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 06:52:07 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH 2/3] i3c: master: amd: Add support for in-band interrupts
Date: Fri, 14 Aug 2026 17:21:54 +0530
Message-ID: <20260814115155.3974988-3-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|SAWPR12MB999117:EE_
X-MS-Office365-Filtering-Correlation-Id: a7261e21-d2d0-49f8-cf20-08def9fa79dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|10067099003|11063799006|5023799004|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	y1Y04/RYVoqjyZg2TPDIWDKO2Q3J78cnjIjJ72rlObWLtn7IACB0G+4KQMqlspLX9kht649NhehcSJY66ad35uxqlIPoavoyVvl+cFJ27H2SH7CobWpOb6V3FEXPsNc+eiGhL/jTQZeaqC9TTiSpgOUDciogf+/5mplUEvq0/kE27UbexdDKoxedgm6RLiGZ48HuYzjdJU6wZizJygPApow9RD7DWV6foo1/sxcY7nbiOmBHA3JehSxueCfftN7nmfINLaNC/2LkrqOjmf14F5r0q4+VN8c3N3qmqPF4G1/+vscw1B7zAgUPU8w3ATW13UgIqliRspMUmKmiEr7uuXqfBkgsyi0i5Sbm5YEU3xHyXliLUkfmPjxHJ2ByY39mUvr8ShzMP3tiDQTkoeT4CqllInqo+r+hRbGQZ9CkpvKP/63E+pV78jqGW4rUR0IBv1/ipRS4I18FS2GPAcxAZMeFfc38k+6AnMPzbv3XdoXwTExb6g61TBzJmKZVccVobW1WxdAN11wHvzdHAPtHtHgKN93g8MBLm1DvLucA1McFcQ2wdmLonLV6Q4of5sJvANg4qPrlCDvHl7IwFcy1HCI20lKWf2qVV3u4nDu5Wx1X8PbWChvSVV1Gj9VvjkKOWfJa7jC3n8OLsw+Spvf7cWEzMyHcMReNM8+ODohP2GqWB2ReGnaBbZXyeHam5j5ex0w0Af38QgDj1jgl8LEvFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(10067099003)(11063799006)(5023799004)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cl2dHUt9RHeBv2oE6j9U1cRBBSqWn45mGlbuFlVfJ2ZMdySv4QXa6wQuLBOAeLsfDFYUv+xs0kLiMaEFJnBNfAJ2Kj5g29xpBccAjSQFUgBkxHusfzH7KtYptHXUiilJs12ZZ4itHXF9k1616Jk9EC9Q05wU9lGJ0y69yO9d2+otbUJsJvzwhCmqm4iDR0IPqLSibxmuG7+bYh986VDM9tWP7387OOL7tFk1o5il0PzL4N0kVlN4kLoKQWAmxv8g/Triq7Zb6euZqfi4UAY6e9djNWAU8SlHH3VghbCJ2MbzUjNm8odqoJ8uOKoNavk6OZ27dodRtUfhoijwWgHH05FgvtvQZm992QonR1aRnTTneLQlhSOaxQKxF2t72fLCiBXN51QMt1xtJ9yjpuWdjO0QiNJlJovvkuCpgXWI6HPdsF4l5RenuFwc6djFq0VZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 11:52:11.4316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7261e21-d2d0-49f8-cf20-08def9fa79dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999117

Add support for receiving and dequeueing I3C in-band interrupts.

IBI support is optional at synthesis time, so the ops are assembled at
probe from the base set plus the IBI callbacks, and the callbacks are
only registered when the "xlnx,ibi-capable" property is present. The
controller interrupt carries IBI events only, so it is likewise only
requested for such designs.

The IBI ACK enable and its interrupt mask are controller-wide rather
than per-target, so they are armed when the first target enables IBIs
and disarmed when the last one disables them. Per-target control stays
on the bus via ENEC/DISEC.

IBIs share the response and read FIFOs with normal transfers and are
tagged with the reserved TID 0x0F. Masking the interrupt for the
duration of a transfer keeps the handler from running, but does not
stop the controller from ACKing an IBI, so one taken in an idle moment
can still queue its response word and payload ahead of the transfer's
own. The polled transfer path therefore demultiplexes the response FIFO
by TID: an IBI response and its payload are discarded, and the
transfer's own response is claimed into the master state for the caller
to consume.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
 drivers/i3c/master/amd-i3c-master.c | 528 ++++++++++++++++++++++++++--
 1 file changed, 508 insertions(+), 20 deletions(-)

diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd-i3c-master.c
index ef5ad5abb788..d47b04326ea4 100644
--- a/drivers/i3c/master/amd-i3c-master.c
+++ b/drivers/i3c/master/amd-i3c-master.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/i3c/master.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -19,7 +20,9 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/time.h>
 #include <linux/unaligned.h>
 
@@ -28,6 +31,8 @@
 #define XI3C_CR_OFFSET				0x08	/* Control Register */
 #define XI3C_ADDRESS_OFFSET			0x0C	/* Target Address Register */
 #define XI3C_SR_OFFSET				0x10	/* Status Register */
+#define XI3C_INTR_STATUS_OFFSET			0x14	/* Interrupt status event (W1C) */
+#define XI3C_INTR_RE_OFFSET			0x18	/* Interrupt rising-edge enable mask */
 #define XI3C_CMD_FIFO_OFFSET			0x20	/* I3C Command FIFO Register */
 #define XI3C_WR_FIFO_OFFSET			0x24	/* I3C Write Data FIFO Register */
 #define XI3C_RD_FIFO_OFFSET			0x28	/* I3C Read Data FIFO Register */
@@ -42,13 +47,17 @@
 #define XI3C_TSU_STOP_OFFSET			0x50	/* I3C STOP Setup Register */
 #define XI3C_OD_SCL_HIGH_TIME_OFFSET		0x54	/* I3C OD SCL HIGH Register */
 #define XI3C_OD_SCL_LOW_TIME_OFFSET		0x58	/* I3C OD SCL LOW Register */
+#define XI3C_IBI_TARGET_ADDR_OFFSET		0x5C	/* IBI source address register */
+#define XI3C_TARGET_ADDR_BCR_OFFSET		0x60	/* Per-target {DA, BCR} SPRAM */
 #define XI3C_PID0_OFFSET			0x6C	/* LSB 4 bytes of the PID */
 #define XI3C_PID1_BCR_DCR			0x70	/* MSB 2 bytes of the PID, BCR and DCR */
 
 #define XI3C_CR_EN_MASK				BIT(0)	/* Core Enable */
 #define XI3C_CR_RESUME_MASK			BIT(2)	/* Core Resume */
+#define XI3C_CR_IBI_MASK			BIT(3)	/* IBI ACK enable */
 #define XI3C_SR_RESP_NOT_EMPTY_MASK		BIT(4)	/* Resp Fifo not empty status mask */
 #define XI3C_RD_FIFO_NOT_EMPTY_MASK		BIT(15)	/* Read Fifo not empty status mask */
+#define XI3C_INTR_IBI_MASK			BIT(7)	/* IBI event (INTR status/enable) */
 
 #define XI3C_BCR_MASK				GENMASK(23, 16)
 #define XI3C_DCR_MASK				GENMASK(31, 24)
@@ -57,6 +66,7 @@
 #define XI3C_REV_NUM_MASK			GENMASK(15, 8)
 #define XI3C_PID1_MASK				GENMASK(15, 0)
 #define XI3C_FIFO_LEVEL_MASK			GENMASK(15, 0)
+#define XI3C_RESP_FIFO_LEVEL_MASK		GENMASK(31, 16)
 #define XI3C_RESP_CODE_MASK			GENMASK(8, 5)
 
 /* Controller response codes; PG439 page 34, Table 46 */
@@ -69,7 +79,9 @@
 #define XI3C_XFER_SHORT_READ			1
 
 #define XI3C_RESP_BYTES_MASK			GENMASK(20, 9)	/* NUM_BYTES processed */
+#define XI3C_RESP_TID_MASK			GENMASK(3, 0)	/* response transfer ID */
 #define XI3C_ADDR_MASK				GENMASK(6, 0)
+#define XI3C_TGT_BCR_MASK			GENMASK(15, 8)	/* TARGET_ADDR_BCR: BCR field */
 #define XI3C_FIFOS_RST_MASK			GENMASK(4, 1)
 
 /* Command FIFO word layout (bit ranges encoded in the GENMASK/BIT args) */
@@ -121,9 +133,15 @@
 #define XI3C_POLL_INTERVAL_US			10
 
 #define XI3C_I2C_MODE				0
-#define XI3C_I2C_TID				0
 #define XI3C_SDR_MODE				1
+
+/*
+ * TID tags: I2C/SDR are driver-chosen for normal transfers;
+ * 0x0F is the spec-reserved IBI response TID.
+ */
+#define XI3C_I2C_TID				0
 #define XI3C_SDR_TID				1
+#define XI3C_IBI_RESP_TID			0x0F
 
 #define XI3C_WORD_LEN				4
 
@@ -132,6 +150,9 @@
 /* Software guard: 1 s (ms, for msecs_to_jiffies) to bail out if a transfer never completes */
 #define XI3C_XFER_TIMEOUT_MS			1000
 
+/* IBI response wait in hard-IRQ context; software-chosen safety cap. */
+#define XI3C_IBI_RESP_TIMEOUT_US		1000
+
 struct xi3c_cmd {
 	const void *tx_buf;
 	void *rx_buf;
@@ -160,9 +181,30 @@ struct xi3c_xfer {
  * @membase: Memory base of the HW registers.
  * @pclk: Input clock driving the controller.
  * @lock: Serializes transfers and CCC submission.
+ * @reg_lock: IRQ-safe lock serializing read-modify-write of the shared
+ *	      control (XI3C_CR_OFFSET) and interrupt-enable
+ *	      (XI3C_INTR_RE_OFFSET) registers.
  * @daa: ENTDAA enumeration state.
  * @daa.addrs: Dynamic addresses assigned in enumeration order.
  * @daa.index: Number of responders enumerated so far.
+ * @xfer_resp: Response word claimed for the transfer in flight; valid while
+ *	       @xfer_resp_valid is set. Guarded by @lock.
+ * @xfer_resp_valid: True once the in-flight transfer's own response word has
+ *		     been taken from the shared response FIFO. Guarded by @lock.
+ * @irq: Controller interrupt line, used for IBI events. Only valid when
+ *	 @ibi_capable is set.
+ * @ibi_capable: True when the IP was synthesized with In-Band Interrupt
+ *		 support ("xlnx,ibi-capable"); also the condition for the
+ *		 controller interrupt being present.
+ * @ops: Controller ops handed to the framework, assembled at probe time from
+ *	 the base ops plus the callbacks the design actually supports.
+ * @ibi: In-Band Interrupt slot tracking.
+ * @ibi.lock: Protects @ibi.slots against the IBI handler.
+ * @ibi.slots: Per-device IBI registration, indexed by slot.
+ * @ibi.enabled_count: Number of devices with IBI currently enabled; the
+ *		       controller-wide IBI ACK/interrupt is armed on the
+ *		       first enable and disarmed on the last disable. Guarded
+ *		       by @reg_lock.
  */
 struct xi3c_master {
 	struct i3c_master_controller base;
@@ -170,10 +212,31 @@ struct xi3c_master {
 	void __iomem *membase;
 	struct clk *pclk;
 	struct mutex lock; /* serializes transfers and CCC submission */
+	spinlock_t reg_lock;
 	struct {
 		u8 addrs[XI3C_MAX_DEVS];
 		u8 index;
 	} daa;
+	u32 xfer_resp;
+	bool xfer_resp_valid;
+	int irq;
+	bool ibi_capable;
+	struct i3c_master_controller_ops ops;
+	struct {
+		spinlock_t lock; /* protects slots[] against the IBI handler */
+		struct i3c_dev_desc *slots[XI3C_MAX_DEVS];
+		unsigned int enabled_count;
+	} ibi;
+};
+
+/**
+ * struct xi3c_i3c_dev_data - Per-device controller state.
+ * @ibi_pool: Generic IBI slot pool backing this device's IBIs.
+ * @ibi_slot: Index into &xi3c_master.ibi.slots, or -1 when unregistered.
+ */
+struct xi3c_i3c_dev_data {
+	struct i3c_generic_ibi_pool *ibi_pool;
+	s16 ibi_slot;
 };
 
 static inline struct xi3c_master *
@@ -206,23 +269,79 @@ static inline bool xi3c_is_resp_available(struct xi3c_master *master)
 			 ioread32(master->membase + XI3C_SR_OFFSET));
 }
 
+static inline u16 xi3c_resp_fifo_level(struct xi3c_master *master)
+{
+	return FIELD_GET(XI3C_RESP_FIFO_LEVEL_MASK,
+			 ioread32(master->membase + XI3C_FIFO_LVL_STATUS_1_OFFSET));
+}
+
+/*
+ * Discard an unconsumed IBI payload from the RX FIFO, keeping the FIFO
+ * aligned for the next transfer.
+ */
+static void xi3c_master_drain_ibi_fifo(struct xi3c_master *master, u16 len)
+{
+	unsigned int words = DIV_ROUND_UP(len, XI3C_WORD_LEN);
+
+	while (words--)
+		ioread32(master->membase + XI3C_RD_FIFO_OFFSET);
+}
+
+/*
+ * Tell whether the transfer in flight has had its response posted, claiming
+ * that response into @master->xfer_resp when it has.
+ *
+ * The response and read FIFOs are shared with IBIs, and masking the interrupt
+ * for the duration of a transfer does not stop the controller from ACKing one:
+ * an IBI taken in an idle moment queues its response word and its payload
+ * ahead of ours. Drop such an IBI here, so a transfer cannot mistake the IBI's
+ * response code and byte count for its own, nor the IBI's payload for read
+ * data.
+ */
+static bool xi3c_xfer_resp_available(struct xi3c_master *master)
+{
+	u32 resp;
+	u16 len;
+
+	if (master->xfer_resp_valid)
+		return true;
+
+	while (xi3c_is_resp_available(master)) {
+		resp = ioread32(master->membase + XI3C_RESP_STATUS_FIFO_OFFSET);
+
+		if (FIELD_GET(XI3C_RESP_TID_MASK, resp) != XI3C_IBI_RESP_TID) {
+			master->xfer_resp = resp;
+			master->xfer_resp_valid = true;
+			return true;
+		}
+
+		len = FIELD_GET(XI3C_RESP_BYTES_MASK, resp);
+		dev_dbg_ratelimited(master->dev,
+				    "IBI raced with transfer, dropping %u bytes\n",
+				    len);
+		xi3c_master_drain_ibi_fifo(master, len);
+	}
+
+	return false;
+}
+
 static int xi3c_get_response(struct xi3c_master *master, struct xi3c_cmd *cmd)
 {
 	u32 response_data;
-	u32 resp_reg;
+	bool available;
 	u8 code;
 	int ret;
 
-	ret = readl_poll_timeout(master->membase + XI3C_SR_OFFSET,
-				 resp_reg,
-				 resp_reg & XI3C_SR_RESP_NOT_EMPTY_MASK,
-				 XI3C_POLL_INTERVAL_US, XI3C_RESP_TIMEOUT_US);
+	ret = read_poll_timeout(xi3c_xfer_resp_available, available, available,
+				XI3C_POLL_INTERVAL_US, XI3C_RESP_TIMEOUT_US,
+				false, master);
 	if (ret) {
 		dev_err(master->dev, "XI3C response timeout\n");
 		return ret;
 	}
 
-	response_data = ioread32(master->membase + XI3C_RESP_STATUS_FIFO_OFFSET);
+	response_data = master->xfer_resp;
+	master->xfer_resp_valid = false;
 	code = FIELD_GET(XI3C_RESP_CODE_MASK, response_data);
 
 	switch (code) {
@@ -247,6 +366,19 @@ static int xi3c_get_response(struct xi3c_master *master, struct xi3c_cmd *cmd)
 	}
 }
 
+/*
+ * Wait for a response in hard-IRQ context (IBI path). Uses the atomic
+ * poll variant since the IBI handler must not sleep.
+ */
+static int xi3c_wait_resp_atomic(struct xi3c_master *master)
+{
+	u32 sr;
+
+	return readl_poll_timeout_atomic(master->membase + XI3C_SR_OFFSET, sr,
+					 sr & XI3C_SR_RESP_NOT_EMPTY_MASK,
+					 0, XI3C_IBI_RESP_TIMEOUT_US);
+}
+
 static inline void xi3c_writesl_be(void __iomem *addr, const void *buffer,
 				   unsigned int count)
 {
@@ -331,6 +463,7 @@ static inline void xi3c_master_disable(struct xi3c_master *master)
 
 static inline void xi3c_master_resume(struct xi3c_master *master)
 {
+	guard(spinlock_irqsave)(&master->reg_lock);
 	iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) |
 		  XI3C_CR_RESUME_MASK, master->membase + XI3C_CR_OFFSET);
 }
@@ -356,6 +489,11 @@ static void xi3c_master_reset_fifos(struct xi3c_master *master)
 
 static inline void xi3c_master_init(struct xi3c_master *master)
 {
+	/* Mask all interrupt sources and clear any stale latched events. */
+	iowrite32(0, master->membase + XI3C_INTR_RE_OFFSET);
+	iowrite32(ioread32(master->membase + XI3C_INTR_STATUS_OFFSET),
+		  master->membase + XI3C_INTR_STATUS_OFFSET);
+
 	/* Reset fifos */
 	xi3c_master_reset_fifos(master);
 
@@ -437,13 +575,19 @@ static int xi3c_master_read(struct xi3c_master *master, struct xi3c_cmd *cmd)
 		return ret;
 	}
 
-	if (!(status_reg & XI3C_RD_FIFO_NOT_EMPTY_MASK))
+	/*
+	 * No data queued means this read produced none, unless what is queued
+	 * is an IBI response that raced with it; xi3c_xfer_resp_available()
+	 * discards that case so the wait for our own data can continue.
+	 */
+	if (!(status_reg & XI3C_RD_FIFO_NOT_EMPTY_MASK) &&
+	    xi3c_xfer_resp_available(master))
 		return 0;
 
 	timeout = jiffies + msecs_to_jiffies(XI3C_XFER_TIMEOUT_MS);
 
 	/* Read data from rx fifo */
-	while (cmd->rx_len > 0 && !xi3c_is_resp_available(master)) {
+	while (cmd->rx_len > 0 && !xi3c_xfer_resp_available(master)) {
 		if (time_after(jiffies, timeout)) {
 			dev_err(master->dev, "XI3C read timeout\n");
 			return -EIO;
@@ -503,7 +647,7 @@ static int xi3c_master_write(struct xi3c_master *master, struct xi3c_cmd *cmd)
 
 	timeout = jiffies + msecs_to_jiffies(XI3C_XFER_TIMEOUT_MS);
 	/* Fill if any remaining data to tx fifo */
-	while (cmd->tx_len > 0 && !xi3c_is_resp_available(master)) {
+	while (cmd->tx_len > 0 && !xi3c_xfer_resp_available(master)) {
 		if (time_after(jiffies, timeout)) {
 			dev_err(master->dev, "XI3C write timeout\n");
 			return -EIO;
@@ -547,22 +691,33 @@ static int xi3c_master_common_xfer(struct xi3c_master *master,
 				   struct xi3c_xfer *xfer)
 {
 	unsigned int i;
-	int ret;
+	int ret = 0;
 
 	guard(mutex)(&master->lock);
 
+	/*
+	 * IBIs share the response/read FIFOs; mask the IRQ so the handler
+	 * cannot take this transfer's response.
+	 */
+	if (master->ibi_capable)
+		disable_irq(master->irq);
+
+	/* Discard any response claimed but not consumed by an aborted transfer. */
+	master->xfer_resp_valid = false;
+
 	for (i = 0; i < xfer->ncmds; i++) {
 		ret = xi3c_master_xfer(master, &xfer->cmds[i]);
-		if (ret) {
-			/* Count commands sent on the bus; the rest never ran */
-			xfer->nissued = i + 1;
-			return ret;
-		}
+		if (ret)
+			break;
 	}
 
-	xfer->nissued = xfer->ncmds;
+	if (master->ibi_capable)
+		enable_irq(master->irq);
 
-	return 0;
+	/* On failure @i is the command that failed; the rest never ran. */
+	xfer->nissued = (i < xfer->ncmds) ? i + 1 : xfer->ncmds;
+
+	return ret;
 }
 
 static int xi3c_master_do_daa(struct i3c_master_controller *m)
@@ -1052,9 +1207,296 @@ static void xi3c_master_bus_cleanup(struct i3c_master_controller *m)
 {
 	struct xi3c_master *master = to_xi3c_master(m);
 
+	/*
+	 * Disarm all interrupt sources and the IBI ACK so the controller can't
+	 * assert once disabled; reset the refcount that tracks them.
+	 */
+	scoped_guard(spinlock_irqsave, &master->reg_lock) {
+		iowrite32(0, master->membase + XI3C_INTR_RE_OFFSET);
+		iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) &
+			  ~XI3C_CR_IBI_MASK, master->membase + XI3C_CR_OFFSET);
+		master->ibi.enabled_count = 0;
+	}
+
 	xi3c_master_disable(master);
 }
 
+static int xi3c_master_request_ibi(struct i3c_dev_desc *dev,
+				   const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct xi3c_master *master = to_xi3c_master(m);
+	struct xi3c_i3c_dev_data *data;
+	unsigned long flags;
+	unsigned int i;
+
+	data = kzalloc_obj(*data, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->ibi_slot = -1;
+	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(data->ibi_pool)) {
+		int ret = PTR_ERR(data->ibi_pool);
+
+		kfree(data);
+		return ret;
+	}
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	for (i = 0; i < ARRAY_SIZE(master->ibi.slots); i++) {
+		if (!master->ibi.slots[i]) {
+			data->ibi_slot = i;
+			master->ibi.slots[i] = dev;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	if (data->ibi_slot < 0) {
+		dev_err(master->dev, "IBI: no free slot for addr 0x%02x\n",
+			dev->info.dyn_addr);
+		i3c_generic_ibi_free_pool(data->ibi_pool);
+		kfree(data);
+		return -ENOSPC;
+	}
+
+	i3c_dev_set_master_data(dev, data);
+
+	return 0;
+}
+
+static void xi3c_master_free_ibi(struct i3c_dev_desc *dev)
+{
+	struct xi3c_i3c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct xi3c_master *master = to_xi3c_master(m);
+	unsigned long flags;
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	master->ibi.slots[data->ibi_slot] = NULL;
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	i3c_generic_ibi_free_pool(data->ibi_pool);
+	i3c_dev_set_master_data(dev, NULL);
+	kfree(data);
+}
+
+/*
+ * Arm the controller-wide IBI ACK enable and event interrupt on the first
+ * device to enable IBIs. Per-device SIR control is still done on the bus via
+ * ENEC/DISEC; this only gates whether the controller reacts to IBIs at all.
+ */
+static void xi3c_master_ibi_arm(struct xi3c_master *master)
+{
+	guard(spinlock_irqsave)(&master->reg_lock);
+
+	if (master->ibi.enabled_count++)
+		return;
+
+	iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) | XI3C_CR_IBI_MASK,
+		  master->membase + XI3C_CR_OFFSET);
+	iowrite32(ioread32(master->membase + XI3C_INTR_RE_OFFSET) |
+		  XI3C_INTR_IBI_MASK, master->membase + XI3C_INTR_RE_OFFSET);
+}
+
+/* Disarm the controller-wide IBI enable once the last device disables IBIs. */
+static void xi3c_master_ibi_disarm(struct xi3c_master *master)
+{
+	guard(spinlock_irqsave)(&master->reg_lock);
+
+	if (WARN_ON(!master->ibi.enabled_count))
+		return;
+
+	if (--master->ibi.enabled_count)
+		return;
+
+	iowrite32(ioread32(master->membase + XI3C_INTR_RE_OFFSET) &
+		  ~XI3C_INTR_IBI_MASK, master->membase + XI3C_INTR_RE_OFFSET);
+	iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) & ~XI3C_CR_IBI_MASK,
+		  master->membase + XI3C_CR_OFFSET);
+}
+
+static int xi3c_master_enable_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct xi3c_master *master = to_xi3c_master(m);
+	u32 val;
+	int ret;
+
+	/*
+	 * Program {DA, BCR} into the IBI SPRAM; the DA field self-selects the
+	 * row, so a plain write keeps the entry fresh after DAA reassigns the
+	 * address.
+	 */
+	val = FIELD_PREP(XI3C_ADDR_MASK, dev->info.dyn_addr) |
+	      FIELD_PREP(XI3C_TGT_BCR_MASK, dev->info.bcr);
+	iowrite32(val, master->membase + XI3C_TARGET_ADDR_BCR_OFFSET);
+
+	/* Arm the controller IBI path before allowing this device to SIR. */
+	xi3c_master_ibi_arm(master);
+
+	ret = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	if (ret) {
+		dev_err(master->dev, "IBI: ENEC failed addr 0x%02x (%d)\n",
+			dev->info.dyn_addr, ret);
+		xi3c_master_ibi_disarm(master);
+	}
+
+	return ret;
+}
+
+static int xi3c_master_disable_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct xi3c_master *master = to_xi3c_master(m);
+	int ret;
+
+	ret = i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+
+	xi3c_master_ibi_disarm(master);
+
+	return ret;
+}
+
+static void xi3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
+					 struct i3c_ibi_slot *slot)
+{
+	struct xi3c_i3c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
+}
+
+static void xi3c_master_handle_ibi(struct xi3c_master *master)
+{
+	struct xi3c_i3c_dev_data *data;
+	struct i3c_ibi_slot *slot;
+	struct i3c_dev_desc *dev;
+	u32 ibi_reg, resp;
+	unsigned int id;
+	u8 da, code;
+	u16 len;
+
+	ibi_reg = ioread32(master->membase + XI3C_IBI_TARGET_ADDR_OFFSET);
+	da = FIELD_GET(XI3C_ADDR_MASK, ibi_reg);
+
+	if (xi3c_wait_resp_atomic(master)) {
+		dev_err_ratelimited(master->dev, "XI3C IBI response timeout\n");
+		/* Controller parks in STOP on failure; RESUME to recover (PG439). */
+		xi3c_master_resume(master);
+		return;
+	}
+
+	resp = ioread32(master->membase + XI3C_RESP_STATUS_FIFO_OFFSET);
+	code = FIELD_GET(XI3C_RESP_CODE_MASK, resp);
+	len = FIELD_GET(XI3C_RESP_BYTES_MASK, resp);
+
+	/*
+	 * TID 0x0F marks an IBI response. A transfer masks this interrupt and
+	 * demuxes the response FIFO itself, so its response must never reach
+	 * here; draining one would eat that transfer's read data.
+	 */
+	if (FIELD_GET(XI3C_RESP_TID_MASK, resp) != XI3C_IBI_RESP_TID) {
+		WARN_ONCE(1, "XI3C: transfer response in IBI handler, dropping %u bytes\n",
+			  len);
+		xi3c_master_drain_ibi_fifo(master, len);
+		/* A non-success stray response parks the controller in STOP (PG439). */
+		if (code != XI3C_RESP_CODE_SUCCESS)
+			xi3c_master_resume(master);
+		return;
+	}
+
+	if (code != XI3C_RESP_CODE_SUCCESS) {
+		dev_dbg_ratelimited(master->dev,
+				    "IBI: non-success code %u, dropping %u bytes\n",
+				    code, len);
+		xi3c_master_drain_ibi_fifo(master, len);
+		xi3c_master_resume(master);
+		return;
+	}
+
+	spin_lock(&master->ibi.lock);
+
+	for (id = 0; id < ARRAY_SIZE(master->ibi.slots); id++)
+		if (master->ibi.slots[id] &&
+		    master->ibi.slots[id]->info.dyn_addr == da)
+			break;
+
+	if (id == ARRAY_SIZE(master->ibi.slots)) {
+		dev_dbg_ratelimited(master->dev,
+				    "IBI: no registered device for addr 0x%02x\n",
+				    da);
+		goto err_drain;
+	}
+
+	dev = master->ibi.slots[id];
+
+	if (!dev->ibi) {
+		dev_dbg_ratelimited(master->dev,
+				    "IBI: addr 0x%02x not fully set up\n", da);
+		goto err_drain;
+	}
+
+	if (len > dev->ibi->max_payload_len) {
+		dev_dbg_ratelimited(master->dev,
+				    "IBI: payload %u > max %u for addr 0x%02x\n",
+				    len, dev->ibi->max_payload_len, da);
+		goto err_drain;
+	}
+
+	data = i3c_dev_get_master_data(dev);
+	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
+	if (!slot) {
+		dev_dbg_ratelimited(master->dev,
+				    "IBI: no free pool slot for addr 0x%02x\n",
+				    da);
+		goto err_drain;
+	}
+
+	slot->len = 0;
+	if (len) {
+		xi3c_readl_fifo(master->membase + XI3C_RD_FIFO_OFFSET,
+				slot->data, len);
+		slot->len = len;
+	}
+
+	i3c_master_queue_ibi(dev, slot);
+	spin_unlock(&master->ibi.lock);
+
+	return;
+
+err_drain:
+	/*
+	 * Reached only with code == SUCCESS, so the controller is not parked in
+	 * STOP; no resume needed (PG439).
+	 */
+	spin_unlock(&master->ibi.lock);
+	xi3c_master_drain_ibi_fifo(master, len);
+}
+
+static irqreturn_t xi3c_master_irq_handler(int irq, void *dev_id)
+{
+	struct xi3c_master *master = dev_id;
+	u32 status;
+
+	status = ioread32(master->membase + XI3C_INTR_STATUS_OFFSET);
+	if (!status)
+		return IRQ_NONE;
+
+	/* Write-1-to-clear the latched events before servicing them. */
+	iowrite32(status, master->membase + XI3C_INTR_STATUS_OFFSET);
+
+	/* Event latches once; drain the queued IBI responses (TID checked per entry). */
+	if (status & XI3C_INTR_IBI_MASK) {
+		u16 pending = xi3c_resp_fifo_level(master);
+
+		while (pending-- && xi3c_is_resp_available(master))
+			xi3c_master_handle_ibi(master);
+	}
+
+	return IRQ_HANDLED;
+}
+
 static const struct i3c_master_controller_ops xi3c_master_ops = {
 	.bus_init = xi3c_master_bus_init,
 	.bus_cleanup = xi3c_master_bus_cleanup,
@@ -1065,6 +1507,15 @@ static const struct i3c_master_controller_ops xi3c_master_ops = {
 	.i2c_xfers = xi3c_master_i2c_xfers,
 };
 
+static void xi3c_master_init_ibi_ops(struct xi3c_master *master)
+{
+	master->ops.request_ibi = xi3c_master_request_ibi;
+	master->ops.free_ibi = xi3c_master_free_ibi;
+	master->ops.enable_ibi = xi3c_master_enable_ibi;
+	master->ops.disable_ibi = xi3c_master_disable_ibi;
+	master->ops.recycle_ibi_slot = xi3c_master_recycle_ibi_slot;
+}
+
 static int xi3c_master_probe(struct platform_device *pdev)
 {
 	struct xi3c_master *master;
@@ -1090,16 +1541,53 @@ static int xi3c_master_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	master->ops = xi3c_master_ops;
+
+	spin_lock_init(&master->ibi.lock);
+	spin_lock_init(&master->reg_lock);
+
+	master->ibi_capable = device_property_read_bool(master->dev,
+							"xlnx,ibi-capable");
+
+	/*
+	 * The interrupt only carries IBI events, so it is only described for
+	 * designs synthesized with that feature.
+	 */
+	if (master->ibi_capable) {
+		xi3c_master_init_ibi_ops(master);
+
+		master->irq = platform_get_irq(pdev, 0);
+		if (master->irq < 0)
+			return master->irq;
+
+		ret = devm_request_irq(master->dev, master->irq,
+				       xi3c_master_irq_handler, IRQF_NO_AUTOEN,
+				       dev_name(master->dev), master);
+		if (ret)
+			return dev_err_probe(master->dev, ret,
+					     "Failed to request IRQ\n");
+	}
+
 	platform_set_drvdata(pdev, master);
 
-	return i3c_master_register(&master->base, master->dev,
-				   &xi3c_master_ops, false);
+	ret = i3c_master_register(&master->base, master->dev, &master->ops,
+				  false);
+	if (ret)
+		return ret;
+
+	if (master->ibi_capable)
+		enable_irq(master->irq);
+
+	return 0;
 }
 
 static void xi3c_master_remove(struct platform_device *pdev)
 {
 	struct xi3c_master *master = platform_get_drvdata(pdev);
 
+	if (master->ibi_capable)
+		disable_irq(master->irq);
+
 	i3c_master_unregister(&master->base);
 }
 
-- 
2.34.1

