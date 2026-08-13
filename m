Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D44137A7;
	Thu, 13 Aug 2026 06:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602919; cv=fail; b=Fg7M7CFAMPLfJxgU8wsKmukg7QYGkaEwfv83iHVplW/tQG/jU3Sf7AU6KkOhl100plYNPuQLFw3ziZ54Wsj4NLlqwEvLVpKWqXlN/MeSwbhuqheJ2eMkJXC3EqE1dmWF7QSRm+k1azoQuS5mqz0ITWpp+T9Ooi8I8tX8QhT04mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602919; c=relaxed/simple;
	bh=KrX9Giy9Cs4uYVT3+Z3as43ctpmhVh6tXWxuxSwd7po=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qL6K8qsNNmXYFVKg9aQWA10X1bBJ/l3+N2rLnnXMtM6fQjAPCXXay5z2O9JNoQihzYcrlt9V8yih28SQj48BExdo2XUjADfPkxgyFx0AgNNWvv3pesCnr+/yrBnd2Z+LWQS2S8AQXIz5cBxuYp3jA2toeIT6tQn+xliJt8oYltM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=u+TWnrx3; arc=fail smtp.client-ip=40.107.208.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="u+TWnrx3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrNEVeSSVDjZlcGR3Khaio6/+NR3bqyR29TEK6Bm128iRI01jdI3y0J0ULr/TiD2AyMEDMOt5omleXgUIFf2W6IbxJFzljG2Wi5vX/vemdyGaV8py9Oxd1KA6nDdXlIJg3722oR6lJujbyenm6dytymnIBoeJqgVUcMQgcERkZ7crqO6FlYWD1QH6Umhw/jzYT1ObYaFP0nZc1EXOjFlSY1PoQKNOJyZ16VgEhJJWPr7X30Zm5i6v+kKUQRwGwCJJNM+t3JxUb2uJowYwNTawl6Ud8/IC6d7EXeLzVVHJ3vGDC2unYrmYqRFtYch+0Zuunhx9WmUBb0r4Kjb4Avh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3JvKQLJ6Bg00Wf1LYJ0R8uWcgRpCIIOM1IviQQizrk=;
 b=L+rtKfE+wr8yBoEe5Zep6jhq+ljUaZWK8cr+wOhBTD3Hl86Gp2//IEORnRZI24eGbINPlesci0ozsh0PNMeCWdoj7lHhX3si0NQ+2Y/GevLcGkcT4b38d7yvVFrvIgPeevfuB4DDVIoRlhuJgQrcnCypVSlQyR2AjlKij3QoLWFk+KHfK8pbHaOHu6fsv7R35/4Zcy3YvpsJGFgQFCJyOBUGCUew4vnMiV3YK4yRbJB+01t9xy7tRVCmCN7r9Y2ir1RtOF2/lFYW0t8ymHsmLiA1QUQegUezCjbIVmZGMFmI2p552cNZSKZ5H9PLMcCUAaXGvT9qyYKCSyJ2hwx7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3JvKQLJ6Bg00Wf1LYJ0R8uWcgRpCIIOM1IviQQizrk=;
 b=u+TWnrx36esZ0HF2RTQUpb++l9xjHY4XrRUG4CxCJgunBbKS3eW+LvLJRjXQ5TjVSGEO91iTjZ63JSDNzasDbXFnXK//qFG9pkXiI+MSXhnBUEW7KOcsIx/bZaPEHhFl2naOIyeiogQjsa2px1zBgFETQ3mo5XyK9gQKbxgcfq7ojAlWQqHfjz/3fLp5+g7DwZ08041UnVAzISn9Rm7slYUXx1qy6to/s1xSvisaUerxWQ9DgHzusMKYsPwn1xWy9gNLCGQnNH4SsevFC+p+IRiPJzv35tz7DT+2uYGM9nqk3fy8Vvi5XSB1x2ZEAgOsrIrHk2Lpj3qDwIccQnhKHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS7PR03MB8266.namprd03.prod.outlook.com (2603:10b6:8:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 06:35:14 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 06:35:14 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: firmware: Add interrupt specification for Intel Stratix 10 Service Layer.
Date: Wed, 12 Aug 2026 23:35:07 -0700
Message-ID: <e2e3f7e9adb7763516b3f0214a0f6e64a8342217.1786600929.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1786600929.git.tze.yee.ng@altera.com>
References: <cover.1786600929.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::18) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS7PR03MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 374c22f0-a144-4d7c-8484-08def90507c9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|10067099003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	HLDSjvPI6DuYKmCh8CcCsk4xhDScCeCGpy+yUzAQUUq3sZSg7vwuD2BAjEPsFTTBy2LPnPkr5wyZSzR4jCnPnyA9ne+43OZivXHe1/C1BvxvVjdaEGuCAZ+M0nrOP1MqmWV0PlObFtitGdAh10znvuZo8tEUGaV8+CNkepumF8FW1gztq6P1joPzSyzlBQYyJ7kB1hViM6fuQJPEuMNNt4kopQk1L0qE4IkpnYVvKR5AzRyroKDY8XV1bziSDRqE/sDveXNA90X3eIZzDhoBpl15Vn1KQfvEyNU1b5l6TGXOnrY4G5NaBO/q6T0g6xOZQVOq0YGquw3R1ODSh7Exi9+23mp1SLoO5Lx7Rr0oGJJlxs34skg4pLmBt3EYfwfal7uIzqv8Am7Nm+dAY0KzK+7b4azIjkxdNrpZGNh3RFP80/814v/crjz/4gRvSQ7q5yg8hhoYfIXeQ3s+94NV+VDXTZ/HpYGli7kFsUUJ/sMp6VZJksIFgJSJQhursxppZb+G8V98/rEdn6YKLceOjzdYE8ThuvntWb/bk+58DS5rUxBkconJVrQX1mRKZQkacqD6zu2+JKFESokAmQ7aWB3BXCV5TifISOO1bpCCKrg/P0w9a2ttNxJ0DAAZkho54jLEoHvWj6E+UrGd9Ed6cgjVS0Zj63WXb9PbZFPlM0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?37QnPx6ECVDTq3bFiX5vv6jRH1mI73bDpLXeVlnEIAkIhY0dsI6VyFFWf8ya?=
 =?us-ascii?Q?1NQjDjiCog4GqaWWV9FS+IcT+JK4DCZwb/JIHUOIYO15M2NQ2a1g5DXryily?=
 =?us-ascii?Q?Z6+T0S13kaXCfASXQAPASPFfQ8FOb+d10aLwWuAq2VegHKhZMv+NCuxdlW8I?=
 =?us-ascii?Q?OrUht22uq5uUSUlwFFXrc3b62qCcBVaCmVT7f2ayKMtvB6PCzbU3JZd0oy4v?=
 =?us-ascii?Q?nnZ9R6i3Un/IfA8WGRbHViKXKH2/9rXEpMm97tSBoImf79VPI0pQgwvJ7FtO?=
 =?us-ascii?Q?uqAtS8a3jpVGUZ1UySk5g2nOCpBN5HmSeI1E3Ys4L1plluzjBUQf4NqAHqUf?=
 =?us-ascii?Q?mBSL0Kj25dx8dthTrLd7ZTgq+TyZbpGyDhidm+dOjsQhKtccMjLk9aoGcwvn?=
 =?us-ascii?Q?3P6aJBjk2m3wV8UfHHPlAYjb5RxES15GnIbjyWwZgxllt602QxXq8T6r6HoG?=
 =?us-ascii?Q?2eJ6V14ONNdwXwkfzWaO+8AEWs3+vic0DEDXeg0D2RpDDvXguEEOSVZ/1Jvx?=
 =?us-ascii?Q?kon1Sjw++cqoQpYEdFhrScy/LK16QJ8FAC5DN0iX8wCV/5lua7sLGG2UeV9W?=
 =?us-ascii?Q?LGmxSvqfIffT/AOdWGa7vzIZDnrsCoJQ8Z5aAUJHYcz/wQ+tp14qzTr1a/J5?=
 =?us-ascii?Q?j1q1vZWSaXdH8fYJRgE2KQD0OL4I9aURIt2LZTucc4weHDODctW8j/JTadFA?=
 =?us-ascii?Q?shGUlvWf2grmMlAUbv1LFDZjw0KgY6l6/LQWLI6CwSXKh6cX+iFjV/FU9ZwV?=
 =?us-ascii?Q?L4vFf4vlV7MvEBHA1quRGC8Y8ammYeHglrLAtu6X3ABZWpOArq0QX3ItYcwW?=
 =?us-ascii?Q?vMsmlra0gKyoxkXE9PJGaBu5iZHlYoXtV4sUlT6H/DV9U9XYgpsnxz2x/jnz?=
 =?us-ascii?Q?Xsiw8YJa/SeQttX8xrJ+zG33QZx7HXCCZQB/Pd0v23l66aLkuQuvgqNQSYx1?=
 =?us-ascii?Q?a41GMfXAHPVR35CDXr9hPJ7KQQw/JfbAxxHfxAwVyNkxrcvBuICj0u78OVx5?=
 =?us-ascii?Q?oEiIFpjYmpAKNug8i0paIsw+1kkbuHafoIkiAuv3xY8TR3lS0L/IrMk3EZzj?=
 =?us-ascii?Q?PcNxd8csTssrtnmDFHJfGfU0encFfSeNcseK82JGKGzrS/mUzIV7R1e/M8Kj?=
 =?us-ascii?Q?5yzat2Sm8LdCCdTGPvb1jywYXUJjQv9dARrlcHKct0cIHptI9zOiTiKVATfs?=
 =?us-ascii?Q?M+NWnZd0IQC5TaiFev1SBQCVoJuo/maPYelxuGkbwkFKBaEai+QHGV3DQZwp?=
 =?us-ascii?Q?iKSnBVfCwwR0chtiDFRSmbkGmKPUn+FgK8MMUzlureQ4nqZxF1evh6E/C2sU?=
 =?us-ascii?Q?KoE48ArgWv1HP8QZlQ6jZNfoQpWMCXVgtIREbqzPykRVCZE80R8qwFewsQMD?=
 =?us-ascii?Q?7A8QwJ3Xg0jIUKROiR0zZmosqOyV6yRWWmiDYVBkyt2AMULa9zdxFq9Jw+1E?=
 =?us-ascii?Q?DIncL9AM5jNMQD3nXUm3kLgfGLLuoURpS/imot0AH96HHVsV1iaYDX8sZ/nq?=
 =?us-ascii?Q?BbNHwbYSbxw0tXkOPaQm9fqN2uwJL9jj+nw/lSElYDBxyeQY5t7619e0Ar6O?=
 =?us-ascii?Q?ZQHnUQuMVwp07zz3Z6f3X4a1uJziCoZ6+QPO7t3NVQNrbI0xCcv6+BoDeOu4?=
 =?us-ascii?Q?FoWqhDWFbgu49byZEy4y3OvbviC7dpmPv9SZcObxsSjaqxYWpEqqIpNWwKB+?=
 =?us-ascii?Q?QSABfzHMGWDWg5I0ZN9ABSujfqKFTZFZD8IbeWF0HBX64IRKf3PNLvXJqVR3?=
 =?us-ascii?Q?uiUxzt8tAg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374c22f0-a144-4d7c-8484-08def90507c9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:35:13.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WbgiHIDd9patB5CgYqvBAWBcHafMGve7FTJn6zggjK7DQeEpfSBSREwazcU6qlswXfCbZhHQE7ba0ZoprK1iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8266

From: Mahesh Rao <mahesh.rao@altera.com>

Add interrupt specification for Intel Stratix10 Service layer for
asynchronous communication.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v3:
- Reflow commit message body to ~75 columns (fix Dinh's comment in v2
  review)
- No functional change
- Drop Reviewed-by: Matthew Gerlach (no longer at Altera)
- Add Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 .../bindings/firmware/intel,stratix10-svc.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
index b42cfa78b28b..1af8ee3f1f3b 100644
--- a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
+++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
@@ -55,6 +55,12 @@ properties:
       reserved memory region for the service layer driver to
       communicate with the secure device manager.
 
+  interrupts:
+    maxItems: 1
+    description:
+      This interrupt is used by the Secure Device Manager (SDM) to signal
+      completion of an asynchronous operation to service layer driver.
+
   iommus:
     maxItems: 1
 
@@ -82,6 +88,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     reserved-memory {
       #address-cells = <2>;
       #size-cells = <2>;
@@ -99,6 +107,8 @@ examples:
         compatible = "intel,stratix10-svc";
         method = "smc";
         memory-region = <&service_reserved>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&intc0>;
 
         fpga-mgr {
           compatible = "intel,stratix10-soc-fpga-mgr";
-- 
2.43.7

