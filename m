Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C173C141D;
	Thu,  2 Apr 2026 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128495; cv=fail; b=iajLWO29x2vwjBZ0Fz9QeFvyaZczj8WOLw13yjeg2N703TJpgth9TLImUVQXJfaKpe4vGMLREOiAHJQbcvNBOfnh/ZHbXIAxrLbakB0xU6DYM+/JKCw3y4BP/eZeVzEf/pBpIUjAkGwzTfGrJtF9jBh7Vvh0A4noPAGfcGoQMfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128495; c=relaxed/simple;
	bh=Cszf299t3whUzoRr1QmLhh38AGLyWU1UkIzo99XK8Z4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pfzyZbveQZNivHkUZ4a6E/QRvJsmJornWlQZMMdm7ZR622gkajVyOPtwEMttIBOPfB66qACy3qzFsW8+60dXEwSB7lZAQoZE0yr2WWQ/fuAgTE32BRhSXY6TYun+xbHlYNi09mEsJ1Ox0bhPnxSHB6wYpH41RAu3rCApUbrzuDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQeqILesUBihtgq20PLwOUKV3egGx+kbHFW/fQ56kVESjLsOu6vzGZObRr7qYV44t0hrLLGHn+/mbi4JtzGbgpEvXrSdBbajC1IfPxUY5UuKye0YHOKtdOiqaPlT05Idw6KHDdyOiwVT+YH98BWoXWQpCvjLCGQaHHt7LD19tPNuE5rhpMu11EKpCVcbducpSLePTcfKYI3x6zsAgkjaOjo3Mm1L9tcNNuHOYJ4dAYMAZFvOcrMsC/+o9+LDskdJL+b/3yIdus/7bxul4//sHGtA4OdTT+WjDoyOfpEanCq81lrJBEhJRQiihyKjpw1tJjy3RQffGB7hKnRF3TGTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOPAVcdpntAn1IWzAhvBcFGIFKmg130OeMuZSEGrtA4=;
 b=EbTl4BXDr+99B4IaCRW2Tw4RatmTD21iknid3nCSAFh9yv2nYLPCgkMX1djppoVjROPoLb1UV3ETJOJwEROCSPueLkFk0DPnIi5M6xgVCTzZ51hJPtSsh2vxes1FwPFZv69Z1++2CYikJVvwinIw8FBQQv0w1g4Tk6GThKIEFiYIvTH05AxeRXkXILjFj0uL6mL7VpueLTOY8A/OtTtOiqGUq5bwK5do82Q82AAU7xpCBf3hAHNIscjEYvo5E0Uk69fyj5bShmvwfzhtfJ4mrMm13Yty8dOCK7M34gOqq5OquYbqsgK6L5l2R9xvZBfxC6OFQstsJFO8zu1f/p9LuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1235.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 08:40:34 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.018; Thu, 2 Apr 2026 08:40:34 +0000
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
Subject: [PATCH v1 3/5] dt-bindings: interrupt-controller: Add StarFive JHB100 plic
Date: Thu,  2 Apr 2026 01:40:17 -0700
Message-Id: <20260402084019.440708-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0023.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::32) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1235:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a26a4e2-118d-4d17-5fee-08de909381de
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	cj7qlRrKKdLzBcyDQBrcgn4M7YwUWPz7ZO1WxVEZqM+rtOjqu7Kw0hgFctMOuNndgghWFrXFW1j/piLXFV+VLhbo8TPm+TjV3XCTlLHmYoZ1NWqbl+JDhHdPBCgxqYUdzy2uWsY9UEyLqQu3W0dqmM8wh3eS+jcf6cUiRLfbWtWcckN6zpp+AIfHvEpnDaSq7suLf+yxtlRHptb9CB7W1lVkYxfUOZKjpxkvx1YK4YlOlfGVN3f8/fD58O79swP1ABXnUZWTpsYlhc0hBrwCxfVDHGKIfYtWtlo+4xsQnfW8NiJn0AqcZsA7dP+Q6TZp1rsYRe6YUlloVuulI0vertA9RQUguOO36GdcaQ435JGDO2BGjlHy/AMeibzMQ5bgm+V9hU2Jd8YxUt4sZXbTwij6GxwzlFtY5hgp/joYAUFZ6aTuyTyc5jEAMh1YnWVYps6jr9WPREVFnEETO9lHvsjkedUAdk+Z7InSPzWVl0SUT4LMvklDp2mXZtN9rhO+pQcBhIzGX0a4Q1rNCV/e01hrEWi/SYJoOYMm6MhsS9GjWgvzaJLXCwrz464qXPL9tfwyTiKikdyoFxsoiD7hsp8zkm6E4cLlN0l4S2lLvQU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3hMgp3MuV/xYqMWQwp+ocLm9OOGBZxwueDShFbsK6+kU20g7OSMDn1/0057f?=
 =?us-ascii?Q?JWrT/eD0DxzbLfAFBpH0EOGOS8SO5lCwC8Lp1b8UHDbtJ7iKby8VSZhXso8l?=
 =?us-ascii?Q?1mrMPd01kaAMgUM17gbBCJ++ZEPWmWT5tsJYTBE3Tw+KG3WS+qHEp7iA+Suj?=
 =?us-ascii?Q?JYL1u+i+FJTa0pcPf6dAwfvFRAIdi75K4Tt5FixEMgZxzbVfkErDGfbRr7ej?=
 =?us-ascii?Q?nwD1ABbHxb/RMoTlnyOTKIJ8tryYflRuvX24hAH73yIioErgDa27J0BmI9DG?=
 =?us-ascii?Q?N5lXPWAFo9TapW0xb+18Saq++1crLapEosfrf/gZD80l1Ad4qIK8gfcpBrVC?=
 =?us-ascii?Q?M2oek+Rh9OX1KbVAripbmdfZQgmTgltIXaMi+aMD+vVOQsQZ2shQ/HUAZZBv?=
 =?us-ascii?Q?JGjRvT2igOWy+WxVAnbw2GOgN68mc2aB+8+RHYBzgERKAnILt1VimKG3Tr/i?=
 =?us-ascii?Q?ZCt+Kk+/6oLn9ahs8nB7Ucc0S1CdKjWUV6MR6B9Lo2br/E1F7Gn3JAXVxX/h?=
 =?us-ascii?Q?yQfmPJEx3whfL2APE0zl6j9QCk0nAeGpH6FYNbap/WnJ6BG3/rymx9dVTZGS?=
 =?us-ascii?Q?aduZ1mVRReKOLLPoL1LkvzWGUoT6EYf3sKIuFj2vnnLts+ERkMXNeeBbFuDQ?=
 =?us-ascii?Q?evf0N36eCI+PfTdPVihpT1PocunL1JgqxLoamKMTJ+evsuI0dhnu1i4omvMa?=
 =?us-ascii?Q?DCEO+jUBxVnvSnnlNv4uGPkZ+u75dMyHdkdRp0Hyuz5Mj1df+MeqYu/Sdyuk?=
 =?us-ascii?Q?q/YPeTVPvTpNplOflam+ixazarbbWa7szibfP4Y4yLrFbn3zz5wF2njPmGqi?=
 =?us-ascii?Q?KVge3vWjxJjLFQdxbt2Z9tlpJwvfyN9xUwpyhYy0bcsJlsu259FGJOYtokyh?=
 =?us-ascii?Q?LdTQZjRP4iYcvZ9uBZAEq7cisw8aSaVCZ0SSohRDJsU3zSSQHYa7o2WnOkdY?=
 =?us-ascii?Q?eRiSd9F7LMkrUpWYdmve6X/TriGkLlYiCrr/yNfWMydtORw58Gy6tv9QVggV?=
 =?us-ascii?Q?M4i78u1D424OlUPuMXR4nf3ySHe/QkNKsvAqoH7OUGWpIvCT3sH0A37Mv5zf?=
 =?us-ascii?Q?iHtKVAy7StbGorx1pEAl3yoJcLENMOHIM3/VC3zXuSW5N+J5PuI4Ral5Nx+0?=
 =?us-ascii?Q?fXwl3JJz/EbyDFW1UWEp4nTP5wuJ6xSXnWLj6ON4F6mFsPuIaTP8dkqtZAsW?=
 =?us-ascii?Q?MzPODd3UlUT2xg9kvjPhACEhuaHtvSjYBqzyAIqsG9gTKbRVkRyjjNspkZWs?=
 =?us-ascii?Q?sUPhbb8IZJD/GdlunalLwz9/3A7hsPFFGZ4fi+kD6/TFgnxmAIllFnIVYB+o?=
 =?us-ascii?Q?KMYbkHyFw0qzyeC8ztLq3+P7ipusZb+fTpsFF7hOIz6LKEXfUpwISmXeYgYg?=
 =?us-ascii?Q?JGgzdqb/4IyVKjFKHrpY9eW/G6xRxnCJy1HFiYXiB4dMO4oYTC8DHMhyQ3WW?=
 =?us-ascii?Q?E/snmm+j9FQZYdrYg/MsqU3RLF5q0RzUC7rB/twoTbYI1QynoprgTpnol8CU?=
 =?us-ascii?Q?hDn9RMCi+TVcWfG6ZKJVK3+26NBe0d7ruXYkY6MTz4uexMAmuCtu1bzQJE22?=
 =?us-ascii?Q?EJvQ4DApshRIuZsNNNv0rJX18qoE63DXjcYywcEfuXAwT0NwDU9mzYo49Ahs?=
 =?us-ascii?Q?o0uaVUbFb9zxco4ydVRbwF9OpHJSm88qKz3Iq89hqzEnN7eBpEUTHg27/x7F?=
 =?us-ascii?Q?NKoxt/+DtbEovZH1kHQ3fE8iUxu+wv7oInJA21KESCEcfVBozYXGTvvqPQKM?=
 =?us-ascii?Q?+nRv85ya3305XVBKe4vUVNnVgfjiUCSGBxrjEP/87bY8mkpsoW/3?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a26a4e2-118d-4d17-5fee-08de909381de
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:40:34.7453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjzxqHgNMmDnzLVvLtst8difyLWxkb0exTEYrX9S+4njYMjqb0f9Kb0LBCoucY2gsg84ZuV1WZ0xe63ngjTO1LM4iHaOGTpm6z9sv+LGteVqImT/Ub4lUDpqxpaqw+sK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1235

From: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Add compatible string for StarFive JHB100 plic.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index e0267223887e..49d63100bf87 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -66,6 +66,7 @@ properties:
               - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
+              - starfive,jhb100-plic
               - tenstorrent,blackhole-plic
           - const: sifive,plic-1.0.0
       - items:
-- 
2.25.1

