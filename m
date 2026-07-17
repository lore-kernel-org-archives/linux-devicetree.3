Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6493F6C42;
	Fri, 17 Jul 2026 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289032; cv=fail; b=StHRWbGJ3g5Uq233vvbZaCvimaQ3taQv2wbM5rbyq33+emvGTRffymgaOBvR1XphT21LF5KIOENZ1AaCKky/gz4LwQ48OCQHvrAmvARZPnPGd9VDPhoYJFarMsRVijsmkeSgjjlQ9G2E6cwUDdXZE1Fjjz5AeI6KiKk2yVWc1Dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289032; c=relaxed/simple;
	bh=cDL039dyHBBXjd85P/D/40dIqbW9V/14mdBoxKnSt4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OjMiV346bK0i6x16QmdMkqOJoNocjLlbd6re7YEnLki/pA51pzeGQV5T2k2mkhjul1JqSwzlcBdeA0QSXYQaHyHJTLGvutQ23Wh+nDcupcODy2rXfp8e7yhHhTMCJBAfBPQBzPiDDZHELr7X6TGpHX0ivLrJ4Au2pfGMUDS3e+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=i4t0wjwi; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="i4t0wjwi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH9iyG4WoJjuwMC6y77uAIh3xPBZ9aTEP1Tj4ImEb0FPuRV+PWzAJEp48eOcTzjOSyzuBVh7oj+JJtqmMo/SPhPBhiCk+tFDr0bAt9fmq/4gynHqzhbWUJHqXhm6o7yV6A0noOxK19fbDpLDnBNdYfIRkx3IGJXJiVOWygvZ2iNsVC8tyCehWBu/WRmSX8ay7r798tPxCLPprMiycsStOYsBEQkC6BUBFxI9nPogyHO5oO1phN1528e6o/mO6tg1j8qKmW13+R+ZftuRajtu0MnVjbYt5TuAPZiPigNBZ0SOj9bsqObKa/fjxb2ON9EM19gm9aMlWYMu3CCCDVcr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpjxbHLpoalhaZKi3JVYsKJaD0E8a/dXC5RUcAI2KyY=;
 b=L08mR67LxGh0WdoXJICdvpHJ223aFW8funA/4X2LaWNOFjOFytkSqoN/QNLNAWpmzVAHjIeRSpRCGqGt0SXONf4OcXpzOBwjeDNfepwuBb+Hhzam23kvUvThWxRUdKK8YXcJHklcl1lCBXsdG93iox7O6WKVW58LWlCgwj0HPyZv7RosT92mSvcM+i372h9I7bwKpzDRXYsAsaDzn805xx3i+lvgX3n6gXpXwqqA7YSESQ0SDbT7h8Sv0gQRHiOXMiWQxO7ZMhgw9JSS7LHegbVULGDpj2z+H1URYdnmUMMnSvUQLpUE3phyQqhTuIIqkgZcULhZWXa0n8o/G5OoGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpjxbHLpoalhaZKi3JVYsKJaD0E8a/dXC5RUcAI2KyY=;
 b=i4t0wjwi6F6IM+1Kh6O3oKsgf9V90Hlwm8Ikqjxvg0Fvq6LuAFMD9l3QiBnjofqBdoqxiiUG/d+Z5YLUu9acHCDhFtLuqYZR3x0OR2ncTGNwDcC4ffD33RmHasosmRb0jniFOlJPA3gbvVHgKVBV8ZBWFC8aRQT+C9U+2L+BG4GBnaPSyM+kClL/f/TfYPOCFKibv4JlIzumGptOZ2lpjHWg/+MGZ5OQRAhOcDOzNNUdT+zVl755tVZrgS3JBdmahUM4tsqnFiST6wjqeZVPrdZjWZO/742MZ9kH2tJJSK9iEA28GX/iWZhBulHHQbRjx2XzuvMgO50h7jl1YHdc/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB9PR03MB7180.eurprd03.prod.outlook.com (2603:10a6:10:22d::13)
 by GVXPR03MB8308.eurprd03.prod.outlook.com (2603:10a6:150:6e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 11:50:13 +0000
Received: from DB9PR03MB7180.eurprd03.prod.outlook.com
 ([fe80::6fd2:12a9:4423:8ddc]) by DB9PR03MB7180.eurprd03.prod.outlook.com
 ([fe80::6fd2:12a9:4423:8ddc%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 11:50:13 +0000
From: Wojciech Dubowik <wojciech.dubowik@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 2/3] dt-bindings: display: sn65dsi83: Add output data-lanes property
Date: Fri, 17 Jul 2026 13:50:00 +0200
Message-ID: <20260717115002.308035-3-wojciech.dubowik@mt.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717115002.308035-1-wojciech.dubowik@mt.com>
References: <20260717115002.308035-1-wojciech.dubowik@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0063.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::14) To DB9PR03MB7180.eurprd03.prod.outlook.com
 (2603:10a6:10:22d::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB7180:EE_|GVXPR03MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da4b9bc-9b0f-452a-4f8c-08dee3f98fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|23010399003|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WZE+GWufplV5XdKwkPuZuutBzQBllgv7ntWFRIqcqsB8gHTjCQBe9TNZMCumqR3YLz2Q8NQ4902ScjZdNq2aPyw7QNaRWXEmzvgV7egln2JWY/dELBvoJ9tWGhQhOUCODf2HlSBqRP4ra4UiiDkqBFrYZhHOY88LiCKIaRyi1lLzqY9/rrKzbI4tZ6FPqDVXLwsnwLX11DI+VPV6fGA25MaL4EarBQOWzri8ScToKTNa19oKRal0EO97XisNuKnlxcTnkhx1kOCcmU1WGGlxZUSRf43vc+aYY4bVSr8bTd4cAgIerYDKX0aXyFY6sB4RIeETzJqKTzGIstMwhodWvazNDia8DSAcNXMgG8LotjZZc6GJWGYenJn0DVNyJepDW1Vxa2E4/1LQJ+i1CfjxQViON2SG4VFVMLAaYjKLTJzI16WWqqtsDpzuyGcHLckWdu1FTrAWl8CyZ0w5Q1qGVxLA4KqccTgqTKWlgESoEhglqA7JFQv3v3z6PSdUQnWEWk5alInao0TE3DJYaLXQaK5CuC896e1CCVTpz130+F2Jm8ppfo5+R25c5lDiCQNdPgaWnEfDpqU7eNo/b50pxywcL6weQ+zLsPdMDDwTOlBqBzKUtCfg1isp+p+4sjI1DxkTf1vvxTOp+PHObLkrEfYZqHtfESzwlaNuBnNWCTw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB7180.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zhuo62VBBSQvDhCny8+u3R9Ev1LyYS9V7y/nGCZvCRGprIqPKvW0tML86pP+?=
 =?us-ascii?Q?DUk81RjKJphXXBqH1UvRtrxcieZJutRPyTLj2J3drsc3BWmgt3IcaKWqgbzV?=
 =?us-ascii?Q?aaKpc0SVxmhGDSfs181hEzACPtHw7m+AxNGIzqADlkj21hdr7crtmYdVQd1a?=
 =?us-ascii?Q?RFmCVatesUgE+8OeBOKL47ycNg+nYd2GxMxLF215Qu+VCGzH6EcMKF1KvjUJ?=
 =?us-ascii?Q?JM3mLFddKBU4z1FuyqYvOksUhmDxmPzooPWR/TxZOdD8lI2airg5iT2xFOV9?=
 =?us-ascii?Q?5ij2KZJ3UpZF3aphbyb0hMj+Y95E364OE05EqA12ZVNyLDm8eDfLc5hiyZ+S?=
 =?us-ascii?Q?bXHvI1ST+m6CCVNwhqZVceJtssutmj1eL6K07F2AvFmZ+hAQ2pNmra0QVvxV?=
 =?us-ascii?Q?P0JmvwN7CmCRAb+AGs6pZVnOUeinGlROisMwOepVr6j9Rmh6xGjqTO3mC6vK?=
 =?us-ascii?Q?fbzWENFQvMElgV2fGZAAVB3xzZrOnaGieG1yxiJpSefYyb0XnJQIVYOtK/WW?=
 =?us-ascii?Q?9lSqZOJ0s3u5pOVisuepViujLr7cmkVScOwCOBbCxF9R0QVIgIgAFIq5j2Ym?=
 =?us-ascii?Q?5xSOzjWFRwC1t+1/+jNck9+dnnvGhoEmAkhmv4rdPXejkm4KvItsPlGmM7b0?=
 =?us-ascii?Q?RCkoDy0BoBchwH5zRGl8bHt5MEpVfsW6k5MOcb1BmkS1VX7ifC+EGavv9Rde?=
 =?us-ascii?Q?+xu7tZO5PtewPiv2VYywsa0NmAGglICBy4GJKPsQTnfkspknbWjxWKHNSTnr?=
 =?us-ascii?Q?smkbHAnEqhbB9Srp6GEaWSW9IqBut8Bq7vdr6J4qiwzIyeSMwAGI5ViESFcw?=
 =?us-ascii?Q?nZdyTOviS4eF9TBEAaGladHLomVUYCNFKSOAnsM3FVwsWa8jnZ+rUdiIJHyC?=
 =?us-ascii?Q?ffgYRtrZsyhWZaxPm2hptpbfY7tjTVYfqfa4uwLvQtLBMB7xIVESwZfg8L9o?=
 =?us-ascii?Q?UcopvF3wp9Ct2plIgQ4Sx/xIq+0Vov4ZtDRT4rOy9ryIKRuB0WDxqMSklzU/?=
 =?us-ascii?Q?GyF9qcVDsGzlDxajwT5CQNnAE/vJZdF57j0TEDKZ6Wlg4aHTuNCkgFyuPAjz?=
 =?us-ascii?Q?d59g7YdfUwH34fvN5StO1DKtJKIKEdZy16r2tqoJC9r9/KOr85NtuIJUCuO0?=
 =?us-ascii?Q?5uJOD7P1/2fjj7HX9vlOmbA6jReBwomQMp4KlQ/y2sOCxiE0Pa1L7BGtYkCN?=
 =?us-ascii?Q?TvkeBlUQng42M31bTzqsF4RR+IOQ6W/SsjNM9+PdJBJ8BerREWtIQHyirxGx?=
 =?us-ascii?Q?3LHydZF2vrny/jyyUF+9lZVDur3QxpvTReOQbetFI1IrB9GqMIfGuWu22CsF?=
 =?us-ascii?Q?jzJKIMp88DKYXFzGk1Ls3gmlnKbQED99ydTc+333XvYD+C43KZ2dIaZKRmKK?=
 =?us-ascii?Q?5AkQrFgLsd1GdoF+8KQL7DPvZ7OMp3uBbam9RTDNAICXlWzDozuXqqvYgYYd?=
 =?us-ascii?Q?zMA+59/rZADjoejM9WtjlSBei693E/I6ivS0eBz2TRpiEfnn39zmmULzuSSQ?=
 =?us-ascii?Q?eowPpMebLJjXMHImTOfpLebn6YuGXJvmLdMCEdVkLVfnumW8ABx3iBO3uw1e?=
 =?us-ascii?Q?/kYpPUWbuer41b6aF1uanmwwBwFOfMJXwY1IctCVPcLTz+p3xj5AdLhmCEZf?=
 =?us-ascii?Q?vbg8t7Pz3LwDZU1lSobhf+NAIbxwqtIEuUJ3YHuHVL16IfFpC6HImGkzciYK?=
 =?us-ascii?Q?apHxZY4PIjd6Y8DfjEp52D5M9r0u6XuRQnGMkysxSnBjeW6TLGS1q7CUatGX?=
 =?us-ascii?Q?83caLED6fg=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da4b9bc-9b0f-452a-4f8c-08dee3f98fec
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7180.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 11:50:13.4957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JP8ChCtjW9e6P1jts9r97tTZvH9MIxgrFcijqfqijlKa0B3pkT12Mi4+vdmguDI+nwSLkSrcpFXJyMmBB17kLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8308

From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

Add an optional output lvds data lanes property with two allowed values.
The array <1 2 3 4> for standard layout and <4 3 2 1> for reversed lvds
output lanes. The latter informs the driver that reverse lvds config
option has to be set in config register for the respective output channel.

Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
---
 .../bindings/display/bridge/ti,sn65dsi83.yaml | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index e69b6343a8eb..4000bf0b1370 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -86,10 +86,54 @@ properties:
         description: Video port for LVDS Channel-A output (panel or bridge).
         $ref: '#/$defs/lvds-port'
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                description:
+                  Array of physical LVDS data lane indexes
+                oneOf:
+                  - items:
+                      - const: 1
+                      - const: 2
+                      - const: 3
+                      - const: 4
+                  - items:
+                      - const: 4
+                      - const: 3
+                      - const: 2
+                      - const: 1
+
       port@3:
         description: Video port for LVDS Channel-B output (panel or bridge).
         $ref: '#/$defs/lvds-port'
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                description:
+                  Array of physical LVDS data lane indexes
+                oneOf:
+                  - items:
+                      - const: 1
+                      - const: 2
+                      - const: 3
+                      - const: 4
+                  - items:
+                      - const: 4
+                      - const: 3
+                      - const: 2
+                      - const: 1
+
     required:
       - port@0
       - port@2
-- 
2.47.3

