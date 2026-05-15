Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D663F8704;
	Fri, 15 May 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859354; cv=fail; b=nJoOER75fe3dJQ7nfe18J9ClcY02ufF1nHwypHKjMTNKzDua/IjHf+9+ONprdrJZJU0Ttg10KoQC+7NEGIaeDaxYyZVsYjhCBmU9i9QceiyFEekoXFEEMZasGdWtROfmtq5MUr2P+Syfc2gfDvTfnf0wiMOUm2XzgzefAN1HrAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859354; c=relaxed/simple;
	bh=I1F4GP8ltSLoIH6rNeq29cftudLWSsOGrUYu/vi3Mdg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RQ3cumXMfPusEoKc5IfPhtXTRApOHCwtWih4YiR+h3SYrz2u5jncFjSMjL0PT5ylWE7fazqPXJYXtX793ykma4O5W9FvlGvleabJ4tu+mq6Xbb+r4KJA4KGeGYjxYcKq+qkx/nG5QesgiELclRKNbVjZMAFbtHenA+enN1muIPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=L70G1L6D; arc=fail smtp.client-ip=52.101.193.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L70G1L6D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIydbyG/Mv5uw27Moz5ZI8HkIiucHSdrkJmgvzAEmGEi3ap6q7EQCRp5moztGu4B14YbO34kr6rishAjzrTxRNrkM7QLwewqUpwetvJeC66OomDFfz5YIeafEbJHwQyt7UDa40bSOwTpjulutHw4CqyM+xSDboe54GgIpKbUJLoFdX8NMfqNg/pNhrJSWs6mRSIr73no5wCrNbooIp0QgdljAuNSZtd6N6RlMj1aUZrSYs8qZ8eYbPk33N4Vo7gQ0Zta6YrkS4MMaKUW+tW1wKn9vO1uaOkwQ/YllFJJ/k5HCnzASP88pRAHIg5oxBSHlW4iEiqmYxUSeFit9KJiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iJqI1HwkM1mNgqqlqUhf1nZ9uo295RNKRwWzXaRCd0=;
 b=rsRdU6TaknwqCUWvesfpf3YXz/HUm4ZUP+QiOiPaJak+vRymVyfeUS9baNwU5PDJMlwuPtijGy+DaCfDtch5BVENXcnqvPydkfrafXogdHmEspLaaY6pyPme/3Lni+MhBR5oGf6CHlv/5xJoMOeanXoL0+mKZaWI+U52sT26FEOZiYurNhIHoVSzf41ayv7PxWh5nH946ufx+8s2H2M662gcCib00vvNZQXK3MnPy3xY12z7/QpuFNhUNKBC7W3DNx8n9ZjDUiCnqFdatToRmDfI/mFE0hGVlmjCaPyKwmcZFO6iTuJ04RdvVurktinpMN0rOJcrK+e6hs/S8T65eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iJqI1HwkM1mNgqqlqUhf1nZ9uo295RNKRwWzXaRCd0=;
 b=L70G1L6DXcSFnKSND4eSsN8IhQorDPfHp8uNr2hzySjKHsaAYW16kB2QNeJEhL1NkFjVL/DP/d+VQ1P3cO9XFiB/JPRrx10pz9jD1P6RLGabbbhmIZrOlXkskvyWuFpU0YE/+PH5rckQ/AObnRP34zOmLSL4xHmK6+nJX9oZX3M=
Received: from BN9PR03CA0339.namprd03.prod.outlook.com (2603:10b6:408:f6::14)
 by LV8PR10MB7870.namprd10.prod.outlook.com (2603:10b6:408:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 15:35:45 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::37) by BN9PR03CA0339.outlook.office365.com
 (2603:10b6:408:f6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.14 via Frontend Transport; Fri,
 15 May 2026 15:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Fri, 15 May 2026 15:35:44 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:35:41 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:35:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 10:35:41 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FFZfon4155355;
	Fri, 15 May 2026 10:35:41 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Date: Fri, 15 May 2026 10:35:39 -0500
Message-ID: <20260515153541.294698-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515153541.294698-1-jm@ti.com>
References: <20260515153541.294698-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|LV8PR10MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 047f0e0a-54e4-43b9-cb56-08deb297a0ed
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lftLqU57I7NIIog/TQXZWPYobrbtNaHOFXnjGDTTdxjLAUtJQ89+bLp2LBJidbeOVGA3ir5agFejvz5M3G4vLYyedsQPpzfMCHjqRpXjdPW2k2mvEDStw8v3Npv0H/lO4NfoYHqZTHMHNaFA9qckm5DWNGioJ0aXlHkPNe65iNFJ5b7Z/P16CUqJonn5FwBpe6reiXLrxZcqosaJXvP21+3WI5w3NGe9fCz12f9NcNnDt8ToQK5Au+sP4P/p79AVwzDABHz2Wi+g+R4QzNvGPZWMJukzrAUOKwxkUVnX8FJ6M0CnlQzXHITRReZYs+4voReEDvLqnfIoczmBb/RlvoHohQMx7mcgzvLmqHF9g5FH/KgAskiU7c4Fw4VXmtA1aJ2uiYXWfr4c8Z9nb37WKTepOLri/xvTsnw1alRoUfJz4dQiVOOs/uJ8pWXftGWbsbkpml8QhEPP2N8GMwQegOdipoMweZKRUPLpfuBlYOYwWUJoVPA/JPYBcu8sgYV6SV7lUyJ8w5vbmiJzJIRKsB4D+laFT1TUImknipopLuW8m9vfKOFrLp2Olhp+VXycD02Q6P8ZM6uBScTy1Sbm0TQShM2dIzME6UCErxYd5GPm3mmIywvhnRjtNp8RuPE0uEFS3bKJ+xjvpMHAatCVAqKf8iP8Dmm6sNM5BTKvLKwNBWZ/yZGWA0KgzVKLGioYe3zp4o5ADTesl/YcDjIzgA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QsJ/RWgNN4gg7jH+IiF7Q9RobTys/hsmUCPHbyjdPptoJ1zrRY414qBsFkedZJnU9HkGZzh4OMXrQs+s1TUzYscrjENE57Kws3w8goQYIQ9uI9v2tohAGl7s2F7qg5w3/eLJ3Skozf8qORJH0xrotldDDLyPNm4tanQBMkqL1zaZiGIRqLrT9rDzpqeu7Qszh4vsmA5TdGqR75Hp/W3CTXkADGq6aNFJkWqsZCLyFCR9RdiXF4N8gKKBamN/0zM1Ca1Bp21NO0ui+O0tI/P7C8VMFKNjmzHgxAyvcUwqw74YK5pM5QiS70Qexil5veOvH5dR5fhyu4Rp/amrdmSFmfK9OppTaqFzTHM6lO/+Ka9yYBiv+prIIQjTaec9oH3A5+4pezqMtsG3SQg2QHyF8NQUgaRehSNLvS21PN/GDTdwp70OTTagVeL5t64b8c3H
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:35:44.1702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 047f0e0a-54e4-43b9-cb56-08deb297a0ed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7870

This board is based on ti,am62l3.

https://github.com/beagleboard/BeagleBadge

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changelog since v3:
- Add missing newline in commit message
- Drop beagleboard url
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2a6a9441c23de..d9cd3fb712fdd 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -40,6 +40,7 @@ properties:
       - description: K3 AM62L3 SoC and Boards
         items:
           - enum:
+              - beagle,am62l3-beaglebadge
               - ti,am62l3-evm
           - const: ti,am62l3
 
-- 
2.54.0

