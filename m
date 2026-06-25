Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010031.outbound.protection.outlook.com [52.101.61.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A893C1099;
	Thu, 25 Jun 2026 06:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370419; cv=fail; b=jvq0fTyPA5d8oi/0hZUOuW9VrZJKrkYCeea7Cwk36h006Go9niqVVnFZ+yoB+MnJSwJfD5rxtq/kVReM9gRoG8SjReBQELLRK1xQXlHdgLV4u6s9a2jqgrJmTawMBKzvc2v6dtEAaeRuMIrRB//jmQzyp6rYEiFstr0+URHuyv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370419; c=relaxed/simple;
	bh=ssQxG7cXk5tQHQ91ayLgdHRLc9L7phkL8wIDzZiN7wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PLK+4ZbZ2cFJT9dV1FFQO217r4B9vHEqt0S47exFFYR+R3lL3qEAgf4SoCYD5Wyk6q0GrT0vIKgQdyElqOS756faGUXWp3dBD85pR63i2xFzMXqhC5dNiQcL5H7fgWlYzmJFs1DGntp4rfVTzFyaKm6jx/F8WEaDlwnNDfZuBsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=QzlTE9JF; arc=fail smtp.client-ip=52.101.61.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="QzlTE9JF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwu/1L27GvjHQaRm68kSAL8ZMfpOpZpU8ZhPFmT9tNJ7MVpt5G0Iv5MXFWr71czmGVSVcmpmcQ39QKsIGNee4eyvQNezzQ87wPHZe/DJsj1xudjr7ckCDIwj9zi5wVGD/uwGxXIv7s4nSf8dP16B/wBPIGfesTrbn/R+zrr8srwm36tx7tIpEMg4d+ux6RsGA7D+aIQZERnSbVLFWmxmvyF1KP/893WXjbC8JetCi3F1v4a3kK6E0D/hMwIPVyzbpa78ZA/+YsNcoZfrP1uxzt0nUt0LqoWQTrpaOfjsLBfnnfk6sZxAZFsyE1aLKiNUGDFRCh+ChHc70uCLEBjPzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oVp7AZAStgH/DPCh/E9/8PHxuOson5/w/K1BRoEF4o=;
 b=nsVxyHRGCbqXb85MREsfS0jrTQ4099sLCr5ZPf+ou3nNLzYzAXR8mr9Bm4RK5fjMUfr8TyDlaEesSIDg4BSLPW6w7OT244pcMmsTpqIyMTMr8WOidYFbcVDfTnjd65T4uM5YABcVtWrSNoY9pTwrrs5qNjmTcWh+28lgILwYc8/JYgwR/6pjmKRdyUX/5a2YEglGsAmlTsB9YQzYdNt0A3dXT8bttXdBDpq94MGrgFt3BHirhc+bIAmIKvRqOVM15uPDWsyj8rJlfAyvo1Blw5fVZjflLVtClk/vKb2esTd6C4aEDxgYTAYIvTmbuNrRtFgcD2NWlhflZupvl15Sew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oVp7AZAStgH/DPCh/E9/8PHxuOson5/w/K1BRoEF4o=;
 b=QzlTE9JFp4GtZieqwo7GrdNzkMIOd9/lgrygB1zUGwvr0dgz+gzHdxk2zMeDch5wfr0brMpGCP0UtKOaTWG17UWXmknnBWhR+/KCoJ1kM4igWy6/QIb8nFG4GdWML7W2cRDGZrGPaR77iddXQZnIAezabhZsijjrRP1vUVg4gY3mM9HhaqS2eX4EA7acREDgadIuMw55NALoV8bsE9oq0wj0A7Q1ilzk1XGW4f9FDHmsrwNOyY+QMJYCPvzBpMXyj4a6dTnw6A8mjJmWRKA8InPjFitn65Ly265vGwgYJUyJ7/20ntey+dKLLEXGT+U80TcJ7dvGF/WFkWGm3q5CVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SN7PR03MB7229.namprd03.prod.outlook.com (2603:10b6:806:2e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 06:53:32 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 06:53:32 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: altera: Add Agilex72 SoCFPGA compatible strings
Date: Wed, 24 Jun 2026 23:53:28 -0700
Message-ID: <20260625065329.20274-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260625065329.20274-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260625065329.20274-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SN7PR03MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: dec6cbe6-d1d9-4cbf-31cc-08ded2867862
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|55112099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	R19dcPmAI9OUwpaEFy7G92rtEl2dRWTnyFW/VGT3O2R8L4yk/AnYu7lrK37g2ZGeKGZ9vZV0FnocM+UIaeEMo4gpd6F36yzYbyd382QzFDT4+gPJ1rWf1DToIo2vfi9IjM86OkGrLARYz5o5nUEpVD/jiadbTP3wdIph/7p9eZkjYXzqGhS/ljA8dkkh6bV0qxD8YMgpJxu7LJyu6Ry5hOoBE8MTRBrCD2QNZ+eXjtqU7vqOA4R6pCrV9Rgs29ugcRhxxcHI9fbBgAe2060EXROWvGKruTL0QF7lAocs2gVOooWRziFK19jCJih/2DEg4Yud9Qy3Cg6FWUV3yvyv+LI8SxE0LBvJlkD4EKC+cE3lp0NUzgh3jIyGgQnf408SltgkfruLwp2Ag87JhI6oL5Zw4OZp7UYYLdN6/omJgIup7L5X9LKb4WnaVirsYOXQuk+xGncYP/G6lAjasmJiZ0dGu6k6t5YIPhcy5n+Ka7z/zcpvrrB9LB2Ji3X5/+XuAIaDG/JOAJ3hzfKlkXyOe6JZwwlY1UMrq4utdrFZIxj4EphXXBoODSaEJMOktxoR2cfkHkvfqVmmi+SiyWDXL5urIZKb9cQToYHsRem7UoUFzQC4XON7sqTBC709jSGBrL15f7XxnOYJKfNDWAhreeEotMRxW+MQcWubOU1MA5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(55112099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RCPaAsh2VYtJ+s2ek0DxZYVzdzzgF9LKVh4g69QpaUgUQSJ4Jqq3++JXAYJr?=
 =?us-ascii?Q?uzlaQd5nFaohf8ea3hA587GcR/H5LLE71aNopyhICNfBORrxgS6OWK/zoDcW?=
 =?us-ascii?Q?HbJDNsfo98Wt8Qm7U64RJ20Mt69bnL2wvkEK7d645QX40BaQB97g+BreLQXw?=
 =?us-ascii?Q?wGBey9aSLd+4taPlbFstY0X/B2cC60POHyl0XCo29bH48wl+Zxu13A9VZKtr?=
 =?us-ascii?Q?Q8F3fXSpOxFuDbt7p/VI8Zqy1/BLK3k0m6sXgTwuWRZ9/NV0ovzrkAaEAZM9?=
 =?us-ascii?Q?GRzggZqdCpIAcN/XjNhEZevFstv0rV/edsVXbeFr/Kk22MA8E3r9mbtea1mX?=
 =?us-ascii?Q?87v1UxvQmOuDp8Fnbe0myLJOFwV9JTyNq7OlAowZAhAe9eWRl8lfh/c9e2C4?=
 =?us-ascii?Q?QoEG5KVHpbVzF753OB9Acs4t3AgANP0vCZrUKIY8LCwlwcfNCxVaDfQtRdj+?=
 =?us-ascii?Q?W+VWLccakJRLGgXLMZH+rryU7HuWS2Xni3qPMdVqn1W9x2UCWzmVWia7Lt3g?=
 =?us-ascii?Q?9JGL8VqZYSqjdTEz7LfIaBkBqJ8kTcxXiBBPH6Ak/dj4zSSZUA4+zXp6yk80?=
 =?us-ascii?Q?ugEjFfqroQhQk6YCSaGsM7EU0amIBKdlIiaC+oKB/EbnHm4D+i6qFyDC5fEM?=
 =?us-ascii?Q?MAzAKN2Zqrsu37ZXjHQlhI70A7tgoFIR0R7RFfMIMhblqI8FcyrGlSGGu/Yx?=
 =?us-ascii?Q?havghzsJkmPg1Jl/vGDvA9FcDuXUlyLNw42xSFq0kPX1tin8RA0dCplMe3B/?=
 =?us-ascii?Q?lXeyHAMxzb/NHtWYUiP+hmhwx0T6sKZLfR477/gAOdIE3IUs1UPWWmmxN3/+?=
 =?us-ascii?Q?L/t7h3wef+DlfUQ5SmHJv+0LnOBExkqUzZX47ytMgNN5r5WyawbiM7/rvoq9?=
 =?us-ascii?Q?hX1uoak6H2gjI93Irfr0chD20TPC5gAUzKjGqjQB4oQDD/poRv/DGiRlWSSA?=
 =?us-ascii?Q?SiU3+//0WlugveZMR82EcT7n1glMlSGSRqrHPkJ7KezM5laIKCFWilahFRmq?=
 =?us-ascii?Q?hhAOYWUgzSvsDm5dSm/SQdlV8clcZBDwY9Eg+FZsIupoU18saeZoRXtfbW8U?=
 =?us-ascii?Q?ycJHSD7ziUbvOzhDWyoAT76LH9PBu11wLf5Db6QKROrLXcwwAfZV+3zaO33f?=
 =?us-ascii?Q?Jy+/eTP48LNLIyrBH00t4P5Y1RiRczQs53utyfzOVZGFAsinMNi3jjc5WTid?=
 =?us-ascii?Q?SvFljarmFQ9wlG08DIOfLwzDCIYq8r4IQVmcGhV3v8ZQtXEdT5VFfBe5oo7C?=
 =?us-ascii?Q?HmVHDhYaBxw66kKmt19lKGJK52mWZg7QWx6q1lBEpPfiy9GOsiMT+oVjGcb9?=
 =?us-ascii?Q?RNg3o35MiB83lbLsYxhwAj3/MRnyJMEqHRwjIyKJ7dNuBG5RAq4+L6HCAL6x?=
 =?us-ascii?Q?22Udsoro7xXacJrEBjzYHoQSJci+CVGmWcwbiMTdVbXDSvGoPUWbV+jSOMLS?=
 =?us-ascii?Q?IElAxjjfNb+vImqVyXizS14S8sEP2+V5jFmMd88FBsrCUDLXX0/KQ02U9oQ5?=
 =?us-ascii?Q?dXeSZ4vujt/rUQWWZtvhaHCT/UWAtFi9pVC01x2MOin9QEENQ+JCMZkKPXRW?=
 =?us-ascii?Q?LZQXHy+jSZW1gkYHFXd9pjmKoE4KyU4uar4UNnCKRoO7VN2XJoMmqcpKRcLx?=
 =?us-ascii?Q?5VtJKrXfanBOCJUeL+ZCMmSK4a9tQZZSLqCshRqGSry3aS78ngaxcnju7k+9?=
 =?us-ascii?Q?UI7107G109k/t60TEcacYSL1mJ0V0TCDJsBssnvaByJHRJ2tBWZYExlmEMym?=
 =?us-ascii?Q?ocpt0f3l2ep/RZri1jP8IyvnPV7fKXAbUU3xv7THZ4BLp+ZXFGgq6TvsZEZy?=
X-MS-Exchange-AntiSpam-MessageData-1: TxLgUJf+FHdA0w==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec6cbe6-d1d9-4cbf-31cc-08ded2867862
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 06:53:32.2162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3cmFFgl/kwtCtS8MICUBneNuQktSIIsCdHNJb5RiC/OAx0usgnmV9EMB5CIGrcmFxr12n6S3NKQCZi78Y7YfIGwMHQWMHV5c08C9/ZTCG1LrbW9cO950a9ASvaiUF2A+Ah/8uiEr3228tKgmFbtZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7229

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add the SoC and board compatible strings for the Intel SoCFPGA
Agilex72 platform.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
- no changes

---
 Documentation/devicetree/bindings/arm/altera.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 4b096e52243e..cc03fb437a9a 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -115,6 +115,12 @@ properties:
               - intel,socfpga-agilex5-socdk-nand
           - const: intel,socfpga-agilex5
 
+      - description: Agilex72 boards
+        items:
+          - enum:
+              - intel,socfpga-agilex72-socdk
+          - const: intel,socfpga-agilex72
+
       - description: Agilex7m boards
         items:
           - enum:
-- 
2.43.7

