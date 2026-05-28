Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2892F3FFADB;
	Thu, 28 May 2026 17:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989079; cv=fail; b=aTli/F5gh+/3Q7CAfIxPe4sRV+qxOCUuHaHaefZJfYdw4qLCrWVjCWyoZqs8rFVZe5GEz4Us0AZ0pGApEOIq+s3rf2F4JWvrERGbWke2Ty7oyFjSJ0c9YU3Fd9ndZOpOdKyYraBIzYMLs1oHMPTT77rG5OekLalgt1lNSIiUVEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989079; c=relaxed/simple;
	bh=gXsdGnQMdp8UkYZpFsp2TtXMjpWgqBQnyxU06pXFjf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F6+ZM+xujKTrO1GrMrDgtJRVIugG7nkJAP0BaSpnVHaRFaT6uBjdl08TzWKTQz6SywQvZi6U+3RruKQaZxcJeiNcGKLyAv4TEpbaW/STSqjdSfrjDyWTqTr8MBMSvZrbrq1M3kuyqK2hf/3bTcS+Ii/7hSHkTCnQf6/a+T3VhvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AgHp9jHy; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AgHp9jHy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ovgp1lTavl5JARpaiooInWjC2awV+cloqOJtnD228nE7zw2ZJN02SOiEHIOoNGtj2/8rdncLM96acT+Iv+FbZ6POa5/mP4xwHk5PUKq0DBIuhrMlqEmP9jiU1v+z20WG8irj1OAtFf3bYPl5+RttQI4sD3ahh7k+XIyDfsFKzpkN9kim9WCZmO4d/u2t+sPeHuyPnmD1mQD1Zl4PgWyQFL4yR+W0TqGybEiDOvlI5UUKlO7ColfxmMi7H5Wc1GKPtOjru+EOGD84Lg8gN28Xy2OWIDt42HVHw9W0YiiZI3eB+v3Df0Fo7McY0FctvnZ2vm9YGGRVZ3ryq4PIiV4hOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qvFea0U4e/sQtHGPRpKDwQk0xHKAfmC1W1ochuLQNE=;
 b=zLRL73Da1P8RuJJep5Q0FxSdDxDB3dKM/c0GC5dvjH3QEXcMyXK9uyZ6Mg3t74+hYGKHtbq0VmKfcpTgRZJOyCp1+J0KyTorwJldQSvOx6voNsDAtWwKvKgwYt1HO7u7jcpfhYLzo8SBGF/sD8LlQjEcKgXfzWz+Uu4R7Dij200gQqQUmC546vHmZskfKhirGFGrQHhaLxL1RZmqqep3sL8akMxZhmYf/hyJ2VjaleSUYiiCXXaym0X2/+PST1Pg1Y4OFL3DnU7lTKKR9L/0wc3pboBoZlLbzXhoVU+OCAfAtDAqZLhJTtCPinVrbiUMx984gThL7435Obp+vT2r7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qvFea0U4e/sQtHGPRpKDwQk0xHKAfmC1W1ochuLQNE=;
 b=AgHp9jHy8TAbfQHT4Lr+VxzNCnRXf1Omx0cpUR9CmDmKw8b1RbKSGYm6czXPf24Jbv3N+SNM2M+4GWzrHXe7bE7p+95W+f0ztoHvDP70fsYG+PZ2oIQHZNaboVRsWOMjg7S9iRctv03TQy0yco3MPlnaWhwXfsYcCNBbMmHQ8GLvXU8ZoCWWzSs6j07JL9nKjt/jIPAE8OvqtClxbqh8SALRumd02337ojUUY/Wg3qrFPyxRKO0eq22oJl9+m7NlCMHE8pEIaN05VlW4Wy18hf//JcoeFMRcS3tRgYH6qml6xVBX6hO8F3bAz8OGDHOmlmp0d+CIw42/KmAODLIIDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AM0PR04MB11931.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 17:24:31 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:24:31 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH phy-next 13/13] MAINTAINERS: expand Lynx 28G entry to cover Lynx 10G SerDes
Date: Thu, 28 May 2026 20:24:04 +0300
Message-Id: <20260528172404.733196-14-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528172404.733196-1-vladimir.oltean@nxp.com>
References: <20260528172404.733196-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0143.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::10) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AM0PR04MB11931:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbccb36-22aa-4187-f602-08debcddfa1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|10070799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	sb++yDa47C9RRDTGUAzZumvKYXzmc7i4R13KSu2mN5UqSFw1xwtL8uw7X5Cvhp9eFTmO1wSgOsiPwJ1zEisY7hFu6Z6wRp7pmoI8Et+xA6YEb1fNZ5bD4u6Msv62DwzSWlerwcTkYGU/LEBNNcwGNkmOZS+gv/E3BPYRpFe8d7kaDHWXimcHx/Fa3ishXvneePo9co6JUEvetI6azuGBWGIISyRzDv8bUAt8xTio7889oY1MobBonxNstzZybWXi6BE0WbtAUgZKnPViB2DCopPHRfeCE95B3Q/fct/OgWeXYZrVGNjSYJf1kgF8LrGfAXOgoaUJ3DcomEYbm8Mi2gKmRx9x92kOtNOyWTWSmvXDgN6MHlvclHVE8lMPDueuSkIGlYwB6W2SBYhILNoglORIJMcSIqODCkZtu50NBZpjxh9UbrhEld9o7+8kgCq9KcxiHLCWGWKLZwXvqvU0ZOMUiRV04+nbrgcfXaCWNa2+5/ndxGM3TKoIA1WKGKUuwtWbo8uxc4MgUoTSTYB+kRQlZw0ywcVY4cyjzeaajJvdzPig/3LhQU41cwiPX8b33ImQddeBFIRsf11wVlVxzBbnx+CIYq/HsB9GE0CfcAlr6SROFbqQsy9mWZ8sBsMJKPVl9YeDDQ/Gv9J4n+jOyH+Qu24EtsUQQsZOfUHZU7HqMtV6PWuugpviqm9aeqEV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(10070799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ht+PCvbIFwsjCZSOuLHuCDqTWQJ6FeNXaD7fx3Pde6c3Z5Kmyer1B7VCLxoP?=
 =?us-ascii?Q?vniofUMwaDB5oU2G8YB/4vFC6JWDjZsiZR0ycX3EtYigO43NgdlF2uzV8z0s?=
 =?us-ascii?Q?0+P+FwWnhIeVyNxWWSbljxRkUvuK/ObSb9AfaHIZWyIKVAvYwNe4ByCxH3FL?=
 =?us-ascii?Q?2guPNjAZfBlT4Dg/1Y7YgsaRrVSpr8TwSGASqmeTBF/Z7r9DJfJNC+o8HO5J?=
 =?us-ascii?Q?WFjv0PBZyxNT752xDO2KfMmtPaQ14Q6vhB2mzrWi+De2lz0X+HTqV9e3PfvI?=
 =?us-ascii?Q?odcHJvzhL0stz/3YlL+xUy+aieyEeWAtSCns6JkIa7DizjvrETq6bq/4skXf?=
 =?us-ascii?Q?KA0V/4JkwQFv2pZ/wlebdrBBDr7FIh26CZq+bp1GH47zKcLcR+VXQ0FCwCoR?=
 =?us-ascii?Q?ID1wVYdf9WOIorfs6VlGgcN6ovZo9/h+uR+QdR7IiiqBjwJCRpPqAoLTOUo3?=
 =?us-ascii?Q?q2O6QWyZBba50a5nZMC6iKtF9EAhjKPNadi67p4dNFrjuhL8Dnmc6Tgv/Vsl?=
 =?us-ascii?Q?YvgivW7q/jlfjhRYFqLun6de4gH9pHE9gxoLDvy04X6RtbLPucKXmiEWez94?=
 =?us-ascii?Q?JIBzVfO6SzvJbW31g9iuMJGxCYXe+O+kUXv4rOZG5hZ773DZkPDSbuxmCyE4?=
 =?us-ascii?Q?sV6Cgg4mqrS6gMQFn/Umwub5rCLNalQQHTSCUkeSPvoSsU4IVBAdBELd8Qwb?=
 =?us-ascii?Q?/Qju9kNuIRtkjzcWjp+X8YVZeHBoeuO3EeIyq2YZHSUns/sGD9E2EWdZ+TFz?=
 =?us-ascii?Q?tn+w7GI6lNGNa8yKI3cYJOkpCE+fnLARFhS7YVEghgC/bdq5wfwTqtG58rkw?=
 =?us-ascii?Q?jFYo9iIGzaNLMrV2HnIVWJdAXLyvKLvbof/cUWtCER5NOemLP0e7txl+dBLd?=
 =?us-ascii?Q?ioXsglEBsdGsB8Hk63resU7OR13dFAfuZfxmjyEPqGqJF0cmWXkxcM4L6ASt?=
 =?us-ascii?Q?dR0z6H8sHn3YfinXGQ4qqySvO4a1HzJvVyPBz4bcg5a3+jhEO9ufpiCCVyLC?=
 =?us-ascii?Q?7/gLu+PG3aSGqim0sXuUJUNFiJZOb3EfSEJB+5L/fMT5f6PBvVqx8ZCrSMrC?=
 =?us-ascii?Q?liAyXWGMxESDv2PgpizOm2uFVRF9IOeH6zcOgx6WLRgiWr+9AVbYHXu688eE?=
 =?us-ascii?Q?Fgl8iQSwqTnqfaS5qOSGjejir5+/b6kII/tMhlwOTGadvOLruYNttfdaBEBU?=
 =?us-ascii?Q?WzKWl3+2IdsvhBjBWFojjZVBHHvRO8zin+jMazPtZWNeULNGkdKFUYttYo45?=
 =?us-ascii?Q?OGiPEDcYiOlAU+SYGseBlqE3K9L5WqFGQVPfNfMsTXWEq7IJqhaZUHUfjhcx?=
 =?us-ascii?Q?Wn98+Ie/uFikiSXVeevRvDwEBJcRBZ9DbkdLemt71IkN1jE1pZIur4B3n5K2?=
 =?us-ascii?Q?dkFIIKYpwtRxOR3e3tO/Vh0FEazHFwvKgUrYjbpqzoRWqC7FsCVuulDdKO3e?=
 =?us-ascii?Q?jFxOK4ch3XnZBFTLOx6pORBwH5GV9bDFg/ZKK2QV+WCWvoWNCWXmQrsUoEza?=
 =?us-ascii?Q?wKrEf14cJqi5Vry9PTRDXp9UQteY3aT0Y9uGScwzqc2cO4jFMKhNR/O/mZG0?=
 =?us-ascii?Q?npI847nbUtaMAKfwkjGT5xH/L0Uv5hH52Kzto0UBe4krlBfrRj0IXotZzipH?=
 =?us-ascii?Q?0E8U3n1pE4sd1sb/XYMV9HyUA3xiBTWsw15RI80BjC07n+Rar5yk6rEJN5+6?=
 =?us-ascii?Q?oqaXlkGtPIRU4vRwvR+/qLJaHoDhzQVo9oXKd3WK7WUq+TiUqgjxD03ajYuy?=
 =?us-ascii?Q?mkJMEgfvI+VGLxmU0LStxc5/wZdbhDNsTxvQZrEzxQ4zv4gJ6L7i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbccb36-22aa-4187-f602-08debcddfa1f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:24:30.4653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnaNQ8goB2cvPNCwooQzQPZ2R5i95nU9Frmo+rCYIN+uR6env0GP/LCETpH+4n4KgOmTyw9bvy5Ywoa5ngyInQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11931

The lynx-28g and lynx-10g drivers share code and hardware architecture,
so let them be covered by a single MAINTAINERS entry.

Add myself as a second maintainer alongside Ioana Ciornei.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
---
 MAINTAINERS | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..bdae5acf8d50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15405,12 +15405,18 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
 F:	drivers/iio/light/ltr390.c
 
-LYNX 28G SERDES PHY DRIVER
+LYNX SERDES PHY DRIVERS
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
+M:	Vladimir Oltean <vladimir.oltean@nxp.com>
 L:	netdev@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
 F:	Documentation/devicetree/bindings/phy/fsl,lynx-28g.yaml
+F:	drivers/phy/freescale/phy-fsl-lynx-10g.c
 F:	drivers/phy/freescale/phy-fsl-lynx-28g.c
+F:	drivers/phy/freescale/phy-fsl-lynx-core.c
+F:	drivers/phy/freescale/phy-fsl-lynx-core.h
+F:	include/soc/fsl/phy-fsl-lynx.h
 
 LYNX PCS MODULE
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
-- 
2.34.1

