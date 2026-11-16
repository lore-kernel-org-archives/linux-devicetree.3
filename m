Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870468;
	b=qFlvMmPBqxO97u5vcxWbrWL5lZ7HK1SGrUSmwKlbcegJosFik+nDz0U4G7+rsGIXQPor
	 1ZaRpwxlG4+u9JNN+OXfNiunNL05h/ly33Mb275HKXyCBEXvHtiZmsXNe6kJyFU7RxmXI
	 OWYHFUhDzmI4hb/3lNAiaZ8LFyG0ZnNctw+H357XlgUv/FB1Y/WGjpQUCQ+yg7t+oLSBZ
	 A5u0Yv4NZS63itdueBLYMKH/63K0U19EA5uqaPctXkOLGwml0YzvYzApo955Mk/OHZSn2
	 HSzmFrkAtroWUE5u+YJYjt2e44d8jdWZv93BZxmP7Vb/dhzpKveJ9dzbCkC2Bfl4Hpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870468;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=8+3U529qd98YQA4pnP8Fc2UR/OHyX4N7wio2v6kJcCs=;
	b=1YVwULyWmZgwKLnuRRcJI1OKaZorDrUeBPMuNzF6k/sAKC79rw4X6TA+vnfmE9/rMZSJ
	 V4TuN/6O0UXbXP2lK0pp/diYcaSuN7wicU5JIQsmIv0ldJnFST25Y/Hk+/E6qfMhI7ha7
	 CEQxnTsoKuMKybSteHFt5VWxkF0s8ZcIZ53BCqMkSItE7vcfoItKlmK93iuOxYHfTrTkk
	 8qOg2ntXFJ3sOznY2t1rIkwJOtBswsf2bu8N+3XDl1EH0wQ+aMIX43lcS0NZiyeV/w0nM
	 XZCluNT3ii76pkPzCbHXcdEQOU5Jv2GVy32Js6+4zbynRBYIL9Vm0Ek3Abl5yHF/4BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=60q11bcJ;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=ooCejUep;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB267606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB267606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=60q11bcJ;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=ooCejUep
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870464; bh=8+3U529qd98YQA4pnP8Fc2U
	R/OHyX4N7wio2v6kJcCs=; b=60q11bcJiNMgCW+li2uUR8ofFJeC6OOl5bTBk3miDpXMF1dPiy
	MMpvSUahT1Z4Wk3F7WaHl6aNPEGaohKUShDg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870464; bh=8+3U529qd98YQA4pnP8Fc2U
	R/OHyX4N7wio2v6kJcCs=; b=ooCejUeps+mWMliB0nJ+m8yBz1LWyIVXPhaS0PmB+e9wAUgiJ9
	FlU2flXs5KO1+Q3A4Nn3jd5DB3Ci3Souf9G0oWP6UpnvwSCtX8QDV7eH4alNocYzp5vqK13OwNH
	wWtg4CWZqlomhv9kFnFCuimGHojR0kPe4jRAfp+NZltHzWg8weG+9fYJffyIsAY23VGoRo007BO
	ziu4zkDHK19BiCsbHNuff2YN717w64d7i2ReQ2Utbjed5STQXKxFGZW8WELqhk8DkyzAh0Xe1Zc
	nYxwIVlpx7Zf3OSmhwQe2hqWopW+KM8x62l7oFXvfwi0I7PHm4QeGPX5We/qk1TRN/Q==;
Message-ID: <65722de3-1a7a-4be4-87c3-db553ffe3f02@erebion.eu>
Date: Tue, 17 Nov 2026 00:07:43 +0100
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
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
 <sashiko-outbox-217832@kernel.org>
From: erebion <erebion@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <sashiko-outbox-217832@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5WWZRXgWmTAmybL0yLwsA4Su"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5WWZRXgWmTAmybL0yLwsA4Su
Content-Type: multipart/mixed; boundary="------------JjcnBEAqzdKFJPiL08fgFnv0";
 protected-headers="v1"; hp="clear"
Message-ID: <65722de3-1a7a-4be4-87c3-db553ffe3f02@erebion.eu>
Date: Tue, 17 Nov 2026 00:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
 <sashiko-outbox-217832@kernel.org>
From: erebion <erebion@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <sashiko-outbox-217832@kernel.org>

--------------JjcnBEAqzdKFJPiL08fgFnv0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTcvMjYgMDA6MDAsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBTaWduZWQtb2ZmLWJ5IHRyYWlsZXIgdXNlcyBoYW5kbGUgaW5zdGVhZCBv
Zg0KPiAgICByZWFsIG5hbWUNClRoYXQgd2FzIGFscmVhZHkgZGlzY3Vzc2VkIGluIHYyIG9m
IHRoaXMgcGF0Y2ggc2VyaWVzLg0KDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBl
cmViaW9uLmV1DQoNCkFjY2VwdGVkIGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2Vk
aXNoLCBOb3J3ZWdpYW4sIERhbmlzaA0KDQo=

--------------JjcnBEAqzdKFJPiL08fgFnv0--

--------------5WWZRXgWmTAmybL0yLwsA4Su
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMvwUDAAAAAAAKCRCOr0AybgKufSkB
AQDtYQbjaZLozYYTWk/wQwfYDg0In3HWNYsKheTxEPQIWQEAmYKeDShJC1rsttQcFnOWzd+tF7Bd
FOSYQiXbBiw2zgg=
=Uzh6
-----END PGP SIGNATURE-----

--------------5WWZRXgWmTAmybL0yLwsA4Su--
