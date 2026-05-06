Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2099.outbound.protection.partner.outlook.cn [139.219.146.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F2C3264EC;
	Wed,  6 May 2026 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059931; cv=fail; b=I1mkYa6/CVqGPFaancnY+CLYYthtSz+y0Ebcr3VUyMBpjDW59Oh3i03JjJ7dWHTPrVpBLkV6gRGbkLW2KLYCUUp+HERg8r4/xKJiCH2em9nHPCbl7V7QXgU4VOkh46QJmMkYBA39y34aE+EeyXCBoT3MYSwkfWsX5C9vDlfS3gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059931; c=relaxed/simple;
	bh=6QcTNPJmHWkf2lkoDp6FO6tIYZvQRDJ0XSgsSZ0Iiy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qVkfhHwDFp8jiZJ1JC/S27QT1x6YB/lnj8nf8GvwANNWdkDziiFOtAthMc40+fOm4Oz7oLLz8r+Dywe7xHSLgMuittG3BqMDhwKn+J7XRPFBu81JEV6YK1GdsN3NhBe5xY5DxSSdbJiMIgE2csExw1KrzYc4ge98/YmT8g1ILMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKB2SB7xjkHrhvDJcushcVWHu9mqCXDNMa7scStKkwUBuVbR9qlp4Rok7xfv1aWmQTPmerIAZAPEJaW5VrhirpgJ4+dMQECTALjKuz7O3ql9FsksQKSMTnrWu+kSFabCvHch2pLAWzYhuoX0BUpojC+73HkJ+7RbQaS8pmhDdcXhZM4ufP/6NRIV+InOICz2VtBdIQmVE5Uhczry2P0KfO11DPTNz3EIiznqpb4VXQtMqsGaGuckdQAy/FeDLd18GRW+Qoc5NserpwVSz2TnvsuzYEobvVdnXx7QkJjBRpTeqOZtHlvblkT9WKNZixl31Inkr2mrqM1SSbNRURE9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhtxvVHayM1nwUWvNuATQFb8QXkeN/dv1bOwKWDH6to=;
 b=a6b/YKIdsyYX3QbTKbAZ0yuh2B+tPloaqwuMfuibFnVxOEK0IQH7QpVdXc2XZFcdLr5fXmXC5YghFGEqvoVVxbQJOCXzoFZdyF+y+tIgavewoJazOA3tddoQLrYBjsbnBwkK+UlPaJtNviYnFv4ZUos2EBFn60bF7AVjVDFhenM6hac3w0vh/kEyc4dRhkOy7S9oT7E45XJKinppr4nI55VnicTuQvruKLOTy7QOt2s8b9a4FOpO/BrnmbcF5CdhKo8nSTMIARoMAzjEw6DPvqZ08jNYhpD/kClocGnEMh3IbyKqNzcj6BUR4wNB779EoLVyXAvY3l0kC+XO1VYVAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1155.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:59:48 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.008; Wed, 6 May 2026 08:59:48 +0000
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
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Michael Zhu <michael.zhu@starfivetech.com>
Subject: [PATCH v2 1/4] dt-bindings: riscv: Add StarFive Dubhe-70 compatibles
Date: Wed,  6 May 2026 01:59:34 -0700
Message-Id: <20260506085937.754808-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1155:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f91e176-146e-4f32-2789-08deab4dd394
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|921020|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ATpRKulZTTk5jWhCuHsYzlVvodInZCWvM+ZnA2ky8F7kPZcl5w0xPwx9PisMLl/OwrpO1sMxQXnyD+4XAOOtJVIIs7xluJ11Nmf1F8EVKHN+gPHI62hSXo82aHUHvke0DNZWziVCq9N2WwtihKxBHo+duYBtc0YoF5YeUZXbJmv14IDTn1UW2fgy2uRcVGJKVTcZOmzkKZKPjLUMuD5YyZpJ803JC+BA8GVSniZXLBTnsJeAABVNurtDPsqFS9cBBI1X3sMWqofPF8CAgln14gbAKoReMcDxeMY45123v51kOSf/b8nvinL2ez7nAU/TK7BKxk2K9LM/pmD71ZUCU0m1gAlQ724iEEoAmw23FqlGV9tLBFqGFUGdrkdSL5oLpNuUAnIArDYGQJ61ZNXywDgEdPNH+eDZ8Mej9CmkapGEVGKlgoHfPf1nRxnypyoGPuTv45KvgFnYDtmfiwywswG7gwjw64ssTmourv12/cHDVwtlyTgNHt+6FYUsVSxBy+q/O/1ng61zNuxIK53Qh+mrQng3Z7r6gBt1dIrRkAK16Lufuv+N31qmXEZUs2s1YicKFqB1B/K2cVwSSIb9fA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(921020)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?INiDo8mQZfWYriViGtfqZb0eEjyWiZ3r+Cp46FzpHXbnJPuKM4QlZvDvDStv?=
 =?us-ascii?Q?m9FAVEAlJHMMM/6e5mScXSxOfhzdW4FexhnurL6iWOsN+zEyBOcKD9l3I5BH?=
 =?us-ascii?Q?rpDc0rtFvkmBA9fxJ13HO8mXuwK5+iGU0HsVOxfWHNvwoqo7ZN+6Yjyj1Szp?=
 =?us-ascii?Q?tsg6OaR+MYTL5n1njTraWGLZX2hZ9J9XxoX4pCQZQXf3MZQLi1PIaK1mD54Y?=
 =?us-ascii?Q?aSWI2Y/EdE99DjoiVGsA3d50EUojSyYg13g/5qTlDoJ88ihR1rs+zqHv8sK6?=
 =?us-ascii?Q?ZZvBrLQpAkg/vDlTtjEXIdEfaZ9yn0okRmbdfbZlqYQkCqWVLsE6rs2S6b2T?=
 =?us-ascii?Q?/wuHYCCozrm8/0axhQtVm8Zu0FIiG073Rbv7788lbhpCorKIF6OIuiDiWzkV?=
 =?us-ascii?Q?WTNJuXRodzaJKWh4eyJzx4Tj/DlT2hFKOW/usliW42GYtRLNoDJcVgX0DML/?=
 =?us-ascii?Q?BFKA5piWGxfkcZV33/y5t+uoiw9CM64NS6l84Nmaeg747pI2DS8s5i3Tx9Aw?=
 =?us-ascii?Q?2WZmwctWwwPUq84r+xhOy38yhjon1IXlbmBRB5kMOBIw7K9FDaZ6mYXyMYGC?=
 =?us-ascii?Q?UGc0Q2iBQtgXzzjUJmEhqOhS7yurN8Nz21ftAjVRFYkmci6V9ds/Xq/h/64A?=
 =?us-ascii?Q?HRgrNPkxEpA+kDjDHCOe1U/7/NV3n7h1pmDYPcsWJOz46Bp6EocrA5BWqRQd?=
 =?us-ascii?Q?izlrEmyvGoxVIn9eBSPtNddvspbGhCpS5ZMVdew+NEhDSikGJu6U048BXQvu?=
 =?us-ascii?Q?B5ksGhvchKx3K1u2FweWkDzS+macBNSDiOibLAxfzFPEbKAGcstdCo4hp1yu?=
 =?us-ascii?Q?hVOQUGowMrYAt2Rc6byR1URTAzob+BtadbHOIEsCOhsaw1b9jEtjxgnmoOnv?=
 =?us-ascii?Q?UrcKSGMBd9SWGK/A6+TV4b16U4RgIuFwvxaIYqqcY8qRD8IRquLFJBy4jFnn?=
 =?us-ascii?Q?2J2pOgZuEPa8NEjvzGeKHpN2Crx25iftkkRg07ETkdufMsd5bCR/TchXVFF2?=
 =?us-ascii?Q?/FbpF6agcthPVAtYmMu/6R1CrUjCeEpB6+t/O8wVtF75aITVD7BSC5KUmKzm?=
 =?us-ascii?Q?P9GVP2uOeQ4jH4Jl9xf3GoVKuJ9Qf0BCD8P3XO5f6pv1kmEZHrHTCx3FOLz7?=
 =?us-ascii?Q?of1FZYIttnKQXNinHeDMb+xCxGMPomk6GUgsjemd9ceN+4CtiR1hs8b0qDK/?=
 =?us-ascii?Q?/M5WfkwGDoc62x5wf6jeHZRbBoQYQtfJHHCRgF91Cw15Jjik/Gl3lj3gAoOK?=
 =?us-ascii?Q?e4LWe3rbpFuiZPHcS4t686F2k7WiVFTFKRs9r83TxsX0RvoSKdbB/cpf2UH1?=
 =?us-ascii?Q?7NAg6zPwhFi+PSMXgLHcSJ/vFWRsk9fEPyI1A3RGpt2n57D7S7U0vQnk4M/l?=
 =?us-ascii?Q?i50HBrO/3aMe0i2Z5k9/u9uYkYZg9hbi2I5i61N8wcmv21mY5YSWSJ5++lA8?=
 =?us-ascii?Q?3izUt38BNodObHfW8EVm3SPno5mVkZb9qQyoKzvKZbLjsgMSDTRYTQa/wtSk?=
 =?us-ascii?Q?E4Lqs892vJkiezYP3IzTTkIjjxFqJhToZuV7xrlliPBCmOA8tkSiItm4XMfK?=
 =?us-ascii?Q?31T2VJ4ecs29eLdd1/jD9vdv/cr/B9hSWtUOpBD4Kaa13rPswTbZtmxug9xO?=
 =?us-ascii?Q?pkmRLS0HYsL/UUD1B+ZTrf/wjnGC67TyN9YzwW+x2SEIrdrP6XvSoK5pIp5A?=
 =?us-ascii?Q?+CNE0jZ2/iMDLy6FL9DR9mDATsJwBjpDHkdKV8H0SHVHU/H65uOgY8RbH3Jo?=
 =?us-ascii?Q?VxUkrbv4lJb3WGQr09N8TK1lzglN9MzyoYvx5srY6JH1lj2aEo/r?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f91e176-146e-4f32-2789-08deab4dd394
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:59:48.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKzh7SNJFBOWQhwLZqmJ9uLyVks/gck1GAvK9qsjC8USqapXTXZ7yQPkb+sDFoullHNFievc6fCwp4d5d8Bc4NplrFOZVu/xDrpvpKsBcOHW4UIrf+k3LbY4mF6VCR74
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1155

From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>

Add new compatible string for Dubhe-70.
Dubhe-70 is a low power RISC-V cpu core from StarFive Technology.

Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
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

