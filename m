Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6E73BB677;
	Fri,  5 Jun 2026 02:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780626714; cv=fail; b=TCq5hDoVsoskZNve4WNvGG+rAyEtnaGzwywIRVK8210Vt4/wquIUR/r+pr3bGlv7aanGZ6BgBWA5CEOGr5vYOzT5Wt3DDi/zdc0vrvXXPmxBZnkmWERovCpEot0+C/XA2qiS1AoK685vWJt08NG73+sirXUmjLy4XoQsuBr+oq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780626714; c=relaxed/simple;
	bh=QJ2f3tMpRiqt7xZso01zcNmfGdwp7sZDYQTLyg2Q7e4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kOj/W9o0A+JXOS/t75e+X/FIHAMNwcGOP+PiHDgHQ028PENOFZzEyDIcsHTh59Ba75c4Qq6C2NST7Zf4eLCN1m+eUVjlGS6GiuMOA7SzNnE+Ux/dZf9BUqbnQXz9uksvcGk4dXPMf8M9iqAft0fjnb9BJp0vqZIU4khcF4pQ9G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=g+5XseZl; arc=fail smtp.client-ip=40.107.208.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="g+5XseZl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEyXvyJrnAXSxTxII/Q18R8WeGA6ybfVBJ0Idg0A74atBY3Rf9P0K5bRvvWXPc/XsphhFTn8CGTLz0czPxASP0jAVt1O3Vlrie7dGXij6TqVuGP3Hbb5sWfqeMK/LufSqsNa135NoUMwmxgxiBXkwcua4OAEPe5bxEa90u4uGXVAx90+SpzlHhuWMEkGIxrHrqmzKQ9rOMBBCONoioW4BOOCBSzFstCde/xRJLRQsuibgq1ruSZ7vqVCbUQKqz1b8+fHbhNhbUrYbJ/tMO8raEhSXrQWps17YFkIkqfbbuAfKtOOdrTE4d1RVyz80gGZFwzM7Q1RyoReAidl3NCtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ2f3tMpRiqt7xZso01zcNmfGdwp7sZDYQTLyg2Q7e4=;
 b=na3CnfePwC87pIkAI63H0Cx0KMwz4IDMxOptk1YjYkzbnpisv//XXoFJdOMllqdtJP6VKy65SShz5A0toI1vPyPeIjkmn6pK8HLWDi/+7O4EbaM9gyzLkQp7ULMUPJSpoVOTJvae6h9LiGB5jD4OFJ770z5ueWpM9J/8ER5fAE0BY5KCkr2wsl5ZT5DIn/Yn4ostJunHuEIL9Px3XBVmT1XgKyEMuilJWaD18lZzhadU/AabT0guSwqje+LjrRHg30TnXLQ6XrSIHcoiCqq7EUtfuCP97lXWTzCs23yDwsjT5F0WOEFodp6TZdjaJA78yLNMAbCglknystx9HC0NrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ2f3tMpRiqt7xZso01zcNmfGdwp7sZDYQTLyg2Q7e4=;
 b=g+5XseZltpaZlFQo0XL0mrSS8W6Bh2+LaOSYumUENwE8n9lGkrkkqtBRIoNppXqlPBVG1IoyY9Rn+o5di1lJNu/LOCiAg9J4xsHZOIL7nOYM3WdsWomUaJdlHDl0ZtgXf5HFu6nIQGIVmuuZCQXmUnHYWoL5TazD4FEnmKnErBb0FMZ/1sM9ujgrpJ8lDZ6DieucfkI7x/ROQdknpgGWp8pR0UJtHPxw5A0I0FlxZGYl2ZHUhD4nkieQbVV8wnUxJzT2w7YwaqCYUZxvFM5kOnXGkUOLGXYgwiv0o//QZ5pk7zqEjMiEwdGThSYMfBLqVKcPmkN2SXFJ7e/zYgVpew==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by DS3PR03MB989168.namprd03.prod.outlook.com (2603:10b6:8:39b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 02:31:45 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 02:31:45 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "dinguyen@kernel.org"
	<dinguyen@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: socfpga: Enable the SMMU for SoCFPGA
 device trees
Thread-Topic: [PATCH v2 1/2] arm64: dts: socfpga: Enable the SMMU for SoCFPGA
 device trees
Thread-Index:
 AQHc5EDdBDlckWQyTUeGG+SOvBoa6LYmgX+AgAfXTgCAAAV+AIAADJgAgAALuQCAAOfKAA==
Date: Fri, 5 Jun 2026 02:31:45 +0000
Message-ID: <693c2187-3f49-40eb-b8ad-b7af9b249ada@altera.com>
References:
 <20260515080014.6260-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260515080014.6260-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <c1aad046-fef0-4c2a-9e51-59e643e7966d@kernel.org>
 <47a7cb44-416b-4e48-a7f2-b6b69b71896a@altera.com>
 <62e4809b-078b-432f-a3b1-59559a4aa77f@kernel.org>
 <e168eefe-7a06-4da4-833f-a679b2d29395@altera.com>
 <e2c03291-ec94-41e6-8384-34524ce8a525@kernel.org>
In-Reply-To: <e2c03291-ec94-41e6-8384-34524ce8a525@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|DS3PR03MB989168:EE_
x-ms-office365-filtering-correlation-id: 055ddd02-0f8d-453f-abcc-08dec2aa966d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|11063799006|4143699003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 yobYlsqamUZsDHuJPurIRteRQ8BZ0rG/FuR6MtlLK0poN+uITm/AvcexZHuUyfWuSkRIfPDj3roYrUPFaJIPz7FGmH4wh6dhsx3C3Q4RUy94vC3Xt+TJHyXR3v0WHCB6CU/T0ztymzAmK5xVnQnQiehk0Y6aDgStZ2WGLa2qPG00IVrk1JX6REQKEDd0xum68oSBnXC4Aqu4JA6aCAaqptaZ5yULpO1U5e0VBMYydm3/vT2ZVqc8sMGtJqBSbWvKefdqfXKJUURjCe+COlvFO0RQfXShC1Bxk8qvbhpqmifsAmh5KSCtLEranLq57ifHgY2B4c73XtpCI/gv2yQyYcMdhpwTqnQodLuRi5WQIbT2yYbCCIM+DgzTn+0cDYSmfxzMqAbNQLj2D0tsDTPs5MEDY4HDzMEv8VPJEwMSlA/p8BQJua8flhgaJ3nlh6uMkNK+gg0XrCbj31jgqG/McQllqlE+pJKySXncXzUKQx12HGXkkLxqpViomAWUj7y/gkN8QO20cdLzI7oPUrbRj1ROLBrvcBFZSyTTYQFQSBUvsTRaP1mFasQF8lWUG2uDSuox+oTrQway3xdlymXz/YcdweY7jevMnzpcoS0ygHes31tch35SvnY8Kr40JlrNi40aGDHqjGjfMj9KTFAj19KOC7B2Hum0SEamlShNct2/CaEUvx55JKrdPnHZeVryWbrsY55GKVBH7o+AJeHmUpHr4F2ymU20AiI5ejtU8I0jqQMnCSDXpLe3H9ws85yG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zk9uclRHTExMd1Jyd0dMeHllYnlFMTNoTHh0cldNUXlDSkljUmIrejJTY0lo?=
 =?utf-8?B?M3VnS0dhbE1xRndyNVhtejd6ZHpsWHVlWktEMmN3ekJoeWErOWMyS1JNSDNB?=
 =?utf-8?B?YmdMV1dJelRmS2VXdVpRMEltY2gvU3RSUWd5SS9wNTBraStXaitDN0pzNGVP?=
 =?utf-8?B?RzYxMHUxbVRUQkVNWGlYSlM0NVF4M3FBMG5KbFlINkpncWIxUnJJWG1HU3do?=
 =?utf-8?B?aDBrRytIWUlPTHpSZ2JaVWdEcklnRnBLY3hrQzFlRk9kVFRhQVBIL25MUjFJ?=
 =?utf-8?B?TW9xV0RFK1RvSlZRWlZqQVgzMVRwNUxWakNwL2l0OHRCRGROVyttWXNSNmM3?=
 =?utf-8?B?QXQ4ek9WQlhWS0RGOU1zTmpXRmVBcjlOelpISXpxOWE2bmc1dEMrMzNQR09D?=
 =?utf-8?B?OFBhdXQ4OW92aEFIR3AvLzZkZWN2RVFrcnQvMkxRelROOTBtdTFGaXkvTG5n?=
 =?utf-8?B?T0E4aGNtUVdJMjZoRWpsTDZ2UkF5elZVeU9YaG4xMkw5aEpreHAyUEZ6cFFL?=
 =?utf-8?B?Sm5jTXlvQmJJVEVMWHBSZ000ZkZVdndyQnYrY3FqejdFVkJFQVhzeVNxTnlm?=
 =?utf-8?B?WUp6eUMzWFh4eWVsajd6Z2NDREFjSmVHWWFLUGpvRU9mSEN3U3dhcXZZdHFH?=
 =?utf-8?B?WDRmcWxDbk1jSjIzS2tZV1l5aEN5dSthMU9qWHpTTGROUzVxUkUvV1l1VmpQ?=
 =?utf-8?B?M3pKc0F6Nm1iQ3pxd1FHbk5IVHV0OXZCVm5pU1E3L2p4VEpKcmp0cm1OWW9a?=
 =?utf-8?B?NE5Ya25GNWJmb0N2L29lZUkvekNlL3IyVjJ1eXJ3Qy9FeDFUNVdIdUNzSCt1?=
 =?utf-8?B?VE1TRzlIM2sremEzK1V3VFhObHdxYmFQVnJZSm9paHVQSmhvbGxGdXlaR2kx?=
 =?utf-8?B?MWlIb29pbER6Q0QwMXVKODlKbUduOUsrZ0dPWi9COGRmM05WZ1VmcGFDMFBn?=
 =?utf-8?B?R0tOQzgwSUZEVXdkTjFaamMwY3lST2p4Z3QyWDRWVkxMbG5DNk9pam84SXFu?=
 =?utf-8?B?ZzdQV00xb0FzVERCMThtbllVUnpXcEdHZHpvbGxCd0tTTGI4a1l3M3lITVFS?=
 =?utf-8?B?aXNOTXJCMDlHdkNCczV6TFM4S05TYzhINDdIYW1UV1F1VTJkZGtWbzROeFlz?=
 =?utf-8?B?TTZ3WVVrNEJJSkZYdm1QTUc3UnFkRCtBWVhUaHNxREs3M3Y1SXpHR0M2RjB5?=
 =?utf-8?B?QkdXMGc0S1dKQmk5cmxva25lc0FjY0kyWkVvWHI2RzlrUDE3WnJRQXEzd2Nz?=
 =?utf-8?B?TFpWN3FIOVp5b3h3T1duNkJySUFtQ3h3R0hCOXR1djltbm5VTzR2dHpEblUw?=
 =?utf-8?B?Q0d3K25hb1gwTUVGVWdOaWgxS0J5WDRIZ2UxSldJMnhyNlRSQ3ZFajg5aW5n?=
 =?utf-8?B?ZXlEWVRsb3R5TWdwUW9ua2hMSXBwQVFqelZUQ0k3d1AwVStRdUdlcGh2azQx?=
 =?utf-8?B?VHRSWFRjY2dOVGtzS3RlR2ZRNHRadUV5VXgvWDVNdlB5aExMbThtNVI4cGRq?=
 =?utf-8?B?U3FJaDVDTjR2T0JTekowZ2JxVy9YVXVnMmdtQnljUG1jajNGSmhnQ1lJdUp3?=
 =?utf-8?B?QXJ5cm1FblNuZFhBMWcvK1VmNlJzS1B6eTdTTXowbHVJa1Z1dC9CcTdSZ0c5?=
 =?utf-8?B?QnVoTTdQK3lHZ1FUZWkwWVlFeE9mMlhRMVVQbDZvU0c2anp0OGoxSXBWK2Ey?=
 =?utf-8?B?OXJacHdMWXIvYTZxS0hWUWdPWkU2dWlkNm5peHhkWVRVTTRoMGRMSTFRTlR2?=
 =?utf-8?B?dVJuZWNvNndiMS85Z1BzNnh0azNpWG5ZWDZOMVZ0ZFMxeEQxcDVlSWRnNmtz?=
 =?utf-8?B?cXJuZDZwVitwZnpHdHJzcWJBeWpRWnloV09pajh5YjlvVmpQVlBEWWc2blpM?=
 =?utf-8?B?RVg2MVhHSVJVTTB0dEVUWWV3czBORS94TDVWZjIvdGQ0bHdSRHBHUmYzTHpZ?=
 =?utf-8?B?VDQwR2xGQWhYd3Y3ZHR3dHNRVUgzR1U1d3RsTEFBQkJOVlZQTFBNVTYya21p?=
 =?utf-8?B?czBRQml4d21BNE5OcjJ2T1A3WldIY3I0ZkpsRTZqL21Bb2VWZEdLcnRjZzEx?=
 =?utf-8?B?OSt2WW9mK2U5a2pPMHFzWjFSS2FsbUFCUVMxUzVYZW5kTjRBSUdWUlFTUHBm?=
 =?utf-8?B?VThZenZtVkxIUENFTkhIVDZFakh1c29tR0tMSHVjdkN4OFJVaW1WZFFDOXZx?=
 =?utf-8?B?T1Jod1pFeFdJQ2tUU2paZVJSbGhqYklKU1d6a3pOdEdCTUpMVE9NdzJYSWZG?=
 =?utf-8?B?K0NiNklPWkhuc0VXYm5sOGovdDRMSmlTV3lzMHlkblQ4MnFzUUJ6bC9icGpR?=
 =?utf-8?B?WEZENytxdkVnMFJQVjUyZnNaMU5sbHRXNzc5cHpGQm8wOW5sV3BQSVVhK3VC?=
 =?utf-8?Q?gHihpdVpQslQ9m4rYihw2yw8MXnbJ5caOTjtdO4H6ubRo?=
x-ms-exchange-antispam-messagedata-1: IU0F2RK+e9p+jw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA5CBD9ACFF38C4890B6A78B78771A44@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 055ddd02-0f8d-453f-abcc-08dec2aa966d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 02:31:45.6950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMVEBUV7+CnMyQ/PKYVz5PzxYg5p5tNxskyWcLKND9Dhj4aXOSdHPLFLnpVjVvXu1xH7xXC0R24/lK97ht+x6/+Va4mZmwgptz9cmkmFakwbeWXeWYdG3aGzh4IkVV7pswndXEs9OKh5RSlkRMNUSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989168

T24gNC82LzIwMjYgODo0MiBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMDQv
MDYvMjAyNiAxNDowMCwgTmF6bGUgQXNtYWRlLCBNdWhhbW1hZCBOYXppbSBBbWlydWwgd3JvdGU6
DQo+PiBPbiA0LzYvMjAyNiA3OjE1IHBtLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NS5k
dHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC9zb2NmcGdhX2FnaWxleDUuZHRzaQ0KPj4+
IGluZGV4IGIwNmM2ZDVkNjBlZS4uNjRmMzczOWEwYzMzIDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXg1LmR0c2kNCj4+PiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NS5kdHNpDQo+Pj4gQEAgLTM4NSw3
ICszODUsNyBAQCBzbW11OiBpb21tdUAxNjAwMDAwMCB7DQo+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJldmVudHEiLCAiZ2Vycm9yIiwgInByaXEiOw0KPj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICBkbWEtY29oZXJlbnQ7DQo+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICNpb21tdS1jZWxscyA9IDwxPjsNCj4+PiAtICAgICAgICAgICAgICAgICAg
ICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4+PiArICAgICAgICAgICAgICAgICAgICAgc3RhdHVz
ID0gIm9rYXkiOw0KPj4gSGkgS3J6eXN6dG9mLA0KPj4NCj4+IFRoZSBzbW11OiBpb21tdUAxNjAw
MDAwMCBub2RlIGluIHNvY2ZwZ2FfYWdpbGV4NS5kdHNpIGlzIGRlZmluZWQgd2l0aA0KPiANCj4g
V2hpY2ggZmlsZSBhcmUgd2UgZGlzY3Vzc2luZyBoZXJlPyBzb2NmcGdhX2FnaWxleDUuZHRzaS4g
VGhlbiB3aHkgZG8geW91DQo+IHJlZmVyIHRvIHRoZSBzYW1lIGZpbGU/DQo+IA0KPj4gc3RhdHVz
ID0gImRpc2FibGVkIiBhcyB0aGUgZGVmYXVsdC4gSXQgd2FzIG5vdCBlbmFibGVkIGR1cmluZyB0
aGUNCj4+IGluaXRpYWwgQWdpbGV4NSBicmluZy11cC4NCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IEtyenlzenRvZg0KSGkgS3J6eXN6dG9mLA0KDQpBcG9sb2dpZXMgZm9yIHRoZSBjb25mdXNp
b24uIEkgd2FzIHJlZmVycmluZyB0byBzb2NmcGdhX2FnaWxleDUuZHRzaSANCml0c2VsZiwgYW5k
IEkgYmVsaWV2ZSB0aGF0IGlzIHdoYXQgeW91IG1lYW50IGFzIHdlbGwg4oCUIHdlIHNob3VsZCBz
aW1wbHkgDQpyZW1vdmUgdGhlIHN0YXR1cyA9ICJkaXNhYmxlZCIgbGluZSBvbmx5LCBzaW5jZSB0
aGUgZGVmYXVsdCBzdGF0dXMgaXMgDQoib2theSIgd2hlbiBub3Qgc3BlY2lmaWVkLg0KDQpCUiwN
Ck5hemltDQo=
