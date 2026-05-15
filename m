Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68776327BEC;
	Fri, 15 May 2026 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837017; cv=fail; b=mHXbhXktrepEAEZFTwFgSp4Hj+SorC48n0vD0T6GgRJunejMKGOLPZyisCMOcpclii7+AHlmRi82zQmimLHt07a79XP8y7rIOps8wXODFbLxd2eP3gWpNGpgfsoToU3RISd/94AdzxAeb+ACmqiNWWkxY1BaGHP7JlGt4Ogxe20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837017; c=relaxed/simple;
	bh=ulVPrjuGMzcwWpm8WPoFkaOpvYiMNHBg3215YsPGHCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gHxPLXBylszwvBiJwITES8MFL3WNMW4c+CAXYAXNUQUdfLW6E56bvVXBa2ZmJA8vyj8O/JzmK/4OvAk1cqxHDrFjGUAi5mnzC81ZwPhle+y8H0YtynbUAaN/tVtzTedXJVmc052vJ5pFix3JpC3wtgqwCPrZQmr4BBdsyzz/KmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VJwKI4rK; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VJwKI4rK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNRXboDM4iRUSTCR/Y6lTVgJCF3nFowvzdJ/Dwi7JvF29Dx3a48ZminPZu1iYnTLAr5us9Pvi5cfqZn8XCRRXo5PRxjbgFPJOa7mXQH/j+87DoxU0qvqhki4VEhLcWRsrgtlnl3nMqR7kk5LG6CzMi7GZ6SJYYJfDSFBosuClFnwcnrj2S6ChVAHEBCAZk33am+UAuYjtttcCW57zhyquPgvKxMh+3sf3inJyx/YTjAzvP4/FxnRBgT8sbm/pkR3seQwdWDXTpf/ys97HhZ7c8tL7BYr4cLkprHEu2pCWt8joTgy33vDhDo5EzP0dmV6k3C+c412RCmgc+xUO7Ectw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CENLJZTPzr5ufZHoPbRNS8lgPWkF1Tek+F8XcZ02IfM=;
 b=FqZNe3zNUfD8Z/M4IcOr8gmndcUWPNkQ9suZhHp7WjOaQCtmXsIC00VhXizM5rlQ8zCrxygJIgnaUU7ndpjj4i78VitfSliNCHybw4t+UxBGmiZqgZZAi4ntU6ZxYJdICGPV6DtEuf4gGXnjgbikbHuF3ExwVNiIJcq64jhzM2JpProv0ranEyGMvCeJJcdGQzNfaxL3x9/vSvzOjkBH0qROVPhgCtxGRv+umY4MfujsQigalvYbFpaaBtZW7x6RMKuU/fECXmFOOTXYnHRE7dxieiLIkE9CREE84yXeh+vWWCxKkovFj9oCIrS86sLfH6d1I1WrpqjiPmL1UeJJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CENLJZTPzr5ufZHoPbRNS8lgPWkF1Tek+F8XcZ02IfM=;
 b=VJwKI4rKk5u78hdre03BdIFaAs8vWuzPRuh228m8Z9XottjI/DMpK8oqSHByUNLYjHa0tOoWMv9TdfjFxOY/g/S4y8SDcF43F5w8H07uAWpwjJ8POAhhysi9xbGeo/dWO/dUauTLD3gxX7CgyI0qELYVoRalbrALiNoc6egU+t+H/Dpkm/FxptCeiFSGQXb3nr/jTFdu+bGT07iN5ONHXfcfbo4TYIGwkCNsXlmNujc5BSQD+GxhJ3sSztaegnHQdo7ezTsvY11L9NW7Ybzquu5Nu96EHzyMFKk7cyetTiLCiV1CH6zUNUnuy/Cwl27+eWsssEJ3fG5FSTtxA9gGmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by GVXPR04MB11479.eurprd04.prod.outlook.com (2603:10a6:150:287::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 09:23:33 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 09:23:33 +0000
Date: Fri, 15 May 2026 12:23:29 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH phy-next 1/2] dt-bindings: phy: add PHY bindings for the
 TI DS125DF111 Retimer PHY
Message-ID: <5u7a5lwvfgrs3gx3ft55adwxq6eut7c65uzd7cgurnimlau2fw@bszb4qna2tvv>
References: <20260513185103.1371809-1-ioana.ciornei@nxp.com>
 <20260513185103.1371809-2-ioana.ciornei@nxp.com>
 <20260514-scorebook-uproot-c9766b3e1be4@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-scorebook-uproot-c9766b3e1be4@spud>
X-ClientProxiedBy: AS4P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::16) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|GVXPR04MB11479:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f57f99-454b-4126-c1f4-08deb263a28f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|22082099003|18002099003|4143699003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UoRhjJCWbYoiCS16lwLZHdorSGUeTVqBuRvLFNj0FlHketp/hmAyRxctFO83/TkWXYCdYEBWzj0z0wzPMtNBIeVtHu3tvVFq3FfzAwN7DOdPnFm/0ZfL9gIr7louHeVxG/ylnt2GKdjkJMNyucOP65SkyVCsNJjBua8ojN+Lr5waNWdVajS3CzTD++qsW0ilzOwVJUBwRy+MaXl2HjkgdlT6ax/t0ATj2hpsAZoyNxJTaHEGHSu7ULI1UeNS1Amr9KYE3OP1Xt+Uz2hv8tw+KDUdMgOKGJd+d+KCPC/+GJZPOfg6pckiXsk1ffdeN+vAXqvq9m+bJDq9k+7Z+rV4Ghr8e3aj3Z42PfI/RIUB8Wd/f7cwPAg7eVeh6pIyw0FtBcYnEqVqncPAaAo/3ASwOMXbvFlwz6DmNvqRI3t9namGDnHy/sAVCiNqHOijlhoobeXk7H3KQmUU1Zy2usQ60+8Rm5p6ruT1AqrnCAJfyw1A4tUUNepsfjzWXSNzxXcr3annHCR555xBbvirLfB22va10J2MWnkqMn2m6nmjc8WMvjKwHIKWXEeW8OkvjqZUHDt6NVQhfvk8rXP1pitG5M3A2C1bRJSek9tsgMszPOBOPaTKvOa9RuojsXs0xgzmqAZlK7Ih5wHSNwzLkaCqV6ThAKU+tBMY/iw5tDll+D1I2pBVi3mwySX7tW1YhGTQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(22082099003)(18002099003)(4143699003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tdllSNM6yj/JVEVD5XS6Y/mpkBYg3aGesc8sAtUzksNJo+IGCAZDtFCPtvym?=
 =?us-ascii?Q?t//RV5Y7eKvy1mBI07kTRfjTUECsejLm6TbFHIcjX9Ukoqn0XvZt1PoMADcW?=
 =?us-ascii?Q?GfkbxVXdyADEhD4KCdl1WTAWrOxpnajlJ7JSUMxLoM/2lroBobIzOymJB2Q4?=
 =?us-ascii?Q?5M7/jqvEocBhOAV3Q7D1jFgQqo8ul0JC5UOl7Lg2UcVkQ4Oa+1UH2SVTFb75?=
 =?us-ascii?Q?pwJHCzd3fbEX6tDBhs/mabzNDu2zTtcE6RKSKP7NhVht+xvEwbs0uGK0GLGm?=
 =?us-ascii?Q?aVhr3zjUifpYGgJRp0NDqq4d1TLV5DdyQ+jq/4+9HeojPjM1KA+C9xIkrdCP?=
 =?us-ascii?Q?3XDzk8UYydSEExRCoFuSyNFgWGka2tmffTJje/NISz2tRCtzU1tg8vNi0/qg?=
 =?us-ascii?Q?nnsoo3p+kMBclMYZ2U18H0SSXE490tBJQ9FQwiD569AGodLBD5QzxyW3VCoC?=
 =?us-ascii?Q?yA0avqzoXYFohh2mzwkm7UNrYJOMUwYIkeCxpnKmN29xY28yKYiYp61Hw6SN?=
 =?us-ascii?Q?2PY4LFZkqdfYO70QtF/4aondDsd6TU/8DIhzLTODMnCAcKHoLZUNY9s36zQX?=
 =?us-ascii?Q?l1H3mUD3stECMW3CPulWBYtjRXoGoPaA50CYtS96sc1vGG5132cdb5/w0AX9?=
 =?us-ascii?Q?F9XeE0phEIIFS0zq3o/UCT0j46J3qBN9UaNVhjSbYRqheTNO3j1UTxdZd7f4?=
 =?us-ascii?Q?MQ59WXtCaHs+jwwXbTVFEYTaSHgrrRuQWAQZdKHnyZ5B+8IiyyAOQ9NyPKZL?=
 =?us-ascii?Q?9uWAmRcJb9huFQgqNsyISlpeo8bfU4wIz4ke2n1s20NOTv2NH2ebE8rM6aBL?=
 =?us-ascii?Q?biFxxAJRx389mwSV19VfFFWoYQUTAz7eIFJU4ezn/E73U9y0FjrkSq8SW1xZ?=
 =?us-ascii?Q?0F7qufChktTB1ncodzHHxRub9jBwkehFOZ4efbaMKq6sS9E8VOeutfgTbT9Y?=
 =?us-ascii?Q?azaBOBHUR9Zmym0LGQuSgSzhh+ChDGL+g64z92Ddw80tamkmWtD3cdpdQzPa?=
 =?us-ascii?Q?BcJYkTJ0j9+7Snwz2QXIj7wddCsq4H3ZRMAsUqk+JMXqJR6cX/C8+Q+X5Pqd?=
 =?us-ascii?Q?0pewPHTK8CeTfLeMtKSY0R2k7GoKwvtU1aebPpiZANlVdx6mWdMKKZwkgx41?=
 =?us-ascii?Q?Z6u/vP8ntibUgL/7n9JNS8abUY2G/QyLvNgAkjAS6Oi4WqX8CwTGx6yeXFBF?=
 =?us-ascii?Q?yOiGjlBISG68jRYiVOuw0qEHOJnFLAqX1qSoitBA6JCc3KirT/k7iCIko2Rs?=
 =?us-ascii?Q?jnB4gfU5XMqHsP250gq3N4R/OnirgrRb6appVp3+n8u7MP5tTeBUeQQj4NdK?=
 =?us-ascii?Q?qyMFd/36jy8jIf9gREkH/MKHicG/OujSwFUeQbXMVsVyPcbEf+An4XXaR5zW?=
 =?us-ascii?Q?JeiR9USOQJPFzLQaijjO83r+TLviyNDpmp8YGp7GxZYN4OIv11HK9ky3Oitw?=
 =?us-ascii?Q?ihDZiqhn60w7agD7Aeo75NFsjhIl8/UpzGIH57wtiO2xSCDgoH39CUe6Kq6C?=
 =?us-ascii?Q?8HvJCrSo8DHu0BXJ842aSnYRNFS5F0Orz9hOhjIebhVFBzrUrx8uqn0s3dC4?=
 =?us-ascii?Q?/8/lML1EhtBcwUhNmYrzyvoanzsP6h8qLt5fb8/gQ2lLM507HZId4wuzXRsR?=
 =?us-ascii?Q?keJdui7ZN1FY91V3pIPH54iDbXU1L0qwmVtgB+ZoLfheVtc6bXoHkIpcNvAp?=
 =?us-ascii?Q?4j2Q/Ouf62t3LqB8nJZazF8lV326hSXXPWb6nhuv4X+EsGerUsWjJodyg0T9?=
 =?us-ascii?Q?PNO1ScxnsQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f57f99-454b-4126-c1f4-08deb263a28f
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 09:23:33.3787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: US32rWN8Ff5P/DZYVomkJeEacNFbOxN4SlNq6s7Awodn95PqkW0wLJ8awcPzQkvupZj7CwqWSuu9NVRhGYZtZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11479

On Thu, May 14, 2026 at 07:09:13PM +0100, Conor Dooley wrote:
> On Wed, May 13, 2026 at 09:51:02PM +0300, Ioana Ciornei wrote:
> > Add device tree binding for the TI DS125DF111 Retimer PHY.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> >  .../bindings/phy/ti,ds125df111.yaml           | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
> > 

(...)

> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      ti_retimer: retimer@18 {
> 
> Drop the unused label here please. How come the node name isn't phy@
> btw?
> Otherwise,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: changes-requested

Ok, will drop the label, change the node name to phy and add your
Acked-by.

Thanks!
