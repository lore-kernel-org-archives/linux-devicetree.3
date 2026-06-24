Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1F3D9DC3
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313530; cv=none; b=stJSHHgnZUCqpQilD6vgHlypKZY4oJ1lxPKhnz8VaOivAz9CZDSu8jWIc4HpmkfXlE6qgXNKoYMzzG0Q/NrCVI7UI2Q8xYcqc/KcV77tPkJBoft4lLoRgi5QzDMLjWUwg77aYxVGtwtf0+PkN/+8pFhfN6hm68ELjy+E0j3e0hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313530; c=relaxed/simple;
	bh=aRvcfWjS5ra1MavtT7Q6r/Ex/UqKwindq/WES4SSRVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4EDso6ZjEtMBkFtsm4Fl6P0T/5FbcROyQ0MeBaIUQz4cDXtd5BC0tWTR7StS0Rm4kk0Cz+djtgzxGlOkP3iaYlxbP3F3k1EVUFHz4mI8LYhygcyJwddrSlUFimsneE9ffBJi9BHllnd94b7AEQh0uYsiHJXqqsr7DeRuGeP4YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/32WMLN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/32WMLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122771F01559
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782313529;
	bh=oxPQMTZQmusZ2I0wP/LPEpqZpEgpNgEfkyIN2a4Ghts=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h/32WMLNicEsnxUQtcylQhm+CEuHKgkD3hcU1vuCzc5hmIOzl4HFeQYGfx2cg33/m
	 5rcWJckaDcfNr3zsVslf79V1tS6g/1a5kosO4XhqNUo2T4LjgMSUqBIJfDYelIv2FV
	 NPfnOeMaWEMM0xTQlvrh3AJ0idfpngf15qDDQpnhZTEsRqBaFAunzVJXJvdDe6n2+0
	 wxgLBs6LBuvH4ZfaHuSzOPdFlXYbKsrWk7FbFUhuPQlic5zf08qgeoB7QfR7T5fpgj
	 c6xhclQkG/tVIDMwQJPgfs8bj2KQr6tp6Kb/pkjlXN6chIdpnOhWgWJSwfYhJZXbAR
	 3kCmdk4DVQHZw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c0c41ff84a6so188807666b.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:05:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Yw1H+xt8AxUkvQrXd39cUblZ+HNrLOEAvY/fzV8jNr2RGJ3Wa2O/K8u81sHiVxQSfDBTLPAABzbaY@vger.kernel.org
X-Gm-Message-State: AOJu0YwK3cfL10x2a+4kB5RLrH8rNIer9ivYowtTQK+WvZZfk1RjFGfr
	c/QdfwcLgP8yyHscwIrDwMhSJdAx5aGLS9dlQzsq38rdQGeKpo7UZEX+rpLDajGCyQHujJhLztd
	E6NSdgI2qLdqd9vyKn+OxHdYNbuXB2Q==
X-Received: by 2002:a17:907:7212:b0:c0c:d278:cc31 with SMTP id
 a640c23a62f3a-c119f617777mr201723666b.53.1782313527559; Wed, 24 Jun 2026
 08:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
 <20260620-sc2730-regulators-v6-1-bbd2db395231@abscue.de> <20260624130613.GA4054894-robh@kernel.org>
 <878f8f38-2294-4097-9d08-2aa04bfe773b@sirena.org.uk>
In-Reply-To: <878f8f38-2294-4097-9d08-2aa04bfe773b@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jun 2026 10:05:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJctGCQrHjesJP+xbQ43fwWaCONy4A=L7i4jM9zE-ZC0g@mail.gmail.com>
X-Gm-Features: AVVi8Cd2cX3oat606rg5OgIyF7gTvCkn18ULdhtaFqelknaCm-ODyXPZvCqk1pM
Message-ID: <CAL_JsqJctGCQrHjesJP+xbQ43fwWaCONy4A=L7i4jM9zE-ZC0g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 9:13=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Jun 24, 2026 at 08:06:13AM -0500, Rob Herring wrote:
> > On Sat, Jun 20, 2026 at 10:54:00AM +0200, Otto Pfl=C3=BCger wrote:
> > > Add bindings for the regulators found in the Spreadtrum/Unisoc SC2730
> > > PMIC, used e.g. with the UMS512 and UMS9230 SoCs.
> > >
> > > Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.co=
m>
> > > ---
> > >  .../bindings/regulator/sprd,sc2730-regulator.yaml  | 44 ++++++++++++=
++++++++++
> > >  1 file changed, 44 insertions(+)
>
> > Applied for rc1 to fix the warnings.
>
> Warnings?

Well, one warning:

Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml: Unresolvable
reference: /schemas/regulator/sprd,sc2730-regulator.yaml#
