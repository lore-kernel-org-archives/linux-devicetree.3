Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362103B6C08;
	Mon, 29 Jun 2026 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728609; cv=fail; b=Y9RYEnKJ1rpx23lYmmbcDYELrjN7gbG5JEc736SVfq/EMpG1JFwPXBu3javygBGwjtHOF7k2id81YJsqlFXYQTjZuJqGSFWd8IVSvuKpfh6Q0jZLLwFVIARokE55324WqkheN/qrJhazOLNaV7Kkv9hz80AarkxhBGn0Ef8fG9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728609; c=relaxed/simple;
	bh=mKdXcu17PZzVFYKvwRMYgxHq0HnSflcCz9UYiFwZP3k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QRqPvK5cEoQXAfOHOsleQPiY4wKVIJFyj5/DnWqn4Rm/rI/VmmnAyPNNElP5K8Y0Gjq6DtQQCK2P7HOO14TIhxWKqHdzuf8DDCCXJ8iridauMJnI4pSzO4wKXpZcYmpm6Vl7TE7sLUVPw4ygujRmf+LwgN6qzA30/ULkZQcagQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=a4ZumzL9; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ervIqhHU; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="a4ZumzL9";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ervIqhHU"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6kskL1393922;
	Mon, 29 Jun 2026 05:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=TGJjN74hH8ITi
	xisMcmPBCYMO5202oJO2OiQ7TWKXEA=; b=a4ZumzL96Qsc2G1294fwHabOhVkDt
	eNGyJg3DZF5Jhvonsstz0e50x75/Lfx7AVEQqOBsOBAoTodb09VIi26Afh/GitMT
	r6e8xKoi4J/CSSu1+PMX5EmfaBvLpLNvdmjwmZDA3goz1XpMrp8olScaPCVyM2WI
	v8JKwHs7fCIDmIhcZzhA1BtE27eQL6PUw/kss2/dIW7Ac/pVevoUQD9LaOIlxyZ1
	ay4ymj93SMiYNvIIiNgBq0hJ+yaKN1G02j/O54oFjO4UBZ1cN/c3TveI/xjSRXFn
	T/hjDjdlqGk5dtHGPHDbrOF+830BsbbnmfxojluQbWovzG8EtsLK6Vc8w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f32hjp11t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 05:23:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQWgaVAbL/oN+Kq7ap3NZ+PLgJtuVlVacebP9qa07Y/0+tgxAco0B9adjysnnzWnCX4/ttp/iEIrBwy1dLK8+kCdRjjRYT4323tunBX+lc0IAbuarRwqCNzwIDslr3qgeGqGX/WsoqD6AWk5cmapRDpI090+Hcw1DkZ+MKXskQuODHYDnwAZXO6OlxyDtk1HA4VSXV6HvfyHA4iae8xpZV6XD90pnpgYSH18y4Oyqa/PCir2wM4iKmox3laeynPzZnxrS0M9ub0tlva7bzi/fkR1do5xMharhk11ywT51r9CppyvRlQ9IOaU846qO8q5/MOo3RbkbclBQbOIW+EhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGJjN74hH8ITixisMcmPBCYMO5202oJO2OiQ7TWKXEA=;
 b=eo4dVoPxfsbdFiOoOix9D5nQ6GaBsBmyZHrQk6llLKojGaFe4dubIj8v0GDF9ZOo1TtZux5HUdIwUtdev4mtmcnFSrm9ZKCiudjZuVp1Q1eyquCc74qU0HO7BZxnlT90Gtl2Jmbr6gpOvLYbplv/lnFngUMU/YE661r//z7uARNq/F+BqvBD3Rx6Oo/hI5Tb61gxpi9iiqqBUUeIQm0sGHtdqJLhiw3Ty0zrqWk8ERMIdX6fRkjKlBmM0I81+SftAhZHnI5uVqEWsNPjUddDnTsmaepT4t9JbehtUFqqWlANfwoCcLyhGk2h1YXF2i9Je8N0KerAGd7L9su7pEe0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGJjN74hH8ITixisMcmPBCYMO5202oJO2OiQ7TWKXEA=;
 b=ervIqhHU5qKJeAscGe42ghJoFBmQOz/5caYMrgYAK7RhgJJKcsTlHgWK8GwswBAWPh3xVbMxvSXBA/pwUQtc01Lw6/uS0UkD/KrR/E7q1d5juu/uZac5YIcJJ9J24nJFvcQY6WwVqy3uZ2z1AHXisvmvyU4kFAKSmKys0dMk1O4=
Received: from SJ0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:a03:39e::16)
 by SJ5PPF5B5767B72.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:23:15 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::38) by SJ0PR03CA0281.outlook.office365.com
 (2603:10b6:a03:39e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:23:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:23:14 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:23:13 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:23:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 05:23:13 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TAN9oR237237;
	Mon, 29 Jun 2026 05:23:10 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <g-praveen@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] Add support for dual port USXGMII+SGMII
Date: Mon, 29 Jun 2026 15:53:05 +0530
Message-ID: <20260629102308.56616-1-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|SJ5PPF5B5767B72:EE_
X-MS-Office365-Filtering-Correlation-Id: 19238639-b750-4d58-6413-08ded5c86da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|56012099006|6133799003|921020|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	fbm3gKomC6htL70dy9GM53MtSZMQtg1YFirztzHhgIXSX0DoRbRU64QZ7ouU7s7Smep/1qHy+LRKZX/bve5gC9qsPC7oCTr2J52Dt1C43JXIyJkz+k3sbvx/Uz/UCHoerbt4dLuYdf4rb6t+IfKI6i+2IODHAUt/FukBexZuwEYChWBLHKbPfb8Vzf06915ATYdzze27Si2GLjF/3q2VTAw22qNN03TH3oP+Qcin+vDYbv2yBNghTfXj2LeCPEUIs1sGSvjp7g366H1orZGC0Yj4v+NB1rBA1qEktyr/1pPpvj0HTrZkmLohevehAfGoT2nZOOZ5b8xid6yzeWkCyU9nAF6zyeuwRJwNIzKa4lxzHxDlXAtBx8e75+jtn07D48qebH4kPy6x5JysrkShpAJG5BiJICQrOUYYTx1D+2r8m5hmAJ6o827ecD5VX0CDubZs/2QStylxZlGBskPmja1NwiG/dBGGCIRlv62ydjIIQ9p9j27/SCMVopUHbCsmlXwgLSElhMzmqIwIpVOFGNyjZS0HWwTBDTNkrAOu2SglSQ/1ObvKkPAdilcHe3agx9jMR447veaKdVnCU2k6xZ1jromqp7SOnoAsQJqYfSFw9gHux+dOpq9xyAQXLARt1neeJWWLJsCQ/NsO0yu49Xcn6kk8FlCaCTcxaxKDA6DMP5y/GHumBkZ5TceZaP001b/Uvi3KpiNpDE6yhPL6KiHHUPOBtS+i30xyR5rAi6Eq/zMMsz+LBv0+CTiADPYI
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(56012099006)(6133799003)(921020)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MHd+gvrpOqq06opF6rGNxsw2nLAY+3E72x1HmmwvuSZ+JqY811D0VMJHi2oujs5fG4A1bW6mUD2e3SuIkB9UlGAKfkjBuYcI0iV0wEbXuKoB/+tNRsF15Xbn2nwnEEDfuafLNhtrGMWIxVyl2WACYGGmQ0keT9dhEFqGaTSCdyjKoeeEte0VZIOTUj4+Alu59l1YGHLjnWRRjTZ93BRaiSRH8BGa31gffGetNweLqR5SaijzEeQFMpNuWtHWRAfVVb4uygyUFUAK5bc2f5C9Hya3qE6mw2FykC05NTY77KPTYpcHrIz2tw4Monf1GW5W/fy10RxduRmmj8pHEVfCYPRVwnS5cRfUp/m26JqBo0R1xeG1qNdQkRIGqHN8c/E26iZ04/SxvlwQZExWSDahTBq+Uxl//uQ15xVZXlRq2S6wA7BPtcaihob/Eg7qsBNN
X-Exchange-RoutingPolicyChecked:
	jaTxPDzRft6KQAwI6ISAMHyDwy3pZo7ztJSP9GDj9lsku7JtwAOZMCDCywnPapGPo+QlRvjtTRXCbqG2gaPnt3B2ncZO0P0/mAKZv1VFEftYskIREbLyaxbR0NE1SzTF8unXwYcYGTX9M6s6Jt5A7akQrAl2QPttkPrHFMwY5PvPWxNdOMP1uP6+EW+kqcejGzTYwUUIGUd9CTuCY1VJ6cBiy0t7c9u1d+QzcmpRpZoQvIc4muJd/NuUb7lIug0u7WN72g2YsoS+yHbBhQkdLlpb9BzxxiJEB8BGK1vmHo0Qvpm2vW+unwJb3wgNVpAl1Eqk6Ho00z6tWvuoWZVm0Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:23:14.1709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19238639-b750-4d58-6413-08ded5c86da7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5B5767B72
X-Authority-Analysis: v=2.4 cv=DrlmPm/+ c=1 sm=1 tr=0 ts=6a424796 cx=c_pps
 a=G+edI3GLQse3gACT8XNfSw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=NEAV23lmAAAA:8 a=ce3QBi7gg1z_twByTH0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfX/iCssBKeZkeS
 gJIrGomEO2tCShxQc/zO1U75rLmDNc+Z8wpxaAa2wqydenFEGRFJ1IP+L7IZu3tE7+J4TYr30rE
 1c0+209ZpCO+sDD9XWnEEApBTod581uvaOfsQJUrJuhDhDjUidrAW7RE/AX7gqvwitnKj4FoX5b
 ZifJgRLixY6qOTaDIqharsBWmUNTo91UkQVGuKoGXWmdq8w+UjJByx01xC696FPS4JlRjh0ZbAQ
 r0Sh2sE9PUURtmudW0T+7MwMdThSyV5srADklWd2/ImjUuJdktMe1VYruRrFBhzTu7iPWguD7E8
 2SFd9lTnPssH4uQNtZT4/ZrLZ9lFm+KR0+6Ciqn2wOfQvfnpuu2AOhyzTm8eKAZgzvLY9c/uc4L
 6i3+AJBZ1tKLomFAqgcVNXuB0C1FU0zAF3So7jmmrMJ1wvk+5ymmyFEJ2zNc1MUtAcMC8NNtZsj
 vpdrfDotsaruVEkzw6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfXwVM+rPYWzwvs
 Zmvy6k+WLT9cy3V1YxaUrPpzT68PTHZf0/a80LwrZI8IQUL28yLe7rrKtgyh0BDLsE20QLf0jOg
 KEXKGAf7ky9rTdQgWVfR39+JzAJQ978=
X-Proofpoint-GUID: 4iHLkuCUsW3ONsRIMsMO4Cq5_FGeHwZ3
X-Proofpoint-ORIG-GUID: 4iHLkuCUsW3ONsRIMsMO4Cq5_FGeHwZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290083

This patch series enables dual port USXGMII and SGMII Ethernet mode
support on the TI J784S4 EVM platform using the CPSW9G Ethernet switch.

The CPSW9G instance supports both SGMII and USXGMII modes simultaneously
on MAC Ports 1 and 2, which connect to ENET Expansion 1 and ENET
Expansion 2 slots through the SERDES2 instance. The series includes:

1. A fix to the SERDES2 node to add the missing PLL1 refclk, which is
   required for multilink SERDES configuration to function properly.

2. A driver fix for the am65-cpsw Ethernet driver to properly configure
   the MAC in SGMII mode according to the CPSGMII Module specification,
   including correct advertisement ability register settings and master
   mode configuration.

3. Device tree overlay support for two board configurations:
   - Board 1: Port 1 in SGMII mode (1Gbps) + Port 2 in USXGMII mode (5Gbps)
   - Board 2: Port 1 in USXGMII mode (5Gbps) + Port 2 in SGMII mode (1Gbps)

Both configurations use fixed-link mode and provide flexible multi-speed
networking options for the J784S4 platform.

Boot logs:

https://gist.github.com/GokulPraveen2001/7a09cc5ed0151d264f32cbbc31896605

Gokul Praveen (3):
  arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node
  net: ethernet: ti: am65-cpsw: Fix MAC configuration for SGMII mode
  arm64: dts: ti: k3-j784s4: Add overlay for dual port USXGMII+SGMII
    mode

 .../bindings/phy/phy-cadence-torrent.yaml     |  4 +-
 arch/arm64/boot/dts/ti/Makefile               | 11 ++-
 ...s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso | 92 ++++++++++++++++++
 ...s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso | 95 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    |  3 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  9 +-
 6 files changed, 205 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso

-- 
2.34.1

