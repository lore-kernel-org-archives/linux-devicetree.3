Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D0249364D
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787639346; cv=none; b=XDZ81Fjc4fpHeXcg/gYGt4M9vo+TzUecaTxwJC0GwA/dEPaw0WI3h/FRAnSu56JsPp+TU9nRp3w2O1GF1xaVdI5PeNDvIfVykpeAsGOIJlZC/ygcSWWB92UuY24vAGK1FC/gT4ZIygEVYvaoHU5ciAla0NuwXhHri8e8on+spE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787639346; c=relaxed/simple;
	bh=M4iAPdK1cenKR02RCbJ12RIt5gNIC4gVpauO/8odG4s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Iguzixnv9k58OYQEM/BMYh39G4qxara2ntMcypr0Rdciz1ugChw6d/pwPGbxUbMF2IoXhjFGfGr1ZTqoF65o/jXGKVNkuKEx/Bl5Wvhhlo3uLtlrXjhBMlMAazTq1eiJm7BR+PWygUPeLy1egexz0bQl4ELXqYhPHtH4sq/FLA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 67P6SqVi023368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Aug 2026 14:28:52 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from aixinexchange01.aixin-chip.com (10.122.86.160) by
 aixinexchange02.aixin-chip.com (10.122.86.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 25 Aug 2026 14:28:52 +0800
Received: from aixinexchange01.aixin-chip.com ([fe80::a517:4f0b:339f:f50b]) by
 aixinexchange01.aixin-chip.com ([fe80::a517:4f0b:339f:f50b%3]) with mapi id
 15.02.2562.017; Tue, 25 Aug 2026 14:28:52 +0800
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
Thread-Index: AQHdMU+0mwlW6evsX06KQEq6JCgFnLanum2AgAYS1IA=
Date: Tue, 25 Aug 2026 06:28:52 +0000
Message-ID: <516b940c-16a9-4575-b314-4eae340e90d2@axera-tech.com>
References: <1eab9e7f03338b673c0e544be7eb4e4421-8-26kernel.org@sslemail.net>
 <202608240638.67O6cTY3025061@spam.axera-tech.com>
In-Reply-To: <202608240638.67O6cTY3025061@spam.axera-tech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ABE69014415B94CBA3D2B2DED32999A@axera-tech.com>
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
X-MAIL:spam.axera-tech.com 67P6SqVi023368

T24gOC8yMS8yMDI2IDU6NDMgUE0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDIx
LzA4LzIwMjYgMTE6MzAsIExlbmcgSG9uZ2xpbiB3cm90ZToNCj4+IEFkZCB0aGUgQXhlcmEgU2Vt
aWNvbmR1Y3RvciB2ZW5kb3IgcHJlZml4IGZvciBkZXZpY2V0cmVlIGJpbmRpbmdzLg0KPj4NCj4+
IFJldmlld2VkLWJ5OiBTaGkgWmhpY2hlbmcgPHNoaXpoaWNoZW5nQGF4ZXJhLXRlY2guY29tPg0K
PiANCj4gV2hlcmUgZGlkIGl0IGhhcHBlbiBhbmQgd2hhdCB3YXMgaGVyZSBleGFjdGx5IHJldmll
d2VkPyBEaWQgcmV2aWV3ZXINCj4gdW5kZXJzdGFuZCBzdGF0ZW1lbnQgb2Ygb3ZlcnNpZ2h0PyBJ
IGFtIGFza2luZyBiZWNhdXNlIHRoaXMgaXMgdjEgYW5kDQo+IGhhcyBhbHJlYWR5IGNsZWFybHkg
dmlzaWJsZSBpc3N1ZSAoYmVsb3cpLg0KPiANCj4gDQoNCkhpIEtyenlzenRvZiwNCg0KVGhhbmtz
IGZvciBwb2ludGluZyB0aGlzIG91dC4gWW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0IHRvIHF1ZXN0
aW9uIHRoZQ0KUmV2aWV3ZWQtYnkgdGFncy4NCg0KQXMgdGhpcyBpcyBteSBmaXJzdCB0aW1lIHN1
Ym1pdHRpbmcgYSBwYXRjaCBzZXJpZXMgb2YgdGhpcyBzaXplLCBJDQptaXN1bmRlcnN0b29kIHRo
ZSByZXF1aXJlbWVudHMgZm9yIHRoZSBSZXZpZXdlZC1ieSB0YWcgYW5kIG1pc3Rha2VubHkNCnRo
b3VnaHQgYW4gaW50ZXJuYWwgcmV2aWV3IHdhcyBzdWZmaWNpZW50LiBJIGFwb2xvZ2l6ZSBmb3Ig
dGhlIGNvbmZ1c2lvbg0KYW5kIHdpbGwgcmVtb3ZlIHRoZSB1bmNvbmZpcm1lZCB0YWdzIGluIHYy
Lg0KDQo+PiBTaWduZWQtb2ZmLWJ5OiBMZW5nIEhvbmdsaW4gPGxlbmdob25nbGluQGF4ZXJhLXRl
Y2guY29tPg0KPj4gLS0tDQo+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Zl
bmRvci1wcmVmaXhlcy55YW1sIHwgMiArKw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sDQo+PiBpbmRleCAzOTYwNDRmMzY4ZTcuLjFkYmFmZTY4
MjcyNCAxMDA2NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92
ZW5kb3ItcHJlZml4ZXMueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sDQo+PiBAQCAtMjE5LDYgKzIxOSw4IEBAIHBhdHRl
cm5Qcm9wZXJ0aWVzOg0KPj4gICAgICBkZXNjcmlwdGlvbjogU2hhbmdoYWkgQXdpbmljIFRlY2hu
b2xvZ3kgQ28uLCBMdGQuDQo+PiAgICAiXmF4ZW50aWEsLioiOg0KPj4gICAgICBkZXNjcmlwdGlv
bjogQXhlbnRpYSBUZWNobm9sb2dpZXMgQUINCj4+ICsgICJeYXhlcmEsLioiOg0KPiANCj4gU28g
eW91ciBkb21haW4gaXMgYXhlcmEuY29tPw0KPiANCj4gDQoNCk91ciBjb3Jwb3JhdGUgZG9tYWlu
IGlzIGFjdHVhbGx5IGF4ZXJhLXRlY2guY29tLiBJIG5vdyByZWFsaXplIHRoZQ0KdmVuZG9yIHBy
ZWZpeCBzaG91bGQgcmVmbGVjdCB0aGUgZG9tYWluIG5hbWUuIEkgd2lsbCBjaGFuZ2UgdGhlIHBy
ZWZpeA0KdG8gImF4ZXJhLXRlY2gsLioiIGluIHYyIHRvIGNvbXBseSB3aXRoIHRoZSBndWlkZWxp
bmVzLg0KDQpCZXN0IHJlZ2FyZHMsDQpMZW5nDQoNCj4+ICsgICAgZGVzY3JpcHRpb246IEF4ZXJh
IFNlbWljb25kdWN0b3IgQ28uLCBMdGQuDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoN
Cg==
