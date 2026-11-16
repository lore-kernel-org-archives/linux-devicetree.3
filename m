Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870503;
	b=Qaaq6wJmhGzinvm0yyVdX6VO52kV10xx+tOFnu7wk7S4Ig5C//PlNZvCnpoJHkxsAQwX
	 CW5kyO7aR9eCIGXpfZPZiEwpH1IRl7hGr8TKzq/Rr0J5dJgpuq1FxBk02njVzR/UVWxpL
	 b80iY3nwd9dILmEJSmISlcfx9dcbcH38SPlXSihw/xvTKBoiCVe9ulQGKirxa5Wb6krCp
	 Gsfg/Vk6rJXR61FleKyTQYWr/JlY5nMd47HLq9/opokqfkSWR7YLub9/g/wtZefWiFwNK
	 vSjIkBd/p28KSIdgKXeQrSSldY92FukcTo1kXtm9jaerAcGTvA8uTqt2TTvZ/m4pBXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870503;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=afPBzVWS7N4ap4n8fQaMs/ueVkncNvOW/sPNK44j9lQ=;
	b=ctUc9fjg2MaBIkHvE0DC/sMThhbTvO24gArDACHmBMObmP3yhepOSdw5zLUBWGpdlIqn
	 XpW2p4ygoMksPIKUyLy/O5og3Pb4yYNIVJIOFT/dXGNfN/gdML63hx604Iavk3LqOJZVo
	 DBoPpWAJDBez4mMjmdoF0/PtWRBtjkKS+cKarndu1mGfwPWkotPpQW+zmGMgAVkIJPyOW
	 cyqxk5OrFWGQF3RKlDdPZmueLGEfWdZwypAobGidqYRaaQBdvmtRbik+2DJjTqVbl5l/E
	 S6+Mh//isDcZvK7nhA0JyzofPJysxwnFqJgjY+ntlZuLS+Txumqp/kANNid86yFuw+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=JfHfsdl0;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=EDgHeiV2;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88088606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88088606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=JfHfsdl0;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=EDgHeiV2
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870490; bh=afPBzVWS7N4ap4n8fQaMs/u
	eVkncNvOW/sPNK44j9lQ=; b=JfHfsdl0Qc2W5CpKu6/27xrbD5z3GkV6adBL1DXx4xwXdAw1HQ
	MhhAAPVEH4lWd+maVXumtT1OoZwyb5KUz8Dg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870490; bh=afPBzVWS7N4ap4n8fQaMs/u
	eVkncNvOW/sPNK44j9lQ=; b=EDgHeiV2MQfvx4i6RdNpqQP3rZbxTm7Y0dc+ToVm9D0AgH0f61
	lY7wyzZZkXapxPFp5sUg3xiIEa9CdPoPwkqTmwWtx931kahmR1dfkQ/Sh6nD7eySsxRN/gHfzbm
	m0DYpHiM86ElBsvJdTQEd5fc22BTBStZo2Vic9ZnQo7jyQ2VsjBOpeBwGJf7fowHxT87t7M76JY
	dFVh2NThO4RGdWvLpNFqx0KpbXmG1mhfRniAawQI6coXpAFCcF4767ve0MVDnNRhBbbjl9GQ0Vp
	HEMIGkd2B5rqMfMZZ0q6rBzXyoxPLTP4Wv8SIMXJvUNG0lpGPJs1SwapFF0/ql4YsDQ==;
Message-ID: <6a4eaa63-3e5a-4368-9ef9-da090170df22@erebion.eu>
Date: Tue, 17 Nov 2026 00:08:09 +0100
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
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
 <sashiko-outbox-217831@kernel.org>
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
In-Reply-To: <sashiko-outbox-217831@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3D3n7Jn46dFcaDMtJBeaf13T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3D3n7Jn46dFcaDMtJBeaf13T
Content-Type: multipart/mixed; boundary="------------4GH7kgcIwElKmAHAAFaW4o5l";
 protected-headers="v1"; hp="clear"
Message-ID: <6a4eaa63-3e5a-4368-9ef9-da090170df22@erebion.eu>
Date: Tue, 17 Nov 2026 00:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
 <sashiko-outbox-217831@kernel.org>
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
In-Reply-To: <sashiko-outbox-217831@kernel.org>

--------------4GH7kgcIwElKmAHAAFaW4o5l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTYvMjYgMjM6NTksIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBoYW5kbGUgdXNlZCBpbnN0ZWFkIG9mIHJlYWwgbmFtZSBpbg0KPiAgICBT
aWduZWQtb2ZmLWJ5DQoNClRoYXQgd2FzIGFscmVhZHkgZGlzY3Vzc2VkIGluIHYyIG9mIHRo
aXMgcGF0Y2ggc2VyaWVzLg0KDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBlcmVi
aW9uLmV1DQoNCkFjY2VwdGVkIGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2VkaXNo
LCBOb3J3ZWdpYW4sIERhbmlzaA0KDQo=

--------------4GH7kgcIwElKmAHAAFaW4o5l--

--------------3D3n7Jn46dFcaDMtJBeaf13T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuM2QUDAAAAAAAKCRCOr0AybgKufaXz
AP9iNihjDLOMEO9fjt7pw/jqYearktPi6wFlnTD0XWSGyAD/UEOyd6BFy9PK+/U+HS717YJiIGF/
9zB0piO9VfsAUg4=
=k6Sb
-----END PGP SIGNATURE-----

--------------3D3n7Jn46dFcaDMtJBeaf13T--
