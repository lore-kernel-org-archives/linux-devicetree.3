Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF921392803;
	Fri, 15 May 2026 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842918; cv=fail; b=rwEw6LRUxOpsUuaoqX5rohc4CTMdmezOJVSqFxXBtpTajbOQsTgNkyymdy3/EZCZrMp/LZCNffbZkJZxZog1N9ADMWseTX+ZfOHXed7XYUJ2bIJAqdaIaafmgUqoUv121NhpgSowFG6m1GjZrGIU+Mv9UQl1KVeq28vR265td5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842918; c=relaxed/simple;
	bh=ciyYVD+gDpsiSNJ72Y+Z8GakTyEVJrNB9BKcmy8F0YE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JEzABMjX/01O5gXJQFG6AFqdf3Tg0Z/4JEWrgCzkAS8koO7ZDYsegbOwPj6d6c3VOLJeQBF8TVPwMT785ls27G50/dBj48aNt55NRu3dTy84faJmp8WI9viKzfyXXQ4Dm5BcVmnCoiA+jtfBicaMsV3DZsl+BrUI96uBI1e/QWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AFi0bpvB; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AFi0bpvB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLdXSpqmUM5I3eHV40VusiTCoHgXqnhVmWnaDpiKtcaisdgPVwzk9TI2TjYZ9p0+ziHz7faF7U0Zq2kEEZbWr1CYJOOiGQCR4ywzA63zvknzN7akuazy+8rAmc+5TzsHWoc8S/uB8A+j503fg3vBJqIdEU7/JmJVUF/F6fU9DNlaVbAXC4gDY/+y+KkMv/J5JX3C/oh4bm5xHnN5svtYEkQZf4L2+US1cIPUNZlu8N4NOrQpC+Gs9R4A810C5Og+ntPyhz82AWtgDyCEbpqK7jljLgLt/Y6Z16Dy4lDaCNmcv2tT/Ow+9zjrIIvWhof6JC+DFkApw9MGQ2kXUZNrig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZiVgC/X6hVr9g2xO0IVsX/usX+R+hMouWTgEvgDFpc=;
 b=NgSd6i61ryiKdNyii32dWKNLGTUnnhmswmMWQ1zVG+/0JAWXiSR3WAxv7XbDE5THow/6ty02Np0cZgCnhInLHI5P+8N8yOnLNdUVyq9iKpGXL1RrdsBgFZnkPCjzZvAdcdyaNOGqhcynywB5xUEjXh5UxHlJaE8lqphMQtTad2HBTBjpfeusa8PUYizsFvw8o2EQujfHIYsRcZZ7OfjMxYTAVMxq/lCu8TjzAJXOEIpXMneuru2ou/A8eKdB6rxrcUeNN26DpyNreGj5o2XQORtC994V9EXehROvmD4q01or1Kz/723BceqGgNehlQBUqJvcjwLU80nxzY2m1XOs/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZiVgC/X6hVr9g2xO0IVsX/usX+R+hMouWTgEvgDFpc=;
 b=AFi0bpvB0sq/KWwCIxCSn9JzdVLNL91MAB3UPT/NyfcRCf922VOTKkaYKRIlJMFz28vkHvRnKExDIw8KISe3QzZJ1gUzZaWqmh5J4ihd5JunIkBe+nTLceV+Aw58s4lWznDSJtsMeTXf2T7DdWuX0c8DNMuylvlsOE9BsH01wMn4+/1ydn5x7YyhBnjP2zDVLzhsa8K7aBw1tyTyjT7dhGtq0OXDSLVxbGKktQyItCjhq7YYsukcgYD/qe/Y7XDezVpGfhP4XHNlHTS3fz3AXo/+Nq/rmVUzjF8mq9M5jl10kUbprE46KaWCQSb62GZRgKe+1KuKcLNVV+IQzky/Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by PAWPR04MB9806.eurprd04.prod.outlook.com (2603:10a6:102:389::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 11:01:54 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:01:53 +0000
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
Subject: [PATCH v2 phy-next 0/2] phy: ti: add driver for TI DS125DF111 Dual-Channel Retimer
Date: Fri, 15 May 2026 14:01:43 +0300
Message-Id: <20260515110145.1925579-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|PAWPR04MB9806:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c3e692-9fa0-4e18-a4b4-08deb2715f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZykZu60Si7VOEFBZndwPO3SbY4/r1fvSHXWvH2//mb5fkmcZkMxWl9ll/+ssA8lvfnmVD6q4BbbJNuT2A5aNL5/IPijdNgR2aYKpYDUfxaJSsR3ym4VM7bbbb+N1U4zE5wsEAnHyQqIKALmWB6CYqkDsHqpmEVPG1PM+hjHqkVTCHco5oqqVdWGzPJNvHzvzNP3D9l24dn2R0cBflQjhsqZWMcxcIAumNvKuuWWvPPuzAYyjGDcpyAznT6pNH8rYMn8Ns9pYJOKk2q28lTxteeKd8FitkGxpV3ikPoZrkddDNjMBW9ucQhqjj0nVQJch5WStvBMRGybmQOdXhwDCSspwoyn32Vr9jzyCHkqmmqRWQtsG4Si+Vg5o2YHt6LMFIMiTwrxd2ZAS9Wi8XACpPy1jl0k2Pl44UWW0zxAuUrdRdG9WNheIOzkRz/Mopp4TQuGyNSn3XfvfN0FyzLMJ3pQg/FwjNN4cB1J4nNadnLKt7hzMDpw2TGzPmZ/iJFl7pOxF1ab6fnzxgzQIBFy1fb09BfNu2ejd1MWoppVj9sr3EGPZvu6zAx0slx29nD1ILpKn+K6mCNWLcTq87YktOJQne3qwe8i1nHgjXMJed+9KQy5jZU+OGvczznT2Rc3e8PFm2tf1p3qtGKpJgIu+/Rgi8rioZr7oOsfTkbxvHcWgnS2mjwv/ERNtb4An5dcAkzuYWAKUElwwcTNmAfRbpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H+aFneGheI9spLM2Mpv7pjgJCZUoEnLcGu9IFecQLla9IYZeByKGOdv4QKMS?=
 =?us-ascii?Q?VVQ0BIaW7HLlg0s+7aHxp7VYwux8MN1qQzm7g7/n1MrTPzR5oXWKtYF+Ddek?=
 =?us-ascii?Q?ntyzI7+6WYsgJyPWSPhMznPxW8zm+iebinHVmxyin6N+kDfnjkZ4GOanhxAl?=
 =?us-ascii?Q?2lr+QdUNU4Ze9FH+NBaEL/Kx0TMCoWEoY+sfvet6ZY+TqYO40S7iQuEgmMxx?=
 =?us-ascii?Q?D4eU/1jXBPNKh8wR8AqaFLvLaTxHuuoHnR7aDGvcuTAXzLSFWAUyA6zhf35/?=
 =?us-ascii?Q?YvOG/sUqlpvZPYMIU8V55VJz4HKo7dlCDi4TZN0gYiVBVX9CowW/S/exKhot?=
 =?us-ascii?Q?e2g1G6L5i5+GfrGhs6E+9UPnwe8XbnQt7h9x2/SR80B1t92llvdobqL4A5uC?=
 =?us-ascii?Q?/jVYDOS3GKOgnbE3KyBZpXHkg37jXXWmmDHrHqWX00pwHxZ9xWs3dELfepci?=
 =?us-ascii?Q?z7bnu79VvMc0Q9I5CuORVc8CdE4U51CWe9pGA8GP+5v/yrs3Jr9qdju7BXz+?=
 =?us-ascii?Q?MwGAb/aoXdot6qbifEeTosq4lXDmJvjnX781Y94YF8rpADPsDLJjwfn731Ot?=
 =?us-ascii?Q?FxlCP+oYCNjYrZH261ZfF9gtWOGY2PWRZH+vNDv0aBfOxA1JWnO9FIVP4RE8?=
 =?us-ascii?Q?Iuwk3vKDbiywaW57ixWqwiOgf3pGOeagW/kgoJ0mwE5khtZW2VB6z794VvNF?=
 =?us-ascii?Q?bwRGMpal0bty+s+/kC0V04idB/e5lvTyY6vaAeS7sz1lg9tjQZNBxIyws3Ko?=
 =?us-ascii?Q?6ENbi/W6Yp5YuFnCeRROLosgT6ryymInn2ngVr0WRONJnPEReMqJo0nWwwhV?=
 =?us-ascii?Q?IqVCts3Blu/kU3rbko9eKcKJNlgQcvewN+siENmnsFnAqxyNHNKedHl3RVl9?=
 =?us-ascii?Q?xr+W6lwYJfI5DtG9ObkmwrFYyqaiYYm6CKSCD8nfBvF5F8fpfMn7bJKvypOd?=
 =?us-ascii?Q?18JakUAnsLyVe3+6l12mPi5lYhHXKbea+p4EZrR200SDKAisLK61f/nOdhqM?=
 =?us-ascii?Q?xcV0iAZu0uK1B8dAzfeJor9lC3M6a+Af/ahUSwdDUmpeYLJqwz41gucht0PN?=
 =?us-ascii?Q?fNWytIfgExrAv0Up9iMamb9iRhpsHTZjpu957hULV8TzuezT2FWh0PZoSkkx?=
 =?us-ascii?Q?TlSK3XVthlQuOYyHK2YTuKR9Xyf18vHM4Fi1VLN0MJ9Xg8PJxd3ohulLsDhu?=
 =?us-ascii?Q?oHAVyibkDPV7HWLS0j5QsZbeRhwPFYxjOgGBMVgEbF1wMM/9Y54UJkbeFtiY?=
 =?us-ascii?Q?TjL3sOU9NensL3vzkaqPqqpMh5vSqQNpF7eJo/yPDGk0guBsylKXIO8kVAco?=
 =?us-ascii?Q?oGOJvSG8Tiq4Zy9Czlk9UIfJygXdXMya7CcJhIt1CyIhf+tMph+Of3tRVhny?=
 =?us-ascii?Q?cP2yufQIolZfvMQJu3zbMiZiMN+lXkbNYpGrzkBJSD9ffUxSASwLgIOOZjnc?=
 =?us-ascii?Q?VJYc6YzUPCGE1sgODDUwvCwlfx4WJHCyWjIKrfjAeuwEuIw7gPf1FBbtK8OT?=
 =?us-ascii?Q?4KVBa+iyP146G1J38IVJ4uqc6VGFOv3XJTuMjvM6wzpQuuEB0FsKZhag+/I0?=
 =?us-ascii?Q?8smNx/95cbSkgQBAXtchlwvDesaXMwt0PTzvhsTFcLQlSovOkd4EnVA9BbSs?=
 =?us-ascii?Q?APZoQUsBEMTqarA/l0qoDMiHdzZveL7KbUvhRXz/CnGYztGWZ6LJ/sa02lMr?=
 =?us-ascii?Q?VoFet9NydUv5tPK1/oC3in9kPi4li8lp905HF4NAEPo0WsHT0RgM3dkoNOJQ?=
 =?us-ascii?Q?p7HsS1LTLw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c3e692-9fa0-4e18-a4b4-08deb2715f8c
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:01:53.8389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUfvjpzKgsZRqGy/jYwXs0aSdCsWYiIthcJdG6jf8d7UB/rq4JsHs7OrFZ8O0XgxV1o6MZYMBTQCu3klo+Z/lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9806

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

 .../bindings/phy/ti,ds125df111.yaml           |  46 ++++
 MAINTAINERS                                   |   7 +
 drivers/phy/ti/Kconfig                        |  10 +
 drivers/phy/ti/Makefile                       |   1 +
 drivers/phy/ti/phy-ds125df111.c               | 252 ++++++++++++++++++
 5 files changed, 316 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
 create mode 100644 drivers/phy/ti/phy-ds125df111.c

-- 
2.25.1

