Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1B4968FA;
	Thu, 23 Jul 2026 13:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811745; cv=fail; b=sRTeLsAYpcBQgxnmaYPAIQNdRWyVpOCVHFiwXjWwCRGbQ9QVFITNjntknWcCndL9GicBVSd2fVJNXGgbHIR7x+FD77p2u7QDYALsSFPdYINC1YOV37ttQ/4BTdTLUMEVbPeU55nDfUzNxwjFDnc+Uu1ZPzioNAW7TlhyvS5acRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811745; c=relaxed/simple;
	bh=SkHaMl7VVhJRzwLkL6hmb754wp1gaYaZCUCYwksR+V0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HCx8axwoemOdlmGHtWu+uKWbT3OwxqRezmWBy9nMgIamfjjWOuXEGlq2v2AaisHm79vJy5tSs6ZDdSvAo+CAlcYgQ89vi1ATZ3+M2CoZuomLbpUPcn8NmSuXTbvZWdH5CdImxyExcY24XEUvfx4udSWp37PJNCNeQt+oWlhL1Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WObUXteA; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WObUXteA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWpw+VBjCedhTJ+on/C5MkIlIfJKehT1tu7ArVEJixjhV80GNWKEa9tQrwLUMsjxDwhhhWY+ny/Syz14prqexNLBgRiutQl2cWVUZi0mmUhk/16AURB/o8LBOvhRTdESamEK2BDKZon9jatx6fwWFTMXe1hwBPa2gYChaUgpAr0ZTPS7jIlHnPS3lIJtqhF2HPgZh9AwpoOvEBWMzZ36jn5zZY5jlj0TvelltGhUmfQn0kNgw1IjiIMmOyLcInjXwbHaERIORy//I6aUPlnchvfxKeGfpsjVnm3qouS8cx8YP9j8LTJmAMBkt1BD79ng9kucOHRepOgtcdOq+gNPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jq9rNwdkvr7YYOC03PRu85w97TGod3EpvpixyeAfYGY=;
 b=LahSHhaK+osd7lQZw/n1DkED5r4W39QpZwjLVSVYcan31ryD6RXccP4KDnQF3O7Bg69Zz41hLDP04Xs0R5PYw03ASmBK3BiKV/wpHtbvNvCGN7HoWZLT1lsjbRJBky0uuap/JSCy0Ito8UcM52ioIFGAcd4BFEoCDANCZorO076y8I7S5tJaui1gc04HNkCnALAHXuxfrewQTkCg2Zd3tucBH3tfM9VnDoXbaOGOzFRk0ZJTyulyUhor9cjmZttCRSXyLIMORB+Uzpft6AUsFIigud4u4tSO+gVUj+PZbG5FXN32Qs5Ug2xQlC00pOqJm6cAPw576Wv3FvRGdeZYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq9rNwdkvr7YYOC03PRu85w97TGod3EpvpixyeAfYGY=;
 b=WObUXteAXkXn/O8qYrkVinZdbdkhGqQYOLTdX9FlZLe1PSjRZntNy54KaqiVVX+ATUhtOrlE0IMNqHBxSgEzUyDhezz+DnTxz799WG6wkUC/FF0NRMkbYIfxoxssEkMNFd41ec0NBjnjiTvPQ5BO4FcmTf6/R1niA4COdwJPUsCeKr/8mymQfXgMjZzW2KPe1zwRCOjJzxoAWUfPvG9LKe57CIV7u8UG5leCI7NEFSLdXb0KDxff+n0lQam0CpxsemxDiuPaPb+M9zfkQzp6i29DbI0SjxN2nKZVXddVRC5/u1tAMrmbSE3JXwae2ckoJrkZDOifx4tsqqCqAWaYOw==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PA4PR04MB9389.eurprd04.prod.outlook.com (2603:10a6:102:2a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 13:02:19 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 13:02:19 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Lee Jones <lee@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, Vikash Bansal
	<vikash.bansal@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>, Aman Kumar
 Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v14 0/8] Add support for NXP P3H2x4x I3C hub
 driver
Thread-Topic: [EXT] Re: [PATCH v14 0/8] Add support for NXP P3H2x4x I3C hub
 driver
Thread-Index: AQHdE3IWsih9IApGY0uK8/NptgikE7Z7F2EAgAAH5IA=
Date: Thu, 23 Jul 2026 13:02:19 +0000
Message-ID:
 <AS4PR04MB9362644EB305507BC46C07C7FBC02@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260723123108.GH3363113@google.com>
In-Reply-To: <20260723123108.GH3363113@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PA4PR04MB9389:EE_
x-ms-office365-filtering-correlation-id: 65eea69d-3b7c-43a1-c50e-08dee8baa0e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|56012099006|4143699003|11063799006|10067099003|6133799003|18002099003|22082099003|4133799003|38070700021;
x-microsoft-antispam-message-info:
 LPvICoIgmbKZ6KtN4+z+8b/IL0wdguEfbFHRdCpOAnolAUYW6vsE+QQ+HJmyhXy6n9O7yyGHX/5K85yuHVJobSuUmzzEOttqPeMClI9fcfn8VNyrO154A3SmYMyluNZWf825Y8ZOYauMT1AMblNZhsp3fACMblbwHzq6+5rHovi1Y0wiVfTejmIlPtFZJIuvWF8/5+bZrDzLG+DR0wDqL0xCPMB6x1Ij3CRnstKgH01fF59hjM4+w27Mg2wFUyFeYFQ03+HlSSVu3ex4G0In0OI4y49fOa5e6n0PNpjLBUmvZNhpvxrRl+eu4NH8A8s/A2zH0BDKfp2/1gV9D2PgK4T388cr1uDlZajfZJMLFXmDKpv+i9BEa4mfJk0LSwAGkJiJWOZBKzDpliu9I0Xs0Cy07wh78B4Q+XsZ0fZAOYWK3ig8Agqg9GkH6Oab2g5y3HvGn8yg9DpMokNpxOyucHU2wwSJfJ2p1ADDV+SiGC0WWdRE8zXaaxfTsT6qJBBdeKqg4c/nYBMWYXL0rlqzWPUHIpYOFeW5mECIDgaTD+7LkdOv8nrhzCLgJvWvUIldIaoorhwZeL415x/PVg91uHYK5SIRiM3WDBhIi6rspPQN5G3I9dlPOHNhqbbbzPwgpM0ekkkDDen+JpdtBjHuq7dpzVbVzwyvv2++pUhRmEPOIjVQCYNNi0RwtY61D9V8tCL7qysvBLYGHvP9Cx8U7ooV0PWTni98l6QsXkaJBhM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003)(4133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Bt87MNBmSvIUEHRYxRoJGKcsI6vmM4j4WIccXtl7EJwGdwsfMv/snQbZKa7q?=
 =?us-ascii?Q?bSu3ZQFAHwz6vtZ18hTM403vKDdEprlMpWJVCtgvx+rv+tjphXdTUKWIgcOw?=
 =?us-ascii?Q?NjIy4bK9TUhTL7ZWXg14fPuzCvVhRkVYH75xgN5g829BO3yfNAb6abqrobfR?=
 =?us-ascii?Q?A19oXT0MCJYCn6uB9Bq56+1B1OLQubm7dEVWVeaMD7WNNFJLZf553taLPl3Y?=
 =?us-ascii?Q?iaVGIeaBt0v4ccR6uPfSNeVfQ0KkRPxeGW8olMZxmp9jpW3eES1YFU4E8daM?=
 =?us-ascii?Q?Zrm++UZq6veky2vS2o4VflTkdK2/SmOsMK5J9N5scSAf5MFrFaLiAHeNm3yZ?=
 =?us-ascii?Q?sGpUZRtPLww0b/Pk5lKSq8g4w7IxmZUI+gRsyIIp6aVZJZvkIKiWCZubmXxF?=
 =?us-ascii?Q?fjzd7KlDLbAn0d0IZkIWsuouag1jOFufrpGvEjiMYSfsFWAPjdvPcGjMM1WN?=
 =?us-ascii?Q?iBEcJIVeDIkMUfSCEC63nLZ6XDasn028USZDGrRjmPgx2/Cz79vRLT18Xsha?=
 =?us-ascii?Q?RQvER4Emtle6md9HrvZZcAv9u/TITQoYR1a2eQw9zSLaxczCWbWLYbi80iX4?=
 =?us-ascii?Q?MJICit7kK/bCvKbDRpE+uwLjhrc2w9yi3wY06VBc+8q5LtSrlQFerLX04R0Y?=
 =?us-ascii?Q?uHBgMHUf96PuJ1rLVJkALwe989dF+GfZ0ZeGnBOX3xP9CjV1J9w5iLuAEvdb?=
 =?us-ascii?Q?YU189veNL7Ra4oBYu1I6wO8kv++H58HXJepavzI5D2RQEh+MEZfd48XA+PFA?=
 =?us-ascii?Q?XKwAM3kK/ehOiym8rtO5m8uTtR0Et9YAkNpe0YTyvZ50nPL5XDtCRqGNN6T6?=
 =?us-ascii?Q?q2bkYjPXflDFUOUdeURrHaTdjSXHhYXlWEFt/C4aDOLPfaZlfAZeBrq4Otsn?=
 =?us-ascii?Q?YpoSeR7P0muOjf+RaMJTWwBma7EHvvI8SgDsifwVMSAfHkzxrvLeSo8ppHi7?=
 =?us-ascii?Q?V2sbQ8G3xMruLCoq3F0aGIy+uM7ovXaK/xYA/8YTj+hlaRUCA3gSyzE7ExZu?=
 =?us-ascii?Q?tll4bCrv5HcW5TzA6bveSREZANPwpcEoSx+tne5FbbqcTc7UAR8xL40Jks+k?=
 =?us-ascii?Q?fPsBe6LRL+2N/4CsOyXgd97D8eF9OclBGq3NGS4yoGiUEE7/Y7MGG+3/3dAu?=
 =?us-ascii?Q?Vnd9/CyBk0lXcFvlB9me4Qbb59rEfvQjw2QPjFl2RTXWedi7UiwkuLEwCqZE?=
 =?us-ascii?Q?+YDd5k/0OZXqbTLUxC4y6AsW326EtdSK8ZtOqtalbKya0qC+f/91oxasWNlO?=
 =?us-ascii?Q?+5s2R47qCexbGCq1TMmi5jKG6aOoZGzGyGVT9y/Sbx5ZDLyWQl8XqK1rNv6A?=
 =?us-ascii?Q?IpQuV8plfYff3s/2OIMFs9zRWB0iP/J90haoWdzBJTpBtI42qN9ckSvBQJUm?=
 =?us-ascii?Q?ezCj7NXvskwyH/uadC4l51cjnlF9RlhJVFazyOglDepVDDIPXux1Onu67Bcg?=
 =?us-ascii?Q?3dYeqk+YFCK8udfiPOlw8668CuYkd5+X/5UzF7LUUayvddIMFsFqMktVA03v?=
 =?us-ascii?Q?rcg5lyfxyNK8dwY0Kk2kE4GVtx4zniroSmby0/oVvLeiYzyQQT08nz/21XbC?=
 =?us-ascii?Q?20gBQmUlAfw2pNgtfIGE30LAgMcDDpU7WwZL1W/fneA6F/E6MPnB1U6IYK18?=
 =?us-ascii?Q?j7xMBcOcxH1IVb1stGnSyTRX+oC8lb0VTpTvUknQk0TKRCsriU5ZNa72u0en?=
 =?us-ascii?Q?ekBFIXzS8/rYnrxOsPwk6Uw84FganPVLMo44RQQI/nqnyZnWifyIix2W0wl1?=
 =?us-ascii?Q?530MHAbTBg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65eea69d-3b7c-43a1-c50e-08dee8baa0e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 13:02:19.3658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wx7zKBz+lHH8E3cpMwAzP/6cdQLPpYdToC0sNMXHEgK14EQ4Wpriq4SW+9CHShmYVnhNEU6AtECXeCo4WKEvMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9389

> -----Original Message-----
> From: Lee Jones <lee@kernel.org>
> Sent: Thursday, July 23, 2026 6:01 PM
> To: Lakshay Piplani <lakshay.piplani@nxp.com>
> Cc: linux-kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
> alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
> conor+dt@kernel.org; devicetree@vger.kernel.org; broonie@kernel.org; Fran=
k
> Li <frank.li@nxp.com>; lgirdwood@gmail.com; Vikash Bansal
> <vikash.bansal@nxp.com>; Priyanka Jain <priyanka.jain@nxp.com>; Aman
> Kumar Pandey <aman.kumarpandey@nxp.com>
> Subject: [EXT] Re: [PATCH v14 0/8] Add support for NXP P3H2x4x I3C hub
> driver
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
>=20
>=20
> On Tue, 14 Jul 2026, Lakshay Piplani wrote:
>=20
> > This is an MFD driver integrating I3C hub and on-die regulators.
> >
> > The series introduces:
> > - Core I3C master enhancements required for hub support
> > - Generic I3C hub framework
> > - MFD driver with regulator and I3C hub child drivers for the P3H2x4x
> > I3C hub
> >
> > Below patches from v11 have already been applied to i3c/next branch:
> >  - 79c41666b397 ("i3c: master: rename i3c_master_reattach_i3c_dev() to
> *_locked")
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> >
> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fi3c%2Flinux.git%2Fco
> mm
> >
> it%2F%3Fid%3D79c41666b397&data=3D05%7C02%7Clakshay.piplani%40nxp.co
> m%7Cf
> >
> f46ce74164a4dc1ded008dee8b64a9e%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0
> > %7C0%7C639204066796167732%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0
> eU1hcGkiOnRy
> >
> dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3
> D%
> >
> 3D%7C0%7C%7C%7C&sdata=3DaySk2IlbCKMrsbqTTdBcaBPT1JZ5uLMB4G5WGIu
> ZmOs%3D&r
> > eserved=3D0
> >  - 8d8afa428318 ("i3c: master: Expose the APIs to support I3C hub")
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> >
> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fi3c%2Flinux.git%2Fco
> mm
> >
> it%2F%3Fid%3D8d8afa428318&data=3D05%7C02%7Clakshay.piplani%40nxp.co
> m%7Cf
> >
> f46ce74164a4dc1ded008dee8b64a9e%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0
> > %7C0%7C639204066796206521%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0
> eU1hcGkiOnRy
> >
> dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3
> D%
> >
> 3D%7C0%7C%7C%7C&sdata=3DxbBVBGJ18l5zVn3c1TedINVaMmU%2BbCTeoApV
> DkkFkFY%3D
> > &reserved=3D0
>=20
> Am I correct in thinking that the only deps are between the Regulator and=
 MFD
> drivers?
>=20
> --
> Lee Jones

The MFD parent driver is required by both the regulator driver and the P3H2=
x4x hub driver. The P3H2x4x I3C hub driver also requires the generic I3C hu=
b core, which in turn depends on the I3C core changes referenced above.

I will make this complete dependency chain explicit in the v15 cover letter=
.
