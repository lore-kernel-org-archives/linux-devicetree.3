Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172433;
	b=Ij0p0qck7/5W0V8prRc19IihTfhBdgEKL01mDzxHULW0W9Ddbnk4fgwWFvzH+fLOiTHO
	 obVBRANCEKxS1Ya236npfYira+wrbgEY3vv7IhjHIKDhcNzrmtl/0/raQDTc6KTlsllwp
	 1Ip+TcdfKh9bOWAmsX/u41WX/28sCIBAKamexHOEKwz43ebNhxWF7PGE7TlItOS+BVuXB
	 nCjB+8pIOqM+ro3LkdnO7LL4akkh1D9AxiIreEPYxs3eVRVP9uvwekJIRc6M08LSaj8t3
	 cQDfkB2fZZBIh3qVsaWTQ2ccsTf9N2F1VtVht4z0fsEWHJuCyaz+1g3cV6HZnx/h4EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172433;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NfsiPlfeChHXa7FHvQGdbAbZ+3j7yl2ALAzQCNxrtJ4=;
	b=T0ODjygQ5SeUD0f1ZqrOPCfztu8lg29v5NJ9eTxKchAw26xFBXhw850+zOK7y/62fpaa
	 As85AOfAYuWiV4hmpBUrrASDUvuusMF/Mn4YqnDFlT0XcARZIAxUcL4jp24xhv3R/38O1
	 J8PlPTcsD9j5feRm1iwtNzOXX8GZHuswQCbFB79I8JdWppAGD4J4fuFu25erivhIHDpde
	 MhaJPgTinNYeazy/OaiT60XuZhxIqRu48ObvoS6TsojZO2s6VUjB2c1RXLGiKoKmFlmA5
	 HZRim9WJMvfET3q3+WQzSOENlfQ5a4o8YhvpJfr050SRLVltbfjquV9tbkAN+5E/e6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhxDaZTL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091B606A321
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhxDaZTL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95ABB1F008A1
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794172432;
	bh=NfsiPlfeChHXa7FHvQGdbAbZ+3j7yl2ALAzQCNxrtJ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PhxDaZTLZY29YJj12vefUX8VejuSNpYiKDMljPrZPNFItV/0Ksylb5Lbh0F0AnkzI
	 uyaoWiKLlLJAkREBTeCBDzVVgsu9zuwpU6qDMR8iMg2KActNrJZYcLSPqmyx+9CkSl
	 roZjaauC7Ph5khA6kCDq+L0BrHdeq7AbGCze3KZyRtqnJHzNmjOi37wJ0ksaF8fh2D
	 vlIJjc6zDuE4kV0nI4u6feVXLZBUO9CHOrzLbNYZyLefnfj0ggV3NqHRgBsMu/GhnP
	 0oROLr6cWtKgoduglgHVzeVCRgagD/CMmGfwiu6/rFwBPDFkVQCm7S914dnuGM2THV
	 7JVjahEJ+uSVg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso171140e87.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:13:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGK6Gvp1q6iHiLiFSXGOoaZH1bdkgLpzYiEmFt4//wTZi4JX+1spghlyg3gWTCD+hJl2ekR4Tpl6/z0@vger.kernel.org
X-Gm-Message-State: APuU4Z8tWrpjv9ORLsqXuZ7hsn3OsaB211dm+jzuNz2ELM+2wdUd+AO8
	1uciaPNzcIYiKuzsLqoM/dB0ptHum0QgG3rlYmVJ7+qouVy9/R1BltaBNjhrtCY1R0/lCxc7zCI
	crj8OyDtbX2afFjc8bTH3//O6SUEh6Yg=
X-Received: by 2002:a05:6512:1083:b0:5bc:f2fb:f50c with SMTP id
 2adb3069b0e04-5c14c013534mr466477e87.53.1794172431399; Sun, 08 Nov 2026
 13:13:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-gp2ap030-v1-0-55314eb7055b@kernel.org>
 <20261108-gp2ap030-v1-4-55314eb7055b@kernel.org> <20261108002155.29740ae6@jic23-hlaptop>
In-Reply-To: <20261108002155.29740ae6@jic23-hlaptop>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 22:13:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkMRe-hNB0=8G_K5tmK6PU0H=zm1Evhm_azW=nLDa9C9w@mail.gmail.com>
X-Gm-Features: AclHuK9Xc9_YTR7KHYkysEhO-qFuV54hOhTZVduK87r-rNPmyMy5nO7aPl1v8WQ
Message-ID: <CAD++jLkMRe-hNB0=8G_K5tmK6PU0H=zm1Evhm_azW=nLDa9C9w@mail.gmail.com>
Subject: Re: [PATCH 4/4] iio: light: gp2ap020a00f: Add GP2AP030A00F support
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 1:22=E2=80=AFAM Jonathan Cameron <jic23@kernel.org> =
wrote:

> > +     /* Bit 0 is reserved on the GP2AP030A00F. */
> > +     if (!data->chip_info->has_als_auto)
> > +             op_reg &=3D ~GP2AP020A00F_TYPE_MASK;
>
> Perhaps set it explicitly to MANUAL_CALC

Jesus the name of that flag. I just shudder whenever I
see code referring to "manual" in a computer program,
as if there is a man in there, or we throw a prompt at the
user to fix the issue as if there is a manual gearshift.

What it actually means is "imperative", as performed
by a machine. I will grudgingly swallow my pride and
go with this because I suppose it is the name in the
register description in the manual.

Fixing up the rest of the comments!

Yours,
Linus Walleij
