Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F20C4FD799
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630727; cv=none; b=gUuYN5shJcM8EybdV2ii+JgWHgzqQJO0+4BIkgCW3WEqNb/ST73y33vm+4LiC0xqzrobzLARjgrDIWipz+/b1+Kl4QCohD2JzEiYnUQINFyhD+F3PiQWnMMlkcodGZX3sQy5AdYMy4sc4bOLvMUlS47ws8Oo2Ot7ahzp9UpMYP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630727; c=relaxed/simple;
	bh=OPEGz7mcouSpb4LDbaNSQmUrfhs39CV7EJWdYoW9pDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B96jrn4+i/4yI8aPlWi1HDlbIOLQijr6X6ftWqL8wXWXGWQU1ygPB1zmabb6ZZU8y4WfJPEDIvG72U4RHX4jIi1VDpzbaiGOG4CAyGFV8Q2xDmLfsFLd5Dx9ZjYjharMN5ZQ3CXynYRnyNH4Jp1hrcMFFkyClc6X9YyIUF4PkX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=GSeC7U7d; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="GSeC7U7d"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-9142a7e703eso32241816d6.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790630722; x=1791235522; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+905VpPWFNsqdN9ZNh4c2Xt4scACgjmcpfbxIJWGn8g=;
        b=GSeC7U7dLWqMojYVlfa5tAmwma7hqdkoiy/dGvZ+yEZanaw/5B8aAQMjk2jXd2/3C0
         GxEQ8tZtpRIhpo26qYIxO84G2fhNP7fpIlvHkZf/ROksHtScu83m9qPgpxiVGnbMNIJ6
         JCJq10jP9xvpoXUnPe1+765O4MTfcBYEzhqfT6xWTdbZghL8VJQNj+hQws88/c4ZynRB
         axbn7ZsU3YCFrNGPclarUaR5WeMwzXZGv5skGTp7fK/thc0iMz/jdECQ46C4EfzoCRQK
         qmJ7eknDuSfnnkgw8fA9tpIkKx/MiY8LEoRP3Y+GUSXMU3/zhtLOseiROxURlLlRNsB+
         6N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790630722; x=1791235522;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+905VpPWFNsqdN9ZNh4c2Xt4scACgjmcpfbxIJWGn8g=;
        b=mLp7vRgy/x6QMdZ3OUl6xV1h5g5Bd+u1KkGx5yOfzZmIud3e3TD8O7cXrdeR2LIE5A
         Ui8P5CS2iZxszoM2uTNtEVueHhHVy/OJkgJAAuJJusiirkaZY8ULKB0sRaI8N0I9Ctrg
         VjYyLUeQ6UR154PK4x99ZqZgX8n70sRaC43adt+CvFE5qcfmtSGnYoAExxKXjUBW1sC4
         JPVpOcrerfh2fUm39VkMfbOlOki8V2cohiu22QQxoOMMKQM1nMnhUa5MbN2On/8gJJ1B
         X1GkK4rwylgVCqbT7rteYMzI7PaJe0q1A8EH4Pw+8Ro3pVGak4dlREvKonfaZXXzlJDM
         85QA==
X-Gm-Message-State: AFq9FYJ4cWAoH1B/0wdZLOSPt/kWvoZk/PyVlNI1vVFq150dnAhgTMlf
	K41Q6zp5zlGRt8pcdpZ/bVRm7C4B0ghx6v2r2J/Q2wC6CIo6lvrdBGLjiDI7buoM9vs=
X-Gm-Gg: AYBFou3/h1/YRq0yQ70Hh7zW+tLeYyFaWTaAOfEbdI1vYolBrbrS+wUvlZItlP39vsd
	vdgsx880UfsTqnibWY/RmK6olLo3mZOifC+R+qIFJySpQOdtJ9jfTFHc8M+zMZWc56EAZCoWixX
	PNlnMJcG/p8qjADCv2xT106XWqz3rGIcCZ6AIDd56EdB2t0cJVTRVEboVHUx7GJu5nYRSW1mq9S
	o0ASobV805f1IaJAEsY//RqBOA780rmVcb8VBnolYB8FGT4xknAYsht3H8tEO1N4KCIYxWrSaZ5
	rMSmlHEgEiR852SlWCh4hk4OGXjwtFPojSww8jlGCnR16Q039wg4lLaukag2r1hb/RBgvLWHoGW
	jJgxi+HxYwAmGUnDuxlzN3N6AifHvyoL1oXwKoyLgmpqYge3TG+EbBXZ906iYHliaxuOqOqAxem
	fdcnGALr+YK7K+FZ6r+KFUXffG3U9U4Q+DtRacTItRBK975E9UzmjE8n7ffk5GtwB34dVkl4NRR
	yDBm6i1n7WC1g==
X-Received: by 2002:a05:6214:8409:b0:915:ebf7:34ad with SMTP id 6a1803df08f44-915ebf735a9mr45816036d6.12.1790630721868;
        Mon, 28 Sep 2026 14:25:21 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-915e759a989sm35062676d6.31.2026.09.28.14.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:25:21 -0700 (PDT)
Message-ID: <1b837fecc1992e94bbe77229a2529c9eb1ac0c60.camel@ndufresne.ca>
Subject: Re: [PATCH v10 0/3] Mediatek MT8189 JPEG support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Mon, 28 Sep 2026 17:25:19 -0400
In-Reply-To: <20260720062829.7343-1-jianhua.lin@mediatek.com>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-SM45MfqXGrobY1wEGs0I"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-SM45MfqXGrobY1wEGs0I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

picked, ty

Le lundi 20 juillet 2026 =C3=A0 14:28 +0800, Jianhua Lin a =C3=A9crit=C2=A0=
:
> This series is based on linux-next tag next-20260707.
>=20
> This series depends on commit 7560349ee0d9 ("media: mediatek: jpeg:
> support 34bits"), which introduced the `support_34bit` field in struct
> mtk_jpeg_variant. That commit has already been merged via the media
> tree and is present in linux-next as of next-20260707.
>=20
> Changes compared with v9:
> - Patches 1/3 & 2/3 (dt-bindings: decoder & encoder):
>   - Explicitly set `mediatek,larb: false` in the `else` branch of
>     the `allOf` block for older SoCs to prevent incorrect configuration
>     and ensure backward compatibility.
>=20
> Changes compared with v8:
> - Patches 1/3 & 2/3 (dt-bindings: decoder & encoder):
>   - Expand the description of the `mediatek,larb` property to explicitly
>     explain its necessity for accurately describing the hardware topology
>     (SMI LARB connection for memory bandwidth arbitration), independent
>     of the IOMMU driver's implicit handling.
>=20
> Changes compared with v7:
> - Patches 1/3 (dt-bindings: decoder):
>   - In the allOf constraints, only keep maxItems: 1 in the then=20
>     branch and minItems: 2 in the else branch; remove duplicated
>     constraints already defined at the top level
>=20
> Changes compared with v6:
> - Patches 1/3 (dt-bindings: decoder):
>   update the existing `allOf` condition for mediatek,mt8189-jpgdec to
>   make the 'mediatek,larb' property strictly required for MT8189 SoC.
> - Patches 2/3 (dt-bindings: encoder):
>   Add an `allOf` condition to enforce that the `mediatek,larb` property
>   is strictly required when the compatible string contains
>   mediatek,mt8189-jpgenc.
>=20
> Changes compared with v5:
> - Patches 1/3 (dt-bindings: decoder):
>   - Drop top-level minItems/maxItems for clock-names per Krzysztof's
>     review.
>   - Refine allOf block to strictly enforce clock constraints.
>=20
> Changes compared with v4:
> - Refines the device tree bindings for JPEG decoder and encoder.
>   - Patches 1/3 (dt-bindings: decoder):
>     Moved the standalone compatible string mediatek,mt8189-jpgdec
>     into the first oneOf entry along with mt2701 and mt8173, as
>     suggested by Rob Herring. This correctly groups all independent
>     ICs and removes the redundant items wrapper.
>   - Patches 2/3 (dt-bindings: encoder):
>     Applied the same logic suggested by Rob Herring to the encoder
>     binding. Restructured the compatible property to clearly
>     distinguish between the standalone IC (mediatek,mt8189-jpgenc)
>     and the ICs that must fallback to mediatek,mtk-jpgenc.
>=20
> Changes compared with v3:
> - The v4 is resending the cover-letter, because the v3 cover-letter was
>   not sent successfully.
>=20
> Changes compared with v2:
> - Dropped the dts patch (arm64: dts: mt8188: update JPEG encoder/decoder
>   compatible) as it belongs to a different tree/series.
> - Patches 1/3 (dt-bindings: decoder):
>   - Changed the MT8189 compatible to be a standalone `const` instead of
>     an `enum`.
>   - Added an `allOf` block with conditional checks to enforce the single
>     clock ("jpgdec") requirement for MT8189, while preserving the
>     two-clock requirement for older SoCs.
>   - Updated commit message to reflect the schema structure changes and
>     hardware differences.
> - Patches 2/3 (dt-bindings: encoder):
>   - Changed the MT8189 compatible to be a standalone `const` instead of
>     an `enum` inside the `items` list, as it does not fallback to
>     "mediatek,mtk-jpgenc" due to 34-bit IOVA requirements.
>   - Updated commit message to explain the standalone compatible design.
> - Patches 3/3 (media: mediatek: jpeg):
>   - Refined commit message for better clarity regarding 34-bit IOVA and
>     single clock configuration.
>=20
> Changes compared with v1:
> - Patches 1/4:
>   - Updating commit message
> - Patches 2/4, 3/4:=20
>   - Updating commit message
>   - Adjusted property descriptions acorrding to hardware requirements
>   - Improved formatting for better readability and consistency
> - Patches 4/4:
>   - Updating commit message
>=20
> Jianhua Lin (3):
>   dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible
>     string
>   dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible
>     string
>   media: mediatek: jpeg: add compatible for MT8189 SoC
>=20
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++---
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 38 +++++++++++---
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 ++++++++++++++++
>  3 files changed, 118 insertions(+), 14 deletions(-)

--=-SM45MfqXGrobY1wEGs0I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrbPwAKCRDZQZRRKWBy
9PnDAQCv7TgjjF2tq0hzFvsEpdGPWatoaiOzm0hk0reRJRopnQD9HmGDrTgAlCm0
1lNiRF/hRw9t61kIcl0mv3QOQl05PQo=
=A3bH
-----END PGP SIGNATURE-----

--=-SM45MfqXGrobY1wEGs0I--
