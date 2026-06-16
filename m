Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442633A59A3;
	Tue, 16 Jun 2026 11:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611057; cv=fail; b=Hto4329LG0lPr7+FS/htmceGmOR/1EIM+dROh6RQ/SCDTukCoHpLpQnIZHefBF6GHuq1A3m6GC9PLHlV3Manu/0N0xM5IfwewLOy8JsJyz0MBtESTPgCmPbVMkqC30Yc/aZK3qAOvJkFqEAgcy2l7N48WoHi1dlruyx6r7fFg6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611057; c=relaxed/simple;
	bh=uGGgjVHx7J6/00f2wQ71OQ9SLZQ34cWpNcq1tlz9ugc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jEi9Fmm11Jw/SWsNeqrHrY1vgIYT7KTTVn3y+vqWoFfMSlk6qk06dMHhtSDCi5BHrfXQw2ernEelKQblBqFcrNXYuYDxC+unGB+R7IibJaAS0e0xx41JvNPgG4sDz+RSu2lXjMJR0aVYqrqDnD1HeMcaBMQ8WG0vwqqBYnNXZpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=I83EydUt; arc=fail smtp.client-ip=40.107.209.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="I83EydUt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCvKyg1C9Ld7GQ8JNwTnNOAb3tgtCWmPWAI+vymJwmd7+cIk4dYDyql/g2X4dsTqbFRA0zzaroYh9aMd7b/pr2kzzUR6wsC0vNAXox7ILIa/AMn3JhbtENZc7n9KXoMR6ITLJkMJpfKyL4Y98EzytfbmElSE2dcDpQW9+IwFe/7pstLL46l2v4iOBSHt/uwYo1ldUTzDiU2znx+lrK99oEq6NauxDYnkxYn1c9HFsfvkPINLdIpECR2HVS/Txu/EUDKULYquP/fM94xD2pV/KXhXqyb+fG5SyEIRftxSV/hALVcjGNw6MZzoRKCwH1MbVecsN7QLZLOOGEi1USDCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=292836OHmik6LuEWDCdPONaiyMHwydssqfLlbfuwMks=;
 b=K/p9G6/35joRs6DSxmj3YW0NmlxnwerjaHCl+xPmaTkTAH0QXj+fyKLcqF7mJOKfh4zvvj0OoEwNklqOFD2189v57siocWQk+F+P16qp7fNya6bZ42qHKjHZAELV1REzoXRu/mvAuMUpt6yyWVoEGcGZF0Wdy+bt4b+HpTPtr4gtKIVq/M9JDRU7VDyw5x7lZ0RMaU+6bq6ZUS5qAw4VyRrIKWypdDWTzo/pU2wIH9Xh6bCsZJUTUybUzrc7ADsKAHvRu+NVP0etdgw7w4JtKnVMfmvAnvRpU0ZurjC5SZuqPpXo3M7DY1OgW564F1BRh9Q+sHa6heKCpdz54CZqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=292836OHmik6LuEWDCdPONaiyMHwydssqfLlbfuwMks=;
 b=I83EydUtVZrbc3u4OB/z4xt3r5imvjnx/zCOH1rIjSxuSChCU4tKf84WUCXgTfgRp6H+BrLNJBK1BbVL0qf0uoSrbmpEMSf0eGsOQQGg3QywWa+ys9iCuhLldplXfjXh9/BsigWk+cukaq/IFZst5qkVSSYsZh5PsB/0AmNxxQU=
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com (2603:10b6:a03:53e::6)
 by SJ0PR04MB8344.namprd04.prod.outlook.com (2603:10b6:a03:3db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Tue, 16 Jun
 2026 11:57:33 +0000
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0]) by SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 11:57:33 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Min Lin
	<linmin@eswincomputing.com>, Yulin Lu <luyulin@eswincomputing.com>, Samuel
 Holland <samuel.holland@sifive.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Pritesh Patel
	<pritesh.patel@einfochips.com>
Subject: Re: [PATCH 6/7] riscv: dts: eswin: add I2C controller support
Thread-Topic: [PATCH 6/7] riscv: dts: eswin: add I2C controller support
Thread-Index: AQHc/YdQVHe+ytLueEiA0BTpv+jjhg==
Date: Tue, 16 Jun 2026 11:57:33 +0000
Message-ID:
 <SJ2PR04MB8896A5877CCFC177FA5D5A9583E52@SJ2PR04MB8896.namprd04.prod.outlook.com>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-7-pinkesh.vaghela@einfochips.com>
 <20260615-lumpiness-profusely-155422288c31@spud>
In-Reply-To: <20260615-lumpiness-profusely-155422288c31@spud>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=e0446bc7-b35e-43e4-b679-0cd3fa8ec4b6;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-06-16T11:54:30Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR04MB8896:EE_|SJ0PR04MB8344:EE_
x-ms-office365-filtering-correlation-id: e991f572-4e79-4b44-75e5-08decb9e7346
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|11063799006|55112099003|56012099006|4143699003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 EIRCM7jaoKJ13d2k6cWEb9VSC4giDUsYGrEFXCPsOQnl2INt7LRc6aTe95UxvX/3Yscd+XJCF73no+pkGxTG7Lb4zaB+Ukod2FPxFpFVD5gQmHyYynQ7xzyAJYUykDrkJwfjNdz668vsA24cXGS1+RxZnawPOf6rs6bnWFWuf59fMVE37FSVNYeuKhHvjRvlhP3c+u3L0b1RyWN/Md9SsjKGvZ9fT2aJ1eXqIGKOwPAk0Wzh0BiXcmpckVLExhQSddEDS+Mm3SANCqZc+HbnKoNk/0cDjylMoDDLT3HQMp7iOFHAjs+8ruU/Lo3oZizjzvb2h+yYVx3OCyv584IfZCFOaycmvpneGHwrQOHie4o8PkAst1Dq4CAzm6A7jOM1vaK7uSISR77+pMXVqZ8OMmf0ZXApzfuVXpF73HfSbDO3OwjNkwKP2ygRdYlmzBvBxQlANkvobiNXLrVwm3be8rhxOkV9jkeVTWt60VOpjaEyBsesJEs3+I+Owoc3ezHxGEB/eCSbwj6dD0GA1r2TFPonLbjxmn4+WuuPMV1QoDHCNQVivKirmuLkT1VqzN2SBU9fsclUuowW1ftoq6z3E8sF1GpcsoXLfhps8q/fPC6E3EjNuVkPoIO/cxOfpk2u0tF/4z/BzLd78gVULl2sE0H1NAZLMYhSoj9L89zw5gYKurPwEBxTJeImhN5POst9mKnM5Qw1YlbaQc9j1r32iYnT/HkgfEGo/+pcJb+XKaRme/+AQCZwTVfPdldKPWSt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR04MB8896.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(11063799006)(55112099003)(56012099006)(4143699003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Dm6IuSR4rJAM9Y6yYrSKuE4Il82xsc/C0P8ipE+4h9CVNCWPST0Wdmc5JJJn?=
 =?us-ascii?Q?2anUEYc+wD6QNL1wGMK6jfgLbgNbaxUdNE6CzcdCyEr6HfzAot4+my+he3fG?=
 =?us-ascii?Q?DmebGS+QsKQy0QW3A6TG4BurHrX3uhunubz6WBAJ/gBqZyCU/kSz+3uLwKOJ?=
 =?us-ascii?Q?ZVoVnFb2x3AmqD5eyujIe5Ailq/oR7LUm9kQa5gItBiqPhng9B76BVKauq8z?=
 =?us-ascii?Q?QYzxpLRDFslusu4Qof1aJ3hLiO6Er3lo+4Q116uR8H/52wZ675XLguN3bWXF?=
 =?us-ascii?Q?9c1AIg6BSDlI2LcjpSolxugDQc4yBmZM6VNIOq22brKy008R5qry1jLV4lQh?=
 =?us-ascii?Q?V8yyMUghBmpqoY6rrTlruyEazEJ4uyPwA8+JtWO/aY9MhTKazkfQP2Oh41Gn?=
 =?us-ascii?Q?tXbLDZ630hE5458CelDFPNtRz9NCbrwfITY8Py6me35zNo1/bGtKDVsW/Pwl?=
 =?us-ascii?Q?BVmiybGXEMbyviqgKkGPnA6GixPYO/oTQk3FFMJU6d72LBrRQGXbNKKJYumg?=
 =?us-ascii?Q?6+CjSHB4+HXs61WhZ8UOxyWA1tK5Mzcip3UyG6bIX9Ph7KotgZ00WVIxT53i?=
 =?us-ascii?Q?oLFsdyE7i5Op1ejytL9TE9pr5tExQ292siBadh6YPelFzhSDpJi1DcPryXtQ?=
 =?us-ascii?Q?vLApFykCJlVNV0UKUI3qV2BVJua81x+wyeLa6FVTdNlGGBaS/+murNuvYlIU?=
 =?us-ascii?Q?MbPDWJ1l7KNAo2Ee94Tb2Yp1OWy94j4hLToxzVKelrHpUFX21uLCIYOAt32l?=
 =?us-ascii?Q?CIn4gZz6GXRlttAfSIuhNU0g/JFwIBeAw+JStl0SfrbZfzdEWKpkMnR3IVaC?=
 =?us-ascii?Q?N4feRcEHEX2ZRHLigj8m+i6wv3lgO6wUDE3XAUEWyW0diTmteH73fijMEoDY?=
 =?us-ascii?Q?AbHTwoaN49S4BacebtGo41IFVn4qwbhHruBCbMGXzk+yff+K9pYGHDo8FbvR?=
 =?us-ascii?Q?3dEljsGI9iRcrr5YFNoNbHwjOAiuIJEyKiIp2Nz5kG3TP2kCczBTMRzmyeeZ?=
 =?us-ascii?Q?6ULYKPDLF5WtBw42krjroFn8E02+unz2d+KNKjaDNY/AjBw1f7deBKZjTMy+?=
 =?us-ascii?Q?195uNYUzs5TVcpXm96+eZNp1RBO4AaTSs5stBNYtdCFzFq3zwbjXNDma5nPb?=
 =?us-ascii?Q?TZJew1u9jt/PmNbkA9NIjov4H96bzVRcFGqfwVYabSO3/h1UpS/enVRNUtv0?=
 =?us-ascii?Q?FAUGkesF1TFUNdHHQlslkK9+YMnXMSwYRn2Vp4ejGTg0/KBDz0mLZpRv76I3?=
 =?us-ascii?Q?XfPvlazyAFsWPUHSsOFLJs3AKiQtPQdoIRlxewL4Wmw2L4dakNU+l0Gm8CiX?=
 =?us-ascii?Q?xqfoUho0fA6fcOxrLMiDq2CuvGr1WIkr/PYdmjSNUs3AfS1Q8ehQoBw6bgn6?=
 =?us-ascii?Q?cLfEaDuSr97svO5o5eAi3ks5Q8qNkQ/5qug0BL50w7f67PhoE4UlrPXIhQzq?=
 =?us-ascii?Q?TIFdeqm9yJy+XZzmwXYCILcBCs5u07n9PYg3Jq7CVqv8fjrf14NMnFGXOjdL?=
 =?us-ascii?Q?2GGcbaF/3LyyQjefkpGFG/OkuvViDl53/KXbI2qLb+y1j/viFlzYW2Cq6znA?=
 =?us-ascii?Q?XrLihhrGnw8iE1XJyvCcwWGMZc4k5r2U14ghnaqTQ3EauFCOVk/B9QJNSgDn?=
 =?us-ascii?Q?OwwsckLFfBBJprld+m7ld/UckphD94ZRICsFJOtjeAaCkRBb5pSQrJ3JuCoc?=
 =?us-ascii?Q?TbGSTh++K9Zf3lYr8ofa0q6lreW0W7yipK9jj8D2HJ2ujU/weeLozD4N7s6R?=
 =?us-ascii?Q?3Oup84rpLqYPPzE6MwDwdBV3w1FtWbc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR04MB8896.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e991f572-4e79-4b44-75e5-08decb9e7346
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 11:57:33.1868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jJPaDDb7aobmaEaUJRKNqiXRFX7halypcDeQlDnlq9AxaBk/OgM1hTn1jqhz/ZJrcsH+9SQmDn6Vjdftwq32CBRk8X7w22WCbw+KOpWO8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8344

Hi Conor,

On Mon, Jun 15, 2026 at 10:05 PM +0530, Conor Dooley wrote:
> On Mon, Jun 15, 2026 at 05:50:15PM +0530, Pinkesh Vaghela wrote:
> > From: Pritesh Patel <pritesh.patel@einfochips.com>
> >
> > Add I2C nodes for EIC7700 SoC.
> > Also add nodes for corresponding slave devices in dts file and enable
> > them for HiFive Premier P550 board
> >
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > ---
> >  .../dts/eswin/eic7700-hifive-premier-p550.dts |  52 ++++++
> >  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 156 ++++++++++++++++++
> >  2 files changed, 208 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > index e7bb96e14958..0f0c98474c62 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > @@ -130,6 +130,58 @@ &gpio111_pins {
> >  	input-disable;
> >  };
> >
> > +&aon_i2c0 {
> > +	status =3D "okay";
> > +
> > +	eeprom@50 {
> > +		compatible =3D "atmel,24c02";
> > +		reg =3D <0x50>;
> > +	};
> > +};
> > +
> > +&aon_i2c1 {
> > +	status =3D "okay";
> > +
> > +	pac1934@10 {
>=20
> Generic node name here please. adc I think.

We will change this to "adc@10" in v2 patch

>=20
> > +		compatible =3D "microchip,pac1934";
> > +		reg =3D <0x10>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		channel@1 {
> > +			reg =3D <0x1>;
> > +			shunt-resistor-micro-ohms =3D <1000>;
> > +			label =3D "VDD_SOM";
> > +		};
> > +
> > +		channel@2 {
> > +			reg =3D <0x2>;
> > +			shunt-resistor-micro-ohms =3D <1000>;
> > +			label =3D "VDD_SOC";
> > +		};
> > +
> > +		channel@3 {
> > +			reg =3D <0x3>;
> > +			shunt-resistor-micro-ohms =3D <1000>;
> > +			label =3D "VDD_CPU";
> > +		};
> > +
> > +		channel@4 {
> > +			reg =3D <0x4>;
> > +			shunt-resistor-micro-ohms =3D <1000>;
> > +			label =3D "VDD_LPDDR";
> > +		};
> > +	};
> > +
> > +	ina226@44 {
>=20
> And here. power-sensor.

We will change this to "power-sensor@44" in v2 patch

>=20
> > +		compatible =3D "ti,ina226";
> > +		reg =3D <0x44>;
> > +		#io-channel-cells =3D <1>;
> > +		label =3D "sys_power";
> > +		shunt-resistor =3D <1000>;
> > +	};
> > +};
> > +
> >  &pinctrl {
> >  	vrgmii-supply =3D <&vcc_1v8>;
> >  };
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > index f8caf39616b2..28706431b2c0 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -315,6 +315,162 @@ uart4: serial@50940000 {
> >  			status =3D "disabled";
> >  		};
> >
> > +		i2c0: i2c@50950000 {
> > +			compatible =3D "snps,designware-i2c";
>=20
> Missing a soc-specific compatible here for all i2c controllers.

We are using generic DesignWare I2C driver for all I2C controllers with no =
changes required in the driver. Do we still need to add soc-specific compat=
ible for all i2c controllers?

Regards,
Pinkesh

>=20
>=20
> Cheers,
> Conor.
