Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795071594;
	b=KyEzfuXHOg8uLTbXjVjoa2TMoG/995aWEZOuwAUC23JlDSk2lUfmRdmEVQAImfAyhrXB
	 MbeqcSf+dsUW2pFzduyYa6LKNq15BWZTTFGslREPmiT49p+ZOFNK6Oy9LgqJoqizUD4pm
	 vtbv9jqxrMyLn865S1ePB0sWbGBDjKO8/0NXxcvMZ/4xVu3ksHDKRk2PY+Hthir3Bp2A3
	 PpmTBctg8xTMyxDD0+h7DR/JLdICHBOd+Dpk9sFWschC3Ashvde7LRq+YgE5Oy1zOg8u/
	 R+ek+11h6aC/TEr0EluhkRoe9aUaDTEURkn/c9+v1qOJhoZxSIXIUgB93cZrxByodAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071594;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2iS1DGsCPHvLKaAO0gx3boP1NEZSwGlLfIy67H5hClU=;
	b=vjhtjl06zYkCI37sOd1gtovAOjPY0ZX39SN/MRLhYbKR8ynhsMyj4M3fxBRh5t9DSMUv
	 4OVBONE3EL0iiJlPfP91OhMnm4g93uC8xs5hrCuFzx32dqPFuXvTDb6OpBkEsdH+oYaQs
	 YtgEoGB0XsNrx3jTc/KdDklhlaZXVX0uXG4VWDNPEd22zqw8o2xsYH4rfXR9vUuU+Xxwl
	 yIISE6OIqWPnQCfk21iG1zTBPUYJjjyQ+SF/hLTsibCaG6xlqDL4+eF0WupCc6re2qCKr
	 4uHz6UV6pxx5Z9+LU1GghMnplen2W086mvv1CGRNXpOgTKKpkT8wiZGr8LMskwV9YYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=atlr-engineering.com;
	spf=pass smtp.mailfrom=atlr-engineering.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.124
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021124.outbound.protection.outlook.com [52.101.70.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6196606A324;
	Thu, 19 Nov 2026 06:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6196606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=atlr-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atlr-engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtMMaPOTMn0XwxepGKE7NsxX97qDJga8aaK//59XT2bemY2PM5cneEuQ5kIavQkm34QXvDtxoFhG0J0/rFVdW858c//oRcfV+/37HJd6VFSIK4pJqR91QCs2AJnCIRfGBaZNS0kQsKK+CERDyGKWJnDEgPrc+XzIs+Y8yKfeCyOPxURursgjfEPd9kKTX1ARDpx43piN3FjGabm+iq1oniBRTxO9J8PPQJg45LwLKOM8sPuTAhh7D3RZdCVU+aj17qWWZXKFQeojQAcVsw9UhG9X1Mefcj4KihP2Feu7NCos4/qLwLPFCSYDkes6d+iPqVL/F+APbTyHS32FY9Su+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iS1DGsCPHvLKaAO0gx3boP1NEZSwGlLfIy67H5hClU=;
 b=gKjgVxSyPePoRHNHaBjCW4xm4blPHnggg3jSAWCBflex8z1E8MicKFlZ4FEGbudle/fLNMCG22LoZ8YeByZmakdv7X6v/BzaxxyuU452faLwhgk3KMsTO8ZKecHMjSy1hr1gQdOoykiIxqoF2+zro2zJyERqewTScXws0Nz7522mTbTQT8gT1jjvDk+5mz4AKG3pD3k4myHXIowVA4/ByViEeVbP9G6VlfbhwbLjZS0PTQkgNxhlNiyRZKHmiZXrlqMW0nG2RMVI/vyQaaC+jJgbzJOJflfo31tWuYPsrRD5tqkOatZvXfLKZlfdDisPAQP1qv8KEk0j4fj+eqBZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atlr-engineering.com; dmarc=pass action=none
 header.from=atlr-engineering.com; dkim=pass header.d=atlr-engineering.com;
 arc=none
Received: from DB7PR06MB5324.eurprd06.prod.outlook.com (2603:10a6:10:73::22)
 by AS8PR06MB8364.eurprd06.prod.outlook.com (2603:10a6:20b:447::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 06:59:51 +0000
Received: from DB7PR06MB5324.eurprd06.prod.outlook.com
 ([fe80::b923:2ab6:f430:9f47]) by DB7PR06MB5324.eurprd06.prod.outlook.com
 ([fe80::b923:2ab6:f430:9f47%2]) with mapi id 15.21.0615.012; Thu, 19 Nov 2026
 06:59:51 +0000
From: Alexandre Rapaille <arapaille@atlr-engineering.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>, Eugene Krasnikov
	<k.eugene.e@gmail.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "wcn36xx@lists.infradead.org"
	<wcn36xx@lists.infradead.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
Thread-Topic: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
Thread-Index: AQHdd21AqhKF/7D/YEy/7l8pIEzC+rc0RcuAgACx9E0=
Date: Thu, 19 Nov 2026 06:59:51 +0000
Message-ID:
 <DB7PR06MB53249C2E9D190088A52CF72A85792@DB7PR06MB5324.eurprd06.prod.outlook.com>
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
 <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
 <CAFEp6-0sYs0mEm+4E_zEgXcSjoYKwtW_YJSa601gb=717Gec4A@mail.gmail.com>
In-Reply-To:
 <CAFEp6-0sYs0mEm+4E_zEgXcSjoYKwtW_YJSa601gb=717Gec4A@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atlr-engineering.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR06MB5324:EE_|AS8PR06MB8364:EE_
x-ms-office365-filtering-correlation-id: 148eef9e-09cc-4b87-774d-08df460ab52e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|10070799003|22082099003|18002099003|6133799003|261009223027099003|3023799007|4143699003|56012099006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 qIsOupeDMKg9uDC1XjKNrjioPz0+9UPmTD1coLGKN87Wqhgd2MWRFUzo2t4LEcpFk25TvymXEV5ww7EJW58qiMie2MUizBVy4Eg9ezmm/s40BqAIx3RxCUzM5hHUmDjYjdDBf9Ga4yCwyH5hbIdx1FBI8fIosRCO/fr5C8ZxHh5XJ5Hz+OHhV7kq6U48decGaHWnkflDDFHcm1BKbGb7kRvs6HeTL2UtzRSh0v2VJ1ud5WOV53gbK5cIMsm9LDCMawXNqiLDpIeK2HI4JTKCFiwda+3r8K0IMXtcIlhUaSHxSQtId7HyTDL2MoOOKCsKswcK4nowBQHGdzkOB8TedU6zCaAqnvZ9xpPwtQcmqhXUkf+MOUcBtSG0H0zQw1R1LFkd4ezgMA3NW4465F5TrWtQU0rsvWQ3MNr6Xj0IKfJaCu9sSyO0bH5P7rxjPDRBjACN/XKVmlHA1npIQFHno4ttrMxcrIFpopLthwJdcZki4eYPIh8N562CBnQdrGHxutENwyeD/4OyVkxEqV34E1mchu9/BbSf8IHQShtMhZWPuPtbjn18FtUQmsHrBswIH79dPflwFip9NVGY0IVaAM2QWob6wTBgDD8W2GT0wcC6M4CMEG0FJFG9wOC+MgyuR46LEFm89/X+gRcfPUNXIQrhB1fsOB7en4rjiBa2QnIAUUZ++Wvs3Ax/oOMLiUY7lVy7XUMLiMqAGuaf1mPjC2eM0rxMVo33xU2HxJRRPQY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR06MB5324.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(10070799003)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(4143699003)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Nq16aMnaGOoWH6/OHw9jGYDVwoh+W2mMntDn0XTdR9qEoTf8k5mNkOqhix?=
 =?iso-8859-1?Q?MqriLAmM9l7ddUtqKaeLK7KHZMxt9pxYad8SWtBckzVCJcqrcBX656wH/k?=
 =?iso-8859-1?Q?SPb5Py5YViXx34HkNdOXVFLg7nQiQawuv1kr4XOE0hoBSauYSTpXOJYq+9?=
 =?iso-8859-1?Q?r5LI6mp7MEIFxA/RpMPGb+VmKcV8kpAG05CJ8aBWnlXyuTAW7aRNvHK4ym?=
 =?iso-8859-1?Q?I/osYeQ+o1wTZaazYTJqANQNsBv1Wz2A1ETjxtMlD76cxfo7yA4Av9HWJY?=
 =?iso-8859-1?Q?NsKlA62tk1ERm0Al8o2yk42FA+0KduQYQMkqdbOux/BoTqlOvQP5wpJr1V?=
 =?iso-8859-1?Q?47dkqNrNIWgVHkU4P0RVDB666AMzXNlWhAeGLWWuvR5NcTuXTGZZmNzGEa?=
 =?iso-8859-1?Q?VAJANQhYymvq4PsVfi3FmGXg2ppqslaPUta0Mwb+cDllp+dci8ue2SMDcd?=
 =?iso-8859-1?Q?B494H1m7NBsDdgs31hI58/6JDPyh//fnnv3E7+uBtOsx1cNMXY5jdHro6H?=
 =?iso-8859-1?Q?eMimxPl6X6vCAhBmkbaLrNz6tGESEk4lATO14v3xhXwkE/qLl9fdMl+y9k?=
 =?iso-8859-1?Q?RglExSC+GVqCn4rVfnoLajNrL8ihmeW4dBHdbbCY4tGcJVg29D8ap8r/U8?=
 =?iso-8859-1?Q?2kMzDUGobS6Jdy+wEgwnvtAiq2uEFzVsdPvb8gPpSiSkxkwj6laZ0t9zWO?=
 =?iso-8859-1?Q?nTAEu0wore6MmYPQgBNK2WtkhNotYMyZus0TJWMvUbMx5+q/LcqTNqBltq?=
 =?iso-8859-1?Q?NKtQvxMeW136DbvLNzDdD1DT11SPz7XscGb3zI8UwcmBozyherTIlaI2Ag?=
 =?iso-8859-1?Q?jZGcHO/dzd4OAHxF2dq+5NCs0yVuSgrrC3IDUpkRgxlSzJyKlYkvLdtH8y?=
 =?iso-8859-1?Q?ydAbcXhw9m0Rnr3Bj1fJc7ipQ5SVnrqJABt3aqGcyLJ3kxZCzxeiXbgDwh?=
 =?iso-8859-1?Q?kFe1ICwWdF6kBDs3BOjNOaLMge9p/p59Fdyw2XgcTQyWOOAdTLA6g7LcAB?=
 =?iso-8859-1?Q?8lpKRjOeOfoYLxkk2wXyIu7ZV2X/l5TAysFktq2Grk6GKpB/p0mZel/FUr?=
 =?iso-8859-1?Q?0RLT1sYZdXr+cySLOFVvYNv41x7viIFKEciz+a5FCETPKuHqs+UvP9cF1+?=
 =?iso-8859-1?Q?WtjCfjR3M934YZNceW6YsRtuMwWuv5qKcBiJeDi06hA4JYPXPsXYwZUkrp?=
 =?iso-8859-1?Q?2m7+brZ0vkTJWtYySpk4Dgx+GcZmwjb7GzKNjMCxcwD8yiJWHwbnl1Icue?=
 =?iso-8859-1?Q?acbFjQhKzuWsrAd2P/32KCwHGv3ktHfXOmyOwYsL64b0OV2zDCJOj3YW7E?=
 =?iso-8859-1?Q?MZRlopJZy0fInNPOq2tTaqOcybN8oIbEhRbreQK9ppHLIEZto6SozHwiMg?=
 =?iso-8859-1?Q?SwoHpWGW76wmJd7zMeh8+4j3XPlXNsAfmwcxi89irFNWgo4el5FY8yrCkE?=
 =?iso-8859-1?Q?OOyA59IOsxv7DUkyXyfgbl2hYHTFnmtr+d88KHYzFLE7ZEPsm3kfEjJd15?=
 =?iso-8859-1?Q?jXi9oL7m2wwzGhOZ8wxF6PCKGXIDA62eeta01U/G2d1pZEXFig/vp8eBQ3?=
 =?iso-8859-1?Q?b2GQfpo+utG+wwglckbDy2zNaRdcQt8lNsPcLb3wHZQu5i1o2U/xo3BFIl?=
 =?iso-8859-1?Q?ccJkrWGwQrjTP0oneestlGymR+AxYEbOnNvPaJLY3GdcKaoPZdxiIcKntw?=
 =?iso-8859-1?Q?LHYZH4GLjCJ3mVbIQHq/p3BDg9/tL9B7lSZV1koQzm/Msj7juKGOAALIEC?=
 =?iso-8859-1?Q?OhYF8dt70Gyo+np+QOYfB0CwvJEbpDp70zTG7djUCMKGJTolkMFSpdo8Kc?=
 =?iso-8859-1?Q?nsX3VkXr4PslkG8nAy5BdL1/qOa7UHbgQT5YX1ZEOY9aUog+cTP1fXHkMO?=
 =?iso-8859-1?Q?J3?=
x-ms-exchange-antispam-messagedata-1: y61/fNwHJhz+WXt0KgB4hA8fQXwXQm9BGgI=
Content-Type: text/plain; charset="iso-8859-1"
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
X-OriginatorOrg: atlr-engineering.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR06MB5324.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148eef9e-09cc-4b87-774d-08df460ab52e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 06:59:51.2935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba695f87-644d-4185-a9a0-94d2dfd2f6c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mcMSe0nulw/A0Gb2Ptekyforwz7D69wfOSKQsByyqsP46g9SyWHWjQl73uX45KuBv2k3AjaEXJT5MNL8KZLLS1sivaqwXHrjp9T7cQlpnS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8364

> Can you explain why it fails? Is the fix at the right layer here?=0A=
=0A=
On the first probe, request_irq() with IRQF_TRIGGER_HIGH overrides the=0A=
DT's edge type and stores level on the mapping, which outlives the=0A=
driver. On the re-probe after a WCNSS restart,=0A=
irq_create_fwspec_mapping() finds that mapping with a type different=0A=
from the DT's and refuses it ("type mismatch"), so=0A=
platform_get_irq_byname() returns -ENXIO.=0A=
=0A=
The fix for that is patch 1: with the DT saying level, both agree and=0A=
recovery works without this patch (30/30 forced crashes). This one only=0A=
stops the driver overriding the DT, as ath10k does; as Luca noted,=0A=
every other qcom,wcnss-wlan DT already uses level high. Happy to drop=0A=
it if you'd rather keep the flag.=
