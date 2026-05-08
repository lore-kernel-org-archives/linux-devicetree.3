Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8793264D2;
	Fri,  8 May 2026 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238124; cv=fail; b=cO8MNNhiSlGwiArpgeqcriHv+jeV3WgVeR4vTas6rmOaTcVZAkNGn37dxp2aPqDrxZg+BeP5dznveQ9hqjIWkwAMcC3AIVToWCa7RRUjgJ24FO/HUmHZ4d700wD8RXOraoGPjfeXrwBGKQQjDxYoIAS7uLYZoeICO82Sp5aOdbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238124; c=relaxed/simple;
	bh=E0BSkQEgJEWFfrtOEkTwwFybMaqEByXBYgc5vZOS6lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a0LO8/S/A2st8rCfkN6ONm3TF/ULPNVXK28LmaDIVZLEwCHYlBxY8avoiKZeJ/At3c8iFvtDINBmzPYrd+zajeqlLbsy2a3tkFohYlCADCt7RAm8vPGQZ/A8Wl1x66AAgzTPF2SdYsIzn1Vl6oTS9Io/geL3d2+DABs6c/+J5Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Pwh0iJp1; arc=fail smtp.client-ip=52.101.62.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Pwh0iJp1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibU1DXls0AiXe9NAlzzQWwQpuYu4fDxj7urFIM8LB3diacW1u37NAwIWvcT9rhHKsGMV5ZFTQSW2UIPw5QDmM2nqPK9pu5gX2ec8Nb/5fFCvyvqAB6UrnYKYdj+4zVhNl9VRY0Wgc1REvZE9XaCRJNTtZHZrpm6C8i0wKeuQuvE/OMoCrl0yllXPYM9Em06NhKUjChgpG0lhtUPXcLokGqvHj9JAuluItWoemL2hmZTxtsiY+rcBBqGDyOBgOxrKqefFwArnshCHwJHDXpXcVMfq4eSXsdpBIO6nKwQ+pbFEjw4kP0XEETS6e26RM0XJiUB9OguEbCea3P3vnCTcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omfon02E9B3cRZLarowi1NS5LKp/NI8lwGoC1Lg5Jec=;
 b=AIHwhjFxgq/Q/ld7QvdgAzl100qTBmhKUjeUXk7CljdvpAKLnKBb4YAl1VtBOx5n6FPBmZEqWLL0FLGDEw7FFvIm3EtB15ZzP5UddklHebc2VcGgS0518vvgespQiJqqlOVLDRdLN1FE8B6X2TpA0lbT1VzuoRkBvTM9z06d9dm2mmC0Iocxwk/BF7m3cyBDl3zYq4RQG61etH54FcftuYnRVrv0kr+7cUS1y2Xowkr3mSOJCEsw0Y5FQJsTiljg7tj5v2Z8WH0p6URtgrpj8giPoruzSMzzKFr6Mz0qHJ0tZzNX6+7tkW2E4DoJ3jKd5/2IH3qIuAEEScQZ93afGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omfon02E9B3cRZLarowi1NS5LKp/NI8lwGoC1Lg5Jec=;
 b=Pwh0iJp1yFhe5UG3ajo0z1hd1N1NVg+txzmmKNE8o0vglf56JgPrboUs48M/irvt4DD4dBNweViJpGmZOSYyFyy1N370ty1xaOt5Mt9Gm1hMc2EivRwY9cPjI9YP9/D12kerpSdOcXVaWBHleLvUtixrgaj/b1GsU5h6ZBrpFm/UmL6lj5BECYlythcqPnpUaQycgUvNYkFzaI6TjAkj0aRxGTqlfCynuDNTFZCcpvB1cl1opyL5/ofwR/ESwq8hjUy+0G0L9Iin6ZbmNGwODuZKa4xQxXt3DlsCDNHhTB5dgVH3AYYxmSIKX8UNUsarwnDwofOTFGLqhIBW861dlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5713.namprd03.prod.outlook.com (2603:10b6:303:6f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.20; Fri, 8 May 2026 11:01:59 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Fri, 8 May 2026
 11:01:59 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 1/2] dt-bindings: altera: add compatible for agilex5 socdk debug daughter card
Date: Fri,  8 May 2026 18:57:47 +0800
Message-ID: <ee029101fc623a716bcc31e040fd1271d8fc3f70.1778237639.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1778237639.git.adrian.ho.yin.ng@altera.com>
References: <cover.1778237639.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3d1eb7-216a-4068-7381-08deacf13a12
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	OUJbSa7m23MQvKS0e8FtwxNxFSaNfhPMThgrYtKn0Ytrxk/I8mPVZzEn7wUtXcBjLOA9HX/C8fselvBSZEXyRE/dG9G9I2JAQ2mM82sJ3/0RYyK58A5b4Y9B0+atFErS2Rs8rxwkHWvt3XGulczIoCk/7kSpQF5hwX+yK7bBxh4Rxvy6XFZsY4IDQIHkq0bYmwgiUZHPM0ZgJkR9G8ofH4hOh7lLuY8YD3MmocDJn92QtQus2uaK6PyoQp8SP4PspAWIauf4S8f+DCCvqHgr9a1sWXH40jbOkt7qmz7VAyFOnIN8GMzhP/cPIdVlotQsqCi5vOyqICjTifoSe6/ortZGqGRTaZAVfNJiPul1qxMEF5mwiXtUF2Pa50adJLuk2eXkjjGNuyWzVxbWJ6PezEtLgaeScEByo4OZifdJmiSerQrm9Cgqw6JgEMmGtF0RWqcLSM2fAgt3NL3KPeCDEN2YnNLSEdxrJrZSlR8tiE8iVhu+CHvrYCw1lIP2O1zAXwq5Qts2xTJlDkhCBAJ7rKJ53s37II9KiA5cHj7n2A3kiYUX0oxPDCm6vZA90zivJywkwJsobB9ATUMVyid011dyqNsEkeQK4Hv41VAriXOdI0P3f6sP0qgkeivdODqsUHnBEzS1AZVdTP+rq7W9Rl+lkA57ZgQiA8zsGPV5zDCmNCeRoEh1KdE+Gj4VVX4d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LYlg/DeG1o5Bjk5FJYrU0oCE5BUAGeWOavgStN2uwoHT9uqUWnbvEVeoWiyn?=
 =?us-ascii?Q?k7XO4ElAwZZgAzBbmrP1qXMA51Hz9dv37RCieA/sMOaLPxwofSq9OPzpW1Kp?=
 =?us-ascii?Q?hihOTwl3vwoNo9k/kLrhFXKp/Wun4Bp+rU3/sWED1GZf73kDXrg5lQgYUN2D?=
 =?us-ascii?Q?BlUzliqOW+gt8GsfhRX/1Ogk/F1u7jxW5pJIBdzIhIdRK7hH1ExSjd11pMkn?=
 =?us-ascii?Q?Az5bv8TUhrQBFv716wt2uoJoYk94NR/4Lo/GF5HqWrKHjeWWUqvmQMGTTkyJ?=
 =?us-ascii?Q?to+kSR5huAUzfTmJemCiaYOUAG94cK+csDiB+Sm3YAfPzxaprJTsFTlQ/Ua8?=
 =?us-ascii?Q?ptigpJgZCSiVu2IwvZilIAVL/erK8/YBAm4hMjKcd9dAEr26XWDzbqVI/HzF?=
 =?us-ascii?Q?Ue+e36hryxM5dMxZ1KLPqfCXXF3R7GkVRjAeSxZO7VWL1O497NDFWxUc7TiB?=
 =?us-ascii?Q?reqxisL++vVrtxz02i3mnM0BtZMnSH1dyoiV+kbl95zoQghhaiXbcnVEf/Dd?=
 =?us-ascii?Q?z+8BiUxqcArs91fVib9Z6GrzyOMK4qomV3dODSGbV42JUli06wi536x04Adj?=
 =?us-ascii?Q?GlxBL3O0S4JAAxymS0HoBf5SfSQzVdjLoN0dnucgCVixH9ei4OodBnRHMbxp?=
 =?us-ascii?Q?umGgPCEbvYhcOH5J2eMO5t1sHqfLTbyKlIH8MSwhHbFK9/jv5/3bIXMBzL92?=
 =?us-ascii?Q?+xwIScUX7n47eT+d5bWKok1XUJ8z3kWh3bnbX9HWY0KBPA2Mp86sA7SjazBJ?=
 =?us-ascii?Q?/1wCP+iGYP+nqX4Nv9fxGJf8u8w5EgAW59/7uOp+Qzb5swpDc2gflQqlOtzp?=
 =?us-ascii?Q?AGZ49m7c4g7MW1+etUarSX7BXbrZ7bFI4NVb4X5rGYSO22JEPRndknpUtp+O?=
 =?us-ascii?Q?7Cvg7SLkdwfVaqT/gF8cXq+9+DrEoLsAGaSLsqhkGWlEycl3Tb013B64N6PR?=
 =?us-ascii?Q?IR4jqMI3XMBkG0cUZhsG7X3SkppNyHy1Qhr5EjN9GyZKBzlFK2lWkoixJdpO?=
 =?us-ascii?Q?daWl7TTPuWOTWv+nVEeaImPsZzHwWLOMBYKTSYoJ485YSKiVaySbiR8eyUvc?=
 =?us-ascii?Q?+4jtiRuX8XOzgTDCdS6szok0rpniZi8Yc8TW+HPoDpMIkzvaVPglgNfmBiu0?=
 =?us-ascii?Q?rZ0YHwOl0blSCrnJbG3ut99FYUrK3Rz5h3y54xfxZuGovWInzcU7djmQCpGL?=
 =?us-ascii?Q?g03hMZmLa51zHv2zrOdfqMEyv1Y+pvCZjG2cGyhipDwRpHYBeJIzzSjM/QcF?=
 =?us-ascii?Q?bSGE5gkAcXwKxeVRK1B3eC530ph+kMJt5zzQVybB+nbzkARJkBXC9eO5oDcN?=
 =?us-ascii?Q?LfxlVWDc0VcKepYs5msoJL77QLDToYN1XXv03OScf+nMB4sliQqwzNCN/hYJ?=
 =?us-ascii?Q?P7ozJGlng8ux/bu+w1hU/HemvYZ8w4eZpaq7Qm2xgPTrvgBk8M5cyr2p9XqT?=
 =?us-ascii?Q?YzBScN3im6rC0bRegcGKQ7/KErxfNBN9YU3ZdhHE5e6R4Ib8CD01nWFmpPf0?=
 =?us-ascii?Q?G7WdHS/M8y5l8HnEO0Er4VjTjhZ1Cz9DgpseR0jo6nS+z6nnHBPt2LK8oos0?=
 =?us-ascii?Q?dyDLlXRpPZZts8YwkHPly6stPMyEMkA+iYTqFLknZPVRDx+5C3f/DckxN7G0?=
 =?us-ascii?Q?1i3+xpS3MNp6oGKroI6X0X9RscFV3439wYZ3bCxqqH9uaQGnp6JGt3ZG+3i4?=
 =?us-ascii?Q?Jbw3w2WZ+aRvvXRxiFjj/yCZyOGeyMUWE+DHkGxBcMr1ioeYzY5twWVej5RE?=
 =?us-ascii?Q?+HZKUHqx3ailB4bDHEcjyeKaR0FHsV4=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3d1eb7-216a-4068-7381-08deacf13a12
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 11:01:59.7885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5/5azrrKbdFkcA47njshwzfhH1Oil2z8zTcZGjcg/baV9aC5wsXfn+dKz4ayiddyXg72s3cAqK2oGh/QF+TnphA6AJshHRmMZ3FzL6pemI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5713

Agilex5 devkit supports a debug daughter card that inherits the
configurations from socdk but disables gpio0 and gmac2 and enables gmac0
and spi0.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 06513895a159..c17e3bf2b077 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -111,6 +111,7 @@ properties:
           - enum:
               - intel,socfpga-agilex5-socdk
               - intel,socfpga-agilex5-socdk-013b
+              - intel,socfpga-agilex5-socdk-debug
               - intel,socfpga-agilex5-socdk-modular
               - intel,socfpga-agilex5-socdk-nand
           - const: intel,socfpga-agilex5
-- 
2.49.GIT

