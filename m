Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82AD2D1916;
	Wed, 10 Jun 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100364; cv=fail; b=ajOLFKq5NGZoAaWFyvnbeRM+lXd4lQekewkCAxfoRcceBmdHP4E0F3z2On8lDrM0tEX/WZgHkTu18GZgZoq6Ag4bst5Rphxfa/88Cgmjn58wILVggvxxK72yabMYUIHPSAagCYzhEeK/qfwigNIwCZOTS87B0DxqjGpjCZ9W+pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100364; c=relaxed/simple;
	bh=90rLTGJU11QiQibFNdv2HGG8uITZ7folhn+IoffGYO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n04tOeTGZswJllPT+bzbVkyKv9QZWlSOwjaEVNuzeuMyiRpfKHEC7EJbBmOXmQ1jSiXVWWx1EovkQ80PpLVFf3RcY6HPIpnJ8A+HuD9V4qe/s2q8ooXCKY6W/mHCo9q5+iVR6SDpVwTxJDi2804gKwwcRZkVbWI/NATh1NarK9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lwsRomPh; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lwsRomPh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=or9Roogy56MwESAfnrYLFpNIP8ejtpKBKW8mMg4G17mI9o95BW3ckwG67HA+sXIQYgC9OCGVYP+6E6ET3UZOzTlQD8Ir+FkM4/0A5/Ik6InI9iaU4XyAQzBK3zibsfh9+Dm30nDoJKnQUMVhfW6GIIIAoVCJ3E+O/K8p2MmhiB4totkyz1Ex0edlj8gUDZB0FgHEAaKlKqQb5NcT6D+i7S7B+jVo88EV5A6bYWVCF2/cXp08ltObRdK4GP2s8lDjfgW2P9N4Ltf9YjyNHb6ewiCzZ5gFHc2JFsa8lcvQx8/dRbuRh9NPNKdJDnxJBxKP/uxQGbnTryt/Fc2V8EHnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtLy4L2P9pHzNFpLHzXAwDxTI3z+Dwm3yP5mMkEJwQc=;
 b=vjVe5VDjueLXQksOeEMjGGbGVh53+YfFftSfsOF+c1ABfS4jVw6CLbm+as3drXZy4O1D+nTu0tz7Ma1l3df7aJYmhwf+PwLBlIW4okzC0qU/cYUSTQHqxoNp41PPhvrBTYZ/Y10K0KfXITGlJAZcEJu42igliNIq5pqiqJO2ejIdTstFV4nLClz9D3xfzu8eHFc5nL7A6sYf+byrKPywI8QaMKEn6CO7txcnYovEnfSqZli67dPnnCdDLCQEC6sib+jW4G53q2k9H3x6ALF1Q+u3Zc/HKka8AyVhw+Ye6mAkGjlvkrpwD0EREBJB4np7tlF+IxyGJXTRcjy4n2RwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtLy4L2P9pHzNFpLHzXAwDxTI3z+Dwm3yP5mMkEJwQc=;
 b=lwsRomPhvwITo6nJy+JTEAaZ52eUI0szCBTy5nuUbG5hGsI+fKzVSW9+DtdQiGujjmfsN3p/vn+1PtIn98p/Btk7Y1CgdZQrS+++T37tFlkAW8UVoDx97tE54mdn1jPWOYb2uwgJnKjfInGCmG1jXJAMdGt0MuAqUXnSmhqgaWjP9SPCKKcZXyz2JK8uDCZg6NlruUTUxYX1jfoV+JkbpjsVdm6B86sYNC0dGQQ/t9telwjs34u1yiWCxYiN09R1kI5kMGApz/6R1bHzW86ExUwCaL0p2iTMAPrLD00WkHzPvo56bS51pbHquFpOq9iE4RxOfxJF5qXOIe/wy6a0SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by PA1PR04MB10281.eurprd04.prod.outlook.com (2603:10a6:102:467::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 14:05:59 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 14:05:59 +0000
Date: Wed, 10 Jun 2026 17:05:56 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-phy@lists.infradead.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 phy-next 14/16] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260610140556.sw7b2usahiet435p@skbuf>
References: <20260608221710.1572971-1-vladimir.oltean@nxp.com>
 <20260608221710.1572971-15-vladimir.oltean@nxp.com>
 <20260609-panda-breeding-c34f8c9224bd@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-panda-breeding-c34f8c9224bd@spud>
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|PA1PR04MB10281:EE_
X-MS-Office365-Filtering-Correlation-Id: ebddbda3-6d48-4ce8-ffb2-08dec6f965fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|7416014|366016|10070799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	HSgdVLKcDE04tcDZ7c09KAV2ezKjK+SpAw9iUc2MlaeAbZYvFEcAjdT7/wCEb0rQBs/97I+w393E4vd962fnwiR8H42dKtcTaunRSC95QjjrZRyLejfh0IflrWRODB8mXZFaW2xD8VjFXgsq9bG1NVLATSfPhY0xX+nrqbOSvFBJppP6BJJgsQro8OOP0DS2nCEMPLk2S9JVDy62ufJjNPtIBzcjsJvGO/cbX1iKzDf4+aOsvfoKtXKl8USqZSMbR6Iyt4PrH8P1T5dcbHAbzvcpRtVmLh0rrZZ89bRvxEAdn/GBvJj0k8tM0QxTO9x53XQQoidILphjgmI46aGKy9EMHfBs0/d/MpASkoqF3+1qEDMjURQg0SRE310z1uujkxdZBVHoRjq9bZUSSqEzAFEHN7dZ8REJc/CtiR0obKTVZ/KLpdRQKr+l8JPkRSLQkF49YyI2rjGEB+duewfug3+oHOo+ENOrPYiKXnfGuT56pMN4Q6S32pNPg4WcLHD2RAA9ljLjarOZqkQ29C3YhKwNproeG8FopSYqy36a+cwXJ0V+rr3O27sJUPY/3nyk165gh5rv6FgUz3c7Jx+xaU6luxlEvZLyorw69RAuVpFuwPfRrNf/NvP2tXPYxamz2JfKp4T+8/sR7WJqp2nTw/qKyI8JAUCj6nr98RByqX0JB/WyoVpR6EMQtBYJ9aiU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(7416014)(366016)(10070799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fHpzgiBR9KoRj8EniMSvhiVVzl+TnzSqnWRBk5MzYLosWN6lJP61FW7TKyGv?=
 =?us-ascii?Q?KY2kg82mHcoPJ0K8DSBbmzYz1QqfNjoUhMyu+W+0+MEF3eKyA48ESRQkW1ej?=
 =?us-ascii?Q?D9VpGq0d5N3+MFFkXEct50hFotVHqHXG/p/ff1K5xeCAabcdB24YVXNVSjqD?=
 =?us-ascii?Q?QB2AG/6mNyOjpvCxsZCGuiNm6C053ShjaxBYiWNiGdSSaZnZsAmwL3Eo+WAa?=
 =?us-ascii?Q?d4WaLWMUkDyLN3jp3l8a19YHdFqVoQhFsvjx0VYWeg9B9D4CFInyBYATJERy?=
 =?us-ascii?Q?QGT1WEl98rAdX4uRnXgxF1ShTcpIVkwnXez4OD1bCStgU2h91xfEA384xzdl?=
 =?us-ascii?Q?w3Xp7SHVjey0QLivijdgRFHwRjlqMM6BqCsCj45Q3A6CcFi3gAziFgiPwAPE?=
 =?us-ascii?Q?K+Yx01KID7ZYYsVqdFJNhF7jBgyLYgG4qfMtcEqRPTNsa5VOS9qseyZlXpv2?=
 =?us-ascii?Q?I8xci16hUccW27ClgCE2s9xTUDj2jX0lO22PKgJNkEh3qQWvdR8FKb5sDMi6?=
 =?us-ascii?Q?PHKD1wcpUMByOC8Y/UmMQ6P+Au26ctM4GLp37tubkG6Ko0uRZDSP2pJKQ+BN?=
 =?us-ascii?Q?cc7BCM/p3htMNR6qMV81zioSrCPynMhnZaVXfRt/ocfO1rXhvcFtEUoz2xr0?=
 =?us-ascii?Q?IBFVzRWXkb/UhpOEKwjmpoDxzkCe8ikosQqm8SrQEM/7QRKeUbCCsV8D8odU?=
 =?us-ascii?Q?MOVyD2z02iTcNQBjROOJKutal06iY+z3U83ft8mCqWiRO4EeLkVDb0zYZI1I?=
 =?us-ascii?Q?KfRTJ3I5vt6h79Y6NTX2GHCCcwtAjvj6YHue4sgao81kXdKbwI+0ass+C2jx?=
 =?us-ascii?Q?zFyWMs4Rw6vbSqPJyGytOaGRfYZ1i0pkQWPQBxbBr6bI6eNLZ14uEv6aECoV?=
 =?us-ascii?Q?Jp9B6g5ryYnAWZzM8gOFC/bTde1dwEwSS5/bVcAzbhfdETUH3PXIj5Q5FQVM?=
 =?us-ascii?Q?PqV+T51r87ZEZwVnVRT4EXH9XlksVIQC8RejevMpJ4arnBQFWBO5LfiXT9mU?=
 =?us-ascii?Q?hCtp+FPxMTOh99ojW0Fwmv1b/t8kQuXNrP/YbYc+scopkfEcbwxcuLAsYl3u?=
 =?us-ascii?Q?W2HYsoHUQJXlj9c5WgdZ5w2o38en82NcMd+Ysrv9VLuZnjeKbFgTbvoVFOIw?=
 =?us-ascii?Q?4H0gK1mYHYI5rHkcNuZ9dj8FcH9I9tjbH8/OffLW5NetLmzQDd+EKqRgt9zv?=
 =?us-ascii?Q?FKCkU5gIp2s58oQ4FC96KHo5njZaL36OOgzfAL5d2teiuBnS0txNO4tzAcij?=
 =?us-ascii?Q?KYuocNSdCbcPlRDiSZhXyonhrQOJivG31ELwbh5EHIE2bnoujPXV+23kG+3T?=
 =?us-ascii?Q?m5Fn85o2J69h3ZhsNgvTzPCpgdK9UUWX6l1/5MuDzvZ/m2ivVwmgZICoWMgT?=
 =?us-ascii?Q?v3S3LYv32PTv++I4HloL+/hYUScDb0V1nIaEghyz6VPl1Ek2U9tCRMn1k9i+?=
 =?us-ascii?Q?GA1GfK2ueiQrC22OfHrBK8+XNQKRpNnTTgXAdZnMuM56h5exRAJZIfNBFdYT?=
 =?us-ascii?Q?xW+Wmyx2hI/socR83Ajb/xSGv2y0gxXCahkWtq7ktmaOvf5kTaqjK0suJpu+?=
 =?us-ascii?Q?aKDaVgcM0nQxfDrMjkwKM3HecpSvxlRy52oZK/qGV2aovNOyKl49jIBsIUWW?=
 =?us-ascii?Q?Nky0hnZ4ZeyjZDpe22HbioDG249EC9C1w3K9I/I0IB5BXZaTW/hyw4rg/UX1?=
 =?us-ascii?Q?HhWZxiG+jGtLxmhrQtM41LC6DG5quEfmqpfNbfCc7pZQvLRciQTKpOrsmgKn?=
 =?us-ascii?Q?eWYjSWaCtNcxcAt0eqgBFAKyitCTDr1eJ1XxB8wcknBUCoZLSUwhU5pZFuj3?=
X-MS-Exchange-AntiSpam-MessageData-1: GNdK9vypetYbF9w8VxPGMaUkeV+9Vw9Bzzg=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebddbda3-6d48-4ce8-ffb2-08dec6f965fe
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 14:05:59.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtMFMc0zJBoau52LnvMs+WlnGbtyBWllu15Egea9jKW4OXlSwIcD6s+uYjx+OHHqpmfphjGmDNZgLaGnFA2Z4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10281

On Tue, Jun 09, 2026 at 05:26:17PM +0100, Conor Dooley wrote:
> On Tue, Jun 09, 2026 at 01:17:08AM +0300, Vladimir Oltean wrote:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,ls1046a-serdes1
> > +              - fsl,ls1046a-serdes2
> > +    then:
> 
> > +      properties:
> > +        big-endian: true
> 
> This should have stayed at the top-level FWIW, and here you would do
> then:
>   required:
>     - big-endian
> else:
>   properties:
>     big-endian: false

Thanks, I'll make both changes for v5.
