Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2124.outbound.protection.partner.outlook.cn [139.219.17.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D942EA480;
	Thu,  6 Aug 2026 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019180; cv=fail; b=qt/0v/2MzAXR8qQrBKLlnaa6kWTxMDpS8F/IhN8PnQbxJiODW9Op+voFacj0fk4/48z+iVAXS4PFJ2U0OOad+tQiTu0S7Pl0+fTSsammnGDaAPkwIIWaBxbUM2yrokjcqIjWVH4ooQl/Z7OFXK8R1CWicj1GyD+MsrlXemKaZcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019180; c=relaxed/simple;
	bh=jotbtxFwMhPj7HtznbCA1IDk3LCg12qzH6w8sRM5lys=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=izwcKElYu1/4UkC3CXW+7MVh9XTKHHRzt/T7UaXVp568snqqz34vVsjK60arFRIx6yCgJyK7DWlFguU1Jz1f0frQUlesHqE71QKJvz4VAvq0+75mISpIys10hok0tZZCCi1Zv0GeVkuDCmcM/IL/EM8aBDI0QJrn2/sT/wK6VFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBkFMoHxMc0qMnvhN1nzEMqgl1jbIeLsvQ4acG2l3qfXOLZY6v9qLPsMV5r1WJXgNPwHvPHUMscj38qr+UCyCgmniAJnVb6TM76tSNWIRP2KiX91Cpjtcu+PE2FM5AKkmYdpGaXTq0E6xPLy/X6C/uXJVljhPEA3SgWvTDWzmSPoMetdyUwGIl8dc1p2KN2+JVGU6wOaf8iAbW2lFjOzDOYoeU6bLq2Niw9/A+uqIvpha2jO154r/X0dnz0JWoMPIWOErsxNA3M+7Gx0n9k2xlFKM/AvvVBnBWJrDjzLhP0HG+zlvhiMnTkYYaeSHSGOH2u89RipNzUSbpBFbKW4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6scXunvprRPHeCMsCKiMyeIGXxpBRyQbpS9BeGrrT4=;
 b=mPenrVMcfzjrlC7FvEzLiTGK2Lr2oaMXH/yLvgDP/F1i0+qPGT9KLwvOtq7luRUyWcIvdqe/utKUI6TqBGorFnZbDM2cN3S41mjTvxViiYFY8YeFOKM6AIy4B2BNNeejQxoPkI81LpxYL513YA7ATuhOX9gR4fQNFqjY9q70m8uIRDEKXi+xxddfNIoOeMXuOgAJkwhqeP5PZ7u3WlN6Vy1x7JlZWoQ2wLyD2GDX4iW8m6gYTPkdnzuGxEOdKZ/qaR+YXK6GRYecWhYo6Gipyy2lLb2XW3B7bkYkH2O+B5VJ3ddNQil7rDBKwn6/jv5efbCjx+rt12Nz5Ldv9icLkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5) by ZQ0PR01MB1207.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:26:01 +0000
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 ([fe80::63d1:b688:cab7:50cb]) by
 ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn ([fe80::63d1:b688:cab7:50cb%4])
 with mapi id 15.21.0292.019; Thu, 6 Aug 2026 12:26:01 +0000
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
Subject: [PATCH v3 0/5] Initial device tree support for StarFive JHB100 SoC
Date: Thu,  6 Aug 2026 05:25:48 -0700
Message-Id: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 6a95f735-e568-403c-1d9c-08def3b5e046
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|52116014|56012099006|10067099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	PEoj0+3hbZrjXuCDh48QseIBKttb72tNljb4XL8iwQauAkQxBy468EVu04bFbcgKee/DSaj8oFNsQ5RrQQGAZiBVeu9NfDOecxp5/XooQhUX2KtzwpldGjg/w0L92kPXvqmm/ED5g5yZc17iC5015YFx7gMc9k1bXh9KsrHM16mfaoiP4lXkudMzbdP1k6xUhgkvx/fOhbYbUHzReiATh81SMr0TaVGJ5cJYf0lTcEJ1wO05IFPnMfg5jMJrUO86Skhcy72kBm4EnK/sir0huWE/RRNyWbsnq4yr7TsfL6LiLRPGJ9Pdxt5cU1KASR0Vr4tqI8kFoXIf2H/2GyEWL+6LdZVtSNCGTVyFQmY1MfWF/+Q0M1mLtw5BWp9JADuUdjXxVxggsgzObFNAfsrbLDWD9Yym4pTN/ld3ZTxcnCOmSP4fQjzcxPcx6lU1q6ELyz5YngJ+TOkfod77erWwUKxQypUID5osdo8NhgkEc3Ume+c5yJ3Bo8Hj12e9SkUb+l+cgjcSl0TKN0RMCBzbhTvFtiVnfVyp0g4bQlKO/Zm8WE8lM+7HPPYfH0NhS7NX89suZBsku+vkRblKopr5Zg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(52116014)(56012099006)(10067099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/TDIFArkcJBLXiYKo0H5QL6xce7XxjJylIddW9kCAjWiHCEetLk1LiWZ7Wzh?=
 =?us-ascii?Q?Q31wT8RdvavT9eceD85ZLG0d181VICQXLomYqTERTuBQu3KWLh2vBXURBGy9?=
 =?us-ascii?Q?KTomA+JHEn2GItKrEPPZohNsq/XXI6pa0LoTG51bahXHgDKI2rcNXxYsuxMo?=
 =?us-ascii?Q?Fs+1kHc062xTYMgQK9OI/vDP/6pfNwgFn8fQghuwmIB7CfZ04monKaW75KTk?=
 =?us-ascii?Q?Pyi5NWEXxdq0SRsrXAxrNojGu+utMQaVFiPFsJxAFOlOp1z4PHGH5usavKfg?=
 =?us-ascii?Q?k0YoZeW3tIhD3z58PicI1eix16DgFD4HoopNd4B3AMhrCogxh0eufSvUVSVs?=
 =?us-ascii?Q?P0CMtihWbYcF2jNjz4SyW7IvjjOiHHJvHvwLTqxLvL/sgvKbs3lzEMXCeC3/?=
 =?us-ascii?Q?c1x4yOP/TUddufJ3/H45DrfCWUfKWz5Di+ahWlhgMK9NGrIWnWyoIW8CUJwN?=
 =?us-ascii?Q?OUbTIeiDNMpZvX5wk+CzJnQKDScyLGurVgnceUSypdZh3BI3e5wgpSqp/ewX?=
 =?us-ascii?Q?KJ4fGS0Mu+xxxPEEF3spu+ArOX4PuBxp2MyHym6PKe4gexCp38KOmjFftrCK?=
 =?us-ascii?Q?c6rLeF96LR9TP4J6Uq2+caDN4Jcu7tx3ef+m0PsS8MRfHSGQqy4dlyBMUQyH?=
 =?us-ascii?Q?stsiO119P/k1xZX7z0z9G27IxLXXlvwLZpusI9fIY8p4AFXySRhimF2Sba73?=
 =?us-ascii?Q?Y4JDzY3k75YpsV/Sb72LvTKpNpwPdS++dy15RrV1n/Du7nX8aN1KxR2c3tg9?=
 =?us-ascii?Q?Y8oqrvvNRjphw9MhZijbR09Ymgj8iDCQm6jwDzvxO8Mmudd14qp/iXBmgFDG?=
 =?us-ascii?Q?TX9NJ2H3i3o4+UrowTYBwMTIbvxEHtCA4P2b0kvoy6/bbXwsJodsAD8o7gTm?=
 =?us-ascii?Q?WBVcgV+NTw3mkgA4XVjHm5Qm7CVd1WsdSmziYNCYHynnx3qsKLwX06EZUGOL?=
 =?us-ascii?Q?Y0yY+FxDPHsUIoi3L8YnVdyosxLgA9Km06n1X7zf0Hz+5ofZ0bfhLCZf/u+y?=
 =?us-ascii?Q?LTwkl6ha6Az/IjsH3XPer2zcMfYiXrLGfThyof14wguRQqj5vRSVa0E0MymE?=
 =?us-ascii?Q?33rsv4QeP3yVr8Z7+AGng4gQJgwIyFeRwBwqAFCnbKdOmioJyp4uibsARwqY?=
 =?us-ascii?Q?j8qokTV2L8MPYAKzE1JW8dYp2iPuAawJOFvlo/b32QIE4LVb827UOyIBsF7W?=
 =?us-ascii?Q?0YmAbha9uHlmPEDWqkpcdxGoBK4U4uW6fA4yZr556Y0z8LkvAddFMIi9WiUN?=
 =?us-ascii?Q?Se9qb9MrSPI02y3fEzVIAiIxNY/IyK157vLd1ebUCZ0Jq7A0a0bQK+FXifkh?=
 =?us-ascii?Q?5Sn6RYA5HevuZm6l1SFPz6Knh/1AJ46zRbo3/+jRf9745GK0SYiwAyIQmmGa?=
 =?us-ascii?Q?fel4+Lq9jdf473G0cVHbbox/jkVakZWzOPHe/ACBUoRSoBkHPz9tdPpoqfk1?=
 =?us-ascii?Q?u7YRSjk6/gXltODg9olPtJ2uMCLK7QxEzSUbolijH0aaPubpnZGoiBpfouGc?=
 =?us-ascii?Q?M3fxI4gPcThn5+3KPV9M+0crn59Bl5ghGP4qK4X5rEcSzUb+poZpy4HAK07A?=
 =?us-ascii?Q?m3gCOWgZe0tx5/fy4nHKZrK8Z/UC1+EiXU4g5x8KEpWnnDBc8bRMPb/IhnA0?=
 =?us-ascii?Q?oK3v59bu+9QCJSQ5v7NfZBbaisbmBh2f0IlpMRpxsfO4c9dbpaCRfrh0wRGp?=
 =?us-ascii?Q?ZZyH4CdREKf+8yPJllxbdHEB19QTXrHRuGk5D3SHFsenBfKay1zhVTl7N4f9?=
 =?us-ascii?Q?ZjDI+yEXNLRIdrCPYnHzgp33RV648zoYsmjh3e1iPVOMzW0aibkD?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a95f735-e568-403c-1d9c-08def3b5e046
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:26:01.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckQm30wOftaOJE1wO6QG62Y3gpeFeroZ9/Htm5SC/WjEfkJwC/mUSHL85FgHni1cKGAgrEvtjWYi2xtH9qKA24jdf+T31eDLhg/onYFtYlMXsIOri4o6ce6BkKUUNCMC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1207

StarFive JHB100 SoC consists of 4 RISC-V low power Cores (Dubhe-70). It
also features various interfaces such as I2C, SPI, CAN, USB, MMC, Uart,
etc.

This patch series introduces initial SoC DTSI support for the StarFive
JHB100 SoC. The relevant dt-binding documentation has been updated
accordingly. Below is the list of IP blocks added in the initial SoC DTSI.

- StarFive Dubhe-70 CPU
- PMU
- PLIC
- CLINT
- UART
- INTC

changes since v2:
- Add a new patch 4

patch 5:
- Remove the 'riscv,isa' property.
- Add 'starfive,jhb100-uart' to the UART node.
- Update bus node name.
- Remove the interrupts-extended property in riscv,pmu

v2: https://lore.kernel.org/all/20260506085937.754808-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260402084019.440708-1-changhuang.liang@starfivetech.com/

Changhuang Liang (1):
  dt-bindings: serial: snps-dw-apb-uart: Add StarFive JHB100 UART
    compatible

Ji Sheng Teoh (1):
  dt-bindings: riscv: Add StarFive Dubhe-70 compatibles

Ley Foon Tan (3):
  dt-bindings: interrupt-controller: Add StarFive JHB100 plic
  dt-bindings: riscv: Add StarFive JHB100 SoC
  riscv: dts: starfive: jhb100: Add JHB100 base DT

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/starfive.yaml   |   5 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |   1 +
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/starfive/Makefile         |   2 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |  32 ++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 331 ++++++++++++++++++
 8 files changed, 379 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100.dtsi

--
2.25.1
