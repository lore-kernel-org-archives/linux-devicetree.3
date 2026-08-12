Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013032.outbound.protection.outlook.com [40.93.196.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C123955DC;
	Wed, 12 Aug 2026 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521451; cv=fail; b=gghaCGjENTQu/UV4tDtPTDhZedh0W7rVqqKpxlsdl3Wd6SGBtyvbcbxcBNCYMAdE1aHsWOetA/56k7irMT6O3f9SjmdpfJ6XwL20WiwhZ7SsIGxpDGKRM1xvkL1cb15sQWAw8CIWuH5EX1OxNQXUnd+ajDfMRTXKXNJKOlO/5xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521451; c=relaxed/simple;
	bh=2ms6It0TGUAWmau4f+oZ0emLPE4tSXTQKH95KtwVSRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lau6THXL5WcHmDtTM+V6BtxKvj0sZo4QZYtKgNh6cIZGWOTbkw4ZeLyzTtu/i28wi5X5SGqG2deuPDkwmfzJdqvC6SSTirr7EdTO2LJtw6J82Vtd7pacwcAUI/oPDNWlqyMibtAVC8x38eg1LFy4UYmQCfJaLT45FWfgZJCRcC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Adp3MpqG; arc=fail smtp.client-ip=40.93.196.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Adp3MpqG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=go4wKyJFsYtPbe2PDU9/hnb9KjMlhYMuFrVt8HDX2obZbGkIQ3Q/SwBJtRR3TIDmhn3MxEX1JvZ7kTvqcJm0V88dJZpKUcNWp7KJazFHdFrU8Mj8J4zxZov71KV3N6Nv/lUhGRrOVMQlUnfJDL+WRooWVvFCnbiAG8qtf+TvGqZXxkyMQTwJa2P9UoT8tz2seLJkotbI6w0ZKq64cgOLiBi5zbmCZZGbGsXpOAbi3qkCWaHJMNy+hURtNezFsG3z9elMt8WPbGtzIOtBfg5QibJ/JmBy36GD01U9nym4y9m1gZ7qAPkxUDDIUqoi4hyJBQtLbovWz7lLctqlfz2rWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqlgYW7sE3Np6C9ps+EdUm7emTu2ZSiUz7WkKZQCXpQ=;
 b=dP0iuU1nTGCJFrng3UPRXvyoZQzYh9T13A/PnCTR6Wf0HoBLFN7CW1yIEul6DefAsidrndZPEuWeVImxh2XdAYM0EMnVANRZSCHQ/ddq4hwZqS9UWONLOEncLOaIVfLndZ1AogTv83BhiXgJDATrimt2DamhH/6d6yjSyikBbkHNDk0itpQ34B3OIhP791jYTYNLMGGkXKHrbDh/vJQERbgirzYa1SPUFa4lpOE3cT8KJE7btkV9DgWNmE2dujs5tqeU+aTVTA+R9nONILxzkM9l0DB6aegaD/XR4MMuoNeUohcSiTKlpmJZQy7ZbTxUamlSedRE9ri4P2xicTannw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqlgYW7sE3Np6C9ps+EdUm7emTu2ZSiUz7WkKZQCXpQ=;
 b=Adp3MpqGx3ZUeatIOnmc8tMcMP+WkRPfizWqkW4CvT/Y+1GAFwUXi6Le1V+jTtRmxv5+MIIWU9W4UEHMD8fXSkCzZ4P35IoHT65fQHvBXc9tcROv29kZ9tOErriLTUlax0paon59mpnwk/5bg76Q3lVIZx6V2fISqcyVhSqx+FEC5aavLjZGj1S6gmapS7Mc8yXKZRztuVxhQoJhK4C8RUph6vFtzhGSCeLKfFNAEkh7R9EaJAuDvtHr9nZ4jlZ81xYjpNv0Kp/UM3W5x7zxKMFzOwdsyRG6G9mZCtT36OVBBktlItBzsKEbdf/SSXfevOr/8InPOungIz2y1yvxtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DS7PR03MB5606.namprd03.prod.outlook.com (2603:10b6:5:2c2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Wed, 12 Aug 2026 07:57:23 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:57:23 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 RESEND v2 4/5] firmware: stratix10-svc: add DMA coherent memory allocation for SMMU-enabled platforms
Date: Wed, 12 Aug 2026 15:50:30 +0800
Message-ID: <dbae58b2d4f7cd4203be8b2ae3f340a71965b660.1786520346.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1786520346.git.adrian.ho.yin.ng@altera.com>
References: <cover.1786520346.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DS7PR03MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f07554-cf21-4df0-e3ad-08def84757d4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|22082099003|18002099003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	quuAp3JQKsskHMUpdMQSrEZwM42LonhkvfS1VWav9YxjNvg60+nv36+lnzrxF66xS6n7r2i1AMAzSF1+VUq/a2L2TuSvsBSiynKWohYVMTFNWcJurY2+4EWmqVDgKTdrcbqK1JEaSyU35rJqpIbFGZvX3+qcZcPrbnI5AsNDxuc+zB9YF/yR1TQn4987BttTQY74JkfVHubahzHzay+TF5Q/OVFe5gdnmLL4p5uqXkgQ7xwiqrptDl0nauMx3yhRyY5roXpl0Ba4iuj9jDnermvsxOw3KC4aSqA6+3sUv6bDi+boYYHZBm83KeED8bAlGjP+SrygwJAUnHfIFpB9Zo0yNaMoF5UQ+oCSiPj00pbr/ygPRl3nODPaftwQ8T4HsReJHCXdVZh6zqJ9Gd0aLLYKChluYFQtvG/kbyWec9O2xo6P251FBPD+dRKBrUc2DBmd4o7ADFDzBfMxMYFbZOFtjUnH6jXynLwq6EhJ8Usjco90LhlrlYJsc92grMHbusvuACvxPhiOaxkmR0TfWcWoRC9Zq37sokteH50qTD7PFkIPcLv+teUsxj5YgQ82rP9NWyoZ8ILBA45xR9AHIFXcoA6SJ/Ldo6J3gh/PXVWOMXWCIKx74Jq9TjG+9+odqFA+yC1lwLnima+ycJnM1LMP4CZUSycSlgpcI74uVUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n+EZMxw/ct717nA1aKS1jlGeEhYTGkgSZnlwIMPiqrCFzoUOzAhOvOpo27yV?=
 =?us-ascii?Q?5XfoP57IrNInHb8RIVrfYDvshxQWZ5VGHyuWEBd6jHmvaeoIm3grp3F66Hzr?=
 =?us-ascii?Q?sGbkAFRv84EFBGMCaIElwtZNGx4WF2U8okmnOfp3sMEXeGI3E+Za6pJr52k6?=
 =?us-ascii?Q?h+Jq0uqdh60XTxqJ0IFXzSZkrDlWprHKonE+z2QalxXFvA81/dPcZ9RgEPkW?=
 =?us-ascii?Q?OcK8dt6x1qi9DcTkk3XBmZsQeMnB7INhuaPfAZYDAz368cl3SOg40QSRf5qT?=
 =?us-ascii?Q?YJoUXgUrlgYH8+IZWg3BwqqKFaacbgOQJiCdc8tpgxHGE0jNhmIaBbUS9PVF?=
 =?us-ascii?Q?kSTn1egduv5yaBucQOMhkoNclHR+v3snDdNFddlmEwfR5BlO42NMLVZd7E6R?=
 =?us-ascii?Q?esJUuRP8T5MVpN6iwf01aJakRYFAwxYCWAZlt5cE7uZ5lYbq06ZJpiaNJI1D?=
 =?us-ascii?Q?ja2GQXt9+IaQcHLyvVzqw2ITP/ufs1ZhCGoGZ4rtWoWVHKG0Y/wTxlabK2Ms?=
 =?us-ascii?Q?eETaQf6RaRz8ZMh+cZtXIrpb/ihIuZDqXU/gTqZ+YGyVpe1KRltED8kNe8iZ?=
 =?us-ascii?Q?6fVR+ZLrPIpvvcgNJ0JWBWg5pFMsfa15OFXkVLcQb16FdHCFWN/cyh8z8lMH?=
 =?us-ascii?Q?yHVmM62P3Sbv62xKJ+KUNacy2vkBluFSu4wR0454X4rUNGAcSzVw9x1PvTSj?=
 =?us-ascii?Q?0KmGLJjfPXNXiCSTrfqsGCaSh8ZbmMgFmLhjsRyR+xdsCsWpBVU4zK1ypRG1?=
 =?us-ascii?Q?v0QE7il/7W/e+e7z+tMksaFswFV52SOPlE9m0iRiykpq/VicMW4KZgA7Sqos?=
 =?us-ascii?Q?2muwXuOYPsXTvlFatqm59Jtv3BkENJpvF2MpQzIK5yMjl2DqgFz3QIVLRqpt?=
 =?us-ascii?Q?wmL2Zpq1SJHT9qEHmwh2pBnBpjI2dnmYlnvkX1fP1YaqMC9Fg+Ypsm0jSWlG?=
 =?us-ascii?Q?ZSXy+JmXMDmvENDDmfKvx4g/CgEYWbc9WUGPxpWXSNue/22AJmm1AV4+zvt+?=
 =?us-ascii?Q?v16RlFq5nxOT2+cllgHJ5XgMbT3ZO7BDYubwwhhdp4BPRF9GiEgiapoKqyCa?=
 =?us-ascii?Q?Em+df93CNvxpFVXWUNLabvM3nEd0KJoWnlGTtlA7ZHDvB4ze9QjkNoRV//SM?=
 =?us-ascii?Q?e3h5GhIR/rwsU8H23jLDqj6h9UGg83yKx2N+fe4iQycKndERzm5j4N+Nk698?=
 =?us-ascii?Q?RcYIu9DYzvFw2HXowNamw+jr8yhyWIs1k/nz966hsXTLHRYk6EpVM/VQ5LG3?=
 =?us-ascii?Q?A88ekcLNROJsaLqH0QKGp64Alzj3iuKAcov9qKIUB3VUqxFmPWqfpT1Ye1Z/?=
 =?us-ascii?Q?2fF9tXQUBeVQPA9VO3tIjmD4MHMVPPaEfMCeiR4pIDbr/q7fcVwzPS1zEZ/0?=
 =?us-ascii?Q?MaoZ1FEsgDSRGhuk0UXUP6kFR4Rrjz1Nsek3I/hqXrtOidDjdKqxvUb/qsz4?=
 =?us-ascii?Q?gXePg7WphEgWGQSPWF4YGNvyM+gUdsDpvNAuy5rLBeZbD8tNHazMD4CJbUnj?=
 =?us-ascii?Q?kZLmublfCWil0IziQJfgTW9gpurhUcNT1d1K3zrJF5HntGtCdoEQThQsVPCo?=
 =?us-ascii?Q?QRqPqpeAW6QLN76wIpEeSdlwlaHhNvRhCAm0aDoN8p3V18erXaNOAP7/My8G?=
 =?us-ascii?Q?k+LJsnFldvzZoYOW3ps/GfRrNHlXYDxtE9US1D49SFjZ61Y+AKnt0Ad0zK/k?=
 =?us-ascii?Q?TTPAmUWXasKrs6aKP8gq2SgmIwmutc0bQZlBNOeFDIEsj2hZAHOaNpac1GUZ?=
 =?us-ascii?Q?KGLBxGIXtuWqTJUJ29eTMP8aSMN2++Q=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f07554-cf21-4df0-e3ad-08def84757d4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:57:23.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ElvSHGlyLnjtQ/r9sHU8KT0Re36BPmYb2wpTzBtJzpoFGmMN128q7Dc8V1CHBrme7YFPt+v/8V4zaSj1sl3ufNke19QJwmJDFslhTc45Go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606

On Agilex5, DDR starts at 0x8000_0000 which is outside the SDM's
addressable range. When SMMU is active, the driver must allocate
DMA-coherent buffers and pass IOVAs (not physical addresses) to ATF.

Add SVC_SDM_DMA_ADDR_BITS (29) and SVC_SDM_DMA_ADDR_OFFSET
(0x8000_0000) to constrain IOVAs to the 0-512 MB window the SDM can
reach and to satisfy ATF's address range check respectively.

Extend struct stratix10_svc_data_mem with dma_addr to hold the raw
IOVA for teardown, and struct stratix10_svc_controller with use_dma_mem
and dma_addr_offset to select the DMA path at runtime.

Add svc_setup_dma_memory() to set the 29-bit DMA mask. Update
stratix10_svc_allocate_memory() and stratix10_svc_free_memory() with a
dma_alloc_coherent()/dma_free_coherent() branch, and adjust
svc_thread_cmd_data_claim() to reapply dma_addr_offset when resolving
ATF completion addresses back to virtual addresses.

Both new controller fields default to zero so existing gen_pool
platforms are unaffected.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c | 164 +++++++++++++++++++++++++------
 1 file changed, 133 insertions(+), 31 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 20ab90a4584f..4a2071d57399 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -7,7 +7,9 @@
 #include <linux/atomic.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/genalloc.h>
+#include <linux/iommu.h>
 #include <linux/hashtable.h>
 #include <linux/idr.h>
 #include <linux/io.h>
@@ -43,6 +45,23 @@
 #define FPGA_CONFIG_STATUS_TIMEOUT_SEC		30
 #define BYTE_TO_WORD_SIZE              4
 
+/*
+ * SVC_SDM_DMA_ADDR_BITS - constrains the IOVA allocated by
+ * dma_alloc_coherent() to 29 bits (0x0000_0000 - 0x1FFF_FFFF)
+ * when SMMU is active on Agilex5. The SDM accesses these buffers
+ * via the SMMU using IOVAs, so the 29-bit limit keeps IOVAs within
+ * the SDM's addressable window.
+ *
+ * SVC_SDM_DMA_ADDR_OFFSET - ATF on Agilex5 distinguishes
+ * SMMU-mapped buffers from direct physical addresses by the
+ * presence of this offset. The driver adds it to the IOVA before
+ * passing the address to ATF via SMC; ATF strips it, translates
+ * the remaining IOVA through the SMMU, and the SDM accesses the
+ * underlying physical memory.
+ */
+#define SVC_SDM_DMA_ADDR_BITS			29
+#define SVC_SDM_DMA_ADDR_OFFSET			0x80000000UL
+
 /* stratix10 service layer clients */
 #define STRATIX10_RSU				"stratix10-rsu"
 
@@ -133,18 +152,25 @@ struct stratix10_svc_sh_memory {
 /**
  * struct stratix10_svc_data_mem - service memory structure
  * @vaddr: virtual address
- * @paddr: physical address
+ * @paddr: address passed to ATF via SMC and echoed back in completion
+ *         notifications; used as the lookup key in svc_pa_to_va().
+ *         On the SMMU path this is (IOVA + %SVC_SDM_DMA_ADDR_OFFSET);
+ *         on the gen_pool path this equals the raw physical address.
  * @size: size of memory
+ * @dma_addr: IOVA returned by dma_alloc_coherent(); used to free the
+ *            mapping via dma_free_coherent() on the SMMU path.
  * @node: link list head node
  *
  * This struct is used in a list that keeps track of buffers which have
  * been allocated or freed from the memory pool. Service layer driver also
- * uses this struct to transfer physical address to virtual address.
+ * uses this struct to map the address returned by ATF back to a virtual
+ * address.
  */
 struct stratix10_svc_data_mem {
 	void *vaddr;
 	phys_addr_t paddr;
 	size_t size;
+	dma_addr_t dma_addr;
 	struct list_head node;
 };
 
@@ -277,6 +303,15 @@ struct stratix10_svc_chan {
  * @svc: manages the list of client svc drivers
  * @sdm_lock: only allows a single command single response to SDM
  * @actrl: async control structure
+ * @use_dma_mem: when true, buffers are allocated via dma_alloc_coherent()
+ *               instead of the ATF reserved-memory gen_pool.
+ * @dma_addr_offset: value added to the DMA address (IOVA) before passing it
+ *                   to ATF via SMC. ATF uses this offset to distinguish
+ *                   SMMU-mapped buffers from direct physical addresses; it
+ *                   strips the offset, translates the remaining IOVA through
+ *                   the SMMU, and the SDM accesses the underlying memory.
+ *                   Set to %SVC_SDM_DMA_ADDR_OFFSET on Agilex5 when SMMU is
+ *                   active; zero otherwise.
  * @chans: array of service channels
  *
  * This struct is used to create communication channels for service clients, to
@@ -293,6 +328,8 @@ struct stratix10_svc_controller {
 	struct stratix10_svc *svc;
 	struct mutex sdm_lock;
 	struct stratix10_async_ctrl actrl;
+	bool use_dma_mem;
+	unsigned long dma_addr_offset;
 	struct stratix10_svc_chan chans[] __counted_by(num_chans);
 };
 
@@ -356,12 +393,18 @@ static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
 				complete(&ctrl->complete_status);
 				break;
 			}
-			cb_data->status = BIT(SVC_STATUS_BUFFER_DONE);
-			cb_data->kaddr1 = svc_pa_to_va(res.a1);
-			cb_data->kaddr2 = (res.a2) ?
-					  svc_pa_to_va(res.a2) : NULL;
-			cb_data->kaddr3 = (res.a3) ?
-					  svc_pa_to_va(res.a3) : NULL;
+		cb_data->status = BIT(SVC_STATUS_BUFFER_DONE);
+		/*
+		 * The firmware COMPLETED_WRITE response returns the
+		 * raw IOVA (without dma_addr_offset). Add it back to
+		 * match the key stored in pmem->paddr at allocation
+		 * time. dma_addr_offset is zero on non-SMMU paths.
+		 */
+		cb_data->kaddr1 = svc_pa_to_va(res.a1 + ctrl->dma_addr_offset);
+		cb_data->kaddr2 = (res.a2) ?
+				  svc_pa_to_va(res.a2 + ctrl->dma_addr_offset) : NULL;
+		cb_data->kaddr3 = (res.a3) ?
+				  svc_pa_to_va(res.a3 + ctrl->dma_addr_offset) : NULL;
 			p_data->chan->scl->receive_cb(p_data->chan->scl,
 						      cb_data);
 		} else {
@@ -982,6 +1025,38 @@ svc_create_memory_pool(struct platform_device *pdev,
 	return genpool;
 }
 
+/**
+ * svc_setup_dma_memory() - configure the device for dynamic DMA allocation
+ * @pdev: pointer to service layer device
+ *
+ * Called instead of svc_get_sh_memory() + svc_create_memory_pool() when
+ * the device is behind an SMMU. Sets a 29-bit coherent DMA mask so that
+ * every subsequent dma_alloc_coherent() call yields an IOVA within the
+ * first 512MB (0x0000_0000 - 0x1FFF_FFFF). The driver then adds
+ * %SVC_SDM_DMA_ADDR_OFFSET to the IOVA before passing it to ATF; ATF
+ * strips the offset and uses the SMMU to translate the IOVA to the
+ * underlying physical memory for SDM access.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int svc_setup_dma_memory(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(SVC_SDM_DMA_ADDR_BITS));
+	if (ret) {
+		dev_err(dev,
+			"failed to set %u-bit DMA mask: %d\n",
+			SVC_SDM_DMA_ADDR_BITS, ret);
+		return ret;
+	}
+
+	dev_info(dev,
+		 "SMMU enabled: using dynamic DMA allocation (IOVA range 0-512MB)\n");
+	return 0;
+}
+
 /**
  * svc_smccc_smc() - secure monitor call between normal and secure world
  * @a0: argument passed in registers 0
@@ -1843,32 +1918,52 @@ EXPORT_SYMBOL_GPL(stratix10_svc_done);
 void *stratix10_svc_allocate_memory(struct stratix10_svc_chan *chan,
 				    size_t size)
 {
+	struct stratix10_svc_controller *ctrl = chan->ctrl;
 	struct stratix10_svc_data_mem *pmem;
-	unsigned long va;
-	phys_addr_t pa;
-	struct gen_pool *genpool = chan->ctrl->genpool;
-	size_t s = roundup(size, 1 << genpool->min_alloc_order);
+	struct gen_pool *genpool;
+	dma_addr_t dma_addr;
+	size_t s;
+	void *va;
 
-	pmem = devm_kzalloc(chan->ctrl->dev, sizeof(*pmem), GFP_KERNEL);
-	if (!pmem)
-		return ERR_PTR(-ENOMEM);
+	if (ctrl->use_dma_mem) {
+		pmem = kzalloc_obj(*pmem, GFP_KERNEL);
+		if (!pmem)
+			return ERR_PTR(-ENOMEM);
 
-	guard(mutex)(&svc_mem_lock);
-	va = gen_pool_alloc(genpool, s);
-	if (!va)
-		return ERR_PTR(-ENOMEM);
+		va = dma_alloc_coherent(ctrl->dev, size, &dma_addr, GFP_KERNEL);
+		if (!va) {
+			kfree(pmem);
+			return ERR_PTR(-ENOMEM);
+		}
+
+		pmem->vaddr    = va;
+		pmem->paddr    = dma_addr + ctrl->dma_addr_offset;
+		pmem->dma_addr = dma_addr;
+		pmem->size     = size;
+	} else {
+		genpool = ctrl->genpool;
+		s = roundup(size, 1 << genpool->min_alloc_order);
 
-	memset((void *)va, 0, s);
-	pa = gen_pool_virt_to_phys(genpool, va);
+		pmem = devm_kzalloc(ctrl->dev, sizeof(*pmem), GFP_KERNEL);
+		if (!pmem)
+			return ERR_PTR(-ENOMEM);
 
-	pmem->vaddr = (void *)va;
-	pmem->paddr = pa;
-	pmem->size = s;
+		va = (void *)gen_pool_alloc(genpool, s);
+		if (!va)
+			return ERR_PTR(-ENOMEM);
+
+		memset(va, 0, s);
+		pmem->vaddr = va;
+		pmem->paddr = gen_pool_virt_to_phys(genpool, (unsigned long)va);
+		pmem->size  = s;
+	}
+
+	guard(mutex)(&svc_mem_lock);
 	list_add_tail(&pmem->node, &svc_data_mem);
-	pr_debug("%s: %s: va=%p, pa=0x%016x\n", __func__,
-		 chan->name, pmem->vaddr, (unsigned int)pmem->paddr);
+	pr_debug("%s: %s: va=%p, addr=0x%016llx\n", __func__,
+		 chan->name, pmem->vaddr, (unsigned long long)pmem->paddr);
 
-	return (void *)va;
+	return va;
 }
 EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
 
@@ -1890,10 +1985,17 @@ void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 		if (pmem->vaddr != kaddr)
 			continue;
 
-		gen_pool_free(chan->ctrl->genpool,
-			      (unsigned long)kaddr, pmem->size);
-		pmem->vaddr = NULL;
-		list_del(&pmem->node);
+		if (ctrl->use_dma_mem) {
+			dma_free_coherent(ctrl->dev, pmem->size,
+					  pmem->vaddr, pmem->dma_addr);
+			list_del(&pmem->node);
+			kfree(pmem);
+		} else {
+			gen_pool_free(ctrl->genpool,
+				      (unsigned long)kaddr, pmem->size);
+			pmem->vaddr = NULL;
+			list_del(&pmem->node);
+		}
 		return;
 	}
 
-- 
2.49.GIT

