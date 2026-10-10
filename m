Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB8B1A38F9
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791653663; cv=none; b=LWX5+iX15EOkzp2yiguCOF8y5do2TOI0XtXDmtMoyZZjVlq916azkSkSrP1uaIuKVueCuK9R/Z4C8XCx/wr7WU+U9KYfgq9XBgwN+2ZiBTYRZxxElrTvei2GviFNC/EuAgzAO7JaT+fWxdAv8Qj/wc+4i6DGOohmwX1GAjIhUHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791653663; c=relaxed/simple;
	bh=OjHzPdNJ+pQiEPNpWziSA3gVqzu3L6a5yw7oinbcFek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sm2izICUhCRaLWfV7NlsHPpQnSCZo+gUbEhz7VgouZ5js6nhRhO67S+H8SqGa1cA6fmY/3LXVhaGjIekM/zSuPyhQYKrb2kSDY/i7hxbMerZ/aG0s8t0RS8/Fnuz6R7qWYMnXQEPPNwUna5YOoBVfg2xDc+NHyyhMQo5EGaZuCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFQg55xQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFQg55xQ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso3310475e9.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791653660; x=1792258460; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKRu7HdNzVMsiadoCAYqAnivQppIsxxdbnjlkOxlUeM=;
        b=WFQg55xQCl7JlY4/i8gDC5WBvNoGOzewQVJSe8i45ElYV0JRUhvLIA9l0UkC2285NL
         ICdViaiXnmuU5LI6KfPPI5o+NSACBMV9ReoUjiDv4eYFa0RfRLDXrUO9O79Cvpb3lKyj
         9DF51quh/sM8ug9b1lcQtqNUf+Chz681owExOMBf9YLfpMD2aUtyAgLVmUE1rIpw9Xjx
         MJXbBJ6feklI1jooOACu1EvWFi6DXlNUfm9h+X9PVLiDv8Y0Ueze8K8mdBnfgaIqDi8h
         dr0CtTNdGP6j37MtlWZrlI9MGSmzpEAQb8sTz3gOv7tCdYp/+pka8bdP/n4erEv/s7LO
         A0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791653660; x=1792258460;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKRu7HdNzVMsiadoCAYqAnivQppIsxxdbnjlkOxlUeM=;
        b=1kXjRo0asw9ZtCIFALNg1zoaOVNmf03xhJ8oHeVV3hLuP1mVsFjBRSA6Bvz/wpdDLl
         MDdR+C9OgXUvC8hb+4gn9+wewfFZLVrbpoUfTz21G4e4fjIg2SKntM7HhWLLVbJ3UMlg
         /xVZ+nZ/xeICIOfBTHjaKi7fCRve7oTdChFXufGs6KfgeN1zf1JfwkytWFa5W8D29R9s
         gDojqPvVurJoynGVkDki/EquuI1LZ1c6KnH1B7ubHHlNIWU2BRY9tLEiGOkXn2TqkQSX
         w/wQ5zJFPjNjaF9AD7qPG2IJqXFoZL3Qno3/9X3jPHhgyFa5aAuulHiF5UcuU0YPZhoX
         P25w==
X-Gm-Message-State: AFq9FYJc4CDWZosvTZocM04srwfTG+dkFh+qu++0b9FRNBnjgqYhLhwo
	ES+pghjWrkVy0EZk6pCuLWsGjpfHFOQ9pV5eB3h7XWVdMKmVgcrwBoc5
X-Gm-Gg: AYBFou1udQm7a6gYV7sDFsfAwbKaNhkMmDSJOloL+go8Ox1giaBcnsJEQ266BwAHV/M
	iR2YJn4tdToaFfZnKWdHwJYZ95OlyXtL76jSIQCROGfXM44gMdqNWkI0EejcwWxM9ljJ8/2OJGg
	MhQJCPAuE1wqKh5eKiq23Mzk/4M45oRzpZhuNU+7QEtaER/DdckLDat4HWNA5P8YOGZ6BWfiTmF
	XkbQINugbRbpEPbOmhOXJLQ4pTTD7eWFgW/Ey8aG2HlzqPn1WumjX9yU+XR10IjJXhSPZyp247A
	lmhSt862ObE8I7di9xgfha0SJJaQ4rsy2e5JEqodlT8VLfrZaSkxMkfo5D0A9Cc34VD2lQ2qHcY
	AilmTzsMDMcyDDcQtFTGcWztLeTXZ6I2au3NWgaAyqvgtrDeGBxyfKh/eZ/rjEGJEzkqZctwrkM
	XbowP6vPPZGkXPJC25mKO+tm8YK1jZNbuRzgG1LQIgILMvRzBteuK7euWBMA3JVLC527d7WgrGL
	4EfB8bwCUAu5fPawJ5tMiGXbirU+f+1c+XMJ6tpq0D85gWdjnx7MKDg9JPkUNbazN0B
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18e4d67edmr95276415e9.24.1791653659818;
        Sat, 10 Oct 2026 10:34:19 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm225253335e9.9.2026.10.10.10.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:34:18 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject:
 Re: [PATCH 05/24] ARM: zte: Add ZX279128S platform and CPU hotplug support
Date: Sat, 10 Oct 2026 19:34:13 +0200
Message-ID: <R4jkIz-qRYm8QZxlEgQNPQ@gmail.com>
In-Reply-To: <b6dc1056-63d9-412b-8abb-a032dae83d46@app.fastmail.com>
References:
 <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-6-ghahramani.navid@gmail.com>
 <b6dc1056-63d9-412b-8abb-a032dae83d46@app.fastmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartHDvldZc3SQG5Th3laDZZWQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartHDvldZc3SQG5Th3laDZZWQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Sat, 10 Oct 2026 19:34:13 +0200
Message-ID: <R4jkIz-qRYm8QZxlEgQNPQ@gmail.com>
In-Reply-To: <b6dc1056-63d9-412b-8abb-a032dae83d46@app.fastmail.com>
MIME-Version: 1.0

Hi Arnd, Navid,

Am Samstag, 10. Oktober 2026, 16:13:47 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Arnd Bergmann:
> Since this is really the same platform, I would expect to have a single
> maintainer or team of maintainers. Since Stefan is already established
> here, I would ask you to work with him first on reviewing the code and
> deciding how the two of you split the responsibilities going forward,
> but I don't think that having two separate platforms with separate
> maintainers is going to work.

I am open to co-maintainership of the ZTE zx platform, especially for thing=
s=20
where I don't have hardware access.

I am away from home in the next 3 weeks, but  I hope to have time to review=
=20
the submission this weekend.

Cheers,
Stefan

--nextPartHDvldZc3SQG5Th3laDZZWQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrKdxUbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi6kkP/RG6WnFV5gj1JCoG6Q9f
ICCEtnIljgeZva2tToM2fAt9qUZIRikEM9uAGBZPei7hdRw+ZXsS3fTqSO0FDUe/
/xfq7VVNyJsg+ZwPbVblrMT9sz2Bh0375uzmKLZjaCulV+X4iDBjRI53f5wZIRGT
2lVBkqRtLY878ohMFCLsz9xYeXabFk04pSTTrzs0mjBHx+54t+9otTeWZEGOrdL+
8P5GYr/5+GiUq9Jz42Ljf1FRSE144h5A+uUhmV8jK4TI/Xb35zOcePtrvPNqPlGn
UqdvU3zyTdwDiNCD65sWJY2aybvBnwqo5F8Lo/zOJLy0wQgk6prGH9F/T99jOfz5
UTuQZOd8i4QTvaTO+f6LJ83Tz8MYVJlPgU/FZ7I5JgwWqROjZNpFigxWMf52HKoY
qaMbAEy7IPpjQiwwkq1fONLG5aTsBzqcMF+Ag6uEDd909g/+0QF9pOZfuwn22R9q
yt2UwnehepuDAugH4WRvc3MU/80vtAEYvqFD7yNcD6bCRLqZ7swa3LRrTctsa2hd
Ued585nUL/8fBWoxUYMv5eHdZDaCXH9nzZTq7RnDihHpYXbBFu5yPJG1E52Qr7hX
HrnQ3xCxkyEsnUptAZDaYBELBgDqNSB01TsbwSSkhMZDuNEV4N1VWedM2BF8F8R3
uc0b/CW9PV6gQClt6S7P8ZwC
=xuKY
-----END PGP SIGNATURE-----

--nextPartHDvldZc3SQG5Th3laDZZWQ--



