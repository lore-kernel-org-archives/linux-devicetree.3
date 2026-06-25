Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A053DFC95;
	Thu, 25 Jun 2026 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389326; cv=fail; b=nK6D0JMSM1fhv75fhQm/MWdE8p2AVln/psPUR0mEVUDtKCNm+B6SEw9AGhf17VW9dNGMatr9FfYHqR7vqGhjr7lWuX3OQ2JblOq2ynBvj50SG56tc4wyAIwigotCAxOLJB9NZLx3pnNyHCIcAOwg8yXi4PcoPD5DlvBi+9Mjj5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389326; c=relaxed/simple;
	bh=+feERiex13D6AC/rX/fW1mz1+jH9dLiBdCBdb9uK/nc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bc54P2cINdrAQffRFIqKewuHAiffltYh43eDtpEPdqh4Vx0vQVcrCQc2kt/QEJKqdpPN8frrzhQlzBRq2QLMHE6ToPQjed6KqoHdYS3jSq2PBQpmvPdQjjM08n4CQkRJxxHaQcjvpPSYNzxUG0zBmNl1SfA/6ad0I4ldfcAkc4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ZoARVz8X; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WYtI7rz1; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ZoARVz8X";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WYtI7rz1"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PBFRZE3154591;
	Thu, 25 Jun 2026 07:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UgiD5CQIABczmGxGcvxsglarTC1HYyLjUDbQe52WR
	eY=; b=ZoARVz8X5YQOmPCzzKZll52upRx2EfDVgFoQKOA5aizwYr44pVPql9uTW
	Xjb+miWzT89Uo/bknfVHPCpkZrptHpltOMRP1P/yOrmZCQhDAgxwnqmd8l2Wtaep
	6z5JTSVXIW2lmcYhr8BBlaG77tIc0r4MMZoBqaMVWa2tcHNPyPvP2kfR7xhSEDnI
	BnHv6FFkDLftTOjDLAD26eJi4zRdYgd9zmv7YguaBTfVZKOH4es63pmTgqYlQuBI
	19xoTy8zTY7Q/syXk6RqD/MZ0dS+8AmjJ2M5mr/FNr9aZ1we4HJ5DFf6k/4sGTDX
	CYw+eKM2BhmkQGpR1QTRl43YjU+lQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012054.outbound.protection.outlook.com [52.101.53.54])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0r7fd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 07:08:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8m/sqmr2AKNqYXZ8S8D/u37N5TBG87YqbwE8CvWfSbk2EMoysbjDl7CMZSeS+ZfMPqkauupxJZvrtoTQNWhgpwl0J+2QjZ7O00Y4PlEb5P63Q2JyMxGWcW+Gtzn+FmqoK34RtRUBmSezB0a//rkh1/pVtQ9RsXXhFkShSIo+hmdvQ2jvqjJOfn3YigodbT1xset48fIEo3qQ2g4rwh41Gd3+1hY1SfPFtU+ojeX4nTkdH47w9nEiA4u1a244JI9f99ok52nc8VTlGfSZPjagZAQePVmRfXEiL3zQhaCDmRm/avFj3U96Ev0mFAWnWNt11W3KC1nRQC2DIokLIiwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgiD5CQIABczmGxGcvxsglarTC1HYyLjUDbQe52WReY=;
 b=XJ438qFyHJB7l4injv7Niq+IojTY0wjy0iqTXwde8GFzC7zyl3s2EZdShz3EkdfHwghe/+jiVj6HZ3j4McYcunD42iBc67Euki0eY+q4jWPGBOc/HEPetgVg4BAvfhGyqCcaZsg3XVNuWP6isBBRuWdRvFThLhLlJTKnTBcgl6qN9x1pmGHGHrDA4hk94DJfLz7c/lZklcWdHTwhVXUJqgNw9laiafuQJD6piuOx9nIuTFU+54q0pBWjRaWDqyFUkDXs88kALyoCpHc1nm33z7bTS/DxAb/krJGHcC+vXzcwc2b8RgEab4OMsgNrWLQNtg0Ib2PC6d7aG+J2gX5nyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgiD5CQIABczmGxGcvxsglarTC1HYyLjUDbQe52WReY=;
 b=WYtI7rz1uLkEAiXVYZos3RJjftAKy46XqEmnd5km9j/qaqLd5F6QaI4JqTpJqaEuBtwR/ZVf5OkVhCHev4xCDud9whl6fmeAwQKMF5rYkC5VOK6F4ogKfGu22j+pxdrP+YB04hJTvmC+6W6qF5DIhhv3gb2b8HyQMQcBzcK5Bh8=
Received: from MW4PR04CA0097.namprd04.prod.outlook.com (2603:10b6:303:83::12)
 by MW4PR10MB5883.namprd10.prod.outlook.com (2603:10b6:303:18f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Thu, 25 Jun
 2026 12:08:19 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::25) by MW4PR04CA0097.outlook.office365.com
 (2603:10b6:303:83::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Thu,
 25 Jun 2026 12:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:08:18 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 07:08:15 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 07:08:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 07:08:14 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PC86Yu3270572;
	Thu, 25 Jun 2026 07:08:11 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <g-praveen@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node
Date: Thu, 25 Jun 2026 17:38:03 +0530
Message-ID: <20260625120805.28948-2-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625120805.28948-1-g-praveen@ti.com>
References: <20260625120805.28948-1-g-praveen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|MW4PR10MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 662f1c03-74ae-4dd6-9762-08ded2b271d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|921020|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GLoFgpfANGdZYUmAJ4TZAHTeBwt3u/1RU7QGuA5DPN8nj1Q70xl2ttcOlZsYc9Q4DT1Zx2mLJr9lRVgbpHSvwiH1r2ZvYaSw01yjrKp3g17RiG/oLDaj2+D64vaMS0kMpVvJldNYL2AJ/Ffi9HnILwFg+4bzJ1MZHWEMOwtMGAFXBCNGi5k2QvgjE7TEHVjI3O/AsPHFfMHRk2GsIRzpdGuukRC4SH3BphdhIqIfupMsNAQhlvpDntLcEZaMI000GkOoOrE4xmZZD5laS1WInVcrhatBi7DrxplRrKkNGogVpbXKQejqIf6JNycgoHb2lm1Nc50Acorvuc6X7hHE1bbagFGJEhvV+bNk0Ygzt2NFeNGETNXO3SN6p9OpN6Iw5p687wJQ/dHi+v3neC1jd1tF6z61tz86y6GqbY8htEWXaxXy9yBY0MRscY5PRuEv5mf4eFHUGrvLFXw3GhONxDjEuApj6HV8KqYoEJv5I8TU/d7jEvGleeEQ6AMeorgppeocuRSYjc7UKW1/BaomABrjwFkvkrim1H3hgx2yZivM1CykMCd5eWO8qNoRrxQsJmFqciOs7TYcj+c0GpERIkjLZWG7pZjHzUDcAZxkhcL7JA9bv6xZVCpgCYYLOTqJYUM2hMgswYp6Ed97bbJWz9tqNJ64aEccTmTsKCzgwJIG0JSDvARsmiyqP1bP4gV0JeaiKEqXaBuNag/Vovjpkbcpf6nlW92OntFZHDUHTyciLrCGKHXz6DLaCh8n9vhT
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(921020)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HPtXjN4Ju2V+18MmMkIlgkEv5eMNKoHRzgt49c+xQSGo5O86W3OwG1tnZhkAgNiH7RzpWCLsTC/A8JxkG9cbkXIKaPzWBxoXK+N4m8PaDqiY8k1Y1qHEHgS0jxqQ0PdHmELj7TPGJ/6Ltdhuzz4jFsr19ipLVVbS6knfBc9Cygz9oB835R1viBCFCd30iSY8iqgwQFKT52ZXWMTD7RvNiIvk+GI+VpuBGpYLCQwEm/ZOyJ6yZFU81ZIrgb7nycEZrDPZFnxZSCl0bDqe9OBrpaSWGlr+a8K2EYSJ/g5bdDFVTV1s7UyJXMDxUVG/BiODz0JwGK7BSGlZmlzZp5WVwbmiiHf1izrBuBZeBzbnYRnsbU9tbT9wyBGjt6NK1hHaBQmta3+lmGLaPddYYMF4qWVqT3KG0ypd6qFvftCGwc82g0gZHYtFxW8qAdrIgIlC
X-Exchange-RoutingPolicyChecked:
	HQ2YvFM6G4NM+O1kXeSb7+iYqCnSVp/FIFsZJ8XEMWksMBnnV0BBiDc5ZIwc1sEEPiJbsewPt/Piuwa1aFwidwjmZ+CDuzmNQYxijXU5jI7/bY0yfBhxl3XXWbnGWNlB/5Vkf7wA7djQGBXRaDGm+8kp3rK1nc4j6Ac6xPRRRTWnNO824Y2BZLVGbYcubXk3CaYjrYnCfDfhAbpmkdcvI9wbf1rOtQfGsaMxJc5uOR9EU4cLu9gA86ryI1enkFdmi5Eb+vWm4Q76GkZYTbakwQ3X2GDSFBF9KmcyA6sae/uh+W0ehlyBoDpZ618cnSRR3/+zWsKk3NVe6b/m3h6xaA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:08:18.7618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 662f1c03-74ae-4dd6-9762-08ded2b271d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5883
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d1a38 cx=c_pps
 a=diJABEK3oI6sFh9r2i/CNg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=ZjGXhCDin-4IRsH6R24A:9
X-Proofpoint-ORIG-GUID: V0R9pgkFUYNn1A5ACrwXf4BCK0VQgU40
X-Proofpoint-GUID: V0R9pgkFUYNn1A5ACrwXf4BCK0VQgU40
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMyBTYWx0ZWRfX7CSQxGyXUlSt
 jt+8DlJnXxI0aMUcGrBGqDs83TSaQBXCZpDtON5/TNideMGUnSb+zHVJ9WUhnWcnikehKTSHE0w
 SYPDyjF5nWePjRdg1soP5/Cixur3Omc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMyBTYWx0ZWRfXyZMgvTCl3SBO
 9REv3nVYIRMO6170MnHJsG71lO5aehMdIL5cEux+fqmxeu+Fb57KDBHgD/FGceeXgW4jGmJDBOw
 pgJKvjO7eB0olYnQRJXJVG5MN0RIuynR0Ezj0k6yZNok7v4FfW/XAbejnQBW1eLeMZ8RgPFsgIP
 iR5EYhmjDpjddeIeRxUKsxWcbjKMj5zq54/qFcHJMJhPtNxprztiqGzAkRk5zG+ct3OfNQatKku
 yzJ04kNN+IC0s9Ppy3uQTSQQAiodYJbrR2UrPuQBVwvUTPVQgpIeFkztYHG0d5jKmPqt7xxKN+b
 O35yExgANsW+X4qwL/3AZisGQOxGT4F73c6Y8vHbY/QVw2sFl2bfuVzkEp11KG78QTno3gJnXea
 taBa4t8HzmOT22Wo0dH6IeHTTkilUT31kMK0gSoCYSTTza5bWdeEx6LFYS3iuuPuLBlWLfN8Grz
 AM/BhLThhfbgJ26+GlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250103

Add PLL1 refclk to "clocks" and "clock-names" parameter of SERDES2 node
as "assigned clocks" parameter has PLL1 and serdes multilink configuration
fails without PLL1.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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

