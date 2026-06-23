Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1584C37BE83;
	Tue, 23 Jun 2026 11:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213444; cv=fail; b=cLWRXMB90IWyBUhi4Svg3R0QA+w/voontido1mL/GwaQCE6S8lenYU94ZDHXwaWKta27i2SLY4JpS1jEyrRQ8kc/xN8udolDmnTy3YZOv18ubKcJIedDUbbhB+u5ao6WPhYSeuXuLHiB+z/goKc8pDwMDw9kRTJ1Ye4lVZ9IH5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213444; c=relaxed/simple;
	bh=KSI/UrBDvN4EonUsi4VHi+qPRC03x38/wc6dd6aUzvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tFfH+znnQvItZpEM3ot6gRTf0fm5JVuisoWX3JXab3SczDgYtfrHlsFKBRLws6DIRWcvdvtnBlBz0zvsUM+DXjOC4sfZ0Is5ADfTGBDlUzGPDMbSRDhvKGKTWdX93q/6j0PEwPE9pLbMvxkOksSvIvVoF5e5Utu8Lf/hA2aDEzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=T5mWnqVv; arc=fail smtp.client-ip=52.101.52.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="T5mWnqVv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a85t9GsU2ByNluMOy/pyunt+sLOl6GMpeROyfYzJdb8CXwxvi1CfjIb9XsqKTemTEaIMLGJsQMYqtFIvQQ0qXLZK8KlRZTBe+0eaL//LfK9Y2n/8n2JxGeccBhBitr+MQcL7kXqTrn3NPKeW5oNcGri7widUtvACD7WYOL//l0YKm+TiIVP/ypnIJLqd2i+KMY+Heml51yboGAHJB2My2+5/9DBS3R0kw65oQdRl0qmEPuudg6k5MtDqpuXh3TW4/9QJh/T9LfzGtEdXYyyzh3x4x22RJWHX6VUwjcDlArVhX05tokhLhqSyDx5Km/i4uLae2Sj8CeMKODaVcDQ+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWvjzWYZhigNE+ivtcjYQ68XZjr5kxhn92PVS2lbBFU=;
 b=Ofo4Nrh6hn/ZszZw5U3Urw3WXeI1gPClwwEM7dQtaaQI6hBWTKOpu82y7sfd3duDegP59/LEnTpUGNtagpz12idFL+hgXVx1Y8seOMP7frbFrBo+PHn0Tyv6oe5ttHCN5oPUQM75nbSZlwX8irow3FtrUyP4CQsrSNrJMvS8yDzO3sV6SV4oK7rHd+hkDKu/3soAFTqd0ml2JWEpz+/x580Tl3hd9tEWqc6Sd1x1/HWzssDcBBa8okYpW7Vd9A4xhibo1bFJaeb2kgrcuWOg3TjnOsa15jz7g3x02z8Su/a8DhXqqLFfifebE5+hlwOgosvcWARyBxyY1Iw0pNBBjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWvjzWYZhigNE+ivtcjYQ68XZjr5kxhn92PVS2lbBFU=;
 b=T5mWnqVvVMwfRtheYBqpKeTJiY4NmOZlFk96oYZ+P3VjBntNycX4m+CNfpkU3iKni/hVee2MYJhcFwBK908BldYd7CxOdHdA3qiJy+s2Y5CAAIKLyYWQaOJzPRvxLThjZe7rIKOZvH7iaNQiKPIVwuO5ZLkqKBHD+6RH13Y2b8fbh10MMhqLk+3zbEO5ZGlBhQe12O/G2bK51GRJbqGLQTlYGz63f3GbJIhmoN3sDPAO0edrHF8tOxsBmFgeupIPwXkK3YIBNBnlJVxUihevbhUkz1kKuN+WYzlmrc9f1wjcbYxE750dWijxvTpZ1Cu4J4Inc3bTks0dv3rT9RS1fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by MN6PR03MB7670.namprd03.prod.outlook.com (2603:10b6:208:4f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 11:17:19 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 11:17:19 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: altera: Add Agilex7 Gen2 SoCFPGA compatible strings
Date: Tue, 23 Jun 2026 04:17:15 -0700
Message-ID: <20260623111716.16690-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260623111716.16690-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260623111716.16690-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|MN6PR03MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7bf5c4-5f4c-4363-39d5-08ded118fd0a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7t++HlvqvKZD0+vqSnrkKD6GOWbsAYbTSN8B8eAIFxBR8DKvcDW/4NaJzFrjkC0LkALNOEqxiRLisGeshJ35Ys0XY0E+RfKiDzgeaEY/J31fy3cMlLyso5VbAZe6BjANuCrPwHMvxsUnCsdk4PuKI1LaIEhIzJPlSci4UjNnZqM+AkJFD369OTrogDSaS1ewa+bgroxNlBZs+//I1jTsLOcoD1oc6fNEtBroB/kcgZZVI/qFwWbevXx+2nMctzguUfpCLif0DHUgCwKB1LiAH655rAJ234kwO3kmYquEKgf1ZJnRKa/6VgMniNBg0xsSWY731ra1kHx1woDfdcizG6kDsApAorg8LssAHytic+OKQ7Ajdwy6cbbq7JScqV9OuOrVr8Q3yy40qOVJRyf/m9HF1Lw6Eomn2PoQM683wqdAApGGPBghjikdTYCIaeYyAbxxgpFvUOQDPbEjcZOfqcmSnSf0EbEjaltwQ8bLQP/EaS22TG6URp5UeiVnqPCeL1zJj2FAX3qeoM7a53bek+cJCAvQ3fSUdSqi71v8WspnibbH+YhED2R+A/BhMGTikEjt3GoTiS3+1ypFfCx+LVZxOMpZoDLqxg74uDd6xEBBL6CM18TzUDTea5phKp4r8qGHAgy1rRkPm87sho4wWPnl3IiqIA6yTQYPb4eJJNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jaMhCWMQ0vbCqqNdA0lYBGa/8fPCfrN1VfK9mN/26MdAsVki/r4L1SI9z617?=
 =?us-ascii?Q?KKH97aDRaxnrEr7n3lI0C30VB2C+NvETEAZCP+zBJI8IZH8Kb3oKJM5v4GxB?=
 =?us-ascii?Q?k5IJvxijrEKBmNgx/T1OEvhAs2v/lrYlWxlNAnCihQQHmDwenb3O/996gixG?=
 =?us-ascii?Q?pIm6kvT6aUDH7EZTNDAHJqKVH60Tt7IaxX72Bl7F8tKgK0fzRbxOKw2OspVw?=
 =?us-ascii?Q?XXyisVeItJF3Z/MdIZ9jUvlQNTKqqjPK+AQl0tybfx4GXcIULQ4s4ZTxcNkC?=
 =?us-ascii?Q?rvRXnG5XFH3NbSKJ5AM+gLDsUrHCq39upbZOrXBg46cU/FZNdv0crQCrO7UI?=
 =?us-ascii?Q?rejx7OmZbg5bXmGUpiSbgyQUEBotpWSWeJqwOwy+YiT7vSP3hnT78iS4a6NF?=
 =?us-ascii?Q?E71bBQtViRGG80J3v6L6ak3TYUCktuwhUaxLqYLveBsVftqriAi1yOhlhQBU?=
 =?us-ascii?Q?ojNG1UYzCgAXtoFsvwkB2ef4Bl+wkgHx4+SwlClv7miwdZGa3vaNMTST58DR?=
 =?us-ascii?Q?WawDQHqrrJhk4VKUW7TNKyw9BUh5UKV5ugHJ+HaXbguCa5+3OQ9/ZqrTXEeI?=
 =?us-ascii?Q?a2/yfOouebaB11oa9CBGfR4Kqe2D/l/1S9QKRqT6Na4LUFo+je6OFcJ1LL7D?=
 =?us-ascii?Q?cC0Po//3JMnKk30fajgzr6SYKY5BKIORaUCjUPYPOpgLkHTjQE5I+lFAocI5?=
 =?us-ascii?Q?SXiXVU3udStauNRi80QWNuPOg68pnm4kap8F80jdBH7138fkkN4j0dLs6ynI?=
 =?us-ascii?Q?Dq5daqcdzOjAcxHSMJk/KPLEkhsbb48WYUE++RtWiQRIJiYi3yYDAj5BBdV8?=
 =?us-ascii?Q?KDm9QFknyEHqY0uOv0aFxVONVSHC+HX7yDM6M4vksKI7knPyMZywdscwnIDn?=
 =?us-ascii?Q?wKZ1Sw2rKMhHt0DXeRL+piKdZEx2iH2NEwmg55HcrQYXv2DnlbxnR2od+0KY?=
 =?us-ascii?Q?Y8MXNo0S9JJ746iDm5ioPiZHzRgxTroTSKFM3buCe8hWtYVNykV9dQaucUNy?=
 =?us-ascii?Q?rBov6ANK6jLGDioWtq8hRExg7sVPvwYSJ/4XenDx866bg4rUjrK3FDJPjV+2?=
 =?us-ascii?Q?79mja4RGrYGkN5jcyNAKJXHEAbpRhV6M/U3Ku+A9ghfWbmHhESA6Y09+i/FY?=
 =?us-ascii?Q?9hOMIwxNItKBHsDMgmcMbHcGS8X7YLy/ENnNnOajOvknlgHtcddNfTxCdY7n?=
 =?us-ascii?Q?DS78qCeV7EliBBL5SxX+17vYsEuzsgWq6Hxx+KgrXNeuybPcYBgnC1wvQf6F?=
 =?us-ascii?Q?oPGvJD/PQ2hH3t9WvikVGDEOJ3cfG2MDFfNd1fROoQgU1wjT/kFR6pr3GXMV?=
 =?us-ascii?Q?ncwhRvh857icaHcoUqs8A3HWGHEe23tuab9GbsfJ/et/Yo7YvUN5Uiq/Mrva?=
 =?us-ascii?Q?RBEGnDv4qm/1YhPGhSKbX0E1pSV4LyT+CBkDa4uzh7OSb36IM5VBzVwSi4Jn?=
 =?us-ascii?Q?50oM3VPW8SSnuxroruBgI2+FIZScn6UBj2jiSQ2Adp8dzOCRW24bXHIF17Dw?=
 =?us-ascii?Q?eHsyBulR64z2r0dnrnvsT6SkNLdO7R5s2FL9aE5ycduNffa7Hu0P/BMtsFoF?=
 =?us-ascii?Q?cZWdiwt68huzapC8IyIhojzPiwnz5FOMzq9WKG2q5k54nTjFMeXKKeVRw/dR?=
 =?us-ascii?Q?dxUOddrfHmdoFhHrnQK+Xi2qhamHUpwc7/MTBuNAaye7Nlf9waSQDWDnJMHI?=
 =?us-ascii?Q?lQ/LmINLED6TceGx0TMWqqiJoPrQ2+vM3MojiNOz/Cnqbh+5Zxdf6rHT5wum?=
 =?us-ascii?Q?jk4j4JXZiDE8oDitHGL2quf7RL62VBsGm9bokdLxv1saU8LpC/0ozgHZLQLb?=
X-MS-Exchange-AntiSpam-MessageData-1: 07Hl4TKV1fY5Fg==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7bf5c4-5f4c-4363-39d5-08ded118fd0a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 11:17:19.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMsly33i+RaMvcBFfBIMQsY9jyHP52dlbADiJAHouSs2ieNBvrXmARqJhQVuSJEkBokky59bjbh3Dest/ncXjciqY8J2iXaVKzHdT/Gk8IKU6+DHT4uiULLQQyUwWsviT9S35Lwa9vl8vb84l5tL2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7670

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add the SoC and board compatible strings for the Intel SoCFPGA
Agilex7 Gen2 platform.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 4b096e52243e..da32ff31aea0 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -115,6 +115,12 @@ properties:
               - intel,socfpga-agilex5-socdk-nand
           - const: intel,socfpga-agilex5
 
+      - description: Agilex7 Gen2 boards
+        items:
+          - enum:
+              - intel,socfpga-agilex7-gen2-socdk
+          - const: intel,socfpga-agilex7-gen2
+
       - description: Agilex7m boards
         items:
           - enum:
-- 
2.43.7

