Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB73BCD16;
	Thu, 11 Jun 2026 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168309; cv=fail; b=D8TsrDGFrVxExM47NYuHRII39Vef/5sBoFUStYwDdNCMw5cKkeImU3B4m0jsCkhdJXTt7+qt/OjnUPen513ba+VLOl3he7GV5yhqIMm2wd1XHuP0GuisPRPRgqywKFh0os0+j77hf4oMzr9xhZV4Yhf7tyuE5obJ8dxNxXtP3PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168309; c=relaxed/simple;
	bh=k6XjttS5ql8XuLGUujvFzAcXrtGZgV2h5kOjUQ332ZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iMkNU34ISgT0NOS90oQThdZ+dR5hq2K06IryhvnkSEaIeqKVSMGhdWrT2YVl3mlJXBdr5uEUIIUf6i9ld/W7hTLpXFOmbEiX+Bo3BkAtU39+jmkUR28M2xmlVRBlmOnCb4np2uWWWni0mARKFmfhl8O+uHyRyDRT+ApPbw6/Qfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ibvX0Zk5; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ibvX0Zk5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwLr1SzGn+kIdYnGCJKORdOe/kXf2EEbuDmo5BYqsqI6FAwH06247pO9KTha5F6aGTpyP1jmSHwhocgACERT6v1fjYxJNC+zE+S/w46m8Shnm9OBfwewEwyN9NhQhYTzmOCycICydcpnKol0CwEN5EhW6WpWZvEX27gBg8egTTPAPADOyVIuH12ilZ0EXrkQPc+dEbevHOqUTQDUwv55hLKHKWQ71GCygYs5FGN+n+m2HCytZPUgEEvNrYzqZpAEBMG71k1wuXLSl0/DIAhtmo85XpNNBRJcUd6kDfSW3H2t3Vel7sQIpMLoLXPI3yW7+lWFYrP1tC9bA1MQmOR9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOyMSCwiLOj1tuFlD2t4jdWXePOZwhWzGQbecD60kVw=;
 b=zTW4GuuNxYAxoss5RFiMGesm6P/y2TJb0IOwZZRhyP3PT5ca3NqKjfqt5aTRY2DazIufeJ5ydtbYB9XpQx5cLU3KO7frjTgv46DCDX+KrxLiOH/b1MUR+aec/y4kxqIL8BSYhV3et9DHQeZMN15OrM2Kidvb9n+FyirHgYXJigZfwBFhAKQxzvM2aEEKUUe8YUcHiedB2NWxtC6erXvLHOj7bpM0svyZXe9vSYn2FEvKNfYy290xGCk12qgZVtFXVD9o+LNtybKrJwZbA4vgJRvVtBnd7oqAdPSLyeKw/C/UHBqhjmlot1G+GDtOOpm+kep5BCC4sdURfl1ZjCZttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOyMSCwiLOj1tuFlD2t4jdWXePOZwhWzGQbecD60kVw=;
 b=ibvX0Zk5VYsKaupO6RmnrV/MikkeP3nZPJ+fziEPMUIQL6w+hl3cuA6g1nj//XTvlZZRQEhBDxXEDyD+gElXUeYNC95nR+g9+hQ6BJjFvpfcjMVnefIQhujxAQN+/DTj5+k5Jc1De98Ar3tvAKcLtA/7rVX/8//+bKH1g9EHukaXwGXCPdt3sGxGFzblCrPi58fMXe5i4sUnO+hwgGrLCwxl9soF8/UXUYBYrGAFEy26rnrxjkQJbwqZZq/EOcWTPhnwDWEmVKua0irBNYRqPMuqEYovbNfMZd21lIPDxd2QJoEyyujEN4gvjFexaDQjfGOMjyVt51MAPCAl8cWyYw==
Received: from AS4P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::9)
 by AS2PR10MB6776.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 08:58:21 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::a4) by AS4P189CA0008.outlook.office365.com
 (2603:10a6:20b:5d7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 08:58:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:58:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 11:02:08 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 10:58:19 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 11 Jun 2026 10:58:17 +0200
Subject: [PATCH 3/5] ARM: dts: stm32: reorder cs_cti_trace node in
 stm32mp15xx-dkx.dtsi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260611-node_reordering-v1-3-7e519f2cb456@foss.st.com>
References: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
In-Reply-To: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008F:EE_|AS2PR10MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d554d6-eee2-46d4-1b25-08dec797968d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	KvmcNMND9LDLzgt3GV1UMmWqZdVrG2eTiiu2DNn+1XBlDOYVUtdari36bjnoSAffW1Txb2wnEbRp050y012PixYs4J6lZ4Z0WFqBHnrrOtY51AQCcWVldRa33yG5c/kszY3TdXDoyZ9BTsT3flKRpHlWeesholHADerlUTNgQL9nUb7xOzd1feBz6m1pK7kaa78pM7MHMJ92B6TTJ8teOA2REBI+DZ0eAJVPUD5DTqEJQxUpEboSLkEOdxEfk0KRFpjiOPdRo0qul2sYzahlfyhkWxtNxVUkOLEhZ2nAGIOiF4GwKYINA2gRnV4xOzCkjIIFJxa05MgLo8GYMZAHTM3OBnugOT388q2xSMbVD5TcQ//9nsUXJfxi77WDtSGilrItBw5rETcrzjC++OTfq/fsUxYwruuUMx7kuvYASjp6XQ+9LP0xp+mBkbhFxgQ+ON3yLRfL6haf6PLb1OG+21Jqx+ERy29WRFhWmuZ1B34NB4fRZr6OrqMJTj+VgpFmLs8i1ygnaihC6b8Z3m9gi7xFC/RxqPspIKMZk/iSBLcJ28z2m9Z2Re5XduXdUF0TDkEXpXzk2kn84q1safToIKWG/MsPDMUWYEGMVEFULhONWEGgKogswxQT4LMVxXzluou4+JrvMm0YnwyoIo/ecLusokLpwdN+jy3SzC8CjDBlqaY5gY6Gc0REorISD7hFJ801WQifYtOGyq9rfc+bIS3HbivIHwG/86sl8Le6GNs=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RHgeKuaHxhjl1Xp9PVUWmaTxaNtrI4L67i/YeFn+uxS2hfGlSece+dxU8sJgOfvyz+nb++zBO8R0Yskj4PvPxEYue9vGlzDhhRThMTveNF/trtT3GOo7WdHAeWDOIz3PVBHrHiWhOjF2JfD+mpsQjwqOSO8DvJT5FKtJ1ILK7SONkymlNtBfasfu92yLtIGpxm0x8siX0Z1/nfgoVKSCD2XZ3KVksFq8oSEc9XzwqPM9QDdiZBoENZdafhChzJL9CN6P5+moQZXBvuWwSBcW/xUXWjpJdXjI5uBIZg5kUe6rDL4WUYOwpJuOie5PVT6DJSl0j8P9fX2rorXByEptHvOydnEdGYKg87SeBCI6rHLYPxG+HuPOqlhrnl8BpZzQwK6NEal2RAmDSD7icvUT/Ny4xkgTep1RftTnBT/SjEn416tU7C8Bhxa5Qf1Pjwrf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:58:21.2103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d554d6-eee2-46d4-1b25-08dec797968d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6776

In the ST board DTS files, the &label entries must be ordered
alphanumerically.
The nodes became misordered when Coresight support was added.

Move cs_cti_trace to the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 599ea07bdb19..956509cef321 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -155,15 +155,15 @@ &crc1 {
 	status = "okay";
 };
 
-&cs_cti_trace {
+&cs_cti_cpu0 {
 	status = "okay";
 };
 
-&cs_cti_cpu0 {
+&cs_cti_cpu1 {
 	status = "okay";
 };
 
-&cs_cti_cpu1 {
+&cs_cti_trace {
 	status = "okay";
 };
 

-- 
2.43.0

