Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A727B343
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598635; cv=pass; b=H5zTymj8M6mOLMOqhBZ8vRI6/KeaJ6jrRfej5lnc+gPDUyoJMKY/407giUJ9WaRaW8GxA3JFoP/p5fe8kj9W7N+8SF+XtVaN7lPhCuye9xFAQo+wtZGeMd8dMwWmUtb9prJWdDoWlCA+I+uFEnct4oPOb9knhEVkcgmpps27QWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598635; c=relaxed/simple;
	bh=huKQAayLatyglgFbqKm96EgnqJce6Ukx2wu42Xr6OGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etUopK4lpkW7aHO6+1yxwbyyB3D1xF3QfYiZoFPaMlz4ghdxLE6W6HPi4lpe93OIi8lt7nldmhAXoUIF/iCwScorL/uItsuk27lpQTsEHL4Q+b0bvN6zyROi/VqsrNVHklJn2arh7JcDK+dEeEB7Bit8y0M88YVxDMHf2G0tlFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=qZhw9SfX; arc=pass smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="qZhw9SfX"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df964b6893so12832075ad.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 05:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790598634; cv=none;
        d=google.com; s=arc-20260327;
        b=Skf+Du9BxrpBttAymCQYOjKITVogNzgLlBXwleB0lBeSnkPU10g/tFaEh1JQ0fZNK1
         ph52GPRWjZxBdLPT9i4EY327OK5a+s0kCPlA62dHzxuXqD7XkvVSwNjTV2aEWjSyGoUX
         6FVkClnRiMHhTi3njR91VR5XQo4710waJNR9CLgLpdbXrDsd3W+rgZrNsT9UBWe+zXcz
         py0LTM2BD4Bmbt8VFyQH2yJWCVToGBqgTAviYibNvKmqV2zRodZO/s+LcEs9o9hvLHDj
         Ca3FdzZwJE93TPT6EEJQ/MXCFkLPTuU6GYAKbSAyRqtCCFJgJJqh5cVmRQipR+3cOL5q
         8j8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XTyKOTKAooo2ab7rKhntAizVnn77+wfpctlc2hgSt4A=;
        fh=lR5vXXeU+QcoQJRyXwraYRRbI6JgVEymToUxCJdA/t8=;
        b=LsSiaUmMNcvq24yiUhO+jk2v3Qhx4Ziz4qjbtOfH0f4+LTcWZUReTmXhosTSat0RR9
         FKCxPqUUsh5qewstTutT7hbZ830KnVQxvNGacegaWTaIQlSUaIwi1vmKgWwEj0MsIteV
         PWN4VfA6jW1YVVtEr/sl37tHbiFz3bPZWM5aXaxa+byJOn17rjnKo+6c/4i/a9MN+9Vt
         YKShW1pREH2schOY+fTRHqkJMCv1pi0eDESf+VGg1z3WQcJbwmOpHif+wiaEdDV9LGjB
         nsaT7184fR4NHtWdPAA76BWPNgLIfqJaZvsOJ+4Iw8gUSdTgGSoNz14KG+fYPL80Zrrb
         WS4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790598634; x=1791203434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XTyKOTKAooo2ab7rKhntAizVnn77+wfpctlc2hgSt4A=;
        b=qZhw9SfXzomlQg37NZRw1Gf46SkuvQpa1N6CnCdxoIZFJp2k0xVBzXcqYZZThhROeH
         SfRmjmxGCBGAmWrK0LNQPrTvqOquGpkS7TpdvIZQC2Jr2atdg4duBMcf6150KRFfQiVh
         oZdFJnDL85s5C3W5/iEFSEaC22TJDPQtDQ2ZkzvBYtUQfKAjwS1DofdgR2qgqGNOfgs7
         2OyVBIOIZ0dp6moCcgIWp5GAZbHF2MpOFofvVZg78+myDy5r2PCMokAnjmVe+NjznNhZ
         U//VZZkqcqzP+Kf0IcBShcvIsrixiAl4sRZZNaEaIaGoIshANK2HXq5NIJVroLgcsbCE
         8RNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598634; x=1791203434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTyKOTKAooo2ab7rKhntAizVnn77+wfpctlc2hgSt4A=;
        b=rUi9kLwa8jqpAkvnxzaCmo3nvRjMIDpkrd5kJtnFYueV05VVEAnO/1HZyu8e8wNaSf
         gnQxWFkspGhp8Cefnc2ES+JBF6W9TgCksvCU++eOlQblYiwKATzIberNdidoqYIs8KHI
         UT8umPhzwUzmXNkrYI5ePzp1QxP8jbLUlrS4jiq0yEnifi7AzQvgApq/lGPmbKr2UyE2
         D0EyR9gJnpBFKCuTfJoK+qXjTRqv5gUisoFeEp0IrrxliRlIl/c+eWHBIu5KWorrKl1o
         kuvPIjKZg1k5YTB+9wcNxDZWMF0R3Cbl8T7QxbHWe4RXo67nlPzbJyfc4rjZ77oxBojd
         xQFw==
X-Forwarded-Encrypted: i=1; AKwUvBwJUY2ogbv0RcNYBALWjtBmQCkzqHiFlEyprY0e7HucEbMEFrt1lk9svwVvQV9y1K9PSKZTa7DUGJwL@vger.kernel.org
X-Gm-Message-State: AFq9FYKrOCYt3UjsflFXsHjSpg5IBNVgAeBMTzbgZe6Fag5lUKhTJMXI
	xDT2iADPa/jgeF0xR4tiR6ObBDBdY4KhWejXW63NwNnbWoLXUNJr6d/sEm7k+q1vJu4o38C3qh2
	zsQgziqw0D5F+YDcS5mdKUJUuCdsTo/GzbBzo9VhKlg==
X-Gm-Gg: AYBFou0hLyhnehgvyE9kabdToWgO9orPOBmCzYbOUL5wTb8XUulL4gR2hglWu3NtgN8
	yAeQ7dihAHxrldq1AJ0boLiaSrBt3lpcSi+ZEoowrC1OAtOpLzL+Ky+FEAmfol5Br/r64mBuEF1
	V7HUCzQWB3k1+hbndFGCQez5QzfpgOqUlFQ1+m1RpLooTe+TmxEbpBwWE59z8RUPWW7Raz7Pk+P
	YYu+dMLTaC3oax9p0OH5q9ROx+FdbyUJGqnkPFuKSDuQdvzTgaa3nZzMsFaraMaMsN93gN2x8bx
	aRJ23hhextEJkVXOW0VTBPhMMDA1UrcWFU9u5hAR7N0at0WJjNHd7lMGu9EV+IHNxBvhxdtVcLa
	r01Uvh931yKHGyQsYlNt1xD1iKQXa9yB3494=
X-Received: by 2002:a17:902:f54a:b0:2df:736b:d7df with SMTP id
 d9443c01a7336-2df7dc59ed3mr102946795ad.42.1790598633625; Mon, 28 Sep 2026
 05:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-6-robert.marko@sartura.hr> <tl5ep4ze2e5ctv7c47jsjedvcpnibdspo5az7a73i5p7iwbivk@vbtd4rhtvroa>
In-Reply-To: <tl5ep4ze2e5ctv7c47jsjedvcpnibdspo5az7a73i5p7iwbivk@vbtd4rhtvroa>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 28 Sep 2026 14:30:22 +0200
X-Gm-Features: AclHuK_ApYIEoqpVKRFrihxpibz6Yiy03tz8KYmapFitKvFghmCeqBLThyFR5Fc
Message-ID: <CA+HBbNFRufMuhuSiPnJSgSMrGMN6DeskS3kLLogwHk97oHzx1w@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: microchip: ev23x71a: enable QSPI
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, adrian.hunter@intel.com, 
	aubin.constans@microchip.com, ehristev@kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 10:09=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> On Mon, Sep 07, 2026 at 03:25:33PM +0200, Robert Marko wrote:
> > Enable the QSPI controller and describe the onboard SPI NOR flash.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>
> Missing '---'
>
> >
> >  .../arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/=
arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> > index 4012ea7d07bb..985ca31e74e7 100644
> > --- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> > +++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> > @@ -463,6 +463,21 @@ phy27: phy@27 {
> >       };
> >  };
> >
> > +&qspi0 {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             compatible =3D "jedec,spi-nor";
> > +             reg =3D <0>;
> > +             spi-max-frequency =3D <100000000>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
>
> As sashiko pointed out, #address-cells, #size-cells, should not be
> necessary here. I dropped them and applied to microchip-dt64.

Thanks,
Will drop it from future v3 then.

Regards,
Robert
>
> Thank you,
> Claudiu



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
