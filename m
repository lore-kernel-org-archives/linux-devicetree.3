Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2137.outbound.protection.partner.outlook.cn [139.219.146.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7B3C5DA6;
	Fri, 10 Apr 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813788; cv=fail; b=YkY8/wVLKymTg6z9z0d3TEsGxIwWWl5H0P0BPCODHvXs7gJQV2ygLgyixRSwkOw4IQY5fPBY4m6P+XNpEZyHRikEbh4rIuS+WUjQJLiZCCUz7cRBkfQOZxoyxJX8o4oZ8l1r4BA/ywQv0MExes6pGwUStrS49zm3WXmnfbYwiLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813788; c=relaxed/simple;
	bh=hqg5SJgcvuuW2m8ON8F8BrXMSmbQwgo2rZ/iJZBJ/0U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Odz9ej3TGybLcLSYYmRoiQhYNjJwrDlGS49mAJyIw7yqxq9BmXDtB27NV0XNxVoUH1OQnX3Kt0f2tciceNQvRwiknAEEHZG/eoQV7+8kSN7n2dmbu/hsxlL/rmLSKCSSN6Ix0NLI803xjjhbgl5UEKmzz9pVyoPj20GX3YtgBqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgPw19BgXWKJngDXSQ4uYuOKFPTwO4ttPDJS4F8HMul5q/fkeatFt8zYqQx4NwX2gkqWN7xya05DNKRCS091yGjRqdNFJauXBTcRcxnHaDUYrV9zWNkNLksrK7cFguQtbqnsWT27G5j8e2yFAD4rlutxSpTE7iVuw61mtopp9VouOxUkKgIlxy5FvCck9icYff0SO1SJq3QlTa9FywhP4fjQPNDg0egLrKj1uGx6oGbxue99w+eh6vrq9J/+R32O2ZMERBNb1f6X5DdybtEC8mHw0ziHjf8a6I7rj9+jDivkQ9KQ0ysuKbeIv4gnYixg1sID4O0htJJy6whPuLAySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ALqT10FsuMzvmum3euKKZmbOSU7+U/9nu8Xmh4dbM0=;
 b=ayyTc3GmMIgB/uGnarf+UaIYHxDheLshD+7Id/gJYVGluuoENCsVAI86nWqB6l8NbYcoS4qUYZIMneOV5ZRPqc+Cja7qqYHd3LERoAwaGLWh3fbyAtedrtqsmCh8GNzsZLKok9VaRsmd3KXdxUzCW7yKqR6K2B2JKcjj66h3gu1b3HlG5DnmY0RiYKYMZ/kWvoQHmXY1BBHReqX+si6KDaIO0pZmGXc+owr5AyLCGxJWzRA93+yszTK7FBQWrsfH3g7RdWVuUDoGT3GXEgji4QWYat6dKs+QPpy3QrQ6eOnKEVZhTeNITeofdjRPXmFvrD+zAWFQlZ5XGhrHoIv0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1218.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:01:14 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 10 Apr 2026 09:01:14 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 0/5] Add interrupt controller for JHB100 SoC
Date: Fri, 10 Apr 2026 02:01:01 -0700
Message-Id: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::6) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1218:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc8bd3b-c0f8-402e-cfec-08de96dfb823
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info:
	C23vM9yaGKYfbt73g/3/FzNEbBJbuic0+J40SpkZl8PZy/8PnPbBYRFQCIbtSV7LBmo0AK5RGnX4ZCyHqxDdXNnVVevuHbfqQ7tNo+7DTfT/aZ4lGlyPWMV2OnQsXGfJvzfPE1b6tb/ff7LLVgUjy5o4nGITcNxLvRlQRWgQcBnFZzc8bJE7ITY29GPoaqqPKXj6WqFzpK0xtmOYQpHp4Dc4h5MkI1BLYBXKxAK6u+yc/nWZK61G1GGvwybu19//uCqqZ+f5mJT4LbBXFWXOuS+We9EcFDPN5pV1GdchbbW9QwNCALRb2tu6o8Jiv4Thg8Mx/0ZbKX/gUBePBFYGCYSxm3lJQvK0yOfFuEQTS5kRHbILO2CaxKVkRGG6ZkinxvTQHYZWWnqEJfrux6Q6Il2NHa9zjavzkp9PSc49XX6td36k0YhZggDjJxSQdNsiAf5u3I5NI9wPwT7Oc4aLuGndcBMwLrJXBE2JrYkGCxlkRIMilSRsLH7DV+teGywZ2bdQcNe6yy4vHjB0NCixhiH8kx6ibdsegrTRJS51sd9gnF0ouPcng43gjs+8oyD0frTGgwmIwb/5se3fkafuzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(38350700014)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AzVnNlNUjvq8ukAfdg0LU8RzexBK42uIp8fJzu2bNoeZNlxOxGm6DD9fEdPB?=
 =?us-ascii?Q?Dnld5n/b1VRkAJblOFX6Jt7UuDzvP5IBf1E1Fd23xbT4yZ07y8VUbg0+3ghx?=
 =?us-ascii?Q?idqekBSY3+jhsLgK7fxG8BzmncweD0G8w0JuhCqg/Zbhis6Z23R4qgjw9Y10?=
 =?us-ascii?Q?9i6btX8zFsdzv9+NNVmGUiI+WSuBk1ZdN6heRUnc2i+qsZeda6rf7NhRgrja?=
 =?us-ascii?Q?nfKeLBXOc3tAUUk8ayQgrD4sX1l+j1//+wkU9pr1wBO6ZsTOPFYTIp4y0tVa?=
 =?us-ascii?Q?2TYveP5GD3grF9LA6hMswCgjGOe8TYvT0nvntV5aOD9zB9cykVSiZ9DcgYFE?=
 =?us-ascii?Q?vUc+pI8A9I++KFx/1x1Yfvn3VM1w+gBJTUiJcTVBUX7F8xOHjszl6dCHRKtA?=
 =?us-ascii?Q?cXNbi9YH7Qezq3KyzX9uL0/FSv2TMwRc5cTuhvkXDADWWHJyehpIGpyxgwNt?=
 =?us-ascii?Q?/JUw7Nh/I+SU+4jnuZIExdM6cjyYk2RjCOOpvS+ExqTf3F+cfk42HTHNiEb5?=
 =?us-ascii?Q?+fZJUKPFOTwHJwmfdvhzuIpSGPhtGLiSDjj/owpVoGom5GYnTvP6RL9Iwh+g?=
 =?us-ascii?Q?rNWX+NuechLOcOZL6PrUBS2DsAjweY/cE0VDL1dm8BRU9DMsLAm46FZUcBNy?=
 =?us-ascii?Q?w5IGuNtjpIgQn7dZ6L02B+e8VB3KeIlHztgLERNLezhQ52YurjTuE2VLMFYP?=
 =?us-ascii?Q?wWlCnwDJZXIwOUUMPrPneXP/AwNdFAkRfoDa3aUrXe2qS2jM0BkWBD+K2XHI?=
 =?us-ascii?Q?6zz0RkYK4Ze+sbAf4O65+eDjoYirD/GRrBw38HcPXd+cjmoZ658fsi0glPz8?=
 =?us-ascii?Q?BL4erdaceK9GwsY8O9u3fa7k0GuESfm2a7h0Ut0RZCntPvxH/9Hh04jpzH7N?=
 =?us-ascii?Q?XcdMqzciG/cN7V/L0aPF2qOY8DD9IKxjMNeSUGGKRbJwh+NbaZkhTB171SU3?=
 =?us-ascii?Q?RNfW/pf7ojBWNN1r/zTDWRz3TW3VZNSyvM4qeg9sfc4md+Qo3x0znT1oQe9H?=
 =?us-ascii?Q?FOhHwT+1s5JLIQoW5LtquAciMPqEivUdLGExJdT8HP+nQzNh180D9MHxXK0q?=
 =?us-ascii?Q?aFhSwwv99AEk9eaGDQ0PtBBqGa4FRwLp7Vfvt0wrutJPb3L2j7ETukvX1P0U?=
 =?us-ascii?Q?GUtODVxw3aVC7r5QUoGe1eUrFeO9wDjGj2PUGddFJrmqfvrncq+x21NgZL4T?=
 =?us-ascii?Q?3FI8LhDJJoyCqGx252YRtQe2zdmR83g67GTQXcrTSY0di1y8NIACq7cgCsU3?=
 =?us-ascii?Q?fjVf92Y9gDuKmW2MkJGLKA+OZSfof6ZVh9PDuX1seVUop0KCgG911e9mEbP6?=
 =?us-ascii?Q?3KChX+8uDT1pa1RxLoulxC2He5CCPbxn/wTVmf9+jb98BeGE5DtwThn5zCm5?=
 =?us-ascii?Q?DM6hFuoYxz2ogogrdZi1CGnk4gtIKJnHC7Fo24NMzu0ANNsN0BfpwKAjPeXJ?=
 =?us-ascii?Q?m+TqR4tZDyuWIckEomNQ2pzgeDLP//JhqGiEBdQ0B6lZlGi6uPXSHuNd9Bwc?=
 =?us-ascii?Q?ftJqYzjqF92o6441HkNenHZoD4ge6M2pwHXGNwG+f7SYZ1GY9YtN93oxQB3J?=
 =?us-ascii?Q?hf6yQ/6V33AxF0n4i00G890B5kp2qCb6YC4FGnK5YuvrDJki6Y51dyIMbf8v?=
 =?us-ascii?Q?N6wtC+CfR0+8hhvZU/wH4/PRzYwXjh+2bpsGaCGO79VKIQ+HFYJdRfFx4ETm?=
 =?us-ascii?Q?HbXsiiaiYmzBL/DijyX1j0YR8YE5Sj05/FlsLHRyO5Jr5t27EEcVVekEZv21?=
 =?us-ascii?Q?qn39u5AgahpYjOeqoI2/Dza5oMCKwSGdUpDPJKUl3sLZDgids6Px?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc8bd3b-c0f8-402e-cfec-08de96dfb823
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:01:14.6373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+cV3WJC2UBs9LRo4mnDODk7JhRRMo1DOZFfKxCCGVo/9BuG+JLW3mf9xrZ/dlQm8oVIkUefx9OL795Bb974IY//zpn9nn4naegpvArkrvscZrXhopsEyXLmG7yw60Tt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1218

This patchset adds external interrupt controller driver for the StarFive
JHB100 SoC. It supports up to 64 interrupt sources, and both level and
edge trigger types.

Changhuang Liang (4):
  dt-bindings: interrupt-controller: Convert the word "jh8100" to
    "jhb100"
  irqchip: starfive: Convert the word "jh8100" to "jhb100"
  irqchip: starfive: Use devm_ interfaces to simplify resource release
  irqchip: starfive: Implement irq_set_type and irq_ack hooks

Mason Huo (1):
  irqchip: starfive: Increase the interrupt source number up to 64

 ...00-intc.yaml => starfive,jhb100-intc.yaml} |  12 +-
 MAINTAINERS                                   |   6 +-
 drivers/irqchip/Kconfig                       |   6 +-
 drivers/irqchip/Makefile                      |   2 +-
 drivers/irqchip/irq-starfive-jh8100-intc.c    | 207 -------------
 drivers/irqchip/irq-starfive-jhb100-intc.c    | 278 ++++++++++++++++++
 6 files changed, 289 insertions(+), 222 deletions(-)
 rename Documentation/devicetree/bindings/interrupt-controller/{starfive,jh8100-intc.yaml => starfive,jhb100-intc.yaml} (81%)
 delete mode 100644 drivers/irqchip/irq-starfive-jh8100-intc.c
 create mode 100644 drivers/irqchip/irq-starfive-jhb100-intc.c

--
2.25.1
