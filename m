Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012003.outbound.protection.outlook.com [40.107.200.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB332126C03;
	Mon, 22 Jun 2026 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136219; cv=fail; b=UseXS1wCK4Zf2Eq4rZz9jYawUjVjPT9DbUwGX+Y9IVB0yrzDDcm5JXMI66cwDtwubAlF4mS5KuZibB+aKBwEJUoezBvwywIioJ6esWBPd35bg4OMyvCJc3X0dnDeewbJaQCo4cxhBFwMF2HGX5EMH2MeeH4smF7Jm9bK53GYNzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136219; c=relaxed/simple;
	bh=a8DyrW9yZutr89ILHw7IcLFNVYAknybDP2g5O5q8Qug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aLAIc58cHxgaw4CqRjgguOaJPrLqLbqYkFPWJCb8yMzqKowlNihfcVTMgSLNGJkGANcgKeUU+Frh2HO32/eFNCU1ZyoYMrhWEyUeO4db26mqxuCvtTLDY9eOYJtJpPlf6X9gjAgSjMVaSMsf8/d+VjyoggCTOlW54h4qok8rre8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=soqbrP6D; arc=fail smtp.client-ip=40.107.200.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="soqbrP6D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3f2EfP4C5PUEtI5jBK3JkSXSr0GIUGqADxzTp27w1BBm4UR7R56/c6IXIMxfvdNjxC96BWDKfFyURKkmkpJ2LTmnqHyH/JwOXszNEUzpmWac/8KFspIDzgQvDfq1zH3Dn4AE62PZ8bOatI0so4yPlbJWrJduMo4Vv5LyG8T9tQKA0CCPQEEgbwTNniVk53ppTfz01dbDY4PtXAEiT9whun5QU30hCb/pFDJphlxzCtPrAIDwkjnPpEgnS7+pY0WjbxQ4bPMSfgJMDoNzwyKqy+QuNgucFsciX4Py7wHkUi7Sgo+4NwiEleItBWQ0oj33X5n++NhO/1EsAMR58XHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Yc8CbZfwMKw0tbhVf3buQjjxyebyeA/mWNUzx92+1A=;
 b=oTo+zIU3FV+vToTA+jUGmuyfDae9GjQrgj6e+kpRBQ82OsJ0JDi1/2xJ2X20cJlbws23n+/IjxSdgbH0sUhXp20W6icHei/rU0gNYt+AulYso2aXMsjQ3ephilu1P4KcYOP3St2jlmtVOS/h9YH+86Sk1XeEfusAUuO8L6Lnj1F9VYOoxtOjA+w4/x2bE6G4obv1bcGftmsG5912+7hVlVHgo20UwkwWdwckYokJMoautkgv1sNt3FgkTgwADHUny/ohhzAbo0saYlS+vYCJ2TYHwiICvOvTVvrwVWC9NhPTwZYuisd1SiQp89p9zhGPEJHikhnoo6vA1GdtT7mYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Yc8CbZfwMKw0tbhVf3buQjjxyebyeA/mWNUzx92+1A=;
 b=soqbrP6DpANGoO7pbUDAstFU6tP51yBL7YsszKla3DBo08L/0fvdHMnslzBnqaCIHAbWEB0ITp5drRZm5faqXZFUR3HFB4tUM/wle/octCnODsIqyknmPCf7Ou8Vyu7Uyxvz/oF3oyDurS6G458+oqlnVFHdzQFc/O0QosmsAq1hn9FdJNJsExoYlI17HPd0CqP7rK8IH6jlea5Lcz0FfpjBSVIwnga3IC3VOgMipI8Qwu9/p2YVvDG5++N8b/J6Hhn6JbijWlZECHlvajgZEBEndjqjgrzIKzpU7dNWIShWOJpG9XCT5hShWacBupH6INjRsCil5jcXC4KeoIU21w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH8PR03MB8225.namprd03.prod.outlook.com (2603:10b6:610:2c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 13:50:14 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:50:14 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 2/2] firmware: stratix10-svc: add support for agilex5
Date: Mon, 22 Jun 2026 21:44:46 +0800
Message-ID: <c096c728b7becf027b6e9fcc4aa1cc5dfe3cef3a.1782135785.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1782135785.git.adrian.ho.yin.ng@altera.com>
References: <cover.1782135785.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH8PR03MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f441bda-5a8d-47ee-4266-08ded0652fb3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|55112099003|6133799003|22082099003|18002099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	TglrJ4WlXEeWtd017xI8+M+zrDFVShmxlzWZTA9zdATT3amEF0ZzXGy36E7GLGfgkGpgZZJxxJSwevWGVDuuTl7gA47mFHsoI6UiPzFuWd4A1/ZlU+bSXOf61E8Dwt84Dt+IvilkDtRuuyisJMc/19GHUPLLU++UQVEJIDg007m6RVBxDsQDVv0K35QstcFlWi6cyipqMqe5jO+o/Qh/UWZrXZ+AKLUGZ9vYBLYCHnoDI/aMsfwdHYnoQHflbloDl7EoMAbZcr314dOjfxDYW1MMFVg8BUMZBtkT8YQp9zjwZbeBVUleBMqvP+tPj/RQeD7P2JHVkjITiLFBo8UhpDZmCkYhRVtMYAGVlD7tvIMjxdjOb0srsN5zSjP+hIFMChP/plDGFa4LmXnhYx/M17Vfcw3MkwbBaKQZ/P0bqZtcz75n1auyJOYXfiI6z0nXPg812oMwvKULYp59hVjaR2ah955XQX4+R9WdvzZt+kAGyukg6BmP/8c1tDkRekSG+37NwAonzAmgxC7XdkBudp9XSsjVWMJOZo9A9fE4umPPR8WDs4B7uLHrOeUA1pp2/GnAQIZ7DKD2h5N/V+cZXMS8hqmd1xNlbsmb6ZNNiDZFDbdZiq4p7YtyZAffdno/s/afPVe/GjFgYPfyEY6cGqWyWQPX+kBisM4by4qeY4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(55112099003)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fej6QypHzH3G5QEAoTvoo0uW0qhp0mmeECoBMC/4ajMrUkmSin0SvWCK8fXH?=
 =?us-ascii?Q?PY1nJ5oGpxyI5RBw5JRxOhmdVD9Y0VLIrz1p4jSayNOmGTRUAR8ajs/P1pva?=
 =?us-ascii?Q?fCMTF4AzOc/t99bCVfugU7PhVlhMPd9nJg/4HM9mi3Mp+AKCOC6R0QEQVCSC?=
 =?us-ascii?Q?01FaAjHE3riBvucdgMdgFfP37DTwQ253n4nkda8z6ffmLHIZzr/nXS3fv54P?=
 =?us-ascii?Q?bY+wQPG3DevaJqaHlpdNpkrLwNbSN+C4ZQH4/5tQdJfXwYvd8HdQUT0h425U?=
 =?us-ascii?Q?OZcZgKWY23vtkaCrzxfcst+wiEhXSo90HF9EhJf6HoEEri9zAhzf4DAym9Cs?=
 =?us-ascii?Q?Bap9URM5on09nL+d517hkL+SsKREM/EMIBHOrUtO18/HPzJLiZlqQBxuayKN?=
 =?us-ascii?Q?gP9p35VcnKo+BcB1+EatSTPWPg3syfpCN7F4anlGQu5Dd47tKQjM1bQhHDkq?=
 =?us-ascii?Q?tgJAoHRdr2+aD4bFKmRIga1cdlMseW8o5M4jp813zcUWSNL86fj7zV64IXfk?=
 =?us-ascii?Q?goliQYO94osvVyBZcRk7S0BPOG1tuf1vEEzs52K05TkKS5AMwLv6OYZJTFt1?=
 =?us-ascii?Q?wPeuH9LFUNVwsMSq0PugjhYo1K9W6/aloPQtLl/byKjvGyLc3LSw1wlSUDj4?=
 =?us-ascii?Q?MQJhwCcebSqAG/zMhZ2vGLxzRRJj7QLc/rZeHE8VzPCeOu/+ej3g13atOg1q?=
 =?us-ascii?Q?P2I88P34ceDbg69EFPPPuSQl40TBAVhUz9Okm4Xdc/zJWNPY+R6RlOg4WgTB?=
 =?us-ascii?Q?YipRzardBSf12io+/7csxg0IFzv3p6PPfc9aAjyQNGPdXdJa96gBAjaccK1a?=
 =?us-ascii?Q?pxswMlk9BwtPXF2bNc2HVGp/3HKkYnpJllKaj8kud44T/h6jocq8Ba2teKRr?=
 =?us-ascii?Q?PvXKywzAKuXMBBul5Jc6DoUUWix3wxQX0U6UtwVmqTzn3HBavIfmbUSodEuj?=
 =?us-ascii?Q?Zb3TT+HsSeBsImdc216Y6O1/9tRt1dlMQHWRBjCwWixKKkRzVcykASSKyzvI?=
 =?us-ascii?Q?K6zLoylYZLHbTq6qdSnlXesWKC5IpWCboB2nJ8g7sUYLpFd2paWkGEQVd3aX?=
 =?us-ascii?Q?L9BfEsjiWzBHUmzQDCabBUcCAwzfr66KnQF0iXm4uSpeiuzudtohL7a6vohQ?=
 =?us-ascii?Q?M4xA+Lg1rlIY3ogQxTViqJOodvrSeawiZ5HPLGbeY+CQNMu5xG2uE3rOuKQF?=
 =?us-ascii?Q?9H8bUmhumFL/JUW2fii+0Sm2SMifzPHmuXzXKENZF8T0/2lc5KCH7DJ8UjTn?=
 =?us-ascii?Q?CZ/MNOrdDFDasnXKTgBvfgLCHqxipsZ1LqhbojNsVeLPbdWDzqQak1RPA27e?=
 =?us-ascii?Q?3jMHINxToKRnPybvuPAmbmLaihDIvyF0qxWOyqV0nyyZku93c+l6bpNAf3kz?=
 =?us-ascii?Q?4EkIJM//LITxs6bNiTUThvJEJjaKXEtovfP0cYVu4ee9hTvKR6+tffk33+y4?=
 =?us-ascii?Q?Y6tv7Xlta7MQ4e14Jsc6f1fdZj/hYkAevH3pWY53I8GFGhQ5mk7fRSRfcFoE?=
 =?us-ascii?Q?TJNG82jkG77/+ouLKGTZoRFEZXTNT/9t/VWBbyfxdq02BbDw+qzp8b1W6q4Y?=
 =?us-ascii?Q?qTJQPmPak/zZReQJ0hFCWiB7BvQ8nr07j+QdY7/mPbenF7XH7j3tIBz6+G4N?=
 =?us-ascii?Q?CXjO8azkqmN4H94UcLiJHgFDbq7bQajXm0tZ+DpgyQD7hhPXc5XrCa0Dc01l?=
 =?us-ascii?Q?XYiryZ9+fumZd4pfxEMjzM5z1FnHmK6y0QzyLfuLyAjPqD2uoR89kS5BhCnW?=
 =?us-ascii?Q?tbDgeM6BjaQwj5fuKYblMmcJj46PK1M=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f441bda-5a8d-47ee-4266-08ded0652fb3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:50:14.6667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCOa8WpRHa5QOQDPn9YR7hxDOOppa8WJJPNCdyj5hHpe+NYdGS1UAGfLc3IngpBnyVG0zFKKde8J8nXNY1MdBBizHZ7ObesyAN38ZoP13bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8225

On Agilex5 the DDR base address starts at 0x8000_0000, which is
outside the addressable range of the SDM. The SMMU is used to remap
DDR-allocated buffers to an IOVA within the SDM-accessible 0-512MB
window. Return -ENODEV at probe if no IOMMU domain is found for an
intel,agilex5-svc device.

Configure a 29-bit DMA mask to constrain IOVA allocations to the
0-512MB range accessible to the SDM. Agilex5 REV B introduced a
hardware SDM address remapper; bypass it via SMC so no additional
offset is applied to the IOVA, keeping the implementation
consistent across all Agilex5 revisions.

ATF validates FPGA_CONFIG_WRITE addresses against the DDR range
starting at 0x8000_0000. Since IOVAs are below 0x2000_0000, the
driver adds 0x8000_0000 to the IOVA before the SMC call so ATF's
is_address_in_ddr_range() check passes. ATF then strips the offset
and uses the SMMU to translate the remaining IOVA to the underlying
physical memory for SDM access.

The firmware COMPLETED_WRITE response returns the raw IOVA without
the 0x8000_0000 offset. Compensate by storing dma_addr_offset in
the controller and adding it back before the svc_pa_to_va() lookup.
dma_addr_offset is zero on non-SMMU paths so existing platforms are
unaffected.

Fix a pre-existing bug in stratix10_svc_free_memory() where an
unknown-address fallthrough called list_del(&svc_data_mem),
corrupting the list head. Replace it with dev_warn().

Register a devm cleanup action at probe to reclaim any DMA
coherent buffers that service clients fail to free before driver
unbind, preventing memory leaks across probe/remove cycles.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c             | 258 +++++++++++++++----
 include/linux/firmware/intel/stratix10-smc.h |  23 ++
 2 files changed, 237 insertions(+), 44 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 00e134e663c8..4140cc488d96 100644
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
 
@@ -318,11 +355,12 @@ static void *svc_pa_to_va(unsigned long addr)
 
 	pr_debug("claim back P-addr=0x%016x\n", (unsigned int)addr);
 	guard(mutex)(&svc_mem_lock);
-	list_for_each_entry(pmem, &svc_data_mem, node)
+	list_for_each_entry(pmem, &svc_data_mem, node) {
 		if (pmem->paddr == addr)
 			return pmem->vaddr;
+	}
 
-	/* physical address is not found */
+	/* address is not found */
 	return NULL;
 }
 
@@ -356,11 +394,17 @@ static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
 				break;
 			}
 			cb_data->status = BIT(SVC_STATUS_BUFFER_DONE);
-			cb_data->kaddr1 = svc_pa_to_va(res.a1);
+			/*
+			 * The firmware COMPLETED_WRITE response returns the
+			 * raw IOVA (without dma_addr_offset). Add it back to
+			 * match the key stored in pmem->paddr at allocation
+			 * time. dma_addr_offset is zero on non-SMMU paths.
+			 */
+			cb_data->kaddr1 = svc_pa_to_va(res.a1 + ctrl->dma_addr_offset);
 			cb_data->kaddr2 = (res.a2) ?
-					  svc_pa_to_va(res.a2) : NULL;
+					  svc_pa_to_va(res.a2 + ctrl->dma_addr_offset) : NULL;
 			cb_data->kaddr3 = (res.a3) ?
-					  svc_pa_to_va(res.a3) : NULL;
+					  svc_pa_to_va(res.a3 + ctrl->dma_addr_offset) : NULL;
 			p_data->chan->scl->receive_cb(p_data->chan->scl,
 						      cb_data);
 		} else {
@@ -981,6 +1025,38 @@ svc_create_memory_pool(struct platform_device *pdev,
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
@@ -1842,32 +1918,52 @@ EXPORT_SYMBOL_GPL(stratix10_svc_done);
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
 
-	memset((void *)va, 0, s);
-	pa = gen_pool_virt_to_phys(genpool, va);
+		pmem->vaddr    = va;
+		pmem->paddr    = dma_addr + ctrl->dma_addr_offset;
+		pmem->dma_addr = dma_addr;
+		pmem->size     = size;
+	} else {
+		genpool = ctrl->genpool;
+		s = roundup(size, 1 << genpool->min_alloc_order);
+
+		pmem = devm_kzalloc(ctrl->dev, sizeof(*pmem), GFP_KERNEL);
+		if (!pmem)
+			return ERR_PTR(-ENOMEM);
+
+		va = (void *)gen_pool_alloc(genpool, s);
+		if (!va)
+			return ERR_PTR(-ENOMEM);
+
+		memset(va, 0, s);
+		pmem->vaddr = va;
+		pmem->paddr = gen_pool_virt_to_phys(genpool, (unsigned long)va);
+		pmem->size  = s;
+	}
 
-	pmem->vaddr = (void *)va;
-	pmem->paddr = pa;
-	pmem->size = s;
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
 
@@ -1880,25 +1976,37 @@ EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
  */
 void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 {
+	struct stratix10_svc_controller *ctrl = chan->ctrl;
 	struct stratix10_svc_data_mem *pmem;
+
 	guard(mutex)(&svc_mem_lock);
 
-	list_for_each_entry(pmem, &svc_data_mem, node)
-		if (pmem->vaddr == kaddr) {
-			gen_pool_free(chan->ctrl->genpool,
-				       (unsigned long)kaddr, pmem->size);
+	list_for_each_entry(pmem, &svc_data_mem, node) {
+		if (pmem->vaddr != kaddr)
+			continue;
+
+		if (ctrl->use_dma_mem) {
+			dma_free_coherent(ctrl->dev, pmem->size,
+					  pmem->vaddr, pmem->dma_addr);
+			list_del(&pmem->node);
+			kfree(pmem);
+		} else {
+			gen_pool_free(ctrl->genpool,
+				      (unsigned long)kaddr, pmem->size);
 			pmem->vaddr = NULL;
 			list_del(&pmem->node);
-			return;
 		}
+		return;
+	}
 
-	list_del(&svc_data_mem);
+	dev_warn(ctrl->dev, "free of unknown buffer %p\n", kaddr);
 }
 EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
 
 static const struct of_device_id stratix10_svc_drv_match[] = {
 	{.compatible = "intel,stratix10-svc"},
 	{.compatible = "intel,agilex-svc"},
+	{.compatible = "intel,agilex5-svc"},
 	{},
 };
 
@@ -1909,13 +2017,39 @@ static const char * const chan_names[SVC_NUM_CHANNEL] = {
 	SVC_CLIENT_HWMON
 };
 
+static void svc_data_mem_cleanup(void *data)
+{
+	struct stratix10_svc_controller *ctrl = data;
+	struct stratix10_svc_data_mem *pmem, *tmp;
+
+	guard(mutex)(&svc_mem_lock);
+
+	list_for_each_entry_safe(pmem, tmp, &svc_data_mem, node) {
+		dev_warn(ctrl->dev, "leaked svc buffer %p, freeing on unbind\n",
+			 pmem->vaddr);
+		if (ctrl->use_dma_mem) {
+			dma_free_coherent(ctrl->dev, pmem->size,
+					  pmem->vaddr, pmem->dma_addr);
+			list_del(&pmem->node);
+			kfree(pmem);
+		} else {
+			gen_pool_free(ctrl->genpool,
+				      (unsigned long)pmem->vaddr, pmem->size);
+			pmem->vaddr = NULL;
+			list_del(&pmem->node);
+		}
+	}
+}
+
 static int stratix10_svc_drv_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stratix10_svc_controller *controller;
-	struct gen_pool *genpool;
+	struct gen_pool *genpool = NULL;
 	struct stratix10_svc_sh_memory *sh_memory;
 	struct stratix10_svc *svc = NULL;
+	struct arm_smccc_res res;
+	bool use_dma_mem = false;
 
 	svc_invoke_fn *invoke_fn;
 	size_t fifo_size;
@@ -1926,18 +2060,47 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(invoke_fn))
 		return -EINVAL;
 
-	sh_memory = devm_kzalloc(dev, sizeof(*sh_memory), GFP_KERNEL);
-	if (!sh_memory)
-		return -ENOMEM;
+	/*
+	 * Agilex5-specific setup: SMMU is required as the base address of the DDR memory for Agilex5 starts from
+	 * 0x8000_0000 which is out of the addressible range of the SDM. SMMU is enabled to allow memory allocated
+	 * within the DDR to be remapped to the accessible address range of the SDM. An address remapper is implemented
+	 * in Agilex5 REV B, the SDM address remapper must be bypassed so there is no additional offset applied to the
+	 * IOVA to keep implementation consistent across all Agilex5 revisions.
+	 */
+	if (of_device_is_compatible(dev->of_node, "intel,agilex5-svc")) {
+		if (!iommu_get_domain_for_dev(dev)) {
+			dev_err(dev,
+				"SMMU is required for agilex5-svc but no IOMMU domain found\n");
+			dev_err(dev,
+				"Ensure the SMMU node is enabled in the device tree and 'iommus' is set for this node\n");
+			return -ENODEV;
+		}
 
-	sh_memory->invoke_fn = invoke_fn;
-	ret = svc_get_sh_memory(pdev, sh_memory);
-	if (ret)
-		return ret;
+		use_dma_mem = true;
 
-	genpool = svc_create_memory_pool(pdev, sh_memory);
-	if (IS_ERR(genpool))
-		return PTR_ERR(genpool);
+		invoke_fn(INTEL_SIP_SMC_SDM_REMAPPER_CONFIG,
+			  INTEL_SIP_SMC_SDM_REMAPPER_BYPASS,
+			  0, 0, 0, 0, 0, 0, &res);
+	}
+
+	if (use_dma_mem) {
+		ret = svc_setup_dma_memory(pdev);
+		if (ret)
+			return ret;
+	} else {
+		sh_memory = devm_kzalloc(dev, sizeof(*sh_memory), GFP_KERNEL);
+		if (!sh_memory)
+			return -ENOMEM;
+
+		sh_memory->invoke_fn = invoke_fn;
+		ret = svc_get_sh_memory(pdev, sh_memory);
+		if (ret)
+			return ret;
+
+		genpool = svc_create_memory_pool(pdev, sh_memory);
+		if (IS_ERR(genpool))
+			return PTR_ERR(genpool);
+	}
 
 	/* allocate service controller and supporting channel */
 	controller = devm_kzalloc(dev, struct_size(controller, chans, SVC_NUM_CHANNEL),
@@ -1952,9 +2115,15 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	controller->num_active_client = 0;
 	controller->genpool = genpool;
 	controller->invoke_fn = invoke_fn;
+	controller->use_dma_mem = use_dma_mem;
+	controller->dma_addr_offset = use_dma_mem ? SVC_SDM_DMA_ADDR_OFFSET : 0;
 	INIT_LIST_HEAD(&controller->node);
 	init_completion(&controller->complete_status);
 
+	ret = devm_add_action_or_reset(dev, svc_data_mem_cleanup, controller);
+	if (ret)
+		goto err_destroy_pool;
+
 	ret = stratix10_svc_async_init(controller);
 	if (ret) {
 		dev_dbg(dev, "Intel Service Layer Driver: Error on stratix10_svc_async_init %d\n",
@@ -2022,7 +2191,8 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 		kfifo_free(&controller->chans[i].svc_fifo);
 	stratix10_svc_async_exit(controller);
 err_destroy_pool:
-	gen_pool_destroy(genpool);
+	if (genpool)
+		gen_pool_destroy(genpool);
 
 	return ret;
 }
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index 9116512169dc..daa693699c97 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -746,4 +746,27 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_ASYNC_FUNC_ID_RSU_NOTIFY (0xEC)
 #define INTEL_SIP_SMC_ASYNC_RSU_NOTIFY \
 	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_RSU_NOTIFY)
+
+/**
+ * Request INTEL_SIP_SMC_SDM_REMAPPER_CONFIG
+ *
+ * Sync call to configure the SDM address remapper. On Agilex5, the remapper
+ * must be bypassed when the SMMU is active to avoid conflicts with IOMMU
+ * address translation.
+ *
+ * Call register usage:
+ * a0: INTEL_SIP_SMC_SDM_REMAPPER_CONFIG
+ * a1: INTEL_SIP_SMC_SDM_REMAPPER_ENABLE or INTEL_SIP_SMC_SDM_REMAPPER_BYPASS
+ * a2-7: not used
+ *
+ * Return status:
+ * a0: INTEL_SIP_SMC_STATUS_OK
+ * a1-3: not used
+ */
+#define INTEL_SIP_SMC_FUNCID_SDM_REMAPPER_CONFIG	513
+#define INTEL_SIP_SMC_SDM_REMAPPER_CONFIG \
+	INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_SDM_REMAPPER_CONFIG)
+#define INTEL_SIP_SMC_SDM_REMAPPER_ENABLE		0
+#define INTEL_SIP_SMC_SDM_REMAPPER_BYPASS		1
+
 #endif
-- 
2.49.GIT

