Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870378;
	b=ei8MDY4HLsNpWjZhq7HxSLYG7BoiwhyH1I6nwkP11g9mcCg/yRhkT0D9lOZMHB93zHZV
	 vOeDKB5YhNuYRBH0vMODavpMMZQJ/YwAkBfuS5nRMVRzb6aG59ZwRoNoYSPJ1qF9ty023
	 luWt/MAfc9efnGecnpnzxZtj1miYdwAmKrAIM25wu8OYWQNzOKVz3jHx8sJY+EwZnd6pe
	 zVRApr0I8wYj+7rAI8xxM3Ns0bZdQLMY8PXyGO8+yamZ6+Ivn1K+svdbwBGQrDLlRJgvE
	 uN5QtmvIJ2xq+vz05nhWoWWHmRCO8DVEP8+Vi3PDgmQ9UUrZNt6phoStQqAqJjc9jcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870378;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=8hA3rGltdahYHaFlNoKje2YsLq/mvc/Uur3LGsw1ZEc=;
	b=WvkQmurM7iyCOiHyapjzeWslEMC7iRJR0F8sYXQAU2glHOEeUM0piC55RglnJHdeXquJ
	 Z3kICQ70xs20hUn6cXmg/1ei5xjnhtWo58lOokqtdWR6Nx1GqdFrDlVo1hyqFcPVwiAMh
	 omQ4qlIiRdsEzYWKx3+/vU2ZUxiTrsrmyeVN7tnMHSuZ0WISJukAR4egXSnpDG+shXQkU
	 f6cRLClM53gSlZzDNmwU02odsfkbhu0vPGquH2VdX+VaXJAL+ksMMAZAcfJ+ZaQNKf5cS
	 4MAJUrRFKK1JfJFDu8I83rYekMir4/n/1lNISPlQ1Lc2yBcCr4UQZ+n5XPWnB5Cdskg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=8d2sA4YK;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=toTIzPVG;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5476606A333
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5476606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=8d2sA4YK;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=toTIzPVG
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870376; bh=8hA3rGltdahYHaFlNoKje2Y
	sLq/mvc/Uur3LGsw1ZEc=; b=8d2sA4YKaJcbbP1PdfPlzyNVxsLVWnb/pKU5+WrLRNoF8ObVkW
	PJP6LBEb2ebNDYRYkZQv0BuhydTM5M59tLCQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870376; bh=8hA3rGltdahYHaFlNoKje2Y
	sLq/mvc/Uur3LGsw1ZEc=; b=toTIzPVGjzpjD0a+4RB4hQJ2euAaIE30+ub2EDERYE9QBTVdLN
	QS3qwJejAM6wa+tuR560/upJvercdDpgbgM5nt69j07trCW7bh88sgCxNLbTuy+W9E74GO3/JYl
	E7YFc1KfqboWbeBwP9i9Sf/qnea7q+rT8J2NgtVs1s7gPuvAh5tSczmOEaWLPRVqB0yCtpxnpCp
	78+crlqbgvkJMoWsfseTPNwwZZq7Ik2S00ITWFjY/XbGC5klaDOOZTaT2wxF/MpIqcd15r7bVYW
	tFT6bCkcYf5E45cZImYQlS/epD0HZ/gc8+qpb9if1oQ4wletvOf7mdwm9NZj89VHJYA==;
Message-ID: <a8da53b2-7ef2-4acf-973b-056d9a4bfb26@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:16 +0100
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
Subject: Re: [PATCH v5 03/12] arm64: dts: qcom: sm6350-lena: Add
 qcom,rmtfs-mem node
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-3-7318a19806eb@erebion.eu>
 <sashiko-outbox-217822@kernel.org>
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
In-Reply-To: <sashiko-outbox-217822@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p7lDUHOP1VOQ70HtnS3F04vT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p7lDUHOP1VOQ70HtnS3F04vT
Content-Type: multipart/mixed; boundary="------------L4OZAlHeaDp9dXNmnCQAJ99n";
 protected-headers="v1"; hp="clear"
Message-ID: <a8da53b2-7ef2-4acf-973b-056d9a4bfb26@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/12] arm64: dts: qcom: sm6350-lena: Add
 qcom,rmtfs-mem node
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-3-7318a19806eb@erebion.eu>
 <sashiko-outbox-217822@kernel.org>
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
In-Reply-To: <sashiko-outbox-217822@kernel.org>

--------------L4OZAlHeaDp9dXNmnCQAJ99n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTYvMjYgMjM6NTUsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBzbTYzNTAtbGVuYTogU2lnbmVkLW9mZi1ieSB1c2VzIGhhbmRsZQ0KPiAg
ICBpbnN0ZWFkIG9mIHJlYWwgbmFtZQ0KDQpUaGF0IHdhcyBhbHJlYWR5IGRpc2N1c3NlZCBp
biB2MiBvZiB0aGlzIHBhdGNoIHNlcmllcy4NCg0KLS0gDQplcmViaW9uDQoNClhNUFA6IGVy
ZWJpb25AZXJlYmlvbi5ldQ0KDQpBY2NlcHRlZCBsYW5ndWFnZXM6IEdlcm1hbiwgRW5nbGlz
aCwgU3dlZGlzaCwgTm9yd2VnaWFuLCBEYW5pc2gNCg0K

--------------L4OZAlHeaDp9dXNmnCQAJ99n--

--------------p7lDUHOP1VOQ70HtnS3F04vT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMaAUDAAAAAAAKCRCOr0AybgKufcD4
AQCovijA4agHKz6BUtPTTwIuc9bzQv32nYiCTBvBlstZeQD/Yl6rDdmflecPFRknOmbzMZABjPqQ
MW0ppJ46IHS/KQo=
=4ytF
-----END PGP SIGNATURE-----

--------------p7lDUHOP1VOQ70HtnS3F04vT--
