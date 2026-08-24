Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC023C368
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560909; cv=none; b=Fnt8qpVXpZqrlpsC9j+fgkgYGrdpQCxspM7AvQdKssRqv6amMw8i6Vnkc7AJjPyfulYJRjL2LbePO+wzcPkW6snl6ZnJADM81F03DdsEL6PntRQQiOThjhlTU6WK/oqrXeyFoW/PXKBY3R8P12S8RGCWcGQ91Sxw4rwaUoCMaLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560909; c=relaxed/simple;
	bh=5s9fmTdBx0AUYR5j6ZsQuKFd//akurKUYOhk2aCWWo8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rjDG6N9kBP15+o8DxhE/X9OmrDMNtLmMwAL96rIXXFuUg2MmDhHhzpRqnjP/4RWwqXls6/HTBgJ4T38vl2sBzK3zwxf8VLyoKm6ky0UBpZdV14v4uOma8utFJ7/jYtUEdf1aSE9eZjYyaUpbft7hzWsDFUz8c1fa3lOfUtQsB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 67O8fTeo070784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Aug 2026 16:41:29 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from aixinexchange01.aixin-chip.com (10.122.86.160) by
 aixinexchange02.aixin-chip.com (10.122.86.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 24 Aug 2026 16:41:29 +0800
Received: from aixinexchange01.aixin-chip.com ([fe80::a517:4f0b:339f:f50b]) by
 aixinexchange01.aixin-chip.com ([fe80::a517:4f0b:339f:f50b%3]) with mapi id
 15.02.2562.017; Mon, 24 Aug 2026 16:41:29 +0800
From: =?utf-8?B?5Ya357qi5p6X?= <lenghonglin@axera-tech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?5pe25b+X5oiQ?= <shizhicheng@axera-tech.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        Drew Fustini <fustini@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "soc@lists.linux.dev"
	<soc@lists.linux.dev>
Subject: Re: [PATCH 1/6] dt-bindings: vendor-prefixes: add Axera
Thread-Topic: [PATCH 1/6] dt-bindings: vendor-prefixes: add Axera
Thread-Index: Ad0zoBvFUJnRy3dgQQGTVELxv6YhCw==
Date: Mon, 24 Aug 2026 08:41:29 +0000
Message-ID: <45eb9a27392441898b0c6db7a54a3f61@axera-tech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
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
X-MAIL:spam.axera-tech.com 67O8fTeo070784

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4g5Y+R6YCB5pe26Ze0OiAyMDI25bm0OOaciDIx5pel
IDE3OjQ0DQo+IOaUtuS7tuS6ujog5Ya357qi5p6XIDxsZW5naG9uZ2xpbkBheGVyYS10ZWNoLmNv
bT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5v
cmc+OyDml7blv5fmiJAgPHNoaXpoaWNoZW5nQGF4ZXJhLXRlY2guY29tPjsgQ2F0YWxpbg0KPiBN
YXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT47IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5l
bC5vcmc+OyBBcm5kDQo+IEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPjsgQWxleGFuZHJlIEJlbGxv
bmkNCj4gPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgTGludXMgV2FsbGVpaiA8bGlu
dXN3QGtlcm5lbC5vcmc+OyBEcmV3DQo+IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4NCj4g
5oqE6YCBOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBzb2NAbGlz
dHMubGludXguZGV2DQo+IOS4u+mimDogUmU6IFtQQVRDSCAxLzZdIGR0LWJpbmRpbmdzOiB2ZW5k
b3ItcHJlZml4ZXM6IGFkZCBBeGVyYQ0KPiANCj4gT24gMjEvMDgvMjAyNiAxMTozMCwgTGVuZyBI
b25nbGluIHdyb3RlOg0KPiA+IEFkZCB0aGUgQXhlcmEgU2VtaWNvbmR1Y3RvciB2ZW5kb3IgcHJl
Zml4IGZvciBkZXZpY2V0cmVlIGJpbmRpbmdzLg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IFNoaSBa
aGljaGVuZyA8c2hpemhpY2hlbmdAYXhlcmEtdGVjaC5jb20+DQo+IA0KPiBXaGVyZSBkaWQgaXQg
aGFwcGVuIGFuZCB3aGF0IHdhcyBoZXJlIGV4YWN0bHkgcmV2aWV3ZWQ/IERpZCByZXZpZXdlcg0K
PiB1bmRlcnN0YW5kIHN0YXRlbWVudCBvZiBvdmVyc2lnaHQ/IEkgYW0gYXNraW5nIGJlY2F1c2Ug
dGhpcyBpcyB2MSBhbmQgaGFzDQo+IGFscmVhZHkgY2xlYXJseSB2aXNpYmxlIGlzc3VlIChiZWxv
dykuDQo+IA0KPiANCg0KSGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMg
b3V0LiBZb3UgYXJlIGFic29sdXRlbHkgcmlnaHQgdG8gcXVlc3Rpb24gdGhlDQpSZXZpZXdlZC1i
eSB0YWdzLg0KDQpBcyB0aGlzIGlzIG15IGZpcnN0IHRpbWUgc3VibWl0dGluZyBhIHBhdGNoIHNl
cmllcyBvZiB0aGlzIHNpemUsIEkNCm1pc3VuZGVyc3Rvb2QgdGhlIHJlcXVpcmVtZW50cyBmb3Ig
dGhlIFJldmlld2VkLWJ5IHRhZyBhbmQgbWlzdGFrZW5seQ0KdGhvdWdodCBhbiBpbnRlcm5hbCBy
ZXZpZXcgd2FzIHN1ZmZpY2llbnQuIEkgYXBvbG9naXplIGZvciB0aGUNCmNvbmZ1c2lvbiBhbmQg
d2lsbCByZW1vdmUgdGhlIHVuY29uZmlybWVkIHRhZ3MgaW4gdjIuDQoNCj4gPiBTaWduZWQtb2Zm
LWJ5OiBMZW5nIEhvbmdsaW4gPGxlbmdob25nbGluQGF4ZXJhLXRlY2guY29tPg0KPiA+IC0tLQ0K
PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlh
bWwgfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXBy
ZWZpeGVzLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5k
b3ItcHJlZml4ZXMueWFtbA0KPiA+IGluZGV4IDM5NjA0NGYzNjhlNy4uMWRiYWZlNjgyNzI0IDEw
MDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3It
cHJlZml4ZXMueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbA0KPiA+IEBAIC0yMTksNiArMjE5LDggQEAgcGF0dGVyblBy
b3BlcnRpZXM6DQo+ID4gICAgICBkZXNjcmlwdGlvbjogU2hhbmdoYWkgQXdpbmljIFRlY2hub2xv
Z3kgQ28uLCBMdGQuDQo+ID4gICAgIl5heGVudGlhLC4qIjoNCj4gPiAgICAgIGRlc2NyaXB0aW9u
OiBBeGVudGlhIFRlY2hub2xvZ2llcyBBQg0KPiA+ICsgICJeYXhlcmEsLioiOg0KPiANCj4gU28g
eW91ciBkb21haW4gaXMgYXhlcmEuY29tPw0KPiANCj4gDQoNCk91ciBjb3Jwb3JhdGUgZG9tYWlu
IGlzIGFjdHVhbGx5IGF4ZXJhLXRlY2guY29tLiBJIG5vdyByZWFsaXplIHRoZSB2ZW5kb3INCnBy
ZWZpeCBzaG91bGQgcmVmbGVjdCB0aGUgZG9tYWluIG5hbWUuIEkgd2lsbCBjaGFuZ2UgdGhlIHBy
ZWZpeCB0byANCiJheGVyYS10ZWNoLC4qIiBpbiB2MiB0byBjb21wbHkgd2l0aCB0aGUgZ3VpZGVs
aW5lcy4NCg0KQmVzdCByZWdhcmRzLA0KTGVuZw0KDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogQXhl
cmEgU2VtaWNvbmR1Y3RvciBDby4sIEx0ZC4NCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg==
