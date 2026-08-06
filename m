Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2116.outbound.protection.partner.outlook.cn [139.219.146.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027BA47A87E;
	Thu,  6 Aug 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019187; cv=fail; b=Lz9zUdToEXZoRe04fR6C+7UPXYevSwHm3RZ2uK2Z9kPLt9j+UJkNf9ynhWRE/8iDcVO0gurP1rxA1YNYOyIj1/1d1+U4MD7KwChxn+ESN/nuPvSKIqSp95XKyKP+UlTNRco116ZWFI3inqRrw40eABHcu4EvCl5lp5dVDTUwnCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019187; c=relaxed/simple;
	bh=9ZFeMYElZfFfUzdiHMxcGvpVKOR/0o3WvqodRpPJrfY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M4ZmsjHj+hH6kCZ/ULGJU1Z5rJF1IPTJu5swiWOTHAFtCNejcyBSftedyt6Qq6n7OTtRkg81PPwLBlpIFXNr+7xmfCOvcNBrS1UGpqFLIxiR81YRYSKWbaO+zPhI9Z+8bzobTYQ3Abvz2GD2G47bsBiqPjHVirc+GudhxSKKFKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzchJrFLKpjCJcgKSdEsBuJUEwgJ2/mp/t5Ub8UgIqpAdmnbXhSs7kN1d6S/TU7WmjjayaRFbin6wWCyYVhZTi5MuWix94HVqhew+wehhj+v6XXe6vT2YM3A6N+pCroHTK/wHNlSLrVhSpCLKTrv0vSdvQZzk5pA3G+fS/do9YqFj7oq2CXOL0KC/VljwhH6JIkLGCxhisut96GgYBIVuNpxABYj5m9/cqADzBXxIoc04OG1OYHivyV4IUmnv2lEhCxd0bFFtlkDkZORrjlrcWrvq4Lc+aQ6YpNc+MCprS/iytZBfgHXlbaVBDORIbVKe59qGdwEeCFKfBgB17ahFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wuw85X97R7t1Lmo9e/6+YQiHRv1oaoJNp/GDElnlhU=;
 b=KC1aj3093SdNcQMuS2J5b8Gt9jijYpvyATt3IGXFZgJM44LG+svfsH/nK4SMjF8tFtZoggzA3kBEtsDNYr96wkgNBcYAVM7TgMYWzw7DTMPKgyRIJLr4I2b5PokGJDLb0c9G7alc/ZcW7spDBYM9Bq8V9R2VDYnmh3DF24dFTIcLVCuAzd4lXbbIRKw/aIb5o/G8bFa/Z4wEkwRrLf5DpSQ7lsFPRAQ7lEVfx2vqb9lUnZJmjInxBHLKegMBBo/TI4DP2KFb6Oj0r+HR0VH9ArIHiwo8y0bKIwmW2LpEDdNMmhUcOBqaHEw5ettCxVvYH8zibEG655T3+ewXy73vpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5) by ZQ0PR01MB1207.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:26:03 +0000
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 ([fe80::63d1:b688:cab7:50cb]) by
 ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn ([fe80::63d1:b688:cab7:50cb%4])
 with mapi id 15.21.0292.019; Thu, 6 Aug 2026 12:26:03 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Yixun Lan <dlan@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Guodong Xu <guodong@riscstar.com>,
	Michal Simek <michal.simek@amd.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>,
	Icenowy Zheng <uwu@icenowy.me>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 1/5] dt-bindings: riscv: Add StarFive Dubhe-70 compatibles
Date: Thu,  6 Aug 2026 05:25:49 -0700
Message-Id: <20260806122553.182449-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::18) To ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1208:EE_|ZQ0PR01MB1207:EE_
X-MS-Office365-Filtering-Correlation-Id: b8045b79-ca58-4a82-54bb-08def3b5e19b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|52116014|56012099006|10067099003|6133799003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	eP7jWDNSy+0scpLiMmbCGDovnsEkHqLMhEVwOwfMmUoe/UJOt926j5gxIZV9AmaWK5Mztm7KWaF3nzfKKTUEOco4Thby5XaY9dvxQHLWqqiNs1ZWt/vpqhLIVaumXZTmzx5+tduuVBpoFnM6unOCvegaRnDqCq2qD2rpyK68PaW/A+gi2opZNcuGh4KgCoVgLHpanbUSRJFBACCwrje61jJX2S5CkFWZmhp0FLxqfvGJrrU91h8z9aVtNPO2URctABpROFHXpsE47fVrsFqSVgCoGqfEu6bXNm7T/06kDnJrZIB6PzVXZ9rx2VLoHojE/HUXzlFrR8jfRQgi/D1jnbmLciKwP0wWd0hDgtbpoArTN2zLyMyHz0ek8nXSpdftAcO3fzy3r/aLchgA39EC8w+fukyAzQsD4NGDv7vPhDR7sftEavhEry59Ar5H6DAqo7IYOeJvBYUE3OLGjsd8c8IG5jHXWGNvhYwQfK5hOHVWrn6YHLC6GVzm7sM06hWjbiMxY/LAm3eFz6PvUX3lYC6Yo3zK39mpaK0AAhlDF3D6vgtEJASqdYnjckelQoDWtLfUI7bFOFEymlXxIBn77g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(52116014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VuIjqhnQelnhUPU+8u0Bx6xhQECzfsC/ghxoYcc260Jbw5+A9x/xVpf6Y5va?=
 =?us-ascii?Q?P7YZUqyNs+EPhTh0myYvGbpyGRuuByAPSkS561B7Ox7S0IJTL1B6O/72IfDz?=
 =?us-ascii?Q?98jO3X39lMYhbHqGTe6MkdbOBaMGrTwQiJn7Mb+XLJPfkb3E27Mi/k99uTKS?=
 =?us-ascii?Q?EsCfvUMk8BsiAnxN1WxQsp/rXrF1IERw/ol6Gu59Luqnz0pNtI9UVCvuK4in?=
 =?us-ascii?Q?yD9lpw1ELaILJ4AYqGZT1FAOKoRouzEA9a+b4ipdzj+GXgfinNmgkmA7/off?=
 =?us-ascii?Q?FIRMwCOxOovU2pryg6/VQ7AzQmdQkYhTXoBSVAEx/utgm1sH6qc4KNbs74vH?=
 =?us-ascii?Q?TqbM4gjZa9T+oykrHLcDF4b6Wam0DGxobBjHrENoU0IuwMPNUURDv9d7dhgQ?=
 =?us-ascii?Q?Ayc1guTMqCZkL3kMv8Hftv7C/Wp2lT1sI9YYzL+h6tKtK2Iu3d6NmkzYvPxY?=
 =?us-ascii?Q?fZK9EH8JiIxHpWWWSWPbA4Yc2mZLo7vjSz5gAFlGfQuY6Ao0RlF69juHgQsD?=
 =?us-ascii?Q?IrTud6WV96Knuse/Z2O3YL1rzSYA/H/zYw/ALmzTv2OQDo1EujuACQeHrFU0?=
 =?us-ascii?Q?YHtdOmcMKeHHsN5B5qXOqf9c2yUySiTNO1wCHwxfYZJ2JiXaGV0KsCKOb1ZP?=
 =?us-ascii?Q?F+3B+4cX107zaV+SeYTy0uEWvcsXLBlA0sFO0dr5+/RfDDUNMitW2d8453El?=
 =?us-ascii?Q?oLXdxqNqCW525kFJQlcq3EcdDiXtoPP578YtWxFzrcuy3X48aeVgttx70qtD?=
 =?us-ascii?Q?pcnJA9kVSZhTqTBkGEOWfgM1W+E7hyXXBjAIjwe2FxtFLcCITx1KkNUsScNc?=
 =?us-ascii?Q?2hE2d/Y08hJniOui4Yy9XLS+tHbZcEK3RNiRzmz8ZBbfy8I/NIUvmOtJ4DQj?=
 =?us-ascii?Q?PfN+i/1ftahuRVXoaUcC8KIAXcTFjUsgYhdxLnL9zB6Al71oDO3eMZUFuxoh?=
 =?us-ascii?Q?yCVi3p5qqM7vaBkIpWCEBjxfiBpRTbITyu3FTZIuw7ZQwAbcFUKzfR7vH2/A?=
 =?us-ascii?Q?Ef2CPZb5m37HndljuoaEg0ND629IlYHj8r9mTfNtQVfze3Jf/qdvuJrHOUjb?=
 =?us-ascii?Q?ygB1m/JF6J6VEOPHvyYvFqkHa978PeLh2QrIF8gpQi2sepEme2Qw553i2vdW?=
 =?us-ascii?Q?0+qVQAjXrr/RowJ7QEcnsq+Qy5wHFghxEshG3TsKJmKaOt5prX6VKEyKN4pP?=
 =?us-ascii?Q?PFQ5WsroeWX21cqX0YNreuemIRDqN8UgoXioQ2bYcIiLke6xYD9HfByTfOA+?=
 =?us-ascii?Q?CLw/fQGEV0/pV2fecNqHIAoApiK5xfFPVIOI2WD9x/jQsJCmrHlCU74jzi34?=
 =?us-ascii?Q?6KkdgSXmlG8pD8thIuf5yojQRvGamAWRLD85lBpSxW2XDNjwls7RJx+suDPk?=
 =?us-ascii?Q?Csck4vF3Kd8M7lazQqDDhuu3c7Xyxja8ER7GesYC+rCU2wSqdYkzUVmtAvc/?=
 =?us-ascii?Q?G5hZU3k0e324D7uNHaqLlkTU0eeNG5eqU62F850+6fbmvQHiAiWdLqQVKrBJ?=
 =?us-ascii?Q?PIrtzRiPV2hzTPA5SaDseD6jUfZ7HiWbYlhSSTG0cO0nRizZ3NgoR5DU7icC?=
 =?us-ascii?Q?DRnycGof05tzutdaRRWIVKRZ5vTWGgf6I9/bGrXWs+2Xco4F7MC9F6DdBOaj?=
 =?us-ascii?Q?2rXAb0shxSB9mqHyHWbFnsl5o2QgpjRumv6lw6EKoaMSoeUdFJ38G0pD4aEt?=
 =?us-ascii?Q?svLtlayNGfxsgoXwsykgKJiFI2lH0MmWs9ODdXLIjL8jiNKeCmIyWTM8xQ0C?=
 =?us-ascii?Q?2RxBrdehPZOeVueDA7vTFyvOdLkOyT71yP4P6BhKlbCd6UAbZPiU?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8045b79-ca58-4a82-54bb-08def3b5e19b
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:26:03.4620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCr7am0KGTc57A2rfSSEI2Ij+p6n623rWCirZTq7kx4eUOY7esRG71j/62o6yROhr2P2LkuZUTpTlZi2w0vVi65gWs4IUfsluT0UKxpRXSNq2D67lIcTdDrJ+/Sd9TFC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1207

From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>

Add new compatible string for Dubhe-70.
Dubhe-70 is a low power RISC-V cpu core from StarFive Technology.

Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..e7eda7a9c345 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -63,6 +63,7 @@ properties:
               - sifive,u74-mc
               - spacemit,x100
               - spacemit,x60
+              - starfive,dubhe-70
               - thead,c906
               - thead,c908
               - thead,c910
-- 
2.25.1

