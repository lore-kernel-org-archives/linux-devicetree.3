Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795710776;
	b=4FXh314FXJNJSQzxBITe6tdAvSSh/ckTxGJF1wfP/C15HOqRQwWeW1JgE0E507QT/dKg
	 G+Gr+3M2fgf00pyhQLE6vE3QrAhZZEJl9EX5KXfaORtQy0BXWUqWHEaFbaZKeUmEKjtSK
	 lkqk8wZtl8h9+X2O0o3CKNGbhXft+zqou9x8ntRejAJjS94XSsUs0sBqc21qgvClXJtB2
	 k6MerSoka72mIl9z2XMgatp9m5Kr2z4WzDYoXGmwmUw9geqxgq44owkW1TFqhEyayOZil
	 7IvOrXk9EQ0MapBX5LjKyYHdmylVaaWI44fAMfjCjE+HwNLLM5PWf0yr98Pad35L93g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710776;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IEGn39Df24JtmgVHmd5LW1qYkpDnGUDpZfQZeRt7mIA=;
	b=I0iJffY3AyM5GzCBHTVT2SfVbCkIikBDEIrNhPectcxNnV4tXBOvcxK3mQlVUMqMnzLe
	 xIZhMlHfBm5gojRL2hcwwnmK8voHfDbaR2X77n0ppy0GWOHSOitAjRhh6gv7z0qmIA8Lo
	 Y3jcmRcJYljLnsUVaN4Eljmuf6w/rxeCQ+J38dI6g0Kvyj4yshrCxspKWFfdU0L1DX8A2
	 6rLCS+aist1VatE2FS37rFd2vspozFD1b6WkEBFbAO9dz9TchROwbYi6D5CxDhBcfhND8
	 5yx0DaAoBL7XC6tS4JUMykCSAkaCHBB7YMLxwSiWG1RyOVl6SvIDpKnKZd9BatOyarQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=E4kfmVZS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.10
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFDF606A32A;
	Thu, 26 Nov 2026 16:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AFDF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=E4kfmVZS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fA/rSXyCSDdLNU6RYZ0oXMgNV4ouZjX4r5hK89OPltsC3N/RavKqFNWLgQXhwwm06SwS9cVKAS6zEs26SUgCTnRaBgET94rzM3NdEgPNYR81JriVbPtoPL1fnzVyr0sGXoQBjOTSTM+AFtKEmcc0v0/abAXwOylz+CYd0vg9OIenOMYbajJlfU86yL5pCWX/34css2BsF+NTq9uNWXv7IjMVpdvceTP9F8sA6BAE8Sv08rtU5jyIhhMMNY5iz3OWl8s6Oe/v5J4XkE+MXZzmYgsfe3ridJp82rH4Rje+lmNKZqIeOj6ZO8ccFx40W2e1/uh1WaKZeW41Y3X7X/1xVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEGn39Df24JtmgVHmd5LW1qYkpDnGUDpZfQZeRt7mIA=;
 b=Bj56nCq4K+OPLqK9parLOBpl8ENBIwhtrTkjcIXBYmYksIY/e+SdcuDyytcVRnMsPUWyTh2SeveElSVSd+/1FEPNH54nilpz8aobV7qfuZXr7JUL/r3VXqsVW9LV5PyLQS0Y/L2vTgjIVGJCz2MCcsfWSlZDPxXs9WG4Ldxx5y6dfH1pj8z6opmpMk7L2y7N147gTJEQWvnxvug63UVA2aRvrYKOpJSULhuL9zciLVkWD76/OTQKX9wlMDq9E9q0j1r0JtQLSV9eOz9LLVw70K1XSQ50D+RkZNzQ2Pq8rAdu94ChFcvfus2SuaMi+Ucu46jRfQ2HjjK5AZrWWSIXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEGn39Df24JtmgVHmd5LW1qYkpDnGUDpZfQZeRt7mIA=;
 b=E4kfmVZSsZ3hGbE7a4YnAQidV0Ze+A68aHrY1GgrpfhBYJUFZkYMVDsybmizFIar48UM3vIKkoNq9AF3o/doZEysnHkDGqi2yVR6yHPPt9ftVcaG5OelimC4875d5Eo05ktHB/zYxx131ioWDW/e1wexLqLkxGmAbeQDnj47p6uuvJ1BNAAOxTpkTy5OcqUrHNxvoRFcJlBTBtkMl2UgGwsLLhdyrs5pnO9amH3/Sk43HWwfQdGk7ohnvHPleaWOyOtZVUJNef9raWeq8dCliWlTWZA1YW3zjLb7nVQRjfkdXwP7oLhi+co3t0q+A4rFx19N/Y4PNOoS5jxasKPh7g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:32:53 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:32:53 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/8] dt-bindings: riscv: cpus: add OpenHW Group CVA6 compatibles
Date: Thu, 26 Nov 2026 17:46:26 +0100
Message-Id: <20261126164632.978624-3-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:510:f::14) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c2eb52-ebb6-462b-3f58-08df4bdaeb46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|261022075727099003|10067099003|56012099006|11063799006|261026121527099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	TZtMLE9ERPI0JSLGC0Z59Ew6otSHS97xchLWp5Ydzo4R8YNz+3cOvXvdnck8ebW8XQTM9cJCP2QU4MluKe3Q3lUPKK5J7mr1H982YT0/ccyIyOrMSXJDa0zp3+qzfHTu5WU0g6m7azSdxN1blb7W2ZdmY3Z+E8dtP4pttQ9Kl+0+SSs6mLSy1a52maR+USMOSnKfl3YzA7rYhShiR/d4Megq2jmhiHvFYvmt9YhRfatpilxdxOHZux+L577CqZRdKz8pVPoxnLSvIBcXj9rLo9s0L9Vl/Nc76z41GPQtGeOa/n1OqICL6XZsj1OtOcnMOIibwX1Id6nJFZEmmIVthwm7wAch2l989B7mTWIyiMQizGf//ogq9kxpH8GJPWi5Vz6D8V1eSX2c02atWtMS0sqBmHEiEaoXEJEK6sQzoWDzV3xDK1lVhgkjvmeVIM4lStdIfF4nmibQhFpo8NJbFuiisO0wrBES+UTSfKC7z/rA2abhfTJEE1Fi4235QrLgZyqVmyH13IhSgfRsPfzn601aAuBG+fpdzJDOhsXONo8gsCKV5nqZ09llw0vh7Gghf+lhQLSIDB0jDFEEXAVO0Xf+9AlGgb6msFVpngjvvHvW3n4uOfKyeZ8FUGF/4q4uM72BPTZAzAeSLqA9cW3O14N6StWlXU4Et+vfXES63do=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yru5ZF2eVULo+MqUOREKW145HrzIRirUIioJTMQjjeeuw7TBIEy0yKpMaRk8?=
 =?us-ascii?Q?sVDrT5PI5VvMLIajiIRW0Y5i0pUjGYNyspWAGPw9pag29vVfAbdAStgRGxqP?=
 =?us-ascii?Q?+UJu6l0hFaCGu3G3sfDyfgzTy+o7sshnTGNLhHBLCiFuXCALtMCGoQRvRTJm?=
 =?us-ascii?Q?0u8/yDoL7PXd3j+HzsRKgbWmSJUATJP6IDm/FE7f2V059lCfrLVhASLzW054?=
 =?us-ascii?Q?D/7PprdHraRnLoPSMkXdQJVqXIvBVv9kL1ytkBIVk6ClLsr+DS+QMqfcAfxb?=
 =?us-ascii?Q?eJccv4uOzuPLD9TvZw0UkSwZChDl3NNck4ktqb6Bzdp5WhJbjp6KrfmsQw9B?=
 =?us-ascii?Q?AYXp0mm8IDvmOKdlo7ENG/y6DQrjzTor+4bh+JRIvHEicHRHFj2iP2Y6UO+/?=
 =?us-ascii?Q?bIcA1kH81peWx7j3Tm39Ty9pbsxfGS+stDHteiZJNtGRusiCcB8j4Mpo4Kki?=
 =?us-ascii?Q?S1/qxgKLB1Wo2eJss5QajMULpX9TJletk5eHRnp15p1ZoK7L8VVSAqBkMofC?=
 =?us-ascii?Q?NzSNj2WmIfCxXHgZt51wcDmUeOjP2B7JtUVRw+hdQPLq72hMdro0954rp6x9?=
 =?us-ascii?Q?J6/lyjoOy6jlJPpyGF0gSBRsLal5QmfVzxRNCq48+Esfu//y7btQZhVdComZ?=
 =?us-ascii?Q?/5lsjX87VjfHnf/NiMH8zJpK4J6sDKu0/6MEAXjvooQxAF+/AaGiZwhvEDFL?=
 =?us-ascii?Q?mvULd2erOQxm7Nq9lzBIy2SL7k7cgGus5nTo69yNbwcl8KcBHeoCsfSUz/gG?=
 =?us-ascii?Q?NrHD9UhfIVmZWJal/bM9z8Y6zlvh4+bUhoKyzmot3iJFwflNX1Sut8AWsTAV?=
 =?us-ascii?Q?iYAImWyk4FAGAFFYDSO/6yMgbD4wOQmg+Vhz3xnL55df+E1o9Rs0maRkUIIC?=
 =?us-ascii?Q?UMV0IyVcPghKf5oNW88CYpCGFhg3cxi9Nfsvy/5dlx1dlP7EzaC7j6ghJFtj?=
 =?us-ascii?Q?IdBTzhcsju9DrG6fYhk4x+lQsIjdEmvZ4zPpwnUHCZeq+f0hLUrix8A/pj3X?=
 =?us-ascii?Q?z0mfzs9EyZDmxxyyZZ4KiVBm1A2pMPDwQgDEDFO6OPx8SRu14fLLM9XjqKVo?=
 =?us-ascii?Q?ULSHpIfQMJBS0oAPuEXZItUyVjy75e/3aBhfnDBzwMPyKp+dc255qqdMNfRz?=
 =?us-ascii?Q?BjqR9KDng9T/jhkiboaxnqcNVAFYlANJpCt+ToJQvYa28ZcmuMt9Kt1BQYyK?=
 =?us-ascii?Q?/ZlyuPKmoQtpT77XXZH19Txybs2vVAyPnV444ZpQumESqftjY5EcMVUII7HD?=
 =?us-ascii?Q?XSfp+Y1eXvbOI/AMGlW/HlNPwSO/QsW2Q+rfHhf2G6/dCUqD1FwGf7eznuRZ?=
 =?us-ascii?Q?uRafwQOSmQbtB/7CXMuVhOYBzqdH344JWmyDWR00Z8fTGqXlWLV5al0NqB+Q?=
 =?us-ascii?Q?vsfx0WQPcogYY2YJXslVdoelMQuJa9wIgh3k2naeJGXV20B8G0WdcwbWWb8d?=
 =?us-ascii?Q?LRL9p//kc8pxDDt9vpcFjAMufS8euHOJhXzDQ/yQ3xIBm2uT4gge4LGycUrU?=
 =?us-ascii?Q?+RJcR1mzVV6MUGg6t6ZGBHifb6SMJFkFjBo0O9PuaxX1CKsuCJ0y07OUP819?=
 =?us-ascii?Q?26qjYr/3TvffLUIRG1sK6YLr+cl9wS7EXXXJup/Kotp+PZlQY1Txgw3PLKb6?=
 =?us-ascii?Q?G1vYoBfRHqvoh5Nro8pR/l8ZWyO76xM7cmC1jaZi7as8rLuGe1VaM8xnCKa+?=
 =?us-ascii?Q?1E+3GDauMXa7BkQ48Hf48uPLPIki7Jzj0Gx6AvhvsiBFpjZ2+IilHnQD9oPC?=
 =?us-ascii?Q?BAHAVhV8jpA1Cv433ttgZl3fCmsPKFrS81Ot1DVE8wzAqknraHrbFkEpB01S?=
X-MS-Exchange-AntiSpam-MessageData-1: LnO7McEllq0S0A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c2eb52-ebb6-462b-3f58-08df4bdaeb46
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:32:53.5371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUf5onDX7ZJmyyz6XdzKv5vrPib/R3cQOKVQRwBOhnHE8CYp06eBQiivor5El/8QwaPbNbv4f0rViBrpSDmPTLXQbYouHT0b/4JfGdUGqVTi56lMUp/fLVD3DM1aE754AYrhCox+NBr8eQ/LrOYj0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

Add the compatible strings for the two configurations of the OpenHW
Group CVA6 application class core: the 64-bit cv64a6 and the 32-bit
cv32a6.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Notes:
    Changes in v2:
    - Collected Acked-by from Conor Dooley

 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae67..81c3a6cf91 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -49,6 +49,8 @@ properties:
               - andestech,ax45mp
               - canaan,k210
               - nuclei,ux900
+              - openhwgroup,cv32a6
+              - openhwgroup,cv64a6
               - sifive,bullet0
               - sifive,e5
               - sifive,e7
-- 
2.43.0

