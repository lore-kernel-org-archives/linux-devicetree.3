Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.97
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795611015;
	b=pSio+4WAUfb7TXT7GUB9Ge6WM6zyLXXQj5LLE2qpr6J9YSbArbOmZf/duvrO+2wWLdR6
	 NicfdYUEDSXoZ1ZIX4eZ9gA9UdaYpe09GfIw/CzykI98iBmkTZbkSe7HFMeeAsQDQkxWa
	 cYpfWE73iYmObEsK+zt94LtwpUwIkJx7/GaEZu25l7hA8w3YdVZA2OdzbIHGDayTNuKCN
	 jezpMBOafLeq7tgT56tytNBnd0Ab2RZXJGz8FkRKH0eqsM2vVTPZ0PDabRiwzkzBhk6/e
	 zHJ3V0ncwJXDviwSHJ9Z7ZbZtDweMOQyLRZGgzUdsrye1mKJknqfC4Pk4y+WpOyR8gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611015;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
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
	bh=L6W1kMZyqraaqOswc7n2AKogVPWMbm731DcOYVI/gWI=;
	b=ztUInGsbygbgS6I7xREaowtD9p+hbZZcGv7VqEZbtwIKihosXvtm0PdLLuwBweVlnFke
	 cqLaWIovqCLwLVLGNInfYaWnwhWOXhdPbc/2spZjvinTogASfT0gYMqQIqLX0fh98dYvr
	 kILQmCq4rj9U94EZw4+DHBRngNZSEVZRhLvZK32gcqQeQRr1jA8ZiSHP+eH5E/n1vDrVP
	 eyuBQ9/Qsh+pWNY6scp4l0prEkBcHOGQeThAxfx2nAN1DY6lcG62CsX4BiWGsFQgqaTw2
	 Kamt20LFTUrpitgL0DamGY9IizJ8Q5q4ADVxxGtO+wEmJ6UgDqqd3k8MYLjoLLt67Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.97
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022097.outbound.protection.outlook.com [52.101.126.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77899606A335
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77899606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRMgkPV8S/5iXmMHLSVnJ2xTHKR6eF9j4kA9NRZkyTVgJ7x4x5rVLqhtZaaKrcjemUle4kjIyeIEqSeTP+udnEQ0hgrxQ3w8IKJYZ0ZzKmEFXWMaTK44UZEclYSPQ8RluWNZJO3jYbdnED0ytY5Tgc5LD1fryjwH+VS1t7wy4vjfR7Okw/OwoqxpoVcbh6X3xp3k+hxdsN9C/0OHsJWtf84ORXWHuSSPBlvJ/GVh31Vh5D4F+1gQBGxzJxbNKBpTWaM4jQyP0mN6r2aAriLnaIQruKeZ0V7MjF9s7XtBVWVyBHar8ZqdixJLstGr+i6u5d6IjPd64baLyr1EpbUH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6W1kMZyqraaqOswc7n2AKogVPWMbm731DcOYVI/gWI=;
 b=ww3927CkWiUHU/BxscYMLRUBIrhPxPQJtwFm97SezZGdLZhekyf07PHYkgzWLAUjlXNgx/27wOCD2hng9CMXGMdsxDa2/3WLGZk/pJJDKivJLtfa9XcWwtM5LtcBWBU0M9EmP6MTgwT97o7Yk6V05DB3ekOvMO3DNfW9+CJsxhjyoLDTd3GqrOQ05sgmqKYsuNpMI+3JeQMBeQrydKCtSyxlm3eLxdnEr2kE30v7AHsJm3HIW8hJv18UzNHTkZTyG4MPc4VE/3qOW0PRc502qeOPHM4n/3dSGKgoamQeJ7wRYNkTyoRWDno13o5RqAubnJvE5bJHTe501u/skLAVLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from JH0SPRMB0074.apcprd06.prod.outlook.com (2603:1096:990:63::5) by
 KL1PR0601MB5776.apcprd06.prod.outlook.com with HTTP via P2P; Wed, 25 Nov 2026
 12:49:58 +0000
Received: from JH0SPRMB0074.apcprd06.prod.outlook.com
 ([fe80::d5a:16db:d97c:df7a]) by JH0SPRMB0074.apcprd06.prod.outlook.com
 ([fe80::d5a:16db:d97c:df7a%5]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 12:49:57 +0000
From: Luo Liu <Luo.Liu@cixtech.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
	<rfoss@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
	<jernej.skrabec@gmail.com>, "luca.ceresoli@bootlin.com"
	<luca.ceresoli@bootlin.com>, =?utf-8?B?V3V5aSBTaGVuICjmsojmrabkuYkp?=
	<wuyi.shen@cixtech.com>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjMgMy81XSBkcm0vYnJpZGdlOiB0cmlsaW5lYXI6?=
 =?utf-8?Q?_add_the_DPTX_DRM_bridge?=
Thread-Topic: [PATCH v3 3/5] drm/bridge: trilinear: add the DPTX DRM bridge
Thread-Index: AQHdfAuE4zUklGK5S0CK6GMABrjgLbc+fT4AgABAieA=
Date: Wed, 25 Nov 2026 12:49:57 +0000
Message-ID:
 <JH0SPRMB00741515FE4859AFCB8D22D7F5432@JH0SPRMB0074.apcprd06.prod.outlook.com>
References: <20261124120114.3273161-1-Luo.Liu@cixtech.com>
 <20261124120114.3273161-4-Luo.Liu@cixtech.com>
 <82168811-c141-445a-97d1-e5c1ee38e0f4@rock-chips.com>
In-Reply-To: <82168811-c141-445a-97d1-e5c1ee38e0f4@rock-chips.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-traffictypediagnostic: JH0SPRMB0074:EE_|KL1PR0601MB5776:EE_
x-ms-publictraffictype: Email
client-request-id: 3e7ca073-5c28-4bc1-a6a2-17db368d72d4
request-id: 76c53e67-425a-4b6f-aa41-08df4af29c91
x-ms-office365-filtering-correlation-id: 76c53e67-425a-4b6f-aa41-08df4af29c91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|23010399003|376014|18002099003|6133799003|22082099003|56012099006|4143699003|261028144727099003|261026140227099003|261021121427099003|261026121527099003|261102123227099003|261022105027099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 7Ee2cEHy3RHRel6WbXFSPCCXDekbOYal2SB+ZTs2Sbmmt7XKNEBd6Iu8w7jclGc7mJb2prMPLJ7YVFnMUHyI2G1AvqCzFXu9ZQw3QN8NXFVHLqbx+knmiFFRDRDOqgBM+3t6kGLSxMVcq1xd0ht04DQdPJ96cGVG2batAJCi1jqv0XKqFN92J0jnQKsL7t90KwOhrTRe0aMLAPOzE4tEYJ67sQLozFUyOMYNTcaCQAKQRAnFE7wZKHq8wBrgv2QKKKRqiGGxP+9x6i87O1pgLDopb8IE5B0BIUFQclAjg50bncRCIV/RsoaNI4F7AC0nT/kJYPQtQOrjYIXMULgcGeXIKkfR9WW2QR4p5tafCruTiiIloM9Ei/Ryc5Z/u0APocCVNGZigDV8vlZZrtU98v+qybfxJuuDfaPmG5oDBGABKM5uJz+ZOUPNyHy5pzKlMsoy0HUk3j8K1zxttPWF/aro5tWUhoLNUBfPIsQPJ8MBkVnoTfWTC9Yljzn7nubi2ZVo6FyY2REqNtnz/ThZ94J7s2v86wzI+1YKZj4jcig7W4PLeq0gLgkhNV7HpVuR7uQnULO7P/p+YDc13RM61uy9eRDsW2RdDpm1ZCzpymdATyaEBIrdre64JVI6oosrx9l2uRShUXvbl2Mc2F8XXZ3vZnD8ZpSe/24J96dFI24u4rVfrIskvubp0L/f0hJpwp5jNzek1x9Og+OH4EaWnA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(23010399003)(376014)(18002099003)(6133799003)(22082099003)(56012099006)(4143699003)(261028144727099003)(261026140227099003)(261021121427099003)(261026121527099003)(261102123227099003)(261022105027099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1lTYUo2b3B6TFRNaHNhRWdXOFB1VVE3S1M1anZVR2hxNzVka2FUcm5Sa1F1?=
 =?utf-8?B?Tjg1SU82TmNlRFNISjh5UlFncEk0YWJaYTQzbnFLbUhXaEVBdDczWjZxQnZr?=
 =?utf-8?B?aUVuUndSMUkzbHdkU0d3bmcra1RudER0VVA4cW5nWTZ6aVdwa3ovdGxyK3pv?=
 =?utf-8?B?QlM0eFVqWW1PMlRqbUxrUDlwdEZPSlZVSTM2akE5QzBmU0dQbmtySExoNUpM?=
 =?utf-8?B?aXMxR0hVbjdTNmlHV3h6cWpDSlVvK21PSjIzU0FnTDUyRmluQitXeEd5U2Y5?=
 =?utf-8?B?RDRQNlpYTDhzYXdqQVE4d1JpUFQ2cGtUZC81ajlqTk8yRms3OUgvNmttb2xS?=
 =?utf-8?B?Mm5qN0tEVjY5UTlESUJZT1pIUGZtQXlDWWtSVmFHNWYwSEVpTGNwM0duQkhF?=
 =?utf-8?B?VHBiNGk3dU1UNmVpSmUrRjJUOGgzdlRGUkVuMzhyUTliSmRTQnJmVjhlK21J?=
 =?utf-8?B?UEJzYnRUaTZ2RUltWWpPTk4wa3U3SnR2aFhVeTBXQlZ3aFc0OG9IanRUcGNS?=
 =?utf-8?B?MVpqd3lRNG9zeWlHVDc5RC85VVkvelJjRVFpVUlaN0Q0OHVySTRDcXYwcGtI?=
 =?utf-8?B?ZVU3NVh0TXZLVFc5VGtvMmpmazlEaXZnOFcrMi8xZk1hK3lQdGhudzBLMDRU?=
 =?utf-8?B?Sm5tcmY2RVg2UEV2aDUzaGgrcXpuU1FBUW1MNzFHVzFpUTB4bEYyT0JrMmhI?=
 =?utf-8?B?SjRuTGFJOW9GeVcxOWdZWlp4QkN3WVpHd1hVV29oZEtQeHhLTHJzWlBPOEhV?=
 =?utf-8?B?Skt2VGhrS3J1YXB4eUhWMUdtb3pvdHJyM1p3NVJUUEg2R0o5czRsTk5rdS9o?=
 =?utf-8?B?TFkzOElIMlRFVGluZ2hQN1dGYW5SRVRCRWc1a1NTRThZa2Nlc1hsa3kzQkVR?=
 =?utf-8?B?OFcyN3ZCQ2Z2UXM0bG9XeWo1d1gyNHcvNmZ1L0FNOEtwT0t3VFBjcVpDck9m?=
 =?utf-8?B?QkV0OVZWTndzTkhZK09yMWhCRDMrZmU1WllMUFlPZ1FCYjAvYktJZytjWFNx?=
 =?utf-8?B?ZTM2NFZnMVIyZU56K2orVkhaQkZHZWxaTUJ5NUtEY0FWOEhocWVsU0NWSUEw?=
 =?utf-8?B?YzNBRWt3MUd3cFpTTzlUTGpybnFjSnFTR2JmcFZJeVV5bExNV1ZNa0xPMzV4?=
 =?utf-8?B?RjhxWHBHamhFdnpEZFNGcUp5ZnJKQ1RNQUhJaUFQb3d4ZG5MYlIrTjAzN3d0?=
 =?utf-8?B?ODB1akZoenZLZU9HSVJSQURIMFhZZzRySHFOa0dndTN4a2krUi83bnF3eW8y?=
 =?utf-8?B?bS8vM2wvbTNBKyttNkxiZk40K09xR2JqUDlUcDFodjJVQ3ZmbjVIZHcwY1BY?=
 =?utf-8?B?UXR3ZjFweWgyYXhYNDAxUkM2cU56YThPeWdGRS9nYWZuQUs3WnNKRzZzWmhK?=
 =?utf-8?B?MHZHRlpIQ011Z2ptVE1jWXoxdHpGTHVQQ1JVb1VzUEtUN3NkQ1pxS3hpZnhN?=
 =?utf-8?B?aGRjZDdEM0t6RStVQlVUd3BWYXRhaVVLWVNuTlBmZ1ozS2tTQnJoTlNRVVpB?=
 =?utf-8?B?K3VWKzBFUDgvSkNNVjlNb0UxZ0RKRUFWNktzeGdrSjg0OW5MS0MrWm5xY25F?=
 =?utf-8?B?eWIrUzYvMUVYVXdEL2VsZnBQN1lrL1BXRFZrdlpnYVM3L3h4Q2pTUzRsZGxR?=
 =?utf-8?B?TGpWWUlRU3dtT3owL2NCWmZvcVNUeE5oVVFzTW16d1FWV0ZCMEgyV2ErUjdN?=
 =?utf-8?B?THJ5VW11ZHNtNW1Fc2EzMnNnMzdreUZ0VWw4cld6eHBocGNHbDVPYXZuRDF0?=
 =?utf-8?B?RzZrQyt0azZFMTBEUk9LZDhVU2taalVnYURhQTVpZ0NqRFUwRmZCZzVBVzAr?=
 =?utf-8?B?T1BqMHA0eFRrV2JHRVBaZkdkbEZGbmNzeVliTmRWWjBVVExjYk55a3VvaDNP?=
 =?utf-8?B?ZVJLbVdnN2VFRm5OeG1oMGJlc2E3QWtYa0w2eGs4NXVWZk0rbGxiRzYwK3Zw?=
 =?utf-8?B?MC9GNTZMdGdsNFd6bnowOGZ4a0ZVY0R5d1J5SWZYK0w0Tjc3MEtxRmJLQVRZ?=
 =?utf-8?B?SnNib2ZqM25DVlVPTXNBbFB6NW5wbVJ3TVNrdjNndU5XdWZqSHl5YUlXTTg0?=
 =?utf-8?B?Sk5kY2hvdXBvZHVDUi9jZU0yanpyQTZ2aHplRit6d2Z5eEQyb3FSMTF2amdQ?=
 =?utf-8?B?MldMRFQyVjY5dVFGUU5mWGVXMnQ4bEF1c3lzY2hOMlpPVHJ6aHFUMFhjTFk5?=
 =?utf-8?B?Wktnb2NDcm0yOE1aOVdxeVBISGFLZFpwbW1QVVZPb0hHU1lsMTdhM0Q2bWxJ?=
 =?utf-8?B?OTVMNzZEUmRXWVJJc0FDeDNpN2o2WXAreUpmZVhpWXd5bTFoTGYyMG5UWGVN?=
 =?utf-8?Q?yg35kOmklg/vY3m7/2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0SPRMB0074.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c53e67-425a-4b6f-aa41-08df4af29c91
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 12:49:57.8980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FLG5B4sbET4O7FZi3EydyQYLckzik5n+ePQkEVZx9C8LA4P/wIokoHWN4onn+GkTshIyxUCeU8zIkw5KeDfXPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5776

SGkgQ2hhb3lpLA0KDQoJVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciByZXZpZXcgYW5kIHN1
Z2dlc3Rpb25zLg0KDQo+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCj4g5Y+R5Lu25Lq6OiBDaGFv
eWkgQ2hlbiA8Y2hhb3lpLmNoZW5Acm9jay1jaGlwcy5jb20+DQo+IOWPkemAgeaXtumXtDogMjAy
NuW5tDEx5pyIMjXml6UgMTY6NTUNCj4g5pS25Lu25Lq6OiBMdW8gTGl1IDxMdW8uTGl1QGNpeHRl
Y2guY29tPg0KPiDmioTpgIE6IG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsgbXJp
cGFyZEBrZXJuZWwub3JnOw0KPiB0emltbWVybWFubkBzdXNlLmRlOyBhbmRyemVqLmhhamRhQGlu
dGVsLmNvbTsgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZzsNCj4gcmZvc3NAa2VybmVsLm9yZzsg
cm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5v
cmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb207DQo+IGpvbmFzQGt3
aWJvby5zZTsgamVybmVqLnNrcmFiZWNAZ21haWwuY29tOyBsdWNhLmNlcmVzb2xpQGJvb3RsaW4u
Y29tOyBXdXlpDQo+IFNoZW4gKOayiOatpuS5iSkgPHd1eWkuc2hlbkBjaXh0ZWNoLmNvbT47IGNp
eC1rZXJuZWwtdXBzdHJlYW0NCj4gPGNpeC1rZXJuZWwtdXBzdHJlYW1AY2l4dGVjaC5jb20+DQo+
IOS4u+mimDogUmU6IFtQQVRDSCB2MyAzLzVdIGRybS9icmlkZ2U6IHRyaWxpbmVhcjogYWRkIHRo
ZSBEUFRYIERSTSBicmlkZ2UNCj4gDQo+IFtTb21lIHBlb3BsZSB3aG8gcmVjZWl2ZWQgdGhpcyBt
ZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tDQo+IGNoYW95aS5jaGVuQHJvY2stY2hp
cHMuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQNCj4gaHR0cHM6Ly9ha2EubXMv
TGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IEVYVEVSTkFMIEVNQUlMDQo+
IA0KPiBIaSwNCj4gDQo+IE9uIDExLzI0LzIwMjYgODowMSBQTSwgTHVvIExpdSB3cm90ZToNCj4g
PiBBZGQgdGhlIERSTSBicmlkZ2UgdGhhdCBleHBvc2VzIHRoZSB0cmFuc21pdHRlciB0byBLTVM6
IGNvbm5lY3Rvcg0KPiA+IGRldGVjdGlvbiwgRURJRCBtb2RlIGVudW1lcmF0aW9uIHdpdGggYSBk
b3duc3RyZWFtIHRpbWluZyBmYWxsYmFjaywNCj4gPiB2YWxpZGF0aW9uIG9mIGEgbW9kZSBhZ2Fp
bnN0IHRoZSBzaW5rIGxpbmsgY2FwYWJpbGl0aWVzLCBhbmQgdGhlDQo+ID4gYXRvbWljIGVuYWJs
ZSBhbmQgZGlzYWJsZSBwYXRocy4NCj4gPg0KPiA+IFRoZSBicmlkZ2UgaXMgbWVhbnQgdG8gYmUg
YXR0YWNoZWQgd2l0aA0KPiA+IERSTV9CUklER0VfQVRUQUNIX05PX0NPTk5FQ1RPUjsgdGhlIGNv
bm5lY3RvciBpcyBjcmVhdGVkIGJ5DQo+ID4gZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdCgpIGZy
b20gdGhlIGJyaWRnZSBvcGVyYXRpb25zLCBzbyB0aGUgZHJpdmVyDQo+ID4gb25seSBpbXBsZW1l
bnRzIHRoZSBicmlkZ2Ugc2lkZSBhbmQgbmV2ZXIgY3JlYXRlcyBhIGNvbm5lY3RvciBvZiBpdHMg
b3duLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTHVvIExpdSA8THVvLkxpdUBjaXh0ZWNoLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90cmlsaW5lYXIvZHB0eF9k
cm0uYyB8IDYyMw0KPiA+ICsrKysrKysrKysrKysrKysrKysrICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RyaWxpbmVhci9kcHR4X2RybS5oIHwNCj4gPiAxNyArDQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgNjQwIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdHJpbGluZWFyL2RwdHhfZHJtLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdHJpbGluZWFyL2RwdHhfZHJtLmgNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RyaWxpbmVhci9kcHR4X2RybS5jDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RyaWxpbmVhci9kcHR4X2RybS5jDQo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmZkZTM0YmFjMTIzMA0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RyaWxp
bmVhci9kcHR4X2RybS5jDQo+ID4gQEAgLTAsMCArMSw2MjMgQEANCj4gPiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+ICsvKg0KPiA+ICsgKiBEaXNwbGF5UG9y
dCBEUk0gYnJpZGdlIGhlbHBlcnMNCj4gPiArICoNCj4gPiArICogQ29weXJpZ2h0IDIwMjYgQ2l4
IFRlY2hub2xvZ3kgR3JvdXAgQ28uLCBMdGQuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2luY2x1
ZGUgPGxpbnV4L2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9tYXRoNjQuaD4NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxkcm0vZHJt
X2F0b21pYy5oPg0KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmg+
ICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPg0KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9lZGlk
Lmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAiZHB0eC5oIg0KPiANCj4gVGhpcyBmaWxlIGRvZXMg
bm90IGFwcGVhciB1bnRpbCBwYXRjaCA0Lg0KDQoNClllcywgSSB3aWxsIGFkanVzdCBwYXRjaCAz
IHRvIGluY2x1ZGUgdGhlIGRwdHguaCBhbmQgdHJpbGluZWFyX2RwLmggaGVhZGVycw0KDQoNCj4g
DQo+ID4gKyNpbmNsdWRlICJkcHR4X2RybS5oIg0KPiA+ICsNCj4gPiArI2RlZmluZSBEUFRYX01J
Tl9IX0JBQ0tQT1JDSCAxMg0KPiA+ICsjZGVmaW5lIERQVFhfTUlOX0JQUCAgICAgICAgICg2ICog
MykNCj4gPiArDQo+IA0KPiANCj4gLS0NCj4gQmVzdCwNCj4gQ2hhb3lpDQoNCg==
