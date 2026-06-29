Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEBD38F947;
	Mon, 29 Jun 2026 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728614; cv=fail; b=H4ksRNiTlzjVQImw5q1z2DqCAdGGiywcWFNouhBVkyVv1QdrGjvRjUEu8iRZ70fUfbEJmCwpZIFr1J5rVRnx60/oySFIyYfH87eAyz0UK0//MaFyK4JR0QJpLPWLL1qPrSqu28Wu2y7ZlbolCWJ0C/MdulmArZexl4aOJFlluXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728614; c=relaxed/simple;
	bh=7DXOt0L3ChPdzBRtEJ9wz9eu8O3mor03h7MIF1rBQvw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQZqpnVVjCPqSZfHBQvzPfAnrDKAF+cOdhZbkEyiEJRLKhoQkw2unxBtK+4cMXQsm+x0ldho2Kkkjxfc1mmkWZ6Ow1lHiRXIg9BrlTTg66IN97asLvcX4/6GFFSBo9YrM3dtG1Ai6lyOdbxk4f+fbkgJXhqTrSik0JTky1e1GNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CRqfFw7S; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G38BO838; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CRqfFw7S";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G38BO838"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65T6klxE1217298;
	Mon, 29 Jun 2026 05:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AdMzjuvJnbQ7D1dzSWMHeiM6jlej37r7wYohog7Hp
	SQ=; b=CRqfFw7Sp7pvaSOrqHNkWGsF7BqqKT0snwRq4uzPqBOpCpDjyoCh89XSI
	p3K/yFmVb8esMbs+4cL+c74WuZ191iktt7b996jb7tl3MntwN0DKfL7L+coQ75CX
	Vtd4F9D7AREJxlgi4AMXpPHnbWwuko18trrTOoJ7o3+zNdahD7blP+rIPQQizxfM
	6XHKe1YViyq426ptYD2CsIcBrMgSb+230tff34NVdbmr81TSxr3DV+RByR+VjbKR
	1QaRoB+XzpV11GZGe8Q8LhG422gx+Gi4PO9owCN9v8P7ZMzeWSrXtDEAovlMXsAk
	RT4aut9iweBzZ8ycPD494Oi64cYlA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f30fsepqk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 05:23:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXJl/2TUMPRdB0BhVyb+CTX3so46T9dgUVBHFF7bO5hIOFAH4sJ8SpkVnrQSSEWzfh9OYVS9RkaiU0hRONGxP9kGUKJQMjhjtEu0t9X2z18IpfqH8obqPl4LEv38s+pyQLOWpfIsRTBijbwkMIV+fg4Mqb/njigSDww6sZAeSFhhf3G+rSIsA+6944WvKC7NGoYSYfRwQTzc0EV9rDAWvhc6YyQFqv0LVOlrxM4ybn1JjuWhFvwcLG5hsKRrOpXNDZ4M49dF3TW/1U3p81nF+za/K3h6zpW2fhAU0W/gsini9796nPFxT+8xci5izZcbvAGBqcs3ieNXzK9zhzt6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdMzjuvJnbQ7D1dzSWMHeiM6jlej37r7wYohog7HpSQ=;
 b=IZ5rXpYB9fj5SGfxIZPm8Zjjz/ZFrFRYRKpZK2h6hWI7nuuJJdjU4q2h5F6QEADMOVX5JDq/Mr+k09ep+mG3fFcDO4yGmk+auV3AmmUl7F8t+tfz9sTkyWShuT4IXiLYbB7ccQc0neWICQp7Y9kN0IQVBHNJqoL/JuN3+xmbw9LCleUb4F9ZDFbxBZ60jpTgqMPkI9slM7mHIcPECG100LQLO63CGtpkp/D87iOihUClicMzt4ggfJ5eZTfkOvCzkLuXMaBdBCE00/UgC5EX+Jt/GOB12Y8eaERi6sTrF3QJYBkYXDzFv6pZIZJTn9Ra68i6mqxUn2is0Jcbya7B0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdMzjuvJnbQ7D1dzSWMHeiM6jlej37r7wYohog7HpSQ=;
 b=G38BO838+/r53Q99J4fz0FmOrswY3YyLJTLdkLboGAgMtnl5f297hhWhab3DOjhxQXQJ/ftDoGyoVE3UGnSjBG5EqTy2B6pmUlLrylxtk9ncz7bNQU48FY7IbpREi0k6AgnQWoTeukoW1LNClRWrwwB5PiM22z2fcs1JndusRpY=
Received: from CY3P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:fb::6) by
 CH3PR10MB7647.namprd10.prod.outlook.com (2603:10b6:610:169::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:23:18 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:930:fb:cafe::13) by CY3P220CA0002.outlook.office365.com
 (2603:10b6:930:fb::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:23:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:23:18 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:23:17 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:23:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 05:23:17 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TAN9oS237237;
	Mon, 29 Jun 2026 05:23:14 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <g-praveen@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node
Date: Mon, 29 Jun 2026 15:53:06 +0530
Message-ID: <20260629102308.56616-2-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629102308.56616-1-g-praveen@ti.com>
References: <20260629102308.56616-1-g-praveen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|CH3PR10MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a8bf2d-3e98-49d3-4db2-08ded5c87008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|18002099003|22082099003|921020|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	SGhYvZIu6e2v3TOONQfmtlgmxqgQ44It9k+qsWepEf8kzpITRxCqIFwzOu4U8MLnzz/Ua7Photf+2tXJe1MZJtRBGkXclf0bqG0B2jZAc+dFQgRevDih4smEOqmaZ4hB4ggWt9JF2x4Zq0cNZIedlqVjvO7DGZ5yaGlZNi8SViURbGiPp+c09VVZFAm0lQiACs3HxubPf8ZwxJt1djY9ewvEOorGWCEexE0I3WA4Bpi/djM961MwSGi07SaGWOOyNvjJLHjWZMEjG4kgNp/VV7yAPPFo6E1dFneO3oK2P4BJWXjfFEObbcymtJsnclxv8YgaoG1XzYviX61djGg9auQs5dSe/rSCx86iCtIhlerhjxqIpEcB8lhTWCFUmQgjxCpeOnIwG1TlGBiHYrOF+RcncNNrYIj+o5M6J2gPvaHDMrZ8fBqEy4/pBhpJ0Jqim/UI847oCz1uJhgEKAFLZ/d51H4GgmWXAhP4ZBw5gGCi1LZwnuTEZQ90zehqVHlgMJMH7WPnC4c3efQcD841lsiplwoY3QW4vRuClb2eUxIImUVLLLw4Ia+v0bE/AVgnMCILs5QnDuzfpv/F7RwxgrQjC79xEQrPCAm4yToGlG2iqAPdvLGpJHFMoycUFWEwPvnzhOYW7iOwb70z297TFVImDHQNr8JwWwjlSwF3+0nt5APnx50CCVh3F2cxGomiQGp7tdSvouL33w6ajIeQBfC4QSsxwoqK0yRn6Gld4O8Cc3abGJ946g6hwh6a7roj
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(18002099003)(22082099003)(921020)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tKUXd6gJQwWGGQqG1pmYLSiMjynUsLiLLM5XfqHJMt9SAAbS0Khvrq/Enj+pdhDVqSCQwn2qOUt1qdmypXi9jAMb3bg7np95CgCmbbmghe7B3PZLCuAt3rvVDq8DTyJZWBIHOtbwkJupIk/R+rCV9k2KliG4qU+ZcIJhInvrJ57KBeoMEnJ832+LVTZJdRJrxKKnYcN11e1AqvwoUcr/dU06cxiK/457w1nu3sAt4ZKeYkBjaLsXp3SCA3RJAsXzdTTAKxvKpkaUwCGeOlrtWoTNNvi+1DdY+mMFduHhPwJ3ep3lLSI+wL2J7gyijPRF+Xiv7KOUamk3RQBdJTg7WWYdBGm3H/2V1kjUQBSDDIGDqJ9BWzyFxmPtOrDvn3PzVVfHs2STVRhwJ8dF7y0CEQ2ho4C3Oc8MzobKMmMNrMmAQU7SrQFyb2USaUcdqAlq
X-Exchange-RoutingPolicyChecked:
	R78hoTZAd8UriQur+wGQ2vnAIoW8OuTIeDMjkm0boehFDhBo66+wt25HCOd+K8bJ5DlHS1lCkNpCA8IdqcvbL8YcDuq7dWe6CKz3cnD3cg58UhR+fEoSpMB5T4yxU1iWTAH35z+XDr27WPTciojM9qZ3p72Z/benonqldZW1Ozg+6X+zIf3NN5nfXCvAg1I2WOMwJQxD3mSTbsCYHyl71GzsvEoeebgtFetbXbVmmKv8pEyM6/W8yDp+FXdu6VbbOukEAG5wS+zQ9RXT/IRe52ODjpSBhb6D5JmRK4NblaPdhcRs/JXfeHrfPcKXSYWJyGIVzPp1r8ZQCiGV0j+HDg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:23:18.1923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a8bf2d-3e98-49d3-4db2-08ded5c87008
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7647
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfXyjo6xahbYlzP
 /g1DKPpN8KuYG3pBptagX7j5E98lqEa+Q9QP+dFZ/dw5hF8LzDDxMzZPYaLc8WETWUui8D3keR/
 lFeEgJzBkSHn3eQ1NJld8uIcyPCivO7+nCSI9xjnWjVllK0b1hmv/p7kwqPHnfNQLQIZ5XcgZrk
 aBTywsXLKSfU018o/Xd31j/F49m/xmgMxDo4ihC9iUI1S6SV4Ezgepou5iEQTSGYZwki2OLore9
 V2YdClBAMu5zfyXZ/6yQvI0xQm7+bY1D5SxGHxdBOva1qPDG1x+Ac2PKnuPkQukWNvioyoL9bCY
 u/lPTqganvXIpCmMmwpqho3moaL+v5Pc7v87dQNnE2D72bP6qimNKtDPiAVOKLsfnSdNQC13Mya
 PMojYZObQ6ee7PM3hllY0TXLDwet+mrXpQ1eUKY8UszentRgfmON/hK5L7T0QT4XYeGApyZT2xQ
 L6CDwAKxUeneznNj+Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfXy6GLv/dS5+HV
 e/t5fB+kFlTGvoxchLILhSWfzJH4HYIFcCDKMDV5nnfqVWLoHqcYnPaxJRttRgcneElcJDL2Hym
 DFlE3umXBB8mwa1dfjCSkR0IwlPKuzc=
X-Proofpoint-GUID: eXZo1wgwFVgRmsbkWCZrD5pFpfOFL_Di
X-Authority-Analysis: v=2.4 cv=dcmwG3Xe c=1 sm=1 tr=0 ts=6a42479a cx=c_pps
 a=PV4nF49JPTCcgS+SffkoNA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=uSPA2Th2IVTVKQU8YO4A:9
X-Proofpoint-ORIG-GUID: eXZo1wgwFVgRmsbkWCZrD5pFpfOFL_Di
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290083

Add PLL1 refclk to "clocks" and "clock-names" parameter of SERDES2 node
as "assigned clocks" parameter has PLL1 and serdes multilink configuration
fails without PLL1.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 .../devicetree/bindings/phy/phy-cadence-torrent.yaml          | 4 ++--
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi                    | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
index 9af39b33646a..54fe78da297a 100644
--- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
@@ -34,7 +34,7 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
     description:
       PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for PLL1).
       pll1_refclk is optional and used for multi-protocol configurations requiring
@@ -47,7 +47,7 @@ properties:
     minItems: 1
     items:
       - const: refclk
-      - enum: [ pll1_refclk, phy_en_refclk ]
+      - enum: [refclk, pll1_refclk, phy_en_refclk ]
 
   reg:
     minItems: 1
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 78fcd0c40abc..da8d582574d0 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -122,8 +122,9 @@ serdes2: serdes@5020000 {
 			resets = <&serdes_wiz2 0>;
 			reset-names = "torrent_reset";
 			clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
+				 <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
 				 <&serdes_wiz2 TI_WIZ_PHY_EN_REFCLK>;
-			clock-names = "refclk", "phy_en_refclk";
+			clock-names = "refclk","pll1_refclk", "phy_en_refclk";
 			assigned-clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
 					  <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
 					  <&serdes_wiz2 TI_WIZ_REFCLK_DIG>;
-- 
2.34.1

