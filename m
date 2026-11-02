Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622051;
	b=J4yNgk3QRinXp9+iFBsWFvlyIWIXr08FduLIPWM6ju87B7mLLpkUXU2HjWrJWNC9CaDp
	 EhuaWZngP9BdBXCVk6rAVdtzdbAVTapu94VK8C6UPzh6Y5o2jWge3gHMusFNCfxEsa0/P
	 NPOCylzDSZ98e+z1JyDuf/SS4wZ2H4rq0+nCGKJJRWFUAQvu3X+Wp6M0VsyU9dDR38xky
	 xTI98JiFIEhsrTthynr/XYUNAD8rCHIBnJm1FQdWfBnyvRBZqAbhC/2tBKElLCI2cPehs
	 TUsYzX5N+pZuS/uiXF0iXqNBgxNspBavkZqTfI8PQZzMp0Id0m6m+5o+SIchVfPC1KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622051;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:From:To:Cc:
	 References:Autocrypt:In-Reply-To:Content-Type;
	bh=RtKTi6lwJ4fch5OCeYjhsg7s4+EyI/ILJ6qlxyxa940=;
	b=PJR5UPu8A1nAG+qwVdRcf0fgoHY8kQA9YNj8PspY9V4hfTY0iy299ucMSPsn5i8D+EaL
	 t8LItEl/1hFZ0wINM4zwVu0fPNL7FCbGZJ7HPKwmVpuiBshC8kApb14iuZO1U2E7kDmqt
	 0Ypx8WK2O63k4SWT8kaBbDWKgwF2nIvM/AoAA1Ij1h5iCH+gHQCifxDS7uZk/BIF+t2KU
	 qnZauhF6ujHm5fOVNvjpbrx6Fc7xr//qVgk7wbGLQxovcsuduY0eZADUiHIafCt/kWdUx
	 Hysz++Es7K00vtSqqIoGofA5eLQ8N0f+PGZm8qM2lfOG/8nipNU7ahsIh0kqVXuGdcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="z1+4/uer";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=r6zqq8BD;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE313606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE313606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=z1+4/uer;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=r6zqq8BD
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:From:Subject:Date:Message-ID; t=1793622036; bh=RtKTi6lwJ4fch5OCeYjhsg7
	s4+EyI/ILJ6qlxyxa940=; b=z1+4/uerr8cHYL1w6+Hv/p/kkYlVfJlMWKncQX+mYIFDKRkmci
	sN4xEMwPGuW23h+fVzw0bMdvkKGnD4maXSCA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:From:Subject:Date:Message-ID; t=1793622036; bh=RtKTi6lwJ4fch5OCeYjhsg7
	s4+EyI/ILJ6qlxyxa940=; b=r6zqq8BDiz3b02+Tw4UQML7SPnfxxQV6gjUrgJxdvLag5rTLZ5
	5KrrW28YcPyxWGDdpJHaziIMzqsgGcRtv36O9V37X2MF+wg5/j/9KZVz2X9yWOBeM7eNlj8tXWn
	2ThYmzSEZ4T5Hk5L7f35k+gU8V06vgEBCUuN5Blsjw7Zev8MjNjtjz1CKFd53Ch3fQORsWUU8kN
	0Gqd2oPlsX+P5xd+f75m3zKADbqKlqwRk1lE/VTPySa57JMCXbLcIWTV0Z/JEqleJ9M3nLqXlsD
	Q7hZpSyduV0MQQN9l6e07lF0uzuNfnGEoOh3AXAb5WFXlcAj17CvWfgFEYavmWkDVag==;
Message-ID: <a29b9e58-996c-4e94-b121-106e4bc17237@erebion.eu>
Date: Mon, 2 Nov 2026 13:20:36 +0100
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
 <c539ae6d-8018-49ba-b4fe-8e52306c93bd@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <c539ae6d-8018-49ba-b4fe-8e52306c93bd@erebion.eu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UOqc5Wh3bge3NTajNydAHPsn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UOqc5Wh3bge3NTajNydAHPsn
Content-Type: multipart/mixed; boundary="------------H0BohUyAyRGKbi8hEbhSKGjo";
 protected-headers="v1"; hp="clear"
Message-ID: <a29b9e58-996c-4e94-b121-106e4bc17237@erebion.eu>
Date: Mon, 2 Nov 2026 13:20:36 +0100
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
 <c539ae6d-8018-49ba-b4fe-8e52306c93bd@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <c539ae6d-8018-49ba-b4fe-8e52306c93bd@erebion.eu>

--------------H0BohUyAyRGKbi8hEbhSKGjo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAxMS8yLzI2IDAyOjMzLCBlcmViaW9uIHdyb3RlOg0KPiBPbiAxMS8yLzI2IDAxOjM1
LCBlcmViaW9uIHdyb3RlOg0KPj4gT24gMTEvMi8yNiAwMDo0NCwgc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyB3cm90ZToNCj4+PiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4+PiBTaG91bGQgcmVh
cl9jYW1fc2Vuc29yIHJlZmVyZW5jZSBBREM1X0dQSU8yXzEwMEtfUFUgaW5zdGVhZCBvZg0K
Pj4+IEFEQzVfR1BJTzZfMTAwS19QVSBoZXJlPw0KPj4+DQo+Pj4gT24gUE02MTUwTCwgcGh5
c2ljYWwgcGluIGdwaW82IGlzIHJvdXRlZCB0byBBREM1X0dQSU8yXzEwMEtfUFUgDQo+Pj4g
KDB4NTMpLCBhbmQNCj4+PiB1bmRlciAmcG02MTUwbF9hZGMgYmVsb3cgdGhlIHJlYXIgY2Ft
ZXJhIHRoZXJtaXN0b3IgY2hhbm5lbCBpcyANCj4+PiBkZWZpbmVkIGFzOg0KPj4NCj4+IEFo
IHllcywgbG9va3MgbGlrZSBJIGNvbmZ1c2VkIGdwaW82IGZyb20gZG93bnN0cmVhbSBEVCBh
bmQgZ3BpbzIgZnJvbSANCj4+IGluY2x1ZGUvZHQtYmluZGluZ3MvaWlvL3Fjb20sc3BtaS12
YWRjLmgNCj4+DQo+PiBXaWxsIGZpeCB3aXRoIHY0Li4uDQo+IHJvb3RAbW9iaWFuOn4jIGNh
dCAvc3lzL2NsYXNzL3RoZXJtYWwvdGhlcm1hbF96b25lMzgvdGVtcA0KPiAtNDAwMDANCj4g
cm9vdEBtb2JpYW46fiMgY2F0IC9zeXMvY2xhc3MvdGhlcm1hbC90aGVybWFsX3pvbmUzOC90
eXBlDQo+IHJlYXItY2FtLXRoZXJtYWwNCj4gDQo+IFdlbGwsIHRoaXMgZG9lcyBub3QgbG9v
ayByaWdodCBlaXRoZXIuIEkgc3dlYXIgSSBkb24ndCBsaXZlIGluIEFudGFyY3RpY2EuDQo+
IA0KPiANCj4gID4+IFNob3VsZCByZWFyX2NhbV9zZW5zb3IgcmVmZXJlbmNlIEFEQzVfR1BJ
TzJfMTAwS19QVSBpbnN0ZWFkIG9mDQo+ICA+PiBBREM1X0dQSU82XzEwMEtfUFUgaGVyZT8N
Cj4gDQo+IEdQSU82OiBWYWx1ZSBsb29rcyBzZW5zaWJsZSBhdCBqdXN0IG92ZXIgMzAgwrBD
DQo+IEdQSU8yOiAtNDAgwrBDDQo+IA0KPiBQZXJoYXBzIEdQSU82IHdhcyByaWdodCBhZnRl
ciBhbGwgb3IgaXQgaXMgd3Jvbmcgd2hpbGUgR1BJTzIgaXMgd3JvbmcgYXMgDQo+IHdlbGwu
DQo+IA0KDQpPaCB5ZXMuIE5vdyBJIGdldCBpdC4uLg0KDQpJIGNoYW5nZWQgcmVhcl9jYW1f
c2Vuc29yIHRvIEdQSU82LCBidXQgbGVmdCBhdCBzZXQgdG8gR1BJTzIgaW4gDQpjaGFubmVs
QDUzLi4uDQoNCndpbGwgZml4IHdpdGggdjQNCg0KLS0gDQplcmViaW9uDQoNClhNUFA6IGVy
ZWJpb25AZXJlYmlvbi5ldQ0KDQpNeSBsYW5ndWFnZXM6IEdlcm1hbiwgRW5nbGlzaCwgU3dl
ZGlzaCwgTm9yd2VnaWFuLCBEYW5pc2gNClllcywgSSdtIGEgbGFuZ3VhZ2UgbmVyZC4gRmVl
bCBmcmVlIHRvIHdyaXRlIHRvIG1lIGluIGFueSBvZiB0aGUgDQphZm9yZW1lbnRpb25lZCBs
YW5ndWFnZXMuDQoNCg==

--------------H0BohUyAyRGKbi8hEbhSKGjo--

--------------UOqc5Wh3bge3NTajNydAHPsn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCauiAFAUDAAAAAAAKCRCOr0AybgKufeWj
AQC6bMozBSjMpiz13+tQE4l6j7IzqEmspS3fqYiRBWgZWwEAj2e4BQfdRcPZ7n2y819AWMUTHsoM
WHupSm0JNSWG2AE=
=kwDt
-----END PGP SIGNATURE-----

--------------UOqc5Wh3bge3NTajNydAHPsn--
