Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793583210;
	b=m/XMOH3+mJMIYugCEGqUne86Sz/qaU6c4qfJzA5ZDTuExSt6Q3qgogjVFqqyq+p+dMLU
	 Ckb/i/ioGzWxcnU9qZE5xUh+fBQH295O0bRcYsNvyWNmx8Ucw0WcNlqWHLLUqkz1Tr9ic
	 md8jxnRD4N+bR/w/gGrH8cnf7NZsgzX/UJtK4moOfD16Ja1XQUtx8TFU/rE54jUYnAYhX
	 tCAJ+MuTbbw87F1Oxc1rv9i9ipnGFMRQgQFO2Cvwgx8vKHsiDqjC16cfghD++YaL2nPi+
	 ooTlOcwJCCdPitBKPr3FQ+FMueusjHAXd+9Fv+46hzfcu6Rqij/YouHOOjZjx8etGEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793583210;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:From:To:Cc:
	 References:Autocrypt:In-Reply-To:Content-Type;
	bh=CpinM/IpytUfD9vGKaPrjPRQBHB3wnZR9UZpr2lYAok=;
	b=Sa/90wW6cwmRbo+YkyBW84OsWYJ/eyoM85HqY5mJujWkWMfozyGIUIpxW8DhLYAnjctV
	 SnZTOn9gGWaJhDFnPaRPkEbbYO3O77rdID/3IpYNIX/NQYjjQeaQrGOxoycy9+8DcT6VG
	 CVV/XjMUWH5cs5t13gbqG/yil4F7QL0RZx/swr6uaLZOzYRXX2xXk6Astu9B+9UJ7ae8O
	 61Ui7Vvgjaa8uQenHTkNbhhWMDd4qOMRj0/y6JOM7jmsv2UiGzWdzhlyCDnZV+Z8TrKmc
	 OjkJ89dziQWtYNZZUbsgJ4RnFlkGokbry/2jsIo9sIbZ6ZqxriLumPZPZ/cXVVgjSyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=sidspAq7;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=ahT0ov6n;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D83606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 01:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D83606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=sidspAq7;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=ahT0ov6n
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:From:Subject:Date:Message-ID; t=1793583195; bh=CpinM/IpytUfD9vGKaPrjPR
	QBHB3wnZR9UZpr2lYAok=; b=sidspAq7Ua9LmBj8CwRrD1M4QFrIWGJ53YFr+29KmQzfeYKdkV
	hbC0Vf/icpSpgk4xax26C3CjToVIB080dCCQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:From:Subject:Date:Message-ID; t=1793583195; bh=CpinM/IpytUfD9vGKaPrjPR
	QBHB3wnZR9UZpr2lYAok=; b=ahT0ov6nqjyLUKHAef1k8x0sRIU/i+lGhXll4QNocx8+NrNfiV
	GTMEaQHFHpHpau6iFy4ulg3/xe87k1T4074qLY2hIg32ftWwcOyd04rKQHbI/LaWVHKeDD0IDAG
	2fQVu+53HEwhtNoHBKcq5fBVLjPlpPmcic1xTrxuhwq9KrNkZ2aAzXIXs9dmMHsn7V8/propmbC
	vMdbhCbVVbU9gWTdo2RuGwiXpRkfCXSZ2d4mQtxoZAlF8d/alam8T0uUhuEvFRPiM3Q55g9XwUz
	J30n2xgNQjaa1PR6T2eb4Gh9z1VGVwawn31elkndpC2fcmR8EoodCo2uwfvlC7t+kxA==;
Message-ID: <c539ae6d-8018-49ba-b4fe-8e52306c93bd@erebion.eu>
Date: Mon, 2 Nov 2026 02:33:14 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
 thermals
Content-Language: en-GB
From: erebion <erebion@erebion.eu>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-11-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192768@kernel.org>
 <dc96c6bb-0ac2-4f67-84b5-2284d37afa44@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <dc96c6bb-0ac2-4f67-84b5-2284d37afa44@erebion.eu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WErBOJk7ZUz3nYwJ3r0a4wP7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WErBOJk7ZUz3nYwJ3r0a4wP7
Content-Type: multipart/mixed; boundary="------------Ys9oJY5YtjJo4H0mWezlvqzT";
 protected-headers="v1"; hp="clear"
Message-ID: <c539ae6d-8018-49ba-b4fe-8e52306c93bd@erebion.eu>
Date: Mon, 2 Nov 2026 02:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
 thermals
Content-Language: en-GB
From: erebion <erebion@erebion.eu>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-11-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192768@kernel.org>
 <dc96c6bb-0ac2-4f67-84b5-2284d37afa44@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <dc96c6bb-0ac2-4f67-84b5-2284d37afa44@erebion.eu>

--------------Ys9oJY5YtjJo4H0mWezlvqzT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMi8yNiAwMTozNSwgZXJlYmlvbiB3cm90ZToNCj4gT24gMTEvMi8yNiAwMDo0NCwg
c2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4+IFtTZXZlcml0eTogTWVkaXVtXQ0K
Pj4gU2hvdWxkIHJlYXJfY2FtX3NlbnNvciByZWZlcmVuY2UgQURDNV9HUElPMl8xMDBLX1BV
IGluc3RlYWQgb2YNCj4+IEFEQzVfR1BJTzZfMTAwS19QVSBoZXJlPw0KPj4NCj4+IE9uIFBN
NjE1MEwsIHBoeXNpY2FsIHBpbiBncGlvNiBpcyByb3V0ZWQgdG8gQURDNV9HUElPMl8xMDBL
X1BVICgweDUzKSwgDQo+PiBhbmQNCj4+IHVuZGVyICZwbTYxNTBsX2FkYyBiZWxvdyB0aGUg
cmVhciBjYW1lcmEgdGhlcm1pc3RvciBjaGFubmVsIGlzIGRlZmluZWQgDQo+PiBhczoNCj4g
DQo+IEFoIHllcywgbG9va3MgbGlrZSBJIGNvbmZ1c2VkIGdwaW82IGZyb20gZG93bnN0cmVh
bSBEVCBhbmQgZ3BpbzIgZnJvbSANCj4gaW5jbHVkZS9kdC1iaW5kaW5ncy9paW8vcWNvbSxz
cG1pLXZhZGMuaA0KPiANCj4gV2lsbCBmaXggd2l0aCB2NC4uLg0Kcm9vdEBtb2JpYW46fiMg
Y2F0IC9zeXMvY2xhc3MvdGhlcm1hbC90aGVybWFsX3pvbmUzOC90ZW1wDQotNDAwMDANCnJv
b3RAbW9iaWFuOn4jIGNhdCAvc3lzL2NsYXNzL3RoZXJtYWwvdGhlcm1hbF96b25lMzgvdHlw
ZQ0KcmVhci1jYW0tdGhlcm1hbA0KDQpXZWxsLCB0aGlzIGRvZXMgbm90IGxvb2sgcmlnaHQg
ZWl0aGVyLiBJIHN3ZWFyIEkgZG9uJ3QgbGl2ZSBpbiBBbnRhcmN0aWNhLg0KDQoNCiA+PiBT
aG91bGQgcmVhcl9jYW1fc2Vuc29yIHJlZmVyZW5jZSBBREM1X0dQSU8yXzEwMEtfUFUgaW5z
dGVhZCBvZg0KID4+IEFEQzVfR1BJTzZfMTAwS19QVSBoZXJlPw0KDQpHUElPNjogVmFsdWUg
bG9va3Mgc2Vuc2libGUgYXQganVzdCBvdmVyIDMwIMKwQw0KR1BJTzI6IC00MCDCsEMNCg0K
UGVyaGFwcyBHUElPNiB3YXMgcmlnaHQgYWZ0ZXIgYWxsIG9yIGl0IGlzIHdyb25nIHdoaWxl
IEdQSU8yIGlzIHdyb25nIGFzIA0Kd2VsbC4NCg0KLS0gDQplcmViaW9uDQoNClhNUFA6IGVy
ZWJpb25AZXJlYmlvbi5ldQ0KDQpNeSBsYW5ndWFnZXM6IEdlcm1hbiwgRW5nbGlzaCwgU3dl
ZGlzaCwgTm9yd2VnaWFuLCBEYW5pc2gNClllcywgSSdtIGEgbGFuZ3VhZ2UgbmVyZC4gRmVl
bCBmcmVlIHRvIHdyaXRlIHRvIG1lIGluIGFueSBvZiB0aGUgDQphZm9yZW1lbnRpb25lZCBs
YW5ndWFnZXMuDQoNCg==

--------------Ys9oJY5YtjJo4H0mWezlvqzT--

--------------WErBOJk7ZUz3nYwJ3r0a4wP7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCaufoWgUDAAAAAAAKCRCOr0AybgKufVGu
AQCz0f0jMK0GnWAFp/H6WK+5cNCyhV2Lyb4MlysN7OAt9gD/erL2RUUqAkh027+zxA/9XyZhsYk6
U2Yy8LfTYaOONwk=
=QVpB
-----END PGP SIGNATURE-----

--------------WErBOJk7ZUz3nYwJ3r0a4wP7--
