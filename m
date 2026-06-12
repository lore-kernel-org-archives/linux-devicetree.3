Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123EE37C0EC;
	Fri, 12 Jun 2026 21:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298564; cv=fail; b=QvZXQ+gjqt8419oQKkr6fF38pmKGk3PqugPMQ7I/1sCGuf9n8TlEQAGrYrjh+1jfYbsottZb79MKqAJV8whU0x2MpD566gia5hw0Xl9M0HBWuvpPLgApnW2Hh0uj8O1N8IAj4FHFAV1kP4Mcpnt4B2EvZbrQZrPQiUAu22obmJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298564; c=relaxed/simple;
	bh=zEDzk0F/m6xoCDRriTWVJkGmZJYJmaz2U1b4Y2tSN7k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dfkNTPfNfQuyR098Q4+qJdS6UuY/clCWYxZ8Zn64S3DnYUKlFDcD+b9zYhzhfg+tykTf+DHwxd+1lipD+4QW3/kGOKFp+EHRb0IfmLhhV0toVDRqKfJNhjuIuyy7qIrBaHrDQ1GHhZAkJeQvegxGWA6HK1zjbHlZAD9AkWJYI0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ou1ZKzW9; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ou1ZKzW9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FghEBZfNoZMyEA8pQ+MxdB+eGYmzPcpgcx667iojcsR/DU0HoYAEBFaf2yA11gsriwHmNqukKJUhkd9I5r/nfsw3yJVQuG+zSfjEsN5+wh3Wt6JD2cGzd7MiF0+WV48ILjgso2g/TYHAD3qVmX6Dziglb5fJy+PgKabpv5uA8arNsGZSqy5LBvuZHtEoNVD0UcNopsBYaJelM0TQZUsJcgS+6mZ+oLwBUnXhVISI7C0tEqCy9n5BM6zHKvWqjdk5eonytlO3GEY3TNB01kDVg/qnxuLf2tfsfr34Z4sobLCRlJFs2F1zB0Adw7rS9CnBMaH0e9GN5o+wot1W2bKyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljymlyVuyzZ5y33dcTJv/IlXjmIzA/jMNS4fdxoSqG4=;
 b=WNZr2uAZT5WcEBK1zTp/TaA+6a7Juvy1hTt4Z33WA2X9ehNk6X0IytOJu3uOoijmfMVVqXhqWxgVgW6JcA5EikkcgrZKZJHpJKgyhHerVRewbhzKUZfHD90clGoRUThsqBz//+j5o3FV5aCvMMXYcteFp2krBRpVU/9WdnTZBwPABdnbzbIfRtFSEInlOZsra0A/GDACgVTM147H9LGl/qC6Yjj/Dbs0bRrI/HFQxna6BQl6Axl2ezqJKyDiD5nCyM5eLugqILTHl2mSbzifanaSFxLwY1le5naN0icXap054qwpAenCg5snfDzdp7+NsCXSvs356U+NWWY08oPF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljymlyVuyzZ5y33dcTJv/IlXjmIzA/jMNS4fdxoSqG4=;
 b=Ou1ZKzW9IcJauD0wpqyEBVWA7ASeuk5ZYGYYNzvoHXyjtILJUD4f0eyrRphX29EaFmdfGO5XPWNnAJWQM13vyz1MqhxorNh/esFh9ye7JEzoYzNTneYTlBFsEWc/CdSj7+SBaYN+2xQ4Jj4cElMZSErzR3C9D4Fr0znnU2xYQzpSWshS57199R1Vn3C8RNGOZQdvTbVfi3pvW9HbPi0LQxjCOrPxc3FOVdcl/ka9pdp05mNlHvE/vK11cw70HElPzO6FblKtc1WEV7AadCuA2hCUr5Pbtm8BWJHJhhPMKGI14LwBnDrxBaFNCBRdeUeM8hJLC0kRXQ4y1ANmP+Kk/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 21:09:11 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 21:09:11 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 phy-next 5/8] soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()
Date: Sat, 13 Jun 2026 00:08:56 +0300
Message-Id: <20260612210859.266759-6-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612210859.266759-1-vladimir.oltean@nxp.com>
References: <20260612210859.266759-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0002.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::9) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|GVXPR04MB10969:EE_
X-MS-Office365-Filtering-Correlation-Id: 66843127-74d1-4ad3-d596-08dec8c6d998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|10070799003|1800799024|366016|7416014|376014|56012099006|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J2vGir8Ywt8JxjfypQXZ9Ms+BjP8J72r0YW0HKULylcUXJkMOUmdnOiq/OqiqH6K9w1JJKECv/bIeai+b3sxrn3w0sS4flkDUoRCvBoFEgJfZG3WiZbIOsyGszNHwPOiFfB91caknMUCKZB7QyL2MKUmAP9xxqoq1J7xubRkBo6EZAfuZaEgYYSR0/dNMc9SRoD5Td53nV/tvQpjootdbJYxPB4FGn0KLlXYdYPIAYCnS3NmGpOmnnWqvgQUfvU+LOe8hM/avNzcogJeU0o+wx6ZBKs0Q/e5PiXC9+R9UvlxKRFS9/ZfZil2pmOgDDSl35eQ9UNrTeV5O0wzzQXI4zWwsui7+TrkDmxeQ/7qNL5heDgup5l0t/7Apba7bMkuNTx1Y/dT2aF7zpIIb278+NIrzb/43Mbnva9vYbmswyIS3Tpl6LbbxXNlItlMx5zRUl2fyReLuNXoOyRKrwk5tijGBEbS9iDzlM1pnAV40lCLjXf3ygF04fL4/3z/qKFX2B5rp6pl/0br7E8g+jPHOpd6fbk/bZfgOypgK40k5vz/UXrduSZdXyfS8jj8Vh/jTzsHM4q0TZcjnXBgaZjkTTxpw3W01AdlIuXZWXgfmysPCxifpai151nzIm4qv2L8Xz9iqFpRS0M0d7vWI+bNz9lona7mErzm4+HbGT79t6NuUObNRjaPQkmS4PQVBUZy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(10070799003)(1800799024)(366016)(7416014)(376014)(56012099006)(3023799007)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XRVaZYrGR6DTf0N+i6RdpOrBc43edR8L5Nx3OWz8yLHlDpp8RHoAe/lXeQ/K?=
 =?us-ascii?Q?tNLWwFI3XRoIpGi5h33lqj2BomjNZOcbOWreETCyNoiMxQGC18aAUXUv2xQ8?=
 =?us-ascii?Q?3+ZaJUY9v9S5SpZ9L4vbE4aQs3s7bNOPzAgP4Cg/ofq8cihQgZeE0NJLtWqu?=
 =?us-ascii?Q?x94QIhPD41yEDSP0Tb8AAyDRMXNkYSpm4QEB3DtDRaSVoj6wmUb0C4z+hYC1?=
 =?us-ascii?Q?6iz7t6/Y9vHl8xk/UsVCP6bPqPU/u8BQYvHvSvWyJGf9dTyfus6upr6uoE1d?=
 =?us-ascii?Q?IxLYbO67+Kc7iTt6W18XCmVnv7Ct28BRyBjBSaJ2ZLbLvyweLynC1shYqZz2?=
 =?us-ascii?Q?I+GyRLswzGaP7jI/rHeKGrpuf8hae+SIuESQrnr1NvX/igO9gpB3fvCXZ7H6?=
 =?us-ascii?Q?r6nWJagLhyXz/SoSyMAQtWlP52jGQ73narKJ8qg7JfKAx3MO+OuOLocFRuyD?=
 =?us-ascii?Q?5T/WUNafQv94lu7sqP4C46q3cQAhQPKIJBAehk9ZKWjf16ay29zWTR0qcUj0?=
 =?us-ascii?Q?mY6CmzKavYJZyJ/JNUCwsc2bAuMMk+e2zB7J+FkAjxKSChu6rq9zaUlilu6c?=
 =?us-ascii?Q?mUy1K8qujlUpDgkZpNVI76U7foz/LLEMb2TrqNRAUKbPCygDOLHdZYRAkdbN?=
 =?us-ascii?Q?D/tLPvu4oCLh5mI9JxLf7Gq6aIaEhluAblKZHXWYX6UNQ5HrFMKiv5LI1EIz?=
 =?us-ascii?Q?3O2xDfI9t/ka+SCJ61E7T/fo59iuHBNnwrXDSB/zTc1GszTcN7LVOqtElGto?=
 =?us-ascii?Q?2jKutIK6/a3njXQNJLP+cfJqX8UlF9Ewk00r3px1Q7ikIp0ToVWtbIhLP73Y?=
 =?us-ascii?Q?fzmT2xXMIIsLp91rsXO6xcU/luXXDJpctr/q87gwv/TjZRG8w2a+t1s2JqcZ?=
 =?us-ascii?Q?QxelQkBQcgbMDN+xjojXB3UBlE+BR5MdrEiEBTnCDaf2LUUOBrfw1bS14ZMK?=
 =?us-ascii?Q?jH5S2lmBjSm7Gnv7m4x7EJHePIFfh43B9wfpFLjBdbDGqAfx1+bWPia1FGLk?=
 =?us-ascii?Q?QxQUF4R0JlS4oaM1JvjdugbrgsjUGGKLaxtMj2MnAJgXw6/5fMumP1TEZs6o?=
 =?us-ascii?Q?/1S3TDCltG0RHuuJdOtOoz6sZb7tK2GBxSE6tsQBe3y1pnMk+Qe/dqZljkIH?=
 =?us-ascii?Q?qQF8vzaIF7uUsINk6CTpl8amE2E1l2qOR1zg6gmOodkGurm8t+SqKZ/wEjJB?=
 =?us-ascii?Q?hbxJlzYzesADXEWLnJI4WyWhRoxZ/EXxnyVDvoiKNlxFeyQ3mMEwL38zO90j?=
 =?us-ascii?Q?YiDTrmjwBuIxC/QF+d1hr2b4tVgL8IA2mkZBHdQNILSlluT28Ro44zh+ZZMM?=
 =?us-ascii?Q?dvlwSyRuvC3M4/d5bwrFTN/DcVduFsro/51Erkoat8sWiH5IsCF9Zw68t3jZ?=
 =?us-ascii?Q?cmZsXirO9fpw5uSD84+D8Fib4ZUzV9iPeWBukbhRn3/6WSlmj8c0RowmzPKL?=
 =?us-ascii?Q?/F5kLrJY7d6smT2VaNYG7Mlz8LeGLb7nCFkxJ49DxJTQzwBSlUv1js/6yuZA?=
 =?us-ascii?Q?+RqOu0Fx9rSgabemaSrgY80UTG0xI1VEnIzAaysINp37BK3krrrB8JOxgSw+?=
 =?us-ascii?Q?lBZaqhmfLxxiYeZZ3ySBmzQ233NemtsahDtK1KY2Y+Md4vrjmmDzMCmGA0aY?=
 =?us-ascii?Q?sAW2cxk+mvCLC8vhX5q8yifSEeawnhemtWw+Yv0Ng4+BtHD0G1IfXk6iGDVb?=
 =?us-ascii?Q?0YWSh0eN+XVo3nqEU+iU0+Px/dkVD7KeebMX3MmVW7miSRFUIXJctzBgP8qv?=
 =?us-ascii?Q?dqC/tLJ+/DZnKvl7RzLeYIoAW7D3Zy9YvqHskVFDVqbm4UcHti3S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66843127-74d1-4ad3-d596-08dec8c6d998
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:09:11.4472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rS7IokQLmKajnHqDNv/U2i6uEyViSogVYRXBoPf0Hz88xdjtySeZOarjnqrpHWCZnhfCqOAcdTm0nqaN1GH0ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969

In a future change, struct fsl_soc_data will be extended with methods
for performing RCW override.

Since this will be performed from a calling context outside
fsl_guts_init(), we need to keep track of the soc_data that we determine
at fsl_guts_init() time, so we can reference it later.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: none
---
 drivers/soc/fsl/guts.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 1494b545bbb4..9f2aff07a274 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -138,6 +138,7 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 
 static struct fsl_soc_guts {
 	struct ccsr_guts __iomem *dcfg_ccsr;
+	const struct fsl_soc_data *data;
 	bool little_endian;
 	u32 svr;
 } soc;
@@ -234,7 +235,6 @@ static int __init fsl_guts_init(void)
 	struct soc_device_attribute *soc_dev_attr;
 	static struct soc_device *soc_dev;
 	const struct fsl_soc_die_attr *soc_die;
-	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct device_node *np;
 	u64 soc_uid = 0;
@@ -243,7 +243,7 @@ static int __init fsl_guts_init(void)
 	np = of_find_matching_node_and_match(NULL, fsl_guts_of_match, &match);
 	if (!np)
 		return 0;
-	soc_data = match->data;
+	soc.data = match->data;
 
 	soc.dcfg_ccsr = of_iomap(np, DCFG_CCSR);
 	if (!soc.dcfg_ccsr) {
@@ -283,9 +283,9 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr->revision)
 		goto err_nomem;
 
-	if (soc_data)
-		soc_uid = fsl_guts_get_soc_uid(soc_data->sfp_compat,
-					       soc_data->uid_offset);
+	if (soc.data)
+		soc_uid = fsl_guts_get_soc_uid(soc.data->sfp_compat,
+					       soc.data->uid_offset);
 	if (soc_uid)
 		soc_dev_attr->serial_number = kasprintf(GFP_KERNEL, "%016llX",
 							soc_uid);
-- 
2.34.1

