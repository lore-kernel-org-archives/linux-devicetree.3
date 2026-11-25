Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.106
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585268;
	b=H/4DPLARxFsOQTsRxiT8MzhCX8brGxbsdZ84RKvjQrj5c2fy3kohYR8SADVeBfkEhpsg
	 g85+pRwCO0WCc+FwvdoAbEL9LpmoKrkfJov+aZO0hUZzI9U8eI1m0vfupOM3cEUxSHYMB
	 zh+doNvk5J1NCYrFoBTsV9F/BaHeul9b1S7pS1qi8wGCohd8wmzxGWbjymQpADsh/JAtF
	 IJPbppBUE2pWdLHQbxgesJ98Y4GT29mYHYc6k0KnM6hJ3ANvDH+xK1OsO7IIOxqvi80hG
	 IamL7z7clZ62iTHQfQ3d04u3WaeQqqpvGkEhU/Y11wV/I8hB7UNUoSlnaPKwyUJ5QsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585268;
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
	bh=9YOfQ0QS/Xg7LabmDtnFjd4yOEqEP6wv4v5FSo+eoKc=;
	b=otWrlxKiJj8M0uA8gFk0d32WcefR/xe/k3GUPO7zwU3BG/v4ygGsxOkCZw0NUGGooSoj
	 8zAg+J1kpezuq0vOwosBSfTBmlmL1dPAYVO/IaeVlSKqTvOX35xaC4035OEGPcOq8nAnE
	 BX/zSbnLmRoJNKUykGnHER5IgjLDq8vJuBStcMfzsxjeNI+Km7Mh7msZc8920nwAiAAuJ
	 eBC60ULGhjOLvQ1KajVUq6U3BJf8FZaNCQ+FsS7IOOUPUZlynpsRhSOojPQAENTpgMM+f
	 tZzTReoZo+fzbWYcRas9O8Bo1WDIlBaExOPtn8JSJKNBac41hIFvW/VGx+GVvC1bqpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=atlr-engineering.com;
	spf=pass smtp.mailfrom=atlr-engineering.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.106
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023106.outbound.protection.outlook.com [52.101.83.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45360606A33F;
	Wed, 25 Nov 2026 05:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45360606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=atlr-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atlr-engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gfxk/bLLGwj0TDXGj0tU1ZTIs6pyEBj9LT3cec72jScNeS7xEfHFWWTXhJKIHwPrQoETFDtR8UN0+cuTU15vAYAax1DtLkSQirhK9KMdCSyLfhSQyoszgurZ5+BFyjuanE1nItOvc7FFkFofeZcB8cvFq96M7rjjOCtB4dodU0sns/mY3ZvpzA51DhO8lvZ647L8nv8vNCU1zs/I2vjfYw/wK2HNR+4nIAZmOUQLWTZx7PolbtHVCm6iuG3/zHOSnORnAylQ9wZ6e1D7aVQlELWdF5mPLaT0ZE7ROkrm7EjGzYhegU2SgyQXlmqvZHAbXTZ4fOS5XOsC1BJSzAB7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YOfQ0QS/Xg7LabmDtnFjd4yOEqEP6wv4v5FSo+eoKc=;
 b=eEg3u59TQQcAHd1aN6xhzfMeBQ9s61jYSPAMgydvWFAvKw+e8E9axfnuzyhNExv6YgQayDGavwOgd3WMwNinvRC5ROT++njwccYaQ3RhlxjoZ8Yrkcg62Kgrh35Rd0tH2LHQu5uIeXg9MJjEeuAg8YAs0xbVmguoSS+UquGGSQmHKsWgW1ChFO1XVjJvh7+JMewTkMI2oiS1icQxehQNtaQaUgANpQGWdmJ8Z/dd6Al7tPxoXpgeq0p4doju9n2A4PVyU7GcsmYEXGTSKgRPxju9zHvD4fJrMOmAf1vZHnELGBNXbJvdorsRKfs9mWiqiRPQgRfUIHLXX0GKeDLMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atlr-engineering.com; dmarc=pass action=none
 header.from=atlr-engineering.com; dkim=pass header.d=atlr-engineering.com;
 arc=none
Received: from DB7PR06MB5324.eurprd06.prod.outlook.com (2603:10a6:10:73::22)
 by AM7PR06MB6626.eurprd06.prod.outlook.com (2603:10a6:20b:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 05:41:05 +0000
Received: from DB7PR06MB5324.eurprd06.prod.outlook.com
 ([fe80::b923:2ab6:f430:9f47]) by DB7PR06MB5324.eurprd06.prod.outlook.com
 ([fe80::b923:2ab6:f430:9f47%2]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 05:41:05 +0000
From: Alexandre Rapaille <arapaille@atlr-engineering.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa
	<abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Loic Poulain
	<loic.poulain@oss.qualcomm.com>, Luca Weiss <luca@lucaweiss.eu>, Eugene
 Krasnikov <k.eugene.e@gmail.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"wcn36xx@lists.infradead.org" <wcn36xx@lists.infradead.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger
 type
Thread-Topic: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger
 type
Thread-Index: AQHdeMX1l7HfVuMraUi16JfC5xyBYrc70B8AgAJ9W9A=
Date: Wed, 25 Nov 2026 05:41:05 +0000
Message-ID:
 <DB7PR06MB5324443DE4FA7FEF9B559C3385432@DB7PR06MB5324.eurprd06.prod.outlook.com>
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
 <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
 <65e2907e-a856-4496-886d-c9c3e8ea3351@oss.qualcomm.com>
In-Reply-To: <65e2907e-a856-4496-886d-c9c3e8ea3351@oss.qualcomm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atlr-engineering.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR06MB5324:EE_|AM7PR06MB6626:EE_
x-ms-office365-filtering-correlation-id: 27603660-adce-463d-42f0-08df4ab6b2fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10070799003|6133799003|18002099003|22082099003|921020|56012099006|4143699003|261028144727099003|261022105027099003|261026140227099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 xI/Mseq5VSfeXIKzHlOkgoItUlrD6Li01RHFTlb361MvfHOtbZQVMsI/bB7z5cpAg+nDD+BQegEpWT05IgCHPKt5ikD7hExYwwzWJC0Q/7RPmwwqwN6XejHganrbDrCnlQQ4WUhawrZJSxh0ggbhKtEgiHvYVRagQ9fJlWTHE/7MA1AI+5xHXuVU33js0aMqgM7++CxD3mJbdRMchEzXb0ZYX9ahS89WijbRDktdj6bZZyuUjutEmXEKGA/LEJXnd4WgEJfpjqyCCwrhly89zBqGvTuoUfviPZ1DBFMGt/J7VdkjoGRyS8EirQDS7vJ0bDXqAChFXk/T0+8xpT8R1UtMLn8t2XmijBwe0Gnk7XrpOtiFfBd0rXpNiAOTBIM07/rrl674sVzLSia3URtapNepBmpYMDNmmzy4K59vJ9HNIC/sjcRSS3kyhy4YSYRd/v0TK7Dfrn94L/1Fbqs7jAJ/CXC7Y3FiTi2flDwOIUWIrUXhjW+ZMB/yh8IPnAE30/IsQ/81Meoo5r2bH+PHSgN+Da6EkYTp4E005oUJ3SV/16xwLDW6vKBLHqIxLXf6h6YwXlQKaWDzJBRs+l/GYh/uvnYct2BwenBMGhViD+8aQ1FW+9kTGoE8jZOYh0uNydykXVi/lPTsNCirGoarXl1S2nkqHHb1qK45ILhqnCZ8gVCVF+0TJidfaqLRsrYQQdiwot06gOrWWcDeS7XZgdiBfJHSJjOYRK1NdrZFQtZrLMwnbVRNbHvOdhH7tK9T
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR06MB5324.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10070799003)(6133799003)(18002099003)(22082099003)(921020)(56012099006)(4143699003)(261028144727099003)(261022105027099003)(261026140227099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Xpd9bX0n3lXdxrPdIh59nBJ2Qk7zUb18w5JwsD5iBAqrtlyjKkRhKgg57w?=
 =?iso-8859-1?Q?d1RAFcnJ2AeZs439XfUEdWlVht6l6rNSnFzIhGix0k6QirINXHZ56p7/72?=
 =?iso-8859-1?Q?jvqe/4JqKLyrJLwqi83g0lzel9Zehye+W3CGq4rH2MRVnao0fY9Tc4yNYW?=
 =?iso-8859-1?Q?AYjFfneNnzLvT3Y60d62zPJzeT0plGNFlS2ims7NLMXkrtCzSCYsToGdj9?=
 =?iso-8859-1?Q?dX1TjFOfot9qPPrz1vhcE2e+C61qXpTqAgfGvfZ5XFS5f7m36F2V2u0vwn?=
 =?iso-8859-1?Q?tdaOblyMpjPbAgoAhL9l3n06egEq6YjlSTRCX4ewoygktA9N8rrwOEeJmq?=
 =?iso-8859-1?Q?xV6DtcTbqLbSQftHZJhHYE5KHZ+W/hZBZwpaGf4/gPLXMrbZIeoybFMQ9B?=
 =?iso-8859-1?Q?vUcewbludugn+LAs7DU/TYN3PB25XM/lffbOIFcTVVR6y6eVjkphDGphKm?=
 =?iso-8859-1?Q?O7jiWGd9QD91AbFy4Oqfwg2wkKIVhN9JiJD5m7GOvpr6Ab+HpKm9pfSTkV?=
 =?iso-8859-1?Q?TKZnB1zkkvp2eU22A5XD7FXuStGzchXxYOZnZcVaZKLk3pn8k5gtZ/nl8c?=
 =?iso-8859-1?Q?0OTD6z1VYTxoPCoDHylqsZV819hZxGGk2gUa/T8Rjty16qgZ/HnOg5e5OV?=
 =?iso-8859-1?Q?sz7Tjg5O/lZTSXCrW5ok33gxn5tO2mdySnI6FS8YYPIxvNeAIeLB4mLZwW?=
 =?iso-8859-1?Q?Ll3MlNeoEUX8x9zAqCMyKOETs6x+g+ob95Ul0fZaHYX4zQ7kvJ/7TE2OQB?=
 =?iso-8859-1?Q?lbth/TyHsrRt30KcPReQo53tEQbLYZuADDoymVA/ipK8sQac7EQUbCOpQI?=
 =?iso-8859-1?Q?wwGiWQUZ/IbNIJIeaya5I64s8adXZaS7zWMe1LcUQ+r87fgTMc0h+oSfl1?=
 =?iso-8859-1?Q?2XJ+KuiGn1JQ1YmfmTFkZ+ruiRI9UydM8XDMCSxGfkgKJlXtWVOHqPGRjp?=
 =?iso-8859-1?Q?kgwpE925KokUwxBlSXi7uZxozf84ryLPnXzPJSqWub68vQ4dVGJkAELAHm?=
 =?iso-8859-1?Q?jrVwaW+mREF4cP7riFO076W5WSlG6KR4sJisap5RiDzsarU1TG7mNfRrWM?=
 =?iso-8859-1?Q?yfXdHj57mEl2tuLLmYvWoREKzv4/NP1i12bfvqxwpPlrBZ3yNe52pzWedp?=
 =?iso-8859-1?Q?73+hDYqGltO7dq7anE+xZaYsesitxz5R/6Foge6L/EXByd+caOGISsg2Vm?=
 =?iso-8859-1?Q?6YjrQxQ3v8qTA8a8hcH+GIVCUUqfwrEaSKILcKbWk31PR0lkMSE0dwpJ0t?=
 =?iso-8859-1?Q?UgrWCFxvF2bEsRyU5S3w/63Im/xRJufpN5CiFYsIGAYSTwfH6aeJWwZT/H?=
 =?iso-8859-1?Q?PjzWlGiQo66tThUrLyq+CP14c6MNuGmSxXw1HYImVMImOt//SBsAWymleg?=
 =?iso-8859-1?Q?8W+OomPeyfkDcaaBoGBPbHQ89zbgTLlxPsqHBFLBUJKl8cZsABNBZnb5kn?=
 =?iso-8859-1?Q?hUUgffijvQ1B2Fb1CJ5IlMcwm3sWBcaJMY67x5IPesissdYfYDFz0uheAQ?=
 =?iso-8859-1?Q?NuJmxUnnwD2emLf+cZ2Y/P6TCl+mnnrEVkN0uBIdwiCZiILtmokxtyHbqe?=
 =?iso-8859-1?Q?RXimk9HCYuV2ImSxZ7KiGqhxOuj4kAm6dqIQMVjvHFDFmwVdhgCjvJobIN?=
 =?iso-8859-1?Q?OLk1euTPL0J4fyouNKzmb3SSpWPThqjA5bKnnrG5vYelP4Wdhs3qH8R5jU?=
 =?iso-8859-1?Q?hr0mT3Gb9xYlze87Nrc0hh5pp/CTE0GLNlvTZf61Y1CBqaBXXwloJ9+L5d?=
 =?iso-8859-1?Q?S6yuSzpRx/WvU0CMn0XILj/IWASEpFOBmdqXryawWdkb/eeT13WI/T6RFU?=
 =?iso-8859-1?Q?uGRIz9CHZFgf+8h7hktWQUdhTWbsuisnJNHUtbtdDgPblSLWhV5lNXGexB?=
 =?iso-8859-1?Q?dt?=
x-ms-exchange-antispam-messagedata-1:
 bkpXrqbaBCfXpJE7C1D7xEcnBr4NUNF4euDnWMbl0aBN9RXHYnB3D62H
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 27603660-adce-463d-42f0-08df4ab6b2fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 05:41:05.6827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba695f87-644d-4185-a9a0-94d2dfd2f6c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Cn6wHw+nwJ2gCvZSjutNin+ZS0WLq7sgnAK++Q6mNv8NYlgp4uNTdZ/HF8RmwC6RqXUE2BtR2yRT4gK0n5IPyTIaUoB503RbN6Xy6wrl+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6626

> Drop the last part, this won't be ""previous"" patch since it goes=0A=
> through different maintainer trees=0A=
=0A=
  Will fix in v3.=0A=
=0A=
________________________________________=0A=
De : Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>=0A=
Envoy=E9 : lundi 23 novembre 2026 16:39=0A=
=C0 : Alexandre Rapaille <arapaille@atlr-engineering.com>; Bjorn Andersson =
<andersson@kernel.org>; Konrad Dybcio <konradybcio@kernel.org>; Abel Vesa <=
abelvesa@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <k=
rzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Loic Poulain <loic.=
poulain@oss.qualcomm.com>; Luca Weiss <luca@lucaweiss.eu>; Eugene Krasnikov=
 <k.eugene.e@gmail.com>=0A=
Cc=A0: linux-arm-msm@vger.kernel.org <linux-arm-msm@vger.kernel.org>; devic=
etree@vger.kernel.org <devicetree@vger.kernel.org>; linux-kernel@vger.kerne=
l.org <linux-kernel@vger.kernel.org>; wcn36xx@lists.infradead.org <wcn36xx@=
lists.infradead.org>; linux-wireless@vger.kernel.org <linux-wireless@vger.k=
ernel.org>=0A=
Objet : Re: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger =
type=0A=
=A0=0A=
[Vous ne recevez pas souvent de courriers de konrad.dybcio@oss.qualcomm.com=
. D=E9couvrez pourquoi ceci est important =E0 https://aka.ms/LearnAboutSend=
erIdentification ]=0A=
=0A=
On 11/20/26 9:05 AM, Alexandre Rapaille via B4 Relay wrote:=0A=
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>=0A=
>=0A=
> request_irq() with IRQF_TRIGGER_HIGH stores level on the IRQ mapping,=0A=
> which outlives the driver, so a DT with another type gets "type=0A=
> mismatch" and -ENXIO on the next probe. Rely on the DT as ath10k does;=0A=
> every in-tree qcom,wcnss-wlan node is level high (msm8974 since the=0A=
> previous patch).=0A=
=0A=
Drop the last part, this won't be ""previous"" patch since it goes=0A=
through different maintainer trees=0A=
=0A=
Konrad=
