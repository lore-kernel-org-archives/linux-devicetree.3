Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795710813;
	b=zELzhZt3JNRkpyOydo57hnuGIdTLyOX95oTcIEpAvkFMV6yZFs9QxmU7pbrbP2GDoVJ6
	 SVp9cxDGl3L8/fLuCtw5k/GuABa+fcDhLqTtCwfYqi5Rgvjsf/gUNxCikBhm7GI4uRk9C
	 1IFt1ZvrW21qlQL5ijyDaA0CT2GnH7oqIoejMkrrMxmRNbIvdIWec3omHkaKYr+BQbQOT
	 CmjSnmzMyR9i4uCzgtUX3avnQ7/G//yalxp4fPN7GlkWuGquTBDMty4FHTNHAClw2FqUa
	 KT6tSJTlzjR7/kS2cTbHHgTIQup67KxITw33SWQg8GM/rzYzXqsjqvH5NYKxBqmeB3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710813;
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
	bh=Mkx8nicNBIMCWYgZ96zxZlBX3TSq5DOuec66GH5Jdzg=;
	b=yCmZdMOJBJhzNNTvOwagcJCi5UP+37ZA/K/U3l4zipqHsBiw78o7wjevSywsW8DtNPLT
	 Dl3+PrYlXRjXrfKwMrdJOmrKwKvc4IbBaRnHdqFKNjhijaZLjd5aBg33QtCqirz/fOvKy
	 T4isjUFMLxlsvXEeJgroIEr1jHIdzPeYnFOjMfdXkOuTdK5hDMzNgc0uDCafVDz//qbGA
	 SC49865KpGXMNq4iguuTNrBHsNmT/gOV9azEmaRtd2sFOrf1mEvAH3q85l94PElONGwjO
	 d9SBxEDCs5DWfsvLagP/y7AfhxgETeuC1NY+xHKoos16ODLnReQNayCBd+skXF5hrJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L0uMP6ob;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.2
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013002.outbound.protection.outlook.com [52.101.72.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91371606A32E;
	Thu, 26 Nov 2026 16:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91371606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L0uMP6ob
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtqDqhsLO8u0gquCmCH2BTGWENjuLJuPrCnPwcYpkcrMwzvS6ThFcTs5EyVNabXDV0pE43SMLq/nx22FqbVy0DRzQRf+kTTbRdjjbua7BpTlL+0+0U7G6FKQctVprx03eEluqZHGeBiwmEtJMQqBBpTcHda/Ign41Z9BDvIDhjxqRP1u4NSgsGOTBWkCaeZbeNlDTwCRBuKaAvxdEBpPlKIEU8CrNgJjI6GfqlK8k0LVk5xrT4fmZgMEuSMGM2LuZrCHWuwiJAdw3sMFFljRbooRHJ/P53kA1Cz3u79iavy1TXWDYkHeXlU9iSN3oJYOq6UeG1sxJmggcK75lDrhrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mkx8nicNBIMCWYgZ96zxZlBX3TSq5DOuec66GH5Jdzg=;
 b=DDHs7gthFPZbPKNESyMpLzFHjabVPPx0k/Lba07iliiPNz8l9LezOzp/giSG/TxGn9uByHB2vpuxavon94iQ7zRVrcAOK8pGeRkjgxwaG4Xu+0EhWED4ZGv+A+BTRYxNiKvjksuw8xbS9NWqWgwYfbNtP0+Kwg+LKJH2bh7bUScnJJa7MKLfT1KhcMZLOSAFaa6vIjbaH6+ek/QJVVrb1rD0RTGIMDq7m4zFojKPgLbWqlMJV0ruJh1F6yK7zBUfsNB7eSjVeQAw03bd4kgyB5qvhl2OjQ3uL44thSS6TiVw8BApPShGKFAeseqd9EEa1FbcBe5U7GsNy8JUffpxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mkx8nicNBIMCWYgZ96zxZlBX3TSq5DOuec66GH5Jdzg=;
 b=L0uMP6ob1KXduxSD8kSKy7ATPtmBqLJiQwCu4K/vEk8AZbd3jWUKuHIIY6sRhPO7cGtq4w3L3OLgkZ6PaMvoH3RrUpt4H4u6sarS64UQ8ZsBGx5AJE29jeB2QkJI35yJk7+xSseZlgEOHXEJMX+Iq4zu7/rMZo07Mf3KdWcE8C4BzHb0XoSTDKdSDwVsIc4abAjod4Tu6HXR0XtvOIifUk+EZtPYnV/FPHcQVrV10ueK0eL8vK9sLBC1lbn8WQrvjx3Tc+oH80c+f9GKRBTkgl5dSmeHf0gHc+1lmii+BNi4i4Xr3LSt/29/VS2s5ai8GMvKplmriQbkco3yAp1qow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:33:29 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:33:29 +0000
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
Subject: [PATCH v2 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent Genesys 2
Date: Thu, 26 Nov 2026 17:46:31 +0100
Message-Id: <20261126164632.978624-8-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0057.namprd07.prod.outlook.com
 (2603:10b6:510:e::32) To PA3PR04MB11203.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 8d303cb5-3ae8-48c3-ec6e-08df4bdb008f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|261022105027099003|261022075727099003|10067099003|56012099006|11063799006|260925021311599003|260925021911599003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261102124527099003|260925022911599003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BPKN1NHngkxgC2Mi275g3BT/jyux09FPcFE1d+bjpn4/afXyN68nCBYAwHh56VsvzkSeQnTporv2mEIGKYAJ/9hrkBWtly1TueSey7qP2EmqCYp7+gFrhITpZATmUv1sXmixuNwJYbW5aQ2De6hwwr1dupOl8Dy22pwoBBeYqU1OdUWkqpkmAnhz5Hmty4ce+yGHL/vWit4d/ty1e2Wqv7SOgu6/TJSmbJ4tIDHS9bLhY3uPz+egWKAVwlr1mz+jOJOxnaISEExOJCHHVhx4wgCcTFw3oevygNfrupkKrYL6DiAyW0aHsJYYggzkJAP78fqMk2+QKkekUJWLQE+jQ48xsyEXQNvxFWJ5LSv25pCSRgkLcrHS966Z2rA7Q4KYUcH5p2+IRvR/OhM3lh63J+bG3JNQHXWyUkd1jUSi29EiJGYbI0u6a6OlfzofsMHxyOg2cBXdXpEgYwimHNHtStPL2mkwH7X//daHyEJSrLTqAAlKtjiqMZmifDMeiw/KHzkT+FMKzkvzzuugPCOw1x8f6t6fUrfdz6JSIrNdjguVhQG8SwhJ2ZSMnAqlOtG1Ze6jMZ1WjHzjsByt4IJxldxlYZ3IMfV77aCFX4GBR1LfYYVVm7xQ0EtVLWjJD7DG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(260925021311599003)(260925021911599003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261102124527099003)(260925022911599003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1I52qAn5cGnL8mi1PQafXn58/Wh//svLGfDXswaAnI20yPNKVHAnG9gZV1O2?=
 =?us-ascii?Q?e6T0aZK+cJP2FKApCpFbwvrpau4SXrNIj6py/EmzhPKzxDCqvCrVMJVxlUZI?=
 =?us-ascii?Q?ZfGN+H7e9BJNBqNMzWIYna2gu+AUIE0QJ9aNBrbcX3ckUa7jZbyU4bgp/pcC?=
 =?us-ascii?Q?u0g9Jrv93kLNIfcPzfx2YM4c2oUE1cmRlPAJv6o96D3M9yYrhtDBVMol1Z02?=
 =?us-ascii?Q?+RXMUME+TwFs54XwGvIIp0MXkNgljONdixAZ++d46i/SnLXQhIYrmwOyfDad?=
 =?us-ascii?Q?ym9PTlKQ59LyxnuA/6+ZS/u43zmYdWMUZzVWV7f4Yak15BMCCpC9S0CPl0Ob?=
 =?us-ascii?Q?mg3TwaOgakfk+ToHwXyZ1tlvhGAGn99fxq61bDZcWTO0LDKOAcwwsgy7IAKT?=
 =?us-ascii?Q?NRZ8IEHmD+y1e74TrlzHXPGEhqEFUunm0v6JqYpvY6rXRbaS2GwM6nUCSwHa?=
 =?us-ascii?Q?SsfuiHwdPftt3Q7G+q6QCbcgBr/nqWmA1t1eaN6aERnH6o4tc5tEGs3r1P1d?=
 =?us-ascii?Q?NnyK/2DGqz/0rfqqMslxQ4AZxbnditGTP92JASYZ2xMnUOTqhxezI9r3nfXV?=
 =?us-ascii?Q?yjm6VB0jivoUVQSit7H5jckOAixRiIi2pSxme2nz7xd881VR8dTqpVBl4dA6?=
 =?us-ascii?Q?6dLbI9l8YMpoAtFUcBWRcQ/XWq/cYva1hMYyXIthHLCNEaiBCTEaPzphvdSW?=
 =?us-ascii?Q?4HjKgeNkCCkYz1hms5wJfshO4H2lkJy93mS5WEwjxo7HF4tpBLTdiMhEq5Sr?=
 =?us-ascii?Q?EprwkdVDlu1d14wNXD2M7VW54r5UBcclKkWHqc50PEjJ8vgrsrEkLZQ/fCSh?=
 =?us-ascii?Q?iFN6w46HlZ4FQ3oQslarTa7dl5wsCYbZ3yHdfSwyO5guba6C2LMKquQXa39g?=
 =?us-ascii?Q?ApvA+IhWtbWH8xr2vUkyRimjKA0bARJ8wLbjbxeICaM2bxmex1MSVjqqlyNR?=
 =?us-ascii?Q?8k/gNp+K6kaUB+UkVtudFqKJ2rZ5TRuCSNBYjbI0HCLIZCi/NxCNUobMRwqg?=
 =?us-ascii?Q?JOJEzfE9X19OEwktFOGBAGaoVbge3HYaIF5R++yruGNcT7ikrrTqa/34Zpi1?=
 =?us-ascii?Q?pPbrWVGWu2U1zOB7w9gY3l6Q1bMm4DfMPMikxNEZ3AtDuNSw8+l4X31lyeG0?=
 =?us-ascii?Q?UFPZlJwlWUhTREIF+U4GDw2cE1IQudF1hNcluggWuxpE1FM41gGiFSE90dIF?=
 =?us-ascii?Q?8ZxsQ+IQ1Fnn91MW6TU7JU59+4/RkEwRgKBbaA7jVYKIF+IXhpKfkduOhO9g?=
 =?us-ascii?Q?Ih4GLoZSv9er2IedTYBz6PqUtzz1TEJJlBd8YlXSG20BhZOskf6FbgI1HExY?=
 =?us-ascii?Q?uZMbeJeA8D7mCJKZC4ngW1XQj94Y9hxv360rmN7ypksCLQDkOfMCPnljrnvC?=
 =?us-ascii?Q?GvdQ0+MnmTntl1imm+j8z36lkBm3fgJwCNbXcN3jsMxxYOYhIesy+lPCwGAy?=
 =?us-ascii?Q?rE0Hahf0Ox454Da1G2Bd2xAXPlw7h/hT0eD1O7HSy/Mh9e3WNBdHoSdjXOu/?=
 =?us-ascii?Q?VSt/tgSBwvmu2LEkXdHUe7DNvVfPP5+RQrsoC/dCXEHLZE3wsLNDv6wPZBn0?=
 =?us-ascii?Q?y8HQwLUf9uhH+4zmMPAhNchJwxUt4FcZaO9mdA7q10n+buOrQRmu36Psg+rL?=
 =?us-ascii?Q?mOrYIRpZgYZ2nmNDcgkfdwqUGNKqbyMfBzIRD2ifb2lsml6Tlp0un2qb4KBV?=
 =?us-ascii?Q?sqR3EZZwXSMTC6eGsyvu3mH0tW9/cC/EbHs9/AO1TNyNuZlwzxli6nZFef62?=
 =?us-ascii?Q?yxWrGar1AXVLqx0rTXccVYs1oVt7O3XB1KW362tTFRF9ISF6TaQoNLsboImx?=
X-MS-Exchange-AntiSpam-MessageData-1: CiE1fRVzRyKHrA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d303cb5-3ae8-48c3-ec6e-08df4bdb008f
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:33:29.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGY0ZwVwr/PcQoErv2SbvCHmnDAuCKi9kpw4EupjXs43IrRyn1KwbrMiOORSVrnpzBzRzs2a6INXa0Chx57RJgxSjQCzJeBcZPjaAq78tlNDWt/Y9JU79qPPOUhaOaXteudvd/6/+LjfQtseWmv4Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The CVA6 APU is the FPGA SoC built around the OpenHW Group CVA6 core in
the CVA6 repository (corev_apu/fpga, release v5.3.0). It targets the
Digilent Genesys 2 board and provides a CLINT, a PLIC, a 16550 UART, a
Xilinx SPI controller connected to the SD card slot and a Xilinx GPIO
block driving the LEDs.

Describe the SoC in cva6-genesys2.dtsi, shared by the two configurations
of the core that the FPGA platform builds, and add a board device tree
for each of them:

  - cv64a6: rv64imafdc with the B, Zcb, Zicond and Zkn extensions,
    Sv39, 1 GiB of DDR3
  - cv32a6: rv32ima, Sv32, 128 MiB of DDR3

The ISA extensions follow the core configurations of CVA6 v5.3.0
(core/include/cv64a6_imafdc_sv39_config_pkg.sv and
cv32a6_ima_sv32_fpga_config_pkg.sv).

The platform also has a lowRISC Ethernet controller and a PULP APB
timer. They are left out until bindings exist for them.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---

Notes:
    Changes in v2:
    - Use the versioned board compatibles (Conor Dooley)
    - Add a clocks property to the cpu node, replacing clock-frequency
      (Conor Dooley)
    - Document that the 50 MHz clock is a fixed MMCM output

 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/openhwgroup/Makefile      |   2 +
 .../boot/dts/openhwgroup/cv32a6-genesys2.dts  |  30 ++++
 .../boot/dts/openhwgroup/cv64a6-genesys2.dts  |  32 +++++
 .../boot/dts/openhwgroup/cva6-genesys2.dtsi   | 134 ++++++++++++++++++
 6 files changed, 206 insertions(+)
 create mode 100644 arch/riscv/boot/dts/openhwgroup/Makefile
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5c..17865074a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23566,6 +23566,13 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	arch/riscv/boot/dts/canaan/
 F:	arch/riscv/boot/dts/sifive/
 
+RISC-V OPENHW GROUP SoC SUPPORT
+M:	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/openhwgroup.yaml
+F:	arch/riscv/boot/dts/openhwgroup/
+
 RISC-V PMU DRIVERS
 M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb1..305a93ad6f 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -5,6 +5,7 @@ subdir-y += anlogic
 subdir-y += canaan
 subdir-y += eswin
 subdir-y += microchip
+subdir-y += openhwgroup
 subdir-y += renesas
 subdir-y += sifive
 subdir-y += sophgo
diff --git a/arch/riscv/boot/dts/openhwgroup/Makefile b/arch/riscv/boot/dts/openhwgroup/Makefile
new file mode 100644
index 0000000000..a75a5863b7
--- /dev/null
+++ b/arch/riscv/boot/dts/openhwgroup/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_OPENHWGROUP) += cv32a6-genesys2.dtb cv64a6-genesys2.dtb
diff --git a/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts b/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
new file mode 100644
index 0000000000..f625e868e3
--- /dev/null
+++ b/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright 2026 NXP
+ *
+ * OpenHW Group CVA6 APU, 32-bit core (cv32a6), on the Digilent Genesys 2.
+ */
+
+/dts-v1/;
+
+#include "cva6-genesys2.dtsi"
+
+/ {
+	model = "OpenHW Group CVA6 cv32a6 on Digilent Genesys 2";
+	compatible = "openhwgroup,cv32a6-genesys2-v5.3.0",
+		     "openhwgroup,cva6-apu-v5.3.0";
+
+	memory@80000000 {
+		device_type = "memory";
+		/* 128 MiB of DDR3, as configured for this core by the FPGA build */
+		reg = <0x0 0x80000000 0x0 0x8000000>;
+	};
+};
+
+&cpu0 {
+	compatible = "openhwgroup,cv32a6", "riscv";
+	riscv,isa-base = "rv32i";
+	riscv,isa-extensions = "i", "m", "a", "zicntr", "zicsr", "zifencei",
+			       "zihpm";
+	mmu-type = "riscv,sv32";
+};
diff --git a/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts b/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
new file mode 100644
index 0000000000..a98c38a55f
--- /dev/null
+++ b/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright 2026 NXP
+ *
+ * OpenHW Group CVA6 APU, 64-bit core (cv64a6), on the Digilent Genesys 2.
+ */
+
+/dts-v1/;
+
+#include "cva6-genesys2.dtsi"
+
+/ {
+	model = "OpenHW Group CVA6 cv64a6 on Digilent Genesys 2";
+	compatible = "openhwgroup,cv64a6-genesys2-v5.3.0",
+		     "openhwgroup,cva6-apu-v5.3.0";
+
+	memory@80000000 {
+		device_type = "memory";
+		/* 1 GiB of DDR3, as configured for this core by the FPGA build */
+		reg = <0x0 0x80000000 0x0 0x40000000>;
+	};
+};
+
+&cpu0 {
+	compatible = "openhwgroup,cv64a6", "riscv";
+	riscv,isa-base = "rv64i";
+	riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "zba",
+			       "zbb", "zbc", "zbkb", "zbkc", "zbkx", "zbs",
+			       "zca", "zcb", "zcd", "zicntr", "zicond", "zicsr",
+			       "zifencei", "zihpm", "zknd", "zkne", "zknh";
+	mmu-type = "riscv,sv39";
+};
diff --git a/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi b/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
new file mode 100644
index 0000000000..910b2f96ba
--- /dev/null
+++ b/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright 2026 NXP
+ *
+ * OpenHW Group CVA6 APU on the Digilent Genesys 2 FPGA board.
+ *
+ * The SoC description is shared between the 32-bit (cv32a6) and the
+ * 64-bit (cv64a6) configurations of the CVA6 core. The core specific
+ * properties and the memory size are set in the board .dts files.
+ */
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* The CLINT mtime counter runs at half the core clock */
+		timebase-frequency = <25000000>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			reg = <0>;
+			clocks = <&clk50>;
+			tlb-split;
+
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+			};
+		};
+	};
+
+	/*
+	 * Core and peripheral clock. It is an output of an MMCM that the
+	 * bitstream configures for 50 MHz and that has no register interface.
+	 */
+	clk50: clock-50mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+		clock-output-names = "clk50";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&gpio0 1 0>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		clint: clint@2000000 {
+			compatible = "openhwgroup,cva6-clint", "sifive,clint0";
+			reg = <0x0 0x2000000 0x0 0xc0000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+
+		plic: interrupt-controller@c000000 {
+			compatible = "openhwgroup,cva6-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			riscv,ndev = <30>;
+		};
+
+		uart0: serial@10000000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x10000000 0x0 0x1000>;
+			clock-frequency = <50000000>;
+			interrupt-parent = <&plic>;
+			interrupts = <1>;
+			/* Registers are 32-bit wide and 32-bit aligned */
+			reg-shift = <2>;
+			reg-io-width = <4>;
+		};
+
+		spi0: spi@20000000 {
+			compatible = "xlnx,xps-spi-2.00.a";
+			reg = <0x0 0x20000000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&plic>;
+			interrupts = <2>;
+			xlnx,num-ss-bits = <1>;
+			xlnx,num-transfer-bits = <8>;
+
+			mmc@0 {
+				compatible = "mmc-spi-slot";
+				reg = <0>;
+				spi-max-frequency = <12500000>;
+				voltage-ranges = <3300 3300>;
+				disable-wp;
+			};
+		};
+
+		gpio0: gpio@40000000 {
+			compatible = "xlnx,xps-gpio-1.00.a";
+			reg = <0x0 0x40000000 0x0 0x10000>;
+			clocks = <&clk50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			xlnx,all-inputs = <0>;
+			xlnx,all-inputs-2 = <0>;
+			xlnx,dout-default = <0>;
+			xlnx,dout-default-2 = <0>;
+			xlnx,gpio-width = <8>;
+			xlnx,gpio2-width = <8>;
+			xlnx,interrupt-present = <0>;
+			xlnx,is-dual = <1>;
+			xlnx,tri-default = <0xffffffff>;
+			xlnx,tri-default-2 = <0xffffffff>;
+		};
+	};
+};
-- 
2.43.0

