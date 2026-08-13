Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC28A419FBD;
	Thu, 13 Aug 2026 06:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602920; cv=fail; b=LM4JBQmNXWYK2D5YIht/ZDU7+IgUstzXBP3k39ptGwBSvJeYFoZRgUO3dLE2hLFmnIl/hnY6CwLXD8R73BwDb/e1VBzp1Vo+Zns58Pt7yxWEYzt2OZ0CWIGh5v1rUPSS8BYrdojoJyCWyI444+4M7FSEtx79meSM5iAnIxHv34g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602920; c=relaxed/simple;
	bh=OLKrS4xis/GRzMk57QiXX0GhphkCcqr+m4rp62Lwohs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qPwd8PYl2GByf5aLUCPnbDlcuHVbdmsi/sJE4xixinCDuFrOkON4AB/oRap8km2e5IB49ulBS+kILgvRlY/bMB5xv4nmLvsrdYfGPxYCxkWv8klhMdY+LpFDX3cyUWJyUe9WmMTmgUKIQvn4ZsXMWENzAaaAhzgpwarNTNAj+04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=J9JK8h6u; arc=fail smtp.client-ip=52.101.53.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="J9JK8h6u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILZquJoKlGXw5T6NBSNfPqyUM95jCWIy+fZWDDk97nQywt01JDThncw+k9wojRkKF7mz5Mre8LW/Oi0031XVRZc20iFobQJ4ljRR0mBmCVwuoMj6KxmOoj2fIeXmGnYdF30T8CjoLjKEO74b7aWQ6A14Zmfe4JLzAFvh5Ol8rliBoNsHy1NDBKPWhbcou/fTpjqycFjzDzTUNYzwUw/tjAZKkXGlvmNN1LyJ5pkcD0vEv3LD8cNKwDNk5CVEVpxbWHSXDde8R3epZp9bQTeM0RrgHDOzScTGUFnap/P8g9po7FH8qAFrTLBLkmsjzr+IUoi5qYMxRW78uRp/CS7OOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4W8KyjKfSTyOtahZvaOMfEd6dEikFbwrgV67ByI1nD8=;
 b=fOlX6T+EHLXCQqJq69MLltXUYBKuFeC9ZS33kOyo+smo+3zYSYfaaMqubnmdBYO8yYPyFvEwaGJB43yEwwFK0brQAsoKjZdZMgvcaXgoAhZQa7cfjOsdDXltYzk9fefvJr7Fr2PxU3OHmy92QV9XR5WnY+O4odB5NCacy86k/+2Ltc2DJIXy5SlGmOjFZASYkdTG/iky7Fej3QHBNc3GkX87V9B1wYicE3LUVK8MlkLBhq4zlEEjM/ioikCsB3Yb+sYZc9pM7JL1ofTwHYqIMGhKc8Zmi/o7TMrOR0+a2RAf88TEY1ksz59SwqygiBOnpvTgqhRcT4NePkvzsc6BjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4W8KyjKfSTyOtahZvaOMfEd6dEikFbwrgV67ByI1nD8=;
 b=J9JK8h6ugDNCTO3xAkEifhhPM4D6jFuYNxLZ/+IkCa7043/MGBPvBtBBQEABSRuHW8SPT3uDQUNWr5xTE8aFHclP68xbCufsCsA3XwEBvpIm2LQyJdQlHX/Xit9W6i8BVaeBfqk70Yjo5ASxIrFcDvae8Ie4zel88ldOslZBLYCBoMZr5Qd6TlPFyiVPy87n3NFdYJNlFqBcoWa37luls1tkf9aNoIFhwXGvcxLN+88Pd7+HMC65QzZgomMY51PU5GhRQ+JBuEM4Pfav2yaKifjuYJyMAOxuPwPMfP6QLgscImxs3Qin3u3+pFHRP8/jqXZhMi9OD23B06a7kqNvoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DM6PR03MB5306.namprd03.prod.outlook.com (2603:10b6:5:243::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 06:35:15 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 06:35:15 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/4] firmware: stratix10-svc: Add for SDM mailbox doorbell interrupt
Date: Wed, 12 Aug 2026 23:35:10 -0700
Message-ID: <0635f2f00a167faf8bcffcf70fe095a86011da6f.1786600929.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1786600929.git.tze.yee.ng@altera.com>
References: <cover.1786600929.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::18) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DM6PR03MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: e462cb8a-3312-4062-5e94-08def905089a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|10067099003|11063799006|5023799004|22082099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	phToJy53QS0Aib9nENJJO9qXWnfCLc7irNb87C567U1m3ZA8SCF7+L3xwj//BAPnBssSjtbtnDpMi3jOL+RIDhYCIdDXLx105XJgCgshFV/l3Q2wLA7cmqzXZOKCdvj3ofsrOyUT0EzfCEe35gh27lHNuHacqEIYvSUQFMOKOVzpBRq2NmghCb75paeoB6pt/u0tC/rx7S4s9mf19ReRV58HcA5ZH2cmMUTbTAxjRwUO0EGsD6lYZ4KdABzTvzIk7KbcQorGICYCDWMqj79iX4v6T/mVDK0pYGT6zKdsfpotUHd+N6eFcSUY4z6CP/Q0Qy6xBMCwVoX1o2uNIXQwJWegKCQPW1WHAdMe1auGzkWIQDZNlvEqPYvjTScGN+7ULe42suKQeMyiNCoFdNjBMffbwi2Oj3QeyAo/vo4iH3oItzu9qDp3zQF0B3yboy/VmCfjcsA89ZJtN7DbJb99aZWn0Xgqi39ikhm1sC5leapRMwZpGjiASv05+eNqN4yHT0Pb13WoHiPjJhPK5Um79vz5XhxLu+hkJF5/9kfdpu8oKRndD/mowbnxOook1Q6/09NlS6+Nz2obgqCxP7mv8kqCSlpqoyeOLhfSW3UexLxVLhAGaXbdri00tXpMPIn1CIzATmbqr1xRHIBbq0RoZ3I3IH4NZdhO79H7GRX3HNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4txYaA94OS48LpUpljkdgl20BhWz7xhZbuyqxrYOKfrhUGDTvufKP/K8f85n?=
 =?us-ascii?Q?JLEhUqymlstqc4ol1Zp2Ash8RA0+mzlXZGOT7vgV8XE94jkhpt0vgZEYmtQX?=
 =?us-ascii?Q?TmZoY0z2S48RuG/M9E3mlZgoOWKqkvrEVOIpJ1vZoUXx1KSxtr9PHsz3+o/O?=
 =?us-ascii?Q?lDRaBQdkUl0TQhMKBkwDOxbDn8SuSKWgj1SIHHsgCN/J4PvsYIatvDcloqNI?=
 =?us-ascii?Q?MT2yzJU5p2Vf/nx0+xR2if5WnTezGtRg37No90mQivNM7bjW1G3QbcUSF8ci?=
 =?us-ascii?Q?+K2AWMDex2ASBaCJvWH/cQITqP+6SjQHNBexhwxdU1t63/YHWs0UsykX2HTl?=
 =?us-ascii?Q?mKKuPm5ld4RcPyaafsR1v085RP/RSTnzqiFXt4Shfsz0fW4Yvjs0rk59OfgB?=
 =?us-ascii?Q?LAOG1cTXCzei4b1W1Vo1hS1v0hJ5dV8HhL++Fxnv3T1Qgl3/FrdPaJvQwZRB?=
 =?us-ascii?Q?fuTZUJzb8WmROssWCbde4RdRfR0xTJykcQpK5pE/4F3iSYJ9knvPpsX18aj5?=
 =?us-ascii?Q?dQwl3ZLQ16ICaa0rkTSGdhAdtYmrHt+eEs7X0tXBmDUlwC7aaD4hf39P4WtJ?=
 =?us-ascii?Q?+Z2odwUQ+3Drvmv1AxTLrbBJhBSGOWM+4O8UArZYUsk2BqCZBEEbWHKK+Zh4?=
 =?us-ascii?Q?Ks2EcdDEDh13fTcgjcOWk30UTgYzd/DTvp7tippNDTad3E+8WPCmAoGiATlm?=
 =?us-ascii?Q?W25KddvVi7mogf481NAchrdQ23gGJBwRyxtlNKfkMIFLl3SyT5Nj0W3OVKAh?=
 =?us-ascii?Q?o+xeLwLw33bv/6GOpf4LGl+4Og+q4hkQv/Cje3tvhPd8M44zMDAFnbvcYVC5?=
 =?us-ascii?Q?ShenOgY28XSS/9uCATYd89S7xz9FWGUKT5aMVxPBbhPguuJUehezJzZQZaeZ?=
 =?us-ascii?Q?kF+mx4y67Jt7TddNqcBjV5GPMg+GhFVSUHLE39fmBufNvC8VcpR0gLJoodMc?=
 =?us-ascii?Q?bmem59SOQfDb+HRUXFidJD+vTEjjKvqim7cfdjkqg+rOvSqhplvLw5RaaENF?=
 =?us-ascii?Q?LoNxj0A51b1fLj+7lYEYNcN62WkGR+IzZHSYP4pbbejGGGMYbz+qCI+2jZWk?=
 =?us-ascii?Q?GlM7OE+3GW8kfsscG5DsszCMCdZmhEB6iGtDfFmMmJoQJszj09Q6QqH/4iCj?=
 =?us-ascii?Q?zv/9SZhRPv/HI3Eu8GsSSMVJ1Le61nKAtBbbYeuQvL7xtHQJcbqrBj8dmPi7?=
 =?us-ascii?Q?W8vqEKzib7PskHVs/gd3qkWlcfY8f+43T9S1jMhPyyZpezKYfIn3FTXbNmNu?=
 =?us-ascii?Q?MlTvdIP/Vw9zasK47Q0HY6DhEjSrDaVPrda33zbEjvuFeiHaBwunvGue7kZQ?=
 =?us-ascii?Q?1IzTor5PFVuWzWvIHhHZPeddt8y2VJ9QpeeWRPO03MOZogvxsVj+QIYXAfrd?=
 =?us-ascii?Q?J/N8b8E6iAM6EQdL8S1v2eN2HwqTNwxZrj7ypX+BRDWaHLEkCLvWBYnlLV32?=
 =?us-ascii?Q?e/EAiP7J5MJ0+Zc6V4/giFmYz0w9p3LHMUSzN8t4Cxzr4UTSQDqnyiZ/jOzq?=
 =?us-ascii?Q?jsNlVO5NxelCciczLreE63FZGK6d0duGrcD4MzrTNuzbVcxLDrXRKTFuEEPL?=
 =?us-ascii?Q?THeY32hhM8gg4gA9cXsubF3QGz88T1bnCaZTmUUBY34N57rgdeYoO+EHQXx9?=
 =?us-ascii?Q?/+PQ0qo2ouq4Ix5xPZWXV+u1+1nvZ7Uzmaqxa0cZe4F0kpm/lMpWEstHuKrW?=
 =?us-ascii?Q?YG1lQuY43n1BYH4vmZ8Q0oaNpJws02+/yy+J5Jp/MLIroHJTPT2ssEnFwZfd?=
 =?us-ascii?Q?iRJI66BwrQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e462cb8a-3312-4062-5e94-08def905089a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:35:14.9657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxrjbzCHzwdqW1zHtMUWXenSVHsCdQq/QCPJO66hSCFXsIHhhWgBzKQ/fZsw/kseC8uOIPHk7N/Rq9lP44dfTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5306

From: Mahesh Rao <mahesh.rao@altera.com>

Add support for SDM (Secure Device Manager) mailbox doorbell interrupt for
async transactions. On interrupt, a workqueue is triggered which polls the
ATF for pending responses and retrieves the bitmap of all retrieved and
unprocessed transaction ids of mailbox responses from SDM. It then triggers
the corresponding registered callbacks.

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v3:
- Reflow commit message body to ~75 columns (fix Dinh's comment in v2
  review)
- Add a newline before stratix10_async_workqueue_handler
  description (fix Dinh's comment in v2 review)
- Treat of_irq_get() failure as irq <= 0, since 0 is also a
  failing value (fix Dinh's comment in v2 review)
- Fix IRQ disable race: only call disable_irq_nosync() when
  queue_work() newly queues work, and disable the fired irq
  argument rather than actrl->irq
- Do not invoke client callbacks under trx_list_lock; copy
  cb/cb_arg under the lock and call the callback after unlock
- Use disable_irq() + flush_work() + devm_free_irq() on
  teardown, and treat unset IRQ as 0
- Demote successful IRQ registration log from dev_alert() to
  dev_info(), and demote async poll failure log from
  dev_err() to dev_dbg()
- Clarify INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ kdoc to match
  a1-a4 bitmap usage
- Drop Reviewed-by: Matthew Gerlach (no longer at Altera)
- Add Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c             | 135 +++++++++++++++++--
 include/linux/firmware/intel/stratix10-smc.h |  21 +++
 2 files changed, 145 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 08395fe3ddaa..3035bf46b65b 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -10,12 +10,14 @@
 #include <linux/genalloc.h>
 #include <linux/hashtable.h>
 #include <linux/idr.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kfifo.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -24,6 +26,7 @@
 #include <linux/firmware/intel/stratix10-smc.h>
 #include <linux/firmware/intel/stratix10-svc-client.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 /**
  * SVC_NUM_DATA_IN_FIFO - number of struct stratix10_svc_data in the FIFO
@@ -219,6 +222,7 @@ struct stratix10_async_chan {
  * @supported: Flag indicating whether the system supports async operations
  * @initialized: Flag indicating whether the control structure has
  *               been initialized
+ * @irq: Interrupt request number associated with the asynchronous control
  * @invoke_fn: Function pointer for invoking Stratix10 service calls
  *             to EL3 secure firmware
  * @async_id_pool: Pointer to the ID pool used for asynchronous
@@ -229,12 +233,14 @@ struct stratix10_async_chan {
  *                     structure
  * @trx_list_lock: Spinlock for protecting the transaction list
  *                     operations
+ * @async_work: Work structure for scheduling asynchronous work
  * @trx_list: Hash table for managing asynchronous transactions
  */
 
 struct stratix10_async_ctrl {
 	bool supported;
 	bool initialized;
+	int irq;
 	void (*invoke_fn)(struct stratix10_async_ctrl *actrl,
 			  const struct arm_smccc_1_2_regs *args,
 			  struct arm_smccc_1_2_regs *res);
@@ -243,6 +249,7 @@ struct stratix10_async_ctrl {
 	struct stratix10_async_chan *common_async_chan;
 	/* spinlock to protect trx_list hash table */
 	spinlock_t trx_list_lock;
+	struct work_struct async_work;
 	DECLARE_HASHTABLE(trx_list, ASYNC_TRX_HASH_BITS);
 };
 
@@ -1595,7 +1602,7 @@ int stratix10_svc_async_poll(struct stratix10_svc_chan *chan,
 		return -EAGAIN;
 	}
 
-	dev_err(ctrl->dev,
+	dev_dbg(ctrl->dev,
 		"Failed to poll async message ,got status as %ld\n",
 		handle->res.a0);
 	return -EINVAL;
@@ -1658,14 +1665,96 @@ static inline void stratix10_smc_1_2(struct stratix10_async_ctrl *actrl,
 	arm_smccc_1_2_smc(args, res);
 }
 
+static irqreturn_t stratix10_svc_async_irq_handler(int irq, void *dev_id)
+{
+	struct stratix10_svc_controller *ctrl = dev_id;
+	struct stratix10_async_ctrl *actrl = &ctrl->actrl;
+
+	/*
+	 * Only disable the IRQ when work is newly queued. If the work is
+	 * already pending/running, queue_work() returns false; an extra
+	 * disable_irq_nosync() would leave the IRQ disabled permanently
+	 * after enable_irq() in the work handler.
+	 */
+	if (queue_work(system_bh_wq, &actrl->async_work))
+		disable_irq_nosync(irq);
+	return IRQ_HANDLED;
+}
+
+/**
+ * stratix10_async_workqueue_handler - Handler for the asynchronous
+ * workqueue in Stratix10 service controller.
+ * @work: Pointer to the work structure that contains the asynchronous
+ *        workqueue handler.
+ *
+ * This function is the handler for the asynchronous workqueue. It performs
+ * the following tasks:
+ * - Invokes the asynchronous polling on interrupt supervisory call.
+ * - On success, it retrieves the bitmap of pending transactions from mailbox
+ *   fifo in ATF.
+ * - It processes each pending transaction by calling the corresponding
+ *   callback function.
+ *
+ * The function ensures that the IRQ is enabled after processing the
+ * transactions.
+ */
+static void stratix10_async_workqueue_handler(struct work_struct *work)
+{
+	struct stratix10_async_ctrl *actrl =
+		container_of(work, struct stratix10_async_ctrl, async_work);
+	struct arm_smccc_1_2_regs
+		args = { .a0 = INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ }, res;
+	DECLARE_BITMAP(pend_on_irq, TOTAL_TRANSACTION_IDS);
+	struct stratix10_svc_async_handler *handler;
+	unsigned long transaction_id = 0;
+	u64 bitmap_array[4];
+	async_callback_t cb;
+	void *cb_arg;
+
+	actrl->invoke_fn(actrl, &args, &res);
+	if (res.a0 == INTEL_SIP_SMC_STATUS_OK) {
+		bitmap_array[0] = res.a1;
+		bitmap_array[1] = res.a2;
+		bitmap_array[2] = res.a3;
+		bitmap_array[3] = res.a4;
+		bitmap_from_arr64(pend_on_irq, bitmap_array, TOTAL_TRANSACTION_IDS);
+		do {
+			transaction_id = find_next_bit(pend_on_irq,
+						       TOTAL_TRANSACTION_IDS,
+						       transaction_id);
+			if (transaction_id >= TOTAL_TRANSACTION_IDS)
+				break;
+
+			cb = NULL;
+			cb_arg = NULL;
+			spin_lock(&actrl->trx_list_lock);
+			hash_for_each_possible(actrl->trx_list, handler,
+					       next, transaction_id) {
+				if (handler->transaction_id == transaction_id) {
+					cb = handler->cb;
+					cb_arg = handler->cb_arg;
+					break;
+				}
+			}
+			spin_unlock(&actrl->trx_list_lock);
+			if (cb)
+				cb(cb_arg);
+
+			transaction_id++;
+		} while (transaction_id < TOTAL_TRANSACTION_IDS);
+	}
+	enable_irq(actrl->irq);
+}
+
 /**
  * stratix10_svc_async_init - Initialize the Stratix10 service
  *                            controller for asynchronous operations.
  * @controller: Pointer to the Stratix10 service controller structure.
  *
  * This function initializes the asynchronous service controller by
- * setting up the necessary data structures and initializing the
- * transaction list.
+ * setting up the necessary data structures ,initializing the
+ * transaction list and registering the IRQ handler for asynchronous
+ * transactions.
  *
  * Return: 0 on success, -EINVAL if the controller is NULL or already
  *         initialized, -ENOMEM if memory allocation fails,
@@ -1678,7 +1767,7 @@ static int stratix10_svc_async_init(struct stratix10_svc_controller *controller)
 	struct stratix10_async_ctrl *actrl;
 	struct arm_smccc_res res;
 	struct device *dev;
-	int ret;
+	int ret, irq;
 
 	if (!controller)
 		return -EINVAL;
@@ -1726,6 +1815,22 @@ static int stratix10_svc_async_init(struct stratix10_svc_controller *controller)
 	hash_init(actrl->trx_list);
 	atomic_set(&actrl->common_achan_refcount, 0);
 
+	irq = of_irq_get(dev_of_node(dev), 0);
+	if (irq <= 0) {
+		dev_warn(dev, "Failed to get IRQ, falling back to polling mode\n");
+	} else {
+		ret = devm_request_any_context_irq(dev, irq, stratix10_svc_async_irq_handler,
+						   IRQF_NO_AUTOEN, "stratix10_svc", controller);
+		if (ret == 0) {
+			dev_info(dev,
+				 "Registered IRQ %d for sip async operations\n",
+				 irq);
+			actrl->irq = irq;
+			INIT_WORK(&actrl->async_work, stratix10_async_workqueue_handler);
+			enable_irq(actrl->irq);
+		}
+	}
+
 	actrl->initialized = true;
 	return 0;
 }
@@ -1735,13 +1840,14 @@ static int stratix10_svc_async_init(struct stratix10_svc_controller *controller)
  *                            service controller
  * @ctrl: Pointer to the stratix10_svc_controller structure
  *
- * This function performs the necessary cleanup for the asynchronous
- * service controller. It checks if the controller is valid and if it
- * has been initialized. It then locks the transaction list and safely
- * removes and deallocates each handler in the list. The function also
- * removes any asynchronous clients associated with the controller's
- * channels and destroys the asynchronous ID pool. Finally, it resets
- * the asynchronous ID pool and invoke function pointers to NULL.
+ * This function performs the necessary cleanup for the asynchronous service
+ * controller. It checks if the controller is valid and if it has been
+ * initialized. Also If the controller has an IRQ assigned, it frees the IRQ
+ * and flushes any pending asynchronous work. It then locks the transaction
+ * list and safely removes and deallocates each handler in the list.
+ * The function also removes any asynchronous clients associated with the
+ * controller's channels and destroys the asynchronous ID pool. Finally, it
+ * resets the asynchronous ID pool and invoke function pointers to NULL.
  *
  * Return: 0 on success, -EINVAL if the controller is invalid or not
  *         initialized.
@@ -1763,6 +1869,13 @@ static int stratix10_svc_async_exit(struct stratix10_svc_controller *ctrl)
 
 	actrl->initialized = false;
 
+	if (actrl->irq > 0) {
+		disable_irq(actrl->irq);
+		flush_work(&actrl->async_work);
+		devm_free_irq(ctrl->dev, actrl->irq, ctrl);
+		actrl->irq = 0;
+	}
+
 	scoped_guard(spinlock_bh, &actrl->trx_list_lock) {
 		hash_for_each_safe(actrl->trx_list, i, tmp, handler, next) {
 			ida_free(&handler->achan->job_id_pool,
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index ce1d2c7203b8..355a74b2134d 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -718,6 +718,27 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_ASYNC_POLL \
 	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_POLL)
 
+/**
+ * Request INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ
+ * Async call used by service driver at EL1 to retrieve the transaction IDs
+ * of available responses from the SDM mailbox (typically after an IRQ).
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ
+ * a1-a17 not used
+ *
+ * Return status
+ * a0 INTEL_SIP_SMC_STATUS_OK
+ * a1-a4 contain a bitmap of pending transaction IDs (set bit positions)
+ * a5-a17 not used
+ * Or
+ * a0 INTEL_SIP_SMC_STATUS_NO_RESPONSE
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_IRQ_POLL (0xC9)
+#define INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_IRQ_POLL)
+
 /**
  * Request INTEL_SIP_SMC_ASYNC_HWMON_READTEMP
  * Async call to request temperature
-- 
2.43.7

