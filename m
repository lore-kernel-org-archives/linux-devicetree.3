Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D566434E54;
	Tue, 28 Jul 2026 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242736; cv=fail; b=NQ2k+yRpW6i3pkODEn0mz5rjLN75wZvsmZs5+RNF2IaBIix8ZpVNlDvjXhqFo6LRWcqivoc+ZNiFnuNjoX4wA2eIqx3C0VxWz4AEdW20d/aJwVvPsRN10h2mFRgIZEYfSSpLVrQYEbWP0nOLjfMWFn1EoeVDf99V0oDIIYu+YG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242736; c=relaxed/simple;
	bh=c5nclc7w3qPQCA57R2JFQhLlt1x4EM4AWM/OXkHFkS4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N6VGlv2So5zoXhB2RZBP3JbSUiFU3p45BWFDwlGqGtzMIUkgactFdVFMu+BowcwcPDdCjwkLM7JpZWgn5KleJLJeF6HU0KJs6vKGPWBgrMPEFoc3p8vbg1nqpqW2wGuJSQijG899a0OlvoPIA6EOq875jlZo4ylGWOyvFctDW3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=XpOwhS0B; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OmGC1Z8b; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="XpOwhS0B";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OmGC1Z8b"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBEnnN3852536;
	Tue, 28 Jul 2026 07:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Z0SK4T207p0msSgP1VSmkVCRrkHF8uHhmBGjWu/9j
	/k=; b=XpOwhS0BxzGRiMoBU1dWle1hG2K76VsOmpxAeYzSRpn+3RdKzFMKZ0RPx
	vCYR0wjDaYJgsmH9ZN6D5Q43aCZ1RTmGO4o2m8Y/ZdzlWtyKY9F4n+GhQ3yseEVu
	PbzxXtjNZuPiwq8+1nXAeWHz6MN1VhhLon2FnH8WLwd5/al0gQK3Qa6KcTGDKFav
	Dxjf4H5CoQ2ks8C5wQdk8sypPsrCk8FK0IlGqSNxVNP76gsmKgMP6uNOVBrK8drb
	3X7I34+Of7O3nHVv8Lj+8QWbbDOoDMBXSFvDXEVMIrDfB4Az86rfHtIzNPao3rCk
	JggCxDfGY6FrZQrkV6R8joXGYlOgA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpseb0yev-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 07:44:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t35FvXM4ps9UBM4YzIwrTZaBFFykYLNY84ZEnUlPwHHoybM1JLC5ZTzlDYwDZ9RzRNuHerM9VkBmR/Oy0I9LvW7ExR5HzDhOi04TDM1Q/YIeLjT0fyW0jL/m02jNaE4by+R2ixgXN02YZ6VrIfdD4I1oWaDGfoq3UlrmF9n1goNGYxtzKXc+wJnFDVjh9M+X5O6ma6MCbG7i96mdoLSzWJxwrlgDq3kv1u2tIjPLe06uubJFTG4bSRoJFnIQSQoLyclbqoeHrQD04En/RfqjcH9fuMC8WVbyix+ofN2M+stJQCodH1wkdXquPAff0yTl1vo8C2QPscEgrTIVzcZM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0SK4T207p0msSgP1VSmkVCRrkHF8uHhmBGjWu/9j/k=;
 b=lxZ/BDZRTkUr1JWuxgJIyYem5EiPQdUyNL9Xve3oirLMO8V5Y6corEZW2xoeoEHIzRwjrxCIv7N+yEmUFbCdNTMyCtIM7MvUjeZ/8t6DvcG85wLvAc319Oqtst22eWnikHGeoBzlwSC7ljjJu3O5gc50yxThMIdM6s8LxKXfV5/OlJf4B1aZmIZna7VmSg1gsXfhNFDk5s1YHKjqrb0/cS/LsVAfHpcCLAPBKapenqFl2FsEQH4iEg2YrdCvpzvPvPxnh07ckHm0UiJyaQbsRlV3M8t549++6xXQn7qci4knivaW9B0vEL8Wqk1r+Brs69JVyXX9H6vPDUIbxtbh/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0SK4T207p0msSgP1VSmkVCRrkHF8uHhmBGjWu/9j/k=;
 b=OmGC1Z8bfgu1VN+5dNZi5o45ZXdwzt1k3Nqu8andN0ghUhGdpOfZBhZHJ9thJKqFnzDERqnv5dcCEVKY1DVMlMYdj5akFKttxTBWMMEjjOUNZ6RXE98Zkd2Ca6+ppl5KWZl2sEOFeheq59vhNhk7rihUKtzPQrco1CpsPG0Mz/c=
Received: from CH5P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::26)
 by DM4PR10MB6814.namprd10.prod.outlook.com (2603:10b6:8:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 12:44:04 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::8b) by CH5P220CA0005.outlook.office365.com
 (2603:10b6:610:1ef::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 12:44:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 12:44:04 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 07:44:01 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 07:44:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 07:44:01 -0500
Received: from yashas.dhcp.ti.com (yashas.dhcp.ti.com [10.24.53.80])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SChV3a3330720;
	Tue, 28 Jul 2026 07:43:54 -0500
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
Subject: [PATCH v5 2/2] drm: bridge: cdns-mhdp8546: Add no-hpd property
Date: Tue, 28 Jul 2026 18:12:24 +0530
Message-ID: <20260728124224.774785-3-y-d@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728124224.774785-1-y-d@ti.com>
References: <20260728124224.774785-1-y-d@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DM4PR10MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: d332073b-f3bf-4ab7-4c10-08deeca5e876
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700016|1800799024|23010399003|921020|18002099003|22082099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	KSSELfbqC1GtHXvgw6mg8bb1Mbr3cI16NylvnC/fQJMUYiLxwawfSMcEFHW7sO7VHlnDnh9HW6GPoMlr8CGmpp+7/Vl4WY/hAzXYfNakWCVUjMs+zKmJWacZAS1Xk3kGlG6WlDe9Yg0jMT9MQxRc5rRpIRpaM6xg8bVeBTFoC17VLmTp4Jc0FYYtdDwG2W1xBaRkBzdHu5bDJ+PIyoacFS2vXnD2ppQXpg16ydOGTgVp1K5VZoggzOVbmHZNyN678qVfuaLhOeoSw1+v12X9y67XySVq9YD7JaXg9+ARhUkeBcmz+d0rDkX22D9n+PcqsYY8S5+Rwl8OeOVP+a4BsY/eKfrkak0Bf+Kkp5GrX57SxgvOtQKhv+UC/BmqOu3slYKwagUgfjKXeuX9FjDPQ7aScydOmXvDniUz6Gcx1sO9QgjZU475i4NClNizBs7b6UpcuYIL1dc9hzBRWXf5BU4UlbCGzHyTD5mhHWj3OyLlw7DkyKYFyCxfM3Q8DZvDZpfpEsAGZc470Sr4TR1rEsVKTFNZQm2gx37K68DWQe/eKpnCkGt5Apu5SmkNGKkcaGS5IXuDgq9nlhHaFWcAOz4GyrMPlelDC24DDcHqlbMosKaWO6loTi2nBll1JhT4lNqQONCkCcmGCzvACNumzmXQHtmlw62kz5Xhjgzuqyc4vkjeaAcZV4vtT9R8GOI9DPMKDBN5woSYoKl9Zz4pdoBSAv61bom5tN1FBADzUls=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(921020)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0Dc6Gr2kBf61PoDnE4XdmwivS8Up93AARbTHzsjJBgu2Nf+BNHw/DR//qxAKT8OFVhMt2v53S5mYqmmvaBX/2aETeZVMoo9lOkurrbg3Y8E6bHUyyNQ4IdS677uHDYc7PjQFEx4yQ1qRPW4socRj3hvxznzFSzHJ9x/4he4BNm0jE6DrH32XmLJaJL37eyYafLHMpIsLjUbemgWC8A8hw0w9wQUnW1qcTl0xV8fPPW/Qv3bMNTKlkNkY6nwxNzi72+X0jFb/NXSgTxOTWD9jbVcyaIo0cRtisDbm9NiOVrpghRZdxMqm6fsLRHbWTVTJGy7LpkttzNP5D8CTIXKSTyXusIr8/lAgVfVeQcXuY+lH5MXQVLacAPImyRWZ/vyr3XmlnyFzy0AMvAr3l96zqATD9oVz0etG8cvpgN60CknvY7tT/1akftdI7EY9+7QH
X-Exchange-RoutingPolicyChecked:
	Z2fPFX0tbnufpjQUQ8Z9AFpp8Z7zGn0DUvHUjMeaXjFfujZPoYZ2wovEQBe8VCpzOOHfMkz/w2P2av4K0JMdjSmI43oiFHgklzu9DN5XwAWHtVHLDVpP+8NyMJTdykZTNX0aD0ogkbkQwKLtI3OO+GloH5dGcETwZZE571lWticcEeC3uzKkYOBo6KGDEa0ostDiU1Z+fB8b86Ra6I2HAcR+jbcM5c7NrMKT89PhGtk2lPQKW6FAWheuXednh9wfPXXlkn3M6sujlDyIrEAQygTZ/cxl69qiYl6UK3FyGzhMw7sQFREetcx94ONQKHLjxpoIIcS8TtJN0hCEp7dQmw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 12:44:04.6039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d332073b-f3bf-4ab7-4c10-08deeca5e876
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6814
X-Authority-Analysis: v=2.4 cv=c46bhx9l c=1 sm=1 tr=0 ts=6a68a418 cx=c_pps
 a=zTxK1Vn4TPWW1Y7kXDJIYQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=hpHgAJOo5APm0W2vkfAA:9
 a=O8hF6Hzn-FEA:10
X-Proofpoint-ORIG-GUID: LTMsfIVb2tF8HvA3qf5OIzwyiWuXl9m8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDExMyBTYWx0ZWRfX/X5ognyJcL0i
 fy9fV5oNTS73KhIui47YkzkfnYvezkTBnkrzE7eTcz4oK54CYcJ+2DdpC+G0WLJH/pjylmhu3TZ
 y9S5OIXJ1I79k+/i1S9aHDgej6aP7OI=
X-Proofpoint-GUID: LTMsfIVb2tF8HvA3qf5OIzwyiWuXl9m8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDExMyBTYWx0ZWRfX1hQpuRtnuH1y
 THh3z/nOlkLmZXximTgBs6LvOsfvh5HV/0PR9q0cehaZuiOK4Xjj2x0FTwB1EO0MK963AxMWO8N
 Drolpe25GI8ubVCwfZTnb8fT915/RyxovE+pwuzur2KhxTSxCtKZ8gBSS2rYaxVCJAXrTXKtETE
 l/z6lrUBkh1O6+uFVmAI3bdHh1ClBUmXIpGq0mQxpMyD8TA1dP1gq6x7ZDNh8ElJq/b6E+tejtI
 oynRv1WjIFlZDncMGAaT6KeDMKsdC8caRrFBEc/uVyo9YbkKDP5falm0LhnNk6gjS7ReKXjBF9v
 Q5+NrqPeEFsr+FUHcB1/TDEQDlB4H+HX49SW9ym4woBaCQibQpD/8wB2bqwoBjCoyH5+OGqFL+f
 FDbX0AXYJxg9XSTZjNcbuZPa8EuqzWe0wkeB0wZpijVECoL5mkpEumztI46P8BZPQ9oS1C65mtu
 akfN26J6O5efVY/MqFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280113

From: Rahul T R <r-ravikumar@ti.com>

Add a 'no-hpd' boolean property to support boards where the HPD line
cannot be used for hotplug detection due to hardware limitations.

On TI J721S2 EVMs, the DP0 HPD signal has a MUX conflict with audio
functionality. While the HPD pin is physically connected to GPIO0_18,
routing it to the SoC requires sacrificing audio capability due to pin
muxing constraints. This board-level hardware limitation necessitates
an alternative detection mechanism.

When this property is set, the driver uses auxiliary channel (AUX) DPCD
reads to detect monitor presence instead of hardware HPD signals. The
DRM framework polls the connection status via the .detect() callback,
providing hotplug detection without requiring the HPD pin.

Valid use cases:
- HPD pin not routed to connector on PCB
- HPD signal muxed with another function (e.g., audio) on SoC
- Hardware designs where HPD cannot reliably detect monitor presence

Limitations:
- DP "attention" IRQs from sink will not be received
- Hotplug detection latency increases to ~10 seconds (polling interval)

This follows the same pattern as 'no-hpd' in ti-sn65dsi86 and panel-edp
bindings, providing consistent semantics across the DRM subsystem.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
Signed-off-by: Yashas D <y-d@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 58 ++++++++++++++++---
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
 2 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 504a3186ebb3..73d5c718c7db 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -53,6 +53,8 @@
 #include "cdns-mhdp8546-hdcp.h"
 #include "cdns-mhdp8546-j721e.h"
 
+static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp);
+
 static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
@@ -698,7 +700,9 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
 	 * MHDP_HW_STOPPED happens only due to driver removal when
 	 * bridge should already be detached.
 	 */
-	cdns_mhdp_bridge_hpd_enable(&mhdp->bridge);
+
+	if (!mhdp->no_hpd)
+		cdns_mhdp_bridge_hpd_enable(&mhdp->bridge);
 
 	spin_unlock(&mhdp->start_lock);
 
@@ -788,9 +792,14 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
 					  msg->buffer, msg->size);
 		if (ret) {
-			dev_dbg(mhdp->dev,
-				"Failed to read DPCD addr %u\n",
-				msg->address);
+			if (mhdp->no_hpd)
+				dev_dbg(mhdp->dev,
+					"Failed to read DPCD addr %u\n",
+					msg->address);
+			else
+				dev_err(mhdp->dev,
+					"Failed to read DPCD addr %u\n",
+					msg->address);
 
 			return ret;
 		}
@@ -1523,6 +1532,26 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 
 	spin_unlock(&mhdp->start_lock);
 
+	if (mhdp->no_hpd) {
+		/*
+		 * In no-hpd mode there is no interrupt to signal firmware
+		 * readiness. The firmware loads asynchronously after probe(),
+		 * so we must wait here until the uCPU is running before
+		 * attempting the first AUX channel poll for monitor presence.
+		 */
+		ret = wait_event_timeout(mhdp->fw_load_wq,
+					 mhdp->hw_state == MHDP_HW_READY,
+					 msecs_to_jiffies(100));
+		if (ret == 0) {
+			dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
+				__func__);
+			return -ETIMEDOUT;
+		}
+
+		cdns_mhdp_update_link_status(mhdp);
+		return 0;
+	}
+
 	/* Enable SW event interrupts */
 	if (hw_ready)
 		cdns_mhdp_bridge_hpd_enable(bridge);
@@ -2013,6 +2042,9 @@ cdns_mhdp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connect
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 
+	if (mhdp->no_hpd)
+		cdns_mhdp_update_link_status(mhdp);
+
 	return cdns_mhdp_detect(mhdp);
 }
 
@@ -2100,7 +2132,16 @@ static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp)
 
 	mutex_lock(&mhdp->link_mutex);
 
-	mhdp->plugged = cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
+	if (mhdp->no_hpd) {
+		ret = drm_dp_dpcd_read_link_status(&mhdp->aux, status);
+		hpd_pulse = false;
+		if (ret < 0)
+			mhdp->plugged = false;
+		else
+			mhdp->plugged = true;
+	} else {
+		mhdp->plugged = cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
+	}
 
 	if (!mhdp->plugged) {
 		cdns_mhdp_link_down(mhdp);
@@ -2288,6 +2329,8 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	mhdp->aux.dev = dev;
 	mhdp->aux.transfer = cdns_mhdp_transfer;
 
+	mhdp->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
+
 	mhdp->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mhdp->regs)) {
 		dev_err(dev, "Failed to get memory resource\n");
@@ -2360,8 +2403,9 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	mhdp->display_fmt.bpc = 8;
 
 	mhdp->bridge.of_node = pdev->dev.of_node;
-	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
-			   DRM_BRIDGE_OP_HPD;
+	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	if (!mhdp->no_hpd)
+		mhdp->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	mhdp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 	ret = phy_init(mhdp->phy);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index b53335b0d22c..24ffb732a207 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -388,6 +388,7 @@ struct cdns_mhdp_device {
 
 	bool link_up;
 	bool plugged;
+	bool no_hpd;
 
 	/*
 	 * "start_lock" protects the access to bridge_attached and
-- 
2.34.1

