Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795710798;
	b=sizZj+G5IbfIPBGxAB7e59h5pUubQFgF27MFCaDbI8BxBZ4BmPNGq7VAyePY/C0BQuHj
	 ew4SPn761/kd9J9KQX2BKFsE7LaFhkiLjac/xyn/mqcc93DzlLbzAOiOOHl5JppBjhZJn
	 GhNEKXSJIukV2BNbfP76FGXQf0aW6bwPofw4BFa9kQvFcw/JPWcTvGP8Ni/PrWvpGTGKC
	 4ID3VsxCjx/Mlr5Q9qgyCUPu4juKnFwJ6ucpWkv4oKkuAPDwLqG+YWQ1a6EJI9ad9+tJU
	 zkdcwT+iFd+4Z3wQTfxMs7xNLlvNyXcTNSoi3J4BjMBM+cLhBH6MopIfk2wCSAidpnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710798;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yXSqdGnF+1siI4OUtLZNl4j/oZe0ZWZU7PjeM+WYtLE=;
	b=SuTjqDMPFlDTn/VD8ciIthDFMN8b1sFkNj4lSzmPdcDuvY2Bv9Cd9bQdkFN72wFPlEPE
	 jDel8EHQMv7UMuAQ2v5jO/hZkbQGSiHE2yeABhjbe8KS2UuUb2zPie9UfaB2kyzjUB7KT
	 8WVBWfkthET+qHhqrGMyjDPZDXUYAXsa5v6Ev0DOlRruNGU12Rcb9Dlu8eyN4/ejCppn+
	 CnmkGjuXZ2Y0shV0nJeI7RQOPx+AgcKeQyV8ATCoRo1ByA8i18xTnQRc41P1VnarbVhtQ
	 c553/vt6igX3Jaj+U4hr9+SIi0Cdjf3u7xTCYrys6kS3QUQc4DCTky696766EdxDEsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=axL3pRkw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.32
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013032.outbound.protection.outlook.com [52.101.72.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91042606A31E;
	Thu, 26 Nov 2026 16:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91042606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=axL3pRkw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ndf2uEyCZ09ZD0BEVrX9e+odae1AmeabpOIaKzxvGE81y1pxstVVoe14ZO8INoXDWo/Tvjy7EeK2A4mczQGe3Gy/Ynlbo56Go0LqWn3aYTs4a2lchvUvhU9MdtOdr4NjehHVOKcOME/Y8c89FmFH1gCxdmypQrt5cauUbrI5RkXGUs4ecvwgKzIutBJ42jnStZpIvqLo0DeNKPxM1lNKY7z+I5lv3kBnpZVzK6sbcZ0kFJfUgANIrU5e8ncxwJzh06f3Rj0Rt3UsUA892KMziCEnuqUNZ0B1WrQbNn/yckoIGQIuzDM35F7zAFwQNEq7yvhHjWjfYvTD7g89dTbfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXSqdGnF+1siI4OUtLZNl4j/oZe0ZWZU7PjeM+WYtLE=;
 b=GKrQRVLzl3A0PZOKlmbuuqsKjvWvNFh5MKWH881quEdRyNlbZEtfwQZ896cAbJDvNMDS/ZRMqF9gjgRxypmmgQ2XOV8zMnCsBXeBzj+AH2TjuBtxaXn6Nb2HX4cOt2Yf/WaZgyRbFjpZ50b3tOa8WPjw3RrP1ZoHf6H0JleRYJwUA0XJeRUgVXjSgwZLU0y2bY2eWYKp+4hjO7tu37K4bFqAnKxFia4IhzOdx7wqRp8Y74jTIhe7m7Exes7i1n0n6hwu5fofAUQYnI1XRETGJg34P6jpkyIir1An55feUkU+t/ohe3E4FTk57Y01mzuUJQ66VCC6YLRqS0X68NvFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXSqdGnF+1siI4OUtLZNl4j/oZe0ZWZU7PjeM+WYtLE=;
 b=axL3pRkwQ+wSb9Hnanyg1niusa3naTbdwSAjawsi2nq/jB+jR/qaIcQ8L2TK1hLCC8XCugcouQifUqh5ukzDEDpgRhTLO11sXkHuCzsBayQQjzV8MyL4LZTkGtN4/8jrPEoiqcpzJhGb94O/ezQb8LOIYaLC22puPr7/YoIqBdL06palb3/qG/7cNGOlIK4u172j4rHfPQjKLUoU+THRfKezHFIZvdgtIxtPtgN4deOPCY77oZOQVhvpK0eezKhrWyDrsPPe68P54Vyqfy5J6cvfu5WiuJRsqBR7K/w9SJBZp1b3MZ1mD0H1lrdnlVMoFdXlzG83XcnRW9gMqm2hWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:33:14 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:33:14 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [PATCH v2 5/8] dt-bindings: riscv: add OpenHW Group CVA6 APU boards
Date: Thu, 26 Nov 2026 17:46:29 +0100
Message-Id: <20261126164632.978624-6-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH1PEPF0001330A.namprd07.prod.outlook.com
 (2603:10b6:518:1::19) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f453a7-a4ef-4fa5-dd00-08df4bdaf7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|261022105027099003|261022075727099003|10067099003|56012099006|11063799006|260925021311599003|260925021911599003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|260925022911599003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/DJMXgyKu2BPJw7zLdcgs7ICzHkhExM9QjvRo7GcHLP6OummOnBdK9kdKqDVljVLNh0jYeCIp/d77q+H9G/A7BqW3jDhOmmP2TbxWi7xQ/Dq+JelCmSXlG5zZbBu/H8vyLUPv24W4BUYv9IFDz8zV9peGdshkyPzC8W4qYlMSl9xjIopM0ELqhdoRGn+d9FBnwtxGoQ0z5uZ518KQWMUM24N9aFAse5BCQxXs+9WW3dZe7irVa4IhWyEyi//GFPyjxDtb8bqVqOzQ70UwnQ2RcFsw6zOsod1Gkizn73ccE2C4hgV8jgoELbBtAEQwHg5d+FRLPqLbfDdVjKuEXKUjzY0KnCPKV5x4yhy1A5BXvJ55oXMyN9kpzl16FxKYznUElComo/a+IGaR95IKanyF4Fu5qlqaNEXLJa838QAN+XtQ6sxLMgaA2dzsRWJDXYDoZnBkff2iCt1u34hucikAct8UY5BSF027kqQ9WtXhhRPyqmFP65jcFpJrZvkygVgq05TNoTUgEq/pZiRyC+Tx2I/tTlFD6NRuMwOFf3nOwi/4ueaZIZDhwx1wkWj1mPNb/F1X/wc7P6aNx962kETOEgJAWrQoM9vF2kDNr+MB0PGS9r4JEbyBBJUrTc4HFSi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(260925021311599003)(260925021911599003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(260925022911599003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EzfmIlcMgagx1axbeH2+f0i/Gh0luSE63wSaSx4NQVGOSSqvPStP68ePW3gf?=
 =?us-ascii?Q?AX5raBGyREjMJk9WES6NcRhvrRvB2fSn/W13cfb6W5QELj6oqWTUw2LQ4/8w?=
 =?us-ascii?Q?9uk0k3xgFyR7K6G9iNIh8xM0UvK7sCOKnVsFtrKSpei+p2oawLFCqZFHHxme?=
 =?us-ascii?Q?p0j1R+xd/N8FKO2kTyxDfjpY0tW7azD/4HnGjdO77kfPp8UEpjcMg2tMO2G1?=
 =?us-ascii?Q?yUWl3xN60Ns8lM/VcAUNPdgXEZ1jeVu8C8YLfF3HAqBHTlzrHOubTdG9ylrQ?=
 =?us-ascii?Q?9E1B4DgXP1OtMaiwK+fwSsVKbsL8GvGwcmnxDbjNEUiNfM2n3i2hDUFAjadZ?=
 =?us-ascii?Q?Y5G9C29joXvXlBlRipuBkNK+LuJG3RRhU3KpI4kgvwUCC9wEOVnX5vcQYulf?=
 =?us-ascii?Q?uTKnu/Yv2ihHD4qu9Z6GJZlCc4AEAk+3/0SApnGO67TsA2OVIvmU2hSUpBEP?=
 =?us-ascii?Q?e5C8oiA41yhyAA7Uwrzhe+8kV6V3uSRGZPA2agCogk91I+DfHDkZt6S5LmOE?=
 =?us-ascii?Q?N8ZR0Q8Xi8LgAbidI+jgS/Pq9nM1V3SNCi8wztnZlFMzXLVe7PMyXyQaib96?=
 =?us-ascii?Q?yHTYdsO1AiFQhNFi4kqnPAl8PfRtBngpuPqnU4zzqatGuCCTS1KPYyutvc1M?=
 =?us-ascii?Q?y1mUghXrU4M3EbiPC1Uzors3oPRVkvmVKK8hcw+ABM9S2ONtud0nidpyu2Ge?=
 =?us-ascii?Q?o2TbP6njb6imRtcm758yk4eiayDpCjQkW5M9yDm1STWwK7GLx6KZZcftAVIE?=
 =?us-ascii?Q?Bysfxgmm4zIJ9vNvLdA9MHJlqn/P1bol7Jh1D8YFc6KhSoMU3f8LdRKRXdZA?=
 =?us-ascii?Q?D/QrPHrvyf6ER7zFQoCuBLws+QVZXjAwoZunMXhiszH2ihuBd5RObSi3l3ee?=
 =?us-ascii?Q?NI9TmVWqqF+7sRRTg8H8UiBkJukldIOhDDXz22f4tcjqMlr5NRdbGqOaK6P6?=
 =?us-ascii?Q?u0fGEYY4mbITpnHHiI9F3wtlx48mBgZkp3Zm5GaD/U4oM6/j4DpESgoFWbs8?=
 =?us-ascii?Q?VxAd5hkGL0oUnuX4f7Hu/690FMb3wUbS5gA+Bs+rIwfzBg2UuHB0uqOtKKUg?=
 =?us-ascii?Q?TnXFqWwR9LdxnIKMAxXoxMh3HI5jL8jcmJiMFkLX8rDGhAt5efGTSO8s5f5a?=
 =?us-ascii?Q?lewHF8EI/ZYlTlQdSozqnH54Q1YvRM36oNTpmOX7nJNzHLTK71AhBYUb9o4i?=
 =?us-ascii?Q?4AYDdzCfyUuNQp+ht9gPgx798TYnj3fZtgyM968rWJvWjERyJZ1Z4pwbpCvp?=
 =?us-ascii?Q?bhheDR2DpOpNf+zGVulpKOG428HEQ3Ecsu2mxDu1p4TSYaPWcR/c3TIUwG8s?=
 =?us-ascii?Q?e9yQhCmIRteyJ69Mve+7xNM/Fciey/TH8xuD5ZOn2BJX9+kLqIw84gJkC+kN?=
 =?us-ascii?Q?T/DqQL8pVm9C7nZe+/hj7Ea8VMZxg+pnDD7hTxOi6e1OHLyIg5RUvkwJp77y?=
 =?us-ascii?Q?yW3xbfNBEkL3r07OQ6HHiqttn1NNZkatQR8CqcqKv2/lVSZjGef2b7OuWNTy?=
 =?us-ascii?Q?HU7v24IYafZp7uAWe2PE+TCn1me55ZIu4iN/2anToyrPNllh6f5cbVjjg/b0?=
 =?us-ascii?Q?DLUxebJt1PYub2tJ74BTkmNp4w3svwjLyGhuCQ7mSznSmOjV1ftMe6lNu0p6?=
 =?us-ascii?Q?HCRc97a8xdry0tdgt6xrB2kLphJ96pNZptrA1xLOpz79yXIRvH55LObUw6JR?=
 =?us-ascii?Q?kUnVn0yorQX2UDylIJvnJMW7CWSEriRUx84Z0x2arIwCW8OySeypsLymYNyb?=
 =?us-ascii?Q?7asPXF+HKXhIIvog0gLbsY8nzygsjtRxQsyw3THcGk5w6+I8nMn5uoJJI4xm?=
X-MS-Exchange-AntiSpam-MessageData-1: /jFL9w1p7axYQQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f453a7-a4ef-4fa5-dd00-08df4bdaf7ed
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:33:14.7174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itp2Ft71d2PGU+WaZqTMGjbPcK8HcJ4Us3wgrKGP0SeYRrmAnMfADre/uRQtv2XhXXldjGgbn6eADNAuxPu8JrddBF5OrGLCJEo93X5u0HQmTXIhRB+hj0QtbPf00AgI1WUa4E8de0Z0rDFIxgSZdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The CVA6 APU is the FPGA SoC built around the OpenHW Group CVA6 core in
the CVA6 repository (corev_apu/fpga). Add the board compatible strings
for its Digilent Genesys 2 builds with the 32-bit (cv32a6) and the
64-bit (cv64a6) configurations of the core.

The platform only exists as an FPGA design, so the compatibles are
versioned and match the CVA6 release the bitstream is built from,
v5.3.0 (https://github.com/openhwgroup/cva6/releases/tag/v5.3.0).

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---

Notes:
    Changes in v2:
    - Version the board compatibles after the CVA6 release the bitstream
      is built from, v5.3.0 (Conor Dooley)

 .../bindings/riscv/openhwgroup.yaml           | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/openhwgroup.yaml

diff --git a/Documentation/devicetree/bindings/riscv/openhwgroup.yaml b/Documentation/devicetree/bindings/riscv/openhwgroup.yaml
new file mode 100644
index 0000000000..db40b70d21
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/openhwgroup.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/openhwgroup.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OpenHW Group SoC-based boards
+
+maintainers:
+  - Marouene Boubakri <marouene.boubakri@oss.nxp.com>
+
+description:
+  OpenHW Group SoC-based boards. The CVA6 APU is the FPGA SoC built around
+  the CVA6 core in the CVA6 repository (corev_apu/fpga). As an FPGA design
+  it has no fixed hardware, so its compatibles carry the version of the
+  CVA6 release (https://github.com/openhwgroup/cva6/releases) that the
+  bitstream is built from.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: CVA6 APU release v5.3.0 on the Digilent Genesys 2 board
+        items:
+          - enum:
+              - openhwgroup,cv32a6-genesys2-v5.3.0
+              - openhwgroup,cv64a6-genesys2-v5.3.0
+          - const: openhwgroup,cva6-apu-v5.3.0
+
+additionalProperties: true
+
+...
-- 
2.43.0

