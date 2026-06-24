Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5627932B10B;
	Wed, 24 Jun 2026 05:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280612; cv=fail; b=DhSiMhWe9mTwJXkYUz14P+TxBMwQkZpu1XfkfYEumP5n0mcNA0PKBhd6W0Urr+1iSKU/xkBKmjTUhxMQQI00jVIcLFTQ9fNl5rr3+/dYdB66kVpQTWL9kUSLFDeqP4V7kkC3dv41o6ZTL6vCv8bBbC7lqOegzGynU7I2eHjSDpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280612; c=relaxed/simple;
	bh=GtZuMqxh/UuLTT4Zp9Q0ZgJ/Dysd7vmDJlDFlEfmDwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jizrxRYygwqkwsm5o9dAGalCVNwEb/0hws9VRm7RkYTGKpnfkQ+Jk0opsB6SbymwGcGMBOhcETGdnyXPHXFaGQAMB4Cu4zvLYRxbfs+UxyDkp1n1WGSCLA1yTTYchNBYxnpgRjk6moqKwtInwsQGgt95PYqgRVqa1P0FZP3ib9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=SacAI9Ol; arc=fail smtp.client-ip=52.101.61.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="SacAI9Ol"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gd+sXw9eQnla5QlOBBb5iycxVAs9RY+7SqPMQiTvIHTaLeYq2RcqIRVmdb4RyQbDKjS3+YU6gzSezogorntBhcAH+IzDnuQeW9+hx12qJq1z2fdVKyDviOtjMyqMh4fiQ6B/mn7oRxPvbFp/IHxFYmGl3NXhiEPY8rxmWxTPcxLUoLgQIMm36tz6t4WUF9I19ggtyRC6tEOirZ7Q4WRj62BG1fqPmiXF3EKYuVtJ9nnurdNgkC9SezBDzZPZH3vzkr/8zvVX4Ni3Qh3JQ7JM5Z97GjXL7DYR3amU76KUkXnVKZnxs/myLRhrQS5tInCoXpLvU+GLFqnSzQwwWu1i2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnQS4ABNht/giwCwwC/C3jvG9ffn35ASlh48LlPa7DA=;
 b=w+niE1W5vQN15B08uiXbrTglO4gPsB6UDazhvUN7UY0y9dk5DVu2zrDaKWKQJof3Vf832YS+icYR30dniFkbt/Qp0owFN9MirQyz1cos7UrqpyCHRmenyHwnypJ0aV1beOHMZQagBNGnNI+udpKqi5IAJLnCDsnhwSPtpStBoiDGDNsarsgZ0AL4B5FDEx7JAdAUTBEEL50dhwF0vMLVWgDrEGK6EkwCvKOZIKD0+Q6QwT4BPBkcCwesH3AzYT5qT5sPUdzVRDWQLQXWK7aHPjWGIH0ZgBNAXFg89t3+RjKovmzExZ5OdoBeIsNIUkF5oF2nc0PL3NozqqQb+7dgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnQS4ABNht/giwCwwC/C3jvG9ffn35ASlh48LlPa7DA=;
 b=SacAI9Ol4+Labq4IvZZo3hajxw2kgPnopkSJR33lO2mykVmisuXvQKCSWG21qj4kINF6/c8iVTQEfbLJubeW1KE0qjt2OGz1VdDOrfuBb56wljvCQzDw861iTymx9WrVWnKicuAHSeBGEDYAvdnL7vI5fTYng1hKsp+girhYPXvH9jQQ/ZlerEB0acx3yIX6YJz5E5bb68c6GsaZZdyE5ncIe6S1VBKwoJD+a1DAtP2nlWVPcNz7Ie1paqbbsVAqLQe6V83K/FHN0rXcKY0EKG7zfuxS0+aCzUqFEqOkiVTcST+vJuUIkx7IqZJJYIjx5/TZzP11uENCj4+/CYvQKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by CO1PR03MB5683.namprd03.prod.outlook.com (2603:10b6:303:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 05:56:47 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 05:56:47 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: altera: Add Agilex72 SoCFPGA compatible strings
Date: Tue, 23 Jun 2026 22:56:43 -0700
Message-ID: <20260624055644.7508-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260624055644.7508-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260624055644.7508-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1009147a-4624-465d-4619-08ded1b5603f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	pd9luMMZGGNBjfnwM6gUz/S+xQtJIAAG53qzpcE9fl5KZF6d1wN5yeZv2U4UyY+7EO0snioGssBHiVtU3/Ucn+HH24iF8BoSmR6Fl0f51fJUXIipzXDRIVKSBDGF5kxePlZJabPKrvbnWEAWoudJPJhCjZx8AODiQ6AvJKgrNx+fbNSWFfO1sDusYUmYHAwuxsEKolpuW84WOcSgX3uzeEujc4g4luJgxf75jrTI4LLu8HrObKciZBv1/4di7of1CWco7/0QtHH5wY7yVvOIHnOs+4vHIlWWaPoqwNNsrkhOoGhlOi3TMuXP0w8PJXCrj8QNS7owQUbfirC8G9lIAfNf6spSODuTjonGtfdRUDts8vxUDpDJNwH1pVB83FvOVoC1+x1+FHImPQxtf/yls1fHHrpimHXIGYUGv2sSW+hhA3CBnIOD0pNTBL8QM3bwKhyaF/KiZ0n9oMofc07LGFFzaXrIHo4I9jjDS+SZSUHE7QbAHeOL8nmwk5AJFYcQuWDebzJKWpLtT+3P5VcaWdjoDtmUBNMazYV1aqTXKT02Ue4N/6/uRNozESYF0vWOFtl0lx2dUVXtgRG7AwFkrqOCDbXblnwJ/cFFjg6ku8Pe3uGXuF2m/0CzZtKr1RNxFpv9IgJ7deM/VQc77FehFljWd2Vr7LUcwfYFz2xBdpo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pNdE/lNxwlecnL30bGZtuqPyZfoLTVtGNsseQF9BSK009X0plUweDjX4PttJ?=
 =?us-ascii?Q?V9PjC87w289GMP7eA5pktcXJ77iFWbW1P1nIHNQTpNza3KWPgbjl48+hqVZb?=
 =?us-ascii?Q?hqG4805e4rcjtlsj8h7/fIJyZ2+2b8Bwi1/xu/94mpVRNkeGNz8Oa1Rfha4V?=
 =?us-ascii?Q?io5erEywZJNmhOmII/MfKE0wxPshh/1HFw8W7MsxbZ40h1SooALi5sDiPiKD?=
 =?us-ascii?Q?3XnKvSRelNE6FKxelwW9kO4AZUay4sy4qk0h2bQ1mcW8AWjKcBdi1VEKOqBq?=
 =?us-ascii?Q?4XdBQXyUOA9Vu6yGDVnW0qUscM3hKBHwX9NQ9ERQDdbkQlWIqekrEwLHJq4W?=
 =?us-ascii?Q?4c8yIjr8QW6ILTuAM+z/uTr51D28ggxYyJftGYxLcn83yb2rAczreLMUR5Bg?=
 =?us-ascii?Q?LVQ+AiihgjCY0wvb81dnVLrjr/78dHKdKXyIw4FMJUCc/dp8GxU08sNrLfc4?=
 =?us-ascii?Q?SMTlC29ufh6zluMVms4YJNaEWcmBUAa+LIrOH+H9qu/0dmSZz8PXFzTGjUjn?=
 =?us-ascii?Q?SI97NuV8kwlLbS3e5NvEY404Ed4yJPMUw07HkuVM/YAokQ/mMOn7kRvuDf4o?=
 =?us-ascii?Q?1svbQGTd0d3u0EAuS9Iv+eIYDJ6CT3g/RO76ChqrCt7/KObWl+qIUFDkEyZ9?=
 =?us-ascii?Q?uN/oWGNd60pdAYCIYb033OF1ONv0MbK0+6v7G1lKvu87OnflIkURJQt3B4+z?=
 =?us-ascii?Q?QsN3TtuWJTa7ey7IgHgMMAV9DFcoPAL55ckHXllOZlI9W3NMH+R4R2rW2ESE?=
 =?us-ascii?Q?mXTpBAQIOZRjCoFTnM1RA6VACnRfU93GUuHXwCtfw1jfX/gx7YlJpiR9N/wB?=
 =?us-ascii?Q?6PKGxYx2Hx5pe5rGf4POIMyYxXYfs7n0lQR4rieCGfzeFV0741IR0No37rhk?=
 =?us-ascii?Q?MVVP4I+pQXPwqUvSJPBXV1nf0LvxcDCFv+ip56HcpkJPlXEi+MzKpqKAyLjC?=
 =?us-ascii?Q?E5cMIzsd3T7AOnIqV8QeOYhGGvW9Gw7gyte2ALbBPbWMlVCCQK6Rj6rEOTCG?=
 =?us-ascii?Q?Avplxey9iOXSwnDw0E1MvFqRmk2Q6YSTct4D83cm7u+0t405udHR0VsXkVNV?=
 =?us-ascii?Q?L/HZMm9gtqhLoHHf7y9y/um2ihaqS1iA7WaTtgZ1eUbCLM2EYyHIFFpX2C0M?=
 =?us-ascii?Q?BC37IeIPz6BjseNI5mZcR9EY8EjvODfydtcjhYjfaizz1J+fOOx7GQqvNnuB?=
 =?us-ascii?Q?6kvPZecRTrmrTFr3NYTEYw5LrLnSYOyrbSrQJIPELcntqKqBCiFeoLQSPiJB?=
 =?us-ascii?Q?4MTZxijAaHlMp1TXZ2TUdZ4emzMM0Mf8oh6+DybHoUzpZ1/Uaegm0M8juGTw?=
 =?us-ascii?Q?5BZa/peQ5kUA6X0Ljo2VwMMbRnN2BeI/g9Ft42eEHr+QeFX5bvEClLWlUod0?=
 =?us-ascii?Q?QgZM1Lc18KmmnKEEkxnHTsLJFbKrErV9ltHPH3JpV4pFX+mtIEKDgWE1zTft?=
 =?us-ascii?Q?dEQ/hFNDPIGv3dbPqCRVvcpL53ePOLbxweEmxNHl6M9iG8C9PhGwijxKUcS0?=
 =?us-ascii?Q?FNhac9W7gr/gh4HZneCZ1GUiKN9gShjmhFdkNPhEJK53BWIXubDMLO5gSM2+?=
 =?us-ascii?Q?luXRX5xLMN/FYjxkIH/EAazqSAm8oO0Lfs08uX9dFUSSRgkhLNLU/MuSGwxK?=
 =?us-ascii?Q?oC1DCb2F92RB0ZVzlr0NcdFtfiOfX/ru5RLF+fc72eAcmdzlCeXrh8zyQAw8?=
 =?us-ascii?Q?oFDrclMQ9GgDkk8k+BNeIKd4v9a14of6dMjBH4O0g7DeayzLh+MvMXzbw9u1?=
 =?us-ascii?Q?qF0T7kJMmbKHLSnKqHfcP+zkWaHNwh1fySt6ydwtkMpZjAcwe8zqAb/EqsmQ?=
X-MS-Exchange-AntiSpam-MessageData-1: I58oQM+CObaQlA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1009147a-4624-465d-4619-08ded1b5603f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 05:56:46.8910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twE8CvghCP7Es584EpJHAaCGW2KB5IIKBSNUYuTbUh3vEljy/pV8In2HzTEoVCkVAHZxG/GpOrpgQUACqnE3cpHtK7ZkHKz0BZNV1WmoKZCxv67bXSwQoWrKHKYtcZxZwUcQBnMfjn9O5VhkamfmZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5683

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add the SoC and board compatible strings for the Intel SoCFPGA
Agilex72 platform.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v2:
- Rename platform from agilex7-gen2 to agilex72
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

