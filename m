Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434C41A4FB;
	Thu, 13 Aug 2026 06:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602921; cv=fail; b=YUSn+xIIbmSxtCUF3wt4cqQNcRHRn/4wxpkcXQBbNGcTwIKQmjCFkP815c38UPdAOkxdFyjiONFMNB4mEuW0w/A1PG4rnOdNR8JWItZ0RtAOjmHT6Y/oE2v06qA0N2HJfdYvT3waURunWQlIT01kJGpYhJUfOa80LMeUQJf7boU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602921; c=relaxed/simple;
	bh=6DMO0x+HpuMI1cJbd9vSIFaRHW9fCxCYPbJCfftrbk8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BkkAMuWKVUnewmWKZqW7MtwP/Ktpd/X/F2pRaJhCHGc0Ey+E5nIpryI2idT1AoOee/jFA9DKDd+t2Oj57GymmI/JVccBPxTvEEf2vY00tPGJJIvGSj4a+0a3/TaxgE/by5c9AgPklf3an9vp2a/r8Hx+cYSdETPfQdFSngthniI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=WHNRfsFD; arc=fail smtp.client-ip=40.107.208.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="WHNRfsFD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyAgCCHa0TIXIBLaAtygnulmQDAWsEgmwY1Ys3CL3I3Kd8uMgZWVG1iz89Ry2qYb3KoxWleZYHJAv1f6h8s3D6wfacVnjoUF51lxW/q/l+zFoOYnd3iRg6OdWbOKG/Xhr4qfCtKsviU1b8eWoMNs4CDSVhgsO8/T51dhmkc1GqTBXlXVkH9eSfg5L8q7oPgcX+akABLQ6ks7IVzIBHhz5HKh7IPEioEYmuhwaA799+vwEzr/18X78EJkIoxYwe+U80N09eJmMMzRyq/fkWAJ1IDoIr1wlmI9/6bmuffmhbrBVpgyC2TH5iNDa03d1gzhJKnqCb6i1/Kxw7Fde0GznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQV/dUmD6k14Eh03lzk7uVZIYWMbJYpiAqB8vSrFC4U=;
 b=xQAHYC78w3vTD8w5YjyIsPVW4YcQY357bETuwc9GgZDGCcvr0ptLtL0ZGLc1E7cnZbqizEDKu/n9LyBnbo0KUBUiIh6bvtAv5a3C4ufJvl1J2QrghZ/1So8YOA4s4hOhU/TO+dtZR92xIE7GDaJVWbX4110ChlML4W6x2CWn8Xhex1R8dqwTAlZOII+D2fxZIhSPvM7M51Q+nuZEN07aUe0ZXyKMJqSNZbdqzo/3MxiGa1BuFmtSC6/ZBRmVBb9AyqqzYjmaKZHBSKS4rvi4oNTDHpPEAApq3UezZK3YtzNcZvg/38QjnKnT7cBKMScssVBP5qEKFwRrhIyziQldGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQV/dUmD6k14Eh03lzk7uVZIYWMbJYpiAqB8vSrFC4U=;
 b=WHNRfsFD8rXkj6BX+MAkU5IHIHanyPl7lhA0Np2CajC7mHacmxTWSLH/NZ+bMSa0Vj563qdX7AQG05pGAPeRPB10Yv+F/EoLUvVBshXjrU63NBRBf8Hhs7akEPyyEmEZVaAJ7x2C14xCMWeUIJkMqcAbWkPGnrYrJ1f4nm5Akgvk+l+nj/sTV1/+GufYIUNjdW6Yez+AwFmg4UEJuSLspj1hsutfm4+Uv2dUicXiP3JpvYG7gIxl7O2jWluJkzszfb+b2ntcq33CB0grRo9Zya2JwMn1lZkEU4iZTI3HbzQIffIA7LTpQNKjnmsWn9TpJk17C+dsfRS/h9QiFfIf8w==
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
Subject: [PATCH v3 2/4] dts: stratix10: Add support for SDM mailbox interrupt for Intel Stratix10 SoC FPGA.
Date: Wed, 12 Aug 2026 23:35:08 -0700
Message-ID: <ff7b22a055f317a3157bed922efa1443e4c58910.1786600929.git.tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: aa64ec81-00b5-4db7-55f9-08def9050800
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|10067099003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	knuiZT9Mo0C6x6zAkQAQUU3kq7FKQxVE+MVYK0qmWbyaCpwEF4IlAM8zsPSW7eqdwzHjUSlQvqXKOL2GXTjj1fEqdTLdmrzsHPNo4BS2cfkenBta/UEoyLMacl0I5C/r0He6qPTIdatVNHTR8MH990Tx1ZOHRH/qzR/LGf6BuSO1iqXV5c6jYqZVRXfZEcFEI3WKIFxA11rKYigtzeLPFezzoI59dljqyAR21HOeSgpHtE094uZtSBNcDYIIsx123mvosmYb2fwZPn6erTBFcli0rWqECWlEZUKvmrRD+h4CnZuMvTx7hp58CEVG6l/dMDLKQA9+imXwT8rkYNwyqBTpVqWUWis4Bv++xzgUy6m9+ZK1k/W2S6ZWvGG7m64L/4T48G3o+yAcpaNMdU+Z5DtmaO1ZtN6d+aqqkllRMq/zIGlXXseXvClG1s9g4rGX6Lgqp/Ky5JjFJc/YuLnCydriPhAc6JCRWF/3PBr0iIEgBaX1Sd77M8G7/j3iqGF0yDstVLGT2+XzQHGun7VavmLQQIgU9cFeeESBbO9lZ/fQyjSh2lYX00kZYPv9e1Eld8h9xneyoGLLs1/MGuoyj3FUooszHzuuLbWMeqyK/l/w0Y3cjXZ5AHIPhERBdmDIrMZDBfFmTerPvDxhaNHnmK0a4mHVZT38uI2f2GAjyGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?arPVLcZimze9p+ycRbRB7ZFDnZdQ8DfrqOcrerXjF63tX3xSdmdXfvcBPhNQ?=
 =?us-ascii?Q?hMAEJ05PrRj71+q6iRkHAW0UTTgSFyJaeKEkyUS2iujlwH8ra9ayfANpMpBv?=
 =?us-ascii?Q?X9scXcoOiVtSKDp3baTFufHfLvh1T8kbhct1a1K/yMMaxrrtc2tPUliSgzcv?=
 =?us-ascii?Q?r0AG0y7/7fJpxo3OiENOY2TAJV5mJIQaFt+4ySNaBrJ0fB2A8wav9Jo/GYic?=
 =?us-ascii?Q?x8o60verC7Wl5XJktN5zRc01zjDyQijESIObqWnF2xLfqkJ5bj0IO7wK/ABc?=
 =?us-ascii?Q?XjIRr7Ee+QfR4leUZBePdMBQgWtxkFKbghw4PXR4JJFasu3y9pIRumTJTtEP?=
 =?us-ascii?Q?ydd4uhb4+kZJtoQwVuWPbcMUzorQZHdAj9mrpWrauZUNIax/aALRyOwR+Cdc?=
 =?us-ascii?Q?DVp8Kleq9+NuOBi1Rt4Jq8SZgHMJvesKM3iA13LYywsHTU4GmDHOk3ZtYyMs?=
 =?us-ascii?Q?5Zd1i8WnUh57QMoUvOh2m/JNf15qT1EgCDCFLj2SkZvcUKs3dIYm3E6gMACQ?=
 =?us-ascii?Q?rn9KX0ASB22KdKNe0gQHPhQ8EzfxNENG7GJPTVZbhkBWW/i22CjVQid8WNgX?=
 =?us-ascii?Q?cSj4EHz+wG0LpEQBhsBXjY1Pdfa4JCULiApuhHZaHaZaX91xu0rED4CK+ovb?=
 =?us-ascii?Q?vVIb4KI5pQLZDNieFN8btYMA44eJywFCRvnbNWzz4DGMBUkoTyiEH+2TByYW?=
 =?us-ascii?Q?HtJ0q8MCXxytJ7Av/hYyK270JAatCH5UYwY5apo8ONuMCk+sCsyfZNdtu+z9?=
 =?us-ascii?Q?nuMGh5gBhs6hVEcWTOnS6EfRGpLupMBw/iGM40Ax3cbaj2OH1W2wO+Ztpy4f?=
 =?us-ascii?Q?q+dRpXjb+SmYZ8plwkCpX/+DgBeFrWYxhAQnkd3Ke0oe69pby42oSDHeHGgT?=
 =?us-ascii?Q?wciuT+VuCYQ6B/TkLlHLj/ifeCRYKn621vDFc0439EEe5BaWYjMjzWdcJmx6?=
 =?us-ascii?Q?HFwGY9y8M/bmRswoRPj4T+Xr4yANGKHhaCbBgGp1XX2zm6sGsOqXFPoXg6/Z?=
 =?us-ascii?Q?ruaqDUpK1ZpeXu1pzYAZrQQT7FiaBQczVZf1OPHurhj7ku3zHAKnAbZ3IHWP?=
 =?us-ascii?Q?g6D85cGqDJQbUNdOmRP6+SNysWdbvIvZAoSCmxdjojlY7jQ7irBWdb+ol5bR?=
 =?us-ascii?Q?1KyGjnWj5KbIrrI+FatzwhqPoNYoBxBtOL48uasMr9pLFMuUcG1cMYerZQmp?=
 =?us-ascii?Q?hxOZ4GjucJnA8u+PulGrc3kVbvaYhYJWJmfwNdDBMAajFYofQLw95fzTvQun?=
 =?us-ascii?Q?lcpEfGMO788j4QV52+HcPqTScTa/dD0dxI1QPv1FAgJgbp/Amjl/mSKm9Wex?=
 =?us-ascii?Q?bLQVuqy+NrFGbIsnpq0/iEyepm3jV4Oxnk5DM6KLk0f1bMx9U5Jreo3zsJCN?=
 =?us-ascii?Q?7gTWSwAqBCaQx8ma5sFZ/NH/wlTkqM8mPHonLuZryoFpnA2/SlIIiNKp+QHj?=
 =?us-ascii?Q?TYJn5uE/4P407gAFFJ5hlbug2xh4jrIZlv/UpHj2l8yqdW3Rm1ckwJUyjCEd?=
 =?us-ascii?Q?2fc3KkXkTonSWcuPd3MSp4jMGthK8p2Pi06fdEikakVlMXf/wzbIekvbk/SF?=
 =?us-ascii?Q?ovmSWhsOFjrEB4eNusHyVTVaobpfIFIZHq3W2c9/dMnE17FTyjcH1K3U3Xll?=
 =?us-ascii?Q?t5BF44qHZISVZcwZYFh4wHJV4ZAuVclnr2E970GkgaeDppSfH7BcroW1df6i?=
 =?us-ascii?Q?es8H5KvUUMbez+/tgIDw7kK7tMgiV2LJwo2njHwdocJRTZsuTB2zA6NqIJNe?=
 =?us-ascii?Q?EefqGct6rw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa64ec81-00b5-4db7-55f9-08def9050800
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:35:13.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwxu97eLrBD5fNI1EPKi60KWE0G7kxhHipGRU0M9UFdzr6woIylWNlKxrs+emQZMBN9udUzRBxaV5xwy95pUbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8266

From: Mahesh Rao <mahesh.rao@altera.com>

Add support for Secure Device Manager (SDM) mailbox doorbell interrupt on
Stratix10 SoC FPGA for supporting asynchronous transactions.

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v3:
- Reflow commit message body to ~75 columns (fix Dinh's comment in v2
  review)
- No functional change
- Add Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 0d9cad0c0351..5428b138d0ac 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -1,11 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright Altera Corporation (C) 2015. All rights reserved.
+ * Copyright (C) 2025, Altera Corporation
  */
 
 /dts-v1/;
 #include <dt-bindings/reset/altr,rst-mgr-s10.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stratix10-clock.h>
 
 / {
@@ -74,6 +76,8 @@ svc {
 			compatible = "intel,stratix10-svc";
 			method = "smc";
 			memory-region = <&service_reserved>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&intc>;
 
 			fpga_mgr: fpga-mgr {
 				compatible = "intel,stratix10-soc-fpga-mgr";
-- 
2.43.7

