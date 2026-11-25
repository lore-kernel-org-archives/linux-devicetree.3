Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.151.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629856;
	b=k9DN0n/uJ4PLqcy1yU/GjM+0MyvchQD/Gv72jcVA/laJmQz97xGvj0uBr6L8Q+mRwuul
	 Z1D2RFSSzq9it9KeiPMbLUNd19JanZN9HoK4QD2gNyW00D5oBXB9dAUYluRCY5VVUrHkj
	 qZYq7vFuCHyXHemEs/3zKXq0BmPlsCTTQLFOpDlQyNx0XCH8ik0tZEvldG66p1tC0bUUY
	 xHGbM7sx2EygyRYVRJJ990zFeCfLLqemN8Kb4cENb32EVELCp3v4UCyqsAQk+E53CkBXD
	 cseTD7OanI6B/UZaEFvt7dpL8ACC6V7OnUu+gwsQJ0t3Lt0h/0bfr4F/SXAMUY3YZLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629856;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=mciDL3bSR/GABNhUMZRfQ21xZYtcI9xdT42SGlPjtUc=;
	b=0PHbLSivao6cZffmsz+JUB2zGc/qx4PBXAkGht0EvQXqKk2Jc5DFIoPc9lwnTfaOXnzf
	 RaaFLaJNqstD8wdt40l41PrWlYrEQimtg6n/YYR76UfvB7WdPDilfixch3dlez9apZaQz
	 ZGFZtiUJBUu3Om5YabUICH8K7AK5qC7Wttg+P9ZVp8H9S0ZJFnSaYNujw/PxpDcV7X5Mi
	 bM5cDWf1Jr9+KR+EJzQwzmT0HBumuzDNce0QcZDjCLkfRjvIAFIY/IdZmHv6gG30tigO7
	 qClQ0BwzEqMguwoT1Ni4SwoSt54pSRT0pDlT8gzSweGVicXe7CqBG0/vUf62nQZ2+RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onsemi.com;
	spf=pass smtp.mailfrom=onsemi.com;
	dkim=pass header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=LyMWYMDe;
	arc=none smtp.remote-ip=170.10.151.120
Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.151.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8878606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8878606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=LyMWYMDe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1795629849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mciDL3bSR/GABNhUMZRfQ21xZYtcI9xdT42SGlPjtUc=;
	b=LyMWYMDe88iD/Oj+voJT9O0IomehC7YAPJrGVL2d6vmlmlhEeVbFKUVVdFy+W6y0WJF511
	l7wUxfgazeJzXshbAFAX4k6ghTlhzY9e40fXoGaGHhoDGoAwK1E+QlPBe71tN8GTFg679B
	sKlovvlkofmnD3HyocyDHQPtU7ls/byh2eP6zVPAJga5ZYQMFdCYFer9Im3GLhZBXCntJp
	YTnndZ8v1ldpGj9QnTa8PixmOEPvR8mw9my/BAERCFUv17/jNqfs4kP9dOvOZPp1xmyI1z
	LK7tH7wAp4m9z5sHofCBR0N3U917tQwXuQbtSSsjgBIBxYSQwKsekf0sNYzJ8Q==
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-15-AmZFxuiMN6yKZnF3aDhKQw-2; Wed,
 25 Nov 2026 18:04:05 +0000
X-MC-Unique: AmZFxuiMN6yKZnF3aDhKQw-2
X-Mimecast-MFC-AGG-ID: AmZFxuiMN6yKZnF3aDhKQw_1795629844
Received: from CH0PR02MB7867.namprd02.prod.outlook.com (2603:10b6:610:110::22)
 by SA6PR02MB10624.namprd02.prod.outlook.com (2603:10b6:806:434::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 18:04:01 +0000
Received: from CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e]) by CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:04:00 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>, Andrew Lunn
	<andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
	<linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Parthiban Veerasooran
	<parthiban.veerasooran@microchip.com>, Richard Cochran
	<richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Eric
 Dumazet <edumazet@kernel.org>, Piergiorgio Beruto
	<piergiorgio.beruto@gmail.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jerry Ray
	<jerry.ray@microchip.com>, Ciprian Regus <ciprian.regus@analog.com>
Subject: RE: [PATCH net-next v12 05/15] net: ethernet: microchip: lan865x:
 Depends on PTP_1588_CLOCK_OPTIONAL
Thread-Topic: [PATCH net-next v12 05/15] net: ethernet: microchip: lan865x:
 Depends on PTP_1588_CLOCK_OPTIONAL
Thread-Index: AQHdfGCaOZJ/nRo7DEWYwZu5Kr8hqrc/Fa3g
Date: Wed, 25 Nov 2026 18:04:00 +0000
Message-ID: <CH0PR02MB7867D3D09842E2482E91821B83432@CH0PR02MB7867.namprd02.prod.outlook.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
 <20261124-s2500-mac-phy-support-v12-5-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-5-3575855d99f9@onsemi.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB7867:EE_|SA6PR02MB10624:EE_
x-ms-office365-filtering-correlation-id: ff8568d0-1489-4358-57d3-08df4b1e7bdf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|921020|38070700021|10067099003|11063799006|4143699003|56012099006|261021121427099003|261009223027099003|261102123227099003|261026121527099003|22082099003|18002099003|6133799003
x-microsoft-antispam-message-info: 76BPQU6+VvLhlE3FkKp0gCtzmqV7RFEYJ9xI6QB3/NYXMQ0mRJwDT7fLDcYpcQtrx6D2YiFx0LtQM435xOncnr3+QpB4cOLlOCqLAxLUn3HtVi8ak7FR/x3u/gjxMZjiV+aD6Lry3Bby8Y/MIy4rtX5uJsEwmKSIEQRNKiiYCKljQZlERRda3yQTpGnTcTLVazdZuI9beDV7MSGWvG9s9lWx8NbFZcxq+a+3R6odgVOuudQUe+6P4S5UQBz8uPaEWlLEnq/rGmhkzQ1N3ks3HRPFOnEJupwCZ1WfvXZ/Di39ZNdHNqPk0NfTd7fhEVzcM4rkr76xGTFAbWfYl8dWhJZkPF8S9vyxiKJNFrJj7FmYcv0GlLnSRMi+j8PjTn4Ud80rXGRx6+/Bt3HePX1fMDt/MtbEmamwkHTbWqZFl6sXD0H5w5YeKMSHjQB60vaU31J5dcoz44q1oF/5WZhvN9XteMTZA/WK5dmzFerTenW3HrzJOYxX8fW7JaGlebfjsYB5s+eiyEIXpBojxTZ1deUKIoJ3rrX8cR403/gTuspkapqqQRQfTsWK7Qkx4+04qHiC6xOEKw4Qf7FRFTtDuhkhNRKouxvKK1BR7U2arK2/ckzMMmEtVmhGC7QYliV/CQryraiFPCz+YtHsnIIl46eIRbMa4Uqg4r0oP+Fve8yznEAwfEsGKLhszswFGXcgEMuK0jpgYcgZ6LjsWc+90nZ3jeJFPFEI15360TdCcydebyI8IL/rFeFlsvfF2ecg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB7867.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(921020)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTkrU3IxVGlUVkpDMjhHYWJBWTBqcWwxMmJOd2IyR0tXRW1Ka05DblFqakpG?=
 =?utf-8?B?dndsOUNVZmpUVVUzUnNIOUNOK1ROWWFwdDFWaGJtWFBDY2QveGlpUW9MRFVG?=
 =?utf-8?B?b1lTYVZPcEhrbm9KMEw1b3puQ0Z2TjJxNU5pTUZNSnhvWG9EbnZlZVdYTGda?=
 =?utf-8?B?MVFOVGx4NUNodGt2VG4wc0liZUlac1lVMXRSS0VjcTlxTUREdVB1S0hsek9Y?=
 =?utf-8?B?OGFMV3FORG45c2dUM28wckY4QzBHS0plM3JpVUZOeWJQaHB2MGR5azdRTjA1?=
 =?utf-8?B?bDNxb0Nsbk90UWErRnVxUUoxMHJFRmZpSm1RS0pCWjZMTTRxMVJZc1I4Sitp?=
 =?utf-8?B?QWhQZGtodjJBV1dVVnVaMFBWZGJ4TlozYkd1bW4wMlpQakFaU0FQbWhQTjB0?=
 =?utf-8?B?Vkg0NndFL3FCclc3SW9WNHhWNy9uWVhTKzBHV1dmbDdWWDY3b1l4eXVsL1JB?=
 =?utf-8?B?T2NMRmZiOHRKaVgrcThVbkRjZmRtVE9oWEFBc0I2TGxmc0N1by9SdE9hTGNq?=
 =?utf-8?B?SFpFbmR0T3NyL0c5blljcEZ3dStJOHVsOVF2YzIzalIzekhVUjJqRmRqQmQ3?=
 =?utf-8?B?Mm53WGdCYjAzK3lNVzVLem1qWTB2dVFxVmR1TktrRnVRaUgrK2NRVUwwdlpM?=
 =?utf-8?B?dWhLc3Ftdkg0ZlFUZzNLc2JpVnp5WEZaYlQzeXlXamZ4RmNUMHY5TFhINEZr?=
 =?utf-8?B?eTdRWHlaL0RnSExDZ3VBS2thQkxnM2QyY0oycG1XM1ZkVVF3cDlOeU9McVEz?=
 =?utf-8?B?VjJWV3Q0S0FlOW1SM01tZWtpellFVzFibENvSUlhUzJCb0c1TW1jcGE3NFFT?=
 =?utf-8?B?dUkwTGhpeXJCVURWc2NLT1RZU2hLZXdqWWhlZ0ppSjdIbTM3RVh1UHdaVTdk?=
 =?utf-8?B?TURVOVI4MDFuK1dwQ24rdHlwRHozVGIrVGhkU3NsR2dCZUVkU2d2d0VqcUFN?=
 =?utf-8?B?TlgyRjM1N2lnQ21jM2RGY0xaazBKMW0zU1BWWmhTekNNY0h3TzJJcEloM0Rh?=
 =?utf-8?B?T2ttZzFoNUFHSm56UEZNMnk0b08yYjJOM3ppd083VzFZQ2dmMk9ka0V0WmJS?=
 =?utf-8?B?RnVoK1c2UnF0ckFic3lZb1d5T1c5TmJGZmtyeGJRc2VFSTlYNFFpQ0J3QXBO?=
 =?utf-8?B?SHNSNkx0ZG42dEZHYmJJa2xJcjc2ckFla3daMi9TbkFCd3VqVVZTeHBtVy9r?=
 =?utf-8?B?YVJYL2RqSDQrQm5Ldnl3TjVPYWp5cHhwaDcxdE1uZGFwYk4xdE9mbXBUSnZt?=
 =?utf-8?B?YnRZUHlYeFl1dG4zZlZkOU5CQTNiVmRSdmVnS2xBNXkvazdwdmU4TStXOGlC?=
 =?utf-8?B?VjRFajFLcElaQ1Yyd0hvd3lQVXl4QnZaVnlKcGNOYmxHNlFNWG95MHJxbjNV?=
 =?utf-8?B?aCtKeWNQSlZvZGtrY1IvRG13MmNIa2JPWGtGQ2Z6MmZCVTNEU0U3RDlJeVgw?=
 =?utf-8?B?NTdybzhDcVQyeHBjUFk0S1NOM0EydEo2NTFSN0pFMnpRUmh2YWV0UjFYbEZj?=
 =?utf-8?B?Wm5JYklWQjVkdmpLYzN0cXlKL0U5R2QyODVBL0gwSk9jVE0xK0Nzeml4dVNO?=
 =?utf-8?B?TC9kOHY0Q2RxU3A4QUpWQjdONHppNzN1UDNaOUJwMnRoWjNhWFRyMjVkaWxp?=
 =?utf-8?B?eVlrNDZjYzVxb1Uyc3crdDdhMWpVT1Z5dWNJbEZneFk5c2g2ZUJuczZZUGN2?=
 =?utf-8?B?ODAyOVZhT2g4Mm53Z3Zrcllmd2tkQmRnY1RIbUhOQzJ4My81NytpQ213THBE?=
 =?utf-8?B?M1B4czlSbjV4czd4RFlaMGhobUxNYzF3L1phYjQ1UUtvUk5COG1XMkhJeEZj?=
 =?utf-8?B?UHdSNWF5VUJyVGsvcHlQd3Vsb2J5eHVUVDlkcHJYYVRNSDh6czMvNGIrWS8w?=
 =?utf-8?B?S29kbVZMMEJROE4xc3hTWWdXOWpZRlVkNFU2UWN3VlpUQTY3dzcwWDdsSWo1?=
 =?utf-8?B?SDRMczAzLzM4ZFMxS3dnb2FsbEhIc1ErRzlZVGJlMmlOd0RLME9YTFZWQWFV?=
 =?utf-8?B?MS9jMTdtSGJZb0dZakNIeHZ3NXhhejE4U2FCOXNlODJJS3dXRmtIMGw3UG9N?=
 =?utf-8?B?QVdVaHYzbG9wd1REMzVLSTZhbVFVdWkwWUV4RjBOU0ZWb0xkbGVzVkZDSXo0?=
 =?utf-8?B?R3VrcDlYK2RVQU85NGRwOXdEUlF3OTVSL1VBVUhHWHdSaEpRQ01tejdFend4?=
 =?utf-8?B?K1NEaCsxMGFlZXZrOVg3MndVNXRjYTBvM1ZxS1kxZkJ3TDhHUFZMdzdwVkF4?=
 =?utf-8?B?VDRubFo5MDc4Kzl5b2pHY3BTbHhtaG1mS2pKclhsVHY4OXNHUFI4MW9EbDVZ?=
 =?utf-8?B?N3orQ2ZHSnBFa0xPTk81Nm9QMGREUEQvTDBDOU1iUGxyRm50c2FYRTJRSDhu?=
 =?utf-8?Q?xVQlJTVAXFhXr+YM=3D?=
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WVhIMMYSBWGNH8UP6IxoMTtPNDYO3olw8Yt4hvQvmpfWlTd2rdPGVkIVjL0h1ukoxQ5qBlrMsMB0b8cLkWQqNSLUNlr6g4/1v/YJ8R4n3CvN0PbL62d4U59mGRdt2TnqHUMIWyuH0+1Dpt+nUwYZgBokRt+OS2omfMgbGJs/C+wP7t4JenwHViku2BM81FYLwHD1G998z1t8jIOHHsynsYyQUnCI6r1IvIuTcBN4YCSGaGOllL77LcMf8ytb3uBWQ4GN/om0ToU+BIJ1rAcuBQWcdr37HcWafn+4+HqkvzHWdEf6bpcPcAafE14aKIkoQThYPD8rZ1yTekMF1fa//A==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7867.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8568d0-1489-4358-57d3-08df4b1e7bdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 18:04:00.8850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UT/hKyel6lZaAGq2LU8CFqy3SwV7bcB9xWwAP8SST89Qsibg3lFmM+0TuEiOYImUQNtsZYISq/woAOT+KmQrK/t88Ylym0BMQPCbp4/qISg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR02MB10624
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FqSh-pOb64BOB_jW5mLtQJMp5gOCk69Z96-GCNv29c4_1795629844
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

UGFydGhpYmFuLA0KDQpBcHByZWNpYXRlIHlvdXIgZmVlZGJhY2sgb24gdGhpcy4NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTZWx2YW1hbmkgUmFqYWdvcGFsIHZpYSBC
NCBSZWxheQ0KPiBTdWJqZWN0OiBbUEFUQ0ggbmV0LW5leHQgdjEyIDA1LzE1XSBuZXQ6IGV0aGVy
bmV0OiBtaWNyb2NoaXA6IGxhbjg2NXg6IERlcGVuZHMgb24NCj4gUFRQXzE1ODhfQ0xPQ0tfT1BU
SU9OQUwNCj4gDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcm9j
aGlwL2xhbjg2NXgvS2NvbmZpZw0KPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21pY3JvY2hpcC9s
YW44NjV4L0tjb25maWcNCj4gaW5kZXggN2YyYTRlN2UxOTE1Li4zNDIxNzJjYjg4MzcgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21pY3JvY2hpcC9sYW44NjV4L0tjb25maWcN
Cj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcm9jaGlwL2xhbjg2NXgvS2NvbmZpZw0K
PiBAQCAtOCw2ICs4LDcgQEAgaWYgTkVUX1ZFTkRPUl9NSUNST0NISVANCj4gY29uZmlnIExBTjg2
NVgNCj4gdHJpc3RhdGUgIkxBTjg2NXggc3VwcG9ydCINCj4gZGVwZW5kcyBvbiBTUEkNCj4gKyBk
ZXBlbmRzIG9uIFBUUF8xNTg4X0NMT0NLX09QVElPTkFMDQo+IHNlbGVjdCBPQV9UQzYNCj4gaGVs
cA0KPiBTdXBwb3J0IGZvciB0aGUgTWljcm9jaGlwIExBTjg2NTAvMSBSZXYuQjAvQjEgTUFDUEhZ
IEV0aGVybmV0IGNoaXAuIEl0DQo+IA0KPiAtLQ0KPiAyLjQzLjANCg0K

