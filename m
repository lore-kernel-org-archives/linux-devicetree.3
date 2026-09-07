Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B937F8CA
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765162; cv=none; b=ljvLAXyVuDdu3hWwzpul7n45ttP8GAQ+yhJhSicc1ZusGt9Gj9IBwib9O3XsANzYT67d0MZp16PCh3NV1MH8j+hAhyYj3FD2WZpvU7Cxj1O9m4qRCeB2FsUONGoKurjB5OgXHPWOSD3E5xxPwA6fl+SrmNeN51IJUoAVjjJnlCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765162; c=relaxed/simple;
	bh=r4GdEdXAWRTbr5Iewq/QKfupUPG2bJOo4mtgloRYHxg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZuIuN8QOkFAIkQVUCUA0p/2go5oF9qJrlaLuoZJH8w75AnCEzNgeEZC46lzF/CmPSidhrJxEvYPuO4WGYlT50eiAvp8QOcg4t9rgJXayrfUylYSVz5tOcAtrMToL1DRykhq7VYTh+8TIMfriJqc/iE+ovJAX61OhaO0AdxS/vLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 6877COTs064972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Sep 2026 15:12:24 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from aixinexchange01.aixin-chip.com (10.122.86.160) by
 aixinexchange02.aixin-chip.com (10.122.86.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 7 Sep 2026 15:12:23 +0800
Received: from aixinexchange01.aixin-chip.com ([fe80::a517:4f0b:339f:f50b]) by
 aixinexchange01.aixin-chip.com ([fe80::a517:4f0b:339f:f50b%3]) with mapi id
 15.02.2562.017; Mon, 7 Sep 2026 15:12:23 +0800
From: =?utf-8?B?5Ya357qi5p6X?= <lenghonglin@axera-tech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?5pe25b+X5oiQ?=
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre
 Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "soc@lists.linux.dev"
	<soc@lists.linux.dev>,
        "hlleng233@gmail.com" <hlleng233@gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: add Axera
Thread-Topic: [PATCH v2 1/6] dt-bindings: vendor-prefixes: add Axera
Thread-Index: AQHdOfMBrgCL5h+b0EiB4/O1QkfuCra8SGUAgAXuDYA=
Date: Mon, 7 Sep 2026 07:12:23 +0000
Message-ID: <c5bc6bb0-0a0b-49bf-afd0-f39696d84b90@axera-tech.com>
References: <2113d03615a9265b42a4d69a5a9020ef3-9-26kernel.org@sslemail.net>
 <20260903-impossible-normal-termite-b7f9b8@quoll>
In-Reply-To: <20260903-impossible-normal-termite-b7f9b8@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <D07FBE6682A4EC4FBB560494D9F3CF7C@axera-tech.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 6877COTs064972

T24gOS8zLzIwMjYgODozOSBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gVHVl
LCBTZXAgMDEsIDIwMjYgYXQgMDU6MTk6MjhQTSArMDgwMCwgTGVuZyBIb25nbGluIHdyb3RlOg0K
Pj4gQWRkIHRoZSBBeGVyYSBTZW1pY29uZHVjdG9yIHZlbmRvciBwcmVmaXggZm9yIGRldmljZXRy
ZWUgYmluZGluZ3MuDQo+Pg0KPj4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHZpc2l0IHRoZSBvZmZp
Y2lhbCBBeGVyYSBTZW1pY29uZHVjdG9yIHdlYnNpdGU6DQo+PiBDaGluZXNlIHNpdGU6IGh0dHBz
Oi8vd3d3LmF4ZXJhLXRlY2guY29tLw0KPj4gRW5nbGlzaCBzaXRlOiBodHRwczovL3d3dy5heGVy
YS10ZWNoLmNvbS9lbg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IExlbmcgSG9uZ2xpbiA8bGVuZ2hv
bmdsaW5AYXhlcmEtdGVjaC5jb20+DQo+PiAtLS0NCj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgfCAyICsrDQo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwNCj4+IGluZGV4IDM5NjA0NGYz
NjhlNy4uMWRiYWZlNjgyNzI0IDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwNCj4+IEBAIC0yMTksNiAr
MjE5LDggQEAgcGF0dGVyblByb3BlcnRpZXM6DQo+PiAgICAgIGRlc2NyaXB0aW9uOiBTaGFuZ2hh
aSBBd2luaWMgVGVjaG5vbG9neSBDby4sIEx0ZC4NCj4+ICAgICJeYXhlbnRpYSwuKiI6DQo+PiAg
ICAgIGRlc2NyaXB0aW9uOiBBeGVudGlhIFRlY2hub2xvZ2llcyBBQg0KPj4gKyAgIl5heGVyYSwu
KiI6DQo+IA0KPiBTbyBob3cgZGlkIHlvdSBpbXBsZW1lbnQgb3duIGNvbW1lbnQ/DQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpIaSBLcnp5c3p0b2YsDQoNCkkgc2luY2VyZWx5
IGFwb2xvZ2l6ZSBmb3IgdGhlIGNvbmZ1c2lvbi4gSW4gbXkgcHJldmlvdXMgcmVwbHksIEkgZGlk
DQpwcm9taXNlIHRvIGNoYW5nZSB0aGUgcHJlZml4IHRvICJheGVyYS10ZWNoIiB0byBhbGlnbiB3
aXRoIG91ciBkb21haW4NCm5hbWUuIEkgc2hvdWxkIGhhdmUgZXhwbGFpbmVkIG15IGNoYW5nZSBv
ZiBtaW5kIGluIHRoZSB2MiBwYXRjaCBub3Rlcy4NCg0KV2hlbiBJIHN0YXJ0ZWQgbWFraW5nIHRo
ZSBjaGFuZ2VzIGludGVybmFsbHkgZm9yIHYyLCBJIHJlYWxpemVkIHRoYXQNCm91ciBleGlzdGlu
ZyBCU1BzLCBib290bG9hZGVycywgYW5kIGEgbGFyZ2UgYW1vdW50IG9mIGRvd25zdHJlYW0NCmNv
ZGViYXNlIGFscmVhZHkgaGVhdmlseSByZWx5IG9uIHRoZSAiYXhlcmEsKiIgcHJlZml4IGZvciBj
b21wYXRpYmxlDQpzdHJpbmdzLiBDaGFuZ2luZyBpdCB0byAiYXhlcmEtdGVjaCIgbm93IHdvdWxk
IGNhdXNlIG1hc3NpdmUgYnJlYWthZ2UNCmFuZCBjb21wYXRpYmlsaXR5IGlzc3VlcyBhY3Jvc3Mg
b3VyIGV4aXN0aW5nIGVjb3N5c3RlbS4NCg0KQmVjYXVzZSBvZiB0aGlzIGhpc3RvcmljYWwgbGVn
YWN5LCBJIGxvb2tlZCBmb3Igc2ltaWxhciBjYXNlcyBpbiB0aGUNCnVwc3RyZWFtIGJpbmRpbmdz
IGFuZCBub3RpY2VkIHRoYXQgdGhlcmUgYXJlIGFjY2VwdGVkIHByZWNlZGVudHMgd2hlcmUNCnRo
ZSBwcmVmaXggcmVmbGVjdHMgdGhlIGNvcmUgYnJhbmQgcmF0aGVyIHRoYW4gdGhlIGZ1bGwgZG9t
YWluIChmb3INCmV4YW1wbGUsICJeY2l4LC4qIiBmb3IgY2l4dGVjaC5jb20pLg0KDQpXb3VsZCBp
dCBiZSBhY2NlcHRhYmxlIHRvIGtlZXAgImF4ZXJhIiBhcyB0aGUgcHJlZml4IHRvIHByZXNlcnZl
DQpjb21wYXRpYmlsaXR5IHdpdGggb3VyIGV4aXN0aW5nIGRlcGxveWVkIHN5c3RlbXMsIGV2ZW4g
dGhvdWdoIG91cg0KZG9tYWluIGlzIGF4ZXJhLXRlY2guY29tPw0KDQpJZiB0aGlzIGlzIHN0cmlj
dGx5IG5vdCBhbGxvd2VkLCB3ZSB3aWxsIGhhdmUgdG8gZmlndXJlIG91dCBhDQptaWdyYXRpb24g
cGF0aCBpbnRlcm5hbGx5LCBidXQgcHJlc2VydmluZyAiYXhlcmEiIHdvdWxkIGJlIGhpZ2hseQ0K
cHJlZmVyYWJsZSBmb3Igb3VyIGVjb3N5c3RlbS4gSSBhbSB2ZXJ5IHNvcnJ5IGFnYWluIGZvciBu
b3QgY2xhcmlmeWluZw0KdGhpcyBlYXJsaWVyLg0KDQpCZXN0IHJlZ2FyZHMsDQpMZW5nDQo=
