Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBCE33C518
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776541725; cv=pass; b=o0S8Cs1lj5wLYmnG53jXwOyugp2o4wA5GndrpEAFI5WgYN57NUPWH402FjdrQ76ikBUBQzYzl63bQaY5lN/beCXtNLVeOszgdA2jLncWJsKBZfHpRAv11weW14eDFSHz5+1jjAM4aGDn7+N4tHDpkE6PcHe9MRhIwBCG/HI8nsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776541725; c=relaxed/simple;
	bh=QNnjirEE9+taUl3FOqtm3HUbAhNxM6+8spyvJkRd0Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuSVvSPPGR0Ul/0nOUMxOBv47WobT2Hj7D57cAVGTC1SlOBC6Duf0EiOFnepB7giITAWFLJloo7NOv9bMA9qR/AKRZnIE/JN9BW/WVc6za16LIXCbmwWgY3frJEX3ratfbsqRVArlkld6mvovyP+fMrPSP1cz1Ivdio0JdJEIQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJHFIscF; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJHFIscF"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so1179080f8f.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 12:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776541722; cv=none;
        d=google.com; s=arc-20240605;
        b=R46u7aZo8zjODKsyDgkt+LhkrFgq8B+yTe8ZVpyyRVATk5BQ6UMvTF7t0v18kibfHd
         HgxeKmpvvApEc7vrvCF4+uK8UVlAUDAL0ncu1yybv3LsBgrjmll1dx7E0KIn8FCC8U8x
         Q2kaidLVlcnOTAfmmOo+VSTkZdPDkgZJJHiLQNANagcLtbjMl8VYNsRm1y62vzHawF1F
         8UlAlCJuE6V/bU/l0xuhyrX8KocME9cNC25KfOcU6uo1FA6gFRpQQ8XQfPxG005cPZzG
         8abZEPaB5P99hVrr0R6tyZeI8SDfbJC/SLKz6k0d9DqWwQofKwxl9/c7qucuVqRBSF8m
         mWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KfNIvP+kGakhsVtQCOsk+NZ8Rg4P7VrKNiU3gLYB2YU=;
        fh=QeSQ4AqlB+DupnB0Epzgx0P40sG4mX4G2/6yYZS/zQA=;
        b=MawLdwdS3/FzMFD9XZ8Pel8UX2+TXW54eC++Smd4n3nJO7UhXVsfEFRFf+ewM6k5ho
         DawzhNhHK6DA3sOx0up0OeuFbb1UShbBX9nuGq5rDomlfJIc7LHBL54QhsCUAL47WbGy
         NaDFjd5O4kRcbRIEXj4/p8sHAXVUk3oWUmbD4ZkQfud0nz8hLk8Q1luyN9Cz1++U/APJ
         aTvWp/1YCsvIyp9yS7E6nVjVcHjJNT5ailqwWlGJ8Ts3SaEBeiil3xk67bs9mB6uN0nB
         Hq1/DSSxiDgAd5oZ8dAu+YeraQJNwq5Af/mWOK+jBG+dbVEsHRdzTjgMfn0VwZC/WKZP
         +pXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776541722; x=1777146522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfNIvP+kGakhsVtQCOsk+NZ8Rg4P7VrKNiU3gLYB2YU=;
        b=jJHFIscFwOGbr2nIUSFFZqnEcSGC7zuP+sc27v9AvaE8SZ26xYQvKuyis5oDl/b5bP
         YoW3UnjvSovARvlKMUz9vQWkN09uOcODvP8zeLy3iAM+6Cm52CX4Yr9yZA7qSZls/4df
         x3Gtr0ilaFx/nLUvAQmPW5vuIg/b4GAH52Dyt55ZpOCAwfVzvW+LqPbiLC+IIw0FO+MP
         J7jdmSU8sPBLnQQ2lo02+o/YCshDtjWWdZU8kKkSXCkOFzhNOl1yiX+N66RA8B13yWRJ
         kOB6COXhkE6xx8YBbz44F/lWBerSrhbZbEilsJGpK18E4poa1vENZdJhUAb+KqmS4yYs
         rU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776541722; x=1777146522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KfNIvP+kGakhsVtQCOsk+NZ8Rg4P7VrKNiU3gLYB2YU=;
        b=gXhM7Sor8i8EIrsDa5E/a+r9X1WD14QJ3LK4qgA1dgQf829ig8WnTuJJVk0oJQp7dm
         3w+tyQb1c8Nht6t5GiQARzyinyi8DbZLcw3NnSszJphSX3O6TpHKRVD5T6/RVr6fYWKk
         zONCbgphjOexxBZCFcAo2/U35ggbzx84MQGxV/URKNiyHqcosDmQFlDXsq6DnsxFp8e1
         be6OjqEkK0yNuj1rszhbGR3qR194+LyxAPWCplr8vk1Mwc+UzWG7hYG2fOqwUlmoQL9B
         kVo98E1Q8C/akif38AQ+ybJ55GqfcCdQUwok0L4IYGMG2nyI5nqByv0uXoAQB+URfaX5
         Qplw==
X-Forwarded-Encrypted: i=1; AFNElJ+hA+sgiLdmV69u63jJKBeuTfmujmIICsq9lzNPqVX+jl2A3LL+OwjLJnuNHtY1dXdpWZZQ3/YxEgSL@vger.kernel.org
X-Gm-Message-State: AOJu0YzkhJluMPAJRniWYhbu/OA6BkXJkq4Qcw8+JSZqUdZgZ+2Z3yub
	ruoeEqDHzrXxFZHmbF/psCfcuQdH9i6wld87au1ev3AGMnugL6Ff0t0cMo6oCGAFS67Fyqeuc9t
	pYRrzPPtecueVJbTjv+rX5SBH1b1asuk=
X-Gm-Gg: AeBDieuw7JBe599jsxv4J8UK1GY0WmMHOuAh64SUKHuNvKVxJA936wwUgyxfgcqhtsn
	d8TRkcEldrjo5x52wPozIp/nWWMNygIJ1N6n83opxyyxRLLFvhV6kRnjtbO/SwZvGCzeDdW26N9
	hgNLFJOrwE6Wyq5V0f7uzvWcLo2QqqmuJR+gAH1xRj6Shk1LyzDWfzrEOAupaz7f+gEx1Ruj32g
	NRQhEw34eyFIddv/lIkI3gx/OKedWjeFlpItuNnn+izBiUCS6XpNDFOQ5Pv8Lf93K5iWzI3PoAJ
	+nibZmazYysMoxTAJ8M=
X-Received: by 2002:a05:6000:2dc6:b0:43d:7512:6f7b with SMTP id
 ffacd0b85a97d-43fe3f35785mr12170312f8f.5.1776541721541; Sat, 18 Apr 2026
 12:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418144716.132936-1-clamor95@gmail.com> <36e3611d-642e-42de-9a56-cf81c3e06832@baylibre.com>
In-Reply-To: <36e3611d-642e-42de-9a56-cf81c3e06832@baylibre.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 18 Apr 2026 22:48:29 +0300
X-Gm-Features: AQROBzCxF8i16JN26FDAkpF1ordk5znfDFdpoQnWkq3YscwGp4AejBpZy9piygU
Message-ID: <CAPVz0n1ph0Cjw9WOqoVPaEywF0MzaNXeEjw6=0rKf4qLWiJZtw@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Update APDS990x ALS to support device trees
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 18 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:2=
4 David Lechner <dlechner@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 4/18/26 9:47 AM, Svyatoslav Ryhel wrote:
> > Document Avago APDS9900/9901 ALS/Proximity sensor in schema and moderni=
ze
> > its driver to support OF bindings.
> >
> > Svyatoslav Ryhel (5):
> >   dt-bindings: iio: light: Document Avago APDS9900/9901 ALS/Proximity
> >     sensor
> >   misc: apds990x: Use more device managed approach in the probe
> >   misc: apds990x: Drop Vled supply
> >   misc: apds990x: Convert to use OF bindings
> >   misc: apds990x: Drop IRQF_TRIGGER_LOW trigger
> >
> >  .../bindings/iio/light/avago,apds9900.yaml    |  83 ++++++++
> >  drivers/misc/apds990x.c                       | 197 +++++++++---------
>
> As mentioned in my reply to the dt-bindings patch, there is already an
> IIO driver that looks like it could be compatible. I'm guessing that
> this misc driver pre-dates the IIO subsystem. I would have a look at it
> instead (drivers/iio/light/tsl2772.c).
>

tsl2772 driver fits, thanks for pointing out. Maybe you know how
apds9930 lux table was calculated? It is quite obscure to me.

Obviously this patchset is obsolete and different set of changes is require=
d.

> >  include/linux/platform_data/apds990x.h        |  65 ------
> >  3 files changed, 187 insertions(+), 158 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/iio/light/avago,a=
pds9900.yaml
> >  delete mode 100644 include/linux/platform_data/apds990x.h
> >
>
