Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2116.outbound.protection.partner.outlook.cn [139.219.146.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5279247A88E;
	Thu,  6 Aug 2026 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019191; cv=fail; b=gxdkwNxxUJA/7/KkBMcwHWr+GtSo1dOOZS7rqvIU9dSw3SaV6Av1xDIVWq0UmsVdsYI8PctmS9HHXNaXVHMkxFWiu7DFBfxk6skQ59Z2Zb5grlqLDg+SO1J4nvUyaccOb06RvVepjQHvlCr9zQlltBLuI03W+9ppk25r5eUNchc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019191; c=relaxed/simple;
	bh=WxDjNO71CLzLK20EsCzTCNQP+iwxCvKeWh77TrUN+Ng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AHLzO61Ku5WsgWJa0lal6kGROBjIi41Mx/RI33nSTwmFG8SUVOSj6jdZHPZruDWYqkOTDuTSdM8PjGjZk44H+uhhbZLAsrEeQjc0M6PVUo/Mt6E5j3WtWWfX1mQRd8aiv0UhB/VcHtpq+hSpxYrpbQ3jHWt9073ZI+b55SbWAxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/pA680q4OAHpBZeDH0rdpeUR4dyUBlSB8De8LQ/+sj7cRY60ygTcvPaLYs+DHHOrLRGGchM22mSV4CRGphUiYSvePbF5e6JofrVzm1aR4+dnh8sIVwFdVTJfXV+DqlF++jET/+DpcbwDbrpIFMQDJOsq9t2PTyA/dRQcAfhzT/3/xuoNunFPigTSrwmeVbjssK6/opFdiq2uR9WPm5a+PLyGKj0mRD3z02/UhKqQVTGKpZUjJUhS7+3P3On6LmYW6F/s+RnqEUiMDWupBbjskcNR9d8IlksCyoddU+Mgl1N+b0kI/g/7+k9IAOPTZbPPxrAuvDId9eIS452Vpp22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go8mFU4eckpo7s8S+BDIDaU7Q5XtpkBAAsoSO+brh2M=;
 b=VWE4I1gyifT8IZ9XEQ9/T0h3ErrBsrrwsrnemm4YLSWNchTAlkTAPVoYHWh9+itGjPn/X9Der1Gn+FPfVxFIsnEkMzJ2pgXzw3L6FsgAXI9r0OJ6iadQy/e4eqDjNNwUIo4qaZ69rlBiNqYMIzBzstl6wEMHM2C9BOr+c/OnTKFqTxKSlReD+WZaLBf+AnTfbCAbM/+480EJgtmdJwpAFROPV5GAnu3WCvzb4ZF0nY31nMcxJCjXKRuk8jS+5Tad83LplBmiIIw9QQqCE8Mix5FGFDZZmqRQKVH0iLMoZwU/WhLb0FUfF0iND1oNxjndnHlT9DLAHIqvPJ/tLDrb2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5) by ZQ0PR01MB1207.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:26:09 +0000
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 ([fe80::63d1:b688:cab7:50cb]) by
 ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn ([fe80::63d1:b688:cab7:50cb%4])
 with mapi id 15.21.0292.019; Thu, 6 Aug 2026 12:26:09 +0000
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
Subject: [PATCH v3 4/5] dt-bindings: serial: snps-dw-apb-uart: Add StarFive JHB100 UART compatible
Date: Thu,  6 Aug 2026 05:25:52 -0700
Message-Id: <20260806122553.182449-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 72121477-6093-41ce-50f1-08def3b5e4e9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|52116014|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	oVszVKTTBUd/+1YmGoXFtUFYrY8ZByD/fHaIUZj71QEmIzoXlfB0SRqQtQfVqN18dp9N9t7LZJBc7oP0HM0oI/yWHMCs/XD9tT/dKTMeFgAKervub1fVReMbu9+JiRghUOvosmXte8UKoMfxy4Un1WsIMGQ2NKms9sEPeY4/fOgbBQ0z5w5kOfvpZmhp9+fGTd8JZM/mHtjFlxhwGHyXItr5uxoPWG8U5ubzK7UIi9IQm5olLBg9XyRxUgqQfPmdOwSK8lPLxEPBI2TPTERD5ZFoEgs6mLSFZFsCAuhxIPSXL1YfhNqmj5J+2kYrMgYNBYHbOMJAaSUhkdBLpALuuNeyGvUtct6OoBFysc5liNbPlNdmmcGP2Pg3H3fHpX27JqjqKGWsWMD7ZW3kl8xZCEJ7fvOB8goTBgTo5yrLyQ2T9uLc9J5+HJokoD0t9O4yZkRpbdKJC071TswasRFc6yOvyglyW+Omjx0qvK+YjmiAQI6FVIVZcI+BCAG2+RbVZeJbHT/Ld4eWZWwb/vyPO48PZdBLzMlPYMmik+615eieMIiMOkLxvudfQpDRXpYvDgHXbYnArzxxeS225upIQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(52116014)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GJpj7pK/X5fE5tGNeV3IxbOESwqQOkGVpMj3xxaJcOJrA1lfaC05B0NZ7YlR?=
 =?us-ascii?Q?M0l0uvntJQ8uU3uRfMSNMoibbTK4xU9yncrsfPyUHNTMVKbbRUgfAtUcObV8?=
 =?us-ascii?Q?byGxhAQP6HDZ00jnCi1ikroTqnOHXD5cmPGN1H2hC4wDId8HQl4tNTDmUuLn?=
 =?us-ascii?Q?LrTO7i2PSTVLhy22A3AMAWJGA1GUUU0P1kdPLbJ79r/I2X1h6etWg0Kpxg91?=
 =?us-ascii?Q?jNAMtYgN+1tSZftcu6qB6AbIBukM57TQhTnxuD/cD1eEpRTLEVNCiYAlMJi8?=
 =?us-ascii?Q?uOkDdVHVrRN8a54infNsVpMWl4okA2JduCnrpfSqyNvG9CKsNeierM3LV0mr?=
 =?us-ascii?Q?7ZLiWRLLMP2Uo1a4LQh/W+G2gOy+eOCSgy19ABXrfr+LBamdaUCh7z2j66t5?=
 =?us-ascii?Q?eTVq3MQzjdjZ5nuF3PAHYYKi7RF2Ii8nBde6wQW8Y2yjHuE/IxEuqSwZ6TXV?=
 =?us-ascii?Q?JvRNZ58szx/8UOEqoGQywonvttTN/wrX4kRq31p27rTHqvKmsDS87biqpoKY?=
 =?us-ascii?Q?KVpk5gVnT8vSa2466QeSH142V/vc1u5ZKRHAKGApMDB0MskwPN/JMWKfiVwz?=
 =?us-ascii?Q?oY7QNeuzCxp/6AtFNTssd1dDH3bxlnIG/vmOjqCRYfr+Ks7rn6Hzl1ufgfK0?=
 =?us-ascii?Q?PlMMr80/CamoHOYZvcI2NkpVhZKpGusEKoO6kpGB5z5oU+e/2Mvgeh8lWM0u?=
 =?us-ascii?Q?NIwPdG1Tjfl9yAze7dXhrYgZY84W03+PaXSCl+q7W2qw79uJdecjZ5tvPgn2?=
 =?us-ascii?Q?uv5no7ViDLO9T3W321Tzntf/fcBliSjZNSQP97MOAlPm1u+K5P2/kMfS8GQ9?=
 =?us-ascii?Q?evgTY0NGv7T9ORy7byarOin5Rw6dCPULtOJsNtTdYyY8WITAbFjLtvx9ROGa?=
 =?us-ascii?Q?KGJt6vPoxtePbdLyRzNpi9+6i748q3DvkipN6GJpoJ3RNtoQzV93PPLkZKrN?=
 =?us-ascii?Q?h0vxdrCfN3KML+sEQgYpPI4/s82ETV1XBFp8DKT8T2Y8JATqsQF+UNruRJaV?=
 =?us-ascii?Q?kqJbKyYLjmUQFTZtYj7bF7T2I7pvec4IYyQpQXAFs+cNw7n4t/aCKf9Uxfhz?=
 =?us-ascii?Q?yNUAl+LtmMVAl33MRiU7X6ua3ig0EQC1xnKy6jRy5zX/rvR4plZMokSG/ZIY?=
 =?us-ascii?Q?rWHwZufKyPdX6QV/om2vpAMhgNYulkMC2aMcf5PO/HviMXu697RjZ8flCgxN?=
 =?us-ascii?Q?HL/+3rvHtRAJELmWbFSQJ2aa93OxjhNbMeyTvGktsi6yClb8Ir3zNuDqvvu7?=
 =?us-ascii?Q?0JVj3g0842E86pbzZldcZapNvjz0wukORIZ2mQU1gIbDTYiETOO056fe9SEf?=
 =?us-ascii?Q?YF59Xqw/yYnxatX5U4ZchT9lBxZAcEHG8buO/g8Vr6Fp527MlB1unPsNCP4i?=
 =?us-ascii?Q?alvQpxYC6VdH712ziB3j6G4sBNl4pA9VjjWA9OUo4FrITCDYvdBKJzKDp3tD?=
 =?us-ascii?Q?7iTgW31XHEawcoYh6q6Ian2TWaRSI1I8KfTdfUHhJ3FAM4pQV6PVKISP2lFU?=
 =?us-ascii?Q?Jz9ogfeTlkdVwbQY+VdFIwPOJfbBDf5uDYHCDAcouLMQLZwdAg3HfcC1/5AA?=
 =?us-ascii?Q?eg5CAccDpw2os44tanKLV0pSLZL849J5iSsB8Ajjy5Cgk+rzPT/to4AmMzdL?=
 =?us-ascii?Q?L9hLDLBGYPp0/CDVuMh4dAYD6s7lHYTyB3qYLjgy9K+ps7HUjtNDmkuKDuv2?=
 =?us-ascii?Q?mOYBMyK1W8e3gKspY/xmwiqjcav2xmG366AvntT/oRwH4r4oFJ9mGF7CvX5+?=
 =?us-ascii?Q?9lZ8Glj/aFZUCf44kKXxs1qavg6wytSVJOe3gjrxKIuhvQMams/F?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72121477-6093-41ce-50f1-08def3b5e4e9
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:26:08.9348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p18OMtDrrxA69FqhBE4MH1BTw/pbKTlqtgzyWXMPQMTxsKbciwcPziQ7kJHrAIGyvPnsyZK1qtUWH5aJ0glXCh+q2K0QL3dOBR11ijdLo3HMB2JClBtOBhGYf7zowY3B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1207

Add "starfive,jhb100-uart" compatible string, with "snps,dw-apb-uart"
as the fallback.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index c0d0524458c1..f90ba8f3d4f6 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -79,6 +79,7 @@ properties:
               - starfive,jh7100-hsuart
               - starfive,jh7100-uart
               - starfive,jh7110-uart
+              - starfive,jhb100-uart
               - ultrarisc,dp1000-uart
           - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
-- 
2.25.1

