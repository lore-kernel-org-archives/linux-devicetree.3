Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870442;
	b=Mm3FTRVQ3oiUzoqNTTsL7ED/PgFpZPTGOpvcQjLJwz8S/nTfBMcUPiUou/WV4IblaeBt
	 8u4TGFHjkLXPZcGoJz6lyxfWwKNB/TeCaAzyx726zry1P6l1acFGnEg6o9HSqg4eYnph9
	 uxR5ZY1YLvwQLV1762EAPQHbEtRP8ZTBsLd0rJMKYk1g+c2qMSjc9R+vsFIiEmZovMAsf
	 OkrrtwVuLK7B3mRWGeQ+z9rKWVIbXwXFCJG8BhFQWmfXEhgW9eIslGFsllOegV5KU/2Yj
	 9PIgDMhPnQCYWYAQkvVDOphI1pkv5D/VzFAbfhPVQqgB+TX2HkbCuPCiMpAmKr9DNxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870442;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=4+P1fCiW4RYiVUwbtG7d1XDUQaST497qdIZJ/BlhnEE=;
	b=NxIAe/8+Gb6+SIWCUMGnJXMr3XWPMp2K+pXcQ9FxJuX+0G/oRTgbgbI47T0JWVcA0kRU
	 gQ3PHX/WbK13Wkm7yWyiW9LrLw2icbqI4PTQcjaoLbH6bFbOyx2a8Q1ckZ3e/DyV8gPW1
	 R6V7mXDhiIY0Ynj1HJ2YuhVXCnmhRoGda3IuvGRG5BOZxS/xdtsYKZm+v2pI9DAeaEwcu
	 yvLLoLN9jd/Jhk1MY6WbfRUxDRVTOBxd/VR2wNO4RQZi29W/UucXXu6JuWF9Ei2/VCThd
	 DVSefjKf3obf6VGligSam55jbXKfLq7Xcpczr8PKz5aEMcPW8p0JqI3Eqq0uCivTj5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=xKGVSKxR;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=awW91TEd;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2198C60A380C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2198C60A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=xKGVSKxR;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=awW91TEd
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870436; bh=4+P1fCiW4RYiVUwbtG7d1XD
	UQaST497qdIZJ/BlhnEE=; b=xKGVSKxR8ANxO2WmriB6uXmscUPPAGTueQ7hOSoEctiq7eFRm0
	GVDVSxWpxKSGCIbYyT7U4g52TsMMBRxR4oDw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870436; bh=4+P1fCiW4RYiVUwbtG7d1XD
	UQaST497qdIZJ/BlhnEE=; b=awW91TEdMAGVQbce3nISYLWtRZClMxo+SaWCy+1z/HialtRCGU
	Un3kVqVqWOPloORUEHaL9YoiFoFNS6LrxnIZOQxOb3tMZbSdgWFrJ5cMrr7g1HTiksYWxsC82F1
	AEmacI0wT9ozvuuU/BFd4Qz8HBtPlGkjojuIQGNyaQWKQB1+urN+fOeGV7g0WaKYv6rf4GSewYq
	0Q2wbmRTYCvYy0sw3dqxNx4SwKeyzgum77sp/UzY4oNjJerC8I3pAlL/Ktv3iOjHv8YwNIIpM5W
	bt/EDuhADpHXeLWuliSLhqGnF7+QGL+DvOQWxTJR6DvTw/BnKty0r/ZZMUzTDpbP++A==;
Message-ID: <0effd796-807c-418d-9b1b-3471380af291@erebion.eu>
Date: Tue, 17 Nov 2026 00:07:15 +0100
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
Subject: Re: [PATCH v5 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>
 <sashiko-outbox-217835@kernel.org>
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
In-Reply-To: <sashiko-outbox-217835@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ANJ2KaS3l4Q5K8oMWnaeS9ti"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ANJ2KaS3l4Q5K8oMWnaeS9ti
Content-Type: multipart/mixed; boundary="------------WyLB3blXW0OC278RUK1o37OX";
 protected-headers="v1"; hp="clear"
Message-ID: <0effd796-807c-418d-9b1b-3471380af291@erebion.eu>
Date: Tue, 17 Nov 2026 00:07:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>
 <sashiko-outbox-217835@kernel.org>
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
In-Reply-To: <sashiko-outbox-217835@kernel.org>

--------------WyLB3blXW0OC278RUK1o37OX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTcvMjYgMDA6MDEsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBpbnZhbGlkIGhhbmRsZSBpbiBTaWduZWQtb2ZmLWJ5IHRyYWlsZXINClRo
YXQgd2FzIGFscmVhZHkgZGlzY3Vzc2VkIGluIHYyIG9mIHRoaXMgcGF0Y2ggc2VyaWVzLg0K
DQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBlcmViaW9uLmV1DQoNCkFjY2VwdGVk
IGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2VkaXNoLCBOb3J3ZWdpYW4sIERhbmlz
aA0KDQo=

--------------WyLB3blXW0OC278RUK1o37OX--

--------------ANJ2KaS3l4Q5K8oMWnaeS9ti
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMowUDAAAAAAAKCRCOr0AybgKufV6P
AP4ymyYJp9rHLINthT7+WBvPh09sPTh1M+z8QJ3i6NHdhwEA7eeANfQIgYn/+fInBbQ0w6JuoxJs
7km2P2DFhM/KBwU=
=VycR
-----END PGP SIGNATURE-----

--------------ANJ2KaS3l4Q5K8oMWnaeS9ti--
