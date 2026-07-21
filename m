Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C80B481AB1
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630622; cv=fail; b=Xbgy3aVmrrA8yE7XQlwyjNLd66A6mM3pH8GcPrF1jhfG3o/RFSYHdivdsGCaeNODUKbgt/YlBBkUKvvnHCBxj1ksCcK7uHmi3wC1Oduis6gKMJhe2w3j3y3+CklbLMMptnus9fGXTRGhIufWgIR6VD4P3SMYCr7FxgJqHjuC8MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630622; c=relaxed/simple;
	bh=s6fc9SOToUGDH+YPG+54ejj0FILCYojkmD9Snqfa64I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nlHztdruImmboZir+mlaphEGu/RJwUlr2RIUqDFcDvM8ZHNp3Zy9Er57xLVa3INf2W3dfkwoz+OFbvV6uSTebO7Otycg7lM80C1xJ/GUM367YRbigzPkuAjpk2t+8PQolAizUFQIPceMFunOvVzJGs575sXs0V9eNo4pbmdtYzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bL7vBGyv; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bL7vBGyv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huI2HSSy0W9DxqmUUebQQpyTCaqpMHnErMSpv955+bMwbtam9a6ykiKQSRH2FaIUF7hCmKeLqtTxcnmij28MY9RhUTQ7iTY3C0e5gmnO0sNFC+C67QzCI9XPNerre6cdGnEtJkqN/1vCzDnSNWUWT+vNGRktDDjvzBtIZAo/ulvE7mZ8YWNzmj61HkmcWBD5Mw6mRO0+L8owCWtr3qnaULb4OBgfnWM1ZLWtOsFoQna3bRI57+A5nJdQX6/eEwRgyShWyMy33Dad5bJgq8BuXIvCa/oT6/dVxf94lIuOd3vEwo9eNz1qI/pSgcmso9I05paXID8wfiDasmVx2Hm7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTQpKYbw0pLxVuZskOvw8nheLjaOo4A833bSVrtlBGA=;
 b=usrdpiQAo37qjkEOMnqohbF2C4AuEzxvGuVzU6CsCDe8fVMMeOXLbkO51b8Cjj2Momy7wXcaexZ4yexd6DpbynJqH9Yj3BC9AI3w8aMnNRfCZ+T7XosFSUGsU0eLaMS2ga6DxV8LmbgODESelMprQrd0/uHmlisvoEab8zltciQL8vGi8fcMqStlY1xh8oHp9PZ0r/QfuUD2CkSuErIKYnfdBrk2oRg9OMXgrl7K+fxxMYTARVwThHcWxP2W8G7GzdYtP92RB3iNdJCfKVXpclfAsC1tt37cfSiR340kxXtk0KC3+7Dsoc7btuTpLj5VTlyZli80ADYAjWNbbr7CkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTQpKYbw0pLxVuZskOvw8nheLjaOo4A833bSVrtlBGA=;
 b=bL7vBGyvhrt8b3wHemvW8Zh56X+XogKtCcdrPxTYvMzRpEPDSeTzzkIZKQky8caUtKQiKfWtbo9qrY//BRodKsiatr9ciXd1PJU+FKOwtP9khVXEDNPAgQUeS7yznl4kWx43f6K7fFO9HxPfqQI3Qg7XlIDSnZQli7s4ZppvpYROlGvwZAcV2ouwd9VxT28jUXw3KhmPttw7YBdFw0Xs5TUvSO7GuQTjHPYfur+k2DGE99sb401yZf/Rq2rD/u9wQoGr18MbOjiOghueBIvtY/9+YNEvFql0+PEvypR87NJ2/mNy1Xa0nbyt9Pl+yt7UN0xsOw/oU1F6bphLhSXNsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by PA2PR04MB10424.eurprd04.prod.outlook.com (2603:10a6:102:419::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:43:36 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:43:35 +0000
Date: Tue, 21 Jul 2026 13:43:32 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Michael Walle <mwalle@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 phy-next 2/8] soc: fsl: guts: add a global structure
 to hold state
Message-ID: <20260721104332.e65ma6tiwoisgo7m@skbuf>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-3-vladimir.oltean@nxp.com>
 <20260720135049.8AC231F00A3D@smtp.kernel.org>
 <20260720140139.dmgysphpse2jf3fi@skbuf>
 <20260720145724.acega7erguyufxd3@skbuf>
 <DK44809N7Y8I.J2Z3U4N32H0Q@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DK44809N7Y8I.J2Z3U4N32H0Q@kernel.org>
X-ClientProxiedBy: WA1PEPF00005B8E.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::62f) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|PA2PR04MB10424:EE_
X-MS-Office365-Filtering-Correlation-Id: 828070d2-83bf-4a93-021c-08dee714eac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|10070799003|366016|376014|1800799024|56012099006|11063799006|5023799004|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jvmhKzH3JYdGDmfORSPHx4LSn+uB8zhDMRuf4f9Y+U5UNbkqACy5yD+PMW54zydK/0ExpcUmqx+H1JLZioZO7QMqPnOos7lY6czGL3pGWEJPzjWI5gRhauil5EUAr7JEiy8wW6MSxtJo1ukiWkgMVI3Xnz9qqqN872GzWvuuURb4CWT0gYaVUyGDWMmOtSCUqlbpw08dJV793fW8r7ItFTQykL+sQPwSdiy6Fwc9HXb411aUbTrXz+XMu5Ejw4T2GaoOnVx2G4Yv3VELqFIXyu2ZzobMRUw8B68vXWtT802akAdy9EpdkTpEok4h+SeFc8iHtUAcrSxZpp5h/aRPiGzOZwOZI6GmR83HMjDW0GVIgVlLMw6YGZQ8mkeuEZ760vmBopoCqkGpmTMJGp/SeAj52Yb/V/otwtajf9s01K6PRLGYqx8xB4bNSt6/TYwiq2ntAAW0bl9RNmGxGfH81sAwCtplme7wR0ccHfzKuiFqgovk1QSG1ATqCQesBZGFyJgsX1jvB8yXmgw4puYW5SXGLwk1DxopDKEUXQ72DI8VBh36aLXYjMS1Dcju6mrxITCd0VapVJuw/X5ojW6O4ZLWQOy9kXqRzjZW94yDf6b/rQ112ZcudYtnqHc454HzJZN3zAFJBgs7ulv1vX42tAAT4JBBq3zvozGn7I26V9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(10070799003)(366016)(376014)(1800799024)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vKWvRt7DwYoKqBupBldghbcFdAyZwLM/smRKJp7mOyTElaRFc7O8l89tmefN?=
 =?us-ascii?Q?DCdt63SdybceguqVzKk1Zb02RJbFcLRtuM9SenHpn4odF6DVPtXAHFMo6TmQ?=
 =?us-ascii?Q?28h1+B/QolbCHB95mKCyjbYOkDmpa1eXR0pLUKBZn1NE724ibd4s3dY9RMx1?=
 =?us-ascii?Q?yIOldJjeJ5phsnzGFomfA+mQ3cQ1twdbZ7ZTnqp2edlihvXBdmbLB/lTtH0E?=
 =?us-ascii?Q?9SVOjyec0G7fNLmFTgOlEIagqhpJK0hoRkJu9Gmy5+aq22Ej708Qaci3ct2R?=
 =?us-ascii?Q?Pih7eY8BUu0mefTr3jP4UzQVxKR3p2nU8gqT2xePyTtfVTse9TLAItVNJk47?=
 =?us-ascii?Q?WaoePnrO1GdOp9snNgpOAh3aY3N+o4ea9DxVWfYS8sTu73GxnaxfXN+9I+XP?=
 =?us-ascii?Q?n8ZzpDIxHG9UYrA+y2bTs03A6nDeKMsxKt/U09S2S5dpbLW41M39HKv3TrcN?=
 =?us-ascii?Q?jPdi50NyNf3JJisX/w5JStiOHae+pHS0sQltZiTXjRyx1OsyjB9+1ptu4NmR?=
 =?us-ascii?Q?Bo/BJ8mkJyQIXPHrqPZqrVXWBE6vXfiZYNynlMSOcf5vKvWTxFmNG1ds320y?=
 =?us-ascii?Q?kuCMQs+q2LZp/9IUG2wJ/m5Bn6z/Wt1rRHZ6ioOt9BuElRLQhBvmMIG7p8TL?=
 =?us-ascii?Q?7fmFEIfcHb9bAT7CK3puYg0igJO32NT4Gi3VgGZhlEkJ9v40rUhcbgrKS2ul?=
 =?us-ascii?Q?Qu805owdXei01GpXd5AH+FiEP02Rdezo9XAxdYInKn2lU1SFI/IiQRweTDPx?=
 =?us-ascii?Q?PbK3VMbOHHthd/m8c0kg/Pv9gXAyULrL/I8b/sm+sJDLGlr9ltEzHtCQMMiO?=
 =?us-ascii?Q?jPI8TmKR6tnO88B8B5heDUJlsk1qnK6AzudP0lhaTDX0KmmyB/lry3BIaPaW?=
 =?us-ascii?Q?UTWGdX6wxmtcR0XAYsMDVjJRmGrrq6KERk85IZulemKBuPvInYTnVdOii7nn?=
 =?us-ascii?Q?LtYa5gvojT0aBSczJp3cGXY1k4F+yx9O6e30UDR5ofDZDC+mobJR99qi6Cx0?=
 =?us-ascii?Q?DkwVa+cFm28jRyKYF1NcpNHD4Ah0f0XsIPtrppotKhqeCl09ry9gp3QoM87+?=
 =?us-ascii?Q?7UFLGFLZ5C4xL4L4VhgwnR8uPhknoSou3UcWyG6Q1d+mg149sz36MORk4fCD?=
 =?us-ascii?Q?Ow+7TosvH5pEPdfvXiCXqQhr6z27pljga02o9nRkXg9fJLT2XfGpR01cX2c/?=
 =?us-ascii?Q?zmVc4KkvRuRcGExb4iltf1t/dAY7NlC5hxNY39/1O/G0nVcS6VqcwL4w543/?=
 =?us-ascii?Q?Rr5jgPI8eFg9p3mYQk9bq6IUf85pOj/deIlnscMXMgs8ZCo0Rv8d913iTXoH?=
 =?us-ascii?Q?qJ2ESpJNLHacZ7gBooTYPpDCaDQhR3M9ZWBN5lOBJ3yafKp8leYdMiQHuqSV?=
 =?us-ascii?Q?TeFHKzm7sMOcvhDQBwJIRholILbke6uPHyvyJL9vAVjg8rwjh9rJ+7V/7C+b?=
 =?us-ascii?Q?3GFQ6qDUbgLvLB7TBt8Zwg/ZNjYIzUxfcMe5pqPCzoFsPlfbhJ1I0F0mQyKL?=
 =?us-ascii?Q?IrmHVFn26FXoTjsWwo/lGUofrLf7DWprRJpXGeFfHDPC+LPY19SQSNSKXhXh?=
 =?us-ascii?Q?LtFSFjOE8noefVz5Rcm6bWTeqaZEatc6T6A+bpmgzJc8E1l3uswkh4rpj0Jl?=
 =?us-ascii?Q?8OxiCAvNm0qALWhTSEZb7UylQa9lwlFpP8GFu6q0bbP6GDqsaXdokqLq6aUw?=
 =?us-ascii?Q?R0mzLoXe6PIIuvo7gb6JPBO+R0zrZ5c7147qAJFSDtzkACohpvECE7l4ejXS?=
 =?us-ascii?Q?RMJUaLuvHkLNZ9G1h1hXfmMhlJgUWFuDMhK2ZbuiXWN/WWTU7dEXfIw+YiMD?=
X-MS-Exchange-AntiSpam-MessageData-1: 97Zx0EshXB1tj5fB9heCcllfMwDE/c8BA14=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828070d2-83bf-4a93-021c-08dee714eac6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:43:35.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmDFTSIFYnWUavgy3Rxsxq0R1tk8aMu8yit3cIdniOgO8fWdrlI821kkC9/SLJV9023XTwszoP0ibHDS9FAEoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10424

Hi Michael,

On Tue, Jul 21, 2026 at 10:44:30AM +0200, Michael Walle wrote:
> Hi Vladimir,
> 
> On Mon Jul 20, 2026 at 4:57 PM CEST, Vladimir Oltean wrote:
> > On Mon, Jul 20, 2026 at 05:01:39PM +0300, Vladimir Oltean wrote:
> >> On Mon, Jul 20, 2026 at 01:50:49PM +0000, sashiko-bot@kernel.org wrote:
> >> > [Severity: High]
> >> > Will jumping to err_nomem cause a NULL pointer dereference?
> >> > 
> >> > If the allocation of soc_dev_attr fails, the code now jumps to the error
> >> > handling path which dereferences soc_dev_attr to free its members:
> >> > 
> >> > > @@ -269,6 +271,8 @@ static int __init fsl_guts_init(void)
> >> > >  	kfree(soc_dev_attr->revision);
> >> > >  	kfree(soc_dev_attr->serial_number);
> >> > 
> >> > Since soc_dev_attr is NULL when this allocation fails, won't evaluating
> >> > soc_dev_attr->revision and other members result in a kernel panic?
> >> 
> >> yeah.
> >> 
> >> I tried to be nice and play with the existing "err_nomem" and "err"
> >> error handling labels, but the truth is that a single error cleanup path
> >> is just an antipattern that doesn't scale as code becomes more complex.
> >> 
> >> Instead of having a single error handling procedure which needs to
> >> carefully fend off from various invalid contexts from all the goto
> >> sites, the standard convention is to have an incremental set of labels
> >> which undo just the setup that was done up to the goto jump site.
> >> 
> >> I'll refactor fsl_guts_init() to use that convention for v4.
> >
> > While I was doing this refactoring, I noticed that this code path:
> >
> > 	if (soc_data)
> > 		soc_uid = fsl_guts_get_soc_uid(soc_data->sfp_compat,
> > 					       soc_data->uid_offset);
> > 	if (soc_uid) {
> > 		soc_dev_attr->serial_number = kasprintf(GFP_KERNEL, "%016llX",
> > 							soc_uid);
> > 		// no kasprintf() NULL return code check here, unlike
> > 		// the rest of the code
> 
> It's a long time ago, but it seems to be designed be optional. In
> that case a NULL pointer check was omitted, because nothing bad can
> happen anyway. Either you'll free the string if != NULL or you don't
> free anything.
> 
> > 	}
> >
> > 	soc_dev = soc_device_register(soc_dev_attr);
> > 	if (IS_ERR(soc_dev)) {
> > 		ret = PTR_ERR(soc_dev);
> > 		goto err;
> > 	}
> >
> > proceeds with soc_device_register() even if fsl_guts_get_soc_uid() was
> > able to get a soc unique id from the security fuse processor, but we
> > fail to print that string to the soc_dev_attr->serial_number variable.
> >
> > I don't see anywhere mentioned in commit 786dde1e59d7 ("soc: fsl: guts:
> > add serial_number support") that this would be intentional, so it can
> > just as well be an omission.
> >
> > Is it OK if I replace the silent failure with a loud failure of the
> > entire fsl_guts_init()? The code executes only if soc_uid is non-zero
> > anyway.
> >
> > kasprintf() fails only for memory related reasons.
> 
> I don't have a strong opinion. If you ever get that error, something
> is seriously bad anyway.

Thanks for responding.

I think the optionality is already taken care of by the "if (soc_uid)" check.
My intuition is that if the guts driver decides to try and populate the
soc_dev_attr->serial_number attribute, it should try and run this to
completion.
