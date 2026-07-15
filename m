Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A867A3C2D;
	Wed, 15 Jul 2026 04:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784088195; cv=fail; b=l/lLtuiEJ90+1s2P/AguSnBGhVSRncc302PyC7PYiSym+c2ffYWr0Luq/+UetZu1M5co5zTQt3P2rXTEc+ktNnZLRLz4FZ4mmNyUlofSkaUnezMhbGCKrqygFRiHWSlgu+YBGwVp4Q3D0ENBqGBnmz6JdU2DdXi1kmQrB5GclvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784088195; c=relaxed/simple;
	bh=al1QE763gQJ2rBKW9gjdG/3P71EiliP9txyV7qXH+yc=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=TF5aQuDnJDBft7mOI0x4wWzNlVPn2/rXniZn9R8wVpWMMPIzvl70wK5Ax2YT1cK9eiaUoDIYII7Etw/bwfQskjI8iP8dw3lgHNtJhjlROBRu1pVAEmsCYcIdZRBvQKXP03WJcG7mtgWPXlW/+CCa9mrsoku7MC8UoertB0hzPyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WQIdvJPh; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FHU6JHMs; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WQIdvJPh";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FHU6JHMs"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66F3jhmZ4062515;
	Tue, 14 Jul 2026 23:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OWy1T+wTiPDmWqx8Ix+r2W2b9DNgrlvfdiZRi9/r0
	Ok=; b=WQIdvJPhIiiAHxaKYO2iU/AVIj6RdOBATPwBAf+i2fQJNEH/9PiGRQtKb
	IZCIAsLRRngWk+r7+V9zMtM+gH0yFIbGfz5mzHsQSISw82Tbd4G/Igvtq9I1nXE+
	3vstLghnZ45DnxJJ9hHzYyHx+mGPKxMD5l+To2hunv7jR0dcQO8hVObHa+mtMla8
	GVNdWKoNLTeTjpBJnwQJS9NGQVP7PNxZjBYkHNwQP/3Kx60VT1mzjg1MxMwSuOgx
	X+WjVkv+yFJHqf+LUuHhzgrZjZuG8XEze81GUWLGPMjoo6LafoTiWYjOwvXXf3Kb
	XWdAOzC2Twgoj5xAeQ/REte3LQsGw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010004.outbound.protection.outlook.com [52.101.46.4])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fdmgcmpc1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 23:03:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDPQOjCMjCFT4IsHEMrLyz6vEz4dhJZtOvBswvl90BdHxrpZn8XBznSOPa7BF7Z/fFPWDRH5Y3zTEVdDVWLWDYzyhrIgTzZGgUSmheLOg6Dy58CG8JacbWq3tlwYLAl8QOMq6HuWMfA+sPIpHyi36YL9QuTy6brPBveJWfXXSYjf64IEdKMwCRmdt7MGZXJpdOG9nGHu7kbLKztrPk4CcIXqEMAQP5ycv6UTa/nxMqD9rWVtyF9PXB3KvnuPDw50VdaE5f70hvj5BOlAZtBXYCcoyoYweyxuTWrZcMSA7/5C6VfWN5wAXSAtC4EASP8qltVlLzRPixQwiJrLueKcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWy1T+wTiPDmWqx8Ix+r2W2b9DNgrlvfdiZRi9/r0Ok=;
 b=g1jShKjZLpwQJQRL6GhL4cmAZNSD87IiYpjJH61wwXD7oTZ46mDib/ADN9Uk3HezESjzWJeMlhvLefo1fE2umkJMsTNxHzus9E7yaIV7Bv7/p0iJdJdmxcMun1+cf2+ZiOUFpu7OfmLHXO6vjSF9yRdos1hu7o5q2PjYesiOfcVeoGLGDmCHYqgZe8SUDY+AmvIpj6J3gOnHnVydkXDvyjpmcJRwh0xqqDTUZ39wS7yLjp7ElpFV4LFSpHkFSuk/0/jk0/mYnnJy9iqscra0E0DZfdBLBV7+Q9mdM8W2OtayIF3FLtH2sk5In15faYWdftM6ToGnXkn+FvYE6C5hMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWy1T+wTiPDmWqx8Ix+r2W2b9DNgrlvfdiZRi9/r0Ok=;
 b=FHU6JHMsZImCCjBzgaMR4nOdCORqErwaukG1PlvtBJyQcdl/Q7W5CI+F9n4/PXAiU73OL/p4Kj/Gtwp7157/dBjpHXPcMc2pjDQ/qnnFe+HdgqxA+xfXNlFYdGMgEHpxKRYrMmb2UBVQtUnu7WYekj9L4B3H7EuNBIYV8oKn6vQ=
Received: from DS1P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::14) by
 SA6PR10MB8016.namprd10.prod.outlook.com (2603:10b6:806:442::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 04:02:56 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:8:453:cafe::54) by DS1P223CA0002.outlook.office365.com
 (2603:10b6:8:453::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 04:02:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 04:02:54 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 23:02:31 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 23:02:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 23:02:31 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66F42Mpg2111576;
	Tue, 14 Jul 2026 23:02:28 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Add RPi Touch
 Display 2 7-inch
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Francesco Dolcini" <francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20260623114329.63142-1-francesco@dolcini.it>
References: <20260623114329.63142-1-francesco@dolcini.it>
Date: Wed, 15 Jul 2026 09:32:13 +0530
Message-ID: <178408813371.1080948.16416325220057740456.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=al1QE763gQJ2rBKW9gjdG/3P71EiliP9txyV7qXH+yc=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhqxwNj9hi/dC0prLv744HavOubzj1PXV2or73xiJL46z/
 RKYq3mlo5SFQYyDQVZMkSWAbdcsqxSLxxEViVth5rAygQxh4OIUgImsT2b4Z6T3df/h54ucd4Wf
 PLl2XvCuG88aWXzktdoMYi//Tvuz5Skjw61Q19Bp/fuqXUqkr9yzynz5WGyKpp39qWNPEqd2vTR
 IYwcA
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SA6PR10MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: b60f1d34-424b-4761-1804-08dee225f2f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	jv+uU10BA3I8UDAdoXErW3qrrQKx0Ped+SCzzaIMwMtPF8S4UP7fB2CZ5mafvWa6pQuevyeE7RkqaDHuB+97AVIbhR7R6itig+7I7deiD45XTZnO3Oi41nlPBTKxe3vGrLS4doVqgtywTHovZ5dG8PhdOQhiw4cK8dtB1jIs/28gnMtXnNxoy9nS9igJJOFKTVXEwdJjNrI6dv8+Tzq6C/zdyWG6eE1OsWRGe+1X3pRhUN47fGpE9GM0EHxYmL4T8wc9NSWxDP+7AN4xsjkr2dj+zr3oGqXF9lY5zTlo63I87/OpkUqNTwvxLT/9R3qnfTz8NEAEhVYaMihOKgj0xVw20jknPOtAYW9ur6xoq/cWuJZs/0bqRBGYBur6i6hOy/AY6N7VnOChYLs6GkC29Ba4VEO2UdwQnKYdRyr4GK6FknnbZCOIz/RaYJ4lGqCPYM3zem9nleXxSqRPAKn8EX3ln7/sGCzJ6ieVc/N4rhAt0/Jdmw5zv3mVLCgzDYyHbjodcAFsDwbcEGq0yEdfeD+ykKFvtOw+8uWG/1rKON6burJpcalC89MUedr1C3+esDF8PwSEffCBuaK4x4oiTlz8zq9oq1JMq3wxK5PNMt2QiNJuOQXaANmg8vbz3ZqsnWJiFC6A+Bce2EeEO1m+pNAHdDf4SvHwZOVylhjm0KZk1TfHNzLIb98lmuoXCWKKz3JJ3ZIt6Xxg9D10MY7JXg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QmlzP4w+dMquWXPYd9RQYLX26m7+BXuDV11ByAJxhXnFxy24HKlI8eclwXkrzICywNZAnOX4Ci733vZLLxclo9hFNHbqSWgRBYit3T7FBnSU4oWlxajEtjI1xcKFRcexpVgDFBLHlbCN/E4/+2EVH08FmFzdjLZ2/HtQ2NWKq19srr+XTNC28uXzsUAfJKKrHMAnPPPaeuULSAW9TU7KBVtoJLXhag3baLqTCZfy/np4jYAk0z4nnHSEEvi3RS3nqDdN+j6nIMCd3LaCKVFAj4bz8BzqpnIPMr+ADj0WfgXoO+GCiTmiFqIeNAAtnhc3yqfSH81d23GI2QYiXhiMKs18SwVI8oscYB0H3mVh/vPjuzrUjzSBx3NbYYCndM2eMlx34iitf4pmoPq8vIqisYPQvMUURirqtTLgTURejOHWLTTO7XZGIeQhM6i8XpcT
X-Exchange-RoutingPolicyChecked:
	l3m5zrepb+fHhzpK0ujfQtfk8NLcbugT5WJIknGPsJwhEfJrHCQ368oceOwY/875PKk7T2/VCXw/V5/pOi/pKLWOVGbe+6X2oq0Jdzfp5OJKUGLm0qauEEadxmTKN3R7ZgLSk9QnCjBgfKxjzTHATHHlxnfSva1wupguM4knCd4XDoxjBWRDej4jrD7SmgMFsx4hoaMxJ/o77MDy5Y8eq+tuZW2B0JU3+7Kj0B0J+duDs2tY5lOmVkws2m7hO4arEG9vGfwOqkq6SgrNnyro97LVFCurpFu5OTNCiMdxj3ZMnoxG0zM5sBvXXoZz87OgtmIQgXCcJv2XGx+rQ8BTRA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 04:02:54.9865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b60f1d34-424b-4761-1804-08dee225f2f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8016
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAzMyBTYWx0ZWRfX5WY+yJjICqVI
 Pe942rCwedW80gqENVlyXIOGccS5iC4AGkzp2psPKSsdqIpsAesRl3Zi2WN9P/a7YDXynDlmzaR
 d6OsKXnuPJ2kCfQhLWpqo3WH8MJwaGs=
X-Proofpoint-GUID: uCMHgaBCSKIFF3rxnrwwKbJzuCDTquRq
X-Proofpoint-ORIG-GUID: uCMHgaBCSKIFF3rxnrwwKbJzuCDTquRq
X-Authority-Analysis: v=2.4 cv=GLo41ONK c=1 sm=1 tr=0 ts=6a570674 cx=c_pps
 a=Yjro67SWnLjgwqeg4v/dNw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=95T6uNfwuFFpFc1L5ukA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAzMyBTYWx0ZWRfX6jO8/pxxpXLT
 WOn10AyN/blx5RK2+O7bBmom4hvPq1l+Bxyk6KFHb2zKtXGqfv3kXSwz8gNUiY5Pecp+8tKVosZ
 mBvyZRdZ0B07WJU2dPG9IKgNdAGOuWKqGP0SX/VARdP8+X5kSVUc+/ckvKaCg7vjSKG4zTeI5js
 z7tlByOMitx/QzLixi39ysQHdxbNnZXvPPuozaoJYB7/sWEEX8FnwGn1j7jT77GSqnjpYUsdWJA
 z2YNzL7tLzcT25AY3m2uWlHCOPLXlIx3vXWNaXqrsH+Usem4XMoYd/v2lmLgrbl4YPpqtgZofcB
 Ma5DrmE8Enmucoeloz7SYGXSnTNRTEjuVONPldMQFwa75pClpQMGYHtf6x9reNV258YL5mMh5u5
 bu4jiY0cieiIxlqmH5Q11GTagwpp1YuUmHbuJQ9YL8CRu+1Eg3F87N0dSDZF3PxibP6AtfY+O5o
 352LQEiez0zgCgIrAow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150033

On Tue, 23 Jun 2026 13:43:28 +0200, Francesco Dolcini <francesco@dolcini.it> wrote:
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
> new file mode 100644
> index 000000000000..9a2e7a170a28
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
> @@ -0,0 +1,102 @@
> [ ... skip 88 lines ... ]
> +
> +	port@1 {
> +		reg = <1>;
> +
> +		dsi_bridge_out: endpoint {
> +			data-lanes = <1 2>;

Schema doesnt allow data-lines for port@1?

k3-am625-verdin-wifi-dev-rpi-display-2-7in.dtb: dsi@e (toshiba,tc358778): ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)

k3-am625-verdin-wifi-dev-rpi-display-2-7in.dtb: dsi@e (toshiba,tc358778): ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)

-- 
Vignesh

