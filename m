Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617708;
	b=x8Wc9bqQHTi12grphtYwrqXi9F8JDczlzsL9Reh639xxYf8SWgJOCANq3fk9oo/XUZND
	 H3cpTatufSVUcKb7gwHPy5l2THJGBagaWgHUoxqWlZIxO19KprCOTND6wg7lZpBiYXLRt
	 rN5UK87XqJOUFX8jx/emk4oi0IiiMz3SW+y1Knw64VH6bGlOUubTDPKvsJFy++YoRamMs
	 N34B29t4oFSJn8wx8io4z6KiNTvt0ytb3gHj78i7/FdtcDBTeOW1OJwBDXYzKZvoGrNon
	 ZWJzy8iYQQ+FZBbgIVDv6TQSlcSeJwIHk4VyhlTrE6YPMgOcKt0Ivzw5UBEwZkIyf1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617708;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=/FwdiqEL1E7wjC1lZM45czY/I0C6kbRTSzkP+wrpdaE=;
	b=ZAD/hMSSFNX77ytxlHh1aiGyJ18GvjhJ6GNgvfSuD/AJO4TjP+5OamL0K+WI2LGtaotu
	 fpxk+6TrJ/aRuYVqH2kDdMABCFh0CHuz40Lc4+ca0RfwWBPMbNYDzmqphvyFeBpNrSHHy
	 CAaZPPl/DbrIpycgfVBlrGYp1iKaQmLpn3Liop/bKMUh+hIhsQRYUqxLYENnP79XupKNC
	 04kj5Hmd7sQr4ZuHMSGIDbXsISuiAsoLU8nXQAhRNtLivsW7eLG28UFLx+6YkluwXc5SU
	 Xklo4mUw6/hGFwb70YvPMtuKXhWoiupBY2HZXORrgRpzrLEaNnwjh8KRNpo3wS0Cn0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=MZLxGlp+;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=wJuk6bGH;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00200606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00200606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=MZLxGlp+;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=wJuk6bGH
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793617704; bh=/FwdiqEL1E7wjC1lZM45czY
	/I0C6kbRTSzkP+wrpdaE=; b=MZLxGlp+0k8QGWJZV98wRrFbJ/FIeUraYjfzx7Ff0eOyBbGXBg
	iTRgyg47oag+6auUhq4ShK0YOoWX+kA+lWBw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793617704; bh=/FwdiqEL1E7wjC1lZM45czY
	/I0C6kbRTSzkP+wrpdaE=; b=wJuk6bGHwGQ4tFSynG6Rk37tLq1jtfsoRRzv6Q0WLh+708IUnY
	iuak8c3LHpchH1uu9dpx4jbXx3UXcHd5GR4TUNXBxjeQbRumulwSAONP4hI4L8XyzYxjgJqL0mR
	7dx6HOcrik+pTn/6vEg4ngpytgTCwAczH0RLQdC4WuaPE3/3SNEaGpeU72xCo5NpbZf9J7eYOub
	o5A0hbWyfhKrq791HNWCgMJXhvYLoKN422rwCVG6GEVqLK8EHydI7dH+8O/G4zUwXW2vwC6DICS
	N3DZco59Q1jnCkvOg3dd5AhiilMWwitl0ERq5HlFYx/gpw393o7tdzmu6ICAceMpV8g==;
Message-ID: <13fe5cc6-d48e-42f3-a6d8-83401c2a4b2d@erebion.eu>
Date: Mon, 2 Nov 2026 12:08:24 +0100
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
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-8-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192765@kernel.org>
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
In-Reply-To: <sashiko-outbox-192765@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Y0N0KbcBzWjDoz1M0GdtktLG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Y0N0KbcBzWjDoz1M0GdtktLG
Content-Type: multipart/mixed; boundary="------------Hh5BSwsB1xOqcFqoW06n2vWD";
 protected-headers="v1"; hp="clear"
Message-ID: <13fe5cc6-d48e-42f3-a6d8-83401c2a4b2d@erebion.eu>
Date: Mon, 2 Nov 2026 12:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-8-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192765@kernel.org>
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
In-Reply-To: <sashiko-outbox-192765@kernel.org>

--------------Hh5BSwsB1xOqcFqoW06n2vWD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMi8yNiAwMDo0Miwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gYXJtNjQ6
IGR0czogcWNvbTogc202MzUwLWxlbmE6IGR1cGxpY2F0ZSBxY29tLXBvbiBkZXZpY2UgZnJv
bSBwbWs4MzUwLmR0c2kNCg0Kd2lsbCBkaXNhYmxlIGluIHY0DQoNCi0tIA0KZXJlYmlvbg0K
DQpYTVBQOiBlcmViaW9uQGVyZWJpb24uZXUNCg0KTXkgbGFuZ3VhZ2VzOiBHZXJtYW4sIEVu
Z2xpc2gsIFN3ZWRpc2gsIE5vcndlZ2lhbiwgRGFuaXNoDQpZZXMsIEknbSBhIGxhbmd1YWdl
IG5lcmQuIEZlZWwgZnJlZSB0byB3cml0ZSB0byBtZSBpbiBhbnkgb2YgdGhlIA0KYWZvcmVt
ZW50aW9uZWQgbGFuZ3VhZ2VzLg0KDQo=

--------------Hh5BSwsB1xOqcFqoW06n2vWD--

--------------Y0N0KbcBzWjDoz1M0GdtktLG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCauhvKAUDAAAAAAAKCRCOr0AybgKufb69
AQDKIN2UZJwU4v9BFS956kEjtIiuH8DP13rgxV7+nP+knwD+N+AiSHF3ZCfJxCio2fNieF+bGnEm
77iFbJSIptTvpgA=
=8/iB
-----END PGP SIGNATURE-----

--------------Y0N0KbcBzWjDoz1M0GdtktLG--
