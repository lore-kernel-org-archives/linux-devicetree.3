Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983DB25785D;
	Sat, 16 May 2026 06:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911397; cv=fail; b=pS/JBcWrmkx8X5wtceK/bDNZK+tasjVzs6j53W6SWM3Cndf97wHsEfm/OYDbElF8vhbbF99MsX71T0joBtIGFlHMsYB6l+yaqKg5rB4kJEmx2LBqMTYQe8Z2NMRldPocxbJ79/QI0CrWsV8HfnDVDUhA6Q/wndmMaKr1j31jDu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911397; c=relaxed/simple;
	bh=yxBYo5SKQLqLETIYCOKoO+l41Uh+NQ87CLQLteaAZtg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lZno7zvXdF5Ct8e+WyNV0WLjlrhOG7f6/YryROfsLPWsz7xUnzPvMINfgM+Mb2vaK8AGP7Q4f6tzh/UpjnxKFsLDdx2LNjC2G13OnH1uHqv4a03uokqDmIneqob4h+vpKDNS8YDOR64W3B3XH9hnQ7/57tES55LWr6aFOGt3lrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J57P6jpB; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J57P6jpB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PB36l+y0EYBuWIytIpeWtOFh9CGym09L0HkSM4tAc4HSLdaqbN3KiGaZKYAYwTjdbXlG8tdzxfmsN4ppTrmDefcc7UFWv436L8ssK5inRAS2J5Z/az/VvDIks8U/9nhqQecPSaxn/8cAhpLt007nuOLD5NRDDgmSv1fyIB+XscQ7MJ29GyyeVmezzrtNwudtk83DCfX88o//OR6hUJCsFzXknLNU3fr5EeX8FAcGD1Fl7Dgam5Jramy+VIJrh+40D4tt/vzEem2MRHl+MX8I59p+lszvG2bsVQzFQ+p1csxdaG4NmQKzHeU+xX4A4s+tvBsD9VwwigmfCeI0Fwioog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxQE7HFemuls8fYBdkX99YRTKYdnJx+M+uEavMvDNhM=;
 b=YbzMSP3OdV6SwD8qdriaGe8gCzFXWwaTpXbaZYvH7w2/bwToEfe6LVrWOrB/zhkYE0k9hhEqShAJJ9RwmTFzPD0k0tCaPe9EJy1Q734dazKaHkzoL4I21p33MK8LhPn5q7Q+kyLIVJJjQDHcwJdKQoUMzB1ImNwdZv1Z6LHx3Km4LOM9yAkW4w8RfnM2zjxxqlm8EfUJUef2edsSJOnnoN9+4LrII/yz8QstWMFjSc46kNsmTydkNkZMOAZpKS4LUZr5nsJHIEmnOdwIQC82EtF4dCM3UK5GotbeWLIjeXGZxhDidrH07gkeksQG0paZwDN3C404WHqbylJT2cjIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxQE7HFemuls8fYBdkX99YRTKYdnJx+M+uEavMvDNhM=;
 b=J57P6jpB5Suc8kNyJ1+SW7HLcz4GNIU6ZEnEqbCn8WsDYGvPM0OiAWebELB+q3bYLZ0Tsu/15t+rvS6wqLuG3+FKVHJAcl/yDA0FQZiu+7K17peImm0Y/53eMEyjdaZ3USfTAB6L+1j2V1zuEjdTWnSx9y5L9FkhvM3hnRxxfdltWjvJ1X/l7TKZvzj1Oi0nkXHr8wkR6riiWczneM6KPiGn1ZBua8ngeL5ybnbWT4zCloUZO0asp9ZEWmjFCVCalTqba6E+iNw6gSHQ4EAbPgcPzvXx/iOP5cE9+C5MZTFbLpi3vrgL0wrQ37KR/erghj7sAtnH73LidJFRVMv6bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by DU4PR04MB12347.eurprd04.prod.outlook.com (2603:10a6:10:62e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Sat, 16 May
 2026 06:03:13 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Sat, 16 May 2026
 06:03:13 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 phy-next 0/2] phy: ti: add driver for TI DS125DF111 Dual-Channel Retimer
Date: Sat, 16 May 2026 09:03:07 +0300
Message-Id: <20260516060309.2282592-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0341.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::16) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|DU4PR04MB12347:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3112f0-8f73-4e70-5c2c-08deb310d02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6hVuXaZcstDkqJscVRbi4YWKIY6JhjLXSq32CG6keeXUP/+bLnxs1Q0rDJC+B6AJDQvfycs2qnKavaOOwmkiFUaoxLHxH7sP5ZeMUh/rkxTmYq81x4IdwlwU7ZZkbq+UM0aR//sQGxXaZwSLy8BwCVc+sRThYkbSiOPz/ZZHSA5MCPdzVXcJScSq4UTC/c5kXWLy3b0ToMND2+M0Y9j2PXOjyp1YKemjvh3IK0T+J+CAzNsz0YqEy/Un8gxa8IX1WIX5ZZ8NIkZnVmxWDJGU+/oAdgPpby76BbUujrkvhVQDo9Yuy/A4vCsETgA5KTdrnkwyMR9IRZV/zHK9ZnN1ttYzRsz51dA/pgWi+QtPFOQcNp6AfpvDh6OllCPqZwtb81YrZ28s/GWAlvlrEAPkr931DUWZcNEyzKPLDzq1Ch3eigV+0v8rXb0sX/sg0AJqybw2NBSJcOI2+np9aHnkJnd8sJBel2wG0Q/11Fz86K/JO01DtqL14o1WHBHSOm9tMJwOGHkyIDxtzUIFyykb+whTSU7TGYjiAP4BCBjzrhIXXDGnjzqAXpg3boiC45a41YfysAvf2qiMr6oWJP2ZvtWbgHUENUgOKbPPuq1DvdXPuAmqbAaE+GFhD3WPwhZModUjbklSq0D+Ng82I3o177Klc0PHTvsziElnGBZwD+x0N2VWU827f/LyKcvf7nHI+IUj9Jm4cfTcQ4lg414/fw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RCwg+dTDt6U517cZ8iqWXiwsFJYCHC3ULuStFUI7GQOz2I2KguEXYsJjZc6A?=
 =?us-ascii?Q?jqKvyI5z+9jKyusTlQcibryHE9211vM5VnogIU+njkjtb8h6WSZUzx9HwNqy?=
 =?us-ascii?Q?urFPgPWwyNXsJBzuKgYmjDcU5mJGXnZPk3XLQPNAs154LnpLKd6dKj7peNdD?=
 =?us-ascii?Q?2KPi9wtlPI7dHTX5wtI4N3mXSnj2Htej5X8IzbYM+fjM+uEUoylck8BwFpFv?=
 =?us-ascii?Q?dVKLv18oHUcREp4tmc9TNIafQGvYg7Zv6APB+NK+Eg9G1hdjBPg8f1u8GVNw?=
 =?us-ascii?Q?pQ8Q0QQDjGc5KC2rEI58aBBWGCMmmXYF2tqPsTtoXrIxE82tDlQ3MaVNQ86i?=
 =?us-ascii?Q?Z1wZL5JhmIReChVzUfQzcK0BM8EKjOTdFgDfFyOfBD9unJG6yCWWoObKvnpi?=
 =?us-ascii?Q?tEwr6engBBEewK7W5L9/YU2eyCL/eXsKn2yT+t0F4Rx9mWNJgs9XHMcyZnCu?=
 =?us-ascii?Q?nk2aAOPG4d5sQeT/vg54hZMh04Isvq15F3TJXlthZMqKGEn6iSQ4um/DABoY?=
 =?us-ascii?Q?uIOm1of4nsBJ6ey03H1xJEOQ76T3tK/HEbvoaXAueCXNncsKed7SkY6kR2jM?=
 =?us-ascii?Q?o+Cusz1JLyBBA1tEDSstXQPCHgVvPk1S3IuB+16QCDoR4+TSMHP+P6gSizZ0?=
 =?us-ascii?Q?ZRG5WtRZCxwhP0y3tvREZX672l+MjRSmxWB8OUDW/6+KfwInB1pZtKVtF0DE?=
 =?us-ascii?Q?QxBITxbybbpkxWruL4ZnV+auvzdjmGnUSu7LkSCkZcxwW7CTgyTFRehTzmTa?=
 =?us-ascii?Q?28cCL/62QGVDmRZgHNRu/h6uOZniWWne0NAygfGxMOemR/Nppe5viUH4aLah?=
 =?us-ascii?Q?wCT8Qx5AUUZ7jwIwau9/3hqcypLSQ7mDdCIzsVTHlCIjyUMxSPcSltxc9ys0?=
 =?us-ascii?Q?TEQhV79igcp4f6h2eDzbLQgUFV0lFgXxjVRBj0Mv0jFr4wOQJxbi4sxa1Y/E?=
 =?us-ascii?Q?uQn9RTfdZJ8wNRRw9/0WHpViyxwAWu9TqCE4owe+h8b0HY+mjw/yV2fjJRS/?=
 =?us-ascii?Q?VvlSqD6ea2sdbcgpxEDAkTPyXOxy0lW0t9UPzT85esC9e3x1PpGBRe9mPaEv?=
 =?us-ascii?Q?hNPErD02yPrkfhbCLpHMoXx2d7zdpUZ2s3zsS10y/9JPuEJO0C7rHSr2OrTO?=
 =?us-ascii?Q?O4nefIiwbyCX63o8uufcOJP2DjPRbnevcpAiXw38cMY0P8rJ4zmKdBkcL7pU?=
 =?us-ascii?Q?FG0X5ulfC0J3AROSZh4BUqUn+yEAG0xbhlIMst2LTOS5AUP9D5Gb3LBTEJcJ?=
 =?us-ascii?Q?oLYxnKb06tRTLYrvTvZjwq5d7qL+/avExWQucmshxoIxgPq5vPWbyIKdk/Py?=
 =?us-ascii?Q?Tq+5T/+lupGvgUWZ759weJ0Nn53kTd0nLkIbZY542yd20hlpf5IOEe5AhyBw?=
 =?us-ascii?Q?5V7YRRQXA8fF4RFtqIlvTHY37epYA0LEwEjfc8sId7LVqZhOGfq38IQ9eFUW?=
 =?us-ascii?Q?SWvI9TJQPBMqrO/fEKKWutc+6wiRcMm6D8aGRVN10gbS08r5kZENbHgtzxiA?=
 =?us-ascii?Q?2WohFmSIp1pF1DJZPqqrve40o7N42xm3F1Busc+5nltEV+H/4z2BbfP/LNpB?=
 =?us-ascii?Q?qUvwFLbkd2LuveqhYNCND97kN7Z5VRznkbGeu6nll+SWY8M2UdGL0ZOLxzoR?=
 =?us-ascii?Q?weDcsPwICco6DYCcUbwwOwZ+S8m63o5t4yB0rZ7UbQQ6ThtahZGUt/JibM0a?=
 =?us-ascii?Q?/3mcfiga/X2VLqCO242qKdrGfvJ+nTsJR08sg2/uyEcB7SY2SQCnyJWVYcke?=
 =?us-ascii?Q?t/J4U4gtIw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3112f0-8f73-4e70-5c2c-08deb310d02f
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 06:03:12.8836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbvYctCxwLQL1Tj0PhHuMK9C35ukX6SBU//fv9binXkWL97utiMfDXt/jSv3tEVpRNUUZLLIrsJEdUCEAlhTEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12347

This patch set adds a generic PHY driver and the corresponding DT
binding for the TI DS125DF111 Dual-Channel retimer. The datasheet on
which this driver was based on can be found at -
https://www.ti.com/lit/gpn/DS125DF111.

A separate generic PHY is registered for each of the two channels of the
retimer, so consumers can drive each channel independently. This allows
for independent control of the channels, which is especially important
since each channel can be routed to different SerDes lanes and it is not
guaranteed that the same retimer will do both directions of SerDes lane.

This was tested on a LS1088ARDB board with the Lynx10G SerDes PHY driver
yet to be submitted.

Changes in v3:
- Use reverse Christmas tree ordering
- Print a symbolic description in case of error
- Some words do not need to be capitalized
- Remove duplicated exit code path
- Return -EINVAL in case of unsupported submode received in .set_mode()
- Add a .validate() callback
- Remove comma after sentinel entry
- Add a ds125df111_rmw() helper
- Use read_poll_timeout() to wait for channel reset to complete
- Link to v2: https://lore.kernel.org/all/20260515110145.1925579-1-ioana.ciornei@nxp.com/

Changes in v2:
- Remove the label from the example
- Rename the node from 'retimer' to 'phy'
- Explicitly include all the needed headers
- Change ds125df111_xlate() so that it returns an error if args_count is
not exactly 1
- Add a MAINTAINERS entry
- Link to v1: https://lore.kernel.org/all/20260513185103.1371809-1-ioana.ciornei@nxp.com/

Ioana Ciornei (2):
  dt-bindings: phy: add PHY bindings for the TI DS125DF111 Retimer PHY
  phy: ti: add PHY driver for TI DS125DF111 Dual-Channel Retimer

 .../bindings/phy/ti,ds125df111.yaml           |  46 +++
 MAINTAINERS                                   |   7 +
 drivers/phy/ti/Kconfig                        |  10 +
 drivers/phy/ti/Makefile                       |   1 +
 drivers/phy/ti/phy-ds125df111.c               | 294 ++++++++++++++++++
 5 files changed, 358 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
 create mode 100644 drivers/phy/ti/phy-ds125df111.c

-- 
2.25.1

