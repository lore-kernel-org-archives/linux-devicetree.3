Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F444D688;
	Wed,  6 May 2026 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071355; cv=fail; b=sDIQG9aP1Vn6N46DSxNzHfJ3aH74pPh0txjg1zp1wE8NiL23iQmnSnZVvxE3fvh9ksE3I6E4LdUHCSbxqWjh1wNxOuF9vPILorcf/OQTPCoIugJtKEvYJKH+i0c98NXKGie7gwZUekLJYS9p2aaI4SPotjL/gwyQGOglEraQcZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071355; c=relaxed/simple;
	bh=Qwehyx/jGL3LJOO/hbWhSE6lBC0ARHO9OQnb91Wa7UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FGQOZGiNMnrlE+reDL6XeViGZiLlD/eVPMGTsz1It+ExBT+9ZHS1uaj5mHQuoJiQ1PBa/QX3VL5Sb/baWLfqQYWtcG7rpD7AjG8rvarDCiqALag4pE0XGkYLfALkXvJYoEjDRtl6bj96R25zlJYNhts73PVzpRfja8/+KDhmODE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=YDKhF3bF; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="YDKhF3bF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJ8NdP2kYfdyIKZyMik6/FpuwSfEDDIJWMcMpl15sBOVq8767P6O2BSkVudzNFpPbmlmM77Ny19/nSbEGyyGb0MnqbGS3vhGwg+wU1FlTqjZxYjpDHJhW1AJuNH/rDA95UolmhcW5aLiBC34+NAmjlBsoRUljNeZeKmA/hHBMKPJ04a0O/XzAoxZjNCBpDGXbe6luG8IavHOtaMcakJHCes8e3fqTBoSYtmhMinG6UgVrVS8x0sGF3r6NQiF2MTpclb+ZPwv2q3Zgoq1vUu5+RAAX5zeE9as/GpxzOVn6Qff2tcQsXhCVFydgKDkN1GcsfMajoEZqbjZGqhQ2zVz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwBijhe/0s9q7IPGl9Dh5+ap3Aa3e+2YSDjidCBoRWo=;
 b=cIOb0TBTj3A64LWwgqHYssAn6sVrj4wqSImc4ugkPWkx9kAbSOx9UovLI7+Hovaq0Xf5Fy8/ihMwrSoAekTYvVxOI4qPyjZ4n0RCUJWQMhC/gy7e+vMOhoDudBB4S/ajRKOf39pqG86I9Uc5XCF2m8Cu3pPGArUpdOd2RrvbP9aq5hpgg1aKfiPQbM/utmauWbnFm2EBAyaHHDI5DEXGnrIKSsXo+6ZweLtCiixLEWpM6d/l4eKO/amB/WRkqc9HIkx+N2lfbP/kmSAjHhKRlplv4Qc53RX7/RXyypgl6zG4d6T4PoVsWm2O+SafvHvhQAVlMQj5qOSq+x2yFJfpuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwBijhe/0s9q7IPGl9Dh5+ap3Aa3e+2YSDjidCBoRWo=;
 b=YDKhF3bFcRJwYp/DLOVQ0g4/HsCAwZPf9mmvNIr89fNjA8tCHVZRE41RNwF3h506w3QGe3vE7YUFHBKxTQRNN5PTWlZvfrp7jyrf69+5u+6gBrt/Ve2fOzowtpaSJ8ziMn21bbjnRuLF+sf+bZaNj6OuPuyjA+iMddKrzXO66IYbUTixA7ZCDr+mnHyypkRMUss47VHotrtpsmRLB+BE3fVKSUkq1eHt0gbuzwe/E2yNO2KXupSq64NEMjfbc4X6w9aXBUglNpgpYYE5nG/z/v7PuI3AA+jN/IxjB3q5rEEWATSEzmxc3bjr/GYztHrAIDMj50XN6zvd5KJiEsj2+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by MW4PR03MB6948.namprd03.prod.outlook.com (2603:10b6:303:1bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 12:42:30 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 12:42:29 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Tze Yee Ng <tze.yee.ng@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Subject: [PATCH 1/2] dt-bindings: firmware: document rsu-handle for intel stratix10-svc
Date: Wed,  6 May 2026 05:42:20 -0700
Message-ID: <09822cb8171f90d50c018f2f1fae5e5aab737301.1778070377.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1778070377.git.tze.yee.ng@altera.com>
References: <cover.1778070377.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|MW4PR03MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4a5c8e-5a9c-4a42-66f3-08deab6ced92
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	19diGny5a0z8yrNTP4iYiQNwTGbp4ZVE1K8hPzCgXArAVvQrDDMZ/H+53HP9RJJvoiSWFXGO3z0cnm9yxXfEg7WMA2kAZgEP4aTfAKa3oJAXewS3EYtQ7Y4JXQp84BMf/BN/MF8htDjFFXWkYzUVi2mZg8E0szYax9pvvmuqNFn7yO26dypknFUqzQWKYTC7eir9hZQbY5LLF3tYaN/ilC0jlpts3EeuzO4DvNtkZnn5fjrmrn4BzZX9Gu7Xf59/dmPgosc/SzSd0JboYk58m1URx7j4tz2htS0BJUIlZEo2iNSHsVfrMvV6iJhPf34otEr0nCObE9OHYo+Pha6MBhAQOrwimR9iuU7BvIM709KSkuTJNlIL/Xk81RDLExBY/9L+57ShRU+Ml2qXXCNH2zBdJpYIsw7+0tuM8tJ2fVC+dvIT8vAvQ5k3yoahEIFKU4lO0k9bkbbsC6cMbY7d7IGWQj8IAQT+jp7fqtEKvflc77RYPgIba80o6v7nlsS/0Z75LYDnKMkhn4u3OzjSo9YzgEjFUYOEX2LHBDKmNteSFkb4+7azEiwCJORkl6rxp8J6gmFDFbenmLQgPucykOE9CCmN74HX119HSzDgcHv7eJIDqfvt47amKz5IO9A2mai00atVXFXpge9zQfRQoOGhNG8Wdq9Pjm8gks6ringi42rQP8TMk3Hw0oSNpWQB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?liGCSMigXi9E+snHnFTofFX6IpI2E7sYK0YIPauh+p+rDkiOU2n+iXdwBTyZ?=
 =?us-ascii?Q?SRnhEHo+khxjT53MyvBivZrx/wtMjSaUaWHRoMlnCKSA1Slh2R8djpJ21NmO?=
 =?us-ascii?Q?IotaQvDy49vx5ZUmWDpKKGpWEK4zFmhXjqyvbhP906KtZd0tWniwkfvRGVov?=
 =?us-ascii?Q?WbVtJ+VyAq96yksbc9oj8gfQ2c2mtL5SmLu1DYu2Q0KlbIJXYOzn6yswXQcx?=
 =?us-ascii?Q?l9CvryyabE4dxiDBaH97cFjBYjWYBkeQMWODv5/vuKzPWB/IrR5EPh9/Hxfg?=
 =?us-ascii?Q?o8oWHYuHBcuoOUh06/H/EOktJ+Bc/X0m7D7PCpriv9qoux2HaZrYlJ7nJBvV?=
 =?us-ascii?Q?eBvG725AVI/TLzXyiYGZYayW5k41Gx/Y9yIBl/i55/bif7G5Owdr4mzWP++W?=
 =?us-ascii?Q?SJulyKX4rfm8Gyz2PLtgET7dL3tjINcV5s84Kj/bgo+m/n9DwkE7zgwLIdsA?=
 =?us-ascii?Q?qaVrrkw+C1wj+OAsaOSfKh+RTdWi9YQAR/BY8wNoZyZ6Eg4ft6oI6hFq8s1X?=
 =?us-ascii?Q?85OKSZGpKVgv0UxbIb+9B4fJjuc+9R0QgTdQmapF+I7mKbLr1YB8UhIfp2Ch?=
 =?us-ascii?Q?xPV0LC4z32cBBudSvy4yBtmuGgRr65GRvb3s4i64jGhPdtUsSR9KI1RRnxUh?=
 =?us-ascii?Q?sc5sx94oxeg84lBp4GNTeq+FcjnAIEczWYNYQNibNA5Mzwj55MVcve52L4cL?=
 =?us-ascii?Q?vXQyQyKfCbae38vjzV+9QXef3CyhXYKPnO/YiQXIJh+GAbUe4bdTXukEUrM4?=
 =?us-ascii?Q?74GqHb9dm26GKAdOH04EWM3csGmN22txqS2zAnM/RgRR7htog23n+tfRXKO0?=
 =?us-ascii?Q?0lTJVckE15vnLwB5cRq3461sgjPWN09LwyEa8EOOiLuBj/4bk60bYLaDaOcU?=
 =?us-ascii?Q?1Fl3DR2nMl27pHldkM3ZSoOkiRMs7SY7EdOt44+Ou50PxRkJ5oMiZ2XE3t48?=
 =?us-ascii?Q?TwLNcaTblGZGBFzvaZdYLA56I1pn+WPVXC8vqC9NBEkAY8k3Trpp62ANSH8K?=
 =?us-ascii?Q?UVws0OEblyoCnI59m8fky4sdVGsQj48xM43/4ET6KQ28D/53yIWkTAoeUnB3?=
 =?us-ascii?Q?lROgIsj1b7SzIhCDG5N13gQ91r7yA7qbCaPK1XO6znalVEANPcjT1hHvO0Lv?=
 =?us-ascii?Q?Bh9FEi286nuMoK9tx0Sd7vBGKHfoOSnrjedlpEpo6De/UpdmSq/YwFpadZL4?=
 =?us-ascii?Q?bo9NbQmEuxZ38Hg/MjAR4p2/kmUluaJGluO0YzVBFRZg34hrvSZHbMnQM5fI?=
 =?us-ascii?Q?2bVPlXNKicTilhdK9kGgPr9ff5HOU0oO0mPiBouhvcbeOzoR+X/0MbkRWBt5?=
 =?us-ascii?Q?QksGjCi1W+FQOd0/tzwv++6Mo/acnU3IzhqmaCgh/tzSRJQL8IMAePwOe/iX?=
 =?us-ascii?Q?iPArrSaVyzVF4wxrLe9eTzQnPqBkNBvO2WDaAgmQlmXINBO4mGHk3dOOyW93?=
 =?us-ascii?Q?Su/f1udoaJpFkc5qqgd/u15q6S8I1sNzxzAifef/84r+aybuxtncQPqFn4Wm?=
 =?us-ascii?Q?1+WF5FzJjW9Ue8DQ9XWCgBUavfjUrbEsBV/bjuStLNjdwAlXSY/A5R2zcH70?=
 =?us-ascii?Q?ddrGwDcACzpZr2pd3o+kcvjomUeZMZXDejdLhwo5MogPEyvoVc2l789nvxrm?=
 =?us-ascii?Q?s2vzPLI9wS5woFM1KzJasAkRHg55lZ/UmYkfb6BVkOoUVa0mwFRiITxSXEZR?=
 =?us-ascii?Q?sXBmh7E8yoiIBLyU157jrY8mmO3h69JmqLtuxtbuosUVPdRp/YenCRchNMFV?=
 =?us-ascii?Q?+DS8MHAflA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4a5c8e-5a9c-4a42-66f3-08deab6ced92
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 12:42:27.3466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pV66vKCgwfVlmd13soOi8qNm4L9AKdPuP/7APRWl8z0CdzEUJ8/137aO8OsRDDUYJdMmiMeBdymJNDNU57NTKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6948

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add the optional rsu-handle property to the intel,stratix10-svc binding.
It holds a phandle to the QSPI boot partition (qspi_boot) for U-Boot
remote system update (RSU) handoff.

Extend the example with a minimal QSPI fixed-partitions node so the
qspi_boot label is defined where rsu-handle is used.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 .../firmware/intel,stratix10-svc.yaml         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
index b42cfa78b28b..5b90058f4f6b 100644
--- a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
+++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
@@ -58,6 +58,12 @@ properties:
   iommus:
     maxItems: 1
 
+  rsu-handle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the QSPI boot partition node (qspi_boot), used by U-Boot
+      during remote system update flow.
+
   fpga-mgr:
     $ref: /schemas/fpga/intel,stratix10-soc-fpga-mgr.yaml
     description: Optional child node for fpga manager to perform fabric configuration.
@@ -94,11 +100,30 @@ examples:
       };
     };
 
+    qspi@0 {
+      compatible = "jedec,spi-nor";
+      reg = <0x0 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        qspi_boot: partition@0 {
+          label = "u-boot";
+          reg = <0x0 0x100000>;
+        };
+      };
+    };
+
     firmware {
       svc {
         compatible = "intel,stratix10-svc";
         method = "smc";
         memory-region = <&service_reserved>;
+        rsu-handle = <&qspi_boot>;
 
         fpga-mgr {
           compatible = "intel,stratix10-soc-fpga-mgr";
-- 
2.43.7

