Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035503D3B3;
	Thu,  9 Jul 2026 04:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572572; cv=fail; b=Sv86MELMYcnE11vCe7mEqsoG2CgJ4hpm84ioAMol/bA3kHCvFiCEJzNaHMNOwfQ3VE49PfD/XSHbxaMOJMeI0Ah2sRiIvq3JsP1hIwYo8nCVnH10Ci8qHHvxQlVYeiDP+sWFPTCqMg/X0pWX9h7qGO0jhYDYHGk9MKYsT/WM8CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572572; c=relaxed/simple;
	bh=1YBwOOUmlTCA400bHRfvMgcZaWOVB72iCjlZ6YCZlMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J9G5Mz8KacPEYfUHdF/HCeRbE2t+fPZIvC3MLfTBGTWeTDuvCL2mRxh9Z4vjd/SF8B4k5Ky51Pdy+pNCDRzsGis7x5n01/Ijm2LJmAPW3kn7WjkcgGcOMqfnHbBut6ygwtQXRdpsvu2tBlOZdRPC/oXEPsxE8buanAnlCGUqtGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NINe7wvS; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NINe7wvS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtR808lywAv94EbnQjNOgiXlO24ClaR906OjwkKXxDFiIdkPSG3j8SOzIImikSU6qOD8yj4gLDih6rVDBRVsn95JM4YlCLawoFxRz21ThlgPUQKNgCBtDcmwKgLtNy3GrmzEK2JQmiIZkKV2TXZhrXbOxBr+e+bIIeeujeOjUzfVlhgMARgy/311vzGrR4AWYVyKaDCEZlYKfcEP9zSmKUcWp7TnoNjRX5zg8CvPFPPbcGuSyCld7PD7LGjPEzybjD9tjmcEGa33fl/b3QeruPrM/IJKsU/JRfNYdkGp/mz1gb97kHiBrqOVjELq3JaFKRVODij2WY0/j6+LiUpbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHJY1qz3OKxHoanAWIVRHNIoCe/Y+NZh0CCHPRm+KYs=;
 b=pMWxYPrHZZWk8QpqMDNPxe3i2k79wcY14ZM2ZkJ73ClxU5b5BxMg2hadIQwqfS0LYnxhSxPJXA0r4Orx7QVVP5akGpgVpGoGP6N+dT4nRvETKd9oDM75wJo5Jmr5JcUAAmgJIcs5gHb/eLnFD7qD39JBtKD1Q9WHLV8QbLIjWChTpr1aG222HtAGFyiQvtFcNTVZmGbFzQ11xflUl0Xc6TRYm11GEppGrR2TvJa6fX4J5abGTgoblt4BaFBE3sOqOPogGVjLUjhjjozUS0SU0DJ39QwuHii1bmjSZPlJoLnyYNvs3v3gjmTo8/bUwVuEKeYeGRuujLv9PGWAng+usg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHJY1qz3OKxHoanAWIVRHNIoCe/Y+NZh0CCHPRm+KYs=;
 b=NINe7wvSaTTI7C1nbn/J1cZde+2AUnk743C1oj7QzgOezBqTk5zQ9IiQE2DEDxgwiLCCWZCw51v6Osq0cDod2sv335HX1j6HtrlxICr9Y7aglD+uU8nHFMDt7JXbUMdv0j5aiI+80SXHY4fIQ1q7QAwzQYejz1qALmit8vkf+RPdCcPM0f+/wSKBO1WSfWSXOVCdtLLrUmGqx9pxJ6+pBZbGVwSqHUy5lBnugEkwxKP73Sq3/FfifZZ+eVKjZfIzUHdeGtgMxbP3GKEmevHK0VFO4yOfA6HwhLu+o4UrmMsc2vlF55es6RCs3uebDjsXxJdj7OD6/upgZn+Ohl+TXg==
Received: from PAXPR04MB9350.eurprd04.prod.outlook.com (2603:10a6:102:2b7::10)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 04:49:27 +0000
Received: from PAXPR04MB9350.eurprd04.prod.outlook.com
 ([fe80::32e5:5c18:c725:c52]) by PAXPR04MB9350.eurprd04.prod.outlook.com
 ([fe80::32e5:5c18:c725:c52%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 04:49:26 +0000
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
Subject: RE: [EXT] Re: [PATCH v13 3/7] mfd: p3h2x4x: Add driver for NXP
 P3H2x4x i3c hub and on-die regulator
Thread-Topic: [EXT] Re: [PATCH v13 3/7] mfd: p3h2x4x: Add driver for NXP
 P3H2x4x i3c hub and on-die regulator
Thread-Index: AQHdCSb6Hn+fm+koa0S5SFoffZXaM7ZkC2QAgACPm5A=
Date: Thu, 9 Jul 2026 04:49:26 +0000
Message-ID:
 <PAXPR04MB935077516683DD73CADC0FC6FBFE2@PAXPR04MB9350.eurprd04.prod.outlook.com>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-4-lakshay.piplani@nxp.com>
 <20260708192034.GA1727174@google.com>
In-Reply-To: <20260708192034.GA1727174@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9350:EE_|AM8PR04MB7298:EE_
x-ms-office365-filtering-correlation-id: 67c475ff-24cd-44b0-265c-08dedd75746d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|19092799006|366016|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006|6133799003;
x-microsoft-antispam-message-info:
 foo0Z0lcvKA3fyzg2dWljFHoXWuMdDd8yY+Whlr0K5BzzwaF1WQBBZmucDQsDaQY5ktBH4UcKSVjpH4IbxxAh98P0go6nMPgsB++o3wjko9hmLUgTS/7YsgzmxFgebfKMQiOPeTcc+jIBbJBj3YRlwZtfnTfL8ngghPcLGzSOr8I1DfKCYdsSVbKGhnl1rKRqnpK0DCKwHBymJxEb6pulAyYiBQAIva08Iaj+tP8jJlv21n1ygihUuVI81WNt3anAdH2PhHos38F/g5UHLlhlmTA29dcybFcTb5PWHrfxo6pKymEgiTV4PrTOGrUKToxGWYZjfMf1uYy0aMBUNEmdnoC3jBfOm4syv280xtCOK0gG7T6zjjNQ9Qdq069jPuMh7m6SoD+VJPSjin46pQdU2MuHUOX/9zho27HWrxSr/pRCLmWffJ2oO7REI6wGRotxGA+odngm2+lLccZZb/qoIHjcPnT7udR2tCH8ioqMaqYrwYs9vRRgcIifi5mFpfbdt70nYUNjMYi1HbBjz/2tUeHjeRwdi4SOANogJ7si3M61EQRM4m7GNxW2zu8iaxGayQUZ97Ltca0yNhILiHailoNFNF0/TMxQYyeKG2zqaUxpOt94YFW4ItTXPNWT3feBD/oL8769Y337S9EfgsRvzyrm/pnG5BWR/QMsOP/FgKvela6kPO8++5WbbpIX1Tz3qZf2APL+ZX0ve4NYSKUD0KIr8RZzNCJWOoaTn3aQR0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9350.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(19092799006)(366016)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m/w5j7WFasmSnMGcvKxE5Z2e2/XAUgYaOazMkBFmAP475IAbzvJHp9So3gNw?=
 =?us-ascii?Q?6SOyBxvmFevqCPwYvees9tJzOPmRfa7MiwurMIqSfWCau9xNNSfw9dUlKm+P?=
 =?us-ascii?Q?lDH/pth769ogij3aF7Fx6+ko1RbMFJjS4RRxSRNooddktE3IxizTkXo/HjfZ?=
 =?us-ascii?Q?M4kFOohw0gtBOB2TrV+NSgF59HNfYtQgTeBBplYvSY+yO3a+EtZkC967X+IU?=
 =?us-ascii?Q?H+3grFYcIBlahCl89s2Zjf/GzDdKsNcSXXr7m/0lHYnboMGCKTJZamVGNRe8?=
 =?us-ascii?Q?nkVx/nQLIi8k5PCvoJ0wfW19fHy3A4NGY11rHi4ItZ4EnuCKK3a/q2OgTw7U?=
 =?us-ascii?Q?EKGKnqjEk4S+6rdLTadYbk/HgHTOL0U9YtKBz4EXwItW4EiNQol4/SsS8HDD?=
 =?us-ascii?Q?dU3MMG4UYzcZAaKUBRM2SQQWAIC8IdVBpikxiD6svrUF9jcp2vbnFKnWGRGO?=
 =?us-ascii?Q?NTDEQjyRp5ovVFldki08Dpf4AFx9hhVrf/r6MN6MHkNiYpEPwvr6OFnGTFa5?=
 =?us-ascii?Q?+/ihmgt51RmyGT5+4fPD15F8+Tho7MApnBfoorbMLQpsNFVWEk3ElfW792/1?=
 =?us-ascii?Q?AoS5lffnFf/5skWOZ6kJWMhzggR1bVa6N6krh3xem8i/lA7pZsx7boZ5p4Sh?=
 =?us-ascii?Q?ImgIqVGLoejhHZmbaybka5Rusn8wAbZrJ1C/ALfOh9ZXoNJHLPZMR0Mgp9uI?=
 =?us-ascii?Q?ALRMOXKgDVi0OJX3lbeYSvWjM5O1hErzvLNyvIaptSlrhFmtOqWtrrMWOwoe?=
 =?us-ascii?Q?otdmwj3TnGd2Y02kQOxbHTc3R2SFiI8cd7CiENVIzqvGUwecR/oYNzQnuP1V?=
 =?us-ascii?Q?82H+UorVKSvO5y8BBkp3FdUT/M6/oNgTxiHHOdnr4E9j24v+voU+OOmp1ULD?=
 =?us-ascii?Q?pYfbyL2E7Dk2pr5JK6SO4//tcCsJZhKksFn2WxtGaOte2wfjbGTPrbIgt4tn?=
 =?us-ascii?Q?dUPu1YVX6fy58JQPIraDPP4PZCDPbcvuau5GmaeoHdqpjFjyAklr/eOemosp?=
 =?us-ascii?Q?Vs5yQHbrPKsFM2Y4jPdKD3AQG0hXI7OQ19zgxR9/UwSYwd334mTi+/WwZ00G?=
 =?us-ascii?Q?xLZxYnXpqfgdphYVH1WFfKr/GqydloYTRSK+XOGx0i3ycHXULUF5dbW3ELGS?=
 =?us-ascii?Q?ggG7o1UK2OssLCWd1/Qwwi4tsICjf6f7+2czioLiTBd3pQ7tnXllBDA88Bgx?=
 =?us-ascii?Q?+nZfoM0y7be2MNVSQdmXyh5JUoTkIZ/R+zeShqVw4PqaOC23pzpiaS+scbYK?=
 =?us-ascii?Q?0uKSrMebrFwMYB8V1RQbAKiqjK4irM0GMhdar6SLwXNGnar9GezdFpKwf3hi?=
 =?us-ascii?Q?nium+7ZGvYroB9aUSsm1+V1kc2NAlOX2zuEWYsfC8eygQipaS/pBQSieRH3d?=
 =?us-ascii?Q?3elnU7f7SUr5kiJWg+2s9Bc85DW9JxdcP9zIKjBLHO5u0dKCcGdaf9ZIvbAq?=
 =?us-ascii?Q?AhQ7H7Ttc7Cp7sEuabrc+KyqRknMWmuml8XfeSVMB6/aLNWEqe3+Qb2j/Hhd?=
 =?us-ascii?Q?J0ikZnRw3ZeH6b6RlsUn/LNVq4Egx+hL9srZuR9msK4YXwc2Hm21bNr/HgVD?=
 =?us-ascii?Q?VpRV08DoL7tPNjGHUoyNrjOHn2KumD/phDK6jPh8Wb10r+lsM6NesudWaF6/?=
 =?us-ascii?Q?2NlRIFN7VFWp4A38mKeNewQztmYagsoxMYKvV1Iq0qm5AfIXVaG8NuEjcGo1?=
 =?us-ascii?Q?5iZBwckNsQWXiqBnQL3igH0jWE53QoOgzLHuPnAKiRPtBqAfIbXTXRdhUwRh?=
 =?us-ascii?Q?y7Ug6LToJg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9350.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c475ff-24cd-44b0-265c-08dedd75746d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 04:49:26.6761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kb801bDHj5YsXYKoUlO65kTn2mKPsMODFDk184IYUQXiqX0lcGsPzIE9JyH7pgimqxSINhX4mo9GAtdrp1MePA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298

> > --- /dev/null
> > +++ b/drivers/mfd/p3h2840.c
> > @@ -0,0 +1,126 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2025-2026 NXP
>=20
> Nit: '\n' here.
>=20

Sure, will remove the extra blank line.

> > + * P3H2X4X i3c hub and regulator device.
>=20
> Those describe the children, not this device.
>=20

Agreed, will update this to describe the MFD device.

> No Author: ?

Okay, will add Authors

>=20
> > + */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/i3c/device.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/p3h2840.h>
> > +#include <linux/regmap.h>
> > +
> > +static const struct mfd_cell p3h2x4x_devs[] =3D {
> > +             MFD_CELL_NAME("p3h2x4x-regulator"),
> > +             MFD_CELL_NAME("p3h2x4x-i3c-hub"),
>=20
> Too many tabs.

Will fix the indentation.

>=20
> > +};
> > +
> > +static const struct regmap_config p3h2x4x_regmap_config =3D {
> > +     .reg_bits =3D P3H2X4X_REG_BITS,
> > +     .val_bits =3D P3H2X4X_VAL_BITS,
> > +     .max_register =3D 0xFF,
> > +};
> > +
> > +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
>=20
> How many of these are comming down the pipe?
>=20
> Might be worth expanding drivers/mfd/simple-mfd-i2c.c instead?

The P3H2x4x MFD supports both I2C and I3C transports. While the I2C path is=
 conceptually similar to simple-mfd-i2c.c,
the I3C path additionally requires device matching/probing, devm_regmap_ini=
t_i3c(), PID/manufacturer validation, and=20
retaining the parent struct i3c_device * for use by the hub child driver. A=
s these requirements are specific to I3C=20
and not handled by the existing simple-MFD helpers, I believe a dedicated M=
FD driver is the more suitable approach.

>=20
> > +{
> > +     struct device *dev =3D i3cdev_to_dev(i3cdev);
> > +     struct i3c_device_info info;
>=20
> devinfo is more consistent.

Agreed, will use devinfo

>=20
> > +     struct p3h2x4x_dev *ddata;
>=20
> Drop the _dev part.

Sure, will rename it.

>=20
> > +     int ret;
> > +
> > +     i3c_device_get_info(i3cdev, &info);
> > +
> > +     if (I3C_PID_MANUF_ID(info.pid) !=3D I3C_MANUF_ID_NXP)
> > +             return -ENODEV;
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     i3cdev_set_drvdata(i3cdev, ddata);
> > +
> > +     ddata->regmap =3D devm_regmap_init_i3c(i3cdev,
> &p3h2x4x_regmap_config);
> > +     if (IS_ERR(ddata->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(ddata->regmap),
> > +                                  "Failed to register HUB regmap\n");
> > +
> > +     // The hub child driver retrieves information from i3cdev
>=20
> C++ comments?

Will replace it with a C-style comment.

>=20
> > +     ddata->i3cdev =3D i3cdev;
> > +
> > +     ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> > +                                p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs)=
,
> > +                                NULL, 0, NULL);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to add sub
> > + devices\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static int p3h2x4x_device_probe_i2c(struct i2c_client *client) {
> > +     struct p3h2x4x_dev *ddata;
> > +     int ret;
> > +
> > +     ddata =3D devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     i2c_set_clientdata(client, ddata);
> > +
> > +     ddata->regmap =3D devm_regmap_init_i2c(client,
> &p3h2x4x_regmap_config);
> > +     if (IS_ERR(ddata->regmap))
> > +             return dev_err_probe(&client->dev, PTR_ERR(ddata->regmap)=
,
> > +                                  "Failed to register HUB regmap\n");
> > +
> > +     ddata->i3cdev =3D NULL;
> > +
> > +     ret =3D devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> > +                                p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs)=
,
> > +                                NULL, 0, NULL);
> > +     if (ret)
> > +             return dev_err_probe(&client->dev, ret, "Failed to add
> > + sub devices\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct i3c_device_id p3h2x4x_i3c_ids[] =3D {
> > +     I3C_CLASS(I3C_DCR_HUB, NULL),
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
> > +
> > +static const struct i2c_device_id p3h2x4x_i2c_id_table[] =3D {
> > +     { "nxp-i3c-hub" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, p3h2x4x_i2c_id_table);
> > +
> > +static const struct of_device_id p3h2x4x_i2c_of_match[] =3D {
> > +     { .compatible =3D "nxp,p3h2840", },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, p3h2x4x_i2c_of_match);
> > +
> > +static struct i3c_driver p3h2x4x_i3c =3D {
> > +     .driver =3D {
> > +             .name =3D "p3h2x4x-i3c",
> > +     },
> > +     .probe =3D p3h2x4x_device_probe_i3c,
> > +     .id_table =3D p3h2x4x_i3c_ids,
> > +};
> > +
> > +static struct i2c_driver p3h2x4x_i2c =3D {
> > +     .driver =3D {
> > +             .name =3D "p3h2x4x-i2c",
> > +             .of_match_table =3D p3h2x4x_i2c_of_match,
> > +     },
> > +     .probe =3D  p3h2x4x_device_probe_i2c,
>=20
> Is there an accidental double space before 'p3h2x4x_device_probe_i2c'?

Yes, will fix it.

>=20
> > +     .id_table =3D p3h2x4x_i2c_id_table, };
> > +module_i3c_i2c_driver(p3h2x4x_i3c, &p3h2x4x_i2c);
> > +
> > +MODULE_AUTHOR("Aman Kumar Pandey
> <aman.kumarpandey@nxp.com>");
> > +MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
> > +MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
> > +MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB multi function driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> > index 971d53349b6f..6188082599dd 100644
> > --- a/include/linux/i3c/device.h
> > +++ b/include/linux/i3c/device.h
> > @@ -85,6 +85,7 @@ struct i3c_xfer {
> >   */
> >  enum i3c_dcr {
> >       I3C_DCR_GENERIC_DEVICE =3D 0,
> > +     I3C_DCR_HUB =3D 194,
>=20
> What is this value?

194 is the Device Characteristics Register (DCR) value assigned to I3C Hub =
devices by the MIPI I3C specification.

>=20
> >  };
> >
> >  #define I3C_PID_MANUF_ID(pid)                (((pid) & GENMASK_ULL(47,
> 33)) >> 33)
> > diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> > new file mode 100644 index 000000000000..0f0d5b442bef
> > --- /dev/null
> > +++ b/include/linux/mfd/p3h2840.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright 2025-2026 NXP
> > + * This header file contains register definitions and bit masks for th=
e
> P3H2X4X.
>=20
> This comment is superfluous .

Will remove it.

>=20
> > + */
> > +
> > +#ifndef _LINUX_MFD_P3H2840_H
> > +#define _LINUX_MFD_P3H2840_H
> > +
> > +#include <linux/types.h>
> > +
> > +/* Device Configuration Registers */
> > +#define P3H2X4X_DEV_REG_PROTECTION_CODE                              0=
x10
> > +#define P3H2X4X_REGISTERS_LOCK_CODE                          0x00
> > +#define P3H2X4X_REGISTERS_UNLOCK_CODE                                0=
x69
> > +#define P3H2X4X_CP1_REGISTERS_UNLOCK_CODE                    0x6a
> > +
> > +/* Reg config for Regmap */
> > +#define P3H2X4X_REG_BITS                                     8
> > +#define P3H2X4X_VAL_BITS                                     8
>=20
> It's not common to define these values.

Agreed, will use the values directly in the regmap config.

>=20
> > +#define I3C_MANUF_ID_NXP                                     0x011b
> > +
> > +struct p3h2x4x_dev {
> > +     struct i3c_device *i3cdev;
> > +     struct regmap *regmap;
> > +};
> > +#endif /* _LINUX_MFD_P3H2840_H */
> > --
> > 2.25.1
> >
>=20
> --
> Lee Jones
