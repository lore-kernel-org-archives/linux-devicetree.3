Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012068.outbound.protection.outlook.com [52.101.48.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4543C05D;
	Tue, 16 Jun 2026 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610841; cv=fail; b=GdyBuCQXF/Mxbp08vrRqy6tRjWL3vV8OAL3TeOZijyV6cmHZXnu13zgAVYe/9YFja0Ui6IAj1yzioD/aLQ9BlG8hb3jaPo8PhzhqfWBh4IPf87vOds/V/iQ5dIAhGuY4tYYwKX9CMh7TuUnyjJi1EIFL3eLHfUmB8hmCv6mEkc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610841; c=relaxed/simple;
	bh=tHaFyGViQHJKDxnH5tyX4Gs4F6PX9HUov72MNr0KDJc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ECA7WqaVq933lpcs3RebXUMvGkdO5gAAG3xlKO2UNyCd1boaatBOoZnGP4ddBjBdFKBGrKFgaaURwjJUjg/cWqCF1ySzQQP/5aCymw3jrv6PbIYjow8iUfZ4tzh8BVGQ4zJ+cnt2k4NFSEUrENDOZi38s4PItLsGdjXl5+uu1EY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=eARa5/mG; arc=fail smtp.client-ip=52.101.48.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="eARa5/mG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grWG98NopqwB5ZvLbhpgeAQdTwE07A/zPlEIZCAnRAyUEccPr+XbY21S3oMqp192KX1i/orXBB6VHE9eWuyY/NasvVKWL11TqJ9TqAJg/m99kVnxF/y5bp8YSmxa2hEe7yGmCjT7zcofJT4itsuL+HrW03+rhJz2fWfUe+HesHkgTxkUizuRa0ISB++j5zbaF8EeqgIyn9CLEzoLpcFEf14AdC4FmfqZRvKg9CCqCtXBUsh+1frDl7J7VAMR0npWmeVVzvz5ePYqHCrAlib7jxVUWZf+KkCb1edZIoVV64/2liDjylsqMZMjMFp/MC8FwAJvU3WP58oxdN4+bd8nGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=416uhaOTv0I/rEPoH4FC76IfyccAbDuNfgny4NbLVKY=;
 b=iU8iRIkxVnefIS5oc7Qf5PwpRKa0SRxKVuhNuQL/AtI3cR0IygIimZT3H5kSuB84HBhfsoOpJCMq2F4DqGLKHlrWs2aLYsLgoV9IyxihHMgMEvozB0U6wiw8NafJtTbBlbjnWOrW442DjfWj/Z/L1pRu9N44rbzq7HXLMsVeqbSYCnkc26xYQ+zeaH/uBFFOIIsxWndinIMgZG1Qocm90KHz0QvtIsJDzsWVvWSyu8rtO9o0et7x/5+OHA6KwdmaiM3jkKICAlZdtpxnf5cc0dTc3GRZx6KjcpDq0YgCOWlJYmjsj9QADoleou1NwJrR8tGiwyL43eRRFOyI8vamBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=416uhaOTv0I/rEPoH4FC76IfyccAbDuNfgny4NbLVKY=;
 b=eARa5/mGi2t31BvN3RKCXYbTLwiawJ4W/Ivbod4GlMuClVQ2asd+jMBjXBJOBnB0Ze6p23E2H850WRHqfkRlT9Zn09RsqazFuFjOztxbGqtN8Chow0UezKL809rFGk1dVZbdOwqAIWuMBa8GgTTfvP58NisoQB+gAjoecgmK2qA=
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com (2603:10b6:a03:53e::6)
 by SN7PR04MB8643.namprd04.prod.outlook.com (2603:10b6:806:2ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 11:53:57 +0000
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0]) by SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 11:53:57 +0000
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
Subject: Re: [PATCH 2/7] riscv: dts: eswin: add clock generator for EIC7700
 SoC
Thread-Topic: [PATCH 2/7] riscv: dts: eswin: add clock generator for EIC7700
 SoC
Thread-Index: AQHc/YbQqZsNM49l8Eu6err0REsqvQ==
Date: Tue, 16 Jun 2026 11:53:57 +0000
Message-ID:
 <SJ2PR04MB8896D17DEC731A635C0856F383E52@SJ2PR04MB8896.namprd04.prod.outlook.com>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-3-pinkesh.vaghela@einfochips.com>
 <20260615-overshot-pellet-5e527a14133e@spud>
In-Reply-To: <20260615-overshot-pellet-5e527a14133e@spud>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=8589abce-ecf4-41ea-b9c4-eae842c75f70;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-06-16T11:47:04Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR04MB8896:EE_|SN7PR04MB8643:EE_
x-ms-office365-filtering-correlation-id: 8ba06bff-a01d-4e01-ca9c-08decb9df2d4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|4143699003|11063799006|56012099006|22082099003|3023799007|18002099003|55112099003|38070700021;
x-microsoft-antispam-message-info:
 XPW4HzM+vnzqV6a84woSQ1O9ssC0xsqoYLAbDj3R9jaIARrgXWgI70YobfdzndrslxTvueo8dtuXvlTzsOPgzubH2x3hlYTFSs/b5pF7YJGkZwoyOLbG7WoYvZWQ3sOPBX3i9CGgm8ToayA/8bThuKju7fziV455H40zhwGWmT6JbREMblUyzFuPCd+FQTTxiA4tGPRiS+R1t69/9jaRQTA42Hj8iuB+pvBp6HvMpTiFlQnL0jT6Gs7zrkzNvBRcOWvNZcM0zWCemDXBfjq9TwMgLeTa0q1NbpzMB7Elyev++zGzRl8nCqz1cUmv+FuMEUJE+wJTPRIMY6pdA9uX3bLy8zc5glra+6fOshgGv1qhRCDxtg/CRk4JN0b5iLBDWRJKZ8iNehogLmZ3SP+Z7H2OGVdY4Gt7/BAuZMtxAQDI5mYRjqWue8kWU7610phG22IwDSZg5pijbYHd/iHcGKF+JXlLGB86VoNirZcl1ZFfi8HT9c9nUz710bOaHk/DWqMk2YxCDmJk9Z/VtL5OfoCd/6nDsq5110QS6gdnCVhvdMd9aPKcDcoeZjvx7wNphfEGzEIz8UkNAtQtHdGhN1M0OFNvoywlfA0kTT1N3UXrMRTKBN84A+PcK5Pvnd6saxyuwTP5fDXiL5js+BXktOl/uWy47JeDlp+M8LVwbuD+LIjN7M5MGEne2Er+hfE73ZmlnaMMGeq8fZRnRd4pwfQ4isC9w/i4aQO1H1eePhZItSNjMYgAXgNGpDk4a0m1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR04MB8896.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(3023799007)(18002099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tSgyPEAHU60nyMAXtBgpTaqF7opT+9jiKiJjlnVkOlfswc5PaJzmQgkyXxo1?=
 =?us-ascii?Q?D35i8QVAB+dZfSa7SigF0/27HgWxoB5bNjJqrUDG+pxwgEUGWWouMSeaVbhK?=
 =?us-ascii?Q?n0ecdEHB669lBv5COOoY8MuLq8UWlxTf+p65QgVW74JY+hvMK3CIpkUbCsGt?=
 =?us-ascii?Q?CscHGFGkXbhdehX1QVSk60ug4mwTchmlqUt5sAotWE05TqxWMCArU2uHCtrm?=
 =?us-ascii?Q?2E8E+dAhk3adasjxBytOVCWkF09lzG5IGNjf7dbuYCnv/XSp61uFGp8OT90+?=
 =?us-ascii?Q?YP0HkDiw6Pdxgb0vqbAJpqHfoEVTs9RBFl64ltiKsJp6ms/UgVPb1I1FGcdl?=
 =?us-ascii?Q?91M0Q8fq6/aj4PM1xOGlShXq911NOroSc4AAFgvo6A1lkvQ+1sIGwGlgEyJP?=
 =?us-ascii?Q?M4VQ8DeIZSxCcIh4riJaodnLK7BflklEqCnvRlj6hf3mVLdRM5veM/XcbOF6?=
 =?us-ascii?Q?yD5bp8z/KtOCJR3u8Ke0du/nBF0mPxDWYWEBDAtx0JaJAIGhRuLaQAqPfUiH?=
 =?us-ascii?Q?Rlls0vXuGz2f00IQdDzEvMFry1s2t5Fh0GHWRC6QY3rUXWLxpL9zDQ+N3hNt?=
 =?us-ascii?Q?AzX7EDoH0smAqVyPuklNsUeiL6COXzC9wLdkShQKEpXdAliRtUYQ/r3kEdC9?=
 =?us-ascii?Q?MhH/LrCQ2X1I17JqGSKo9wQ9OK8/t6u14kFyA91ODWoJQuBmhEO0EkuZ5Jf2?=
 =?us-ascii?Q?oCzfr7l/+mNu9qBI81+y/X/3tZ0C6wehO2ubOhDTRGmiWR303LCZcu2+lXDg?=
 =?us-ascii?Q?qrM8WSE+2GOw9Y3I/6rmjzFp17gnUtkl6DtNDgoxP5WbAWenzPK9Q0MC4E9t?=
 =?us-ascii?Q?mJr+3uybdd6y7PxL2p1WCtinZt+z7jgaLyY0yCyvxgyzKGHcNuqLLdG92h/z?=
 =?us-ascii?Q?AfEoO7Ik40ZUvLVU/zWLaa4j4lx5Cg20ils0fyEDYttDUpKPlc94oXi201Ky?=
 =?us-ascii?Q?5500DUOUO+qskPKdoHZ6zmLiqSao6r7ywqpZhM1r07L9QHUbaUXjcwdwSH6+?=
 =?us-ascii?Q?G5YFTBBmg85Tuqm4YowI3BSj6xyn6GyoHjo4CDBjcbWyiU3Ubtz5jwhrqq2J?=
 =?us-ascii?Q?rjBqTJzm9l6/agH5ELUd2pLDUDf/vdoACGe8gMNCeQUdNXeJIFDJ3mz6ff2A?=
 =?us-ascii?Q?uMPnCuqE5W4OSXlp0nCmwoUFS4CpOHxtjs0s9V4K2Q0IX9CmPuXKfwzKeuzU?=
 =?us-ascii?Q?Sbv/6k7zPQWxlOPbCsmG8KsfB+JfGLa3bCYPmbhM0uKTL4ZulDzpOISWj/lI?=
 =?us-ascii?Q?9HznfLmEeSfi3E0Byro+v/QvmyRgRCmu/iL7rUEIMioNEJr42Q8LOq3ANqik?=
 =?us-ascii?Q?Ygz/IGVg7wyoR31ey+aV+pR/Hf1DknwQFYEr4uuGfMlm4ESgs2BOW8k0GvrR?=
 =?us-ascii?Q?FcPlsc36I6DppLwAUFu6qMSlDiutUvPN4F+bKt6PgEMXJ8NnrlNFt+qOG31Y?=
 =?us-ascii?Q?4MQAvGz3MMe8/8GrAcp/6Zh8nlipja8p57Xn6h58TUCYKfl5bpOu+m+IXT18?=
 =?us-ascii?Q?YXHw61vSo8vYKbWblzqeyInca+w69ZlAzwGofvo7UoY9PybiPihzyzj0hjlv?=
 =?us-ascii?Q?xXm8GcNOty4DJkQg0NOm2MGkthm0qjDNrz5c/HSIKJ+nUKX2P4boO7PHa1Vd?=
 =?us-ascii?Q?IJVQu9qVASNk5bvFxloALSUmJTtBZfvI/iwB2fslYp+cyhLMVOdH/a83yYTk?=
 =?us-ascii?Q?3VgAvbhrm+oy4P3stRaboCE11unkhdCYI/cBnooH6uDvq5hIFI+rolNiJR5g?=
 =?us-ascii?Q?Tpd+fUR6fukbBsmgwBPd3bNljxacwbY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba06bff-a01d-4e01-ca9c-08decb9df2d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 11:53:57.7480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l9dS3+IqEEFPOWfEKn4PqQ2JKNjYrAH/+JTbwIylukK9O2c0H6Bg6I12C1hb2nvNn/OvrA9HQsBWOtg68RiiBBdT4/UmuseUyvId7d/9L38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR04MB8643

Hi Conor,

Thanks for your time to review the patch.

On Mon, Jun 15, 2026 at 10:01 PM +0530, Conor Dooley wrote:
> On Mon, Jun 15, 2026 at 05:50:11PM +0530, Pinkesh Vaghela wrote:
> > From: Pritesh Patel <pritesh.patel@einfochips.com>
> >
> > Add clock generator node for EIC7700 SoC.
> > HiFive Premier P550 boards have 24MHz crystal oscillator to provide
> > the input clock.
> >
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > ---
> >  .../boot/dts/eswin/eic7700-hifive-premier-p550.dts  |  5 +++++
> >  arch/riscv/boot/dts/eswin/eic7700.dtsi              | 13 +++++++++++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > index 131ed1fc6b2e..1fb92f0e7c55 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > @@ -20,6 +20,11 @@ chosen {
> >  	};
> >  };
> >
> > +&xtal {
> > +	clock-frequency =3D <24000000>;
> > +	clock-output-names =3D "xtal24m";
> > +};
> > +
> >  &uart0 {
> >  	status =3D "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > index 430a210f01e6..a7ebb1115958 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -4,6 +4,7 @@
> >   */
> >
> >  /dts-v1/;
> > +#include <dt-bindings/clock/eswin,eic7700-clock.h>
> >  #include <dt-bindings/reset/eswin,eic7700-reset.h>
> >
> >  / {
> > @@ -203,6 +204,11 @@ pmu {
> >  				<0x00000000 0x0000000f 0xfffffffc 0x000000ff
> 0x00000078>;
> >  	};
> >
> > +	xtal: oscillator {
>=20
> Sashiko feedback here on making this clk-<hz> or clk-<something> should b=
e
> implemented.

We will change this to "clock-24m" in v2 patch

Regards,
Pinkesh

>=20
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +	};
> > +
> >  	soc {
> >  		compatible =3D "simple-bus";
> >  		ranges;
> > @@ -343,6 +349,13 @@ gpioD: gpio-port@3 {
> >  			};
> >  		};
> >
> > +		clk: clock-controller@51828000 {
> > +			compatible =3D "eswin,eic7700-clock";
> > +			reg =3D <0x0 0x51828000 0x0 0x300>;
> > +			clocks =3D <&xtal>;
> > +			#clock-cells =3D <1>;
> > +		};
> > +
> >  		reset: reset-controller@51828300 {
> >  			compatible =3D "eswin,eic7700-reset";
> >  			reg =3D <0x0 0x51828300 0x0 0x200>;
> > --
> > 2.34.1
> >
