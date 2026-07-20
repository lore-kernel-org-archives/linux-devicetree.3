Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013036.outbound.protection.outlook.com [52.101.72.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29D03B995B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559452; cv=fail; b=IzBEbrDhFXpY/plrLQmXHkfy3cPmmHuBquejEp/bSyp7eGgNgb2qCkt/msWM4Ho4Zw4jN1tbNqP1u0tRocSRLB54pjJK9geSkYQJNhJ2H83f5wnrQLPQP4EPVNEFUt4IDkapECRPDIM0oSHjq+prYg520d8WBR3fl4m0FswtAyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559452; c=relaxed/simple;
	bh=VoVT9r4xoT/IGF5dEOJlpwed222uz2D/jnSwZeCn0W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n3TkD8kKSbjM6hNaKcAtp9NwhlFlI7hbuK9Ci3CDhlYPHab+TbReRlRoOEDS4SNZrqRAsLaOJ4rn2LhrvIvw8P8P0yWFoXpJ2K7t3wpahUm68yfA0vacoJmSS6WnBpgr2xsgExJ8PPg0es/xvgyNz8TdswPVFlS/FQTNyPJ08Tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dEVNBbO4; arc=fail smtp.client-ip=52.101.72.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dEVNBbO4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2mM7o22pkB5amZjnIpT2W9CuJBJIg7t8PabMAb3Cs2Ko4NyMcLM19MyFpysBKp6M03ilBmthqaZ+F0OSGDuZINQfechgDaukW5Cy6GDx/ZzH1wt828LNOwtVg4AtmiawEBoK6MfbG6yOKzeu0kwRpX2b8Ru8g8R9psQwuieB7zWAAzu8Q3QINwGRm3gOIE72Fa8M6liCn28htGwDTUmMezQjJn6xhVgPZ4iDP+s7mBIP4vOcm7tagtzdDpzqYTm9+lWaaT8hhb0hZPAbHN8dso7k9BxoD5GEmWcja/B7muMcPaAL3yyrly0PIclSjJRhexPk0nP9tMsP7jSMf/9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yv9PIe++i16DnL8tjAVtXOo5deo5HLD7RrpktsTxaj4=;
 b=fucWZ46JFFxrOw9MKF3gevfapB+in+EWQ+3EZ2e20lwapx16Co+l4kh9Oa8oZvesvwzBihGFem32q8MpO9MBe7biedbTAufpKsCm0szJL/wGSKoDCfayY9tb3N7m4oNt8JniIq6T4nOqOQ6j0VC7a/OKQiaPfVGwuOGbtTm8CigsNQml14s2fZ1scnr9jED5aUiLDynuO6Hjin1uqqaAmbcQR/+nnqzUMuKrQvNKk0NbiFL45Z7glH3xCpVHZiM3/vkX9eZaTNImRf39DrrEH4weZ3wPuy8Vb9N5JSFEDJZ3UgGZKVII7IR5UCL30rhGqSoh/bfCmNqXOUEimhjhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv9PIe++i16DnL8tjAVtXOo5deo5HLD7RrpktsTxaj4=;
 b=dEVNBbO46PevDObQdbBG0vnywmGCbhENM6QKMqMoQ/rd86ciTtg+nqYSJY2dGZEyS63uTLQ5enuM0o5Rvt7QgE3KXaHAtH2sj0wMs9tDCPaZjUBIUiAMHWqjKWWK3xg+vJ+KefAbwWrkCjRKAgqc4uRaZ2N5wzOV3FkX3JenhOLTjdpMWFJAEYTUUCgwbtHxuqOWpihmF3+4XqJrQU3EysIiK3fM5JIP3whp6K57gd+dIoSrWUxb+oLaDmdjEYKQ5bgYlLYTfzJgDUZJXiDS6SJ2GM95RhxMk8pxielP1gCd3kIOv7twEQ4EcTAliMQSJd65J/HAeA4yc2v+9yec8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AM7PR04MB6999.eurprd04.prod.outlook.com (2603:10a6:20b:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:57:28 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 14:57:27 +0000
Date: Mon, 20 Jul 2026 17:57:24 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Michael Walle <mwalle@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 phy-next 2/8] soc: fsl: guts: add a global structure
 to hold state
Message-ID: <20260720145724.acega7erguyufxd3@skbuf>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-3-vladimir.oltean@nxp.com>
 <20260720135049.8AC231F00A3D@smtp.kernel.org>
 <20260720140139.dmgysphpse2jf3fi@skbuf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720140139.dmgysphpse2jf3fi@skbuf>
X-ClientProxiedBy: VI1PR08CA0262.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::35) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AM7PR04MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 1099bc93-b6c2-48f9-1a2d-08dee66f371d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|366016|10070799003|6133799003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xHkpWDZL1RDtlMWSAOZWRM3mJUTsJJl8JQ6EKdhOXNgG9S+fBrjDj4Ds7SshgRHi1VnFae7CDZTirUkup7E+0MyfiIjRwt50xt+iKDvpmMXbT2BOfDG3bWp/mSYewe2akODq1tOj3etGMf4kxOkFj5zi0lPzA/FREjhih1IbhHs/AV99IOgw30mBPCO8I+Ivzvwjg3pL7bQ5JVcgMLnqgvr6G7j3GiyLu9Y619yOOqIpxKwwc2e8O50rdGlQUCE+COYOUHpYqdzsYlVmnvybHlaQsXJgwti4a3vnTvON0mbtYVKdbYzdYOQn4RN9g+4wLJ3pfPxof5LkuqG8AOAeS4o0sQpvO53yM0TUdFaECnO124NK0AptBhziXUTm/vHtXUmXaKX7XAWTB+uHgUuFZhm1RUgl8us8MEAYdWI9X5ahxFytPkRKnbIG49BtFNHPbogGPBvH06ZaVtLQFpGYHrI4nmhtyiRzWmEJH0jFxEtfj6MJJWy0yf6hOu3ndZfTpnyXVnvpECrdzQqaqqIPkZE4NCIaF+JohSAAP9FZTAbMhvS3FsajM2C88uSBqJR+P+UibXGsxcwamNAzftF82y4BHiY9z375GlcFbMiVjcY4AxTnrUj9NaGJ1uieWrSEZztcJupAT4CZRRrPhfjApXpzfEFICZmCaNBpJVGO0M0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(366016)(10070799003)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0+BuJpbUZxU6gOW1mEz4qxDdSmejnCgOQ2/rLXM+UVtFI6zsZaLWaADhrBxL?=
 =?us-ascii?Q?w3602BS/MyWg8NPtZuGXHmGxFGS8d+BEsplFYyYkZBLhHxtL9lBlP2AlvNMy?=
 =?us-ascii?Q?FQ8Ft5c2taTYstJ/6L0rZEzGDkv9gEcPN+9il+oNRYTEjV7eYnH9anG3WA41?=
 =?us-ascii?Q?GnqAq8YPTSAQXPH2j+hFuecTETpJUtKJjkJKSeHp3nfYBORC+mD8fntg0z0I?=
 =?us-ascii?Q?yPLHCIQCofHg7RgkxTUCaYvzUFRaVZFChL6++w+uIrbXWsMQytwl2Y571WSA?=
 =?us-ascii?Q?PtBRqgr0RKgsPnTJ6Qx0zF6wXstNw5/YMTh9PHZKlr1XSAyyc7CMz8hLsxkR?=
 =?us-ascii?Q?U3rbhS5RrfGTEqXORzAdDyyHT1PxS7FEuz25YJNh8ftk8uM3/G03yLfjR6e+?=
 =?us-ascii?Q?//JQjFs9Xg2utDbi9FD8bnYhT1c63+f9+mv7ZDi0mDFJL7ayjT/MWjz2pjTq?=
 =?us-ascii?Q?oEKc8kP5Avg71MPZpoMCU/OF2qwkRoCH5+BOI6G6vAsluJWy4wDEXhPN27S9?=
 =?us-ascii?Q?KoETlE1x46UmS0T4jnwr/xH7AGayhzXt01tk5L9caOdW4v2by9tAeJCRIgy0?=
 =?us-ascii?Q?Sey0G35MzwgN+O7HY+XMwn+yOJ5/h4fMSkkKz4uEM5F0u1+WG7i06NGJ/gAo?=
 =?us-ascii?Q?DZajyHLA+b413I+7QZ1Y77YR97kaMjYLsIRVbpWmLQ2TyNi07K8huZbMhyAZ?=
 =?us-ascii?Q?/YHTD/tQSwlEEuklgEjzGMgbOstul2zjDEwM1FxUjhXHwwCRQGSYQlW7e3QW?=
 =?us-ascii?Q?5Af1+3kY/LEz9qy68lKTnnz72SseZSJdJSnmGpGKSwvgANukol6UBj87KgRl?=
 =?us-ascii?Q?PUCd6q9MOoHE/e0JrCLNdnF85hZtSaZ+xYkeorvDjuhctf3gI2aS8lxqR1Ly?=
 =?us-ascii?Q?/6NqdJTwLS84my75sldoR45QaBOuSvYa/XelTk2BgV3TuZD1sMRbEgLgIvPU?=
 =?us-ascii?Q?909WToOZht6FnfaO+CpcMJt8R8oVVbxJW1l83IwGTYTFqK0mJWAJziLDm6GX?=
 =?us-ascii?Q?uqOjAexIoHT1E9L8OaK91eF9DG7WmWKzdq9n+s1mJ1fygQeYLJ7ZZRkfMv4f?=
 =?us-ascii?Q?JxxIArjl2mU6eYKKIHgYlGtRrxddRezinSQ1jg06cl2K8XYiEG4cWyh1eu0v?=
 =?us-ascii?Q?nFS5HD4+Yfg3HTPQyYXWV13uHuN7wjJ2FQJsFLYRu77iNEDFVnk/gCqVCAmj?=
 =?us-ascii?Q?wRabrstaLmvFFKuylHXBrjGDqdTIAmMMbAJ1KcB0qyb59v38s4J15Hwz8nag?=
 =?us-ascii?Q?TTBMRG4jBHavsiUrzh+9kRcuFxn2e3/fsX4VdSjL3A/OSaVyuCfRR9myPvap?=
 =?us-ascii?Q?OHSKb4uziDFzU95g+o2djtWTEeslSyouyIKlKe2UI8T5tMJlrkH9fIG7xUI9?=
 =?us-ascii?Q?3bgUJOq+EiQQXEzKP4x/JDOP/Q7bFqASBJWczZUYtJ77B/dEOKBxlRPR3EqA?=
 =?us-ascii?Q?Xs5U9LJOKebjWpUguqveOh80L/Oufx3Btn4S+ybKEnHoHjkueQWGJoZFdz3j?=
 =?us-ascii?Q?jRR7z8oYSkUi8mWYTs9h56mmKqz0BtGXJb5qOyNPmYW22rHi91n+pbm/sWkd?=
 =?us-ascii?Q?FWneDYxf1ucZrwqVskUX8WpCGsJzFKixklMMlSE4Cn5vyOgKbsOG3+c7igAx?=
 =?us-ascii?Q?57D3R9wqOgZrm+MgJJgdhcUYxxtU58Vb6e1VFJlX8Kp23gBCpq51vkJdcaZf?=
 =?us-ascii?Q?6iMhP3bXTkL6pIX84koaqZo9O44VZNrlOeUAai/gyoAHoKA2sxejOYrpde4i?=
 =?us-ascii?Q?BKWL5cxI6WN0ja0LWDcHtt2epI217Z83GCNgRjY1GAxt0rtfcTG6rGEsWMiZ?=
X-MS-Exchange-AntiSpam-MessageData-1: GSWdXoowkKZ69Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1099bc93-b6c2-48f9-1a2d-08dee66f371d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:57:27.8241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dw89u3X5X1JcXx7qVHrz5W+sSCGYso4Xt8Kjo3w1zJXfL9Y4ApFBCwOjqtijunPm97oXOwOgSJrL0/QlGfUBEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6999

Hi Michael,

On Mon, Jul 20, 2026 at 05:01:39PM +0300, Vladimir Oltean wrote:
> On Mon, Jul 20, 2026 at 01:50:49PM +0000, sashiko-bot@kernel.org wrote:
> > [Severity: High]
> > Will jumping to err_nomem cause a NULL pointer dereference?
> > 
> > If the allocation of soc_dev_attr fails, the code now jumps to the error
> > handling path which dereferences soc_dev_attr to free its members:
> > 
> > > @@ -269,6 +271,8 @@ static int __init fsl_guts_init(void)
> > >  	kfree(soc_dev_attr->revision);
> > >  	kfree(soc_dev_attr->serial_number);
> > 
> > Since soc_dev_attr is NULL when this allocation fails, won't evaluating
> > soc_dev_attr->revision and other members result in a kernel panic?
> 
> yeah.
> 
> I tried to be nice and play with the existing "err_nomem" and "err"
> error handling labels, but the truth is that a single error cleanup path
> is just an antipattern that doesn't scale as code becomes more complex.
> 
> Instead of having a single error handling procedure which needs to
> carefully fend off from various invalid contexts from all the goto
> sites, the standard convention is to have an incremental set of labels
> which undo just the setup that was done up to the goto jump site.
> 
> I'll refactor fsl_guts_init() to use that convention for v4.

While I was doing this refactoring, I noticed that this code path:

	if (soc_data)
		soc_uid = fsl_guts_get_soc_uid(soc_data->sfp_compat,
					       soc_data->uid_offset);
	if (soc_uid) {
		soc_dev_attr->serial_number = kasprintf(GFP_KERNEL, "%016llX",
							soc_uid);
		// no kasprintf() NULL return code check here, unlike
		// the rest of the code
	}

	soc_dev = soc_device_register(soc_dev_attr);
	if (IS_ERR(soc_dev)) {
		ret = PTR_ERR(soc_dev);
		goto err;
	}

proceeds with soc_device_register() even if fsl_guts_get_soc_uid() was
able to get a soc unique id from the security fuse processor, but we
fail to print that string to the soc_dev_attr->serial_number variable.

I don't see anywhere mentioned in commit 786dde1e59d7 ("soc: fsl: guts:
add serial_number support") that this would be intentional, so it can
just as well be an omission.

Is it OK if I replace the silent failure with a loud failure of the
entire fsl_guts_init()? The code executes only if soc_uid is non-zero
anyway.

kasprintf() fails only for memory related reasons.
