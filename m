Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA74A3ACEEC;
	Wed, 12 Aug 2026 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521443; cv=fail; b=g0nnxosOFVx53ZCZ0EV7wSNfTuwvTjOMHiBMWfpAXG+boX2blTQ6EuO3k0y8sE3CnntcOjeam0Da8vQQQMfboWCisIdULJ6sxOYU4yN/mCfHkWQk+c6YSypi+KmmVbgb950b6VjHjfgNSrPaB5edM9p1DXp2K2w0EJhB4W/bUNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521443; c=relaxed/simple;
	bh=xFde5x7ZFRUSjNmRBJyIHimRQG/qhaSUzx4Vwa+nAtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UOgxg3CyCUIMT3BkW6D75mWGVKHhjOcVBdSJ+Hdnvc5zYj9qhBqeCQKBANgS/IYY9RR/wlBKqK8HOUhm85mcsa/YT914F8klYU5g8wc6sP/KGOSJ2VJSOwo75DBmB/dTD3N/PY2htI1CeIO1LNW4umj9l8h7m2hKe4D+n6OK9Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=PceYBqpf; arc=fail smtp.client-ip=40.107.200.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="PceYBqpf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhRFTQu3oEwmnyw8bEXnPyZloTjzlkY5nfoPRNdyU2gjUZ9Ipot6tfC+CXfZrV0cAFtT4tvWZJNMdET6oxIzCXOUmqye7uzpTxtQGsi71tNkmw25VsrqPpqwFwxcgrghm+oXjS30Scwo7bY5PxMeZc+cXmNhifegVJg3mjTx5asvHko5vtsGeHxi5tVTO5shH6enzrgOf+1f3h7R1+7rwrIOE9zNXtu8gvlrslYFIbuPoszIW6zB+kkE4IuV3VZRrrqf7d0F5RRGXTfU/Afz2UBvOekfOGFjDqOjtZ9cBQmxg16K/oUQdnRFj11YeIuZYw0JKD0rLZSHBMcDlGtCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP4rN9zMAAhqj5VFzl0s9j0WTK5dhAknN+Tsf/YXCcM=;
 b=eo0kbtWqdXZfitEXAB8tQH/j+R8twKHT23RueIL7lZHSxIeWZ7QdV0F+4JqPqjunGOK34/q6GlBJpbo5b+NhEFvCW11b6ujB8IME1nl4lg0zX4IFoEcffQkC9zj8h5C2eq80ICtbPpWDFzESfe+yw+dkkVuVDhbxhlw1bytLBsgYY3Q/7Efryp/Oyc/Ymyd2GiB4GKk89hjnqPFleJZapolNxxg+qEuurI3Xjcja0P+bILFiMmKcAJIBKz0DBOCRgDtMuhd8ZS2G7evmJGHJLfnmzncV3K72FujoTcKrRjCVPy3KsxMYsuoVLI7VyFCHZjFjakuOmpRE1qd+GE09gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP4rN9zMAAhqj5VFzl0s9j0WTK5dhAknN+Tsf/YXCcM=;
 b=PceYBqpfHTbgcI47G9eqLbdbgjksnhjB/Vgc8vHIqx8Vsgq0M1UPnS4XvIBHD+D+jPp+I3D8uzcYT7sJW4YcHhIsCJSsyf69FdK2wg9/2VToWLAGizaIcDVqwy18seTuRCNpYZlh4w5ae5viH85CZdRB0siCnN2CESnQf+qfxjiAZbanijTExGwf9V50G+svJT5VfFk86LOfUNK0EWynmNiGQtKSAfQQUkfEqFAUiM3RDytvY4Ywq2xmOhxqCBrOYE6uOh9oZjCMrqeWhxeLM/ONim6XvV8Fts5XxKUwbITSbphe2WsJw1sxGyxCZc6CAHgCdJs5U7RYZJlqLdEDtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DS7PR03MB5606.namprd03.prod.outlook.com (2603:10b6:5:2c2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Wed, 12 Aug 2026 07:57:18 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:57:18 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 RESEND v2 2/5] firmware: stratix10-svc: Add SMC call for SDM address remapper configuration
Date: Wed, 12 Aug 2026 15:50:28 +0800
Message-ID: <1059b3859cbe5932abd68faa608d3d1393ddbe1c.1786520346.git.adrian.ho.yin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 08ab1b3f-96aa-451c-f2fe-08def84754f4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	TmvjM/5o/z5BLaJB2a0gFu5HkEJIVLAaKekn4kN1+C6vkxsoe1TfNS5xx5AkNmj8P2E84+ujMNqUPIqiQo4nnkKgpQWWO3utD9Pgkhc755Kb/kl3+IA1GLf10JM+J7+6fGLAyz2z8XOLEXEssvo00saHxhbqzU+nkmnN1m3Ja3tHcVdZIYZtYJqGjztT884DxIY8Eg66mpy4MtV/aPhaSELxD+1YKdfW1JFKapH3Qvwr1ksTBxT7omRoer5LdaAaKkM9fc0ZThoZW74mvSV20f32SUMljFTVb64ek/O3nN7r9sP2DlmuLWQWCcL1t3EgUaYgZ4y+WNJ/JFFp8xFA74srKNVKZvZpGlZ/8gFQbTDewzCEtYJHkinNlvhJJAXajJBXFE9G8JOtznMxa2RcSC75qDlPUxImls0cZp7j1dM47ZEY5vjNqrfT7zrZwIViGpUTJzevtTf13yXg6wZUWIqi+P0z1tQkCr72nwKHPMY6Ybh5dOW6j6T7fU8YmilLHEN64ChapwhMD3HfNT4sdoZ4JPmI5wTS92mlHUlzC9uv/NzrHmSKNLp0k+k48ddQF46fhSUvEr5oPOlux/12/i50GTJoKULpa8pNiivPMEv/4gDM8A42J2Js7IxEH7XrCsY+avPBtOhlDoR+9cstQsmE8VUpeigAkoalykRSncg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dTXGKmSjbC2h8wAm2SwDI2f2hQbTzqbFVFwL3EYFjDFXz7KJ4cQOhhvCkAOE?=
 =?us-ascii?Q?C/k1LAWfdsPPviw5a+5FJ6Tdz1uQcEOZqryGbPlZ3uXta0Zrp+Nzeems2fK8?=
 =?us-ascii?Q?jOHXJeQPPamTLYYOn6AdFmjU7h4Sn1P5fn6C7J+txZbiintsegoWyiZcEvpz?=
 =?us-ascii?Q?pspV+4JGSXeJRXwuriBOkYWH8iB4b767H+uIiwx9EB6PPrYI/JiyhLpds7Tu?=
 =?us-ascii?Q?xVHiruUHSLgnH6Gj5t5MpKupaC0zvvzySLaUtIFbjS/H84d5E9NZDBkAYQXF?=
 =?us-ascii?Q?FKiey6q8XIOWgFej5JUH3LXoCtIOSVkti4JFTmlQdBc9cm/t27PjmfI/JcbU?=
 =?us-ascii?Q?ptU/2WNMwfWDgw4M41FPXURO0Sg9cAgdtyj1y94kuv8Njpo3vuuhxatDVKE1?=
 =?us-ascii?Q?Uld32j7NQ/i9+U5V2i6nQ26sacwAXlKiUEAN9a7atWl0eOWESOavVFdeDfry?=
 =?us-ascii?Q?i/n/yyMBnoHOfMGVri3tjQWocWvApp+CKFUHIdA0VMIKF1wfkKOh5m7yb34m?=
 =?us-ascii?Q?+d54ZKnLcFvKdxbFv7/oW+a5co4PWMHzMqX0oD8bsWgqeyA7SOsAWKJ90Q7w?=
 =?us-ascii?Q?9N+9gYoWwSyoRHt6jpCmou4w9Mqd41UfpZQdPpnuHw8zM+XRA+a1+QAveTMp?=
 =?us-ascii?Q?drow9lvHgRvTBYaeoFqXNyG+LqKeavVjk0OA0je3s9PXSd/tfRnxeY31zeDP?=
 =?us-ascii?Q?M8tjpU7CpYapzi61VXGc68GomawPri3Q3TbjBqmqbVpoSVmF9Dlt6zkv75rl?=
 =?us-ascii?Q?rwdhE436CG7WzV+4j90YcIc9DNkdojvMu6VIA4pg58/LjPLgm0/+au7IvDMJ?=
 =?us-ascii?Q?n7VsUEsfN5X9yqqqXVeuhdYApFdgbjsX9XrGn5lKuUlmXGjTUyPCji9ZlC3z?=
 =?us-ascii?Q?58F97ddkHsa6I+65UvY4xELmjhwOS3NuR2JOD4A7Zmbg6/HfraR2S+WGSdUQ?=
 =?us-ascii?Q?fs2WbPlvwsFE8pWhIVboQu9YHW66sSsoYMOlgX+6lgVZFz51LZqGvVPBiJEB?=
 =?us-ascii?Q?iO4Ho8HHSW5CoTXde1u2CTHfghCTdSV2hosCAlrYAUh/NvPyaYAXuj+oeVMy?=
 =?us-ascii?Q?liWofQan9aZ9OBdcCVfLc1hqc61SFR3QnQZgphPrKkVM7ZW0klxVRybuEJhR?=
 =?us-ascii?Q?oNYOdyBAira45O9dMzUR9nZEXQqZRrCF8Q5Oq+8gg1d1b+1SQ4OWs82jxyPQ?=
 =?us-ascii?Q?5wTFSZNG1Y0TG5GLzWtSvMH4t2GnqUlLY0abY7FW+oaCD0G5fpG+2B7sPQVs?=
 =?us-ascii?Q?gwPNo/3rjTSHcHbXwtyIA080nb5gX0m8piUvbJ+/8LoW54X6mzQlku25+B+N?=
 =?us-ascii?Q?PZ+/lc/Ob0Z6lmq10H1t9bwnui8nf5P2EVrHp8M5nDTA22oRLti8KhghjDaO?=
 =?us-ascii?Q?w7wkslo1N9Nebg3MMC4j57dqpytOXTgITliocOuv9B2/6O792M4vlnJXGYFo?=
 =?us-ascii?Q?TV4cMyFFqZzSyAB+7//eYy/H6KMo2DDXfQ2jARd5VZjCygwhXpQ6ksa4HOrs?=
 =?us-ascii?Q?e4/XC5rthvz12gjlTiW7yZrXm4p+2VUoCL9YEQpwhXBNbwSFWnwKujEoxcJ8?=
 =?us-ascii?Q?Cpd2TvH7hLaNECSJEwW6lqK86EeU3/rHkG3KxeP2I0wX9ZUQ5+omZvhsY82j?=
 =?us-ascii?Q?6hCIGcEt25SGip1KUiI5corPgQUHuxrNz1sU0zKomgk4FZ0A9m6BoMJ3UVlN?=
 =?us-ascii?Q?BNSOptpw6Q2lYD+TflkQy5r8VewJj+nwCzw/Vzg3KpUXCtO5rSsPs3KNPFcu?=
 =?us-ascii?Q?DtIewsq5zOq1IG/GWOr9OCQbnvFq8SM=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ab1b3f-96aa-451c-f2fe-08def84754f4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:57:18.6028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lI/wplhjLxzYBBN7E5Q6nbzye0Zi/5I11/vaTIzJome2EccI0x83UTkrjzfZNbI3oKA3jamgtuQHotXFkJU0foDzY5HA1LSoXZ3HJ+cLEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606

Add INTEL_SIP_SMC_SDM_REMAPPER_CONFIG, a new synchronous SMC that
configures the SDM hardware address remapper introduced in Agilex5 REV B.
The remapper must be bypassed when the SMMU is active to avoid conflicts
with IOMMU address translation and keep behaviour consistent across all
Agilex5 revisions.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 include/linux/firmware/intel/stratix10-smc.h | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

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

