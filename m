Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.109
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795425058;
	b=VQ/pE4FhVCtRdyg9Pg0bbkKPAQTro95zUrU4+6qqKhSEKYyO+vgywPRTM5YefebRUApF
	 VKyfDYR7tnfGF3EGpq86MSjoiOxENRTdV748Ph5xmn6XGc4eLb+F32I2WHI3zAkPJg21Z
	 915E/+Y4uv3dNbUuLP95pnvyreCgd1rzrrTHF5PK6DoTk1iNKwzZd7l668AjwBOV1suV1
	 mUFe0ZoSDDjoaZc4pQx4A/rq6MIZ5u08y77l8fPEp7cSR9Iw/B4gdXeSJuhpF3a4kr+w6
	 EVulYCNTSFg5OOTU0ah4pU/c2nUEViQXFtC/b+Z9SZjg3FQ6yY1hD7jcBVPfmeSvL4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425058;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2vR1bhDDylDCqnVideQPa1qxPGWB/4JKDRQDTkTHEq8=;
	b=Mp4cPdnW0qmPJLqiBIYEEkyao0mHnu6swV2RJBZDshz29BYJhZ4YjA/MLg4vR8+V5e2B
	 18ybxtNxLHD1KzUEN9xwlsmDi/PWqyhFkPOvks1oJxV0QUDvPP2lGxAqtdgNYpGvkXWgc
	 Gy639ahM6XX3ta08+YUDOu9UN4DV1zUsGFSI8B7mI8NFARETeo+cWgPx7Bcdp1QR1mJ3D
	 5BsCLyvN0pqes44I03eSaGFzoVKxS2T0891CN6dS0IupoIIib1+DsrVZ2eoQX/ybNqV4m
	 vmBetnyTuhB2Tbkhp2ot2dfC5NpRrMrSQieC8l+TI/3Si88F1jBNSteY+AAs/wZUvRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.109
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2109.outbound.protection.partner.outlook.cn [139.219.146.109])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372F8606A31E;
	Mon, 23 Nov 2026 09:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 372F8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9HEwoLNLPHUESOYhImWzFg3snalHnpvZQQSUClCA4PEYrc5Nrcl8mps3kVf8j2/xnCEROJxzifN3XgbEEGHxmdXyrwUnIJbAcF5fLBHjKVzMY+LRQ6axns+bv9v/3z4avo3rnGH9bIRl8Dwy6MgPXCA8FJens4q1ZeRkj2j8ycEdVgjLQ9RWRjZz+9tEeWf+YFVw5BlhRmdd0Pcf6Mj0NvT0sA7j3Rd8aSooVy3/miXMuW4/tXfWjA5XwbHr44vAX09CLZhK4ftTsVl9S1ooWZVmkjH0f/In+n7MIRmAANqRJm32FLvXEq3eA1trWpL/NpQV4ORuUULyKKnSLBxdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vR1bhDDylDCqnVideQPa1qxPGWB/4JKDRQDTkTHEq8=;
 b=SjJxUcqFz2WZdXa/lL3Jf7KRTmA0cmO94m314brDYqTijxTJV7SNcpyI8bH0ByW0ajItd1en/ZYZTWdR6eUG5KLeKn36GdE2xKtsILoRxlDbQ1aHlNwFkI3wou+jvzgK+A4QVczLRhI4gLfJBx9U1DGG3WECuy2rS+WNP9gpVXxDZlvZ4EPIODf1D7sXXpvWl7Qh3/vUAcDdamVwsUWxVKjFMJEz1S/xafEgxyUe/Mbk65jUxuw+7woB8J6EhMgO8MP/eSXT/fT7q1KwnH68zFEHQOJ9EDb5JHq5ZpiSfQC/OCA41QKQvyIV/CSsjErIiN2yT4P9qbfsXNMzMBLFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 09:10:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 09:10:44 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft <osk@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Shuah Khan <skhan@linuxfoundation.org>, Jani Nikula
	<jani.nikula@intel.com>, Vitaly Lubart <lubvital@gmail.com>, Hanjun Guo
	<guohanjun@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander
 Usyskin <alexander.usyskin@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Breno
 Leitao <leitao@debian.org>, Philipp Zabel <p.zabel@pengutronix.de>, James
 Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>, Stephen
 Hemminger <stephen@networkplumber.org>, Dave Penkler <dpenkler@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Dan
 Williams <djbw@kernel.org>, Mukesh Rathor <mrathor@linux.microsoft.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, Alexandra Winter
	<wintera@linux.ibm.com>, Julian Braha <julianbraha@gmail.com>, Karthikeyan KS
	<karthiproffesional@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH v4 0/4] Add support for StarFive JHB100 UART Routing
Thread-Topic: [PATCH v4 0/4] Add support for StarFive JHB100 UART Routing
Thread-Index: AQHdX7GSpJ2Zeip1d026/L066K6O9bc7laXQ
Date: Mon, 23 Nov 2026 09:10:44 +0000
Message-ID:
 <ZQ4PR01MB120270E5CFF0F70B1E71014DF2452@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261019100643.49099-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20261019100643.49099-1-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_
x-ms-office365-filtering-correlation-id: 37262dd5-9c1e-4b92-443d-08df4941a79a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|38070700021|10067099003|56012099006|261028144727099003|261102123227099003|261021135927099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026140227099003|261026121527099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 lclvUU/q65351EqKN60B05CJ+WwcViVlYafDD4eM9hdg9dmusLXr/4P3JsP61YRJHq5c5C09OYp8lhCscO9EoJ3VNkE6gnnVP0lzJHxlFFoPAip5H28nUO3Ig0qXEv/Zax5KJ7lKbXzJAnMlwXODziiwAIpcsxDNLvrdH25QnPWhtYwm5TcxyGgGGpxj8rtMoz+RbjR7W7tB7+Bl17ycj5NORRZTFAgIdiFJJIhaspG/AohwVSRmuSrD8QBfmiIMh6Ngeq8td43nYwr3I+g05L6P7kEzaUYfzHty1ikNn4h4wEYSND1TBxtkyFFXo9JrtjY0FxprYGYNJFeN99Z3OvMCBUptatEJdoF8SYDAMHq+9thyAC0C2xp/zOHQMuy0l87guqwlzsMWS/Tv1ylJ65qai7EWSlafaZ5x1fOlsAmcvnWGCb5E8z6OYaPZuwZMkYEkzp3Sisi9DWDlsz1PzRdIWEyNQJ1PI2CNA6A9BAmCzUB5pQyszLZBzBEl+TI9sFOfS9dzOaTMNHai0wBgjqrzg8wWWuLdcCoBWxffASdIKQ7bGn78nxL2kLh5UBxE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(38070700021)(10067099003)(56012099006)(261028144727099003)(261102123227099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BfEovWpO6b9zcOiOjoQDrrruCMwn/G+grBsU+5dzt2Fa6eGLcf9q9c4OoF92?=
 =?us-ascii?Q?gcbCqXkoRyoXj71JX+8z0YP15MpFojggcaLwQFwptZgsw0WReI6Dn8CV7QvK?=
 =?us-ascii?Q?+KyBiDo8RujYRVprkXHgp3GIn+TMWU+GhTJ7jHdv5m9dPC8D2O0K7zL7QDBh?=
 =?us-ascii?Q?CWd2nRscB1WfVlDAmOMl8IM0+nmAqm/TfZ49tJaL0VcDNPJXsKGsUOPzUNxF?=
 =?us-ascii?Q?JQUpzGCVj6TZTyWCEphf2Usz8tB7bblCM//02ye6ES2lX5bpIJq+Ow4TNqF+?=
 =?us-ascii?Q?4JlteOQS3D07vXfnz5ZJ74Evw12A0SVIzOvwyvN71Tv3uTWSisS5hDD4a0pF?=
 =?us-ascii?Q?pp3N+hCELwIYk+FsHFH/2q7ABzmW4NskjW3Mp3wJs3myjk5OP4lCp632uzpH?=
 =?us-ascii?Q?/Du/6NHd9MIZMa8syX7xTqD7RRWzhqZwJNrNfVUXChwawva+YhpvspCskZRv?=
 =?us-ascii?Q?GhKfnylBGQ7/K31CzJ/b4qa9xg+SCCBHDz9NqERrn35uukX9p/kT8OTyas4G?=
 =?us-ascii?Q?pxtnmYTLG4dLsJNoxy4mcO+rghGitNLDuP8kinx35/C7tgqv8+rRTqyI+mmo?=
 =?us-ascii?Q?GFiJiiiwuG/jEHSFE9vey5K0htMR6c3+KsMBRvZQ2/LpYZUFYM0nkgY0V5jQ?=
 =?us-ascii?Q?vPQWEeUfIWKTzAb0oKu30/9GPsYdA7dXN7Ye6mK9tfjPHVGWafIGtTZ/gU/f?=
 =?us-ascii?Q?EcnD13s1R+kn5nPBmpBbEwgW7xuAZD1RQcjcUZ/wQgMHf44AGl1OiAAOWq69?=
 =?us-ascii?Q?Asl1vRhLX2FY7fcEWHa51ejrkEAIESJpvGXKtUbtQZFkLywv8p4tIF6vmfQ8?=
 =?us-ascii?Q?ivtRoWWEuwDA/hrFAFJQpHJXXqk0n3OtQYB9WaYb9pOS8bq7mj04iuJWg6VO?=
 =?us-ascii?Q?rQzHI8q5NE4zTxkWMjGHZDGbpsDserKliGASVDXXPApksZBsLuYMMJOtCSDC?=
 =?us-ascii?Q?sVYNEQmat1MrnZzCqHUp9htpyRIIvEO/7uF133D1X+x+b5dgVbiXOAhFTmOY?=
 =?us-ascii?Q?gTZIyHzBdFxaIn899z3w9A2yVPoeq8h9wGyC8AQ9qJC+EU8TATAEOfjHiUuK?=
 =?us-ascii?Q?/ZqJyN3Q8zn0zyYFXIkn7/qzEmS618JwIOhlxoTKsF1++9DsVMZIRWxkmOPj?=
 =?us-ascii?Q?B95imfqCTMTPJz5rGEJal0ialCmbM15lnyiKsj5eopE9frl8jikim712ipKy?=
 =?us-ascii?Q?11yMR0t3Pe8HTOn+qnkITrp7U/SZgjYfOTl4JBMcfXtujMgJJgc9IKOLpWeB?=
 =?us-ascii?Q?xP5hbKLmRosR7nbYGcxwBIMyjjR+DFu4kLwG0gcVJzK7px2p122tg7tr0vZG?=
 =?us-ascii?Q?agk7ytHeRBpADGdDDZ5WOuFomPrB+wxMRplf1MudgsO+n8J9ZRbigdsmEX3s?=
 =?us-ascii?Q?5M7p9Rf3dSKBwEBUJhykuY0qecP+AcNhRKsMvgKARfEgqI0phXtoxTwJh2QR?=
 =?us-ascii?Q?0Yls1Yy1SRM+UEpYsxm9bkxrh+VBJ2RHUyM3QhimWQqyZiYZgIOXuAswg6aS?=
 =?us-ascii?Q?8ShILoPB9lfP3CyUH9kCwPI1UMdJ5OP/abLF139ePdn5mz0nqkd2XG9PJ2/Z?=
 =?us-ascii?Q?+3f8n98wl3JFlD/dZTSFIbyxeBfImRlx8JxAv5CkkG9zApUOOLbYMe1qryYJ?=
 =?us-ascii?Q?V41PKM8tfGTU/NmsALKrHsZZFs5Mdfl6BIP1P8U/hZyIZ1tjhkV9A5SOLaCv?=
 =?us-ascii?Q?H6Gj/0Hp7yzKhI/cOdgChkEZNv8g0VSlmKwKS5HWABS4BgRJy5Ybb3LDyrBU?=
 =?us-ascii?Q?tp7OBHAXsZelNwCMmCuztVIVznF1WV8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 37262dd5-9c1e-4b92-443d-08df4941a79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 09:10:44.3391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F3ZeLeAESbsog/go4/c9y9xB+YCaHaeH3Fe0V72DziaGUqgki2GMZ+cyQBwZFw0n0MeqSEhoL2UQkIqrb0x4U3xZ+20SzSC5C+K6kpLiqrKjVALW+vSONKmJHHqqMRhk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234

Hello, Aspeed colleagues,

> Currently, since Aspeed also has a similar driver, there is some code wit=
h
> identical structures on both sides, but a common framework is lacking.
> Therefore, this series introduces a generic UART routing framework. It al=
so
> moves aspeed-uart-routing.c under this generic framework and makes it use
> the interfaces provided by the generic framework. At the same time, StarF=
ive
> also registers its own driver based on this generic framework.
>=20
> StarFive JHB100 UART Routing allows dynamic routing of inputs between
> built-in UARTs and physical serial I/O ports, enabling use cases such as =
Host <->
> BMC communication via UARTs.
>=20
> This series has been tested on the EVB1 board.
>=20
> changes since v3:
>=20
> PATCH 1:
> - Use dev_get/set_drvdata() to obtain struct uart_routing * to avoid
>   null-ptr-deref issues.
> - Update uart-routing.rst: since dev_set_drvdata() is now used by the
>   framework, remind the SoC driver side not to use dev_set_drvdata().
>=20
> PATCH 3:
> - Add Rob's "Reviewed-by" tag.
>=20
> v3:
> https://lore.kernel.org/all/20260925050947.9900-1-changhuang.liang@star
> fivetech.com/
> v2:
> https://lore.kernel.org/all/20260905102901.126035-1-changhuang.liang@st
> arfivetech.com/
> v1:
> https://lore.kernel.org/all/20260830065118.51551-1-changhuang.liang@star
> fivetech.com/
>=20
> Changhuang Liang (4):
>   uart-routing: Add common UART routing framework
>   soc: aspeed: Move UART routing driver to drivers/uart-routing
>   dt-bindings: soc: starfive: Add StarFive JHB100 UART routing
>   uart-routing: Add UART Routing driver for StarFive JHB100 SoC

Could someone help to test this series? Thank you very much.

>  .../sysfs-driver-starfive-uart-routing        |  49 ++
>  .../soc/starfive/starfive,uart-routing.yaml   |  46 ++
>  Documentation/driver-api/index.rst            |   1 +
>  Documentation/driver-api/uart-routing.rst     | 144 +++++
>  MAINTAINERS                                   |  25 +
>  drivers/Kconfig                               |   2 +
>  drivers/Makefile                              |   1 +
>  drivers/soc/aspeed/Kconfig                    |  10 -
>  drivers/soc/aspeed/Makefile                   |   1 -
>  drivers/soc/aspeed/aspeed-uart-routing.c      | 601 ------------------
>  drivers/uart-routing/Kconfig                  |  45 ++
>  drivers/uart-routing/Makefile                 |   5 +
>  drivers/uart-routing/aspeed-uart-routing.c    | 415 ++++++++++++
>  drivers/uart-routing/starfive-uart-routing.c  | 192 ++++++
>  drivers/uart-routing/uart-routing.c           | 183 ++++++
>  drivers/uart-routing/uart-routing.h           |  84 +++
>  16 files changed, 1192 insertions(+), 612 deletions(-)  create mode 1006=
44
> Documentation/ABI/testing/sysfs-driver-starfive-uart-routing
>  create mode 100644
> Documentation/devicetree/bindings/soc/starfive/starfive,uart-routing.yaml
>  create mode 100644 Documentation/driver-api/uart-routing.rst
>  delete mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c
>  create mode 100644 drivers/uart-routing/Kconfig  create mode 100644
> drivers/uart-routing/Makefile  create mode 100644
> drivers/uart-routing/aspeed-uart-routing.c
>  create mode 100644 drivers/uart-routing/starfive-uart-routing.c
>  create mode 100644 drivers/uart-routing/uart-routing.c
>  create mode 100644 drivers/uart-routing/uart-routing.h
>=20
> --
> 2.25.1

Best Regards,
Changhuang

