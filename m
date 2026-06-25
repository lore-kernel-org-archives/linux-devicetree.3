Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16F3DEAD8;
	Thu, 25 Jun 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389324; cv=fail; b=cVejA0IswLia0bT4sHYsf7Vk/oKxDw+VRlPtbgsFE7o05MU3hTU8tT112Pc2/WUvwPmIVRG5EiXXnZ18QHc1h43tIVXDbPUKkCU7gFtnxMyGf0x/AMAmQoEr3unOM0WWRPgWKKmCDog1xyXNqufedfLjI+LfXFgU36bPEiKL9Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389324; c=relaxed/simple;
	bh=PzYY98fSzyiyZoltZwyzv5qEIYMs0RdBKz+aXTdnxNo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AT4JJTV8PPbUkpqgjItIPeW+iwQOKms/aigRx+42yR0kdlwls4OEu/1ifrHlxDxNYCj/E0ud7xor9ThkBmR9GyzukZRVK5ra33aijMSWyUnyIBcV9pqyDHdI4wEXWaEA/ykukGUoOfEDKD3+mr7H/ZkzcaI/TsH1wAc6HMbI/oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=X9H/54Yt; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nDCAQgJx; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="X9H/54Yt";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nDCAQgJx"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PBFO0O3154513;
	Thu, 25 Jun 2026 07:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=mIkblmmKN4cCP
	mmg7uBJLEtTdgnMeWTi4njsLt8Pw2o=; b=X9H/54Ytk+1RVvddOqVrA+iUpGXoP
	Oq8PuySMGy3HQRF2ejHqYng61jhXkjYUAEPCtfrm0My/LEiYwbZ+WK5pvRGhfvUW
	7EXvgISXphExivO2EaSLgjZKA+lJIQj7yh24LmlDXdz6bhhYRIMHWzwJKeUwRsy5
	vWIZX1YQa+ia5ZXROlqizBxUI8ZqHxssp748SRJOUbMbvu+5JRrWF+ZHBFxhfIla
	DlIZjX00gz3fMrvMGYKFXauiAjSPBCidEJwQSymh9Bz8yXNnPNzjGIZQMn8DfWii
	Vnmyl4qBou4/96gl5c1oMZ6yODoCHZ8tuq2psNqBtV1Nvbcd1ueUrzKIQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0r7f7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 07:08:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeU4MkUjJbKrEfM2zMmIHHojojDxAaWk3WPAsJvUIWr55IAi7QS/zBCaax28s7z3oAuJDgiKgRzPEuSQ1hsyj6eexVfG6SC2e1/09vvNuGFmvgF+FAH5WrftZvYUmLa0ARZZZpeD3Z/sCv6aPfSB+/or7eAIZrkwPVVnK2qQEsZJ2ShJTg1cwE72IyLlcZ0IBdPCThwbBkJvZgvkPrjVYpHrf92Exa2LqQ+HDRryEYmwF7QdBoUXnzaS6o3v/KCo09TZ9CIrzYOoiLsOggI2yPtsXUIDUV0PTe2bvTCBS6ECMaClAOdGZIg2ydIqMHu0k88TSUhn8xZEFtrYU/VE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIkblmmKN4cCPmmg7uBJLEtTdgnMeWTi4njsLt8Pw2o=;
 b=vMNY+GsesY363L0OZUGEYBfZ9FLbxiNL9nIdPfFsvghNySq5L/J4bvVypcGeQOegt3JAgLDOgun5AjU0VyLvUZ8eKr/hwJOWBbaCRrF0l1IV8wRMlUzFU0NzVf1xfhGLs5QKohPYmz9q7WaGcVRoqUK5B+TJNYotycvbDAzDQIBGCDxNpVpFhCMgtCDHWT77pUmGk6Nv2lHtVSMYaVssTXszPZoqO8OQZ73z/nSXGv2c3sysTvehBSJydIFWkJKAVSMfJsOLCEc5dciXpuF9lDKVsCNpb53NZn1rLbjwk7/A+JaSu57Zcr1k3Q0FHPvqT0ZXzjyzA59lvzb3h6AVFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIkblmmKN4cCPmmg7uBJLEtTdgnMeWTi4njsLt8Pw2o=;
 b=nDCAQgJxZ5MiRT2mUYR+9t4vB4UoJ8HBUmnIxvsZTrbAAo/oUCwOKcogPyc0pawATKsxsRTr/+wMJHQhTkqD38GDmmnpFjJ5bqeQubFpkZ4cJqs2P6RsCLLUDMDd2GVYiXhTR3QDxA8wVj0Xi1z35n0aB64vX/by3y7ygfkWhHE=
Received: from BY3PR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:254::18)
 by DS0PR10MB6248.namprd10.prod.outlook.com (2603:10b6:8:d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 12:08:17 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::79) by BY3PR05CA0013.outlook.office365.com
 (2603:10b6:a03:254::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.5 via Frontend Transport; Thu, 25
 Jun 2026 12:08:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:08:13 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 07:08:11 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 07:08:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 07:08:10 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PC86Yt3270572;
	Thu, 25 Jun 2026 07:08:07 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <g-praveen@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] Add support for dual port USXGMII+SGMII
Date: Thu, 25 Jun 2026 17:38:02 +0530
Message-ID: <20260625120805.28948-1-g-praveen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DS0PR10MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c96fa6-7688-4c6b-155f-08ded2b26eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|921020|13003099007|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LSCm2K4JUY28Z4jyKPAVujL9S5x9+ApHSl48kI3piSgOpfrpqb1CTBfRs/vi4RyEdaaEp1aVUxTw3Vg9F1EvAQlGQt0Cd9jWJASwcuL7aoZ00hJ7IiKFcAS+g0pWv8IZE0zKCr6ZMN6JoJ0VwiEJpmNLisnlSoLJduKgR+1iMAtIn1E64FhWP2zNRKh+AoOKzNqJvHJ8G7a0dSjbB1AE1rUVvwH+Sa6tqGmExsYAElXEzUo2lEVbjepbheULG/Rg7hBs/T3WRBSUIpISpQXS9d7DB+hL7CWfzVWpcPp9pwGD1vVBdBfTWsA3et0TG6C8wG0149/xREWeDvz0JqT8B0RTnpYg6UaHpooXS0iYWiHvgAok4HDLE/pNll4j7A33wzxGp23IfuxGUTZ/Ne8SfC0gET4aSHCZsQUuSOUgTnBlgQrDv9S01P+3JqEYJ5BAObchnZyb7PM96AnjveWYlO8scQfsS/C3WjFPOKfacxwcZW3fV6OBzKxIe0zUfvadKBmfshO5xhVKmRPF1CSLjAKubAal7O/liZdq7AX5UQAUoWvh6anX1AazzQiA0ygqpa8NOTWQwzdmeCM4O/FHFPAGSM5m+/490T+MBOl9jlrsx7ZoMSALfCT5felvzOCDbdB5ODKDXU6kjg+6d5/f9HTRd2DXT/yzT/aK6OrRjPzMdN/EgSV7/ev1zpFVm0kdcnHenw1p0pNxzzNImiL1oPkdmtcUmxL7OSX1QNsumWVHaTwu9jWufDowBwlVARSF
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(921020)(13003099007)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BYaRqG9mZ4qOx4elJiIN7G3R/l+VKlvfWN46eswxnyo6ZlSCZ16zTXqbrfirK9/w6Kc/mBBrRUVJehrC3xI6dUWL6jW6Sg3oWN0GgboMM6tJaZ+n+v3KHmj8E6uCxw4JRSu5UOGrl5zHJlsKGxOaA5j13+lE+ZouMk9snIvJhx9lbZ69ChnHGFGut+LGXXzFirDykcibPGFiVeny4LkD/ZV7DNot+artGXMeqBbRZ2fWkqloKkHCsev+/P5qhcxvyNkZaCMkaAkAExf3bu5DXshN6k0qyzys/r5hcwdK7leI3wXnxSPgdBdMnyO8XyC33RMH1Peq0MOky6u/F8LAhAsfDVBmdQ9WQtP7gNdiZvrj9SgManDJCjYhf2XnMYhxKYiAv64pKLACLeSnbvARgZE+YypsTuQsBIFLf++SZ27oMb/+kPYJdEMasJ0W8ZMw
X-Exchange-RoutingPolicyChecked:
	pJ1BlFnSKqPfqUpzsTURqd3Uu3xkVeTDuzDFaOAehY1AeZJoWV+BkGbSXCAEn3FGdbkjwfk2DAQOeTi8/NEDQze4/XFFNYAoYVkftLsCFjtkhBuR7xw4NOD8D33126XLjnE9h5xwLjmwJC/YvKXAggs10IrXAEwDR6/rAdYOMNvm7wKWtWWs0uV3Zm6sNWO3f0OkgL7e+rT0jrzd58FM9RaGunZBf9TJ7QEjpSQSdPhWQSmHycLQnjj5dbDfHUsALiVkBHSCKN128fVMTPW7+H98+sCF/xe8bHdHY4xBUcD8ady9ktCGfikThoTVXTjUsE6Gs4d0aixrYWY0862C1g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:08:13.4469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c96fa6-7688-4c6b-155f-08ded2b26eaa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6248
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d1a35 cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=NEAV23lmAAAA:8 a=ce3QBi7gg1z_twByTH0A:9
X-Proofpoint-ORIG-GUID: jTvcBp2QtXDsoNgCLbeNroT6-EeJxg8N
X-Proofpoint-GUID: jTvcBp2QtXDsoNgCLbeNroT6-EeJxg8N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMyBTYWx0ZWRfX+bJjQCd6n0SL
 G2em7v2DrIKMaRXX46Uc1LGQ8ZebxM3zizjVV1jE9Lu1AAsBJIC39HiKGCuJ3nUfyvwJvW+GmOb
 i74VJJCNa29Ma/9Q00DSnlu71nludvI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMyBTYWx0ZWRfX2VQGU2xwfuVg
 mRI04JmRGZFFJt+1AssaxYTjF6GB7sosX+UV6Q3XBed75QaNYJSQmH7OofxMCehU8ZOTwPSusNH
 /hzVBDIA9KYnH7BREkcxrkbJ8PpXiAzkfk0gShu6UZB5mqGDVxU8VFLWKVygVb4Wy90DvqHZSC6
 JfzPFr5P353CppdQlwXlxYiHB2TbM7mAa37gLHN6ZEbnd0aA9Y10Hh0cFXaOGagxShpsxRBaf+e
 v/iUxgbgiSke+0C9IHvwAHd8aB6CzbFyl/pvo8kV4OSHwVQn2CxOF39++6EqSvbx49UkxDhmdGa
 TgtdDXlGJG2H2kCTpjf034qD72LPuxeQ2tIi7fUZdlPnKBJ6mmeGWlMqdZfEzqepv5LeyCFMYeZ
 HYrRlmn1ufD4KtUB1235MQ42QJFZmRxmCX36U30w4hnufB0LL1majoHpolEpW/GiYpAMsvhnHKR
 IBupHb3RnbExQsQjOqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250103

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

 arch/arm64/boot/dts/ti/Makefile               | 11 ++-
 ...s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso | 97 +++++++++++++++++++
 ...s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso | 97 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    |  3 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  7 +-
 5 files changed, 209 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso

-- 
2.34.1

