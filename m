Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013032.outbound.protection.outlook.com [40.93.196.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BBB3AFCE2;
	Wed, 12 Aug 2026 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521449; cv=fail; b=uEMTI3NhGDzrxfGR4J6puzNmE5TwrOEigaxIhCiY+zCMlVFVWbDZ0hLlSYwOFCFhRPW/JpMahbKb/W2Lsxzej1UnraOXq5GFDvppj/O16xjTfXc272BelUu3MwJBm591YjEhFBxIolvJASptS1wWSjkPpdMNsi0Wevy94bBVSQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521449; c=relaxed/simple;
	bh=+umdA7EocoyQVnRariRMNmBgQ4A8vNtsyiypj6BfBho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kDvxO09SDyz+G+lNtzgYzZblYKTyPtN3KXR3b7X7dA6HZd+2jQ6NHK0JfS+xbxEDw/4W6A41ZAAOaCETdDWohzA3YMTSWzVfL0/FpGhHPAMSOFDof1z8cRp8b5mw7JdudP7jSPeibFZJrsXA9IqZNkRKbDoLR9sTx6Qxzhps8Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=rvL+DSIT; arc=fail smtp.client-ip=40.93.196.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="rvL+DSIT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRW953q5083VkT1+4Mc9TdEsZ4vtBJ2tWlKXYcXd1yq4L0NhqnV9QMx1yCBdh6d72yQYNz9pLsuAi4QcAMB7Fdxq+oMhA/0kBFiC7BGz5vL8vPpoMnIAAye8xfiGE1HzOk+xEq+Sng9v1iwMEdosxKTVEvFVWmxyUceDB8CkfzCdrFXeI1Jvfcjba44aZAV8KZBCF9kQJ3bBZb0m7CDXOcEpbnKeXFbeM+REwEa5Zishp7kT+GbfzIdwFjPXlYALa1SIutspdiyQNakv70xIwAM6i1uW0oIe8d7k8TEg8VxC3RITGfXYUqqSPxyzbTVgmCJ0UX9BAarjcX6lDwOj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOuxXZy9YD+qhhItzLVD5XWld5rC5iGQRL1ptAmrYbc=;
 b=xUARzep4dvb3lN1P41TOWrMtPi8Lq8PMASHSGNBpAHfsW0bpl3R9q+L5bxmSuBq8AB/sSJHwwzVE0cYywWzTF+lpMgsi4qwann2U92xMQR/Idek9lxFvIVfRpBtQaLi9YjTQoT6HoSsLiPeidhj1ZUdBhCg1mRPs41JoFG1/5y5QWKTgm784G0PlI4H4MAXI5O5IAbuAqNa/ewLtqEgrXNNHVArmNydNYrn+uMHx6swBGqMYulD4vVeWTjEQP5s3VxsF9F46c24tx/4vK4oYYqdrhjM2hZ8tk2hW/Q67p2S5nFN7jbfB5SYNTTcK/uZmaVXzxtMsVtPVjoSjWAY8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOuxXZy9YD+qhhItzLVD5XWld5rC5iGQRL1ptAmrYbc=;
 b=rvL+DSIT8CmTsHBeS2q8uZhepoZcQoAHgXZFs3dv65vhOq/EVcMtW6rS4Y97bnZMaJRxxJEBaAIK90wCn7qj5rnXWoKkwpD7wMkfV1XPiPt2/XfUpTU0uXX2f2L6AKN07Ij/0PP0JV/lAIQdav4CzNRWjUMM3C89wIeuIrZdUmU7N9RRs7hRwt+Y091zoiqGaHMwVttj/t+ZmYk8njtqCSnO7OknsvzZP3/dxy4zrgr1v0P9b1EZncpsurfW7f/DaBjkACCM88tBjxljtTSQcXnK5gBdLZWGHBgQ+2C7K0rHcLQNI9HmUh1/wu/3d8rF/0ICzk9v6m92Lh9UNLWD5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DS7PR03MB5606.namprd03.prod.outlook.com (2603:10b6:5:2c2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Wed, 12 Aug 2026 07:57:25 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:57:25 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 RESEND v2 5/5] firmware: stratix10-svc: enable Agilex5 SMMU support in probe
Date: Wed, 12 Aug 2026 15:50:31 +0800
Message-ID: <3d501c0e349132c97f32f424b925c1ae3e21eac3.1786520346.git.adrian.ho.yin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: f1306cfe-355a-4523-cfc8-08def8475948
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|22082099003|18002099003|5023799004|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	WtvonQxhWdggxpLi6+zQyWoRV0zqHy7v4q4l/zZKo+tvYYcAmU+P5FhiIizHFWRn7Gz9xUNjzAser1WcTnzRs5C83ynI59Fb5mYlAGcIWZuwaDejD7DbKbysmUfDYebooXGWdrchTidKDsXOYxTOXXycT0ubybd6/soGXSf56iE+a2LcslR6GZRgu4liHeTWZOZtYouzc7q4yVcC/t1mx6dNFseWQLcgdtdtgK0/ZH0utdMik5QrZVwoRys369ivBs8zDHmOwB67Tl9PV7pGHSiLI+FA1ecXWZdqbFdwADiMYn9c+fSDB5vxS82er7AK94MKqKLIVYmuDH8MqROasOvorYuFl9/UHIre2fDS97jL2+M2IfgcPRDdxxMbD25VHzLhi9fQGRyHS5lL/q5Gl/qJ/lMoUbavDshkElJiZP45F/TeDGs3I3rd34WZdeZY4K4RCCPjJRxN16zfOIqOXy4piU6iot9U/88Vk28T4cjBUvJmXkvb9i6yabulqX63jeGvlpLGmgMeASGRMcZp74wwCkYuKjiusX+99J8Rp7TdElc4jSX3W+QD1bWd0ApJZFfXeOAidB8Mf6m8VllWcB3OQz2yazXyAYYwV1Xs5NrUZe70nwcFGVLuAbwsKT03CgzJrdj/WECBmREhDCmaFu6WLsTId+sJRXYnqmtfNMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gFw3S1FHFl9kcnWb7AuXhJa7bPSzm1Xv7ZR85DtEeH3rTga2sBWRiPhH9AoJ?=
 =?us-ascii?Q?lxvUq6w7Nmvp+1LCZTmESHP6Hw/61+zWcUg1m/QmgKzd2UMN2T/rmf4bG9JI?=
 =?us-ascii?Q?bpaLhsgT0kWLKAz6XQS16J/dRAcQkp6Oi3zCu3xqK2Itd3E4GrlOUCuVEAe7?=
 =?us-ascii?Q?wZhH7qSD3lqrpS99doma4pUI7e/LZJLtU9HPetEETGzq23Bw7AvY40ziK5gp?=
 =?us-ascii?Q?Ek133YexAhhPM3FePPMdgQv10esBmO8jc5M7Cy078oWYuJBNIEnR3TfaQVtq?=
 =?us-ascii?Q?S/m6GJPWkevshWhg1+W8nIxP2r5dCVex0Nc2KNzFeIAuBGYfm92LBhHy8z+a?=
 =?us-ascii?Q?3M+eqNlbzd8LvTnY0j++tpyQGn4adSSSDI0xxFArmm8smqI8iorTRdNjhJ/X?=
 =?us-ascii?Q?nNj3V260zL4+YCFojHm67zMpkpd3TuFx0gq899oPaHL3RpA2GjsNOS3otVvU?=
 =?us-ascii?Q?NiK4maX/QbpWV4SlSRrJihKadJIAuc90gWBmyJ9Px/9ZWoHQ9eM2TUhh6ccC?=
 =?us-ascii?Q?xL6cPF+yBqD9LRyDrlKQGEBNyV8aYW92xp0Mau0IyJIObC7fXbfBhuEms6ql?=
 =?us-ascii?Q?XRdf8gM6twUSAFK1s4vJTOK1NtU5YC1LHntu+E8LnfnMF6tltR8XOLAGYtEu?=
 =?us-ascii?Q?1kUTDKE90PfjZRXxYdvLo1iVoYjEg96EhC/2we2BbyBR5ggJuoGbjtz+TNLW?=
 =?us-ascii?Q?fNWr+A17O488EZcjfkmd18HhJwTkuvH+51+vXiD74l80fm5r0wkdR7rtxbln?=
 =?us-ascii?Q?Vg/YpLqofDFQ/7rFHUaxz1sdgfZ+4jaYoXCcbV5mh9ukXG46nX4GLoZnwSXK?=
 =?us-ascii?Q?2iy8RN570SvY00EaYY9yeqYXFxaQMirJmMJxfy09GbGLmXJ+cMhWQ7a1Qh+t?=
 =?us-ascii?Q?bmZ9E2CfSY6hP7YE9+leiT6uioIN3zzjyMz1jWWPhJR+e4+cubIPv/iPD/MC?=
 =?us-ascii?Q?+nQkut2NvuTQ9tn4uuoy12V4eQlVnczw7UH/IlKbAdD+TBEDV5axOldIeIxs?=
 =?us-ascii?Q?ue7EOmV9Jr6+9mUMfLExh/mN72Oaep9uQeCz95FiPVscTLDoBNAKR6c43FWt?=
 =?us-ascii?Q?+ScHjecvaROQ4kYwWRjU/FKDRZAbiWm9jsvkCWuHrfWGhKKTHguvnhqWM/ix?=
 =?us-ascii?Q?ZvIq47Dr+FZ/MmeUmYZOxGkaDAbFRxaFNEa2vt1z8y7FhTgBNkN98mbxX3/Q?=
 =?us-ascii?Q?ljK2u/CchxGwQc7v0JhiuxFARlTJqpIph56KFBLPChGycjGSQirrZzdGawpK?=
 =?us-ascii?Q?24kYiZoGUqviCkpGcOG2POezVpC1fnGkmpY3F7UrsRmFaEbrdiW7osjB3/Sm?=
 =?us-ascii?Q?ILaJ1t8IgJMcCNnTBICeV0gFTJRVJVu0QIqcqk2hEkIaQ5nAn8vcMCR58YFD?=
 =?us-ascii?Q?gA+WA4BzWS2zq+huCDgoX0I4Cei61vtliEk/CP9fm+DeKZvj/fkoUZMQNSAs?=
 =?us-ascii?Q?iMDO3OK+73s1HO4aw0/0iHxJGxMeamLhPsSk0mc7fh1vW/IOBqCy90Bgl6jK?=
 =?us-ascii?Q?+GX4DQhTr7RWy+brXyrd+Ods/HtFkbjZLlK4NnoXYRCCa6mWU+GSUYzF9teg?=
 =?us-ascii?Q?6OYZtzWcYPS8nbrU9YUDvgAfRnroFCStOr3dysfYJBDo+GICQ6flvEjB/GY6?=
 =?us-ascii?Q?NWe3YDdvtjuONfhgDPH8Fef4VRrl6kEAsPR2M0TT0TFldeIvdcQ6pQIEuNaH?=
 =?us-ascii?Q?w5erILYULv72esggmR6tUAx8h3YErOi1nH9EB63AwzuObbBFx3NXS1BZTNjC?=
 =?us-ascii?Q?gyGhWQDYCGeibecIBOidKqe3NfLhLmE=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1306cfe-355a-4523-cfc8-08def8475948
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:57:25.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbQnQqPfnzcwVnpPizr6iSeCT31IpT6csvZTV+I5EBS7kp0EZ2Am0nFGDdOPtAZ+W4IXCC+gA9PXxESHLqhUPt8MBJsWhWpaQ2sfy5U6hcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606

Wire up the Agilex5-specific path in stratix10_svc_drv_probe():

Add intel,agilex5-svc to the of_device_id match table with
SVC_FLAG_USE_DMA_MEM set in .data. The flag is read at probe via
of_device_get_match_data() to select the DMA coherent path without
hardcoding a compatible string check in the probe function.

On Agilex5, DDR starts at 0x8000_0000 which is outside the SDM's
addressable range, making the SMMU mandatory. Fail probe with -ENODEV
if no IOMMU domain is attached to the device.

Issue INTEL_SIP_SMC_SDM_REMAPPER_CONFIG/BYPASS to disable the hardware
address remapper present in Agilex5 REV B. Without this, the remapper
adds an extra offset on top of the SMMU IOVA translation, producing an
incorrect address. Bypassing it keeps behaviour consistent across all
Agilex5 silicon revisions.

Register svc_data_mem_cleanup() as a devm action on the DMA path to
free any buffers leaked by service clients on driver unbind. Guard
err_destroy_pool against NULL genpool for the early-exit DMA path.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c | 86 +++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 4a2071d57399..4b96e795ffd0 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -62,6 +62,9 @@
 #define SVC_SDM_DMA_ADDR_BITS			29
 #define SVC_SDM_DMA_ADDR_OFFSET			0x80000000UL
 
+/* Per-compatible feature flags stored in of_device_id.data */
+#define SVC_FLAG_USE_DMA_MEM			BIT(0)
+
 /* stratix10 service layer clients */
 #define STRATIX10_RSU				"stratix10-rsu"
 
@@ -2006,6 +2009,7 @@ EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
 static const struct of_device_id stratix10_svc_drv_match[] = {
 	{.compatible = "intel,stratix10-svc"},
 	{.compatible = "intel,agilex-svc"},
+	{.compatible = "intel,agilex5-svc", .data = (void *)SVC_FLAG_USE_DMA_MEM},
 	{},
 };
 
@@ -2016,13 +2020,39 @@ static const char * const chan_names[SVC_NUM_CHANNEL] = {
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
@@ -2033,18 +2063,41 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(invoke_fn))
 		return -EINVAL;
 
-	sh_memory = devm_kzalloc(dev, sizeof(*sh_memory), GFP_KERNEL);
-	if (!sh_memory)
-		return -ENOMEM;
+	use_dma_mem = ((unsigned long)of_device_get_match_data(dev) &
+			 SVC_FLAG_USE_DMA_MEM);
 
-	sh_memory->invoke_fn = invoke_fn;
-	ret = svc_get_sh_memory(pdev, sh_memory);
-	if (ret)
-		return ret;
+	if (use_dma_mem) {
+		if (!iommu_get_domain_for_dev(dev)) {
+			dev_err(dev,
+				"SMMU is required for agilex5-svc but no IOMMU domain found\n");
+			dev_err(dev,
+				"Ensure the SMMU node is enabled in the device tree and 'iommus' is set for this node\n");
+			return -ENODEV;
+		}
 
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
@@ -2059,9 +2112,17 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	controller->num_active_client = 0;
 	controller->genpool = genpool;
 	controller->invoke_fn = invoke_fn;
+	controller->use_dma_mem = use_dma_mem;
+	controller->dma_addr_offset = use_dma_mem ? SVC_SDM_DMA_ADDR_OFFSET : 0;
 	INIT_LIST_HEAD(&controller->node);
 	init_completion(&controller->complete_status);
 
+	if (use_dma_mem) {
+		ret = devm_add_action_or_reset(dev, svc_data_mem_cleanup, controller);
+		if (ret)
+			goto err_destroy_pool;
+	}
+
 	ret = stratix10_svc_async_init(controller);
 	if (ret) {
 		dev_dbg(dev, "Intel Service Layer Driver: Error on stratix10_svc_async_init %d\n",
@@ -2129,7 +2190,8 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 		kfifo_free(&controller->chans[i].svc_fifo);
 	stratix10_svc_async_exit(controller);
 err_destroy_pool:
-	gen_pool_destroy(genpool);
+	if (genpool)
+		gen_pool_destroy(genpool);
 
 	return ret;
 }
-- 
2.49.GIT

