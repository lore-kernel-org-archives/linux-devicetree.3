Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960D239D6E8;
	Fri, 22 May 2026 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779439119; cv=fail; b=sfL3xlNFw1P8BRo4S89C81uLDGCBRRDezvu9n6Kzc0vT4of0sRwcgOxQ0yd9vbpMrBrntPtvV+0GXICXHI5psEUUb2Mggy0X3NFX3eKHO6aTN5mjkv7QNF29hr3GO5d8gmGtYDuDa25cZQCPmZ2SKvHjDAvl7iwBGEG7aPNobsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779439119; c=relaxed/simple;
	bh=y4XXC3ypnAjxrA2I0LESKrmFY1W21YJv/EQsNfLl0ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bqf7GrNIqUA7R14ju+i5mauDLC1K6UHHxdadyYoo0RTUMVRFTw/7CBVS8117DMf1oP3L8KuPF0sZTBtVq2hijewaCL/GEfGDWc61lmY5PGRV3hjQ3t+88qwcSCh5o8gq+eexzPbdogXUhoIpU31v+lg5TC0sxGl5f5cCHdHhCKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=oQGLZGlN; arc=fail smtp.client-ip=52.101.62.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="oQGLZGlN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiXIGP6awluQIiWJ1y4EzMZmHz+D38fYVklotv6+HCCPL6mqaJTaqWmk76bH4k+TEMoGDDur3bGlvxOHjY8A3JR3qi0xFIs2yT6wO20tzpBjveuueOp7rxiloem9PiG3TSwmQipU9HoLoPYdMdBy5nIMZW8lXgbo87SvUV4tTEXdafJw+5qJr48BtWoQzehyqN41ekVKOcwgAf87+s+HdbJxFRFMwz0BFjQY4Za4C/vQZlCl7O2qcjm6/+JV4R0IaMtTUJo8w50J0ZdM88/O6SeytxYqwepucv4VwRKsXddqlDYdQf3d2Xopm5oW8e1pRKD8c4TWu6aY0VwUduh8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAnxQGBKpsRI5AdKQWLR6nd5hUhL4Uxqk08XrnYXzj0=;
 b=grCk1yY+Su1ZWRyxuggiVHBcPJ55X2rC5BIOO6dzb0uLjxT9p+I4HXrf3/2bFjOdoWmMIMK7+qc3eCTEuEQe55HoHsIP8vCdUbHPX0zCUB4hMXdKJNNaJTPm2LWLWQdqlvLVvgmrbWVhuIqRQQF8v4tNAwv8QIomS7wXp2qTsDe5Wjffeq7vheAW1S6U6fNg+44oSnSijQ559X0fMnBb96yPIqTOzf4H9zXaqAr8z9fgpZvaiYgQepWLDiMEK5TJwewYXsaKalQc1FSuoGXxBhoilzWzi83peE2GPDgD6DtoEGR1r8xuOQi3tMpojs0ksNzMDz/6iiYXWYwmwKi+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAnxQGBKpsRI5AdKQWLR6nd5hUhL4Uxqk08XrnYXzj0=;
 b=oQGLZGlN03zqtQcKt38h2BVrxMeeuTJTxunL7MYXA/pK9vBo+Pd3Hj14gdJekjs2unshcCAShym0JBIbDsFw4R/q6lH60tvhFK5t53jItqPXduR7Bv0ameADLc/pC5j9n53aNIKKHIRvLu+M+1JHZfFARrsbEYESuktjg3iRed9+f4r2V6ErG+r4dos/a/1qoOfX3yPIPtLTYUcemtAJZFeRUoUW9zk1FCkfOaSKJVGitOJzOiEewhAPeduC9tyL3wRkHwBlWwV8cRDoazTbxhOTI23pH/0oTtBzOTX8orDzuQUhyES/bgTxL8Wn08bLiwU5bE+T9u2E15Yy+QJbHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM6PR03MB5052.namprd03.prod.outlook.com (2603:10b6:5:1f2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Fri, 22 May 2026 08:38:35 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 08:38:35 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: altera: add compatible for agilex5 socdk debug daughter card
Date: Fri, 22 May 2026 16:33:59 +0800
Message-ID: <235cef16def537582a3de3f2e98690ca253b8c0e.1779438754.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1779438754.git.adrian.ho.yin.ng@altera.com>
References: <cover.1779438754.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM6PR03MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c8fe62-16f1-40a2-2e4e-08deb7dd8372
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|55112099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	QtJ378qMSg4um+1eytjSV2Nxn9hdN09rfWFlAymZb50oK6fYs0cwqxa+4l5+REeVLGIZBOKz8AwMJ9MdviS+ygN1K2jUEO3Wft4Av7p8mAs2m3VlSIOnyIcrJrHCRdWT+D1vcPPcQkHoiU2sj60SKvobr4dnpGG2oJLvRJYh5bpxVt2Lywc4Y3TcEqW1fLmPjKE56DomQlcL8UwqP2mKTz6rP0478Mwx3Ur1l1qMYGmPfhrvdHY2vywD2aUW52YC9JDtqOE1BILdseQ/h9u5OGFu98nGI+M9rux8B7++NkglGbqd1eD93bm9wz5qo0MwFu9VenrghWDCOIlQbXdn88mYO3YIJQazmWpGPug7c22X8U4fJlXMGlXzb7F98mksV5AeCa+/eIeIy/yBJw+Gc8AxpYddEzUnP5lMyNTqiLJ3XmDhjZcIMxdmJuHz78QkxYjkllaRiS//+N6tCo70wA/AeiIMi/trwLi9SuSJHCjkO3n5+DVBtqd5CQZdxz4aQq6JXZyCcYP7IXv2zhc2el7uIebp5DGgYvB+/PR8B1mgwo0BBsjNqLm3xnmc4jF0Wz5MUbbHjrfVZEF+QmMo6WP0zaygnCrekZtskYX3eMrGnBcezoI6ojFg2fBIwIDO0FA+2JS3Xk/ijxfRg2cpr92OwgMDUvM5cwlLjT0dK8ffiOdFp0X9GUL7m8dPJrPg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(55112099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KuR3mT0Sur8KFC1sjajjUd8slsaRo/BvrHMsqCkQccYNv8RQso4a8mRJT4bX?=
 =?us-ascii?Q?0PGF2fT78zeHc3KpCJ3HwlihUaY6uupCHbUm0LOmVEXFnNydgXf2uKBC/Ig5?=
 =?us-ascii?Q?0Ybu/iFwDZkE+UKqscAqhV4a0v3z99PuyzWlsIrHGgctbHE+04uQyMGvVEXO?=
 =?us-ascii?Q?rJARYy+CoE9sh+GUEgu/er1Lk35W6nFv3N6VurTSgSpn+ExJOBMxKc8FD9ur?=
 =?us-ascii?Q?kEcu7foshiKQtGVK1W+H8ghYpHNIX/0lpbXs2dA31rVBdWRAHCNgvlPIbtq2?=
 =?us-ascii?Q?IHBxJMThs4vI4muKN2vc9L5tTF0sVysajbUJrcx6N7A5A6nUEFUTxVJ5yHPM?=
 =?us-ascii?Q?QxEEr53F64t1ojQxr04el+UF9wx5GEd+UhBEqUadZh6KOzkIcNaUh3HiCXpL?=
 =?us-ascii?Q?B9gm9X6fez5xbBi4kEb8k0Ls6kHkBMG4vjZQ6pOWTPV+O4h8aw63KOFduZsQ?=
 =?us-ascii?Q?pk2LZfXGWYXQoH2awrsQirZZ9alvoKRpoCgPUcibwbFlVUFhPG+Q0u1RQ51O?=
 =?us-ascii?Q?pM7w3CNlMl8/7lJ7qnwBWNdb9Mj2Y6ENOLfRbxMz2b/oRICBgo8k4WGjbXro?=
 =?us-ascii?Q?PYHz5NMPnRZY9iYETMTtCCzd09hrkgnqywGjf+/WrUyGybx0QRkNcAcnKBfC?=
 =?us-ascii?Q?PhhlqWhFnYdcbB4Tg5We+4bGzgtjTyj1nmyO2fuEt0sJ3wEL1lOnFqYGovXX?=
 =?us-ascii?Q?YnPio5qO/V1cTqbmZdmQL7ZUjm9W1h+JZegK59CgMrKLnEevKivppNKF3cZm?=
 =?us-ascii?Q?UAiONvlX6ykqGJt3ULBRXQWYSx8c2MbVh/pK4TnIGPA+AisquK8wacBjarLv?=
 =?us-ascii?Q?9r1T/V9ARZDKo40LfImSbRwkG622UWASY+WtFX/gJkdZu6Dj26vMvnBPwN+d?=
 =?us-ascii?Q?rpnn0ajMQ9WTxfyLqfvXxttKZoqMIC1J2a8KFJMt7OgIO++31L7Nq/CPFjyC?=
 =?us-ascii?Q?2HzRqSbtql5Efp/sc3danikQB1zKNj7PKm+4im73N9J1+KmFmx22sO3LYcBC?=
 =?us-ascii?Q?m/ZrmBEhLfpboZ2l/ifGX22M9Jrv8xZApAHU67RdlRNIx+b93tvOU6wSnrDG?=
 =?us-ascii?Q?LBqXTtDA8LNmK7Azmee6IQCRCxi+Sfp+zrGFmljNhMxKrKJyOHzI6X2tV/CH?=
 =?us-ascii?Q?TIpWzGuS94lPKCuvufborH8TCOBQ0o1/1gOnsEAbyU08ig5FhFqUcNt7xEYK?=
 =?us-ascii?Q?z+cS1nGE53OBs83ot9HJUo49bPc+BafnKt/hs3ArrZy5qwINuOhfKa2LV8qT?=
 =?us-ascii?Q?0Z1TRfFGmOHD5CpiOvA98PUfZX8Lz9P6JUQyM5rub7aa5yAeY86BlCM6MEzI?=
 =?us-ascii?Q?Msdn/pV9VTxuNwVPhO656Byyh4ma+JmTiUW3RaeyR7/YNFISy28waOoHmrYM?=
 =?us-ascii?Q?ExXpQYKlf72tY0uSDUguqUkjLqnbg6WpcaXgsbKTvdS94tjCVxL/FTB7yBVx?=
 =?us-ascii?Q?Z/7g+RNygvUglZ1ZCuuM62QNKLqrTM4xwpB62xHoI7dK4UeP55oq1J0KdBWg?=
 =?us-ascii?Q?lvgxkvB6ZrPAQIiQeVs6WPvGnht/XfbGEkuBN4ebWKH9WTbxfB/Ya/8aACmT?=
 =?us-ascii?Q?rVQGJTndEdZHcBoRfblErLEGOJ0wCGqSAM7odQtUqG2TWyWY448zc89ez0iC?=
 =?us-ascii?Q?xjwevTmUWLMb8z7CqAd7A3sI1CCqaT8g8aVtQ4sN+8nMEGw7cyuzAwyezOQw?=
 =?us-ascii?Q?FF81MzA1noJxintfZVIXG491hszC8x/K9M/lDCCtGd16gDQsRKuWwVTo8CQ0?=
 =?us-ascii?Q?0iCfh3AYd8rn0tapPIhnc1ev6I2+q5I=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c8fe62-16f1-40a2-2e4e-08deb7dd8372
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 08:38:35.7597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PMdW6PNm/ulsJifqUVPYSpR3NjeX0Asa7RTVTng1vdC8D4is5fPzjFjxgXpBW1A+UFR9+Oer9+tH6/REDxH5CCkIkq82MlWJmRjgI5NApI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5052

Agilex5 devkit supports a debug daughter card that inherits the
configurations from socdk but disables gpio0 and gmac2 and enables gmac0
and spi0.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

