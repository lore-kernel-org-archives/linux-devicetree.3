Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.72.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795725703;
	b=bqiloxbT7HjoVcDM7uDqk9zkhmZho12C0j6rZhWlrWJXBGTJyWNdCwd3ut4qpek68Z5n
	 enCvQxidJjS5WVOXAJVTt9qgLWXrZKOztoPzLmpT6A5fEi1ilCaCGJTsvTQL5/ZRCFtXY
	 7oIWH/4oUmceDC1j5yBdy5nAbXH3jdErzIepSsOwrAEVdR4M98c8VuX7XFo/W0PkqRhk5
	 3rsvusDl8ENIdCcaKWUtsX+UKLkY/mgpHqs+61IanXbBUDC9LMZ1pJvyugKa7C00FqR7W
	 pRlRqHXPJPKIRkRwYkzl1ci6I/Gd02JuxxC2r6K+qP3YF05xH4fMtRJEIwvCUhpEXCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725703;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OVLCffmloaeZeXkVNBrBtvl1qDn6NmmI7wCUCxM7scM=;
	b=WpII5REVUfAwRCe1JfCHBLoWnmXxeTw2hSxn1wCKsEFloXVfK1GxaTOkvF3MCltbQ1cA
	 8W4qGR6ooFgbPTeWa4iW/99fxh/7stFK+i3cJf9XxP6Je4FvR1m71BYxCgyFL3P2mPAK5
	 8qEg/QMYH2fPqa8Gv/pOiJy+3s7QAY5Vx2vFKEs1fxIJ83ToKRnvhJUGJy6LVX03jc1gy
	 d76u+MueNd0UzWAl6fbxHc6p/3rjZsztmyW+jNJV6LzmOmdxMRkfFEI/FMQIqZMJk+KTi
	 XFOftUywbdpjeNpYAMKTf6wAwETbkP4FO7qXDxWZU15J5Ttu3YevKxKTYIJ/cMdo1zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=okddy8Qu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.72.70
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012070.outbound.protection.outlook.com [52.103.72.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD99606A333;
	Thu, 26 Nov 2026 20:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD99606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=okddy8Qu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6s36RsPa1BU4RDxp73t/hVNLUqyR8BdJFLP3Jpzjbgnm5p+1aeL4Fu2aVittCt4pOeFhaX37+YMOCe48ClhToIj2bFB6eHtaaMi8p94JYBdwId52KaWPZt82DpidkKvOqKk9OHrgdU2tNzNOzV8Q6Qs5/lLrEoNtoYxJJyp7GAeoMo29jQhXwpxRaMCTQh3I50AD0bIRrmU8g0USDDnGm59s3cHV9Y25Z/umeZygQGTwD4loB8zllJQI8W7eCS8AwPMyIHEJO282tuAsjGCRU98JK29cL0a5t1xVdHCHajG15inoD/ormS6Ogwis05Agju1rgI9QjKXj3y4qODySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVLCffmloaeZeXkVNBrBtvl1qDn6NmmI7wCUCxM7scM=;
 b=JjOF9PEbQMko4IxrGHZof2QU965cdxJu/5F4K/umwlRydrVqVW6FK6FdoDmaPR+K7PFItRxnLyC8yo0zrHHtvmZEaOiG+uzVgVjKOn1sIscwwryOfRacVJfXmFU2RYYer8/I8bHWfmI845nAadGVx8/QxbDAny4rPd5e46ysyYscTgmu4BEflGKXflIbFApH0tlCaLAHYjq/RUj62ddXU7U63HAujHk44ouqxht6wIYs9zgegEJI3YjkF50EPQSGvGmtPAW30cvvx6r9njfyE42g9Dm647qVFS5cG3C75SDCYQZA54R1Z7dwoB1BouUm0ipnvRSf/LR59iUBTYpXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVLCffmloaeZeXkVNBrBtvl1qDn6NmmI7wCUCxM7scM=;
 b=okddy8QuryxYFNKDohjGRNc4zEJNlnzJfNp6U6nnl12HTjjOFhCzYnogt6CNsDSL0FiUzFHuW1v33cJt67dEYog3Nw5pppxE9tAwQXhBUWs4OaurDf20QqVKqlYa8A87dEOHhQDLdM504/rWVl1KLo1CerGdI9aZww9c1Ly4rdpHzuxDCox9TIX2MNrcBcTtNyeezDI9y+S63P4NCwROy2vouq85ss8EsfeoqhPqbsE8mNHmMRKrf+73/4axNM08X+3Q5VjaDD+/hLzm3Rqr7mlobkNQvYViNCltXvv5DNf2PEo5zA+UXVeOWxE7C3BXqRkmeT0yMQdFc+IShFxnEg==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by SY2PPFBBD4BB112.ausprd01.prod.outlook.com (2603:10c6:18::2b0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 20:41:39 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0662.007; Thu, 26 Nov 2026
 20:41:38 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH RFC v3 2/2] arm64: dts: qcom: Add a minimal REDMI K90
 Ultra description
Thread-Topic: [PATCH RFC v3 2/2] arm64: dts: qcom: Add a minimal REDMI K90
 Ultra description
Thread-Index: AQHdYVo9D47kW7wZZUOSQ6s1kdOJvrcPy3MAgDE+vgA=
Date: Thu, 26 Nov 2026 20:41:38 +0000
Message-ID: <warsaw-dts-v3-followup-b64b1a68818f5ff0b528@outlook.com>
References: <20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83ef@outlook.com>
 <20261021-b4-warsaw-minimal-usb2-v3-2-9f4213ab83ef@outlook.com>
 <7056d429-5bd8-47bb-8c9a-5827be7c6279@oss.qualcomm.com>
In-Reply-To: <7056d429-5bd8-47bb-8c9a-5827be7c6279@oss.qualcomm.com>
Reply-To: Zhang Jiaxi <Z1529105815@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|SY2PPFBBD4BB112:EE_
x-ms-office365-filtering-correlation-id: fc0891e1-3e99-4250-d571-08df4bfdabb5
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|8060799015|24121999003|25031999004|22091999003|38102599003|20031999006|19110799012|24071999003|15080799012|8062599012|24021099003|25010399006|39105399006|4140399003|25131999003|26104999009|3412199025|440099028|102099032|40105399003|26121999007;
x-microsoft-antispam-message-info:
 =?utf-8?B?WitlaFZpZlJhZHVvRTJ6dU9nWWhwVlFaMEphdFdNOGxGb2lhbDVHUmxadnl3?=
 =?utf-8?B?MFFmNjduUXdZRGNvVHk1clVzc0NTRG44VUhobXk4b2l2bGU5YVpjWjFOM2p6?=
 =?utf-8?B?YVhyVkpVK0FHRXBjUXUzaVBtL2hJMVpqWXB0VGJXRjRuMlc2WWdWWm1hNWZi?=
 =?utf-8?B?WnEwQlpqRzBjTXpBcStsZERUZEpCdzhpalhmRzZvYXhIK1kxaWwrblVtSXJG?=
 =?utf-8?B?Q1lIbkVnK2xlYXYrNEpHdFFEZm45YXI3NTVrckRlYlZKaXpVNUYrbGNFaEdC?=
 =?utf-8?B?NlhmK1BudEZYNEtqbUYxUnNPK0RyUm9QRXRNckFRZXh4a3ZOczVIODAxYU1y?=
 =?utf-8?B?S2pkTTUrQUNJU2x4Y29RQVU5a3RLUGZDNjVBT1B1Q2ZyUE5jWjI2QnRlTWZn?=
 =?utf-8?B?S2JIa0psbFBjUzVEM0YxSm5CTk5XS1FDS2VSUjRDajh3eFovdlVlcndTcGhx?=
 =?utf-8?B?QnlmTHpXZDhDWlVjYjl5UkhJSm9VSXU3ek9yU1pqMlIzcEo5U3plMmVZaUFS?=
 =?utf-8?B?a3N3ejIvb1RMOU1vWDRqZFZRNUpwQm1YYVZLUVJCcEZLSUNENnFlVGEzZkYy?=
 =?utf-8?B?MnNhRXQydC9SaDU0Vkd1TDg5UG1GZ21SdGI5R3FPdmFZL1YxRmd0U2MySmNs?=
 =?utf-8?B?WldUMXlBcTFLbVBqZTlnL1NOSEh2dFg2NkJRbTdrbXFKQXcyT3Nkam1QZUMx?=
 =?utf-8?B?a05mZlMxcXZSNEowbnNLekpTdWNHK3FGS0F4M2JXWW04QUdpMHZxSUFCMGd5?=
 =?utf-8?B?OUUzZ2w0cHZ6Q2R1RkI4SjQvOTRYRmxCbUdWcjBEZ1NFUFNEVGNoYm9oazhi?=
 =?utf-8?B?MTNiTm15c1ZNUTMybmRhcGpwMTV3R012UGNaNGUvYnpiRUxuMC9odEd4WHU4?=
 =?utf-8?B?SEFRT0doekNseHpHa3plcnZBYlFyNUZLa2Y1ZHR3SVBOMWRiZ24xaC9hTk5H?=
 =?utf-8?B?Vjk1VEFxbG1QYlZ1YW1yNzFSYkErVVpuSUcvYXRyUWU5V0JZRE8rYUNoSmVw?=
 =?utf-8?B?K2FQTXZMK25NSXY0Y0c5SkxMMlE2dFE4Ky83MnRtVHVlQzA3S2RKM2NCRnYy?=
 =?utf-8?B?aGt6bkVxSkFLYStHZXA2VlN1eTh1YlUvckFDTmRvdlBaaUU1YisvbXFocGFP?=
 =?utf-8?B?cGpnWXBqMVgyTkljclFlZmxwUEhuMzNPTFNhYjhnZUxaTUsvUlg2aE1kQk1R?=
 =?utf-8?B?c2ZVaU1RcmpGTkh5WUFCcXdxdG1qdVBtVUU5cFA5TUlmNHdybFh3UWlEZ1gy?=
 =?utf-8?B?WUJ0S3JodWRHTGk5R2JXLytrS29jTEg2Sy9sWEdaMytOMGdOQTZoNm9BVmxO?=
 =?utf-8?B?eFBBemJSdmYvblhNM0V6MXRqRFRIR1pVMFRvdmdVU3N0aU5oMllnTi9qMVU2?=
 =?utf-8?B?MnpPdE1aQ3VsZmZ0L2czcTZVUHg1WjdKeVBob00zV0IxM0tCeTRjYlpLWjZn?=
 =?utf-8?B?MXdwTUlGNU80ZmZmaFNWMGVjb2orWXIzdnNtR1Z0ZzYzdnNpd1YxNGIyUE1s?=
 =?utf-8?B?b1JIVEFEY3hlUmxkVTJ6VlFLTWVZRnhVM3ljelBYWkYyQmRZdVJuUmQyVTNN?=
 =?utf-8?Q?zzEGi3pBVMXxsAeSeFc27WdtZ5Z4OLNanIN5ZKRSmPzQaS?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2Mrc1dqWlAwaTRJbXRxV2FpKytQQlFKZDVXbVhCbC9tUmhWN1JnbUV2VmpE?=
 =?utf-8?B?bU5mUlpIclJZak5zYjVZeEdHSFl1QUw2VkpQMFZZcm5qaTJOVzhEaHVuL1NX?=
 =?utf-8?B?ak5KK3hPbGp4ODJBQ0d2K2tIbFpQMkt6c2grYVBLc0xyTWpQVWwrSk5VNVNl?=
 =?utf-8?B?djhJM202ck1tSGt0OFJJZVlzcU5XVlBjTGRVOE5HK3RmZS9Tb013TlV1WUll?=
 =?utf-8?B?blJTN0U3bzNEejVDU1pJVHQ3YzZnUlgxbnhHVXVCRkZXOFZMQTQ5ZWc0UnJ1?=
 =?utf-8?B?N3JSa1FGZWpvWm5HREp2ek1kVEwwRDFoWXVpa3o3K1NzdlR4NkJRNitBU2Vt?=
 =?utf-8?B?WkZxMis3TUpCUjhqemdyQjg4bVZ3Mi9xYzFxSW4za1oreXFIYUV5QVlvRkxV?=
 =?utf-8?B?eHROaUpianRXTVlwLzVlY0xLNGNMK2h6ay9USWtEcFpoL2NBUzJSZFhuWXVE?=
 =?utf-8?B?NG1sc3BRNlBHZ2VNTGhwZUY1TjFJNEtRY0ZCam1VWDRpNE1pUldsNkovUzhV?=
 =?utf-8?B?S1NJUEN4allBNXgxQkJBazZ1Ky9Kdi9Dd1ZJR0FxZytOOTArVnZZR0JoREZR?=
 =?utf-8?B?Q3A0dndSeXFxZnQyejFjcEZjQ3dmTGJnY2lRK2l6Nzcxem42K2FYY1NpM3hs?=
 =?utf-8?B?UDdnN1JERG9JVjNiUXMwWDF4elVjcGE5T00zcmdRTFU3dHJKQUo0V3hlK3gv?=
 =?utf-8?B?TGpPRDZnWXFsVmx1TnM2VWxOQnBtM3AvVCtFUVYyN1V3SmViV2Zlb0oyelIx?=
 =?utf-8?B?MnpMSW0xNlA2V1E1aE9BT1RDVmpoQzNpeHFGd2VSUUx6bWVQc2JKMEtOdHVK?=
 =?utf-8?B?KzRFd2lVVWx4dkNKM0ZNdW81Z0xWN0dhMGErZlRHbnNPeHJUa2tNWkhsNDhW?=
 =?utf-8?B?RlpYcW5JYVB3djlqY1E1d2xkOFE4d3NtRWl6Tk9UT2liblZ6NWVmajdpWTRq?=
 =?utf-8?B?T1VmNWJSZjNSZ25TM2hnWGxRKzllZTRaWGVnQXJpcmJOTDM0a2pTWFVsUWtJ?=
 =?utf-8?B?TnhoWE9hc09QclFTVnprL0lFZzdnMi90MmhPTEloUGt4MDVaQjVNMW01cElX?=
 =?utf-8?B?cVpUTkVRVGVVNncrQ0l2Wk4xeW9KYzFaZGRzem5SQTFFZUc1ZFoydVhSWnp1?=
 =?utf-8?B?WlBlVVplV0pHWG50eGZGSzFiWnZJYlQxQkhES0pPT0gvcER6VjJCV1Z6ZCtG?=
 =?utf-8?B?NU5Gb3dmTmdPLzRiNEJVenU5cEtIMDUwdlpWb0NRUGc1ejBsSFh4STludkNR?=
 =?utf-8?B?Vmc3KyswZFR3eHpxcG9mQzVOZkVVbHN3TzRIOWpTK0cxVkU3SHRocU9jOUE3?=
 =?utf-8?B?VjBTckh4WHByS2hPdDZwZFhKbGM5YktaVFQ5SW1HOXNYRmovTXVubUpyM2Fi?=
 =?utf-8?B?VExuaEZVaFRlRERZSGh5RlpFL1RhU1JqWHcvWWJwdEhJSitMcDRFQ1hNSkZk?=
 =?utf-8?B?dTR4RFFIbnAyVTVZZGIzV3dsUTFQU01Sc0s3akc3Z1ZyRGxYK0xCMWovOVdB?=
 =?utf-8?B?enBTRDZGNzRocS9ldnoxcGgxZ0QzSnBrS3JuU2tUd3p1VXIxY2tMeVBSUXJi?=
 =?utf-8?B?MUF6OTRtdGtJWHFoNVZZS0Fzb3MyenlGS2dkQmEzWjRTTmZ3V2w1RkNJV2hM?=
 =?utf-8?B?UXpVQWw5Qkh2MnNYdzdDWTZRbG5XT1ZjeXI3NjJ5TzA2NFg1NkFyMEdFODlj?=
 =?utf-8?B?S0lRZXYrTmtSdGRRbFRWaksxQjlPZHNsWndwSUhuME9pQW1nbzJzQ3ZsT2hK?=
 =?utf-8?B?clNMZlhOV0MyUDNSTUNUdWtyVkVYSUI5UURzbUhxb2NUYlZhQVNxMVorM0gy?=
 =?utf-8?B?bDBCN3JYdkNBZVBFSVRFS2JCcDkxaTdVL0g2ZThBVU42R2N6NnNTbkFIaFJr?=
 =?utf-8?Q?3r/oUjJMR4qA3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4BCEECCC5C1AC4C824D5B5E99A1CC87@ausprd01.prod.outlook.com>
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
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0891e1-3e99-4250-d571-08df4bfdabb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 20:41:38.9147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY2PPFBBD4BB112

SGkgS29ucmFkLA0KDQpUaGFuayB5b3UgYWdhaW4gZm9yIHJldmlld2luZyB0aGUgdjMgc2VyaWVz
Lg0KDQpTaG91bGQgSSByZXNlbmQgdGhlIHNlcmllcyBhcyBhIG5vbi1SRkMgdjQsIG9yIGlzIHYz
IGFscmVhZHkgcXVldWVkIGZvciBtZXJnaW5nPw0KDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgYW55
IGZ1cnRoZXIgY2hhbmdlcyBhcmUgbmVlZGVkLg0KDQpUaGFua3MsDQpKaWF4aQ0K
