Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.115
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795071467;
	b=RjCwxa/9Es4y7h6Kqi7xjP3y0SKNNH3IxqijippborhhONbmqDwsnhPPD8hp5ICbIVfr
	 HysuE+qfzOLQt8p3m6ioVAaRjf+W1DFWbAz8UpqafIZO638HjUohq2bXeHN36rxRrM5Cg
	 jtO3XQM5wJ5cb2e8l80l26WT8j+rN6AzWYQCbKJK0D6ugvlRBT7lYUI+SKd0Dht/QYWzF
	 QKy4+26k/tz764xjHjoBz20nnPU2O2RxLxoMnkV/xvLujMbG+vYG06kVMrenLWcOAtwc4
	 5LxYDjiteZkREQ6RgYoAyu8QZwqe4pWRfPVR5rdW1q1WWLcOd7O7Tj+med+YIaNP0XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071467;
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
	bh=WyVwPfDejDFWuidyoQNi2jZcXNTEw9bByVD/CXWfQqE=;
	b=d+M1hCDc2UbGO8fVi+ZHVIeb1X0QQx1Pxcl/z3Uuc10FJJa7CJn/YVSe264V1kSGQIsE
	 0AzaLDQgGnpW0TzRKD4or1iSQj33/k3VYzSeKrYlINqvdXObvUrj0rKxiNGQ3WobNGu0z
	 l0os6ILpBvlAFi7+dk4WwmEE1cBVES32rs1UvSOYEPJ1qAJZKsktSHEWetPVfpnlP7i/7
	 PTU/35nJteUsOC6xGj7vteNqrYD5UsAb+FNGr0DH6WuMtAtIpli7x9ogKQZ17kfankBwu
	 5XHH/Uj8bTK0ZGpLjEfzpcwSkiNNmgqjxa+65N92M0VOAlM8eS4ZGKwzmJ7YqTqAY+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=atlr-engineering.com;
	spf=pass smtp.mailfrom=atlr-engineering.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.115
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023115.outbound.protection.outlook.com [52.101.83.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2AC606A320;
	Thu, 19 Nov 2026 06:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C2AC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=atlr-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atlr-engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDC8TCmzAdHFCCaNk8uSQZIIDholm+Pv3a5ks8/w/v+tKh14pZM6eoL7zQ9uyjsdrHmUsM7sW3nKYlTHXAxu/JSqJ9PFRqrXyXcLqb2162LuA5+a0b/1Q1DsvFE8JXbf5pGLha1KlkKKhee2FcrVCGRFPWPihuRk9I4NSZvOBRafuZEbeNw+fW6TqZNfJ3f3wzTC0XyjXAGSX8LJtmEMgIgnTvxD8EtQcqHU+qliyME1X0l2FKt7G+GcT84Nh/DePX8R83bTL5HN49z6SR9Uc2ptivO9i/HU1i060PoATLXpasU3OGZfO5zVkbFTqh33kE4XOYd7p2KxQT7F02pjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyVwPfDejDFWuidyoQNi2jZcXNTEw9bByVD/CXWfQqE=;
 b=spZdq0bZsn9I0RQQKBRwZX+eu+eE8I/pWXJ2f5tMOqOPR6pnF2nFpjI4oGU4UgkC835NnhSME9BMLTo96iEpcKNuRf7VGjf9D615zjnprp8UfgISA3+ImPo0ybnQajRP2cUthHQwVk4See8AhFL/aRYtNfSVG+k3gqjpOdUHKEEZVqUSTdjWXEb/2eGvaDTfX34O/5WO+RZH7/3Ufn1CgNTUz1BInKu8amIw06v/MQoeIB4mMmFdAYDuSlce5At2VM6160I8SRMQip58z2UAcZ/Y11fduwZvWoc8TlbsPCVTqu/64E2zmCYtAwviccDBOMKWZfVgADpO+N14SF3Xhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atlr-engineering.com; dmarc=pass action=none
 header.from=atlr-engineering.com; dkim=pass header.d=atlr-engineering.com;
 arc=none
Received: from DB7PR06MB5324.eurprd06.prod.outlook.com (2603:10a6:10:73::22)
 by AS8PR06MB8364.eurprd06.prod.outlook.com (2603:10a6:20b:447::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 06:57:43 +0000
Received: from DB7PR06MB5324.eurprd06.prod.outlook.com
 ([fe80::b923:2ab6:f430:9f47]) by DB7PR06MB5324.eurprd06.prod.outlook.com
 ([fe80::b923:2ab6:f430:9f47%2]) with mapi id 15.21.0615.012; Thu, 19 Nov 2026
 06:57:42 +0000
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
Subject: RE: [PATCH 3/3] wifi: wcn36xx: Stop waiting on a dead firmware during
 remove
Thread-Topic: [PATCH 3/3] wifi: wcn36xx: Stop waiting on a dead firmware
 during remove
Thread-Index: AQHdd21AT1FtaTAJ2U2YCFo/Ns4s8Lc0SBIAgACs40I=
Date: Thu, 19 Nov 2026 06:57:41 +0000
Message-ID:
 <DB7PR06MB5324F8485DD884C2792E4E3685792@DB7PR06MB5324.eurprd06.prod.outlook.com>
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
 <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
 <CAFEp6-1OnG4B_D59fW4WJeTOXAs-Jm-0Qg+yqwzM3j6tvya7ug@mail.gmail.com>
In-Reply-To:
 <CAFEp6-1OnG4B_D59fW4WJeTOXAs-Jm-0Qg+yqwzM3j6tvya7ug@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atlr-engineering.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR06MB5324:EE_|AS8PR06MB8364:EE_
x-ms-office365-filtering-correlation-id: a05c9a2b-f004-4e6b-6668-08df460a6899
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|10070799003|22082099003|18002099003|3023799007|4143699003|56012099006|261102123227099003|261026121527099003|261021121427099003|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 C9EL+xqpdoHXowPkpUi7Igp/lHMuY+9AIFWDAo22LLTUuPhLwzSAGU3MT8xhTTzbGIcZbLMuJMelhoFEIv9m3aU3jhWV5fvTNUSbWIqQVhJZol5nuZzH/GVKTptHhy3dnUY1F2IJ8ag8x7oNwymqAtz8San4VnH6tUGP/yRhxBz4yoA/0ElhmVR1P6oYM5ao9J4nI9585tk5GwvjRcKq9LP5jr5Bv45VfUBGN0znDlxhF3OK9Vje+2VTNKnoNVYDKJk+iIxWP94xTtxwzk75RwIteaIC8pw+GQ8PORJOdwfjrYpC3p8yRCmjIp04ltkj65EoB7ysRP+LdO7XwfPlhKv3NVNxwIDXwPqnuQkje9mIkH3ngdx248kqqkkafzBvpXJjjuTk//UUDDhDAa+HmQDlngAcvO/6InVAgjSQkLu5vlxeqHt8EGyHqua9U8aDwNc+jaUelSe6ldZGyhX5p0HlBhDgwTARtbbgxO5hCvbZ1bqq/Fcd8i1UzFwOqWVLNMzDR8BldAjFtHFUSCLewXVK+3DrVh9fkEO0ChDejBM5I6fAXPu77Gt79IaxkhlQ5gZrtRR9FgrcT49ADskAGfmAlONpKH0knf66gAzN66ThWQC6sZsb8XqG3HjkMH1p0aJ3CjQuI+H7KzH0WlI4B7igNp1H9w+oMOlgJoQ/ZdnxKW6mDmKXVIx8ItD7CNh6wCmqzCgU1kntkY8qdpfkS4YjcYrUKJ/Orp/toLVnYm8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR06MB5324.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(10070799003)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(261102123227099003)(261026121527099003)(261021121427099003)(261022075727099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TfYBNUDSShTHPe4sFc6sWLktbvn3x4nR772ABYLyi9HGcudI/kuTMCQoo/?=
 =?iso-8859-1?Q?fUiM/JShs4Euf0Ede5pfH+6c1JHxoKqgTVEJoPToePaVt7zEKPwv84mEnb?=
 =?iso-8859-1?Q?jzczy4sLoGqitl9NxIFENxhOXwd9cv7bZwW/xFPfv5iKjKPc6J0ChszCtJ?=
 =?iso-8859-1?Q?5VzEPQ6VNUOg81o/1aAPrJbEnEKO4eska07NZCdCu1Jn76uhfFBH1DqPjO?=
 =?iso-8859-1?Q?K7HN5VhPu0qThwhoXAzH998SvNYxw74yodHEGCqzLkq/rT64HJUUqOj4Pn?=
 =?iso-8859-1?Q?XvBJKnKBCaOKQ8mrUDE4Gvr3j8MrhtvsC2x3tcPylhjwDXJEbRgDIEBjJK?=
 =?iso-8859-1?Q?jZUeVR4BlugWtrtaBqTc8lnqZyiBoh9SSr0/8geojW7VfUQN3qQchy7UeQ?=
 =?iso-8859-1?Q?w4qD/KGVUE6No7zNLT1+Bo9n0xlYX91nAw3wsh08m3zYqVFfxYRuWpYhez?=
 =?iso-8859-1?Q?A39cnZgPLU9jYfFWdpxUNVIRsYw1OhwAUhqAz8yRzJ0h5MFQye54P57QGG?=
 =?iso-8859-1?Q?LiLmPzEMMHl3od2xPUjjc2/isKGKsSENy79Y73ir1TEviF2aYiTEPBpKA4?=
 =?iso-8859-1?Q?tWtcNW/v2bTiZPoyw0VYP2j9XLDgyQ3JkmeMj9iiUAUBkGNvly3M4J7HgF?=
 =?iso-8859-1?Q?+/F8EoIOtB8aDx1O3xabsvtFB8b121MAxD299sdyoTKlZqDtp0wEydf2cJ?=
 =?iso-8859-1?Q?vpKfssjvD/fqlF1v4KQsfegiFfUpp88QOGYvS3/mzvkaTGyDpG63ODmzAx?=
 =?iso-8859-1?Q?kk/CQf+KLf72ipB2CiLI9Wiv9zXuZa3kmW4UzFSbNM//8u8NTKArCLXee8?=
 =?iso-8859-1?Q?5/wdlni5T4mXHzWPDGIihXeFCXBfgQFe6p+PKfDWjeGskjdemr7XMYoz/C?=
 =?iso-8859-1?Q?+wygNxXZHG1Md6YKxbchaZj0VUf/KHd7CigHA8FWU8M5SjJY3JzzenhR9h?=
 =?iso-8859-1?Q?V23yDNrt8YOyMhoTFkgpuuDl8s/K7RilENBxMeXajRx39m3gZcKsf3TmdX?=
 =?iso-8859-1?Q?yWK2nrmIRPo4iMD9l+Xw2xiR3ss1V4ZiAfEJuSa+PoWoJUgGNqPe49VKdW?=
 =?iso-8859-1?Q?R63pHmt+DqhaIhEwpcT49ajjFwYQHD0UTDEb39YklTI6tCXkJkWXiqUEeE?=
 =?iso-8859-1?Q?+2BS1Y7TJ5MVMPplKyvsT5IEVOnigBJ9kwoDQm3bY14nV8gpYo1YX2BySs?=
 =?iso-8859-1?Q?7zyxuYim/acXwqBCpobWSNQU1fp1ZYRByBxJepZpelneSFXAe0Bi0qqzYV?=
 =?iso-8859-1?Q?DFcLw8HztPli0N9hUVjwK7EgMLAIgQEsws/KivqoogkghytCfKGqqaLFoG?=
 =?iso-8859-1?Q?FNkWISktJwZr7tbHF0BBeNzGiuNrDEYO5p2g83NqTTBh3tOVS89WYIYwxU?=
 =?iso-8859-1?Q?2n6n7o2UsGeZa1qJTGrbSAfHgo6u8IthnfAK3jWGN2Xw/Zb273sRdYyw/q?=
 =?iso-8859-1?Q?jTXaOjuPTpGt1IBC6v2AX7sDDfk8WZVicidtSK78G1Rq1VdesGf5KHhxDa?=
 =?iso-8859-1?Q?OwNeUdsxkc8FcPk9eso/mzDAj0l8tXsVtDSo5Gb8iEaC1QTCbalPLtyeaK?=
 =?iso-8859-1?Q?y/TrDlGehYTgGZ7k/DZf6TTYz4dUfVqGFeKbWawpde3ifzvlU6d49i7qt9?=
 =?iso-8859-1?Q?2Q52lSb6ruYj3+SOpPL1x9WLcCsGbQ2IiBj3A0MTFVkYAVF/Z+Sw2VCAU1?=
 =?iso-8859-1?Q?twDRDzqqCXDnRoYnWYbHc7InfeReIf1qOrTPJ9V9GCCKJSyy9zhguAKjSn?=
 =?iso-8859-1?Q?o3cELT3IXwLu0UZJFfg6jQckmueEiadFQM5l3TdwryhjEFZt6htcWMoIxQ?=
 =?iso-8859-1?Q?Pc0hTpWqEDv4F+s5fMjCOkYNTfOil8mPsrGVuIs9FC7+lsvaAcXw5BTS3A?=
 =?iso-8859-1?Q?e/?=
x-ms-exchange-antispam-messagedata-1: T52gieCIQGHro4ilwZ8JlYdAwkZYcYgr8Ms=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a05c9a2b-f004-4e6b-6668-08df460a6899
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 06:57:42.7685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba695f87-644d-4185-a9a0-94d2dfd2f6c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBI3FgqgPAqht4YdSYO5zGepuFFmhXhnplFHiQcxOYgIEoZnprKMVynx57GP596Wf43kG9pWHoAAimjSRa5ySaxi0BPWx2wPj4P/XaZfEQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8364

> It's not clear from the commit message why you need two variables=0A=
> here, why not simply testing =A0wcn->removing.=0A=
=0A=
Testing removing alone would also skip the teardown commands on a=0A=
normal unbind with live firmware. fw_dead is only set once a command=0A=
has actually timed out during remove, so a healthy firmware still gets=0A=
the full teardown. I'll say so in the commit message in v2.=0A=
