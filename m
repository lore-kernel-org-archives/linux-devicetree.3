Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2127.outbound.protection.partner.outlook.cn [139.219.146.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F2939A7F9;
	Thu,  7 May 2026 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144760; cv=fail; b=uhCttL74Ftnov4O/rN3GnGa73flAfmROmk5MBsfwp/zwXotnOAAVsgqqDR1NuEn0KGUsjN/nUjWjVdJL7Zz0h/eOobjDdCfRkaZHoS0FzTHplphoCF8Pd40M337VDWqXOzxh4cquU/AqQJnMwMj6CfBzpV+uwilHRBsS+c8sudU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144760; c=relaxed/simple;
	bh=5x8L4Z3fY0PG2cG5WFYgfyafCjzvPCkTENlgL0oY3iI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V08OL+LBjgQO0P54BorUoxVr7sGYzC2Tz7uCi/i7IN5GvD8dLm2fzR8bdLrJQKlx/g3i3tL5voKThXPcodQNjSvPwKBo4DL0CruVzJJAxhMdDTxlC4M5joWO+WweVslAOtLADYnb7SFVkCwdeZsyA0/MQcyt0m0q3JxaVOTa9Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Legn7hLqMf9Lp/ZM8HeoTg4/o1J8khjncXc6RWs0kf5bnMltCVFf+X4WLJADG3AuTbf6xcymqTxD01oOoIHuaaWt+6ZjeIC409sxL79GlzBAHLdzteFTilJv6mGWpDmBu3sf9ELMXNyz8bRq1rgzIaL2fy7Y7tNDx9ELmZ2offBdlkv8m95rAtHDA7/aREmFUvdZ2tkA+rLwIUhpdArXFVLei9ty7lk2yTEuQSpDDC1YpZ0v7pmo4iz1LT+3RXHbutXTQvij/UxQgH3AKPjNfHgyE81lITQ+TTASW94n8NCa5I9li33SCMfCBj8p+d8bFj/ahQ7L6xEuijbn1j5ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zK1G8644XyUmjPhdjNXOWc/eT6HNb9ow4y66/QFNjKk=;
 b=NFI3qphu2yFWBtYp5bgMufSRADKxp5ZXS4zDQkLZx67IKZYiwSGnSFWVtrgS3W4eMdTWYfimSE5f8QkfxxhwjgglJzNRYQQ93GuhA0q/UYtivGIFymoEN5UHqOlOZA705S2FPXn6XwlDkhOWBITLTJFjmkjM8ryemyA6cqYb2gLh/iNs9+Q5gdXse1HePqwC/S62E7mn1T74dmKXJBTVFcc+nrOADb2tGzf8aY97SV8+omz3vS1vrGi1rkGJOROu7+vvaaVIddwlqrvWhZ7ozNtSUpzub01TKOYxIhVJYNnMhRo+6w30x5xgTuk7wyA3O/9OWy0MK3cyXyHzoR0VTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1277.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 09:05:44 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%7])
 with mapi id 15.20.9891.016; Thu, 7 May 2026 09:05:44 +0000
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
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Ji Sheng
 Teoh <jisheng.teoh@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, Michael Zhu
	<michael.zhu@starfivetech.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: jhb100: Add JHB100 base DT
Thread-Topic: [PATCH v2 4/4] riscv: dts: starfive: jhb100: Add JHB100 base DT
Thread-Index: AQHc3Ta1aYQ9BYJ5WUuCYGnurWo3wLYBRaSAgAEBS2A=
Date: Thu, 7 May 2026 09:05:44 +0000
Message-ID:
 <NT0PR01MB1216090A629C0095441617F6F23C2@NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-5-changhuang.liang@starfivetech.com>
 <20260506-proud-dubbed-9ab8011df899@spud>
In-Reply-To: <20260506-proud-dubbed-9ab8011df899@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1216:EE_|NT0PR01MB1277:EE_
x-ms-office365-filtering-correlation-id: f8560932-f142-4ab0-7855-08deac17d23a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 4ZhV079/sv4DAJZUk+JkAv430aRu3HFoR54wJLs2pPPRJp05HwN3fcIeSXeblUAqOAKu2SlCcNp2Ddp2Ky5Tiw4v5RJSNdwsCuHNB3hmZX7CCUU4ZPJ6Bc3+Ah7UeqJG0qxwhgsb9l3H0KIo7G9uAv6UIfvD3B3rgKq9ln60ONfjFrBQRFy+UYNjEyJKImuT9nSzdmJZLaX2b/y8VXBmiQ4oOXU0dGxyu3gUmpJx8hbTpE1bWcTp4OocMrZUFhqnE3L+LjB6K13l6kSdZUEIoKu6On7Gme0uDMr/Z8Tbcx93Aa24+awWAUczshFJW+jjuuiWy+Q8tBpWFyDAdGOHfdf8Q2vJ+FzE2NuWPgTxOh2/TU8U1mbs9TNtufzA6IupIAQ9ILyXoA6koIobRhqGe4uqv6SzsllspgBq3UWbWekgo6uOPZSKyeZgxUVLOIKHs04lCrHUXHT/AT5yvENozDOjxf9B13jI+SK8gPzcJm1BDxESucV+FTijWEY4cPPB+q58JKVwJa955Dp7nV5/OucToYXQW3U2UewREYvckFE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?w5E+PvJrMyM6dGjYvIg+A1T23ANNIR8YQlfFzA7V3N4choKJxpKQxn2m4Z8v?=
 =?us-ascii?Q?W6ppdBasuecU0MrrM73K0f2BpEzg9Mr2K4Lt/sqhpbUMQ+khQocGJ9ko2U7b?=
 =?us-ascii?Q?xsG0Oje0wViUY9wpXG6ton78xUCxln9N/L69STfUnptgo55vjrLCwJJNOWD7?=
 =?us-ascii?Q?qgF8x2PLWAJ3C979nv21dJbCEQl3hj/pZVMvRSPV/aN5FCgiNTI1Fiw0VT+J?=
 =?us-ascii?Q?7Vt8U+v1RdHQtwySPtjecpn8nYxXixTUOKw6Shf0OWu/ndlvv799b0JAMkU9?=
 =?us-ascii?Q?kjsy1oiu245io6Fd2RaxKLWQbJjSWrAiKyiEp6ALt1G0Lu1A0F4Tr3pkZ7JD?=
 =?us-ascii?Q?iNeZtj1vQonZ5EWYAWBm6LaR+5WEs8vMjZYqbGHrcBx5pLIvrM5AV21wRg8S?=
 =?us-ascii?Q?3D97NS1N+/teYd0zsWF/i1JKtC6KW+H7CiTF2B6NjEm7l5MwBGlblPF69dJy?=
 =?us-ascii?Q?tBwjSB4I/i4AP0q+n47uJYfYLr0Xtyeg8seQyfd3QUW/fA+fJWSEX5YIXr44?=
 =?us-ascii?Q?5jKGC7Shf0RFqGBH7XKjDAlgr1moAZRFg/eyA8OjCHjxwSO5XQ8Un1VNBgfz?=
 =?us-ascii?Q?+GoDwgsb/XDxJCCpuUdQ74kbRl+ATXDgytYi4dX5ekw1rlXiHl9WQdfBJweH?=
 =?us-ascii?Q?YFH5hiKEynX0lWEFUUOBXD9O3V/Cx9293ZLgMnGI6cu8+zuYW3yr0Z/wkxp1?=
 =?us-ascii?Q?XL/OP3VCKX2HLyDL8kCXhRmt/pAT8DYLu56hWghYjjB9QpBmGVC7BMtt3fEL?=
 =?us-ascii?Q?SVCdGJ2i4ZPNrDCK33gbztQcl3sYFE/uBJWe3cKxoeE9sERaHxt9jNqbmcoA?=
 =?us-ascii?Q?deM7tXe419YLNpuObxc4jdLVvwvS8GiqivhWvlYfBgFReVaqmKFNK8eDHel5?=
 =?us-ascii?Q?mfs8cGZ3IrigVqG2cHxKi5UK2oKYaVhR8gl497CRkYujBg1bGZsazGQI1mVq?=
 =?us-ascii?Q?S6iu3US3Qa4REjlWPduuIYSG4HUXKTOxwQyzK27Eu2Mae2pbM3lqHA+mFMZe?=
 =?us-ascii?Q?lQmwXaIm0BrQsLGIuQwnmo2SOLSX+XRsiNvrIOp9ofzcIZs3KvDvXqBtCRDT?=
 =?us-ascii?Q?fz8lxmSqxMh1ujlSMlXnJXuhJAKbOZvNRMe8zR9OKWOstbByOjRYYn+fRVoZ?=
 =?us-ascii?Q?FYxsyImkHj8empVTt6IeCv0/18pcc7NzwJE0RpsQ0rNIRu79TUGy3syHzex7?=
 =?us-ascii?Q?EufCXx7T9wo9+0I3E8gH40jC215Ng3APak2RrTWEPEkaAxKzmc1EZjPhMExw?=
 =?us-ascii?Q?UOWIm2vo4FEX7LEcZ1PrPAFW8Phh+XO1ojREU4+ICh0589GqFXmSPpjmPsFt?=
 =?us-ascii?Q?eJpDsL73uf5WFTU0lSOqZ1bu2VK8W5/y+DsvBmDfgaHT1/fFuEm3VXL2NWFs?=
 =?us-ascii?Q?6BKan4gQPEsZejM7b8sLzBmSTOThniT6SjqVmZCjzNKzGCUOEh0MiUUmKQpp?=
 =?us-ascii?Q?ZnjfG8bkw86ydsHdYk5cOCBgV3bnAJL6Zztix1MpLtxjHpFy3glCRByu4sya?=
 =?us-ascii?Q?ViqFzWW5Vff9SnzH03UhW0AP1XA/dc2GuMU1Z1CPtvB8z0qLIxaczXGxIJvI?=
 =?us-ascii?Q?HNm7TGmZ0eY23SkThfTj8qL/AkTc7z5l+z5tMDmfUvbpUdtQaFnniGQgkNYw?=
 =?us-ascii?Q?cNGJMX8m0tdBOLlThfitjIZxy/7+nAVOkl6nl+uQ+9hGi1G/ojN+mfxVk8zw?=
 =?us-ascii?Q?lUwsS/1sHm77rnFlqqb2HSi7k1rgn7toj3y4NPCMx7WEjnWgGSC1DSferFwU?=
 =?us-ascii?Q?NHycwvmQnkcJttqGpgFoWzh0vnMYJoE=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: f8560932-f142-4ab0-7855-08deac17d23a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 09:05:44.3104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5xYS6M/+5PCoNGo6fIG+/ZACye0p9LbLQ34hjO1Yj0z19jTUMespPYR0MGrbYkGPI3LvfEWeUJkYqb5Z6+5zmLrAyIr+Hq6K59eVdcyfNxSyNecT9bbk2guK5Kp0a2W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1277

Hi, Conor

Thanks for the review.

> On Wed, May 06, 2026 at 01:59:37AM -0700, Changhuang Liang wrote:
> > From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> >
> > Add JHB100 base dtsi and dts. Consist of 4 Dubhe-70 cores, CLINT,
> > PLIC, PMU, UART, INTC and 1GB DDR.
> >
> > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

[...]

> > +	cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible =3D "starfive,dubhe-70", "riscv";
> > +			reg =3D <0x0>;
>=20
> > +			riscv,isa =3D "rv64imafdcbh";
>=20
> Please just remove this property.
>=20
> > +			riscv,isa-base =3D "rv64i";
> > +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "b", "h", "z=
ba",
> "zbb",
> > +					       "zbc", "zbs", "zicbom", "zicbop", "zicboz",
> "zicntr",
> > +					       "zicond", "zicsr", "zifencei", "zihintpause",
> > +					       "zihpm", "svinval", "svnapot", "sscofpmf";
> > +			riscv,cbom-block-size =3D <64>;
> > +			riscv,cbop-block-size =3D <64>;
> > +			riscv,cboz-block-size =3D <64>;
> > +			d-cache-block-size =3D <64>;
> > +			d-cache-sets =3D <512>;
> > +			d-cache-size =3D <32768>;
> > +			d-tlb-sets =3D <1>;
> > +			d-tlb-size =3D <16>;
> > +			device_type =3D "cpu";
> > +			i-cache-block-size =3D <64>;
> > +			i-cache-sets =3D <512>;
> > +			i-cache-size =3D <32768>;
> > +			i-tlb-sets =3D <1>;
> > +			i-tlb-size =3D <24>;
> > +			mmu-type =3D "riscv,sv48";
> > +			next-level-cache =3D <&l2c0>;
> > +			tlb-split;
> > +
> > +			cpu0_intc: interrupt-controller {
> > +				compatible =3D "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells =3D <1>;
> > +			};
> > +		};
>=20
> > +		cpu-map {
> > +			cluster0 {
> > +				core0 {
> > +					cpu =3D <&cpu0>;
> > +				};
> > +			};
>=20
> Each cpu is in a different cluster? Interesting, suppose it makes sense w=
hen
> you have different l2 caches. What other resources are not shared?
> Do they have different cpu clocks too etc?

There are no other shared resources, except for the L3 cache.

>=20
> > +
> > +			cluster1 {
> > +				core0 {
> > +					cpu =3D <&cpu1>;
> > +				};
> > +			};
> > +
> > +			cluster2 {
> > +				core0 {
> > +					cpu =3D <&cpu2>;
> > +				};
> > +			};
> > +
> > +			cluster3 {
> > +				core0 {
> > +					cpu =3D <&cpu3>;
> > +				};
> > +			};
> > +		};
> > +
> > +		l2c0: cache-controller-0 {
> > +			compatible =3D "cache";
> > +			cache-block-size =3D <64>;
> > +			cache-level =3D <2>;
> > +			cache-sets =3D <2048>;
> > +			cache-size =3D <0x20000>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2c1: cache-controller-1 {
> > +			compatible =3D "cache";
> > +			cache-block-size =3D <64>;
> > +			cache-level =3D <2>;
> > +			cache-sets =3D <2048>;
> > +			cache-size =3D <0x20000>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2c2: cache-controller-2 {
> > +			compatible =3D "cache";
> > +			cache-block-size =3D <64>;
> > +			cache-level =3D <2>;
> > +			cache-sets =3D <2048>;
> > +			cache-size =3D <0x20000>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2c3: cache-controller-3 {
> > +			compatible =3D "cache";
> > +			cache-block-size =3D <64>;
> > +			cache-level =3D <2>;
> > +			cache-sets =3D <2048>;
> > +			cache-size =3D <0x20000>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l3_cache: cache-controller-4 {
> > +			compatible =3D "cache";
> > +			cache-block-size =3D <64>;
> > +			cache-level =3D <3>;
> > +			cache-sets =3D <1024>;
> > +			cache-size =3D <0x20000>;
> > +			cache-unified;
> > +		};
> > +	};
>=20
> > +	clk_uart: clock-25000000 {
> > +		compatible =3D "fixed-clock"; /* Initial clock handler for UART */
>=20
> What does this comment mean?

Here it's just a temporary clock; it will be replaced by the clock driver l=
ater.

Best Regards,
Changhuang
