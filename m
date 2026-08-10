Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023109.outbound.protection.outlook.com [52.101.83.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532D3437842;
	Mon, 10 Aug 2026 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387070; cv=fail; b=jbMmmOk5qTSHJ/nZ+3EUZaTMYMa+y2nYkV7Mq0QownYWo34pLg8yGfZXvYHoht4N96ynhq4t+ZQkAE8H0f/dC7gURV165OV2C+MBYS8aoSmEYFNDP5KX7+xiB/9XZTB6yxoSnxRK2CyLFWC582mFqagdqMU8WRxMWDoKvLwOF04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387070; c=relaxed/simple;
	bh=CDsx8BteZsYS/kxhTMC612QU3gGMGmgRMjG75JP7Q8E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JaSsb8x4853Z5w4/VeGXJSr/QwiG+EzRghVuoIcRQw9H/sG17DPSqa2BqzvO4nHO7G3ZXBrIAwsSEjATZH51DExlNzBbl8Bj1VyN424VyC5VjVwGHZ/7tY1RMkbtIjU0e0tTcmkByZjaUloLdY4Uj6Jl2ZagU3nWtHs1bOIDX18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com; spf=pass smtp.mailfrom=phytec.com; dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b=frzmkocR; arc=fail smtp.client-ip=52.101.83.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b="frzmkocR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCsVNBfxKJE+/4IVikL8Kkutkf/FcQnuW6FhWLpzFEqwXBa2zjvXPqnVP7KdxztaAjMInWKmsYhCJxmCtyijgBDNDsIiD5DMacccGUqPJdiyB4AmntBrs6QCfLeEbWBtjLmwgmvVu2ZKlTeY2sH+aBcdYJpJP35jRK8oYFeQ/X2uycvMz0WPLPx4T3aamYvUo4H/l4JhYBBFqpqAb6/Css9va9DLlC1GcdwZODLhA4fGV1dMVKacQj5IDTLMmMaajPkI3JMgkvW1KZqevuQrHiBZWzkCF5N6iRUDMyXoJs85zy0xDuZvtFfT3IS8FZ9uGgQUAd4OjtHngMW3TonQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IFJzUyKTyComRMaTu+7OqGWhIO4Z4Re3ZI4aToSGBY=;
 b=Lcqv6n/E34UDX4sCmdvcEouJmIgRriF2eWEpMywX37spuVKKz0ogQcRDbimNRN4Aklm7AB9hvU271cT7WHx4dImfMPDCseFad0ypVJz0MqkfbMRirDd/Th3/bwyv2IsoaD7FNmqtilgY/f70tG52Z8jlvNsWmVjBr+XDianuHtKQrlkVxUcCt1dDwQgijN//xwE5BIIW+4RGTequxC1PP5NFTyKdFF+pDTRT7Qu4YZXVy8swwiGjjvGqqBCkeZNnnEtEJbw73NlWdxekz9HkUtzLa6voYJYOD03QSE1zaUL/Dgx/2M8W4V8aTvl0NPhmTl5hh5tq7aviBDFeiwLiCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IFJzUyKTyComRMaTu+7OqGWhIO4Z4Re3ZI4aToSGBY=;
 b=frzmkocRzOGgSitIscJVhmSLlI175Veu9vihoX55WLkkF3zNeEkbo26Cx0Tl5M2UbzgAdyviY/cux1nNUR0mBkPtvdXBcWDNzCE/EIaGTpfZeVXAc12oluKaYIInZ8JZZbZpQIR1AeictChAIFIiqefTHoGV44QSooWXVSN5G2dGXCFTBoJeGfJKFsoI0ZFTJgebGYKrgvOZTF5BLttQKPAT/gcegsGXCdYn7uekYBMRPVQW8Uxh4ZTqKuV3pWODlRfaQ8mSPK5XsuxynoWJC5uXeyBB5upbj32MY77KNWwjJPEtpRYowsI8DG+B84+nzBM2cwx8apr6A1wTx1dkRA==
Received: from DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) by PAWP195MB2369.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:358::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:37:43 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::37) by DUZPR01CA0059.outlook.office365.com
 (2603:10a6:10:469::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 18:37:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 18:37:41 +0000
Received: from wl-jma.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 20:37:38 +0200
From: John Ma <jma@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <w.egorov@phytec.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>, John Ma
	<jma@phytec.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM62Px based hardware
Date: Mon, 10 Aug 2026 11:37:27 -0700
Message-ID: <20260810183728.1542417-1-jma@phytec.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|PAWP195MB2369:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffe25ef-57bf-4f60-bdc7-08def70e761c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	XwjRvW1+XVJP50molx5lKzs5kXJ6S0AasY9FkVIUFyG3FErpEgFBawYcsnezPl0nVJmM2IMOcIIZ/za/N1ZQ9lF3/DfJG2z4kd9lT1jt9R0b8bjYQ3G79RKCMjOh8LNX6qs89FaXVBulybonu84Yw5RgCqgi6pf7GjlVmrqDs1WYmEVjHZ8z9t34mcdpmNqtogTG8ze1t9rneLU9wHJYm5MNcYUxYhESilMz95jJJp1K/35ChPxYtBxeya0TCWM4gZWf5DnO2GJzpu+drajGljzQy418IrghzCct6X2nUE0QCBT5yPCqGoXg78HIH8rYvjRjuUGc1H+m+oKHZgcwlMvBK3BwMylwNTelcTk7n2DfxQgUb/DNZS84czuzpZPMQU0IL7WSyBjV6N/JyabNaIyFCby3mClCBeMZ8GMvbyMjVi3UDRJAeVEeln8qc9NOIiv1ZOZHIilhYyI7xmjcgZEp9iqZF9QV6wQ9f4LamNywX/EP6foNPkEwU3Wmp40lsVYQnLnUl8pe7u96y5FuZljlMY580fO04B8IPE4Vd/yXthgz4Z0XdRdKl+irI+cOH3cLEl3ryCSnPeZkVOg9k1SAt3YSaSCTj5Uk6AxVAtnNwNKv+pCknA4C0EafJOE2/MCXzAas3hu58DM3lAR3rUjoofykRJPUOLFC4/yFbqd2iVrszgh8XYMtaNnwaOHjfXybra5txG96M4tYl/kHtw==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i9hbHErsSkYgd/2w1jH374P96JRgaNaH+N281IK5iGwpbmLEfxzzRHh/JvYFy94u8HJs0/U8RaYHWXEGLVcjOs5kqR6FHsW2Wp0EFdsfiM6pGAPpfQVIFA5PmdNvq/Uu7c4G2e5MycRGn+OBt4zGR1I7kKfccahbXTPaJnAbmvmDkUEGvC/ZRQHAX5tSZD7bPrNT0vzq6ZK5WmOWDoKnP8K0nrJuJNhlEshgMTcOqdgM4/0rSjYMl64I88GbaPd+7HpBWvvJqcH/6aHa45y+WpfUOT1bjWRPKWPmCXdVdzk29Vzmp63nrwFRU9R132Ceq+yfzAkRUmduJgbKd8pcwotd1Mvn4DbM1R8Udq5J56dTe8OuqksM+qD3EMdgSw4mJJksTb/VgWKJQ2+podM4Rs4SUyXGAo3Xr6O2rpcn0rEYDihbtjLeqyjsYcgMVQG7
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:37:41.5680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffe25ef-57bf-4f60-bdc7-08def70e761c
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2369

Add device tree bindings for the AM62Px based phyCORE-AM62Px SoM and
phyBOARD-Lynx.

Signed-off-by: John Ma <jma@phytec.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3:
  - No change
v2:
  - Add Acked-by tag

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..b7cba0a80efc 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -49,6 +49,13 @@ properties:
               - ti,am62p5-sk
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC PHYTEC phyBOARD-Lynx
+        items:
+          - enum:
+              - phytec,am62p5-phyboard-lynx
+          - const: phytec,am62p-phycore-som
+          - const: ti,am62p5
+
       - description: K3 AM625 SoC PHYTEC phyBOARD-Lyra
         items:
           - const: phytec,am625-phyboard-lyra-rdk
-- 
2.43.0

