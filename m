Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795044746;
	b=1vUJyIMQcIGHc+/BJ3uDynJlob0oAUFYi6E0OUnVvb3izqjQOOUPpz4J9eoOIGi/nNe7
	 vGBXFfs1uBKeGgrKw3WJ862pJrTsX0KNzSATbkYa8CzZD8M/UZOmQzBoCZaf3alxso2iQ
	 cmm9x75aRDEFCuzG2TukvMzh2g2aZMZH/CiNJKH4MMbSjyJdFZM+vron1JZs2Q4b7SaAI
	 DZzHUrrq5dfsxjctslQc49FunEtv2krY0jmWwJXyYCCjUUqq398z+tgG5WhjQCtOIfosx
	 OI67256f1KLb4SSKd7vrgRqV6YOJ99WZgjRHHxGMnT8PniSXfvPijanfk9uV26AbSUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044746;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2LaPr75fWOvdBgk5NzGOT1ZxS0KLZefh5QA6CT99MCY=;
	b=XrO3bOYxWdWr2pawfdQd6guC/wBjrHVSakiCBEWw1CMDANihyGbM99z2c8d2sGNTHtrA
	 xLUsn44s9k+lV0KVD26Rc+Zai72vT/Jv5CAaRPKymnvwQiX+F8BAX9qcxyUdbLsHGHPPb
	 dkzjEomLscY9oYgjssjVCiWyWt3AB4ezaY7zbG2j9ZEQay4dvoR9e10CuFHJSUQvvWqxx
	 mtXumoxnRe4Vw97vrT0Jw1AM9m0NDSflHFLzc2GnRFRzw0S+Sz/+dmkB/HNg6wZf45vLx
	 Oqhl4CXcZoRUY6NM4rJ/yHYBZgiTwWf4c9v75i7eXy04d6OX1hOrQuV3V8rYig2uwrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rrOQ8Jjp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.53
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2699606A336;
	Wed, 18 Nov 2026 23:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2699606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rrOQ8Jjp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN4B2qHLDIq2H7wwU6Ak4YTgZ+HbCsy5hRDvR8N+4L7+xMzEX/06k86K8MvJDWb4yH0lemSgKUgvMOML01CnYvUwGFNN78pUOR2i3kdRL3ifjEKufzCNSGwb64y7lvWbyQrvQfgardhHGkGV08L506PhjQeARADrMg6jsvArCOMD3qUlin+Fo58adnHkBCKst40IUAcIzv6Wy9Lio6VsXjwp/E1cfySvx9ZhWttvoEzMkfEoPAzYqWhZORdfNm1e5DZ0IYFPzurbFMT4O5QV57uJhY/SJsiDCyzZUf82pS+s/miPTqbXAt9GfIrUoO92LZOapbby/0j7LxDTPGptKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LaPr75fWOvdBgk5NzGOT1ZxS0KLZefh5QA6CT99MCY=;
 b=iX8CDFXwFJylB1sfeW3Vv7TvJCAtK631PkcnuaehzPGQdNERUN7w0c0Uk7iYakm5q5p8bORhim/stuThy0oOreW/tteErpkR1ONwIVOzaMJiS5+TADU3Hu+K4FWiyQ1nmROIZUVJRma7LET0v4mtMXsgPOkRa5dDJD5n8XHXxIbjxmvdQ/mVygSMrgJeVjbC1kXo/NGfnDKK9nr7MQy8t6Ta16Y9IdNKt8uNnoW1S7dRZLCKQi8FFqesLAjAunNmD/SX39OtV8Yg5AJ/kvWiegxbiGHIoCFrSa8CUu1sGTo+WJurZDEYxeQYhCCt0LzW/2zv5uRhLCvcXxuj/Z3tdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LaPr75fWOvdBgk5NzGOT1ZxS0KLZefh5QA6CT99MCY=;
 b=rrOQ8Jjp2br2Si9q2WxxJGBXHqGJxlVB3BUxQmaMGAp98UUtAOuwB7zLvHui9qskvJ4wSkHLpMMU63ZmC4K+sf0yH4pA4ZmFwjFg2hASpderhTibhJISalSVS+kUGcjL6kN9r4WfzncibVo4OMYrglwUBmSTqdxvfd97Yr2Jdrg=
Received: from CH2PR14CA0007.namprd14.prod.outlook.com (2603:10b6:610:60::17)
 by IA0PR12MB8747.namprd12.prod.outlook.com (2603:10b6:208:48b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 23:32:22 +0000
Received: from CH3PEPF0002457E.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::3e) by CH2PR14CA0007.outlook.office365.com
 (2603:10b6:610:60::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 23:32:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0002457E.mail.protection.outlook.com (10.167.252.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:21 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:21 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:20 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
	kishore Manne <nava.kishore.manne@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 06/15] dt-bindings: firmware: xilinx: Add Versal Gen 2 compatible string
Date: Wed, 18 Nov 2026 15:32:02 -0800
Message-ID: <20261118233211.4121361-7-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457E:EE_|IA0PR12MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0660de-797b-4cf6-30ca-08df45cc31e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|56012099006|11063799006|261021121427099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|10067099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RcfcxhU8R7qwnGdzADQD5D3wlVzSesBluhCv9L5GYT/17JmCwKJWRz2iGKY/ZnlrvfQUISYFn/AzLGVUWib6GmT7hqBR5V0bmQvrhnSIIUV/lTXA2pdOWx+qGbBKJgTXmiVyvFOTBaPHadkBPkF5Ksd+r3PZpNR00dnDhpOwqCxZdWzXtZ+IFCpBnybBE+ks3PADpcCUooE1N5dsL0GqBGkjSdgulOvM1YAFUP4F2E7bm2iD/wIiYmglOhkNuwDszsaN5CQXuYYidwi+6XutJn9fwE4Rppfg/uPkTAUoLzHhNMKZQQNez66QzDwptZhsrjmfjd1CKDXp7JeigjdTyqS16NwbwLbyk6WsDgTUb2pNdWVfZBAWfdzxzZSLDpqsMOBqa6FSfWRQeOwMIQQUkxW1+NYpowax3aWvcqEs9/0n8rsdaXWV+jyi5x/V0z6Y3ztVZYBSBVmj6fPoKLH4pFUrrKE1jA4BQLnEEBZSjbiPlz67J5O3SI+LMpMZencTVYqUD4bx5BBmMkZaU++yUXmx+1jVbYX+85Jbnrsg6O/c0udQf1PDAsBbVM8z4wvQuQyzJtoobYsKsetutWs6mM5lk/c/ng/AoLzbboYbsTZ9Diq7XgZDZ0AU6zyXM9Y0xsI9as64VgsUWx7FGUSH0Et9eIdAy0JoE2b4xIxjZ4OlUQfx2VbOxn021q/nDrB9oTs46vxexNBJujyTh36ktw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(261021121427099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w0MXxEpS2Z8fKd9LDF8LUS929SMbc0WsUXEPPR1lO79WJkYK/IfcnQF36h8YvQW9zX994Ac/BW+gnOx37G69WL16awrr/BbbavBJMQrfSQ3bWrqUv5dDEbMwcYjDDlxJ9R9P1d/PBrf5pHNpkezUt/IVy5AcgaiJxVTvXPn7zcZJc1hLcWM1NFKAA+Hjs2ccQtiD+h1DlezoGemXayJA09vMdf+EIRmP0Z5gu9nwCC5P7boFRBUPFlbSbld1/j0PTT8kKChfcdHBFK8DxBfK03eB47F1kuQUgf5H4E5Y7h2cRBzCPDmK60B0ECXDkBh9uo5PjuWJwHAbY7hX0hp1Av2SnoD/G1dvetJhKZnKtLI8UPQpfSHBPV1MuNDXkjBwu4tVoRJaK/Vh7NnaxH4sfOaozLF2+YC2jIl4xSzorvZUn9yzhPvESQz4bR5rTsKK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:22.1909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0660de-797b-4cf6-30ca-08df45cc31e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0002457E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8747

From: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>

Add compatible string for Versal Gen 2 firmware driver.

Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index 72af37cdb103..60d1bd329d0e 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -32,6 +32,9 @@ properties:
               - xlnx,versal-net-firmware
           - const: xlnx,versal-firmware
 
+      - description: For implementations complying for Versal Gen 2.
+        const: xlnx,versal2-firmware
+
   method:
     description: |
                  The method of calling the PM-API firmware layer.
-- 
2.34.1

