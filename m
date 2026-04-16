Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2091.outbound.protection.partner.outlook.cn [139.219.146.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB2C78F39;
	Thu, 16 Apr 2026 07:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323022; cv=fail; b=l4BfXobMy3DLL1XnCXJH79xyymBMZl+jqhjHyuubvpK3kIZNRa7RS7Xi88gotGvoj24v70HRsiHG6lZjLUNtfLGIkG7YHV8mnwMp9Evv5hSAOEgf1q1aDwzmk0zt04FSwkfybCwWwdhwMWmn6Vv96LRDO3bw/K6bT19WKc/QHvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323022; c=relaxed/simple;
	bh=cY7UROBu+5pyWIQGC0K3sQaFpS0JSteilRkz/rDm4f4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TqIfFGPHbilXYiFRXuxRHGbr1WyRTfq25aEpF3rhIgGSEP3nOEGTyZz457Gw8zsMKTnvlrNQ4vbBS4p3OG1GESWgqO4r9nms4jRxsvgEq4K4NRhEWyal8u1Lxrl5ca4AkHb5leiKbUeEwlwqq6IM0lnXwHRJbOwTJDMNE12sOHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mz7y2F2t3J/K9x7wnHG0Pio1iYAGUrPOClm73Jd7AOi7fLnnOtR1W+DiTDl9ix1NjCW6MEXUjS4a4FEZuWqlWv/wrc2egg9e4YMeroeQTvJbaKtvhYWIInVuUBFefFygA7y26I6tO2Y3W8Qw1Ii7VXK1XpYfkKWJRqyRq+j1DtWE8zzikY+0Bdj71qkrYOp+kFxFB/+FNnB/pEJsUx6XmIIegjS7KgKk3w0Cre4NMcwe0+EOf3wQm2v++w7Yo+Mg+clW64SxyahYAtCy/77sB+YGJSCo9QVLZXv5wTCB7kc3LQJXUY1+PDsn0WIOlzvb21BN9UjBieBs2HGIEySsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmnrUPcgTD8ahEorYwwbtT07/kasYa7E0rZPrsQJ1Nc=;
 b=C4T00qyLIWeR4FK6V3BmF53hc2wFaEiTEgKEkcDMqGez3AS6oVOyZAYRI+DsbwKP1ju2y5Lh/9qDsS5r9nfKPh0K4iwcCi6y6rnLctH+p17npowRqJWOdeCfgmW0Tq5P7VWwrdm2lYW6VjjQTVSnQnA58GnrD/vOnBGev21fRRv+Bp5UzJgmVwQ9xrUqfwPKTwiLyKxrVYqIA17wArVQXpdEKCeNszaennhj5FoXOG5+eTvtOz/Jb2GWYvvxyYlBbOlrtGVE7099n/AIHgUUbs1hg/l9LTL7+syDLX0kr7BE0YJi12o3ZBygi9DzywxyYhXp5QHzBGJiGlcTY/TCZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1231.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.51; Thu, 16 Apr
 2026 06:48:14 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%7])
 with mapi id 15.20.9769.048; Thu, 16 Apr 2026 06:48:09 +0000
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
Subject: [PATCH v2 0/5] Add interrupt controller for JHB100 SoC
Date: Wed, 15 Apr 2026 23:47:46 -0700
Message-Id: <20260416064751.632138-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::8) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB1231:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f1ef16-5a86-4f82-6129-08de9b841bc8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MUuECWQ4006zElwZC0ERmBSaJRPbhEy39lpRFt6O+VyiMZaPgUpjaK7+DfZJlTPgPGkjfczCE0/6jfdckV/rCAEhuB5ubfObqkDwk2mHazZwRmkDIw5lq5LySJObiD9jmhnshCWJZTYn05GXzxyYvF4aszL5PTEX5r21muo1ptDzPcdVU7ooWcTgNTSAXjrf9MVlng5lWEiQ9CsJYr+3n3PXBjqXdDAuNvEORpbkIuhgMo14q1UXz+vkQPqLV0i4zJsw3tTqke9iB0XDXwUTsw2YEJTcjyeLmG+LSgASkjwJQQyMm5TDIxH1NnsjPMJ1CsnvD5BLfLl5sKDDG+kCN4OVOzNta9ZZbX34XIrorXhVPlRtVeH4mf1MGnIVJ9hq3a6CEuXJoQtexwKx6huZ74LqE3FrBIe1n3VlLubt+SxKJPY05sI3F8GmNZw2R7cCIyoR9EPHXr/b9vUuuNB4l+OsQhFmZfSYB6lYmNsXDB/pt+VxvQzzeDoJ2IlT+4/0n/EQNnR6hLb0oiHdlqBQSwwGfRKr7J0dOVF/keqvOOoS9+65ZNUeQbXUhb4LAhymbXtHoK7qFRihEar9wFwjR+BIVTDTtdf3it5cn1ktu80=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K/YfJLVq1NZTKsuRCzxr2mJqaUGfGyXeFaYWZ/1cFJ83e19NgrREsTa5+vQs?=
 =?us-ascii?Q?efQYXueTqM58XKZmVBdupw8V8NF+awzfHUX019eK77UbZ7mG1B85Xaavmqmn?=
 =?us-ascii?Q?ptBFWWB9KppKO6kUjTFbAeFJs6vFRe87xXaMuwv2iF6NMc2WYFcv4BjbqeKk?=
 =?us-ascii?Q?li8tqhwxCSxBlKwnphbIxdvk7WhxqJxbnSVz8YYqbgvaepclhWFzvtfAiv6O?=
 =?us-ascii?Q?QAvS4G+3Jkfv6CnFqYaNDR0z5AoHBPBczBqnE6wspzaTyh/sUXxuqANZDf77?=
 =?us-ascii?Q?jaPeO11oLhWiHp9uTu4/QuG+TjXD4dM9u7/aGidkBZn+pYy9J0V6DktnmdNq?=
 =?us-ascii?Q?K7eGDwemYUEc9/KlLCCxODx+Msvhyl/U7mBih+441R70ZAmhHKGre8kdy7lx?=
 =?us-ascii?Q?XapsHArCtFBk+JBp31aFoL+ta7H51GVwsO9R0Pp47EUqJTibNC2ubkys9s95?=
 =?us-ascii?Q?ui9ULhWurSNYg3EACGDBdcV834YBsDBsD83ydBQFzrpY6DmTLx4oQevOk2wZ?=
 =?us-ascii?Q?YsFjY5Fnt9ZWWgiascFrtmo3acu1JP1+7kkazdptsQj8alG2rRK95D7qMq+L?=
 =?us-ascii?Q?b0BgipFf9t+PbZbd7YRDl24pxh6N4wt14O6KP6429By8bqZ3RGAPQtIjgrPh?=
 =?us-ascii?Q?Rtl9Z379uXEmNmQ6YF5lv4gBkLlvKdOKo1HHpCTRkC07Hg38k0fnri+qDvCc?=
 =?us-ascii?Q?F9eCL4N4n7hX+B4xX7nztNzV8Y9wxXelJTXjtPsg3vYaGmTjkn7vNlonAscQ?=
 =?us-ascii?Q?IIj1fg1hJWB1u+75Qm77SBwtU8Z7L8KtsDzrNcI5MBoz/UZRzmj+Cjht59S+?=
 =?us-ascii?Q?VRmtgrl4q12R2BcQkwoeWoAX7FwKSnEraaC+6to4W0Ovot4BUP12R9DdctZK?=
 =?us-ascii?Q?AlY0+t2ItylxUC/eh1w6rgt0MM8siy9CYRBq3pIoB0q2IN70dwwVf6r8qftq?=
 =?us-ascii?Q?P8kpmCHgnQzxeFuSJcciKPT4iXL47tIYeCk4iIvCGKDuMNO31s7QpWXeTAA4?=
 =?us-ascii?Q?JVz73QNYa9qX0JaivmSGofu6OG6da8+ovcKipn/4yRyVpM9WoV5ENU0KZMWQ?=
 =?us-ascii?Q?O095iamACFGzN8jH+qPQgOZyJYHurHSPy+vwW9SpCxy8iHGi24Vb3PyB4Rcv?=
 =?us-ascii?Q?FCjf3/6Am00djfEvd9ylyTYeOEGJvdGUlstcSpiZ/PenGf7+hzTZSiEzwVl5?=
 =?us-ascii?Q?fy6iFNQr/0b/5sCzsDPqlxHgOKwBbPHQKvGyksFzxcXlxWh1/mRKBse9//pJ?=
 =?us-ascii?Q?yyzLEgx8eD6IAVZXD2ZpXQIogjDN5A3trKQuN/oD/8HFbN+3nlx+dYED+PRE?=
 =?us-ascii?Q?kJuIuFiix4IxiCCFOAIQE8JoF9wFI2g2Vw07zPr/vzwuuLMrlOHSfQVG41zL?=
 =?us-ascii?Q?0EI01orsgFD4NMiXH5lc33RhWFQGxnPOrfG9DZ3dJ5Spgu5qsCP8LYlz3U5F?=
 =?us-ascii?Q?BGp0MKlIMoMOCF0k55dOzK6HlMPnaxaBYj68OFV3P7LnXPhva3gjg+MKXwhH?=
 =?us-ascii?Q?Ud4+ovAofXoScdQcsjB8J5aur9eyvPlo9gx/+jVs2ExTJi+qgprKj/ZReHnj?=
 =?us-ascii?Q?Lxi0xQU9YGop+zbpuBZZNS5QBe3HoGQJzNO8U8p+fM76K1fOgBc2uWQ/o9L5?=
 =?us-ascii?Q?DRJRwSy7jKhKNHAFnJWuMq+FHOtyatT2oiPWdNDr8rboTP0+eEnv9o2syXLn?=
 =?us-ascii?Q?8Zxz3J8dAxekjZ2+DXpaTnbc7//OzR8OWSQSyOUcAPYUTqD5hxdyJWKEyAmh?=
 =?us-ascii?Q?5mOHWQgxjUSyBNBe4r84CEtxNkRoVeKyJ8jLGeg9pFsYQahyARfE?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f1ef16-5a86-4f82-6129-08de9b841bc8
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:48:09.4943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDMG5zfCidVlDjC1py20zL8g9iBKjC+N+tjhNp2KNQwq6BA9UyUsUeZZdypeb4dKeSg8fdsOwNXQKrLwrkNxvRl4va/AdCfctUF/f3pgeE34cmraFICK7plTqP/GWUjz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1231

This patchset adds external interrupt controller driver for the StarFive
JHB100 SoC. It supports up to 64 interrupt sources, and both level and
edge trigger types.

changes since v1:
- irqchip: starfive -> irqchip/starfive

patch 1:
- Update commit title and add Conor's Acked-by tag

patch 3:
- Use __free(kfree) cleanup
- Replace dev_err() with dev_err_probe()
- Replace devm_reset_control_get_optional() + reset_control_deassert()
  with devm_reset_control_get_optional_exclusive_deasserted()

patch 4:
- Use guard(raw_spinlock)

patch 5:
- Update starfive_intc_set_type()

v1: https://lore.kernel.org/all/20260410090106.622781-1-changhuang.liang@starfivetech.com/

Changhuang Liang (4):
  dt-bindings: interrupt-controller: repurpose binding for unreleased
    jh8100 for jhb100
  irqchip/starfive: Rename jh8100 to jhb100
  irqchip/starfive: Use devm_ interfaces to simplify resource release
  irqchip/starfive: Implement irq_set_type() and irq_ack() callbacks

Mason Huo (1):
  irqchip/starfive: Increase the interrupt source number up to 64

 ...00-intc.yaml => starfive,jhb100-intc.yaml} |  20 +-
 MAINTAINERS                                   |   6 +-
 drivers/irqchip/Kconfig                       |   6 +-
 drivers/irqchip/Makefile                      |   2 +-
 drivers/irqchip/irq-starfive-jh8100-intc.c    | 207 --------------
 drivers/irqchip/irq-starfive-jhb100-intc.c    | 254 ++++++++++++++++++
 6 files changed, 265 insertions(+), 230 deletions(-)
 rename Documentation/devicetree/bindings/interrupt-controller/{starfive,jh8100-intc.yaml => starfive,jhb100-intc.yaml} (68%)
 delete mode 100644 drivers/irqchip/irq-starfive-jh8100-intc.c
 create mode 100644 drivers/irqchip/irq-starfive-jhb100-intc.c

--
2.25.1
