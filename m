Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835324;
	b=f6qlNzaOyVUVWDav6l0gsV1oAvuzFRFSWfFMYAKoLP2UWZeXQXtaCDTw5PBlmZmERE8u
	 TgGcidRw93dpiuzN2HM6p6qgD91UuHoj49y/fS5Q+oEr0jyUpnzxp1hZFztBSOZ1wUQSl
	 7fjNrP//BVBOdqFYy3I95kef/3YCIITNN0vzSNdG6cBwrwuHjDx1I2xrN4/AofpVUC7z3
	 poD+bpOIU4xaSw0dPfsGT5tiNWLOuSQTD1+5KvPb2i8hJfljM/Y7Od8SUuMnqt8WEpzLn
	 d21faL7LIzNnB28EeJOZl2TVv+Wf54Xcy2Rhh1rPTdhRNw1m3mCD+7CAhWgNVDVtKcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835324;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uolZ/qz8MTM6lJt80YKCji07JQHjTSk7DA7fJ8iWFT0=;
	b=ZGX2xBKKKjTJlBKB6r5pHA0RlihQlhNu0dhajtqAAKuh8K3iYRe79ifdOnie+otoHqKz
	 BGqv0Cqp0dAtWwkNu2Pqdk/vyhVvf6shjG+qQWuJAB1CHyGYvOoihubsWZanaEoFLbbfF
	 JWRdiGCjmA1IC+2J6cr6BLcafBIEXzmtFjItVSRamye0ovIorrc46OD3+4UtRkWPHYem9
	 zinizHJ8ZaDQhcdIXcC4yHZlfCpmkEN0ha4Lt1R5+HMTyZ0KJ2f4ih1K5rbr9PSHJKp6q
	 wPQMl61J2RosGu22nF84S2w5g6pyZeFhUkCAojkL7plV/CdCxmQ1Ft/NTpWsaevKx4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TeGnyATV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5C8606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 23:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TeGnyATV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC9B1F000C1;
	Wed,  4 Nov 2026 23:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835323;
	bh=uolZ/qz8MTM6lJt80YKCji07JQHjTSk7DA7fJ8iWFT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TeGnyATVJJchtclyp0hHd4qSEyMGz5CfsKl4dr8XhLhMHtnuY7GjNTE37aEl42S3Z
	 zJR9st4eh4xQcjUKizwMeAJnt31CN5//avRM1RytMncd9LoPRVX6P3SQx6iZdM/tV+
	 3n4DIPalXudHagwX122Q0lmGIgbFt7ShzGfJSDOoLM4DnOesTQolp7dtQheCGosW7L
	 uY5ByXoJvDVQq1JS4dXVkLK562B/QOMYqN1naRmtmvin0JX70pm117doEjLKwKBtf5
	 ArA11cZuUC5Ku+wtTYjdL88KJhPVNoxT2S2nNcz9d89hUTB0N3e4PaoWrIfy9nz9H8
	 8Gsu6bGkAdR9g==
Date: Wed, 4 Nov 2026 23:35:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: vexpress-config: Drop ineffective
 label limits
Message-ID: <20261104-trimming-croon-3dfc3eed2ad8@spud>
References: <20261104144456.2763775-1-sudeep.holla@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mOO5uqSAqJ9ESgv2"
Content-Disposition: inline
In-Reply-To: <20261104144456.2763775-1-sudeep.holla@kernel.org>

--mOO5uqSAqJ9ESgv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:44:56PM +0000, Sudeep Holla wrote:
> The core Devicetree schema defines label as a scalar string. The
> vexpress-config regulator, amp, temp, power and energy child schemas
> apply maxItems: 1 to label. This keyword constrains arrays and has no
> effect on a string value.
>=20
> Remove these ineffective constraints from the child schemas.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-3b655691-26dd-4398-a647-eb878395b=
929
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Also, incomplete CC list?

--mOO5uqSAqJ9ESgv2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvBNwAKCRB4tDGHoIJi
0vU6AQC7RbwQBHKqdY3kxqnxT8YsfvE7/WRvmGpqV7+olyL/QwD/WSjrXVWD052i
XWY4XkvAwF1Tuz4yVrHJdbBHFo+cBwY=
=R8Qy
-----END PGP SIGNATURE-----

--mOO5uqSAqJ9ESgv2--
