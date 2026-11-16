Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870488;
	b=IAMvjii2k1jk9jz3m9t6+D7rvq3gsDLYFpA7rnReKotUU2XaxtuZHiET9wP+pm3QYzsy
	 SK35X+qDUsdlTOrDoZOyfxGHX9FCAEjvv2sNcrBJsEK5um2X8A2LINlreh3HE8ND7icvE
	 vojYsKC+UD11nDlCBWsG+W7vCqn+BsJPqIjyOSPHiwDazpGi/ajJceO8hBbZg0VwqirYh
	 GahWP3x/OSZVVEu9XZPEmTuvCe0TQUOw4Cvj4nNWd2eGnQu2Q/Pfg73Re2mWc+v9H6HYk
	 VSwF4Ft77nhQKnPApOHOgRslGhS+JNDNKZd7UTub320wGXc5/JyygcVNMV+ROmuNXQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870488;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=9aNwN68lRN1fwqP/2UBNkUUK/b59LmcDO1GHfggdOv4=;
	b=KNXdYtwEoQVVhliKcV/JgSxKs5vD/kd+8CPEsyI2LE1dFsh7emO4fFcF1sH6kak71JaT
	 Y9jcOD+ak9etluLn+E7WJ0pcHpW1zt5LC/A5AbUcmW7wmpZssDlCLSd5MBeFpeN25xBpT
	 Q1R5C2MOTxcWr2Z0zdnqQKktePfDSYqdcGYOG8t8eZFW8YhwL0SxGHPHsaQdSElNM7olC
	 mdrgAGOZIheie/Eom+mnYTDZFSlft2dThH4ey86R0030Nxh6NbPhsKhrn1bn5NzZ6lv+A
	 02WAlgQvoPXGofMPg/zTcIIBVdjAZz/wc2CzNZ/aQDHKrpWO9KBIDzVO+V3jCO08XDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=X71u4DUl;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=LBVaY4Lw;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE62606A33B
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE62606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=X71u4DUl;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=LBVaY4Lw
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870475; bh=9aNwN68lRN1fwqP/2UBNkUU
	K/b59LmcDO1GHfggdOv4=; b=X71u4DUlycqxtV5W1b6HBj8Ja1idQBeVNF6R38KVOYlkpqHD/2
	Ck1FDDlL7zMrP52aKebmhNPbRKTZwzF4ZmCw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870475; bh=9aNwN68lRN1fwqP/2UBNkUU
	K/b59LmcDO1GHfggdOv4=; b=LBVaY4LwYV2F7s8XUI9/LWSqf+62rg7Aid+KhVhIeYftqQbHs+
	0Rzg5lxcjHIT/dKgJ8Xy8Vd5+t8A4u2tArGSKVLJLfZ6GENeRMOJ4ivg9cgi8CnjnCXJmD9osBz
	4sb9b14cehaWDcEQ8C3pscGTA83JwZ7Tc4DUjFdXdazynUgyQuGZ4ARvLl1eW3hz9cNTk7yhWrn
	Orj9mUzre0ezhChljgCu59dnZ0D5GC+dTnb4YDNoqqhwxLIaoO13OvA3AiwXmA6KLJvgUGs272u
	uMn3Zym8gPtQ0vsY9VhuU3EmuZUDWHvPA7MYFfeD5Td3LKdVwbM6D6As4hOla4DKk3g==;
Message-ID: <ff6cffb9-56fa-45c1-8631-96c6fa5646d7@erebion.eu>
Date: Tue, 17 Nov 2026 00:07:54 +0100
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
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-11-7318a19806eb@erebion.eu>
 <sashiko-outbox-217837@kernel.org>
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
In-Reply-To: <sashiko-outbox-217837@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wUusbU8AqlzMnfGvnPIFQ6um"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wUusbU8AqlzMnfGvnPIFQ6um
Content-Type: multipart/mixed; boundary="------------OGaPzVCDlJsZ6028o91o2k1J";
 protected-headers="v1"; hp="clear"
Message-ID: <ff6cffb9-56fa-45c1-8631-96c6fa5646d7@erebion.eu>
Date: Tue, 17 Nov 2026 00:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-11-7318a19806eb@erebion.eu>
 <sashiko-outbox-217837@kernel.org>
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
In-Reply-To: <sashiko-outbox-217837@kernel.org>

--------------OGaPzVCDlJsZ6028o91o2k1J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTcvMjYgMDA6MDIsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBzbTYzNTAtbGVuYTogaGFuZGxlIHVzZWQgaW4gQXV0aG9yIGFuZA0KPiAg
ICBTaWduZWQtb2ZmLWJ5DQoNClRoYXQgd2FzIGFscmVhZHkgZGlzY3Vzc2VkIGluIHYyIG9m
IHRoaXMgcGF0Y2ggc2VyaWVzLg0KDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBl
cmViaW9uLmV1DQoNCkFjY2VwdGVkIGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2Vk
aXNoLCBOb3J3ZWdpYW4sIERhbmlzaA0KDQo=

--------------OGaPzVCDlJsZ6028o91o2k1J--

--------------wUusbU8AqlzMnfGvnPIFQ6um
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMygUDAAAAAAAKCRCOr0AybgKufZuZ
AQCBG0YTMqMCqbjtcag+2Qxlgz+BC4R2niNCXenJfVk54wEAj3YKkIEvzwEhR/36PRPP/n2zcfc9
3bodKKFagdjctAw=
=uL6p
-----END PGP SIGNATURE-----

--------------wUusbU8AqlzMnfGvnPIFQ6um--
