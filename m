Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794988668;
	b=ivphRevHFGh+XHS9UVY2ikqF1QykZGP7t1zzHgTHmywPyww6Eu7yInjs/44ZDk2CMmd+
	 tjTxNPWAONxNenb9xKwY+K5i2MbowsYCswORkWX2arCcz5hpgBOQaVG9VACeCe+OscuHc
	 Ebh4Jo/kox2wlez0pxcXDz1ER6HGfeYwwW3mfwvDb0oo/GfkVk40FuXq0yNYx7yCgSqxg
	 O7N0+ePpPS0j+WRMjJMjnrZ17yyLa2yvv6ZlUM5gO+/3QgGizag8NT8tve/fAciB57bdl
	 MnMTiElaHdgy4ZPd+WNuL1v2sgEOSpRt2pihGHERK0QtCy1KXHHeUYuE6UTg7o9uhpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988668;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=AbSMG01wD4YwjyBbzekil8yakWUlpLgqY3IFG8Ye7HI=;
	b=oerf7eHfF9Go6rIdCuFlXqAatyFrnpxeNyfGUm2gmoWUVCukyGKNzoRnQCdrDde3TiLm
	 jhlzKJjdEWaXM8uk4WlMOzU85u/AmeaIJzm6PJRRjar9lFAx8Usak0LoO2wTxCq01irCd
	 Ju/a4MdkmygJUi5g9+rcpRFMx7emOQAnFi0nK8C7PxORUErd+ObPmC3I78DoofUpfalLa
	 Os2znhxrnQ6OFLnuuwcA3Ov2J2kfGrwNZjWhyvbycbH2+TQV4xv5cb+9Cey1bCNvJVEXU
	 cQnFQ89cG68H3GROUovfUiO1PHZYKYnX0sJP7oCfhxmd6kYshkBGbpG/6kS+nDPVmYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="KMFEP/dV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.14
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F87606A32A;
	Wed, 18 Nov 2026 07:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F87606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KMFEP/dV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAUVCnKAyBp/Hap4JlgObel9kES7SoFOMzPq3+Pxo0X5h3JQ65iRDl9dxPP+HWr2bo3NsxPs8AQBwW68psZtfctitrOVqGInIcAvtm4oykQEgjajM2SuiovwVk81x+nybt4PI2J1EVt4zQ8nN9lqGozwyDFN+b6Bumou+SFXOWoBNYUk6hiG8B7NrVhyYgKn+X9pN6JYbgEkpce8HaE8oTm+irdhlGOu6VBblfCm6ZWs2djCaWun7OsWSph/WH5RGle7H6ZLB4E6DPNJOoNPuqjxI37hmRKRN6kDdU7nZMYhXI/lPyiUwJdxjpVRMc2g3AVEFe4aFahz1Wn53Tu5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbSMG01wD4YwjyBbzekil8yakWUlpLgqY3IFG8Ye7HI=;
 b=WAfiYiG+jJ32P9tnAuYSAMOwni7E4t3k4pvlYs69QpE+9R6SidpvYwKj/6uqPY02gVjw/ROUjGxVso7tFW43fP9Xp5QyWkDQGUAAwZ48hixLxHtaI+lW58Jnx7ZGEzeKSMRJnyF6p8WUPMgAK2owDgihOCakPNP7vWLPrTcpw11OkvMQoz4kCcQZhG9s2OXpBjzxRNiK4RqJ0BoViUFHuxv/NW7GTiWPq/QnYBylE9Ywav4r0jHYnw4KVSrViqcxa8OKsKwOkDvMFulx6dKYggtLa74bkzlt0522165PVRMF1YM1f2xEYCarQA/kE17WNrZ/7QBNYPIKIG+rLhUBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbSMG01wD4YwjyBbzekil8yakWUlpLgqY3IFG8Ye7HI=;
 b=KMFEP/dVYViCDmT6wo5XuD/zOTP/3ImX6vGaaVJi/WITu9vT/UvDw4jpjwpBJHrDavKcBDD/hR8P/zqWFcTDfH9SvXkkWLHLBSoekn72IZryS8S/vYD8adzpkgyBY22hD3wo8c0prKVaXEnzab+UL6kKzmizUROF3cDKyQKiA9PszKqvhxVAd8DRUOuGgc8noUvyh1EiqXf5iPUhrU5yklgLniFm3+jQfnZyZFFUz7GfrGKaelbSSKHLLpcGkog7NRQeHzxTSBvhUvBQ8Jw462uk4MR723CrOafS0nHzZWbETzPEAYHGdKKUiKYUJDIsIFF8RIuPl677PhBJhkyI6g==
Received: from CY5PR19CA0120.namprd19.prod.outlook.com (2603:10b6:930:64::10)
 by SN7PR12MB7024.namprd12.prod.outlook.com (2603:10b6:806:26e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 07:57:38 +0000
Received: from CY7PEPF000000EC.namprd04.prod.outlook.com
 (2603:10b6:930:64:cafe::41) by CY5PR19CA0120.outlook.office365.com
 (2603:10b6:930:64::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 07:57:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY7PEPF000000EC.mail.protection.outlook.com (10.167.247.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 07:57:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 23:57:20 -0800
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 23:57:17 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: Jacky Huang <jackyhuang@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew@lunn.ch>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 0/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC support
Date: Wed, 18 Nov 2026 16:56:54 +0900
Message-ID: <cover.1794985308.git.jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EC:EE_|SN7PR12MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: a924bf31-1265-48ce-3a52-08df45499ccd
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|7416014|376014|18002099003|261009223027099003|13003099007|260925022911599003|11063799006|260925021311599003|56012099006|260925021911599003|261026140227099003|261028144727099003|261102123227099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
 N5YNFKflXtGpgVPjwPCYNpYuXv2S9vX8ynRhEenxHu+qFP9rOxSN08/SoDBUBRnLrOQfqPE0DbtNAUQ58ESSCMDA/ClZc5W7/LXbOLt5M+251Ci7bIuohiJZQmyMfrl+emet/GSye08BYjp2UH+jNCflrrps5HmKfdU9OY+zyxwXwrpRtlU5ohFr+OeyPzrVKKS5pgFF2bd/04KbIyXxXEYre5KdoVbShH+7b5WmipF+en8j0AF0wjj4Qry92p+KHJ3OJwl3jhae6hKhTvmeDVA6Pm6buWk/2Stqg8no/Wx6sB5u6YI6cUL7SLI+TQ3RtcO+rgz+H3E+7qqGSEsym3Lsh/bcZlRgHKbFlUmau7G4ayVQcTRZKPFpLj06ZCnLb7OSFNuTF6EmxmMibr7FDMx8uSF7u0QaUU7nhcXZpBz1uhzNBMWYYZZy3oiFr21EPNPz5iGjm5j4KGb9Po6UEHpcE7TSBr9wpf3u3B9lWEJPx0VYoELyjRsNBtQMt2MRBD4eBI0oysxVMJpUwZOeBE/QMLnJkHimW9dJDCZzLK0JbYnXenQCUpRjp2d+hJrMZpiUt0qnGltCLHdWewBikOp7wo1KC76hQDk+kym6BE4Qq80cxXLahW3NxI5FlV5XiZRQu4BhqggcS/s7po82f4GQ8GnVjEwciJDkM7LGOevwc9CJJ4QnNNmfSAnYnCftMEy5OF0BMTzzb3jnhDLU7w==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(7416014)(376014)(18002099003)(261009223027099003)(13003099007)(260925022911599003)(11063799006)(260925021311599003)(56012099006)(260925021911599003)(261026140227099003)(261028144727099003)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 WVSCCkvy02wBA+7sonsUvEFKgsMhv6oNbnvzhpPvB1NRWKXTH+Pid+INtif7KzspDDvgT0LpCtwimp2wnGQt1XMPl56mq62p7cobTvcftu8WzB5RqJcrQnGBycCIVAFqG6saxXJN/BJ1dCR6VUo3wA0Yd8unpwX2dGBIbVvL5DTiDwac6kH1YDqIvwMgji74/2UsArClmVGQLTVYW1Ux2WeZ4sJ5VvOh+tatuwghLPR+mFsisIe9tPBMua4sOZbIswSPAwUDngEHIY4n8m9J8xGMlUFCPQ0IgPRMk/acBG8yEIptr18u4NEp63AVWtJtdxrf53o+4wqguf9vlfddHwJclNRyHudzzI7QfbZI0Z72U5PJtoSrGr1W1wT12QKQ8o3CgaWSw8JZkFBhMPo9Hcy0Ari61OR/6JwGg1eqFModXqZjv8CdaCZLWiJrS4MF
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 07:57:37.4467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a924bf31-1265-48ce-3a52-08df45499ccd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY7PEPF000000EC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7024

NVIDIA MGX Vera C2 is a dual-socket, air-cooled 2U server reference
platform based on NVIDIA Vera CPUs. It provides a reference design
for partners to build and customize Vera-based servers using the
MGX modular architecture.

This series adds the board compatible and device tree for the
platform's AST2600 BMC.

Changes in v3:
- Describe the platform's purpose and link to the MGX and Vera CPU pages.
- Drop the misleading RGMII delay comment.
- Update the write-protect GPIO name.

v2: https://lore.kernel.org/all/cover.1793705210.git.jackyhuang@nvidia.com/
v1: https://lore.kernel.org/all/cover.1793243187.git.jackyhuang@nvidia.com/

Jacky Huang (2):
  dt-bindings: arm: aspeed: Add NVIDIA MGX Vera C2 BMC
  ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts    | 1271 +++++++++++++++++
 3 files changed, 1273 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts


base-commit: ba3f2c447203166c640e40dc8e9b4b91fc613aa5
-- 
2.43.0

