Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C1D419306;
	Tue, 30 Jun 2026 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824126; cv=fail; b=KMHUSdtVmYTJGMY6+RLLzKPV8NtgzdZzcvj5lJdsUak0itWxx9w/kaCxazEUy1i4xRRE0xFKuDmt46/ORBHexn3GY0LjqDDy+ScXkEAl1sBKhs9sARqzqzUNAyNqt8Xbz26tYAt2yg/sd/8rUc74X3fq9IDf6jtKdH2R6ERRJQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824126; c=relaxed/simple;
	bh=j0YOmC7hHVb7u7adyQMD8ygO/can8qTc0ppGWmhOx8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZfdxhsYdSZxx8lb72T30JvuNbWpZw/QNXGnWy1JIi3ugmdoesLdlTdDLDgo35TFJVNudRhA85T/AQWJrogkV99bcfgESelrCawgSKWWJpk+Ch1EjdrXn/Pc89Ay2qFPJMOCBO3k1x2YA4srny0U+O9eehUFJxtb91rGpwcSNrHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=AigbA82r; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kkpKrCWn; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="AigbA82r";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kkpKrCWn"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UBAoxn676854;
	Tue, 30 Jun 2026 07:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UxNRrTHXRmq2oR9fz8hhb3JQCGwxRPKkXvEqrfxmc
	RE=; b=AigbA82rBpGxz5XBnTAP9QBjQa7ljU0F9QbQVWqFfrssGjw0WnnUl74XA
	m7aktcseNx6luA+nae1W7zMlIQ2jLhonxeYJieXm6GwhTkIDKcI0H5Q1NC6B/tNA
	jDoawps+f9j2UaxWA23zkOzMYMDTvypOdXPcgT740WTQjrSt4Ap16K3mmx5M/fHw
	Azu1HJnDnevK4taoQXfcDmHyBtOiDVF0LaKdsDDcH8CNr9z/maLxY1MXyiZcSMlH
	Ogn02RqrO8qnTynkOvUxb3zzrEq0M24ftyO30pOFQnjc8CE+zElSrrJkCXfux4VG
	GQRfy1F4Hz0vvMinHn2fZa6dobyqw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f4cpvrg4q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 07:55:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1DoDWJ1wiSAZC7KBfTrW7V9vGhUOi/zhh+QBvKbntGN2gcKkpR6yN8hU907if7n1AHeY6A/BESVC5J4JkN/IaQ7tfjSb8HIr5vDFugIYnm5eEYu2TWSg/9OX5RaLYeuN9S38pmqCg3tv8eeE2LgzRiN0mYDa33Z7LsajTcrNPAhMO9f5MWz50ahIjbKyvrWZkT9L90VeewyC+QiZo6VOxoomqm9Odfmctn09br8xVcmogdOuTkLf99jpcu4ivOI3rdIrcmmgOPIyr3SAlZ+vPbsaroSk2QkZQtkF1WrC8dkO1LbM6p19t5JaNHhBfDFQrgiAgaBE7q662Sst60ufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxNRrTHXRmq2oR9fz8hhb3JQCGwxRPKkXvEqrfxmcRE=;
 b=ANcdbtBNze+QbabXAKEMd8uVV3ozf0PYnWwG0x8pXFlae8saTadvbppO1nGLwL+3mSDkXtiQkDHd+zlsTm/fduOIwDL6/z6Wm15PZzXcb76PlKTS7NsPxfBfw2w6WM8k6FO9fnsH1h+yJep2BQ5F6k1GpfdnQ+SvATE5cD9DYUjhclZVGpex+8abUkVdTbw9CMkhUx74o/WYGQ2JA8lKiMVqORnRf3QyYwAI0B8JQDwSrDg8hAZFZtnxRYrh4HMgDOInernvgcLCIxPujBPUpNCn5iirlul8jdanzV10ot42s+js9eYmYDzhCUtaiUYtEx1AMPFOrtb8n9XIgCvy+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxNRrTHXRmq2oR9fz8hhb3JQCGwxRPKkXvEqrfxmcRE=;
 b=kkpKrCWnB4MoC2E81hh9x6/FJPnZ/OyFJWTfarS8QDfsLwfWMiZym8ijFFi23d3QSIPnyfoCCB8f2HF/V5S10ybH21YOpiPFQx4bUSIiKQ7SVjcw7lKn/Ef433NiCrId0p0OP8FoLgLblYEuz+Fmf0KJ9lt6qOdE4TW2F0ZgEJQ=
Received: from BY3PR04CA0026.namprd04.prod.outlook.com (2603:10b6:a03:217::31)
 by PH0PR10MB4597.namprd10.prod.outlook.com (2603:10b6:510:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:55:12 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::40) by BY3PR04CA0026.outlook.office365.com
 (2603:10b6:a03:217::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 12:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 12:55:12 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 07:55:11 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 07:55:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 07:55:11 -0500
Received: from [10.24.50.145] (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UCt7n73098626;
	Tue, 30 Jun 2026 07:55:08 -0500
Message-ID: <e3d1fd68-e6df-4ccf-8a94-19f18a037723@ti.com>
Date: Tue, 30 Jun 2026 18:25:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] net: ethernet: ti: am65-cpsw: Fix MAC
 configuration for SGMII mode
To: Jakub Kicinski <kuba@kernel.org>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260629102308.56616-1-g-praveen@ti.com>
 <20260629102308.56616-3-g-praveen@ti.com>
 <20260629151239.67115e55@kernel.org>
Content-Language: en-US
From: Gokul Praveen <g-praveen@ti.com>
In-Reply-To: <20260629151239.67115e55@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|PH0PR10MB4597:EE_
X-MS-Office365-Filtering-Correlation-Id: 75473ad5-914d-4087-9715-08ded6a6d2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	1/u0ZCWzTh/+k4JPkr9zBO2ZOsA3PlMODUuekaoaxf768Ubl9aOpjisSx+NJDx9eOR+o8WntA0L5Vtu1ZFw/8aTNyWEJ/SpPh8D7pKWfI5RUNzd69q7Zeu2nApMLNfbMvq0kxMZkzc4+12plMVSYRJ+XpW7jiPRa/6rCE715tgop4Uupx2wh+/zoeGy3ODVQdWlMWRPsp4tZ8WYO0hGcVjrsLATVS04EiBX7gRU2fqApRY7j30gwPxyHReZK9x/yuENKbYjFajxSHDqpXkwuxDifu3Eah81pR9JnGl/Jn2/rV9v7hmpjNFKfOI6bF3zeUqsJCVeKW/GqZVVJSOQN9PKV2t/l++5QqPTn85R9vAWPZ++7CaelU2NvWJ7OD0j3Wtig6hLgH7dgjSKNt/mvrWaMYdQrNQraQQcQg0k5z9LgKAjbTpyheXdvPcMp5WM4jMESsB8yoP2egII4sqLYpDcBKFgeJMYP0/gD/CcCyBUn+DeYAXemKXZ6Dov+dhN6gewz4W5RUZ9BUc9v5FVXbI1vrK1UW4Z4Db4nN2M1nZQXDdFH7lpLwUsyAzsfBhiNO+oYIN9BjwDSDaRD7BbP2r+8f0Jo9hGq0VgrSXmOsLr3dMf2+BWkOVI11/W5L/NjS23ERXrlmcmf+A3nv0AZY+UT994CuumYr8jE/uqpSj3caq6A3/vv59Hl6Devq735
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3my2ZA+YaBOmhAAVnnVv2ff0iVLAxYHOfLj3ovPoZuJOzx8gjMDdjFHRHQdQBfR2EKM16gmJfYWsObjipGSs18V1SHw5oUYL5Ze/6CZFkq6buQfVdeoipF/CHZGstdft5Cv9+BD+R+qSI44/f06bA1nMvZEdRZdLC9z1imgtBbrb6GJCVm3SlDQjFEWecg6er32Tx82935cIr03IfX74uDQINHmQyLMZZ+Z5UuU1DgdZTkXnBwjG3mcLoGEoUfB/s4Rf6Kw7nEJYWE/rUBpPNpfFu6jl6owevf+HrhTazh319rLm6pgIyMHZ2Gjm5ht8syJEAmw8bZOmLu99IjKvuPeeybM6yMbBNP0R3OOGFy98hiCMCNgInEJKfBg+0zsdvZN5+cpLuOqn3CVMgyAY3CFJqFjOjhujsAcbQUA6KysNxjMJfrBMR/sTIZT0AKz/
X-Exchange-RoutingPolicyChecked:
	Bm3gIY/v6dJodUksyv4clSOrC185pQwjvbzEHyNKI9Uu1562eanuTVLmd64eB5Vi97pp0QhQxmcVUh7ftBsSvJ281MuHmC5+GdOT3J6q98lKMRgq5d+RxfdZ9rs6ZEnCLkpvlYEnRxlQuhjoaThr2MY6+cjS5xn1RdZHuFQlQKxu5aJ76jXKmuKFtBApNJMOcCkQyqQ6vHWsM2aU7+D6DYy4Bcez7/hRTBgv03TPFmDWO6oZ7pX7KThvWAiGebkana9zNsV5PmhN9VEVzqomWToXRXooAZWPkClJ+8ppsx8EBBVA55QDKFJg0yWX9wXH4xoP/Oqer1y6LeFCRs4kOA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:55:12.2975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75473ad5-914d-4087-9715-08ded6a6d2e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4597
X-Authority-Analysis: v=2.4 cv=c6abhx9l c=1 sm=1 tr=0 ts=6a43bcb4 cx=c_pps
 a=YOgfsySBG6Gh3lLixmEA+w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=XtgTk6qwrSb2kcXSaY0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX/SGXe+Sq9yS6
 rjU42Q9ANCWuY9CEC+gjnEjJ3nJ6ueymi7hsrRrC8AreU7cASvvRYInN39B5yivPhxOVKcX93t4
 TMJ54Z8d9NCPXdQeyp9HuRqXHityN/g=
X-Proofpoint-GUID: wNZbhVdYAYly0QGUVLBNPTD0E0oEqyTz
X-Proofpoint-ORIG-GUID: wNZbhVdYAYly0QGUVLBNPTD0E0oEqyTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX/fehnkdzwobZ
 lM9JdF8VPC9wlhLiGrkv27gZ1yOn4CnySAbQ69E6DmhBRZ3YV/v2zzP+PoWxc7AFlbE9o0x0W71
 DIO0e3WxizLJBFDEXl1BSH0l+bgmnk0iUcybj7JzmBA8Crv/lnpQJpfBfkrtvnQHCiFgo755mUw
 XBWcXCKR1MY1b4qlLUlN+SkSAYRQKLY8qPDVhwAHHVeOFZtlD03GPNPWpt7DiC542AtCBbygm9W
 9x6G/R2izPcSbB/XS7mqUemkthHauhTnEFSOD0AdCREcR/hG00k1vVH6oDZAwXJxCVTs8W1lbNE
 oUSB9m+5Se+YTHQCLY9SosAEdRc6gFvjLgohksYEQwzyYBtl3TTC/zzNLG1lbifEIe18cW8L9/s
 lbLnr3PG3eZEeJUOk+YHngqeaOqWJDrxJAbPeIYiS42GIh/SwW+diLsSt5+9cYzUOFYosU/5oK8
 vfFbaja7A+Pwl91FxXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300120

HI Jakub,

On 30/06/26 03:42, Jakub Kicinski wrote:
> On Mon, 29 Jun 2026 15:53:07 +0530 Gokul Praveen wrote:
>>   drivers/net/ethernet/ti/am65-cpsw-nuss.c | 9 +++++----
> you need to cc netdev@

Thank you for the feedback.

I will cc them surely.

Best Regards

Gokul Praveen

