Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2137.outbound.protection.partner.outlook.cn [139.219.17.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13733156C6A;
	Fri,  3 Apr 2026 03:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775185593; cv=fail; b=hI2yfbkSeHLDSFM3vMYCtbUkl5muLY+sKhA1I4TQ1dYu4/W34wBL9KMTNolyQql1++mys+9JzzpU0hXjVRZvymkb01xGJw52kf85DmmlYl8rtNV3JDXeYqapZ84nnAmb/FYgu/ZxDBY3qRAmsvyVjtY1XmgcrBni+w0pJ5ibUXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775185593; c=relaxed/simple;
	bh=f381JYLAD8HLmW1fKIb1VGd8dDrgPhT2bJZrSKHzdJ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S8KbxiAscke4LplXJJKr5Jf0HhC8ExDCE3va8jdK1We2mQEMpvUuuWTJTJzl6mBxG9LrJ+jYvsojO/f3KietEmjDx3M84PRvBUMnjndiespXSlcjLIudcPBX3q91NETCmM+VSQAlILdjypoTP8klSyEgjSMSXTXs5OH4P0cUz34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4zwkBQDuFKAb62sHlOE3Gph7UFzL5Khnm7QgTaH+j+jQuEsyNKV1eaQuLObdeit6NCH3xTVZTrjwOWxObs5OWVDW8cAgweaga17EirDpcMmVsguucJcYaGfON/PWOrGeOHK7/wDQDRrC8ucO1S/ADNmRSa6MaGhNe4RxswCiwdZLjPY1RfyVUWrJqSFo6WsR5g1PosxSUM6WYeQPtnjJPvoN+dDqOdt83fRjHElll5/wp5r+gByqVJGEYxf3WKY4KeqeKJkM6h1Bq4X++8F0P/FnOYBNxG9tRh4tI6U/mJOWOK4Q0oyzsZUHJVkDoShxaB7kb1F13QXdv3wj3nsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AryfCKrxT56bYqpC7LEYMYc+gv9HTE3ITeXg2saEUrI=;
 b=QIZwymDBEanqy3Kz4NlW94nSl987D0rG88R/SelvNtLOsvaGCAzd2wFOq/Kc2MTa3ezWHtUV1nVJ+kvoTCq348g7V5wz5tB+vxchh7MAOWSLDhtyNy3mbigZuQAF8WVEQf3eaCVK6+lcHYF0QqaPNb/Kg3eIn6RflUh+umBRcRsz0JiriMw3iX93Uv6yLRQuEAtWiWkUMDSY6CHUfO7XNGtx+tsM/JzHDgnddCuDszVZ7SQq4GXR0HE0JkGnPldqlgokdX5JVz0YAAJ9d6pqtx5XcRx8PbDvM/F6FlL87wbOL1UsRem+8sS5Yi43LXcEYhDCImJ0SbPbdZozpdEJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 3 Apr
 2026 03:06:23 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 03:06:23 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Yixun Lan <dlan@kernel.org>, Joel
 Stanley <jms@oss.tenstorrent.com>, Drew Fustini
	<dfustini@oss.tenstorrent.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Guodong Xu <guodong@riscstar.com>, Michal
 Simek <michal.simek@amd.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Heinrich
 Schuchardt <heinrich.schuchardt@canonical.com>, E Shattow <e@freeshell.de>,
	Icenowy Zheng <uwu@icenowy.me>, Anup Patel <anup@brainfault.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, JiSheng
 Teoh <jisheng.teoh@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Michael Zhu
	<michael.zhu@starfivetech.com>
Subject: Re: [PATCH v1 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Thread-Topic: [PATCH v1 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Thread-Index: AQHcwnxiwBmd+8uHeEWp93zEeNNgPLXLsqqAgAD2D+A=
Date: Fri, 3 Apr 2026 03:06:23 +0000
Message-ID:
 <ZQ4PR01MB1202CB8B853CA7E03531914BF25E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
 <20260402084019.440708-6-changhuang.liang@starfivetech.com>
 <20260402-shakable-hefty-0164a042b748@spud>
In-Reply-To: <20260402-shakable-hefty-0164a042b748@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_
x-ms-office365-filtering-correlation-id: e381ea5a-3521-45c0-9254-08de912dfca6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 ANLgUpSlLxrbIkw9jsei9UCFauOaFGb3m+Iaounv2ohp1G2TIyHnbYqN68Y5gWzifbXs4LJG1eMwUNS4DzI29G4uXM3JuPCNmMqVKb1jN9waEKWqgbpVWO1PN5oGombkuSMM34j8bz5es7LpHNueBk6oYpkT57q4n5wNMj3pTV1mYnba4Rlf3YpyLLvgv+BIUG+78MIczqJY7DDMJkEPBn0T1JdCdSj67hyyCeRgTq1/hZSiNrd94boIXPVeWtScAl9o83ghm33gn0PD0Tegl4udS+m6aLheYHiwcjElFZ8YAYIxCo99RyGVE6U+FDRS8foCqhHwff2CY2BxV8XU3bYDLZtbBYEwHGQDVJLdkVpv9nmtLGntug+qx+nV767yD+nxL9R50Fg+OG554d1uRJTMwazuGumNL2c3Tm4H2EijP4R5DK2AgMbSe+NjkUpJRMlaY6Zz0gGzyHqQZvhxNSTPD6pyqTocNMH61kGm/JDzfmK10teaewGDGH4SYCWpc5tOsqTxb+w425fjd1XLwEKJ0HAJSJLr7g8q0aAQWLmc1LqoXt7gp0sKf4KbRCwIneqBOagE74+x/yNSzClSegu5z2Q99zAhiS4VEdNLrU4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W33b8XgNQx2knDocRfQ4cXNzaM8UF0DI2ExcZpb+6GXNS9Kl7EL81eE1+lHX?=
 =?us-ascii?Q?c2nxGzu8UdMhyXmEi6xCU90JNPnUzqVp0N8H8qCjAGyETuuq7ifrrOJw2iDd?=
 =?us-ascii?Q?RPxrMgoDu59lOLgcs+5CPzsQvoD3uMRXkbKiLZEPJoi8HD8ZLhV2gAQ937WX?=
 =?us-ascii?Q?dtafrwZrO0ipAYjqQtbq6wRRhSPG6oaJTh0jwS8T4s3eJyfYi08V6CvUYQqy?=
 =?us-ascii?Q?1FjMQMZG4ONJ5AO4E2d9F+LN3RKQ6w6CcyFXatvG4vNL1JawP4pSnZINFWH4?=
 =?us-ascii?Q?tW9pUYriEfRf0Bg3m1yxYkbDzaWBu0V7e+HLsUed4FBq19gbpAU5bEsnIvN5?=
 =?us-ascii?Q?pwD99vDq+Sxp2KgQZ9izU1PUdFT0NioSjp6kOfIfWHdX9P3kUjViC+ZFl776?=
 =?us-ascii?Q?+p8XItTq2cEMX6OUbVmIxlT++REgvnmxgLMoN/CND8inCXBoCqGu/hQo0dT1?=
 =?us-ascii?Q?DJjiWDtpdkfio26HcDpjDy17fAKvrc2jkBk3vMZk+Vt8cRCDGHLKFsqq3ylk?=
 =?us-ascii?Q?tfXi3eSSPwakdgcZylCj/6okvEJpGO7eei5e59VHVHLwNYf7PkAdcFc5AflB?=
 =?us-ascii?Q?TSVhB0GBeCwG7p36DCF5MPVtH+zY+KxG51CDgSOz9n5JNQ20U+X2BIn29CjJ?=
 =?us-ascii?Q?KUEK2bsxwkpnuAHGXhR2ZM594QDLZAJv3LFINfSdC2HSysZ4dC/JbvwFdVHR?=
 =?us-ascii?Q?HYU+auCSeZEbMuYqKesjsImto1AnIzFGnDx919c2YT41T3utyc+FpuLCWRHX?=
 =?us-ascii?Q?B6J3j4xRizKlvrn0WRrK7ObsKVEwzPFK6DiSWBLEGA5MM2hhQsYXg1ow7plF?=
 =?us-ascii?Q?tzOWvlphc4PRq7GukgQyQ9YnYgyWoI8IsrMlTf/oCmvo+O6VDZ4OEsmnPiCf?=
 =?us-ascii?Q?MGsDRkrIJ/V2wqhgkbZL9SGs+AJPvkGWyFNsSw1ssKFMJwnP6iXhZvQ9Wf8t?=
 =?us-ascii?Q?VZVOSbuKbN5i6QI982kYYVK9+a/ok2rCr6kU7P1svkfx2XNYaN3npIbTodx8?=
 =?us-ascii?Q?CwWf3T9/g4Xsnei6ybE+/dwkKf9+NbccD5DT0y7559d6GWKt0+huCXdlV4YL?=
 =?us-ascii?Q?sLiV6Kk9J5apCuJ7A5eXg6cFN6RPUbNkK/flRj/iStsUAzUrRBml7Mmx67w8?=
 =?us-ascii?Q?NM7kLOxAu4Y4d0H1FQiTrphxSOVdHfWhqwqFOGfogMLNEwfNnGz4UO9sWZh3?=
 =?us-ascii?Q?npNyBDCUnzTpDB5hpFxzvB1YspB/Q7r/ETRTH9AEAoo3oj7FZmwYYl3vybZB?=
 =?us-ascii?Q?0nnkRXrn+igpowmd7j9kh8nM1ZVB7uczM98zHPbUdspznfQ6pg3EkM+K9p3W?=
 =?us-ascii?Q?BruLjqg00ln9/CWDxvpjoaCEn3Gk6JXdiLg9nbnLq7HfZLTnRa5LBHEKwEHI?=
 =?us-ascii?Q?1dFmR7sAH6R1P7qzFaliUNu2+vG+5nSIAONxNIlnRkrTrXbzgcPo1KjtWLm6?=
 =?us-ascii?Q?wrqDqk5D+7nuE+VW1nAQCTU9HPwd9yQiJ+THZXTVZD2LyXMW6Us1DpjkKprL?=
 =?us-ascii?Q?Bdxp6H0NEDdycwysTpGQ2KOH5kZHEphW3Ca5BM89oYb140ISKEXm4gheVSmY?=
 =?us-ascii?Q?lIwfAWu589WppMOZF5oAYParUfk2FfZmLcXLHO7Xz2pfx34m7Oz9JvzIJMfW?=
 =?us-ascii?Q?OM27JF0u2JVamQeRSrXU6X/BpPz1eqfnV88sQveDQyaZTOykH+F5niH6p7PJ?=
 =?us-ascii?Q?c/jOCardn4kC8qRygxbsjINVRHeFRkyALAMQQ/OVX/boPJ+kx+fFD1+eWfaC?=
 =?us-ascii?Q?MVQXM2v1Qs6Wxp6ig/4279cI/XNaKOU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e381ea5a-3521-45c0-9254-08de912dfca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 03:06:23.1166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UlxJ7HH8/IQI45jilVuZETwoZh3V5dayfVE5TTO62jhqMFbL2LR/V1Byr1nhBPD3NSkYjDbtb0fvmt0+mI7RN39sMrYujT09x+isz+o2e+4EBBxRok+2jjK5DDEcMbq/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234

Hi, Conor

> On Thu, Apr 02, 2026 at 01:40:19AM -0700, Changhuang Liang wrote:
> > From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> >
> > Add JHB100 base dtsi and dts. Consist of 4 Dubhe-70 cores, CLINT,
> > PLIC, PMU, UART and 1GB DDR.
> >
> > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  MAINTAINERS                                   |   6 +
> >  arch/riscv/boot/dts/starfive/Makefile         |   2 +
> >  .../boot/dts/starfive/jhb100-evb1-eth.dts     |   6 +
> >  arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi |  32 ++
> >  arch/riscv/boot/dts/starfive/jhb100.dtsi      | 326
> ++++++++++++++++++
> >  5 files changed, 372 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> >  create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
> >  create mode 100644 arch/riscv/boot/dts/starfive/jhb100.dtsi
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 7d10988cbc62..b1892a480c31 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25306,6 +25306,12 @@ S:	Supported
> >  F:
> 	Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100
> -intc.yaml
> >  F:	drivers/irqchip/irq-starfive-jh8100-intc.c
> >
> > +STARFIVE JHB100 DEVICETREES
> > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > +L:	linux-riscv@lists.infradead.org
> > +S:	Maintained
>=20
> Supported, no?
>=20
> > +F:	arch/riscv/boot/dts/starfive/jhb100*
> > +
> >  STATIC BRANCH/CALL
> >  M:	Peter Zijlstra <peterz@infradead.org>
> >  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> > diff --git a/arch/riscv/boot/dts/starfive/Makefile
> > b/arch/riscv/boot/dts/starfive/Makefile
> > index 3dd1f05283f7..7cdb75788053 100644
> > --- a/arch/riscv/boot/dts/starfive/Makefile
> > +++ b/arch/riscv/boot/dts/starfive/Makefile
> > @@ -18,3 +18,5 @@ dtb-$(CONFIG_ARCH_STARFIVE) +=3D
> > jh7110-starfive-visionfive-2-lite.dtb
> >  dtb-$(CONFIG_ARCH_STARFIVE) +=3D
> > jh7110-starfive-visionfive-2-lite-emmc.dtb
> >  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.2a.dt=
b
> >  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.3b.dt=
b
> > +
> > +dtb-$(CONFIG_ARCH_STARFIVE) +=3D jhb100-evb1-eth.dtb
> > diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > new file mode 100644
> > index 000000000000..62cd046e1224
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > @@ -0,0 +1,6 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
> > + */
> > +
> > +#include "jhb100-evb1.dtsi"
>=20
> What is the point of this file? Is this the base-board?
> Shouldn't it have a specific compatible?
>=20
> Can the SoM be used without a base board? I've got no info about this boa=
rd
> appearing on google, do you even have pictures of it or any documentation=
?
> I see this
> https://www.starfivetech.com/en/index.php?s=3Dhardware&c=3Dshow&id=3D22
> and
> https://www.starfivetech.com/en/index.php?s=3Dhardware&c=3Dshow&id=3D23
> but the former doesn't look like it needs a base-board and the latter is =
called
> "evb3", so is not what's here?

The former is the base board of the EVB1. Currently, we are only carrying o=
ut=20
upstream work based on the EVB1. The EVB1 base board has reserved slots=20
that can accommodate expansion boards to verify more advanced features.=20
At present, the jhb100-evb1.dtsi file corresponds to the configuration of t=
he=20
EVB1 base board. In the future, we will add dtsi files for the expansion bo=
ards.=20
The jhb100-evb1-eth.dts file will then be used to combine these dtsi files =
to=20
generate the final version of the device tree source.

Best Regards,
Changhuang
