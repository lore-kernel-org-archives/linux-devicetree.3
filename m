Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558376;
	b=Bx69y6nILX3G6dKATyVUXooQYj1ks6lW17B82L6SlEs7h6tX2nJbFygh3qDYN711JWqI
	 LNUNzGbo4tWt96z80pMUR9zHSAHK7bUhWKHCqG8cUHEMgGvpBPRBnoGtsvYoLd2Dn6M27
	 CHxzg4ZJ+FExsN7/PCiGnh7KiPGuokU/9WXVW/LR8ThPYR+yKVDo2ycAuAeFtFfD8pERg
	 y701TclXvlOkryJ4mPxvYXqfhLD1HN4Ld1R/cgfnBtGJYjFvcFtJ7ox9ZJD/Z3aZTg23k
	 OH7JEt/nCIn+9aU0BWZXtyP0qBUDO58LnlS5HFT+Pz8wZTEOPjQidFJPdzf9OSY2XXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=a+lCQh9rFeHZpRcts8xKmbAzUymCGM5+mzuki638UuI=;
	b=goWus1mPCNH7yr0K6g+itqnJwccRjbWa6UzSB9EHp88S7QxMzdfJqbPdWuuJYS9qWpK+
	 HbQC7iD/rzw/70QH8bxkrmM4SlwYBzGo/fW08TAX16zCQxC4eVFD6SE4dUOFA+sr5dXRI
	 PKg+e1IEWh/CPJ8V7aqNA8/bmbt/Kk+HVr7DhDnFRNqDxNH+2lsUfsM7/d8K0lz/KXZiU
	 hY+sxgC6zR9znRIqWQtRfrrD6pP7kNIWPRlIt5BSFGRY3kAs8euBhQLtVZqzNINF8oh3s
	 bvHbPDuspp3nQoHmZUABTcFVnZM57djcKNDP36w4fgrLNHqG0JFi0rW9heIiYEUq0Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I2XVqDN9;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5D7606A323
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5D7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I2XVqDN9
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9495e8ae23aso431524385a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795558374; x=1796163174; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a+lCQh9rFeHZpRcts8xKmbAzUymCGM5+mzuki638UuI=;
        b=I2XVqDN9DEPyLiayQzz/N/Ji/74i6qgmANoQlCH0gBUSconoKdJE0r1vzhxVt9vobq
         qQ/yFqkVc5KfzvXUESXKXd5eT5E0CjzDdMBNFwvTxzX1NQx9wJ4xFMpcNBjrRF4ayQA5
         i75qQnXUSEoKBZiebF0TaEdeV8tPtM5RXZWFc+1pTnEgzicwolv9mzdR5v7rrz1OIQeX
         Lr//EtTWhn3z8jiuFlqZhSEkMKtxGQ93vF86kpeIeylbxQ4kXofSki/NshTNKv0JIS/5
         yiLBITHIC7NBmoSeZyhdURVAoFC7kd2TvhNih16fP1N0fM8Kucd1XRIslkUKTv/mhXQj
         TBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558374; x=1796163174;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+lCQh9rFeHZpRcts8xKmbAzUymCGM5+mzuki638UuI=;
        b=gedMetnrnwOBZ1KN5PrY5LjNDuf5NHYhUziqvGjms9OLizfjn4bA0j/Awy9/xR7/rE
         NiGJ3wwmUMaMJzTFgo8OVhZrD1R4II3nkcuCDTviir/JPOB+U/X1OfO1CwO2um1fdoN9
         opPukJBOYWZ+rRU7NmbtSDYeALPGsIaZWAGWANVYiwDW8tBSVlGdDqIJFxEeWslrBHON
         jTzbrgLdmIZSyrrRP88k+v113z2qRvfMj03nsK2z6nSGuwsbLyaJS9LnA48IF/ojw8ja
         Z/8N3u46BLPN+N3QBHlrPvrfgyEBMg1qTE2yKFMmYPn87UkUPCZwiAFRsDPheC+onQaZ
         6jPQ==
X-Forwarded-Encrypted: i=1; AL+hErHGTdTqdYSQWxOKP8JIkD0lf0uJlc+epJociOIAKMKSneT0GfbmSJ1ynrawtP7a9Wh1HaXtiCHNwAG6@vger.kernel.org
X-Gm-Message-State: APuU4Z8fB4zUNafw6e3y0FvcOYDqDs78BKk3Nw2euWi6TQkQ9qPJvmrA
	CZL8XFN99+Vuvf3cih18OUBwgE1UUwkxUF6MLgUbF1fPeA74OjkfQtcsWKIe4m9MLwRyEQqVHro
	3SoktqT8=
X-Gm-Gg: AZFdTZezV12yF3uSQOi3HY6uT4UEPREPGbngLmGaZS1POHGtPJ8jn8pVh9vB9GNcy0s
	yth87PFaMmQDloo/Ja3Bfm9CcWsRvF0kXO3hgFwLVEbTNwF93WO1wV5slm3M+H+2wmZVM9T9UhL
	RcrT+vXCuA6/FgOFHL3AwiH7/aAEWPgbMoWLMzvWlgyNb3+VOa7KqM+x8Xsrx3AjPol+gEDRT6Z
	w2fscM82h+zuxz4Ct7RKI4atbX9Wwk2SbeYSW+fv70Ae5RsCC2LFvUzasgm5BKUwAxxPD+wQKIg
	upwnzvkKVhYa0VdjrXPCImmlbutApA/bC+EffQwWIHTIXEUARrRwnglCjWB2Az5dXL31L0e1mR3
	BrAQoumjJveBhFDp1g0NwdC3bzWTciSH9jwPpg9aTAjJp56hYDDSQ/ZitjwII+nI+sOZkrGCloL
	iI0Sd5p7uafy2IH8Fq0187RQz7h3ENcDTv1k9CDzXzqyufetry9jPESuXRZ+sxOqzlH19dy/xF/
	ptyoeNq4cQIUhwhrlaev25oQtscmOWdBEN9/+ZF3Zaib3yrYPSwVku/sDCWOAVB9TBtb73AhwS9
	tHvfvfh2YpyVeMeyhlK+mhBcJ9RItsfC/Lmx4oJCfgAVG1koeE6ZRzd+QkcZZTCzN8Wa/E9d7iS
	/
X-Received: by 2002:a05:620a:7087:b0:93f:633b:ee1f with SMTP id af79cd13be357-949ba9c6b95mr3002134585a.28.1795558374358;
        Tue, 24 Nov 2026 14:12:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3bec3dsm1148251585a.23.2026.11.24.14.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:12:53 -0800 (PST)
Message-ID: <16ae904e41539059dbe1649551c1c903295690b3.camel@ndufresne.ca>
Subject: Re: [PATCH v3 04/17] media: v4l2-ctrls: validate av1 tile info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Daniel Almeida
	 <daniel.almeida@collabora.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 17:12:51 -0500
In-Reply-To: <20261020-avd-v3-4-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-4-85cbaa2125d8@icloud.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TfGKB/izRKTkKjOJIU01"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-TfGKB/izRKTkKjOJIU01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Many drivers use tile_cols and/or tile_rows, so make sure they are
> valid.
>=20
> Increase V4L2_AV1_MAX_TILE_COUNT to MAX_TILE_COLS * MAX_TILE_ROWS
>=20
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
>  include/uapi/linux/v4l2-controls.h        |  2 +-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 661a3a25da52..922cf74c4eb8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -800,10 +800,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl=
_av1_film_grain *fg)
>  =09return 0;
>  }
> =20
> +static int validate_av1_tile_info(struct v4l2_av1_tile_info *ti)
> +{
> +=09if (ti->tile_cols > V4L2_AV1_MAX_TILE_COLS ||
> +=09    ti->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
> +=09=09return -EINVAL;
> +
> +=09if (ti->context_update_tile_id >=3D ti->tile_cols * ti->tile_rows)
> +=09=09return -EINVAL;

Make sure to update std_init_compound() so that the default passes the chec=
k
please.

> +
> +=09return 0;
> +}
> +
>  static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
>  {
>  =09int ret =3D 0;
> =20
> +=09ret =3D validate_av1_tile_info(&f->tile_info);
> +=09if (ret)
> +=09=09return ret;
>  =09ret =3D validate_av1_quantization(&f->quantization);
>  =09if (ret)
>  =09=09return ret;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index d17e41d51d2e..abdfa102a77b 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2939,7 +2939,7 @@ struct v4l2_ctrl_vp9_compressed_hdr {
>  #define V4L2_AV1_MAX_NUM_PLANES=09=093
>  #define V4L2_AV1_MAX_TILE_COLS=09=0964
>  #define V4L2_AV1_MAX_TILE_ROWS=09=0964
> -#define V4L2_AV1_MAX_TILE_COUNT=09=09512
> +#define V4L2_AV1_MAX_TILE_COUNT=09=094096

Hmm, added Daniel in CC, no idea how we ended up with 512 here. This will
increase MTK insance size, but the communication with the firmware seems
dynamic.

Hantro is limited to 128 and properly reject anything above. So in all, sho=
uld
be fine, unless there is a problem with MTK firmware, which which case I'd
suggest to program the original limit in there. Also added Xiaoyong in CC.

> =20
>  #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE=09=09  0x00000001
>  #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK=09  0x00000002

--=-TfGKB/izRKTkKjOJIU01
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYL4wAKCRDZQZRRKWBy
9AqIAQD/Po4bqlGbwwvzn3azk4B+6lvUS+G/w/qpKmt706DCrgEA7eZ3FFzsMcQl
GNrZH0OYicvPvO4L1n4kg3NLn/HwGgg=
=kmno
-----END PGP SIGNATURE-----

--=-TfGKB/izRKTkKjOJIU01--
