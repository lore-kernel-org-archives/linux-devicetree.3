Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2105.outbound.protection.partner.outlook.cn [139.219.17.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA70372B48;
	Thu,  7 May 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146888; cv=fail; b=mhPoZzqRp3/HNoPkj5YBh8H1y8c5u93rtZVluY8Xdj/a2wvnSPnXWGVbVka1ZhLiK2vuJ2KMUpydMbkFPqtzuYnxYLAtlZSWcAjZQD1w4mjWqu7Ka649sDxwsye9GUDKf3LkzB3TFUfMRp+9v/OkZEjXRc3BGOu/Gzs4+nQ+fLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146888; c=relaxed/simple;
	bh=cUnD7ftLrMFATJHkyiaXCjCalMRx5KiYvTau2bIrlUk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r8YS3AVwdRebgwZbeN30az9gmEkrsc7XMDeNYn7ydBL6hZIj1pwXBAm2HMGnGmz9eTUw9fGXcHmV2W853Hc87Ilx2UwHvzasxL8grmIQ04tG7LQcAQaIjdSb5CY2PXfnOQ2pM256TsCwoG9B6Vl/AWOyjEWpLUa44Ss299T9KHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2WYL8qtMKH2z9OeQ5c2MHsTLdb6gtsNlNH2eJ5at6PT9iN6Hhvn7ByP5iIzVA8RdvwcgpYsW+67LMEINa8BBqez5M2gz/ZwSzxCpNLwXjsND8UxQeLZMo51Y8uf1PnFkR6zvdpjQh90cvYIOvF7+PE2bQ1wCLeF6TfnZPIHwHqdlP/DIjFywk4OSl+FgLhkmA87gQNO3170kEfj3v01nro2OYGs6L1sXgAf/cenF8TqIesiiphkQXP30JocArgGvxLE/O16o6k2ynAh8iWQwC2e+1iCc/1ERpwGuPotzUHTlf8kOQaqyTyFWe3qexprxz45W8vUC1AoNca79IvN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIIWGz4pMkL4YN+FjRu71HZudNmtxyv//VpsUDwveVw=;
 b=L7IOSbTTCeu88/JnHKxrEeKuoZkoq3nSr0qGFB799g0YnTGyVTn8ST3eAkS+0YYdeozMVP1YOUyidAHM8d0VGJURN5HSiXxu31Cp1/+Y4ATCdJvljIkHb+5g9dKH+Z1KsePPP/sMD6+vEsloNfW12b9uvsi1ujYIoQ9b1CGdF8d1myNHPXWigjS25C3K0TkSHsajPswYE6vNKcDsz/aaOvzCsCPNZkQ/zm3mgtcrC7RSe1unSVRcUWKMnQv1kDP/tg1Mpj7VBfvLAXnjjJq2wsulECiNFGRpgOMUvezvFCca6yNl22xzTc9HNiGlSQxFGmzwAJQy+7olGlrGXIrmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1179.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 06:09:27 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%4])
 with mapi id 15.20.9891.016; Thu, 7 May 2026 06:09:27 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Thomas Gleixner
	<tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>
CC: Yixun Lan <dlan@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, Drew
 Fustini <dfustini@oss.tenstorrent.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Guodong Xu <guodong@riscstar.com>, Michal
 Simek <michal.simek@amd.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Heinrich
 Schuchardt <heinrich.schuchardt@canonical.com>, E Shattow <e@freeshell.de>,
	Icenowy Zheng <uwu@icenowy.me>, Anup Patel <anup@brainfault.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: interrupt-controller: Add StarFive
 JHB100 plic
Thread-Topic: [PATCH v2 2/4] dt-bindings: interrupt-controller: Add StarFive
 JHB100 plic
Thread-Index: AQHc3TazTGpuGln0/0291ZcbioS/xrYCFbCw
Date: Thu, 7 May 2026 06:09:27 +0000
Message-ID:
 <ZQ2PR01MB130792F4417AA339377223BEE63C2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-3-changhuang.liang@starfivetech.com>
In-Reply-To: <20260506085937.754808-3-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1179:EE_
x-ms-office365-filtering-correlation-id: d06531b8-576b-4810-03b0-08deabff3210
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|22082099003|56012099003|38070700021|921020;
x-microsoft-antispam-message-info:
 qT9Kftw5wTXEbUUjxJnNIIlzv9+Kg4iFgRHERz+IabVUgGIyoAuaDylLpfjpSZN8jk6n8Y+y4c16nSKZJ/+hqH5+wNkbtUOkZioWKssGSZMub3UAgoql+Zgd28FpIZwoDJpFbErs240AA55lnipoIDL3dRPe/UhEXFnQfYHVvtCRmvvkxyi33to2HLjyP+BckKvr6/2Xt9j+oJO5zFu0lk3jg0l40xYjFpeAK4q3cKiecS9z5SJkly5HRLB1d3+eGXuhLl5KFrty98Kd7slG+HMJfz1QvT/O7tlUwAzKetWSl/B6g9tRNp8iwKpBeP5vUo2TqlyRtN4cmYExFhjXsClBcQmmGY6iAySGpAskVt9HJZX3o5UPTRabY43x8xr4QGt4U0njCngANqipWs0zYetJY50aqTuysCe1RTZIVfU8U4SNwCXhPtS0k2tq4h++VJjxk8oZyC5xZtNGX6rb3et9HkKFp3UxHk4U6sc8p3IxNOqldWep1Cnka6wFp7hvKLCmnm/VzkyC/5M1897DlQTMUzBI7+/t0GakV0sXcn0v+E61GqMO3yikWHun5RgCMYQvXMrczOGCfMrUUb6b8Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(22082099003)(56012099003)(38070700021)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8v3LxE3Z12+3Jcc18hkZo7Dnc/CTkK44oPKH69XMFwaT9CoGN9MaYPzR1hC0?=
 =?us-ascii?Q?hYhVosN90j5dkMC8cVusYaSNueDe0m8cNtWjEZTIW7fg5qdIAMzuypnF0z8I?=
 =?us-ascii?Q?PS/u99Ytc16ACESY1VvLWJOHVqdl7EQwD/c2nz0umppGH2UmjIsPe6YIp323?=
 =?us-ascii?Q?yM3G6XFEnCN2OFb5uwxE+gld/FeE11id+b9T70fCActMogGuV7n+TAp7KCAj?=
 =?us-ascii?Q?v0cCnB2sh061vpdl+FEmy0M1Wwco2IEodBpc3sb/u3PoMaPdR03cda3FmAHg?=
 =?us-ascii?Q?CghOvB9OWJEX3xWh7IDJCzTOCLdhFHWPV5HgZi2YhDkulHdND4U2ZbUDs2WA?=
 =?us-ascii?Q?7FcTyvcIAnIibqsgniM7CgF7PTPsymuuWQ3YlX3vHGnQyIOXAY+yEBixgo8h?=
 =?us-ascii?Q?Z6V4mBSShJiqypkkxtncMfFZp9ZZRtBDioRpYCUT49l/wg4pafxsOCd3FgIO?=
 =?us-ascii?Q?YWny0corG5/uUWoXvwDysPyprbxBcp40T5+RiazcConYrw/ddS2OmAvlsiSZ?=
 =?us-ascii?Q?y9aTe4xhWdMiAckBxQjFVb++fUfxuTRGldgT61OZ66pmqwnPwaNH4uH1CPcz?=
 =?us-ascii?Q?KEGuvnnvn9u2o4dK97Lg5ooYNQ+be4BuSbkonSQlTArkCYpEZaE35WeThZgp?=
 =?us-ascii?Q?RxKAD2TL8YB3bG4haInkTg/uY9ylY/D98MlNITm+TUvgIkLurKj8E4OfF25/?=
 =?us-ascii?Q?h4M9FQtkCz4rMIcv1NF9xPBaqKDyl/11scSPpmn7vbXXWQzaVESCTjOgXjFK?=
 =?us-ascii?Q?SXG6fRRG6qoaUHHWKvgCGTMzI2lmjqDKAL8Ih75ms+pSWRMkLypMSyq9uSpF?=
 =?us-ascii?Q?2dktn84mAQUyXsKrwjfYa4dB37W3oMdQAZEMI9VdZtuuou0T6fH/wADYd3b9?=
 =?us-ascii?Q?cfHhCAvC8Pd47SFQ1NfKRxUlPAkg7cHdB3mj9Li++auZ8kTUrtNZnD7L4mjJ?=
 =?us-ascii?Q?BzfwL8ZTTBLlT9TSkWLGrTnwy8wFnDsvnIw4VbSqvUEwD/Uwl0VWK/7n7id3?=
 =?us-ascii?Q?W3fzIHQgJiTyDixgQkDiz4frgt8TrwPG8BrHBxPOT+GtNbiQ1CLrrAXYZmkJ?=
 =?us-ascii?Q?UIib2lmQ1jsN5loCcIuFLAvYH33qzi5XOd5MYSS06ixxsoAxlc/FCBtPp+PD?=
 =?us-ascii?Q?hSxU0sHDT09NQ3jOPfPe/r/xSl+lKq3iuG4fbxnKcwhSGg7yaNzcCRNwmxEp?=
 =?us-ascii?Q?zSTWqnh4ZCxi8ASHYTjFeYF0PwZxx7E8DOmYI6+Tf51DjG/5ug/JYb6bGYMX?=
 =?us-ascii?Q?HuNVt2SYVGyQ/97bTakWbtLfRpBo0zWts67rtZoCChLiMjYO4QWZhBkk16rz?=
 =?us-ascii?Q?DlZFGJHcs+x2TrQenY0Y3U5wSWKVJahalS2y7TUXx4d6xzqSd7DqYqbdrTBs?=
 =?us-ascii?Q?jN7R8Znv8HjbZe2dAXAQfFmvEJQZD8gkUZaJqBBpNIs0C2Fo/OJAHqQlSFNg?=
 =?us-ascii?Q?jc7WhvthFw2+rrVJZw9KC5pINq5OcL8JdBZ81ontxSFfW6PDT9bko+1YvSLJ?=
 =?us-ascii?Q?eRDpQa3ThA8StCpc53jLtOw+jcYFBGE1Yr7rjOqTyRi4UeHbbFkEeXilpChq?=
 =?us-ascii?Q?28/JDmyzvXZL4MRzH91W0VoTKbP6tdNPBfbthQtcU3DxmXTZzBr4zytorQAO?=
 =?us-ascii?Q?5rJkOZP0Bhmk0L3P91dK/ngKjKnNHt3ouwS2iVHkvALctxjZshCzwzLUv8jj?=
 =?us-ascii?Q?foF3SJ7rHKYYlDeHAtXyWCCak+gWRIXQFClUo2s5sk1FvnyI+8sf0/hug9gr?=
 =?us-ascii?Q?vDrK/0fm/Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d06531b8-576b-4810-03b0-08deabff3210
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 06:09:27.8000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHcIAq5DEasfUnaZPGJjKskWd0+cUKqk/EXrKRMkJ62YyTJkRD7CdbyRbZe5J15XaLvAIVxx720PLroKewqYdaDIHvQNiXFmuo+2npkv7Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1179

> On 25.05.06 17:00, Changhuang Liang wrote:
> From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>=20
> Add compatible string for StarFive JHB100 plic.
>=20
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git
> a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.=
0.yaml
> b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.=
0.yaml
> index 639bbeb1f6bd..4a242d252aef 100644
> ---
> a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.=
0.yaml
> +++
> b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.=
0.yaml
> @@ -66,6 +66,7 @@ properties:
>                - spacemit,k1-plic
>                - starfive,jh7100-plic
>                - starfive,jh7110-plic
> +              - starfive,jhb100-plic
>                - tenstorrent,blackhole-plic
>            - const: sifive,plic-1.0.0
>        - items:

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal
