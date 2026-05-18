Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B407F48C3E6;
	Mon, 18 May 2026 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114064; cv=fail; b=kjJrCe+/F9q6fbQmIpou/9XJW+jkIL7I+MyYq/qnxqNsCQzuBbl8ZCKGjNBo3bXE2W15EDVSbYn63i53TH00Sr0kukJjhXEml4j5SEaOVLF1ZbiOHSiyAljD/Oj5bOy4QyxfHCT4DTlgYGdkXE9vsm6k97nEzmf2bUsDyJ4Huko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114064; c=relaxed/simple;
	bh=SXmLv4N0CQQEmdc1K222NuFU78GlJ5KMAoJOreY4OSI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lP+8ouQuYtvGVLP7yvvKUurT1I66CIIZY2MdnhCRd+che0vPkOR1svqLP/Gly4o8rft/ty8mdbhSsSBFXF2qJTzZE2PZTCF5ioMx0WNXM7g/2+O+X4Lh/fGXBLNyu7ayMVMqEEK3WJ6FILGq2VY58gpUn6deOzG2Co30RgH7Vss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NZ1pmP5S; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NZ1pmP5S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvW7d7lwffWDfhzY24kxHJkvvS4At9AnwCMul4nRF1mnvK3DVRzr+XQorVPE93wC1M53NOUC9H6hpthpyIIMWiMjaCRWoTN5Oh2hlZfBtGZPGPw3Ad9cCH5XbwamuVQH30ckWY9g5c/CfAxcEi4I69Da5qgRbiECtQHbRQpuGYn0n5QnKySp6Q6L9bZl1/MIzs1J4cKjItU3xH4qPglIqJPjD8gNnnHL9e+DXdEHk7eDRnlPlgUCnbnayKGLJJeyjesQoLD5fusp/u6SQPEo2B2yGGTQ4csVvh5HM2PlXVsHC7USpnF7OIT6oUEEW2gvuQcfVNb55dAsFoQceVeRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Szdl+iJdC5F366MkANji3FrvyqgEV8Vk9Gnotmgdizg=;
 b=rXQc0JoOysWYdV2/B473hBJvlRBJcuafx1cF0feqGa81B9djXbUUT3v8rHIY58psNSLBWqO9Wdu1iQ3v476ohwZLUPyNacpEVJOebEcyBLKrhh+GS54qX0M1o1sc8lTYxF+pnnZM/iMkAhy07UE3eUN7+IJFUXOVDafqFoBKuKtV5a59FYnEBMLwvqa79vzGyDqQaSgr2DE36IjhUf3y1q52YymUo/kfyV+4BrzwskFV9D5V7hWUgN45Wc76tjZlMeAEs46mysYuRb/PHlmls+p81u/zRAaMZ9TJaVeVnWCOrAYXjmmKPwC0ZykH95fumu97z9oU+E/J5RiuXrTikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Szdl+iJdC5F366MkANji3FrvyqgEV8Vk9Gnotmgdizg=;
 b=NZ1pmP5S+mDS6Tp1++DU2utsLUd0RZxi4OsMgwdpyO1oY7mHUHz2xqtLIosRkpTz4f095RTtN36Wp1e26We6PiCwIJA2XhdcWT7scQwfL7utkg2vDspMC1mvj4ayWK0JSxZK4O5hUJ2XDU15Fm7e9yvN+A0DGej9YoPBJvKua+mKGzdVEP1ZLuSdtqLriNZyAfbJUDgARdaj7eJrgCgK6sqhJC1vkTDX4EAq2mt+1TWSjMoCE5lZkBWNs0xtV1x5Qcy2C0uOwBDcpbBse1Bo3BuyGitatxq7SHBWi5xNtBRZXkUaVMnRK5gYkf6hjdKezJXuwiV9yEVoIFVoOKG59Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by GV4PR04MB11793.eurprd04.prod.outlook.com (2603:10a6:150:2dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 14:20:45 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 14:20:44 +0000
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
Subject: [PATCH v4 linux-phy 0/3] phy: ti: add driver for TI DS125DF111 Dual-Channel Retimer
Date: Mon, 18 May 2026 17:20:23 +0300
Message-Id: <20260518142026.3098496-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::20) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|GV4PR04MB11793:EE_
X-MS-Office365-Filtering-Correlation-Id: 8809da8e-5f29-496a-94be-08deb4e8a5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lO9fH68EvFU7ITSb8TNbk0GlD1cn6kTfeOkDNV10+5tgK6XAFir0fvfm4srvgcZrlA6k4Yxx0e4jnn5jc9rNw2gKX9eTc33Ir/CDjI8MQ6d2rjeYVm4CMvy+BkQP5mz+z6FIiP6I7CxjaDwImqSgHvxKaMBh2zLYAUA6cfkcsiMcdi8cKYf+FZWBnRoNrZ6ludyZA7R8hilKLEHFQPCXJbYwBAOiWcof+pTKzHNX9dm2089QQ7vfU++6gGTNWaBpt0+oaRvASiD8cZdCs2M644SOx4toSBKg7BMyvhhKds7G2kG/nBP0E+1H9bzEsvP7STNKdDStaUYbVLBoJy5Mt0D3B6/5YRRVGE3ca9IWUQ8+n73r+D67rLICXuADxSG3l8PPHUTnmJKkJ1gYV2VBG/uWdux/RT91VQSG3pPVfPyFhXf3QJVGjJuFLk0dJ9/nC6ecCiJeNzo/2uAzmi6IxHOqsAsvLBzuZnsiYGxxcGrBiBsHiJXNBJUgoVTGMfmlAL/qlbWnmiL2zyaR3i8FzEKv5BJeNn6I01vNmmzFmhzWTozRC5Y4Nk2FI4FBEFI5MpfBOVkS72CE3iMyvUidvm9ux8f/AofktAMQwEPkS/XTlSTOEcVb2sbAldJ5P+973H6ZkahB4mgeoTzk2LlJA37Bd4c6d5S3MO6vuiBHu3ZAqUfwiAzZAhP29OZ51ZvS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JxBAz6fwfnMbhTPLd1lC4LFm02wmI21LdJnOQ48jOAnQtXCoV//1OJR8ELC6?=
 =?us-ascii?Q?6ggFX75WNHFVBrXrHwYRhEviKLHhYAKkT2fyNdO1F+mMMjb+mOumsU9kOZcN?=
 =?us-ascii?Q?HALQXuFBM8WXi9uJ7PZcNXVuwd6xYD2XNnoWl29e0fsbWjhoIykm2JIOLISZ?=
 =?us-ascii?Q?88z5ZSjckfaUGkSVT1esVYHLV1NgMKpqYcVD+uJ2ZO37HguUEAXBUATLXoIs?=
 =?us-ascii?Q?x5WguuHjUf8LVGmPmxBhJqlt7BGXqb76tkue6Bb57D9B7D6sUbMTD9ehTpmf?=
 =?us-ascii?Q?LstKz0cCuiFNB2jgT06OEXuIGZmn6H7TdUKdD8NYcgme4Gs5/3/fLgXRuOBT?=
 =?us-ascii?Q?ZgAU0vUfSE3QOayPwnaeY7to1GMsf9j8dxMS6JU/fBdSVzh4f8LU6g9uapz+?=
 =?us-ascii?Q?jJx8lOf4qzwaXswQSryXJcsVdcITrcu18O+5A2EXCkeafJNygP078aFzbygg?=
 =?us-ascii?Q?B2BrFf9cSRqJAJlMTTxn+WuRkfs5q4SPI5ODnjW/Bc45M9Pvt3p3RwueK61J?=
 =?us-ascii?Q?hxh3eiGYT2sa2PQ0z/MiSbcBMC6OzJlxuVH3JQl8J0Wk721n6mX0R7+vHBRw?=
 =?us-ascii?Q?Sz2FCJ9J76Pz9x8cs0w2/0T+BQI7LzAHo3uLhI7Fh54KzHRIkcWOYW0BP81M?=
 =?us-ascii?Q?ZcM0FUcMzhDsYuRsCsEJ9lN2+43v4UxAtGRI6AKhC13BSKvgSnPvl5+oZ3fn?=
 =?us-ascii?Q?6u7U5HVLP7GCmOHhNB+M604vnyl6PGxYozYg+7iSPHpxYnNd5FZajvjCIfy5?=
 =?us-ascii?Q?V9oDiiwWk9ewRNbKccyJ7ZSrVWV7neAcxlzDXOmzpQWiM7h4mItkTrISEMHW?=
 =?us-ascii?Q?dvgA1tFjK8hyLnItmDfhc7u86jzaJbL8hXc7PZx/jXZyBWEUJ+rk6alQxobV?=
 =?us-ascii?Q?jNE64DP/NigvMJrB/ZlgAyWFtWP/6slXEkkYoVlw9VDgRHT0GEg35/JcK+dU?=
 =?us-ascii?Q?+UHzpxujsv2pYGzFvonZtj8u6uTSey5+vSR3tsOe86BykW9D7WQPGodCfBHe?=
 =?us-ascii?Q?CQJudJRj4Qi3eFmxEuDuko5pBgw+BMgMFAmg+UP+mIBqQrfxxfD/9mtx5qtj?=
 =?us-ascii?Q?nlvrjVXTsamEY5FSSpQ8ruLgiCVdzKvIci+6I7Otu8qzakjMLd42r02k03Zj?=
 =?us-ascii?Q?Q1PB28s6zxcuKyekSNfbdsj4HWzVtTM9KrFl26tsF4mWVwXFHr+8Orsh4kQX?=
 =?us-ascii?Q?C3qd6iSkveu5loRg208/tOAd0Li77AE1zVf7+DIX7EZTdykCrOHuOAaAtfQJ?=
 =?us-ascii?Q?auN7mfJ6q1Xe5gRRwk3poR8sSk1eJulyLe8fbt1Khu+tANXMqFzBTV7sbh9A?=
 =?us-ascii?Q?JsV8+kQJPLBjlz/8TLtmqX9FbCGMIrygzCb2TZcrELLrditqm/FUMqgvQeMz?=
 =?us-ascii?Q?HrB9Yxitfjydc/r+4yiqS7zSZHFag62athGOUq/qZkkBWOsXWOVN9AqSmrAQ?=
 =?us-ascii?Q?Ty8SmeS8dBc93YCywqTsHhN29c1JF700HHhL/IlEM26Y8xp2hhaA/d0kml2e?=
 =?us-ascii?Q?AwGy25ldkaxEjiwBMpHtuT1fcXcQxx1NGiGKTcAPSrKOT0mGRE138LJfVzNp?=
 =?us-ascii?Q?feIC0VCSJSZaZ7kGZG8XcneNYpCieXEvxSHPgLN9Cr9ETtYllgz9u2h7G11V?=
 =?us-ascii?Q?6dLXKzb6Ep6MwyQ0yCD1IOUAU1qCxuo1RVrwY6MD/H5JCpN+60/AMbWFzIHV?=
 =?us-ascii?Q?P5tfVBN0o8XxWea+EIbEWhx1z6DHbeTl7vcilw5GPDP3tkuS2z6FjLg9PaIk?=
 =?us-ascii?Q?IDIKFJ9auQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8809da8e-5f29-496a-94be-08deb4e8a5f0
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 14:20:44.3862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmPpwKJJlFhRUB4cXZeW46WHugrt93vPQdjD4wAzkLYuHWe5viZOmSCchVbCn4ildqtU4Ns77bHGdYjQtWtTFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11793

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

Changes in v4:
- Add patch 2/3 which sorts the drivers/phy/ti/ Kconfig and Makefile
  files. This will generate checkpatch warnings since some of the
  help text that I moved is shorter than 4 lines.
- Use lower case for hex values
- Insert the new entry in the Kconfig/Makefile so that we keep the
alphabetical order established in the previous patch
- Link to v3: https://lore.kernel.org/all/20260516060309.2282592-1-ioana.ciornei@nxp.com/

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


Ioana Ciornei (3):
  dt-bindings: phy: add PHY bindings for the TI DS125DF111 Retimer PHY
  phy: ti: alphabetically sort Kconfig and Makefile
  phy: ti: add PHY driver for TI DS125DF111 Dual-Channel Retimer

 .../bindings/phy/ti,ds125df111.yaml           |  46 +++
 MAINTAINERS                                   |   7 +
 drivers/phy/ti/Kconfig                        | 102 +++---
 drivers/phy/ti/Makefile                       |  13 +-
 drivers/phy/ti/phy-ds125df111.c               | 294 ++++++++++++++++++
 5 files changed, 410 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
 create mode 100644 drivers/phy/ti/phy-ds125df111.c

-- 
2.25.1

