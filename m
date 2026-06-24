Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0AE32B108;
	Wed, 24 Jun 2026 05:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280614; cv=fail; b=t+9afq/XriQkqG7XoTewIfGYcFL1xYDone4iuPP1jd6Lb8o5pkcAK7K+w0zPQz2BMdkvq32MSpEVnNaH4yh9P1ya0wa89aUNo3MX9X/kIQo65dP+aKktM4SqqN5pUjBuJXY1vn0glBL+B5JhYZ8MMukwrbxzGD3T2ov/buSGQoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280614; c=relaxed/simple;
	bh=E25Nm5Dq+U4N06riGNF8GSsWBS0kRs/6uS3519bxs3k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=M60aWGJfocqGa6x5+tyfXI6LwehFeC7F7fR5cMWHHXXNzUYiQFVn3jdquyyvUjayElETrq+aqBXBkdBjd4Hfx8RP737WOFyJQD0l+7LPTtgPAk9QYlUvrlb/lu+7QbuRurVackqpoLTvo4Np6VT0NWXR1d4VPBtL59oBmec1gpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=dFEriVDQ; arc=fail smtp.client-ip=52.101.61.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="dFEriVDQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESQtQyp+MQeX/o3JTKWF/VXc5y07YkJX/gp9U7fVdBZLpLReC0Sw2c84klxm6+rLM215cGrwGIUIs6Mqyn1eXeaTJEHDMfqrklrGZHJQystHsHIlxkDSX9Dgga1nm0nIGFKNS3UAnxizzgxBEp2P55tF59qDgNxXtzXakF/6DCxDFhHm5kjHg11RiYYtMyYLz/S97GHdz78eD98aNresjdR97ju7PnFZhzfObM2tWK6XVL7s0+T36aCKvwMC1hvDptMy29nJq6F8lZRf3Aq14YWXHwbyta+RF7V42y3XeurOwtzeDMUa86ag5knkKPEBpSQjPZvzzQo1+SggulwlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTDbDvM3QrEC1brlAIyReTXIvV3sO4HUjv71J1dT+ow=;
 b=rmQgek3edlfQQOzv/sY8tc2heRHqYuTKmlZTQrYlTha4ZD+fwICGJeVIpvkRy9yOlYZHaNXuKtzv4Ro1pfEr36LW03bhvKffzc6MQpn8V8NpqiaAQFg8YMIzZI0y3Qm7Iae1n5YqYXE3PqqTHxB/tYGLh+hbRnv4ajwEApgX9E6dsKIgEcvJRfMnAul3iQIvsrrBARRSw4zMVTvxnQxNHtIqAP3cy2ds/znOE0ZWb9FS7pgc9pwUX4zk/HX1RIE4ke8bGGqlKlyJOPekDRqQq+XhaoFOlqTDZ6KG7x6dVW+gBEoKFSDuIQHzaeaouGoCx05bgc4UwRKUrV/hvodWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTDbDvM3QrEC1brlAIyReTXIvV3sO4HUjv71J1dT+ow=;
 b=dFEriVDQY83VUgdg3/G3j501HDi7TihGorgnxccc+V866Q8FrJTFne8SzgMkO8WfqJfVskcrsqntcTyKnGaWC7LkbfSjxg4wuv7BH4CR/Vmel7WUR7v0MHuULabs0RJ75EAEb/7hXmjoVt3bSCZXltoeDU6BpWHQKVmuj4eqNNs8BIC0QR6ttVju/0k5sa2qJMl6/tX6j7VtAf3xashJvoF5No1R5H5Luzle2MLu6HQVeymkGyt/6TimdTl/uU/dv58ToddK89Rvcp+R6RRwgnsDi8MW0BhHHEqfIb5A3GdrE+UPwg9s+bYZOeHqrm4kogWDDyx7CvpDXy7ZT5QnfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by CO1PR03MB5683.namprd03.prod.outlook.com (2603:10b6:303:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 05:56:46 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 05:56:46 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: socfpga: agilex72: Add initial device tree support
Date: Tue, 23 Jun 2026 22:56:42 -0700
Message-ID: <20260624055644.7508-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::9) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|CO1PR03MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e38a87c-7e71-4bbe-1590-08ded1b55fdb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	foECd3j9C1bzMQpPdCiJYJ/qqd17Cu2wASufXwENAXQ/9GxcEshIsxX+h9yEIhIUu6t5q2tkrD6BToHL7VAcLbiwPRd6rZWzmZ3GzDdCsPkIS2gYq2O2vsomabYeMWfDm9eubzjyGVKgDpPJ9vRlIn8SfbVoKBfioeiPri7uTMDR2e4S4v2dQhMFWsiybPXR3EsCsM7zYg2BtF6mDFdYggfsTMt0rp3VDgj0aDSUogH51WaRTLOYs7JriqappgtpiaYBESjO5kj7O2XawJ1YApjgqw+TnyWtQJdV2IKEN9Mw98GLJo+HiFZcvtzBaUaAW40UtzHxl7dzJqPlPJF7AxeWzSSSaTVuabo4LSospeFCakykaRClJFhsm8Lntgddea9wxYlb6GAPdQ4sf0sgYUHrZ9ri8rWjRwHm01wPGTxoA78nJ07/MYdILve3jKoSmUnf2MMLpH4yNxwminxy3TN23ewujvDJLDXSBDeQtFAwtd8B0EBjwMRB/tf+aav5jVx0JizvZq7FM1iEunpqxf8EfF/EC2yK3wXLuXZgu1D57E3K/BalbEPEew0TQ/35CHSIUvIMXEWvaIfy+yeRG1NkhFktIPn5HOhRKLQmZ4urCMTuWOXfFyTEGQOAxsfkcOU7ovGAXF5FAP9gCxEflOo+tWAzoh5kuoFVWUoxz7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o129hRRv3GiUFggDUZNIJNEV2udIo6WGhrvjnklCuGdpncF0Uuw3HxAA5m2g?=
 =?us-ascii?Q?igFgW6Lz/U59CKb0cFoZz3LJ0V9Cgl7SmS4WdypnXHL+35WjLeGvcL4Mjz6Z?=
 =?us-ascii?Q?5NZ5IjwkR20cjqiqOAC8q4mRMFGIf+ZpPy+Jv45SATC05yRNj9xYvyvdL1yv?=
 =?us-ascii?Q?V9y6jYRUZoZehAIp+7UXnaGPQahwSS3QS17wKaj9bkFd1hdO2GH92xtSPXTV?=
 =?us-ascii?Q?zwBqr6ectlavdU/h3klbPCETjGvX5N2ejY3v3odk1LkmEf2odZGVPGA8QznF?=
 =?us-ascii?Q?nHVR3A5UiUEF/g3ZMRwF0hbrKXUDLnZgXAUZOdh74qna5juME2tkJVgs5yFY?=
 =?us-ascii?Q?ExsgRQluGJdRV8xzvH95ar6/kPXEgkl+s/6rHIj09GLMjTYclGvwMvHU8fXq?=
 =?us-ascii?Q?QlgcA+fx6VkCnCplXvjDLINIJIhNuJa+TChN6bWHv9lcUsgF/YUPDNLkxVS/?=
 =?us-ascii?Q?v4r/osa1K0C5Jb8+vKTmG6dAx1P7qa25a4+9QXo/h+vY+/IGE5sG9No3Spbq?=
 =?us-ascii?Q?5O+Gw01kVIzPuDf0F6IOHRtthrjz/rfnAe7D0Tgw921fM62M7MB/9PMzE6yv?=
 =?us-ascii?Q?UtpvbB/q8aMfE8X7UD1UAfM8WWaSg24vRU/5Igegibqtb8CZzSCfBbgZP3Qx?=
 =?us-ascii?Q?8jgUIeRjN4gqt0KGQKzzPmIkkVvvPAoZI1lI+VLAKFZ5j+lwHvvn9AaBL0e1?=
 =?us-ascii?Q?qmOF+n5C0NqULKY5oVmXKLHQB1QRoyedIIf56zEYh3ow+gxx0yOx8lsown9p?=
 =?us-ascii?Q?mBHEiORValT+tF/PvjOG7r6ORFpIOgJHOmBkjkvtBbMe/q4Qmh4AgdTHp4w6?=
 =?us-ascii?Q?e/EvaANDdsjzNkpPGpV3VT+3NPRe9hgnFWPBRYhNcrBknJpUpfnuxKSI59go?=
 =?us-ascii?Q?Il+CyTBIYo3X8Q3bdCAr+R9H0ESwdZJCSrKLoogtlJA4JSCWly5dGllb9GOb?=
 =?us-ascii?Q?190QCSFM20vUl17a8ZH3qnlWsPJeVhKQOQLfeda8N34ngy8ayYY8Gp/Dh++z?=
 =?us-ascii?Q?N5yYG8NyFuQ7whTmbeslmL9wKA3K8QQNhr5sLFqofF4m7n85bI9bbXVAMktY?=
 =?us-ascii?Q?X/ADJKVslqnwTTMw302leDBnD3EdU3qY3Lw7VPTIgeHUUZ3x2sXxiwNsQVM1?=
 =?us-ascii?Q?hirthzR30+apzlzHIyXGSWu74Eep0Of+/6GQDMeZlCYx8H3Js99AxbopXP6j?=
 =?us-ascii?Q?qefTmlHu4bzT+hcAXECFY8w4QEzKm6qf7dJUjOAYNcWlMFnxN/k4cZT1wzP/?=
 =?us-ascii?Q?Id+coQ2FEmkn3tCesF2JN/c/i5jvH2TzxIlNS9FPmLhoHlaVFZV3E8HRIWdT?=
 =?us-ascii?Q?vgg0Jkn8eti7Qu6K6QF9AxxebE70i1Ok/sb+eGftvtquEt8OqltiNP3le0Oc?=
 =?us-ascii?Q?lPfqcXhOZwmIlTXxwAIlFltj2aUn3TGQ9MmrJlMnP9svi+9wLM9CZqhnNNd/?=
 =?us-ascii?Q?GrKoyeRtVcKq8yHpV+66ZL23HjqWPfZJHfMJ0N+xVbhzRsx6EC2g/IJ46wDH?=
 =?us-ascii?Q?KzAYOCrPRIYJO75017XDqhfZt/V+i56dhyvBgwPBtfIvVWHowHbXCSDve4xF?=
 =?us-ascii?Q?aBZTCQE0kHXxoZB9X69KjL8yzYt0toKybLlhE15ET7eZNtqIiCMYTklrEXuR?=
 =?us-ascii?Q?D8JZxwdbDOReypjJ4pUIlcXW41ynbdNRCvGH4iZgk3RAqRlhfugJh/BNjP3a?=
 =?us-ascii?Q?dQEeCaCk8N2HEIPFANXuF4utD3Nnmp8gPxxYl7bPQnDGt4L/oYouzm4OljwW?=
 =?us-ascii?Q?AMbY1Rf8vnUeuJ+j/QoQP1mhO/XDHmVg7lp0kpfL/224uX/VzryMm1COB0rh?=
X-MS-Exchange-AntiSpam-MessageData-1: 63ujnKDkEYhMAA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e38a87c-7e71-4bbe-1590-08ded1b55fdb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 05:56:46.4526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8mb4sRrYCG00//gZr2hP4l16csibXEUrsKI7xIysj2VMrwqMQqoMeqd+d0MuWTh651c8A0ZdKj49HdKwEpijzvCmk91eLDWsCGATzoEq9ZZrh77ltkbivbv2W5S7SeI7TK2cza6fTejAldNXyCQRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5683

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

This series introduces initial device tree support for the Intel
SoCFPGA Agilex72 platform.

The first patch registers the new SoC and board compatible strings in
the DT binding. The second patch adds the SoC DTSI and board DTS with
basic platform nodes.

Changes in v2:
- Rename platform from agilex7-gen2 to agilex72
- Add arm,armv8-timer node (was mistakenly removed in v1); other
  review comments from Shashiko are either addressed or confirmed as false positives
  consistent with existing SoCFPGA platform conventions

Nazim Amirul (2):
  dt-bindings: arm: altera: Add Agilex72 SoCFPGA compatible strings
  arm64: dts: socfpga: agilex72: Add initial device tree

 .../devicetree/bindings/arm/altera.yaml       |   6 +
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../boot/dts/intel/socfpga_agilex72.dtsi      | 128 ++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex72_socdk.dts |  15 ++
 4 files changed, 150 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts

-- 
2.43.7

