Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A62238DC6E;
	Fri,  7 Aug 2026 01:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786066552; cv=fail; b=JYgmBjvRma2QlYwX7DfxeofbDVnOlRS/5Rjj8ayKVPR74Z1Tvz6zKfJmhL+0OxY5sSKB1fd8e3jItJslSFkPUWxBykKLo/2EcwLscAC+7K2DfxLNfmXsewhB0LPlygfhjnHmHHHW3NQl0S2GuaPNQxFc7BZZZxrJnTWfB0HJryQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786066552; c=relaxed/simple;
	bh=onok5VGxHGJitS+rKtOMofARVkLNY7yOmPc1tFaKfno=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gf44A3qM/H2yFjVWCmLRhxVRVdvgHOAGgoEz3ifz1Y4r5Pe9DWi4aFGIJLkJy0KTcBLjBDfZdlGRshLiVgNs0PuS+B94S19l9FA69MIsIatNYUrKXuZJ248d9phDCRGhdjLIk8RUp6NybbAYkPHB4K6ij3TYoZJSvztHYAla5N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFaVp6NrXCVBmhFc3VRkwkYufC2eGkLOo/1Gh14g8L5T6CqF4UbKMABLxlKvwLYSeJ/iW7XnxPqHTJCPPssh3tFO4MLWF/bRjHByk6jtbUe6rmm838USTZ7pYOjejHoZb1taXZkAuQ7mOc9fc/uzuZ44aUVB3SYlPeGebfwRlOur8mRSSPZts6ghYh1/xULw2DJ4ZlgDTML3qzBvVkO1qOU0GkEOMNm42comVPTO3XuuMh5D98DUUJPKkEExcntSmjthUp6JsTabwX/mjXKroj7oFwX3exIlih1AWzAzSKy8WpLHnXIrrmm8XnOOEiAdYhPoklD00/LYYoP1d39XUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRMF0BbWhUrNThEQ8uP57+Mtr679VKsd0P7E5QNSrcw=;
 b=AgbfR7cFZgAkSk0UMPpiuLIcY+GUint3/+ETnS8N4I7ZfZfJVr4nju3LOmt9Ov/Osd8SkXTk5Ptgf0NnKf1BWAXn3hnDssBtkw1Jb/leQWErzTQJM2m+0/8qBjIkWYoCAXKHoDkWeol/ie+EnjI52L0u+s/77FxHbwtl5LymJayTFNxTq4HlaXBKpvM/yLCwPah8UWBPx5vbmAu4A4rynGQaaCnyBExK3Mfgr84NDyOqHJGxRuzhiSg5VOULZiplwJ9hfKN9GDe0XFlXB3I3vJKb9WI/Jfy+iWbq3O8HCfRPsjFxuQKv/+q/AorXMDd9QdVtxvKGpBB6g/J/rLXj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1330.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 01:03:25 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.019; Fri, 7 Aug 2026 01:03:25 +0000
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
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Thread-Topic: [PATCH v3 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Thread-Index: AQHdJZ7DZysAjEZsykGGi40Ax+Mjr7aRO+wAgACJ7tA=
Date: Fri, 7 Aug 2026 01:03:25 +0000
Message-ID:
 <ZQ4PR01MB120236B6E1D64A057616E09BF2D12@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
 <20260806122553.182449-6-changhuang.liang@starfivetech.com>
 <20260806-staining-delay-2e2de73acf04@spud>
In-Reply-To: <20260806-staining-delay-2e2de73acf04@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1330:EE_
x-ms-office365-filtering-correlation-id: 56f2a70f-8aad-45ac-4325-08def41faf41
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 +ELcFa6VPBI4Q0cZYIkBvWuOU3fWYZtIcUfso4agU+2PTt45Sl3jSCDs3ZTklPQ4i/g9O/10lY+EggElaFnpEBKl2/zkK7IpcJpK5M39YqnWBAcOjS/qGf8JlAJU7e+R13QUjjew6OhXLDDAh/s3NGwE/el7oIsrrB6oOWlm1bLlkBAPy/8JXLWzJKg9HuVLD6NrziaWNG5K8CR8GDkQcL2wjSy12i2kP1Jkvo4mkIu5WVachobAzswI01GzC7ZUD8zW63GcTF3bPiX3OY6/2PkWrEMXBhVzO0de8sKwB1qquJFwFPJIEXk5QOh0P1MKTOWjs5p2kGiIPMrSvTpGiyM+T8/crKM3BR1m3PDpFViPN6gXWN+BweGy+9k7uSxK34Dm+fPXZtYgqJEZLf/ka9fvngcbjzzn6z17U0Cnf9t1S/dRaPp4LNrGT5bbniKC3rOw0pZEmIqU6g2UiYmHmNh1mul9TottbpmI8wwTqfAHLhnXBudh+qLQFDw2rtfaOvf0DUloKY0MgSdVdSJxR6DsGWAAWSNEcyF0nNJMiMPgoxlUIuGLbkZJ9P1kfM74
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?C/0Sod4Uyufl+QRrE1b7/SkhYLKY7XydY8Ew0VHKw523EUchjv6+hca5Q/Kp?=
 =?us-ascii?Q?Ai2oF9bBrlu7zyaiXTYfXDetiwUOVJDUJuid+G5FKeGVR47QMcA8j/61Mz5U?=
 =?us-ascii?Q?gXxx4y3SfKMObnM9Q2hVScquJtfPM+O7ixzrvrRxP5MjRn3s1TNZBdPwqKW+?=
 =?us-ascii?Q?0V59yWvBYl7uNr2H7D0Q/BwxtSa7h8RqVvpD7yWosqXYCdirL0IBOtYKHcNF?=
 =?us-ascii?Q?xgm5//yt+U10f/AslODHsxZsnqvTrgzy5QKHHq63Zjc9HKogSx1zX52zrxY1?=
 =?us-ascii?Q?GAd3cAlHoIlAwlS3rBmdbtqThjLapZQyILu+ItAfIYm/VuhDLZnJQBEMQjms?=
 =?us-ascii?Q?Oy0eL8pyGCyYUKB/04WCZnoyl1PikXekfxL9RERP/Ahs9euKrshXP5/YqUjq?=
 =?us-ascii?Q?8dzi0VKmeL36cPTmLRieiaaBL8mwOu4oDSGPZXPXZd0HBBJ6i/8SLHzmqnEg?=
 =?us-ascii?Q?3S+tAJY3s2uxCG87gNKeOBYYV5JZGD+3lrhk+dAbUq43nyESMlM1YaZKEMde?=
 =?us-ascii?Q?Qdb4uERi51mWu+QzhmrUfhopQK0IZFvgc8uXxxsxD3D6qmzHNl0iSgTqnPqy?=
 =?us-ascii?Q?A2Ry8QQ5QADZnbIXcTQMuLDFzQHCpbFsHa86FbfNqWoDU9+H3ZnOHLeyLuxa?=
 =?us-ascii?Q?2/zhimVdmjlfSeLY3xL2za2GTGsedGPrZ/jLnA9P0nt8do9ZgGEPUYTZ98hP?=
 =?us-ascii?Q?0+DCBZaNevbRaRhWiHPAnbjJF5KdNphH7hczmcB98Ug04MqW4/DkdGey36bI?=
 =?us-ascii?Q?+BK535PtJDg4Km1GkpaMSocPl7kW4Z2qY96bdhP+V9SSNvwpmA6BZYJf/jlL?=
 =?us-ascii?Q?YMa4AY9QY4h/Qw0VxjbpbCnUWFwNv5BItY1X8SOFRF1cKvDW4nl6xAVax9cH?=
 =?us-ascii?Q?FspcytEkHBwJ0wyd7QaFpIS2ibxhnAwT/mqpTHXs1oECJxEPTsQVXFnEDU3c?=
 =?us-ascii?Q?X0CNQqWflE8YA8RXtoAoqSebNgi/ZQ6qtYhLsB+G/vZF5Vx3D9Y7at72K/8e?=
 =?us-ascii?Q?3JQ/M6vl4WrVWY3aptQQ3MzY9x0kF9SI7G7qbfqf+UqG+V7In2ZfY5QP0s6z?=
 =?us-ascii?Q?h7MiZ6O+rVWyOR17jOuehMG7ikYKrT2N/M4QXrz5+cB60ywaJLQHK6zIpHsD?=
 =?us-ascii?Q?lbfWWz+H/BJUin1Htc9i7US7+B3FwB90NBgwDW62e95Yg0Y1tk9WPcXH/PlZ?=
 =?us-ascii?Q?yFGA00Wf3FgmIcdzukhzcj11QlAEVv5eWrBdOqRS/BgMqNOufJFoJalGLygh?=
 =?us-ascii?Q?7lEYqqx2MVUNoT2+ZV3r1lHe0Uw0OihbavKwRTM77bajIqsXQLZMUdzS0ApV?=
 =?us-ascii?Q?+ME0vp+UMDQ74G8poezxYZj7ZHs1FjWltXyjQ7WOGNcvzt5BeepwMbZR6luu?=
 =?us-ascii?Q?moJSkJeNGJalNPQ8RzoJ4mm+8Uxx0kN4eTWHzMIvp5SdKmV3HqM6hV9+tZjV?=
 =?us-ascii?Q?T6VI1ZHHDJE5P4xLdTWUBAa/1Vw2aJlHCEXCjgBt5WeyJygLEgGGdDfG2Xnd?=
 =?us-ascii?Q?J43zg7Cvv37s5gVGOJvyjh8aQssPgHgSlhdNCOZ0ATvNcXn32AyJlIiVt/tn?=
 =?us-ascii?Q?7/LMhnLoFYhZMaANVkVSVY9wNFIRW7KboEm9j6IIzp0VGNYLlTPhqxJ+CK+N?=
 =?us-ascii?Q?bEsMCuc7IaE6njv/V9+NNog+G412YmJpmLGS4LmYky/c/dXYzSNBkPnz+mEt?=
 =?us-ascii?Q?Ndkr67AAccvzBgCpgwXjZkPHnDdNovLkjxC3YZlM/trvT++FYjc61/dpztwl?=
 =?us-ascii?Q?vSPr+Mm5ZXdOJgyfz0cav46YtB0ZX+k=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f2a70f-8aad-45ac-4325-08def41faf41
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 01:03:25.4230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yQHcRWXZFPfLTbmmBoNceFTe+UssISBHYiZEg+9HQEb9nOW9iuXxS+XxSj+6IPNPlTIjkiqAltbNlGyQDOk9W9Mz8OKJwNYZotOOgJnO76NkDBeMj6eMwV4faS0ewqL1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1330

Hi, Conor

Thanks for the review.

> On Thu, Aug 06, 2026 at 05:25:53AM -0700, Changhuang Liang wrote:
> > +
> > +	clk_uart: clock-uart {
> > +		compatible =3D "fixed-clock"; /* Initial clock handler for UART */
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <25000000>;
> > +	};
>=20
> I can pick this series up on a provisional basis for you to work on top o=
f, but I
> won't be sending a PR for anything that contains temporary fixed clocks.

That's great.

Once my other two series are also ready:

Add basic clocks and resets for JHB100 SoC
Add StarFive JHB100 syscon modules

I can squash these three device tree into a single patch and send it out, s=
o there won't be=20
any temporarily used clk_uart and PLL nodes.

Best Regards,
Changhuang
