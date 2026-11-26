Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.39.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683165;
	b=2JJMh04pH0NM3Ci39/v4lBe4AIsBt+NI3cKZQdbe8fdnxz3BScC+gNp0zVQwfgxsARVl
	 nofNIcmhKMpY4HRqGZas03CGMWKUsgdgiMHNd/ONDGRFPKMpFWj0SstpBk62OTSAIyyc4
	 arta+yFooGxCilv1ebwilXgcm+QHKrWEwaOidWil39qSyn4hZIzd16ijAnChODZyZuEfT
	 9ZPhrZ+4QX8VRTETJMhLuDkcqpgAMj3TRoqOR8BWEKEq+/Wj1UI07C5WXPMjzcAHRlL70
	 t029+VgSnPqv1RNRv3+KaQokkWmmXyEs3P7GYeFRwuyZ0odjAyPwHX1bDTJp/L24HWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683165;
	h=DMARC-Filter:DKIM-Signature:X-secureTransport-forwarded:From:
	 Complaints-To:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JRdTm7MLn01nzpZdxxiuJqZxEVjGoxZUMxFX5IpmmAw=;
	b=f5uHbwWm0BdtfmAgGCip/iWbhATzPBCMracQ1uqS7yAKgmy1iXXwXIvqQqBML9s/M797
	 L6cHYKEqxvPeHbH6Nt1nV3ZbBhE65dBrnQuQ7djytoUQkuxJaFx5lKNlyPIuO6dbYa13A
	 sqSsb6tJX1MGjRD08urelRafqVN44LqxC7Zgi+Wal7hBqNtAYP4NumEzFJjSxXzG4Y92c
	 /p7Yg+g2rLDtUyEGQ8yPW5W1KqKUAgIc3aPCDyesaU8MI7muCv93tNGbCVxVjLTZdK+HW
	 uDMgK2Z4QVFojqy3CLbT/7PZdPKqomlUz8luj+Rg1cic4vaiVtO2LTF0jnEO56bUsZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b="U1iz78/+";
	arc=none smtp.remote-ip=188.68.39.254
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1B6606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F1B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=U1iz78/+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1795683115;
	bh=JRdTm7MLn01nzpZdxxiuJqZxEVjGoxZUMxFX5IpmmAw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=U1iz78/+fyPLPWeC2+oR4S3SnaaBmqfe+WSxXzeN0L2hdHDTdBRhanRB1OTQvJLZd
	 xQzhWUpwaUoMnAXwscUUiVe7NsHQwV2KEM2V46gOHrOxtEpm3hP77PS48hYs8NQfKw
	 tEnSp8OECKDY/g0smgXwvMkL2L0rzWBaghBMHQ8Io5+yj1lNmQnjsUfZXEnxljIULc
	 Jhl9GRwjQYqHxCwmfIOLPnDPntApFtCXsCRnm4V9240f4z2rSugfwhJXonb7vUzg6U
	 6Xx/CnM/aB1cd7ZxPbfvEIuKyewNReJfgJ8GMyAhZFsjwgUADbN1MtgbtT8Wmi8wiO
	 Xpi+j1geuliww==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@nabladev.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Pascal Zimmermann <pzimmermann@dh-electronics.com>, Conor Dooley
	<conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li
	<Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel
	<kernel@dh-electronics.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
Thread-Topic: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin
 configuration
Thread-Index: AQHdfNxvka56chsGIUmKS9A5oSlWCbc+vxUAgAFGNICAAAaZYA==
Date: Thu, 26 Nov 2026 08:51:54 +0000
Message-ID: <5e607c068ea54d5a859e1de82c1574b7@dh-electronics.com>
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
 <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
 <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
In-Reply-To: <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
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

RnJvbTogQ2hyaXN0b3BoIE5pZWRlcm1haWVyIDxjbmllZGVybWFpZXJAZGgtZWxlY3Ryb25pY3Mu
Y29tPg0KU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDI2LCAyMDI2IDk6MjUgQU0NCj4+IE9uIDEx
LzI1LzI2IDE6NTYgUE0sIENocmlzdG9waCBOaWVkZXJtYWllciB3cm90ZToNCj4+PiBGcm9tOiBQ
YXNjYWwgWmltbWVybWFubiA8cHppbW1lcm1hbm5AZGgtZWxlY3Ryb25pY3MuY29tPg0KPj4+DQo+
Pj4gVGVzdHMgaGF2ZSBzaG93biB0aGF0LCB3aXRoIHRoZSBjdXJyZW50IHBpbiBjb25maWd1cmF0
aW9uIG9mIHRoZQ0KPj4+IGVNTUMgKHVzZGhjMiBpbnRlcmZhY2UpIHJlYWQgZXJyb3JzIGNhbiBv
Y2N1ciB3aXRoIGEgY2VydGFpbg0KPj4+IHR5cGUgb2YgZU1NQyBjaGlwcy4NCj4+DQo+PiBXaGlj
aCBjaGlwcyBhcmUgdGhvc2UgPw0KPiANCj4gVGhlIHByb2JsZW1zIG9jY3VycmVkIHdpdGggY2hp
cHMgZnJvbSBNYWNyb25peC4NCg0KVG8gYmUgbW9yZSBzcGVjaWZpYywgdGhlIG1vZGVsIHRoYXQn
cyBjYXVzaW5nIHByb2JsZW1zIGlzIGNhbGxlZA0KdGhlIE1hY3Jvbml4IE1YNTJMTTA0QTExWFZX
Lg0KDQpSZWdhcmRzDQpDaHJpc3RvcGgNCg==
