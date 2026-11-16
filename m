Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870378;
	b=BhDyBGwnWC1EayAWKCP2xFoftIomb11hdI4JzvuKnSSKmeZN2e4t68DB1yCt+tJBXKe+
	 sgh5K70/2SF3B7HfXZbkJq696vBRAkkg+2BshPuSfy3M6a3IzqgMBLDzV/YX6smI9yeD+
	 VCjYVIyEeC69tYonBr3Q13MH/Q7C406ie1RTbPkXYmUpz3yqRsf3ArKTj09UN7AvpLz1a
	 CMqFpgzS9b5gi6fNCYbeflcR68pCfma6rRLG8KsglZq8hRGcXkZanhl7UQa4oBkyjvl/0
	 5wrJDBdUPEBRATbxzxO9rzTZiS0d7lKaunKfWhHW20+Cf5AcXvGOKqL3O533pn0kXLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870378;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=LHM7FMqACFjv4ZwBHsQeIcM6ZN+teopWaz/kRBEOQIk=;
	b=Z1P5NqFEILK4Q384eORptcIQOBbBBHUyn2R/xFFEOxeTEfOcTttKXyKS+xTY0wAJx914
	 Sgl9NW/Ay1NLiH0yFIMOe29RuZ6FcVg/ga1jD17ktIY+Da4hbqsxqLP6EiIEnDvmyAV1/
	 wqp+8wrz4nFnAhCCXFTjzi7Y2/i6waD1DrMC2RYjuFRmV2fz/03btPc2YqZqf3ok+xLs0
	 ZU24dEaUW9wIRR1lntGUQQjFZZG19GD9sMmgImk2R2Eox4KfbrDnHs+7OWYoY09f5bawt
	 vcd/DVOc4l+ZSy62KJYlAyR5n7+THXz/BnYDF3obZn9cCdLwKaLjyDzI6FbW5N8UoJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=aeHrwF6M;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=DPCw+d0F;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FEC606A331
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6FEC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=aeHrwF6M;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=DPCw+d0F
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870364; bh=LHM7FMqACFjv4ZwBHsQeIcM
	6ZN+teopWaz/kRBEOQIk=; b=aeHrwF6MUUEKpxCkKezbw9mPG22POT2adNeeHHmp/2YcbTmQ59
	m7a833VcYa2nEFwVVsxAdzEP5UKpOwYBlFDQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870364; bh=LHM7FMqACFjv4ZwBHsQeIcM
	6ZN+teopWaz/kRBEOQIk=; b=DPCw+d0FsJwQlkKUtqqP3EpL0HbmBz6IYWIXCWBKe3Xo0+myrZ
	ydQOgZ5lN2OuC8dmMRiTLw+BlLZmpONhkr7/wtkZjmniijSnOjB8bizcBeyvByuPRHWBFW+7n04
	LmvIB/7ztS4kahGfmc+HILIIrmKUZudHaBNRo5THdQC3qGYULvKMRRr/Kiy5FzRqVFRSZz6eHv5
	Nuy81y+J9IoZVjh3Rvqrryde2KSkjC4zE2MIm4MeNXUrwArS+fCgtfg8n3hL3LcoPWF5VFXqax/
	D8LFq1ubErShhIiFMYVKEvCrPLEsdRhSYD3zrOT/jjpDJkz0izy+eXxVio6cPkTMaHA==;
Message-ID: <9356bfb0-6647-4d43-b565-53900a70ba18@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:03 +0100
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
Subject: Re: [PATCH v5 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-2-7318a19806eb@erebion.eu>
 <sashiko-outbox-217823@kernel.org>
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
In-Reply-To: <sashiko-outbox-217823@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C0Iw8rdFMnU2V5WCD0VNpAbY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C0Iw8rdFMnU2V5WCD0VNpAbY
Content-Type: multipart/mixed; boundary="------------e56LvFC0Db6hHTCg2A906OSi";
 protected-headers="v1"; hp="clear"
Message-ID: <9356bfb0-6647-4d43-b565-53900a70ba18@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-2-7318a19806eb@erebion.eu>
 <sashiko-outbox-217823@kernel.org>
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
In-Reply-To: <sashiko-outbox-217823@kernel.org>

--------------e56LvFC0Db6hHTCg2A906OSi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTYvMjYgMjM6NTUsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBzaW5nbGUtd29yZCBoYW5kbGUgdXNlZCBpbiBTaWduZWQtb2ZmLWJ5DQo+
ICAgIHRyYWlsZXINClRoYXQgd2FzIGFscmVhZHkgZGlzY3Vzc2VkIGluIHYyIG9mIHRoaXMg
cGF0Y2ggc2VyaWVzLg0KDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBlcmViaW9u
LmV1DQoNCkFjY2VwdGVkIGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2VkaXNoLCBO
b3J3ZWdpYW4sIERhbmlzaA0KDQo=

--------------e56LvFC0Db6hHTCg2A906OSi--

--------------C0Iw8rdFMnU2V5WCD0VNpAbY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMWwUDAAAAAAAKCRCOr0AybgKufb1N
AP48vLgnSxgN0vBgP47LV2PhvZonIavu3F270W5EifnsJQD+JvwAo0dI6bymkRo/2OIhsm9DG3QL
7QtwBkEXrU1MUgE=
=mYnM
-----END PGP SIGNATURE-----

--------------C0Iw8rdFMnU2V5WCD0VNpAbY--
