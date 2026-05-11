Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BED4219FD
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516262; cv=none; b=cB37WSMcHIkyJniPsI3l+UQ8P2Cr9J/gY77ZJeGH2vUXFfB0LABGMy20XcBGTBzRYzAobwzhJh91iMUn22senCQi1KUIMtQ7azAUAhTpnynLh0vgGsoHZm93jyHS9dghDUAdExSOASK7eZEYfOIuFG03IjA65I8v/J34kwsSFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516262; c=relaxed/simple;
	bh=snIcOk1xMSTaa9lMcB3wIhJWh+KSiFp8e1pKlLk1omE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GDdlWaGbcKHPS6plIRSLLvZzsbpuUOLTEt2Ix80Pg8TnDbsOHdsktKM1jMEtvkm+q5ZZKIUiR7QgRcA5Ce25Ebc25hEbzhN+/pHBvK6nP6r4Ycj/3V3ylABWh68emoTkzs5yh+uzF3jIe/Wuhq3hzW0zxweSuaGhUhg6j+biUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHVLS2sj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHVLS2sj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so77149125e9.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778516258; x=1779121058; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=snIcOk1xMSTaa9lMcB3wIhJWh+KSiFp8e1pKlLk1omE=;
        b=aHVLS2sji376mHVbb7IAXqsVuczgcjFpJtWOS5W2Ki9lxwHJP2mbud9cmHX/LMMykU
         hdAaZ8p6i0y1SX8Zt5ngNwvDdVM0f2/0HJAFTxsWvNgne++tfbRRhDmDOjtwdyrU9EoA
         HfBfo4pkfTBoZI4XNZPuMqxmjFEQFL4qUKyfQZIQrqPf79Bg9LdLAYeyG3RreS7uRnxp
         lh/a9fF3YcRUNVKilw5F7iV5RtNkqqQfdpCnOLJujeCGvTyt2GmQJcLUB/fml7ICCccv
         RnHo0rssv2opGKOJzS+hkEhv4F28tBIKEUb2byogzqX0N1P8t8OChvUZoSsNUyZkVTFZ
         fMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778516258; x=1779121058;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snIcOk1xMSTaa9lMcB3wIhJWh+KSiFp8e1pKlLk1omE=;
        b=NKO3t2wBQ2Qm1+eC2GtyMc/DJZZH0sGDUt+ciZ42zz5utrI1jKlstDz09ABMF0HPTH
         Y2FTI4ZD9txGwUkg3UxaCMccrXwgOU2wX9ds1wXdQmsG3AtPjrxZBpmzSCIcmDaOlgkM
         1VET7pw3PTFFLSOIAU4cVDVv8urwsHPWhheDmvK2mY3pPkxbJxJDIHPLwt/ASQgVEat3
         le/ehuC+Vy/uMqUciaNeNQHGb32BPX47mgNuhaPLs5z43LVmwJYyIk+IZwwntsd6J7yy
         hzGF3dtbyI9fDTX1qds9rARuZuSeIg59ATnm/9EFXQTaQSwb7OO8LcEh3nR6mgNN1boS
         rhCw==
X-Forwarded-Encrypted: i=1; AFNElJ9qbw0XI9L/aJL5soZvdDbBxe5P2NPxsy2ac3S4hjRtBF40DG1OCqLsvFqB05JbzzZKfGXYMh5423um@vger.kernel.org
X-Gm-Message-State: AOJu0YwBZV0W9Uy06o/+EhxXlREyI7VlDCk7LuTv8oFBUyv9egm4tgc3
	JqTMfsq/Uw3oDwVnntTzy5SXWScyGCX6lzlr89syyrNcxCGJ1P0bKR/T
X-Gm-Gg: Acq92OEPQ3g5Qvl3Blm7hkr11Eb4BHDxnZJFIupksfVynmhyhfgtvz0AgAM00K018db
	No5N/lcoijfzYEBhhkCn9ssQ5RBbhKdivc00r33FldtMq4nPrQIrm6JVcri163TasS2eSRNHIcg
	SbnrD7oVboh6jxHLPplbMkHKOBGT3SZZdr1CTMOw7LyyO/wBzJWehPBnmo9QKr2uVlCCfRlKKqQ
	zH+J1Lo5uaEiE/YOT9XSCMWJGmW6MmEq6HZlDWuGZfZF655dG0AkqDw21pM8go9BWS7GtNwY9/v
	Ybeq8IJYpIa4p3t3757IUgR/VYcX7IAk45A7q7GNUg2y8iTBFUB/hrPRaxs3e/r1rwTSHdVe0H/
	G28fmLILg3R/5otU4z52MJBQZliUeFa7ff/5glSgXV72YRusz4u1o+TRoMowFodOAgeKHyoUtiQ
	FclmM77KD4Vo+26s6FtxJI3qI54uIJyd7xGUveXSe8gHkkhETadaTnvvqKCEjln+yadibinNnbk
	7JQfqs=
X-Received: by 2002:a05:600c:47d3:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-48e51e0bb62mr257112665e9.3.1778516257805;
        Mon, 11 May 2026 09:17:37 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e566cf7sm472495e9.0.2026.05.11.09.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:17:37 -0700 (PDT)
Message-ID: <d51ab76d9f658aad542fa24651d1083e31628038.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard
 A133 compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Andre Przywara	 <andre.przywara@arm.com>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 11 May 2026 18:18:22 +0200
In-Reply-To: <20260511-stock-elitism-f1f703bee1a3@spud>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
	 <20260511-stock-elitism-f1f703bee1a3@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Conor,

On Mon, 2026-05-11 at 17:08 +0100, Conor Dooley wrote:
> > Baijie HelperBoard A133 is a development board around their A133 Core
> > board. Introduce a compatible for both the Core and the development
> > boards.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> >=20
> > Changelog:
> > v2:
> > - introduced baijie,helper-a133-core compatible for the Core (SoM) boar=
d
> >=20
> > =C2=A0 Documentation/devicetree/bindings/arm/sunxi.yaml | 11 ++++++++++=
+
> > =C2=A0 1 file changed, 11 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documen=
tation/devicetree/bindings/arm/sunxi.yaml
> > index e6443c266fa1..d7b9dec81165 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -96,6 +96,17 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - co=
nst: allwinner,ba10-tvbox
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - co=
nst: allwinner,sun4i-a10
> > =C2=A0=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Baijie Helper A133
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: baijie=
,helper-a133
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: baijie=
,helper-a133-core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: allwin=
ner,sun50i-a100
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: HelperBoardA133 Core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: baijie=
,helper-a133-core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: allwin=
ner,sun50i-a100
>=20
> Does this make sense? Can the core board be used without a carrier?

such operation would be impractical at least, that's why in my v1
Core board didn't have its own compatible. Maybe I didn't understand
you correctly.

Shall I drop the above 4 lines, the compatible property from the
root in sun50i-a133-baije-core.dtsi and only leave
sun50i-a133-baijie-helper.dtb with 3-strings compatible as it is
now in v2?

--=20
Alexander Sverdlin.
