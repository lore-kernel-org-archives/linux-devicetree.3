Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870393;
	b=AQ772fID7lQajXyCfGOPFEzEPSY/ELAniGo8e/VbJjnhJkI0CFoklGrZtZfo5HRD8GPQ
	 bFmFXMJvfHmk7cHkHKr26YsvS0BhfqDNEUfLk08qFRL1agw8mO7wU0cLBJbPHmDAhBYP+
	 glTRL3CO0yAVDZ+fST0zmH08UsTj9lGLkW1vbvqwCzrKTILSusae5/o3adtrptkKpM0SU
	 WZbED5zw80b0LnY+qCjkrb06Lh0t2Zbyn8TuCglGhjwvhnykwIIu9KIezQAxZ44MouvCm
	 SNcgBUwdf3yXdlfz7jtIWojyIz4H+5gGnpnb6zgmPcZTWx8A6Ng0HlVCNSxrwJleszw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870393;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=2hMZLJA5E2nVyyEpRvgzw1ttFTQKHQbhJeeZU/8aMAY=;
	b=YcRmny6XuSGOv1UDtog3fc57VaAd98tF5dQs8uA5po5p3/EMHmgCTIwJRUf/Nqeeouip
	 p10JbOxK5vKl5EzUU/TPiAc0dy2/cszp23RfWeqz9KzTi8LM7dJPVIvXkjCyVvurjRhzR
	 JCkaMpWxhMRTE6wobEtFfY66DUt86aHl9S0+D6sCMnMS1YJ2B7zOErDOa3/uJhr+6rFUh
	 KZCLDeUPOBizohBZ9I5r8pRDAEqvYASPanZnPQKxlDUxk6wBTJE9r0qANXhMA83hsiMh0
	 2GNQ/GTvGKg/KEb7lcVKAphIRHmSyRWkDUgQqMQ+OZKuJ8MLAISZn0dsF/+Ry1Aa1jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=fi+FhrZx;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=pr4yfOdl;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28613606A339
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28613606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=fi+FhrZx;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=pr4yfOdl
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870391; bh=2hMZLJA5E2nVyyEpRvgzw1t
	tFTQKHQbhJeeZU/8aMAY=; b=fi+FhrZx8PgtIctAjJXmLjj+6ZsJoaelxjZJkutRNDZMMCaa8n
	SInLKbXCxv2803cHhbpteWLSFQju4lVR3nDw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870391; bh=2hMZLJA5E2nVyyEpRvgzw1t
	tFTQKHQbhJeeZU/8aMAY=; b=pr4yfOdl/dIFcVD2aBJFJJSmU89mghZL9I1fDgqfCQ+cHtGZWV
	keWVDWJHTwSxNRiZPnj1CjpFxl6eRA5aJeP5b1CqQf0eKHYbs3A7OajS0Uz9BooyImgerr3S17i
	dnUau9Y7deBxyTpVGXUAH4cwsH4uKCyitf6FgEENS0RETbWn0zu0ix39XHb1TrjbjvVlZeFGWw/
	zr8C3Ndv6p/+YfMwMbb8Iyzew3yZnVOIV0Eujh1SdPYY4WrIg4YZz/rtJIV2PHnEWDeKLM+MZc6
	+DHlYDnf7YLvnG70pE/L/0a+H7zwlTckqDG0qIzxgfMD6X4FVJ+eOiZJUzrkzHSmVGw==;
Message-ID: <0eb630f6-dc31-4300-a105-a0c74c6cbddd@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:31 +0100
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
Subject: Re: [PATCH v5 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
 <sashiko-outbox-217826@kernel.org>
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
In-Reply-To: <sashiko-outbox-217826@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UVhvaGHvk5M3qS8js8orDHV2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UVhvaGHvk5M3qS8js8orDHV2
Content-Type: multipart/mixed; boundary="------------Gxec85njpFUkzUlwM0smqxVF";
 protected-headers="v1"; hp="clear"
Message-ID: <0eb630f6-dc31-4300-a105-a0c74c6cbddd@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
 <sashiko-outbox-217826@kernel.org>
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
In-Reply-To: <sashiko-outbox-217826@kernel.org>

--------------Gxec85njpFUkzUlwM0smqxVF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTYvMjYgMjM6NTYsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBTaWduZWQtb2ZmLWJ5IHVzZXMgaGFuZGxlIGVyZWJpb24gaW5zdGVhZCBv
Zg0KPiAgICByZWFsIG5hbWUNCg0KVGhhdCB3YXMgYWxyZWFkeSBkaXNjdXNzZWQgaW4gdjIg
b2YgdGhpcyBwYXRjaCBzZXJpZXMuDQoNCi0tIA0KZXJlYmlvbg0KDQpYTVBQOiBlcmViaW9u
QGVyZWJpb24uZXUNCg0KQWNjZXB0ZWQgbGFuZ3VhZ2VzOiBHZXJtYW4sIEVuZ2xpc2gsIFN3
ZWRpc2gsIE5vcndlZ2lhbiwgRGFuaXNoDQoNCg==

--------------Gxec85njpFUkzUlwM0smqxVF--

--------------UVhvaGHvk5M3qS8js8orDHV2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMdwUDAAAAAAAKCRCOr0AybgKufb9D
AQCOWzqhXJtm03smLT0dGFMiesohwEamlkB7DZK1loIItQEAmND50pB5gr2NxU/XRoofOn89XSuD
Wa9Z3JceFQF9Pgk=
=hwP5
-----END PGP SIGNATURE-----

--------------UVhvaGHvk5M3qS8js8orDHV2--
