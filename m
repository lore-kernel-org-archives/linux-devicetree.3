Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2124.outbound.protection.partner.outlook.cn [139.219.17.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA03147987B;
	Thu,  6 Aug 2026 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019185; cv=fail; b=JhZxqvAMFVsiG1CY0ZEQFKt6A2ItDqksldrXHqjyc9W1EcQ1+9izhVKm1oGlzrWX1YOjSkJa8yeFcfT/I8UaM7W1vqHD3jn/4wXCKTd9UoPCdhThS7V7f9bEnOo+BZshl6BysJyAjvgvTcJdNs1PktvHS0SaWbLgNaGcSrUKZnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019185; c=relaxed/simple;
	bh=0M/2QitM/pf/PEdJ69umF0zbL1Bz8lUBq7pMvsOdiWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LrIk3ptGCvpvb89Sn6+Yu4bu5GZQ+aVXAdOSfxbzfIqPEvwnSGjlI6lkCO7iHDhKuBBuaBpqVd7ELHa2y79z6AEpI816mG6NIlUamuqsVBSNmJfEfSRF+d1CHFw1ZkoFSLfLBhBpKwMx3vow1/L9YcSWniWo+bEG6rZLNy6MVJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUuVrKt7rXwkl+Lut2ERS5NzLh5Mpg25lcpp3/Tc0t43Tnqf38eSVNKL7HdxuHex6tC75XPxsTOk5Eb1eub6fkz/YJ/YcZeP5e4go3ynGBLeHedIJViDJLZpCmlCO6dMBFAmtaIjrDxHR6j5yJslgmmXim7TXLY98gj3CDIkt7R5b+svvzHGe8eknY1X4W5ipKvruD+lFZkIwiteIhzGJgFrhoiJdJhx/idiJzlqzgZ10uWX+L4Ob4H32hNP5ZD+C6Z76rSsueb/W9hS7cOt+mAPh/9H2NFU+1jvhAQgq98vLhtlWxGqQx9gFq5CCovhYbYZ6XCfk4D0z6GK/hMvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+/XgJIKTamJ+Kz1EPT8TnbTNEw0v9ptu4RUyBpb40s=;
 b=e+8QlYT132aRZfXyIQGum0UAPMSVHqmjDfVLxPErUTmkcd2pBgVTL7hoFmD8FoOHZ7/VDq9pAMgsA6AGht94NxBVVUG2NiO1YOxzjaQQYXvr7OOzNZebpU7PCVhEJNuytHJhJp3wAny7hOxwFlnz2BYTI6a6k4MRyaN0NSSy1CbgmeGNWihifX6C1d27fiGRPlqt3SzHdWvJC/9bHJAUQtxidby+iLJdMI44D6ErPK9rodw2y+EXAFRry/2q2yWKoxoB/yqBBCFTBK56ezaU5Zl2hhCfFMVM/wSag9u66BVaYABh038rDgMAakWGclwfaI7rGOsy7IEFlHlhNQIFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5) by ZQ0PR01MB1207.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:26:05 +0000
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 ([fe80::63d1:b688:cab7:50cb]) by
 ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn ([fe80::63d1:b688:cab7:50cb%4])
 with mapi id 15.21.0292.019; Thu, 6 Aug 2026 12:26:05 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Yixun Lan <dlan@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Guodong Xu <guodong@riscstar.com>,
	Michal Simek <michal.simek@amd.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>,
	Icenowy Zheng <uwu@icenowy.me>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 2/5] dt-bindings: interrupt-controller: Add StarFive JHB100 plic
Date: Thu,  6 Aug 2026 05:25:50 -0700
Message-Id: <20260806122553.182449-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::18) To ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1208:EE_|ZQ0PR01MB1207:EE_
X-MS-Office365-Filtering-Correlation-Id: 29bb3d3d-1e55-4110-a5c2-08def3b5e2c1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|52116014|56012099006|10067099003|6133799003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	c9dhXEQ+av8bXk5hMYO6dzXtMbIyXSvI52+jCN4eixBMi73gZeJ/mNtBsXMEsNy3X95f7I7ifRCAYIpKoj8LCKNQSCZv618J2ZKrkaPFGUedj//Ovy55ZJ311uHvTlpKP4ukow2kZN0LHiEcxM0MVKkhpkt8qR+uGJbRktedJyoFPNmlc2SYiN4xvFfA2w/E5qqCHau+HGbrxDpALpmjekW1ba0sDj/L2Usf7vP1NIAd4hXWXkBgjkN4EQOXKROiW0DuJu3Ed7NWExOz4LmapkEnthBvQcseoK7Jufzas1QjVDgk4uLO+Snb6RGAdkjP7qVBFNMfahhp4PnvPUqyJkSeVHRvrrzIr2XQ9mj6ldgSLmF8LfM5/A/dt7geF8A1dZB/nBVTQsxZfsL1uc9lxYGPW38cQ0oWS0BDN8KwXPw/VhzBjv9QOUadrMI2Ac1eNCQ85FREd3RFBmOoMtBJ/xcpO8BQ7zwWct/gvzgiQdKAt1kUgkoil34qGHg4CJc3fgZhdAjvPyryYEjQztr8b/XkBVhJHXZ3qalOd8RNvjMm9iLcEKz/fRFpHNKKEkVpzGomnopIoENrDyHdhTwyFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(52116014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TKcOfoOBZDH3bV359gTlyCxd2Nv0IQKdIxSmTDgGX6auqAdo3g8AJZHd7Rq9?=
 =?us-ascii?Q?DFafRLW5Ssv7Yl4qBqtNa5f+FdGaaqgbdBswum+o+P+W+tjkm6nMSxQJgaeK?=
 =?us-ascii?Q?0ywQV0XPAm6rpKGTfWa5clxIDLMDMD8/YhNoJuea0yMt/O9WpJt6h7N/9GCA?=
 =?us-ascii?Q?P3IBVaJ9yokIp1zvv8APlw7c+yRnpJGo/KNKc68IangM4bGGsmwAuAxVw4Co?=
 =?us-ascii?Q?y2Kwp3+Q1e4J3s/3IgrsNiPZPURh9CJv9q0Wg3Xdj34pmdsuK6gg1tchfVvs?=
 =?us-ascii?Q?khERKkH89Fh28syQJ/Eq8fY2ZkGorGlr90qebaYJGeilmwXs2nozY7DQbppN?=
 =?us-ascii?Q?0Ydq1SaXdczCG/NdV3iEKv6VDPAQfh1+Lwbl5VSzowE3jEBISclxCve52LJN?=
 =?us-ascii?Q?TmdksChb/CnxYMxLQnQUEh9ZEzp/pQWldwS2VRoWFiyILwC6/Y9Q63+gbKpO?=
 =?us-ascii?Q?lzkpMV65KY5jhhOfiM7fipJWy3qHi4Jmk3oSdU34UTZvIm0O58Xs05TDYqbb?=
 =?us-ascii?Q?jnBf43vhLE6TO5zxZodnpjfYtecQOMRQWH8YmWcuspna/FVS5da95/ucgDO/?=
 =?us-ascii?Q?uWB4Ss7Ab8l/fkd8m4BBovo3c0rfwvNgtB8bThIz+zKWIno5kmlBcYhotNq9?=
 =?us-ascii?Q?l7250cXRNP+V1tAZKyNLDLEYAjjKHPpAjLBEerIw7p9L75LZcxY0vXCx3oCo?=
 =?us-ascii?Q?v10ynKcC4h0B7KqY096jl007lyBlI/NS+fX/7MuwIX04b7M3FpHxUaP1qHTm?=
 =?us-ascii?Q?RXc+K4dLNGshWCa7t7Lp1kTsINWVNEvX/twsScMR3gMxp5MAnrAXVFrEiXSo?=
 =?us-ascii?Q?Fl+mrcKJGxkjSfdNhwAaL/F0mI3AfWbV80F89EUawwtNiIJrwAyGUh38xiHA?=
 =?us-ascii?Q?wmzsS8Qngrkt+p32TAv8xQWTmZb/BHw79f4XiOItjY/hMQthrtQ1LoSlnM8g?=
 =?us-ascii?Q?cqAwsE4yd8DtL0lhkB4t3WcfEp6Q9l1qgI2YhYN01djsIaO/9a2lSTTfSO+J?=
 =?us-ascii?Q?KIRXhiE6jGp/wbjknzh/7uV1n77Jn8K427kOFo8PnppDL6UhgZzERsr6OtCb?=
 =?us-ascii?Q?3EPKdYzolzt9Qq/zXmIdpgr3AsyVF6Xa4/ikvgZd/ke6tAU6oGY+l+obNUaa?=
 =?us-ascii?Q?jMCKnqcWYl3JFPHFFB6uJHyRgvCNhKhOkG+JV/67NQxxjow39zdZ5K/p62O8?=
 =?us-ascii?Q?RGZxp4kp6P9Ev4jH7IVR3Geb+oB9DU6Hs8VfjjYZTTvYHKSGgfeqKka9m60X?=
 =?us-ascii?Q?a1jHc4bzlCeO95RrgedT1SS3C8GtsAcGv26bL/naFBHSkrDMlee/Vf8lbW6z?=
 =?us-ascii?Q?52GNhx/vMKSh/gVTXiGdPvBqGgHVBXJ+wvboRm42jVOZkAx9pVQQZuOlE8y2?=
 =?us-ascii?Q?iomlYIOic3j0S+dNmIHG94FtqF6FYS1BfcEi1tpsvRP9kbGB+sRAbckUluf5?=
 =?us-ascii?Q?mPDPVVoeCrUf1hJDAdgt9bFe6h9Kn76FG+SYMyhsr/ufIAU720ODsNngKcij?=
 =?us-ascii?Q?lBJIRcTGGgB2IGtVTjt8rciasw+Drt0uOVdY24lu77ylgT7IgGmV48Fs2mWU?=
 =?us-ascii?Q?wOYXvcZp5jWTQxD+3q92QUfMw2wU4xOngnmyHCts8hhzhOiblB6YTkyo3T9+?=
 =?us-ascii?Q?7h6FvWmHGMfIthCDO2Hhxt1Q/LiJ7Un/ZTWgEoWyM/HYJmoiJew8oXnSZwBg?=
 =?us-ascii?Q?CNjqAmK0m6r8SF4nyDSzPAEuQEmg8clc5izIbxbx4SMKtRWp26g58QArKKBh?=
 =?us-ascii?Q?kug6VuWvSR6m18sxtIhkWbQc79Ha2vbSES22kw+mS7+4R/5EEBw8?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bb3d3d-1e55-4110-a5c2-08def3b5e2c1
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:26:05.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPeN8IQsQANk81S8PbBze/n+Wwgx/XN7ScVR1kBFZ/hbk5B62Sfl8APXQcT6zoIgER/9JBnFktnMPbqREgb+GZ4t2HPLJ1V4sW1f0dIJ0wV2lxSzLXVgW9X9P/EQbyO6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1207

From: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Add compatible string for StarFive JHB100 plic.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 78d8cd77b4ec..cde4bb691897 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -66,6 +66,7 @@ properties:
               - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
+              - starfive,jhb100-plic
               - tenstorrent,blackhole-plic
           - const: sifive,plic-1.0.0
       - items:
-- 
2.25.1

