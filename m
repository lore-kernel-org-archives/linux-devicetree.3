Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0043A3E69
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432659; cv=none; b=ecWwoavWZXBnRg5XkCbN5LCKP7PzY8beKqmPvzGY0HXqxQw6BbuyN4ig2cYsVVUaYdqJHeZJQKOy3wrUFG5AxH9zkAS6Y6Zo7L/ktaN3t/s66i/hJYQkxwbhb9F91KhcFPZC9WCTHkhENdRKwXivqp+h8D+6v1IxgAMNKA3fEZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432659; c=relaxed/simple;
	bh=yP43LVUbNS6gGNJtlMHBKpP7X3d/8IsFX56UHBlJ47E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U4kiZhILET4HaOuDbt3jlerFoXrxCyUDop5q1J09b13YVqQcOE+uvWDE498xGpF+r2L49pCiMM4HnV9jyo7UjO8jslPWZoGp0RhvelqXd8m1wQp+a5nmUfJdX/HfstC93PvPLCrp4LHQlZSDcRP1vWkUCxARMirLNeqwaJVKGQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=QaQAFChV; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="QaQAFChV"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-651cfaa21e6so696473d50.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1776432657; x=1777037457; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yP43LVUbNS6gGNJtlMHBKpP7X3d/8IsFX56UHBlJ47E=;
        b=QaQAFChVYrJgYuXA9g6Qd+K2MbdvqsgmgkSlirdgPGGOmVGsl1ECS37oRtD7cycnmw
         yItolkE109NJ1HRNcCi4AOaxNcEpgKNM7dLNuqSi7LeCY7ZaCN1Pujivl36IP0UI8OXY
         mBqsltezb8tUvX7fucly5i5nhD6IYGeQ06Cn5v+mwYVOTYe2oLMzC+dHH97TkgLkR7NB
         EjQ9nL4k0qjuf5bisQO1W5xm/w++jy+4ceci0U2LXoiEq4MMGdGgFtIKlVbp9R5tmmpb
         ECy3cRKbyQSb+KeQBE6D0s+8NO88iD8EDw75lP6XX3sI4CRVIoo4WlfqZsO0HGeY9lFi
         WQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432657; x=1777037457;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yP43LVUbNS6gGNJtlMHBKpP7X3d/8IsFX56UHBlJ47E=;
        b=qI4P/iQJtBywCSANF4v91LiW2T71xDXGbMR5DjCXZgNSGEdwr/anQcqy/rd0Qa49Yp
         KpBSOsV+vvKzpRRQWG0t6kYDUqyLyEWYmecodiiVon//gbR11avh1jTzQZCHnwqSTSWe
         CZd1v7OsUUEuxIA+T7DJrPPXD3XZn4BDCGBhW8/kFLRCeRU/hwpk+DqlT4+XZJnpT6QY
         4cPVrXRHPcTCB4SclqmzkirBn/S4PdTq4IGyqRnwiS+vyGlNgcDN7wLz1BdS7nD3i5tH
         NuOTVOQKjTXQHd/wPKHBtLcGy6plTBLPIl1mDHnw8AtdYxHvuD2akGlbL/4ran3bvl6n
         zGIQ==
X-Gm-Message-State: AOJu0Yx/NH7KEQwRsh2QzcPzFRwTMHcCQkhIIvKNWcLW82yK7rqmtMeF
	TJpSiwbH0IQDPKml4qbPgPlqnoYNwSD8gcxl1GT2XPU+eMOebMKWHy00fPjISBSSAmUxd1V407y
	+Qw6s
X-Gm-Gg: AeBDieuBjS6cpWlTg0sXSXmrRHHRmkB65v/Pfaw4pNvrvs9ttfgb9V2kzNAaUJhbTiH
	9dd7sk3G8HRuxDWI5MsNGfziCbfkics55mun9j3WiNkFUeDOs7VLmXvZ0NZExKTGqt4Y98PeWjF
	WAc6REwGCMdkSupg0U266o4LnYZ47KhurS9QDmHe5Yp8r3z3eF3Z0XKCb+4TDudTD5Ws3YFwmWb
	9H6ZLQJ7pHBEyBNFwsNTvWEsfbFILgKe9iCB7Pu4iU9ljJoqovGxtSEeK+Za8doWYEHMSu4XAly
	PdAoqCmF965AtCjuFUARBP77ohnThiqspIhSkEPXYxxs70/NNGF/dHRW9h95/blsoEf/mVKlhUC
	BF4yPXsR8FAwWwpyOr43jeo0rXHOhIottZTsrB3G9Q95QLwWGSZfwtsPcAlGqIPkXLakOAvDnY9
	nM91ZOmcZ/mkTlsllfpxZm4J2VMc8/bNKEuPjrBH8=
X-Received: by 2002:a05:690e:4850:b0:64c:ec30:9dd8 with SMTP id 956f58d0204a3-65311c8b52fmr1160833d50.47.1776432656675;
        Fri, 17 Apr 2026 06:30:56 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac77546sm10334746d6.17.2026.04.17.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:30:55 -0700 (PDT)
Message-ID: <5b4cf8f7951cc2766901b09f2e886ef73d48671b.camel@ndufresne.ca>
Subject: Re: [PATCH v7 0/3] Mediatek MT8189 JPEG support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Fri, 17 Apr 2026 09:30:53 -0400
In-Reply-To: <20260417100519.1043-1-jianhua.lin@mediatek.com>
References: <20260417100519.1043-1-jianhua.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-Ge/8Q+z1/L/Ug2FhDTGi"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Ge/8Q+z1/L/Ug2FhDTGi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 17 avril 2026 =C3=A0 18:05 +0800, Jianhua Lin a =C3=A9crit=C2=
=A0:
> This series is based on tag: next-20260410, linux-next/master

What dependencies justify not submitting based on media-committers/next as =
usual
? Its fine to say you tested against linux-next of course, and if its only
working there, its really nice to explain why.

Nicolas

>=20
> Changes compared with v6:
> - Patches 1/3 (dt-bindings: decoder):
> =C2=A0 update the existing `allOf` condition for mediatek,mt8189-jpgdec t=
o
> =C2=A0 make the 'mediatek,larb' property strictly required for MT8189 SoC=
.
> - Patches 2/3 (dt-bindings: encoder):
> =C2=A0 Add an `allOf` condition to enforce that the `mediatek,larb` prope=
rty
> =C2=A0 is strictly required when the compatible string contains
> =C2=A0 mediatek,mt8189-jpgenc.
>=20
> Changes compared with v5:
> - Patches 1/3 (dt-bindings: decoder):
> =C2=A0 - Drop top-level minItems/maxItems for clock-names per Krzysztof's
> =C2=A0=C2=A0=C2=A0 review.
> =C2=A0 - Refine allOf block to strictly enforce clock constraints.
>=20
> Changes compared with v4:
> - Refines the device tree bindings for JPEG decoder and encoder.
> =C2=A0 - Patches 1/3 (dt-bindings: decoder):
> =C2=A0=C2=A0=C2=A0 Moved the standalone compatible string mediatek,mt8189=
-jpgdec
> =C2=A0=C2=A0=C2=A0 into the first oneOf entry along with mt2701 and mt817=
3, as
> =C2=A0=C2=A0=C2=A0 suggested by Rob Herring. This correctly groups all in=
dependent
> =C2=A0=C2=A0=C2=A0 ICs and removes the redundant items wrapper.
> =C2=A0 - Patches 2/3 (dt-bindings: encoder):
> =C2=A0=C2=A0=C2=A0 Applied the same logic suggested by Rob Herring to the=
 encoder
> =C2=A0=C2=A0=C2=A0 binding. Restructured the compatible property to clear=
ly
> =C2=A0=C2=A0=C2=A0 distinguish between the standalone IC (mediatek,mt8189=
-jpgenc)
> =C2=A0=C2=A0=C2=A0 and the ICs that must fallback to mediatek,mtk-jpgenc.
>=20
> Changes compared with v3:
> - The v4 is resending the cover-letter, because the v3 cover-letter was
> =C2=A0 not sent successfully.
>=20
> Changes compared with v2:
> - Dropped the dts patch (arm64: dts: mt8188: update JPEG encoder/decoder
> =C2=A0 compatible) as it belongs to a different tree/series.
> - Patches 1/3 (dt-bindings: decoder):
> =C2=A0 - Changed the MT8189 compatible to be a standalone `const` instead=
 of
> =C2=A0=C2=A0=C2=A0 an `enum`.
> =C2=A0 - Added an `allOf` block with conditional checks to enforce the si=
ngle
> =C2=A0=C2=A0=C2=A0 clock ("jpgdec") requirement for MT8189, while preserv=
ing the
> =C2=A0=C2=A0=C2=A0 two-clock requirement for older SoCs.
> =C2=A0 - Updated commit message to reflect the schema structure changes a=
nd
> =C2=A0=C2=A0=C2=A0 hardware differences.
> - Patches 2/3 (dt-bindings: encoder):
> =C2=A0 - Changed the MT8189 compatible to be a standalone `const` instead=
 of
> =C2=A0=C2=A0=C2=A0 an `enum` inside the `items` list, as it does not fall=
back to
> =C2=A0=C2=A0=C2=A0 "mediatek,mtk-jpgenc" due to 34-bit IOVA requirements.
> =C2=A0 - Updated commit message to explain the standalone compatible desi=
gn.
> - Patches 3/3 (media: mediatek: jpeg):
> =C2=A0 - Refined commit message for better clarity regarding 34-bit IOVA =
and
> =C2=A0=C2=A0=C2=A0 single clock configuration.
>=20
> Changes compared with v1:
> - Patches 1/4:
> =C2=A0 - Updating commit message
> - Patches 2/4, 3/4:=20
> =C2=A0 - Updating commit message
> =C2=A0 - Adjusted property descriptions acorrding to hardware requirement=
s
> =C2=A0 - Improved formatting for better readability and consistency
> - Patches 4/4:
> =C2=A0 - Updating commit message
>=20
> Jianhua Lin (3):
> =C2=A0 dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible
> =C2=A0=C2=A0=C2=A0 string
> =C2=A0 dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible
> =C2=A0=C2=A0=C2=A0 string
> =C2=A0 media: mediatek: jpeg: add compatible for MT8189 SoC
>=20
> =C2=A0.../bindings/media/mediatek-jpeg-decoder.yaml | 48 +++++++++++++++-=
---
> =C2=A0.../bindings/media/mediatek-jpeg-encoder.yaml | 29 ++++++++---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 44 +=
++++++++++++++++
> =C2=A03 files changed, 107 insertions(+), 14 deletions(-)

--=-Ge/8Q+z1/L/Ug2FhDTGi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaeI2DQAKCRDZQZRRKWBy
9FAeAP9hNlBMJeDwrd4Q36uw0NTXVgqg2wu5S1txSqHzY2sxkgD/dIedXuzuO0AL
3iduYnYusZ1QaDh8eK2hofWngg9wdAc=
=4Pdh
-----END PGP SIGNATURE-----

--=-Ge/8Q+z1/L/Ug2FhDTGi--
