Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F0C3AE1BC;
	Wed, 12 Aug 2026 07:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521444; cv=fail; b=gZlpHekxO/uVxVKA/5eRlKyDjBusK9Yt84SWnTvESbsy77YikVWpKTQ6N3skAkrouxfEt7QtLr8sPHj/ZerT4xxLHRQSUO/zJl8VFKYkePGT/lJ97d8DMn/MMHz6MpKCjJ0hRl9gwf1+ctfPjLfUBm4gXrcECNtHiTyoY08JKLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521444; c=relaxed/simple;
	bh=UiVoW3aC6OH/SzRJ8EfzwVL3dylyUywAu4A8/Lubv9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KRcfcqUSY5WHE6TYvrNWK2sRjNBxQnKLeCbtd/Fhv7/DkcMb1MXc9RAVLMkyPlTUFCmzL0DE6dEok+SjeahAjp+moRx5hZKjxrNf5swl9+APcdWHoeXZmAOBu3JtL1Kbe3LugUiOfhf8GNcJC7MBVqAB2FvbX1vLQRGS6zcsKEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=vzfcOAp4; arc=fail smtp.client-ip=40.107.200.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="vzfcOAp4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fys4W3W5lnBjN2Pboun6xhObOZPfkeYrfjQuLoZToshlVlMFbGAQgdtcZo26SdsOR0M7prCqOhHrwBNhVZdPC46N8zH95mX4yE9rJbxxn06s1F37V624DJ7O5WO6yRaxfEfSqGXm8fF16ZY37+TGRN/hZpM2Qst+kzv3+Lfq52GqyzDC+xNgdACGiBvmj9djQAfSR0P6nEYpOsbwJ3X5/skT/wJI7m9OM/CUBvaGo0cfwxNWD335ClZVpZldBYrISoDoUSAYm9aHq27Fh/fVUXYo/Crr4Qth5vuI23ZQPZdVv3dZApU1lUDQZo/uYBw5NFCv64LDri5VEuXyaC+Bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYDW0hV+uiLRPqjniZG+03u+gSc2hb+D9c4CwYz1EbQ=;
 b=pIIteOsRkSm2wI3F5mpSsRnRiD3qSNT8x300eo2co7ZUAwd/KS+3qDl23Wdede6ivRblcvHbP5HJ0pID74/xUmSTU1CM0xP6tyoNK7wKRGA69oYmYwL9TLvzbaKDX76sFQx91yAMP4TuGq9JneunEhnG4PfzFInjSt0d9AP4StR/Xxu1SsgNgOBPKxWoSFYHAKFAVpWVId2tamfTmdeCwI9YmoQWix3LUZDxhYId73LZfuytPUDKgpyon8zSGdFulFW5F2PIuUZVWJitr2U8m+T7xfzUzsA/WtjpYVVdOdM6Hvgz+crFsOHNynmE497pTqBKjEagpPZbzc9LO7ne4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYDW0hV+uiLRPqjniZG+03u+gSc2hb+D9c4CwYz1EbQ=;
 b=vzfcOAp4fmT6+LRP+2e12xfPUYT03CdVVYwtNDV46vprijL4JjG9fnBZvgTubEM4eTg1Du28ssI4jcaDVWgQhbPWN45IkD4ucNBPIalIFuFzqwk3Edojoh4+i+3JHC32i15TalH44k3WKq1dwtFz5z0YgCjwR8imkUjnKJ/SRSl4HSWr3hw0AfmVBpguedsXkaxxsHfXLO9Yi87juqbwodsDpo0lgulQEqVZUodhUI0JVNBZXEEEGh17lVba8tRtSeULWXdPMr+3mYnRJNY/i7Vc8tQMGwKGmJWkMJvy+LU5BsqEIDxTgNtX/jol//+p64wHzViWJVd8cHD3jZwIqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DS7PR03MB5606.namprd03.prod.outlook.com (2603:10b6:5:2c2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Wed, 12 Aug 2026 07:57:21 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:57:21 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 RESEND v2 3/5] firmware: stratix10-svc: fix list corruption in stratix10_svc_free_memory
Date: Wed, 12 Aug 2026 15:50:29 +0800
Message-ID: <728586aafb602977ff0c5f6e21322530bbb75c12.1786520346.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1786520346.git.adrian.ho.yin.ng@altera.com>
References: <cover.1786520346.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DS7PR03MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4b9b40-5400-49f9-2ed9-08def8475664
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	2JcyxB76nJY6NJ55Q+4n69B9b+9NhFLQdY7iafMmJ7NGu86fNI32bmyFsZCsvilGVNl42+PMJkCPl+B0umXSUWrtDj108tNnf1FXsaeVy8pU0kGZ9HSb/SO2C28OU7TaqNnsovK3HYByBJ/VX1ubT5LkxJ7/fAKLrqDaIXxQBI4173ZNv7vln/ciVH2LJ+xM6FatXmsVk2mGoVpkAFhBWnSIPL55h2VbVK1c7Fdtm+IjSp3Nh9xuCbU85tCNUjLTouO6tDMBbzVlCCpt3zF5bGqooE/ai+5k8C/rCvYLg/RAuDyrbIpkxAfJ66GQ/MwhV9g2NmBO7PhI2FuUqwBwN/rxfvtiUQMI5+msrHL6ULrf69zK9VcCSeYobxpwCgwDxoK/bmEa0ZKgXlZL2cDmtnsqD92kh3aIAPLMt0UxjNmqg9JhOWbkhY4ui+v9+mBv/Ct2jjoHVI+o5oBLt1/AGVZ/ikQBErX3Cqzzb33hInyreSRjESuKSl0jfm5TddoAdj/xsfgVBmcy5/95uShavr9K6dgY0CiP9+EyNA//6DXPrjG2gZ+Hz7NXLdA3g3k46JRc6Qpn4YBnC4OsaeXYDYdQ/Bp9zfkhn4rE5ctf0VIL1jICI1CKm+iczAhMrnXtiFEdXutvaR5w3nZ/khH5BOjiZz90kehB3g4afMQWrXA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VTznDmEJqEgByhJ1dBQDxa5H/B21Mx52fF6kwaouEKEYExU3rwEajGmYFDVU?=
 =?us-ascii?Q?0QWmq5GZPE9u1qw5MWgqq9c9rNdRVQCfzCeNXgODplZYBFDdEFqJgxkdc9OS?=
 =?us-ascii?Q?6nDsc/M2pLV0sBc9CSbH/pg1AzAg57OyuwhwxxSbmACxMOy6eQVfHSJlG7l+?=
 =?us-ascii?Q?8ugKKFulF1ghgnjDCksjl8yPHEumOrhn3xnZ9Ayx4z7gTAUzPBClssEX4jfL?=
 =?us-ascii?Q?TSb653RlCZUBiZT33lqHTsnZ2QtQRI9SxlCggahWNWvs3AMuCj9sibbzpCyu?=
 =?us-ascii?Q?HsvqGzd7raFyO6Sfz1JBfLn3k+jvnLEGHNAaQKm+dGNFAqc2fqUw/s08U+LV?=
 =?us-ascii?Q?FMkm3wPUx1XWp9mBl285feEvoUxc0agK3U0ZuYOnwHFZolIJzkxt2FRzPRvl?=
 =?us-ascii?Q?cZQUugsPRxOAjWTmgW5xibneUptzoySqHXdlFPO+U6Q/vsbQaoVrl8NRDAwu?=
 =?us-ascii?Q?vARniL5xeqIFNOG7DbTDHsYSY390JTSdeF30TzxP0BZ/UHf13BxpdgLpSe0o?=
 =?us-ascii?Q?bhpOtfHy6k+ebC1BI5gAU548CfRprkFR5FU2f5VvXPcaYsggw/JwXHmanj8t?=
 =?us-ascii?Q?NGowgVVgm92pvhQzMYmj9lx816SsDhzaxltQ2VXdvOF3lK3URpy77j9Br330?=
 =?us-ascii?Q?i3Fw45cNcIVqXtT5B0uSk2VUGo8/FjbRdHlnjxWLkpis8ac8nt5H6En7ZE0G?=
 =?us-ascii?Q?CssBr2/+EaJVxpZC6vhcWTpgb9GOfcG+GDs5FLxF8EVfRlBix99pXRVqjCsh?=
 =?us-ascii?Q?TqUE2ZY0miOlOJCpXHYqro5VOIKP1X9THmmMNYOtZowNjFFZLTgQ1s3GMVbB?=
 =?us-ascii?Q?3mKEzXcLRYTqtpu4VXrbXcd9qZXm5rdLN/b2t4NlRdoQShctx0aFzHfT0RtW?=
 =?us-ascii?Q?4J+MWP3pJV2nhgzvlE6znCw0zLrZv73yPQX367ZM5fBrkQTkdydmlLfkQI0T?=
 =?us-ascii?Q?w5VMYEWe8cpddPXs8gxf8Pc0gLhZYVpoeBt/DglFzljd/We1XDfdDwKoHpY5?=
 =?us-ascii?Q?eG+BOg/62PXqaNGlH3csEluGe6i4tWpIGcPPLtzMhgsK1Ywg8bej/Eq0iHIQ?=
 =?us-ascii?Q?JuN/lk6jJTCAjEqTyRdI5U3V0Vtcawuz93Bkpy3vo/9FRwqN5zfXhrLgDfuH?=
 =?us-ascii?Q?KaQCLIGdGB5CV7E4z+rKbSBTAGdDWx3A0CQvAe3YcuZosGTf3GjkcUsffVSh?=
 =?us-ascii?Q?RjTXMRZ13bgkx4pCuuq/0Ueh7x1IUmOJzQhJvdDFA9y6wc0T928+kbkUmDWV?=
 =?us-ascii?Q?3xNN+mS0hyiLvK0H1dmzkY2dYDkkXVRGLe6auN/HRFB3P0yux9mxBmtY9Gf1?=
 =?us-ascii?Q?emeFCG7gF8Wv3XJCvVPx66OVKtSU9Oj5KNGZ+Tdp/6d7TclgbstSFfyVD9KN?=
 =?us-ascii?Q?ZrUh8dn98wroctt79rYLbDLeU46Gf5rsCvvpsoGTJOMMz8G0JDpdHkG3zlOr?=
 =?us-ascii?Q?8QKB4HMYtQBMkMlkzJFibET5MyxYSGDY/aQoUDfYVDYAfzqlC/VIsxIqxIZb?=
 =?us-ascii?Q?6VnZMAweQXIh0h3yBOkChcxvXjL9wkCIzCSp864RWbTG7RXoXTWFcRBoGa7C?=
 =?us-ascii?Q?jZyjLJ1tIEiEgKk/7PlaJX7I9jJlRuyjKZre5IgaCWZqyVFBDZjWr2s8UK1b?=
 =?us-ascii?Q?O3MWPGUGTJ34JIyoyTxyINGRoNDTvALNi+/4dLvCQoxeDN4QGLNaTpYTAnVu?=
 =?us-ascii?Q?P06ou0iLm0TwBj3Y17PwswmeIX6X4/Cxno0KTLJHJZBqhymaUMm2MQxcC2fF?=
 =?us-ascii?Q?SgqGj7mEsSyDyfd6/sAGSvSUQdnWb5I=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4b9b40-5400-49f9-2ed9-08def8475664
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:57:21.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29bXVz1AxhXYTU7c+EMkHORuq9zmVqsa9GqjTtSk2R29AK7HzwVTlfn5sQ7UNcBhPecdKcFKbszhqBkUDVRopcUSvVUx2Ga2mqKAsPBRojg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606

When no matching buffer is found, the fallthrough path calls
list_del(&svc_data_mem), corrupting the list head. Replace it with
dev_warn() to report the spurious free address.

hile here, refactor the loop to use an inverted condition with continue
to reduce nesting. Add braces in svc_pa_to_va() for consistency, and fix
a stale "physical address" comment to "address" since paddr is not
strictly a physical address.

Fixes: 5a0793ac66ac ("firmware: stratix10-svc: fix a missing check on list iterator")
Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 00e134e663c8..20ab90a4584f 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -318,11 +318,12 @@ static void *svc_pa_to_va(unsigned long addr)
 
 	pr_debug("claim back P-addr=0x%016x\n", (unsigned int)addr);
 	guard(mutex)(&svc_mem_lock);
-	list_for_each_entry(pmem, &svc_data_mem, node)
+	list_for_each_entry(pmem, &svc_data_mem, node) {
 		if (pmem->paddr == addr)
 			return pmem->vaddr;
+	}
 
-	/* physical address is not found */
+	/* address is not found */
 	return NULL;
 }
 
@@ -1880,19 +1881,23 @@ EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
  */
 void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 {
+	struct stratix10_svc_controller *ctrl = chan->ctrl;
 	struct stratix10_svc_data_mem *pmem;
+
 	guard(mutex)(&svc_mem_lock);
 
-	list_for_each_entry(pmem, &svc_data_mem, node)
-		if (pmem->vaddr == kaddr) {
-			gen_pool_free(chan->ctrl->genpool,
-				       (unsigned long)kaddr, pmem->size);
-			pmem->vaddr = NULL;
-			list_del(&pmem->node);
-			return;
-		}
+	list_for_each_entry(pmem, &svc_data_mem, node) {
+		if (pmem->vaddr != kaddr)
+			continue;
+
+		gen_pool_free(chan->ctrl->genpool,
+			      (unsigned long)kaddr, pmem->size);
+		pmem->vaddr = NULL;
+		list_del(&pmem->node);
+		return;
+	}
 
-	list_del(&svc_data_mem);
+	dev_warn(ctrl->dev, "free of unknown buffer %p\n", kaddr);
 }
 EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
 
-- 
2.49.GIT

