Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72031432E97;
	Tue, 28 Jul 2026 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242725; cv=fail; b=cDr8SVNZBLtX7/1fMKT1uTaPrV00TszuLA4dt/ELFxoTL3VZzC7ysgL24SAAQ+eq6lV7H00Nfssm2DB8OvgCizYQyLI47ecVIrBsu9GsIEIH8MaqdiYn4+hRFwSskuQb8WagZ/dDfZEOyJQz+4DXdbuIqiZLt889xkPqAQjx1rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242725; c=relaxed/simple;
	bh=MRX2cHA2bH1epLZ0gUDDNiUvk2x2zh1SOXs9rcd61yQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W1MsL86KoghoY0Lwv5kj6A4FMVwTpsmrqr4RVrg9BXWLlYDHF+cq1ll2EL6Ti37mf7JlqSCgV6Z3vuEm/KDLCr1eiRIXOkVHiJc6V2H2cGJ4de0eiYS0uW0zZC8Fi3T8g2KJax0UoEhXFOJqs7qr1vfSii3iz9VP+kna/esZsF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DgyVwcTd; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sNbQpAMz; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DgyVwcTd";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sNbQpAMz"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SCRl3B3668722;
	Tue, 28 Jul 2026 07:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=7HpzrVsb9fvgQ
	h18aGnHqutVeuSYkOhIPLB9u7hZWT8=; b=DgyVwcTd5XPtmtn4X1GzIU99qyi7y
	KnDaHqic3aXGUll/fN5P35VieWleZXDvw+SFDHL4xSxJX/XddJ9LsLHf2pbRv7C5
	SKbk2swc8aP39gGU1ALgjEExFFExLiJ+uguELJyh01HLIrvl1NLK7XGFpuTo7z7d
	ww8//Ni1Piv/z1F8L9rlyoa1mr+UrVpEYzmWs0RLnhpGHkTCcYNRtEU86lyKyVYH
	r4VRZ9+kKH8t8IY7vPdoIJqUMq567rQJqJoc/FOMYKjhLdOx+qDn9Uzte/Ic1gjs
	j/RbEQFEzQGL3Hy2QcP59gSO35jaOe0jSFQ0Qz+RR3YEx5V7Zf85TxvrQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpvexg2b1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 07:43:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4U5z7SwiM+OafxDf65atoftMvQF3gAp1s1Ml2hlaXag6hDgHy37sIEcsr1DitzAh+2ycsNaeLGyyVgNQ7Nd0W7WqVWcGOCQBsgdgsxV9AdJjuHkEA43rFVq5P1laOwPaNSbOfi+ocGtl516ZXASmXgNzHI8wQcypzNDmPW8Tgub9nhGt9IQ3InnYq0sQsV3+rxlhCnpIoaX72/nD8gq2BWk0zLbMHYPqLjmDqDcdSOA5do4AoHa/Wl/knurzooySHPqYItRbpmOLxGhNkfv/3VKtAp13jaiZbaV2ngbjzccIsQDycvH2kZkn+8adDhLo1z6ypm5OuOSKNxSDTuKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HpzrVsb9fvgQh18aGnHqutVeuSYkOhIPLB9u7hZWT8=;
 b=OEOXcyMlYiFah4BE5dU2z5f9U9N3t/Rt+aeL2z6b5irHnLabZT6kbmEnvLEgEpxY7QD5Uex/b8ldlzJWRxUoDD1+8m0MmWaLxzcsOKo+tDXICqLrdNAK29/SrFAHiE7iAnMesg9adTeGbuwBVUCnPVpqN1aL3dNnIU7EvFHNVYre046ZtRdqc5gBud0fDCDLezewJ+pUB8tQLqmWG9EOBGBs3Va6tcDcIas0L8RZRoKIyLaLaFzyt73X+F8dHuzVWBNHmy/31AhGe797OLise77ZCfeK1RIZr01AnNk9RN5+Dyuxua9AwjpO3rjeqaSQMi5x9DWvRvI+KQgMif7ATA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HpzrVsb9fvgQh18aGnHqutVeuSYkOhIPLB9u7hZWT8=;
 b=sNbQpAMz8BnmO9ZgYEjzl7gp25XCr5UtknFlQWGfyGgKAqsKFOhu53ccmSqM5nNV8V5x5VCnJImA6XB9rphKdnEzft0gkyquCKjFOniiRn1BMyBV6Fjqrkol9q4ZMt7357/kRi1ZT0P8Q5x1XFoqTLznTbrDEBBBypcTgqtwrFk=
Received: from DM6PR02CA0166.namprd02.prod.outlook.com (2603:10b6:5:332::33)
 by SJ5PPFA7D84DD83.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 12:43:43 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::ae) by DM6PR02CA0166.outlook.office365.com
 (2603:10b6:5:332::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 12:43:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 12:43:43 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 07:43:39 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 07:43:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 07:43:39 -0500
Received: from yashas.dhcp.ti.com (yashas.dhcp.ti.com [10.24.53.80])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SChV3Y3330720;
	Tue, 28 Jul 2026 07:43:32 -0500
From: Yashas D <y-d@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <airlied@gmail.com>, <simona@ffwll.ch>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dridevel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <luca.ceresoli@bootlin.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <tomi.valkeinen@ideasonboard.com>,
        <j-choudhary@ti.com>, <r-ravikumar@ti.com>, <sjakhade@cadence.com>,
        <yamonkar@cadence.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <s-jain1@ti.com>, <d-mittal@ti.com>, <b-padhi@ti.com>
Subject: [PATCH v5 0/2] Add no-hpd property to the cadence bridge
Date: Tue, 28 Jul 2026 18:12:22 +0530
Message-ID: <20260728124224.774785-1-y-d@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SJ5PPFA7D84DD83:EE_
X-MS-Office365-Filtering-Correlation-Id: 530eef34-99e0-4135-a7b4-08deeca5dbc8
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|7416014|13003099007|921020|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NnqQtyRwh/vR1ZIc9hWDS4UeiASVIM95ChPOFglodyFEZ/MjkPs5PxJcOE20EDbjZjgNPnqpLckyuiAQrHksgDX6Tjk1Noqp2QuciZfQLOySTxx7IFPPshfjz3dPMTW8sos17fhiFW3gghyXvxpNXEeyxFpD0isd//qL+zbpjgxwg64ZBtBfgTcKFsyMOe6PgsQaeayPBeYdo2eZBr4z0iHUxZQG2Sn9abT7yRVSKEVU2nKZ0tvqrZMtYArv/tQU92+gNOnFNN5TgTOD7AKR+Y2GtJbeguV8EmCZSkAbo6maKsbSJwHMo1zAfxlFK4TVdQUMXH0UmZ/h3X+C4ndnXw78xrQElX5VPCaHqpQ3OEx3YJ/ze8H2gboLYD0jBr1wdWCq45T3LxbOwMLXdz8k1fQwoMdI7Yu6orqLU8UcHAPM5I1Q2C22sIgRAvtaJkZDPJXiWZuLrk/5fQGn/xCdpNpxJKel4hL5MGkKXUbIhbBqSxvxGrNk066Mmb0BANCDA5LIct7ct+XoduEjx5mqEr0bGOM4GWT4dT0mWijUZHEc+Sb/MO/7bSjstejQLUByea3ZeVjevqeVL1lWkQK7+bezAnctd50ykT+UIKE7n8qDw5IWjgbu0qWv5Ir2doX2VQlYowYWuqnBhWrdTh4+770Lm5jsLjo12rKMJD2nRnHC6bOKXgU7VApaJqxWFDks2G5QK3qL3QF3zcDvvoF+SC7PMqEpaRjs8PR/KEnODhe5pH515OWERbKRAj+G8aVY
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(7416014)(13003099007)(921020)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b5rLB83mpLvMB4D9p/SxU1C2Ks9SPLi66b3MI5M6jTSJX358nr0wK+FDFX5fbePLxIv7MHRMirq9fPgK6CHlhNcBzlUtcCQNbGiCiP5w+je5muARf1NBAcuEYCJUp0NcQ1K4/GKwkyl3zqLJ/6lZFqje4VDwwNgTMDMdQXyVR3bevvm+OeCR91QAEZC3nJJxLdCVYl+C0duEYmTgx8uHC/+DxemzHVcwuewdgGrrPyjSdcq7gbMc1AD5mBkyO3ncb7jFqgtrv2YS5Iq3lMVK5Bj0ry1jXaGhqdYiaXTu1VlhreFiptxaNjC5qBkBMjsHa5prN95GFjs62BbUPp8xTa3/HG7p4B8gqLwm1R9KYHq6DraMHfxci3H0x3wGykRqg7+jJMmyfhvbettXzTyI0cW28jeoMXGW1jV9hmNvMFUFtEV87f5daacvIopcY0Tb
X-Exchange-RoutingPolicyChecked:
	sztvo1l3rPH7K1PbEEw0MSRlec3j+XktC0ZVuPT0pkVcCJWHoHAjSEkciJXokkaEpXiQjQeh5mki0feau341VjnvOuHE2pHkLGeq6AMxZIxPQsYU0qTZOo0DcOcvFRBANil86NNrx214jpzwGbEy+0BMAPsw/Ue2wpNWfqDTrRX+oHJzEn7wm2yA5k2MmWGDY3Mn8oT5FzPfvnvZ/GELB+sfv0Khce2w+hs0G9s1TtPx+Zw8APMUe+S4dZ+oxguA9y08BsuzJNcF+DtuOFAFOQtf4+xZLAYPOYCqvO94/xrJcoU+CPQoVE49IrbL4WBvxMgY8eS/ahaDaEKoEANw9w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 12:43:43.3310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 530eef34-99e0-4135-a7b4-08deeca5dbc8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA7D84DD83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDExMiBTYWx0ZWRfX4/+MiKCkCrii
 tW9oR6We+v/n42afgCMKzNTqYKlt/rH+/AWcxr1wFP1tPWXR2/JxNPGYpb9hnftgyohS1j6WrKq
 Bkgzhsd1DtLkliLz0dObMRKaRb5QnAhvD8vVcheYAYzK2B6iCReWCy6WZsc4nLI2CUwhnV/YEcX
 3AA/Ity3AgRJEnEENrh6XRtAogOuaiTbxFfNIMH9EJaC+NWxxOUXkKryhU9al+NlRfX3pFIngXx
 Q65Ktra+c5TvFBEo2th1URuxgipxHf/BdyIp8DI0HvRXJrtoHyNjNpnGL8CXDxuQ7nDnw3XkxlR
 VNmuOQQI9CLs+0+YJH+vrBG5ODQNeUT1Xf0uw4ACcbbsji7EUcQHg9nkBf1PQLOD6paiF1IUNzY
 T9wegQEo9lcpmXxpanKWYyeknngkFJgU5Ffsq0Do9PIetmiYQH4CAkZB664mkwxmyIuNHFMc1hM
 q3z/ESAVYtJzh//3OiQ==
X-Proofpoint-ORIG-GUID: O2-yBv-wA1009m179ktqbhaesNCRuO3A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDExMiBTYWx0ZWRfX52dRPZYBRhY3
 k6+1Y8NCP9frPTOTrWe8EUzGZykAjox8SOBFfJ80n4GyfUzl7Cu7o3eJ9ibhu/OpwP9Ts5HxeKv
 HVG1JvhF2tM9PO8KOj4nRMMd1lJBccI=
X-Proofpoint-GUID: O2-yBv-wA1009m179ktqbhaesNCRuO3A
X-Authority-Analysis: v=2.4 cv=IYW3n2qa c=1 sm=1 tr=0 ts=6a68a402 cx=c_pps
 a=4d7Nl6fXTlayLABBLko2Iw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=0JgP1c8QgrBT70boxssA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280112

This series adds 'no-hpd' device tree property support to the Cadence
MHDP8546 bridge driver for boards where the HPD line cannot be used for
hotplug detection.

On TI J721S2 EVMs, the HPD signal is routed to SoC pin AA24
(MCASP1_ACLKX/DP0_HPD). This pin is muxed with the McASP1 audio bit
clock; selecting DP0_HPD breaks audio. There is no alternative pin
carrying the HPD signal which makes it impossible to use HPD
without loosing the audio capabilities.

When 'no-hpd' is set, DRM_BRIDGE_OP_HPD is omitted so the framework
falls back to polling .detect() every ~10 seconds. Monitor presence is
determined via AUX DPCD reads instead of firmware HPD status registers.
The .detect() callback drives cdns_mhdp_update_link_status() on each
poll to keep mhdp->plugged current. At attach time, the driver waits
for firmware to be ready before performing the initial AUX poll since
no interrupt will trigger it.

Changes since v4:
- Corrected the dt-binding Subject

Link to v4: https://lore.kernel.org/all/20260630102610.1849902-1-y-d@ti.com/

Rahul T R (2):
  dt-bindings: display: bridge: cdns,mhdp8546: Add no-hpd property to
    the cadence bridge
  drm: bridge: cdns-mhdp8546: Add no-hpd property

 .../display/bridge/cdns,mhdp8546.yaml         | 17 ++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 58 ++++++++++++++++---
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
 3 files changed, 69 insertions(+), 7 deletions(-)

-- 
2.34.1

