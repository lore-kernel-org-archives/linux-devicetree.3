Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020139.outbound.protection.outlook.com [52.101.56.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2AB2DC792;
	Tue, 31 Mar 2026 19:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986321; cv=fail; b=DV4/TpMogBF76ipaqDoH5Rv0MVNAqsMBI3kEloBqADWVEcW+IRkbZH/RlnDx6Pw/zbGCLIH2e7RJ8uYeLtmbrASIX370sb7sos43Q9xBtlIRhfw23bjSqhNe6fhvW1gJPNEKBS1zrwzxCuRQ8QWKrkbPcTyg9p2hcB4ff0IA/WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986321; c=relaxed/simple;
	bh=TIXdndzW2cJwiF/RCS0zpn5sDSJAJeIOy+HuqEMEpOc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=A12GMH2Gc+4a17FeJKbxPnqQ5mG3Q/NqfQxyx51MH9m5KIr3WEDd0u+d095d4bS+ygJ0CnEf06l0YzxhLROj57sVGLp/ltCZTlJvVPdqPR6oxbExZkWIfisraLDI1V56PViHEL/lq8mIGcyuno0/Xh6B8lmZ4WBcZnbyYxtn26Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=q9A9Qq3j; arc=fail smtp.client-ip=52.101.56.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="q9A9Qq3j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQtv1EKFl0y3u8yHxT4TaTAmsonHtWsfNw7ZUDjvyLAASZHz6Z6L/HX4AJ8Yaf/oARz3htk+KaXoUVGo7JNoCzHGJc4zQgav7STg0a/2L2FNcCln//MvlTpza9JRwSdhsv0lKgYlYEhkTHgF1cWqFgg0XuQOYJUNllrq02XpuXXYE4+VUBC9h7Cyj2SvGH2X1gGV2IZRx3Eq6QNXPRLXOWLVNFqPEiNY1LVCyHqoHen3tNc7kXilcPiwrOVyalPySYXMGh4McoPeVVmh1Wn7bApuGjB3RHBmeuAToJHOa26xaNNbVccqak76j5h+MaHVwxPsenCld66yq3Qd+YtjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pz/y7sCKD1JhIOfERw2Qw2Em/AnQ34nQIyfpXQmWoXA=;
 b=ZZ7zHRMyFXXAqB8IFyjcxqnkCA2jbiG5lncnYD6sb37LW19i+A+qaAGepu939r2wV+aXM4IYPscKdNGYvpFihr9XV+ibzmBJ0GGZMibxqYsbo1qK8vK9jcGHAotX/a06MY9+G+0ohZy2+Q4CC3eWgjrdEOT7OXc2OGLm125I1zJckefTJYLq9tC5TQZ/84amSVTWFITJ1C9PIuzh11jyzqjvPLza42s9w4wrQqklD3rUIoc+q3m3TRiQJxahvNK5c2fWAswDcuOGrQ608I1Ig606DEkG+K18Cj0tkpIlTBfdFJ4MiHcDabWgn99qenOZo7IhNgj5EsZ2w9ys/QVA2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz/y7sCKD1JhIOfERw2Qw2Em/AnQ34nQIyfpXQmWoXA=;
 b=q9A9Qq3jyoUbRqOTZGfbg5k0Mkw0uKYeTR2+Rgg7emAhhIjvBdfR48aI3v5rI6I5CII+v7STlTzf82DMMFOnydlo2QcDFekj6prhVZf5FlKORn/UsSjOPLgLtC9gX8V3F6oK2N2PiI+U8Kzygr7eZKARlbjCq7xmVcy4I7nq/bq1XzBio37nYZjpki74boAHcZiHeo/MlbQM3lhu5CXAzrShKszSbCb3qMnbIslUHoKg6iNhO8WeJlcajGeFr7QFAuxHLGOV5xtgzN5SW3+lW/4AYXpwYlZbZPdTklZaty2WWMGj/Xr0F3ufi+U4NoSh6yNNhlT7gE3cQtjnHOPeTw==
Received: from MN2PR18MB3008.namprd18.prod.outlook.com (2603:10b6:208:10a::10)
 by LV8PR18MB6097.namprd18.prod.outlook.com (2603:10b6:408:228::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 19:45:17 +0000
Received: from MN2PR18MB3008.namprd18.prod.outlook.com
 ([fe80::e3f3:d819:62f8:9126]) by MN2PR18MB3008.namprd18.prod.outlook.com
 ([fe80::e3f3:d819:62f8:9126%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 19:45:16 +0000
From: Karthikeyan Mitran <kmitran@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fustini@kernel.org" <fustini@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "linusw@kernel.org" <linusw@kernel.org>, ALKML
	<linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Axiado Reviewers
	<linux-maintainer@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
	"robh@kernel.org" <robh@kernel.org>, Tzu-Hao Wei <twei@axiado.com>
Subject: Re: [PATCH v5] MAINTAINERS: Add Axiado reviewer and Maintainers
Thread-Topic: [PATCH v5] MAINTAINERS: Add Axiado reviewer and Maintainers
Thread-Index: AQHcwUMJMBDPWOWC/E+elErfDCD8oQ==
Date: Tue, 31 Mar 2026 19:45:16 +0000
Message-ID:
 <MN2PR18MB3008EA44A956EB90E5004072C953A@MN2PR18MB3008.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR18MB3008:EE_|LV8PR18MB6097:EE_
x-ms-office365-filtering-correlation-id: 1ecc369b-385f-4ff4-c06d-08de8f5e08b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 Sy9u4WMMqjScdJyIi+CVU0ZtNcastZEM0T+2/Qgd4usmWjp2VQKQvAS7PG9MEelUWZ2zf6Cz5H5uPKaZxZH23MoxsmFu1LbZDf+/12F7L/aNDIbtRn3ltyHqJ1qTPUkQwJ8ydSqIVtTM1ZSUbY6fn84K9Kekm2KNX8+elQZtlWv7+Kdrjs7KgDLMcouDq9L38o3T9t90D+Cu+Ni1e+2TReiwVMy0CQoPfMLUTE0esN60/CjOEdR7hZeJdvzFnQw8qIkvxX6pDEIeV3INdX2gGGE5R6Dd8arrCUgXxwJVh7SBsQx3lQTljwGsSoaQR5JZrhZkWfv0GplMyMJRqNqTNYYt9AwM0IXFnavfjk1cpjjHuuipC3HzOUtPAsXh40UarD+O/0Sohol37IEjsvvF5+zWDKW8bl8Nh6Jn4lciGASTwIyaBL7PrgL01NlEkA3x0lkK4k3gAMtqXQgGst5pfIhFOv3fZFvj4Pyu5109xopRFa3f12d7tPKobbKbqwJhUC8JJ6xm9T77oge7dPVmLEBMH3ihMpIW/akxsTeQxI+uLZN5y7c2gVWCDeweHNhSlBmXYIedlbX8tM/NZLxGg3crldsGyL+mVGvl4907UqiW5F28K3e3xTJ/6BUAV7zqiwiFhP3cIRWw7iz4dEkPUbOykcIl6mY1f60PuziD5WAJaxkV3y3E0gUANkDvmv+HA4nk++t2HSnV80zRfc9MhgXInM9/qUhzFvSm6l0aBp8nZbF6wDjWjytxrL9VxGDRFDtH96gtrFqXRD3k7I0ojltEom3ZF/Qj9iMO3XTqbk4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR18MB3008.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GI+hAVDMGclmw+iEpqd+GTeLr1dwxqNO2ulpgCijYx2tw7hn1w7zyJD+vm?=
 =?iso-8859-1?Q?+7Ql6fM7cOwk2ISl1wDRPH6JYdP6tEdllZpCKylWwodZN1bVenijdJdWq3?=
 =?iso-8859-1?Q?NGJ/7BkqiR0xVz9jfTQ3kpENZliJKXSMsceV9+t/rfqntMWjg/mAT/YUpI?=
 =?iso-8859-1?Q?TeR1cQ5MQABg3y3mtkzZ0Imv26pOQUjlbd9p4cYF2v62fbmW6pGST8Zvkq?=
 =?iso-8859-1?Q?qlejSqvBkcCeImoY2MvzKvqZbxTYoeja2bSgnOi2kcH7TjuBFvLzpV1tQE?=
 =?iso-8859-1?Q?+14ZIu8TSaG7s626oppnstyB43pGbAMRwDuScKZRXkuUv13slRiDWKV7y1?=
 =?iso-8859-1?Q?ONYDCHe+1kHFAsKJIxNITNMEVrMCnEb4n52Oi4ktCuhqC/d+Wt3ezNK+65?=
 =?iso-8859-1?Q?KdB6ClXZUCfz78BW8StPOA1EhJlDOy1l2tgpPV6xGUSycHBiDjHORw/L8s?=
 =?iso-8859-1?Q?ua67XqCwGodu8mpssKxWJXAx3lZZDh5ic++zmWd7ZsAeRsNO7tVEPebz5S?=
 =?iso-8859-1?Q?MHxQvZoaq7agwKkohHvbPJsrKfxqNKF7jScw+X+z2O6NN6d1qigXOsQ4MN?=
 =?iso-8859-1?Q?GlE1dIFuC4A/kte0UwPufwLGDUld3Ym5HQ3hl555yWFf9eUN+1IZzy9Rcb?=
 =?iso-8859-1?Q?RMYd43/qlKbCyeJDBlfmeFRkas3BuvnUtHoyB9T9VcS19/Yi/GEU3csO5S?=
 =?iso-8859-1?Q?1v5xAZD5/ghwQUWl6ckZVf8ldg0O2wWaSZOvav4xC+5kXOEN6YqH66uoqN?=
 =?iso-8859-1?Q?xdnZpAf15ujWNQ3D7Tt2RTBTiy/cDg6t1CkEHo+g9rQlFaDagCgr+HO2J7?=
 =?iso-8859-1?Q?eKnPbqBbjEgKfgspEW4263CotNkk+JnSUnimrcvfDcSGIQxFd9QnH1sKR8?=
 =?iso-8859-1?Q?tCeqj2i9HoS3To+VtVedpMHVNN48Mww4GBTi7GYBvJXLgf3ndFrElhK/mK?=
 =?iso-8859-1?Q?v1YEIm9BPoh7PMeSkSanNYGHHyl84+QLQdFg01ljxPDtlgruUhcrvIJeep?=
 =?iso-8859-1?Q?A4BZAMy9vvFF4QgJ5uJtTTvEzpQSFv0fE5vmuHU275ueGBz+MQKaZZH0rm?=
 =?iso-8859-1?Q?Ud03r6pvOFbwu2ySYy/TyaOI9CJ4oPwO+uDxMlLA94NuECTM3DypKZyplc?=
 =?iso-8859-1?Q?A98LDqJk0q4rK9cPovnWxy+bJ02UGju39I335u0WD32Z7Kw6dfyKJMjoLV?=
 =?iso-8859-1?Q?3PsKFSACCVKQWxd1CNSbHpR43rp2jhq2id3W8F5jJTO0tb2dykr/Rv3TVz?=
 =?iso-8859-1?Q?JIsjxC2QoXNxn6ecWXZBFG9jn250W8ymScs5FKRBYWVs7xaX/OwzrThVFF?=
 =?iso-8859-1?Q?YyI0m0qd3P2RdbGs1AqnmvBnWyzNR2Q4pskjhyKi+JamNuSan+1ag4ydq9?=
 =?iso-8859-1?Q?Lmcs8/khAvA5+mjYbyBa8LOSZRU2tlLoncz5rWrscQ976dhfO7GIUz7G6O?=
 =?iso-8859-1?Q?wf0bTOZShQqfbmlWnwHcx/cfNf3oAopHhGZx75SzdbenoKcdVFLu5KY6UY?=
 =?iso-8859-1?Q?pwITPvElFK1SgWnFoPp9+gzShxRnRzkq7zRk9z/MnbusuqMFX3/fMfSlbX?=
 =?iso-8859-1?Q?C8a9kHxX/4BA0PPpgBLMymoLZ8uL/27NCWriSMGFPnt2ROGYS3CDo9S2Qt?=
 =?iso-8859-1?Q?5MWPGEmP03dDzKHfg3BhEQYqorCtotOJTZ73D9cM11geJMguJLKSsxJOSG?=
 =?iso-8859-1?Q?P840gddAjE3AxT5vR0Uvy9QoYTAPSHNMpkwdWcnLozHtk39g+VFRKtxH5Z?=
 =?iso-8859-1?Q?raS88R7m54Jx9q4X9+678apHpHrBpILLzxe7NjXQ+yd+6W?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR18MB3008.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecc369b-385f-4ff4-c06d-08de8f5e08b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 19:45:16.8383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4fCYqt/SGe8y2ZGN2zvgz+P8f+hR0q8xMMJdyoBGoIz9NMqB7vJgSGglUr3wwwbRquUX8oBIb0v9hO0biMIXqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB6097

>On 26/03/2026 21:50, Karthikeyan Mitran wrote:=0A=
>> From: Prasad Bolisetty <pbolisetty@axiado.com>=0A=
>> =0A=
>> Adding 3 new maintainers Prasad,Tzu-Hao, and Karthikeyan=0A=
>> and adding a group reviewer entry for review coverage,=0A=
>> Removed previous maintainer as the previous maintainer moved from projec=
t=0A=
=0A=
>...=0A=
=0A=
>> ---=0A=
>>  MAINTAINERS | 5 ++++-=0A=
>>  1 file changed, 4 insertions(+), 1 deletion(-)=0A=
>> =0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index 55af015174a5..49f47e8c2ec3 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -2605,7 +2605,10 @@ F:	arch/arm/mach-aspeed/=0A=
>>  N:	aspeed=0A=
>>  =0A=
>>  ARM/AXIADO ARCHITECTURE=0A=
>> -M:	Harshit Shah <hshah@axiado.com>=0A=
>> +M:	Prasad Bolisetty <pbolisetty@axiado.com>=0A=
>> +M:	Tzu-Hao Wei <twei@axiado.com>=0A=
>> +M:	Karthikeyan Mitran <kmitran@axiado.com>=0A=
>> +R:	Axiado Reviewers <linux-maintainer@axiado.com>=0A=
=0A=
>How many entries do you need? You already have three, so who is in=0A=
>Axiado reviewers? And what is "review coverage" you mentioned in the=0A=
>commit msg.=0A=
Thanks for your review and time, the 3 Maintainers are actively responsible=
 for upstreaming and maintaining the code, the reviews are an group alias o=
f axiado members who catch review gaps internally before going out, we ackn=
owledge the internal structure does not map well with the upstream model. =
=0A=
=0A=
>I skimmed through https://lore.kernel.org/all/?q=3Df%3Aaxiado.com and I do=
=0A=
>not see reviews from any of these addresses, so it all looks like you=0A=
>add some corporate structure, because some managers want to see what is=0A=
>posted.=0A=
Our internal reviews happens to be off-list so far, given the concerns I am=
 fine in droping the reviewers <linux-maintainer@axiado.com>, will send v6 =
with just the 3 maintainers. =0A=
=0A=
Thanks,=0A=
Karthikeyan Mitran=
