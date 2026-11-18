Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794983149;
	b=i3j9JS2GcgpvL6ETDpxVBD7G+FxPl0sw7GcNSn5/CsuAE0oN4cY+nBFfHjoyJfRA21gu
	 Qax0kCLkebAdY6Dw3ihDDuyHM3HYP+sGsedpsLzWO2W8qBSPi0y0iwxXPDiEjPPtg9gLw
	 ykyaoDW2w6J55fjx4N290RV4oMWnx9CYSvKVAIfkrI6Plr1Z8QuP+A+YwHvYtwu96D2NX
	 PRAHjwD1N0ntjRWr2WkFK/rs4U2Y68iqSL6Jmjy0mH6DDftaDDSoJF6ciknbCnFTfYTAV
	 jdMp/KHY0upF3dwKt1n1ZkluKVal2DU0G8PnR2uZ3Og/gnyd7UK6MkKD8sG971O40lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983149;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lCY8uDsGhKPq+sNufYnqe2AlNRCQ6R4cQDFrdYayuy4=;
	b=5JE/0pWKPY7xTBDeV2GM7uMDosozl01hxyg3OqeFxKZl0Sg8NkAOxEq8DYtQR7mVZ0nq
	 NwyzXW6pu71mEoc+dEHPxEyuuULWXQYXSveFcK0gk3+Sa6bmdfAEbbPvjELYXBzp+WQXD
	 lTxPVMu9aBc50OX+Fct4BDmA254MuixuwOHePMRIC/jotBy4qqCUUsvgtVQSF4GpaLihK
	 cruSF+xuL/E5q3Kzz+Jvl8NrsOAEcskNWfXC+uJCgD8/rY5+afaXkgfo/x2LzrIjo87YR
	 ZcyBgnTcAXCYz4y8viIzRUs7CKMqAWkoYcC3/OdnX/zf5T/YKMsXMP8SAjOzpW9CZ7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.121
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2121.outbound.protection.partner.outlook.cn [139.219.17.121])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0B4606A31C;
	Wed, 18 Nov 2026 06:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGpnAgf2fREUs4eW63Fz4YTdDET0U8+Q67a1AVE0TGrrcUg3fXLECnCKP8amta0X0clg4nhuAJaP0bf6Z/vbnHdnYeaxcqzHBXVDwOD2vTbHdNTX6qmlOukOasouBBGlO1a4hsCGap/D0OOWm0o4F5lOj+sf4LsVO6iDqKvTAR0E8nlNKUClKr3TNcSHFlNs7KWuwNmAnuuR20gd2sSe7JQGbJsnOBQVUMflrW3Pg5jTR264vRie73y5+ZFCwbU45fLRIhqung9SskON4ffEWDxTlf9BAEANAwpgn3TpOtwG5BVEWwlHYWpTsQIjV0O3PqNTNwk7tmLM41gaeNjP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCY8uDsGhKPq+sNufYnqe2AlNRCQ6R4cQDFrdYayuy4=;
 b=XcMfVMvCzf06bfvYEuBoZPLU9KHGAxDgzJ/SJlveWS11IKQXePTiJLgLx13OnMClT7+hi46O7sQbu3gE2VE+9F0IqTg8BqXrUDrBIpwRPJNSIhMadfLOnGPKw2TS9LQWxxWDrcVLsCGMLCCFuuGppSwWn041jLLZ3jfkdNCNHfzrPAMm42QEMrVXJ6okBIivooC2ovva+gA/BRHY3nKQZaYyIKgjpaKSd7GMH7BsCHxNZu6KB+txRvIyDaPy2hYMLfUj7kZWNPpfGlZn8V5qeR3lQP9ie+KZZSBB0+jddpZvnub6eRZWyiyxW4Q7FodWCq7GtrL+dXROagVClhdxnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::12) by BJSPR01MB0514.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 06:25:33 +0000
Received: from BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 ([fe80::c362:8d6f:de71:524d]) by
 BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn ([fe80::c362:8d6f:de71:524d%7])
 with mapi id 15.21.0592.012; Wed, 18 Nov 2026 06:25:33 +0000
From: Mason Huo <mason.huo@starfivetech.com>
To: Corey Minyard <corey@minyard.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Mason Huo <mason.huo@starfivetech.com>
Subject: [PATCH 0/2] ipmi: Add StarFive JHB100 KCS BMC driver
Date: Wed, 18 Nov 2026 14:25:24 +0800
Message-ID: <20261118062526.1436893-1-mason.huo@starfivetech.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0023.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::11) To BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::12)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0577:EE_|BJSPR01MB0514:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b34989a-262a-48ef-359b-08df453cbfe7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|23010399003|56012099006|38350700014|10067099003|261026121527099003|261009223027099003|261102123227099003|261021135927099003|261028144727099003|261021121427099003|261026140227099003|261022105027099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hu2Mr8Ce5+bISnpr+sAUHUhigmeP89IuVtuFFWakHv5lD+5F5P0kQP1XVLHG+L1kKTr5F9Ta5mCSVhPkfQ8zBKzqwxbqqrNgMkJICItf4oSiVnmP75E+FdtxOHY1wvcZFXL5Pscx+nh9QD9cVePLYhJ+AXd6KMK9gYqfw/R+N3YXLU+hu5gAL9mrXmywgVmL9/8YfXlhb1VYismmvAHO8vYE32iU7cwJwcXQI1IMu3wdOje888POAeWnwO+kJEIUf2ZxlebCESUfIi7Q4CM4zqRi3miEaeVl3+pwV7rhU3YFwPDHoIh6j/OVy0VYzh4dTmP/V/UmeLZtFFtDP6mS/5ORrsg2WeufzRGJIh2AuN/2PzCetC6Nie6kCcNPbKAPJX9DKeNx0ARLBrO6RQviy9COuRxd2hwciIOkV9I6CCuJZdfTkca/xyh0yEtzjL4uO8IwA5eRtvPcq8BtDX2rIrOxWad73pzp7jPeCDIPcOrafKyB56m8IlUgol6BcQVfIZeS0jwSMSgxFTJdUwOrwn4N9K8sz9pMfeuwNpfInL4Wf7c9NYZ9IJmpFQWYHvEA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(23010399003)(56012099006)(38350700014)(10067099003)(261026121527099003)(261009223027099003)(261102123227099003)(261021135927099003)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HqwXLA70QqyeJ7yWKgJCCsKBIrgJJAmEqpHYMYtvoQnpGOoLkSF4YWuoTkUB?=
 =?us-ascii?Q?wZ5xeNVX7t7eaR5ZJLGcHwWMGhImSRWR5jrs7ZUVwbmbw4voect/du8k0gfM?=
 =?us-ascii?Q?1vDwlPSegMDEnlcg7o291PaIAvBE7DZ1VP5yrKsuYQvaT7ZgX8vrsUL7WIkj?=
 =?us-ascii?Q?hZsyu8oJW9eqak6j+7wmiCXybg2lnGMGOHKJvohlC3I/xfu5tr/bQUGbj9Ac?=
 =?us-ascii?Q?59otyjPz9gWrCIMnRhIOFjE6YIKfLIz5/RHt6xAy7CgJC2EI08OEA4830Wpw?=
 =?us-ascii?Q?o+EUn4CRafC3KejgxMLo6jnjgypRLsVXKiQ7JfihzMkTD7jJNIVXChqQo3FO?=
 =?us-ascii?Q?ZsGljDd/0SAyyqeLf6LjfiqBfehhk/pvx3Vd5gKrY5DUPDrzpAxyGyH4RMvr?=
 =?us-ascii?Q?RAXmq3D1skcwUJuB29LBqGEACPHyy/KrtVwfT/E2K5TJe0JnW2pHERgRzsPX?=
 =?us-ascii?Q?jIVLcequ3C6elApV7Wpxedb9nN9DqPyT7OZSKcI8m+rB8n3d8vgNCZjz6Fhr?=
 =?us-ascii?Q?NZcLs/DLgpNfR86+jr1Lx/XW8YzrjJRDh2Pi9fw1vcGdvYzSxYfsNk7G/ywK?=
 =?us-ascii?Q?V9V5KaNSspGAeMN9iAnhURtry5OyDKRrAEE0GI1yo8vo3YwZAqYjP97o7vz2?=
 =?us-ascii?Q?4nimvPte/sdoydIUOzYB9fBE0+BKm1Ziou0Mxuv1CW7kwf2Kbz3rkqsNQFr1?=
 =?us-ascii?Q?ZAAEWPIS//ZRp+fmY+EEq2MO601zCvnxBY26qr+QHWIoLS5v5zI6QhHNs7gQ?=
 =?us-ascii?Q?W4v95gbBaL2xdqscOL7phQzOIk+ca5flxRZvtQcTnd2pEcmpvMiNNOZfGjrS?=
 =?us-ascii?Q?Mbk9Bf0r9zvS+iahC+MrzAevEVHR43b9gsJ5S8XLGemZa3v7w2yRntgZeK5Z?=
 =?us-ascii?Q?oql9oHk29UtqyD/vwORbzHmUDu9BrNbOBXYPh+EmlJoFRXYwZPAePX7NtUDW?=
 =?us-ascii?Q?k92Od2BawJZs0/VC+2Zj7i8To2N7/AsLZo8l5k4eqCvAEUVgFY8NNBz7rjQp?=
 =?us-ascii?Q?xOeVI9zNLYGVvoHbDMmm3gQPZbMv4QAyEwNux9o+mSZN0Qj99OCtA85Y1AvO?=
 =?us-ascii?Q?7Gspu354NyrrZyAnt1uASiMoFnbksW8MBIUARYG+Zxa88NnzvljscZSCzjeG?=
 =?us-ascii?Q?0PtjMsYOwOIpFkaC8IdwgkrJryPgd4i2X7KnWMrHtwv8Ag5h0KZ+T0zATs0p?=
 =?us-ascii?Q?r2Tz7DFmCSZw+XOZyoq/es18IL2On95yscfsaMQA/04M8OfFDqJ4nDQuH3t9?=
 =?us-ascii?Q?VxzfFM0/u8zwOCrpHTu8Q9AoSPGNcpML9tgAZFNv2sF1l6PC20ujWPIc1kQ8?=
 =?us-ascii?Q?ASbswOsk+KqIC+57crQwJtOpjkidrdnDY+3jTAjfOWXlPgTSk5BIafgaKCS4?=
 =?us-ascii?Q?HHcW7cWsRbfra+OYiJkgYwPpKRyrgcL36xZPyZuZaZPhewHxpNy62ssBmtI9?=
 =?us-ascii?Q?4XQb2hvcFOU1b5lk/7vYK22lwmSJKu9u3q2jQGT1HNalrHGh8LflXTFrLwYb?=
 =?us-ascii?Q?k23Ihiv/SVKrGGYwsJfnL467qi+E3VW4MJq6o6Ks3aebXeResrwb4yv8X2Eq?=
 =?us-ascii?Q?Oz9m6DD14l8X6/6EOBbOb3p0S36TA0FbL4pYlY0Akmdmak5R5PEvcURUpqmC?=
 =?us-ascii?Q?aRoaWzP2rUmiN+aFobQpTak+8Oxv6wJFILsOBA/Trjjh3WPm5YEcp1fKyLSK?=
 =?us-ascii?Q?/du7+aBLH/4vf795k6FJyoJooKUKGUrs57qAFsmzPBZ6TC5JNMDvkciR6iKF?=
 =?us-ascii?Q?H5Rq4a0Wpbo7zYRtuqiuo0zuC9rJrAY=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b34989a-262a-48ef-359b-08df453cbfe7
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:25:33.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbYV84ZMvighw5SK9BNoC7VO4l1JkEa+PtuiQfjplK5pjsCAS3DkoCO11x/rvCyTNXkFrydpo8xa64efSrI1mjJ99oEW14IOorpLrH5Urzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0514

This series adds support for the KCS (Keyboard Controller Style) interface
of the StarFive JHB100 SoC, a RISC-V SoC used as a BMC on server boards.
KCS is used for in-band IPMI communication between the host and the BMC.

The KCS channels are functions of a Super I/O (SIO) block which the host
accesses over the eSPI bus. The driver is a backend for the existing KCS
BMC core, like the ASPEED and Nuvoton drivers.

Notes for review:
- The channel number is not described in the devicetree. It is derived
  from the register offset of the channel and the "starfive,sio-id"
  property of the parent SIO node.

- The hardware has an IBF interrupt only, there is no OBE interrupt.

- The "espi_rst" interrupt fires when the host de-asserts the eSPI bus
  reset. The reset clears the KCS interrupt enable register, so the
  driver restores it from a shadow copy.

Mason Huo (2):
  dt-bindings: ipmi: Convert starfive,kcs-bmc to DT schema
  ipmi: add a StarFive KCS BMC driver

 .../bindings/ipmi/starfive,kcs-bmc.yaml       |  53 +++
 MAINTAINERS                                   |   6 +
 drivers/char/ipmi/Kconfig                     |  15 +
 drivers/char/ipmi/Makefile                    |   1 +
 drivers/char/ipmi/kcs_bmc_starfive.c          | 311 ++++++++++++++++++
 5 files changed, 386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
 create mode 100644 drivers/char/ipmi/kcs_bmc_starfive.c
