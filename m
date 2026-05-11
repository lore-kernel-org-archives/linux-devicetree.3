Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1707133F589;
	Mon, 11 May 2026 19:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526252; cv=fail; b=lScZnPlfvbRRokulRhUPf4F9LPR2OQt3aJ7JMORvSACFMg50ut5ga1b0ZNxpOWSOyfr1sFJE/ZaGvmHVd68eOkJsHLbvF+qD/fkdcfJ/UiCs/C3y0t9KAL0rgjyvMhFqtx7NDQBR1Pgaw6zFoh+1f8q5mfG9fTkEg/NJroyNkMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526252; c=relaxed/simple;
	bh=YLEZKJuRXKamS67qdoehjyJdqoRDI5VZN95/u9XNAUM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ChWR+x1CVM2PppYUjp/E/dAtqPsCYsc3yZGkPQ2nO2ZD2Qv8zBuNlVCZm6AqwgoJ9miU7rLNMHvfWKcoMf3PD283UW7TF7yLAoM/ViaNjWofvk5XmmFVs/mcPKYyKzyItuDe24lf2CzCczmbtxSp29olkEMdzCs0IwYy/DXoSOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CQCsI5QG; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CQCsI5QG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaIei8H9UUDMNTX/qXJR+HZH5XacxtG6U0OEOoPrT3btF/mEscNckzC7im8ImEhEXQp/6yTRyBdhkfDQgjCcf+l+GcHdY9jK2mVDj5eOQveMBaol8x/FTXS8W7Q/tyWsgt9DAOype4Vm1m+fOaoCtSEeEZQP/lJO6+TKRzkQoV4MvevwyD4PO4Ik/xFC+WgT/Oc94CGPiRYTcx/jZrubncyxu4fJ28RGNHAxZRqXFUOq6dKS5SS+rlGElZyXnSiJTPIQf4m7Vs4HqoHq3pLw+mK3A77lDt6jxs9GuYnmm611I2JCzYjXNlpmEJrD1VXYGWqXqMHa88pGp926Z1smWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYhc0hhXWYz+OnZqEB9PqxsEVTpD/mTJY7P1/0DZWqw=;
 b=w9D5DkGhTz9YyjknmR5AeSFE1GIml3JW4DCRUveWsA/ltapjT8gtaSgxlraeDQuuslvChB3cYYLfj4KJ14SOGJ2dxmEwFQ7oUvZ0q0pUCWZzReaUpQSWuQQw1Wlq8YPOMG6n5R7hUxq4t+k6vqXPRDFE43txae9lft5g8o5vq5cbVf8vyQr/r0CXh9HBwblnScFhYHax1OlAC5ihnDsMf3Lm20umb5PTX6TXSeyvUy5t+fGTGf82o8Ih1cOCBbvBIsTQl7oM0QZ4T7zn3j2DjZ+AWYrPzbBDlLOnRhPXtD0/7fX5Q4bp4oS+/dPYtslsfYqoWKxJRJvH6MdKOE5CUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYhc0hhXWYz+OnZqEB9PqxsEVTpD/mTJY7P1/0DZWqw=;
 b=CQCsI5QGYD3Iz8P3u40+1umniRNkdqJtCXu6wBaZktW8vzQnRor+w80AfcWxcJ0aTiuhl18XanyJztTi1sRQvh67O+o6eRgrVBNEGeOr07uxYIHd/M4FAeqVGHH9c/CosXxRLcvtmiZnV2o9XK+co5juUptOCACuDjIUk5hht55rqMZTsr7H7u+yl4M/2kR4UQCGTfuR+6dslu0MnRLHqIuH+ZbuNu+iPdIUoQgXZ3Mh7e+e0rIuULprwzFVoTHHHHuLm6bQ4NTvD3N/C9j7J/U37D6AEao2/PDQhYL4NB+9LOffGYhd4F5ugRKY8dom+uj8JtUDbUBIq9TnwMiruw==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB9983.eurprd04.prod.outlook.com (2603:10a6:10:4d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 19:04:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 19:04:07 +0000
From: Frank Li <frank.li@nxp.com>
To: Jisheng Zhang <jszhang@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] [PATCH v2 0/3] i3c: dw: Add apb reset support
Thread-Topic: [EXT] [PATCH v2 0/3] i3c: dw: Add apb reset support
Thread-Index: AQHc4PevgCkxendzF0W+79WngzG1f7YJLzaA
Date: Mon, 11 May 2026 19:04:07 +0000
Message-ID:
 <PA4PR04MB936627010F8C9C6ABACB1FF488382@PA4PR04MB9366.eurprd04.prod.outlook.com>
References: <20260511031945.3228-1-jszhang@kernel.org>
In-Reply-To: <20260511031945.3228-1-jszhang@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9366:EE_|DUZPR04MB9983:EE_
x-ms-office365-filtering-correlation-id: 6a6c2ec6-5206-494d-8594-08deaf9013c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|38070700021|11063799003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 5BcsKN8jK9LpR1b24B9U+Bq8uNSsB6l4RqUCXAogCKMD6/734uDddKxJTUs+u5Z9VaVWhBav7cN2HpwDWqZPaKCNm2QH45leNwFyeNjV9KWvNQDuOrajHfSKi8TNKLx/ZzN7icxL09EMxr+NmUHBbCgVR06uhFrYaYnkO/TKNRN9ZMlGTsBJdmRDZv1kSczL+YrDjgu3GbJCJv6qpQyMSzhr9KnW98c4IcLvI+2jwDktMpezoaO8BwwqLQPN9NhYHLObnEHTerRUWzE/5+ZKW+ful3HDAMIDsrcU1owW9jEs9ZGw5yAiDYOXFLT3UbMFTjJPGS649ShlUt9pfEjfWhqIbwyXTHcQcBPyr3sM9VKrplI1ADRaPNdifc2414pmLzGvom6bSJQScOlT3ZFudZOigXh6Xi4fhXHbRAKcJKnI9smVCrKPLvvsR2a/s7nqnUmb3AEhGnoEURdxgiwS6CL9oWa+e7No/uB3psjct1KwQJUBc+2jOao3eIV/DoByOzGF70+nn+vV6RJI3R2BFNkw6NSiRsRQ4IVIH9J23huImaWMG1Al2cEX5crig8kcLLSirvQ+4Z1s9dRWkmdJh5Go2mhVQWVd1Nykl1j7EMA1vA+yiHkg5U4yCIMjsltvrEHYn2FzqLTpdDU2CL4IhlB4Qsm57D47eWG0G9gfd2PaXf97i2wGF1QlzXTduG6fDyq3rTufgI3lB8DcjGiLmhu6IHZjrbIa52G25tgvKYb7xvpyxLYiEo40V9BwBydv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700021)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vDWhWiAhAff4Lwdsvy3G0weDCLJCKNHzjWGOTega4UUKt6PBFz9K1OF68fkV?=
 =?us-ascii?Q?C+hl/uH1eHvPs77Z1TW5hK/wxqRZtxdkJW6LbVaKgFAvtKFa196WxHhc6nrd?=
 =?us-ascii?Q?Ltob3bTq7CSPR3mK4RMxMXFya1l+h/iXqRztEiIoLLyWBGkN/iS/XSG4/3d0?=
 =?us-ascii?Q?E0sKVmqU4qyJ7PaDtDOCuuLulLXXAnmuCEBIOHLChIkpTRoHOvZ3ZpH4Z83L?=
 =?us-ascii?Q?TxonvSdsVa6EE6BT6MVGPWuEaDUdZV+MABnw1ZW6j/XuEP254XMkxe0FWrDw?=
 =?us-ascii?Q?it0AyFDbwmyysx5spmvrPLjKNbkj4JYWc+t43TBIBRTEiH5zNWeHyPsp815A?=
 =?us-ascii?Q?gYWME9JWC9XXYqNLysFo8uCxVHRaFr9XrIn7dOGrUniXlTrCL1QJp+j+k+zq?=
 =?us-ascii?Q?gSR9qwoftj+epnaCL20mX7a68In+o0ofVEn0dpBfuCNgzMwXBzOpoZv+y+Cs?=
 =?us-ascii?Q?TLhD6bGMb22eROF+gOAqBhS0O3i/C8cQBkHxEDWgtKkSnLvjTget8ZDgH9+7?=
 =?us-ascii?Q?N9pzU7/eSUOkq63QW1sor3FTUOQ3tZn/rVmzuEVnDBzENW0MaqUgAI+RYpn+?=
 =?us-ascii?Q?QDw019YvT/517C30eX3aN7ZEUm2Sdb3qZlD63yoH1aTKIxgDs3weZjtFvw1v?=
 =?us-ascii?Q?CUm5NpfduMCN0hcoWx+r58Tc/5v4zYa/LwMAw8zRcHkRX0EyzlAppdcHkFXa?=
 =?us-ascii?Q?5SLsl71h11eDJ3CEPPYoRjLM9HWqyTMktemP/LxzaAwxTzmOMV4N8iigbWQd?=
 =?us-ascii?Q?xTlzb4gdpaBYSV+Je5I+uosF4tyhdTjuCqtxulpkOW3JZ48z8Bs778fjhinD?=
 =?us-ascii?Q?uf70IcP5dBBZcqNP/7MO4kkijcVCx+KbBoOK7aRdkWTT8+Z/+uBcsf5HqiBZ?=
 =?us-ascii?Q?rlllmSfBmJjCHw2y/Ky7dmZ1p30qtPjVBBs7laRCKJSRQq52bodey9b6k13O?=
 =?us-ascii?Q?TlnGx7NzaGwm3pQLIhE06wBisMlMKz2o37ky2yX0wd455cpSWu1RROl7nq5a?=
 =?us-ascii?Q?zk4wwe9XNqNz8p0LJKEK6JTN0bEWqgXv6gvHNHWjINP0fIX+ROb1xUeTXiXT?=
 =?us-ascii?Q?bg5zk7boim3eCwltMd6FdZgmEMPh1lnHthQc8RPoU2fY/3oNHBLxrgIVTrdq?=
 =?us-ascii?Q?XGP1sQhYWWDYAwOnxnoaMMyC0bn0CbeAAtWtY4t/0LPGsL4utuPlmlekImbG?=
 =?us-ascii?Q?UHIp8Zd9NMajr4xqzO+skO8JBmxgJl7+WxLyrsgNvE++75AnLUFAP/qq6/fd?=
 =?us-ascii?Q?K1NUPU0FmxGawefEkonXsJ7IY7Lw7t+pg/Pr/G1DwyuuFpmLRsVi5Fe5IlUQ?=
 =?us-ascii?Q?ba+Mr2nQe8P6pdPsDATmuaPlJpR8hlSuUlp6YgvDgWKUEf5/+xzb590fUiwY?=
 =?us-ascii?Q?o3OY9DgPP5yodAzG/sOOFgjZFB+q+Y29/m9uI6iqZ5uLls7NoW4HpWjwfKhD?=
 =?us-ascii?Q?Kdhh4LgLYaMoY0OvAi4JfKOqV9c+lm6vbJwz/D6upeGZA+SKrLPsKD/ANcwx?=
 =?us-ascii?Q?pWpK8inZaYGet8dPB08R4BwJ9ilHEob53Xn5Vs2kqt8Zpk8E4z9a3sP4HA05?=
 =?us-ascii?Q?Bg+j0jFRNNmkRU6RC8FlsbSUD6tCsK/ecCBj43elH/eNnPvXrbsNjtgy9a/c?=
 =?us-ascii?Q?XRup2uNy3Y2bUs8C2GeZSErs9y/0iVvftp7ybVeJNpTHEpUI30aHGPJuSNxf?=
 =?us-ascii?Q?BiREwt25XBNvR3bTfUBLKKoPO6A0u6aUv1kge03rAN3l49HN?=
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
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6c2ec6-5206-494d-8594-08deaf9013c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 19:04:07.4429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mA+rtAtv4eljxZjcBBrrjYFJu1RY32r1BxEYjMcghgvSS+glAp5JUZR2dRFw4yK5K4lGlMsZiewOQxHfVqNmHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9983

>=20
> Add support of apb reset which is to reset the APB interface.
> The first patch is to document the exisiting reset dt-binding. 2nd patch
> is to add apb reset dt-binding. The last patch is to add apb reset
> support.
>=20
> Hi Frank,
>=20
> comments to question "why not name the reset as "apb" instead of "apb_rst=
":
> exisiting core reset is named as "core_rst", this is to align with its
> style.

You add new bind at path 1. It is new reset name. All needn't "_rst" suffix=
.=20

Frank

>=20
> Thanks
>=20
> Since v1:
>   - add dt-binding
>=20
>=20
> Jisheng Zhang (3):
>   dt-bindings: i3c: dw: Describe core reset
>   dt-bindings: i3c: dw: Add apb reset
>   i3c: dw: Add apb reset support
>=20
>  .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml    | 10 ++++++++++
>  drivers/i3c/master/dw-i3c-master.c                     |  7 +++++++
>  drivers/i3c/master/dw-i3c-master.h                     |  1 +
>  3 files changed, 18 insertions(+)
>=20
> --
> 2.53.0

