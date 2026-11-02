Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577943;
	b=gO2EJf7Ra0FgCz438wqOODhIDyPFw1qH3bTDrOiQRd90ruEqT3dV61PIzx5UKmeMCsRO
	 9X4zOoYd+U/lfQBkc7arC569XvYgZWT80YWm8+h0Yycdq/aILQerC72gCb4AYX4BOrQgK
	 3QY5wxNrLn2WrAjg9K/z6NM+X2LOANvCz3BC/+fDwIJihaLboNBa9V+yQNKmjeoW0iea7
	 sbBSPkmOwV8gusRq0GgDutCXBUK4CJNEUsbQOHLWjiLnn9DZBO8z+cwN7p+QtG73Awbi3
	 DliaGan0hZD74AlK+TrNO2/Q6mhUFfss9Bu39HxxcD1ImWMk9I+3Ol0tOSMssRxUBRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577943;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=Zyp6Ql5N1rWlYxuROJ0el25M0bYgmu9qE6tE4Km9PMs=;
	b=kaasIHCUpaeucpl2pzqEU0CO6QUsXsgoquGWp/PCe4E4RrBE9YkONLZ+GIpmm4jPMXxB
	 am5NzsTl6NTVNHjLuXE28ongePI+hRxUxokzb+eR2vDO1rRp/uczHRYRt2PS+rzBTdSPx
	 k0sg5H7hnnnWH6Vlka62OVpUSKl43m1sGljMyGa+RxJiu0mbH6Tdm6iQ152MrI+x6F7HF
	 f37DGTFApp8+n6gj1J36slasGA/74JFQnzxuEGjIVc8Kx47l0grQSIIPYpR4BhM6iXqvB
	 2TnFX8D/quL5T3F/1BRDcP09V8hUCqhrJVasDoQmAjAGrd7vTsb4k98LGe4OLXmM09w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=dWyAcbiJ;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=AFBbnnBT;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A9606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 00:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 930A9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=dWyAcbiJ;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=AFBbnnBT
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793577927; bh=Zyp6Ql5N1rWlYxuROJ0el25
	M0bYgmu9qE6tE4Km9PMs=; b=dWyAcbiJlhekDlG3AtkMUe7XDMEMVyWToIijbESJKdL3bHD3jb
	g3WqcUhc+XMiM6Ox9WibNiqzOjVtdpmt/ZAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793577927; bh=Zyp6Ql5N1rWlYxuROJ0el25
	M0bYgmu9qE6tE4Km9PMs=; b=AFBbnnBTrQNndV3stO+6iA2dZjtlSO9RS+TVPb6YTIXWPPuHfA
	TZZTc+d16gK7NtKVw+dFB75xqDN0zahBw7zu4syOpPou7NzUBGfgZ7ON0rL9czXl4sG4Tq96elX
	xqa7GyjnMG8cQO3eqfbfZLyTg4q172shJZbVRgj7/z7aX0LjS4ZfhWEL+jPCg0AM7agHrwMKRRh
	YGZrgGKLgzZAi/EuEVer2OqQOSTumUtZ+XcG15cbfvBHUpPk5mo7R38wFjbua9FTb/4bHLsrJF4
	VxfifC/zBt4975F0Ed1PMSC1jOqnzkLQWsalvdFK1fgf5uv9nuFPclFmPp1FgdhQvpQ==;
Message-ID: <218cfd0d-30db-42e9-923c-5e6514f0836e@erebion.eu>
Date: Mon, 2 Nov 2026 01:05:26 +0100
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
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-10-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192767@kernel.org>
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
In-Reply-To: <sashiko-outbox-192767@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N0qJnxep6JA5K18oUsDVI0Mn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N0qJnxep6JA5K18oUsDVI0Mn
Content-Type: multipart/mixed; boundary="------------5YIA4P0FAXJCX9zdLr0qUAmO";
 protected-headers="v1"; hp="clear"
Message-ID: <218cfd0d-30db-42e9-923c-5e6514f0836e@erebion.eu>
Date: Mon, 2 Nov 2026 01:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-10-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192767@kernel.org>
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
In-Reply-To: <sashiko-outbox-192767@kernel.org>

--------------5YIA4P0FAXJCX9zdLr0qUAmO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T3kgeWVzLCB0aGUgYm90IGlzIHJpZ2h0LCByZWJhc2UgbWlzaGFwLCB3aWxsIGZpeC4uLg0K
DQpPbiAxMS8yLzI2IDAwOjQ0LCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3Vu
ZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTWVkaXVtXSBhcm02
NDogZHRzOiBxY29tOiBzbTYzNTAtbGVuYTogeG8tdGhlcm1hbCBvdmVyd3JpdHRlbiBieSBj
aGctc2tpbi10aGVybWFsDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBlcmViaW9u
LmV1DQoNCk15IGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2VkaXNoLCBOb3J3ZWdp
YW4sIERhbmlzaA0KWWVzLCBJJ20gYSBsYW5ndWFnZSBuZXJkLiBGZWVsIGZyZWUgdG8gd3Jp
dGUgdG8gbWUgaW4gYW55IG9mIHRoZSANCmFmb3JlbWVudGlvbmVkIGxhbmd1YWdlcy4NCg0K


--------------5YIA4P0FAXJCX9zdLr0qUAmO--

--------------N0qJnxep6JA5K18oUsDVI0Mn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCaufTxgUDAAAAAAAKCRCOr0AybgKufdPd
AQDCUGISN4DDlHW33Y4I4F8RyaQhK11Yq5IXhEeBfGkaeQEAymafLGzzalQ5u5nJvem3t3H3xz6p
3zeAnym8G2rEJgA=
=xtkD
-----END PGP SIGNATURE-----

--------------N0qJnxep6JA5K18oUsDVI0Mn--
