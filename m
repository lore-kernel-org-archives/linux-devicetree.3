Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772515;
	b=eAUNK5TdKOw5wTLG5C9TOtno748Xtsmac2Cm50ND+wO8UnyDWwMcQx+tJqPe4aSZ8+ox
	 lIK9p2jKxP2i26xjdJYq+Zl4SGzTFVNhQZq2ZnmFw8hS3p5CBEw6wvuTD6rDwWH+KxDYs
	 BJ8Iabkq4GC/emQ+ohvUtNexzBzjZOBoJ62Q80rY+a8n5R6Gewf5f8GgauZxI39R4H8TK
	 ikbH7vmloSzfxv5xSjP288Y+367Ms44Kf8WO6E+xhJ+aWKmJqzkKS0r2nTVgCdhzCnwX8
	 wIJlTa7XWyz+75J0rg1vYzWxkWbB5YQgEVw6vbuDiS5Sy71hKKVNOE8PpDsFS6aSgMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
	b=B8hI6S4zdqUg0usGBxsth8Lapr6JnZdUQyFwofArRZosBkl/2vGr91v1Qqv1wxZcgYgb
	 /b03pSEbmHLzefQ+PM+OYNzwGeo+C16wZ4WSwhEVCT1pvTHsnpDHBIC5tItw7XrkjbdQ2
	 w8UuNsNIxx/pE+ejN9HqjJF6r2/UUbfKyD7Pdyer80LvnZtkkbXzwCjFZGvSOayu0ZXfp
	 ltGT059Y6qIEd8R7rrmhpGGuy3somis47j8Gl55ePyhFr0TFfyqO9ROMiFW56FIQoE6DH
	 xhZKxIDdlL17LgAH6t+gH3OFGk2KEq/20M/mPc1QQjOTwzqOhw0zON8fouhrL/mq+7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKIQG6gL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48526606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48526606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKIQG6gL
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386d1859e1cso2211149eec.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772514; cv=none;
        d=google.com; s=arc-20260327;
        b=esEbTvZfMyl3q4YhWrumu701Er1kT93nRDlDRB6F341DIGyRR0NviYiI4ePRG2HtcO
         /TP0vpLbcW5UWerzu9BYQt3+gP4LeSaY2YAXFJLa7x0zlYFDKtJ1mhDer0d48uhX7mue
         09y7bd3qZqeGEUaCJcDvAA/BxvKi9c/ojbLe5C8IlOUIvVScSVHpQ8G6xY/uI92dCVu0
         ZpDDULyG8VYx9z5vlvwK03jSvH+QF2pfT7aPThv4AABW6ydB25dMMidKVo9vQJXKiop6
         BOxhP4evJ3PqX8ARNBRrpPvTWTZnjqcpQ1x/en2zXJDosCzRWQEXsX/lGlYxAA3O0WMh
         BBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
        fh=pg8ppKgqDrMlqgyZIDrrXgt9JxmNgsSEuW/n6dKfjEk=;
        b=jqFKdSMUsPCKxxmFuorXPAjRf0S/Nb12Zn/cVy3eIXNibpBnRoMu+hi3LaAWAd+Cjv
         CWlexfdrxCKFrRY+qFJiPsQGg/wmeAxdOvEXh8PaJ27QOSIfwvA89AttzJJjaAUD/EhN
         nBkpA4nQ7uwnXTOGNiv43r4+lvD+dyBvuGEu5JH6nhbBfdof1GUA0qYu8uRi3yb2r2h+
         CTPMhf1A3SYSVuxN3oBCMk/s5UVFNJcWq6aOJK9dTiFhMJrxViYCcgoqrnxOrCtwRSDS
         mfJlfqhbuL/O2bVn74R5JcG25J/z0bHb161X81reLCEdMuufYio27w32iDipw084xG8h
         /kug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772514; x=1796377314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
        b=mKIQG6gLayQpySPc++5pyBCdaz+iricn1XEKwxSX7lNyZ5a4iV//cjVXw3qCToQqtl
         sl/T/I2kYuIRr9hSO+s1m612iSUADHJ5u6WTxZRb82D3cJR819odyDr6G5Frxq3dx02m
         1ooXAOSN51uNnkL9FtsbC5jQq6KrzRUi4wkVf13Qfy0NlH8NL/40DDJSo90YjbHHPL7C
         QPmalFiVGTMTfP7s5xNdXxGUF+4twCSseIwIzrjMZUfRcMN4kBCwIvgw8Dja5AdPjjnk
         O0T0cfXan96mkJOuYIOp5ixxhshO7cxYaybHSxxdJc0Rvdnp+0zuVoRukByTQYRGV5Tn
         dW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772514; x=1796377314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
        b=Y+D+ZdP9A+r8JIGRu4tY1or7VXcHhBSRBypt5Iv+N2gcrH8Yzq3dB3y7YEriAP/bO/
         8upMHZYr7w5SIVlEqBs0IN6Ex1dT4SIl4ABG/HzlKAF+TM+ffWjqJm1ZUbhWzr6JgZvW
         FtoBDeZV3gG4fhF8Z4Yg0/prwYZBI3r8919kSZDnLV0XfWSYTB9Dn4AkfTg+lWbcItTn
         rqa1ZDxadIfN9SHWVDfG/UAwiJKpospitbGCzxV31/iAqmBVSJ9OT2+5n8HRXV0Drna2
         Ckvg4vIAKXyhk20W/eV/gfUto3kvnzlS3YdS5TS9Vrx9qePaJH/Ks2NumB5/rUi7pMTg
         Zb0w==
X-Forwarded-Encrypted: i=1; AL+hErEdIIzTrExRgIU5hrnRS+ZfcMXNfjV17Popf4D8YXgWSnBfiXgCysKG5CYsFopUOq6vv5pOYcyw49rz@vger.kernel.org
X-Gm-Message-State: APuU4Z81Iw8jknz+gVAyEobRR/LnuEW1raflFLs3vIzVDSEgLinZ5n+Z
	wVF7vorIjO6ebFv7z9WLT5Ru7EYw6/j9BtSdk/DOhxP4kSLsIf0Xz1wI+hYuXO9LHrU68/6nEF4
	S+Wyb+xEVrKTy8rbVmFBolLohGdA02YQ=
X-Gm-Gg: AZFdTZfvCA7DuuaSBF3ib1NX0qz0wbetbowHzLGrOz3WLbUOUwG4jl+Iy1xkCJLFXKm
	o3BPmJ8VQ2TQGx5RA2x0Rai++agle6DU8S+JdceDuHSRgu35cgxSK1GUfMKLrzTCES+4hVyn9TV
	HsNEC40SR2BEkH/iVaeFcIthPp5/wj53rYY8nJ3A26J+/mMT0y5nqMrgRwbghzcf48yyGQask7O
	ZQXFZCyoTYORisHRB8wEoLi+IAFLkxh6g8lPn3Hw3MSLUiEkunq/s/uc9b1c1wVtWO8XNLcBtUl
	v8eszZjWg/KUZCLWhQd9yL+iZg1O9+ZTd5UDgxUn527t13X9WZ1l1+wHfHkImdgucabx1ZsnZic
	Wek4KUalWd9phLkIbr6pMTZ/XHMFcLb2BEa0AnJs/C4WicVOFmpDuU8qJJlDqKYP3Nf6+66zPaD
	xI/5T+TSw8IziGFil3xTfK5ogiKecsSM6ABbff3yp/SjH5Jg19hD0=
X-Received: by 2002:a05:7300:d589:b0:386:9ff1:7f7d with SMTP id
 5a478bee46e88-3869ff18213mr20461146eec.4.1795772514372; Fri, 27 Nov 2026
 01:41:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-11-clamor95@gmail.com>
 <XPGRUNopQCaIq1yDhISpSg@nvidia.com> <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
In-Reply-To: <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:41:43 +0200
X-Gm-Features: Aa3M54q2qhxyDM_Zeh4LfrLo7uscd-ydHCRlf9uUlV1oDTURq66rSYIDmKEA6Jg
Message-ID: <CAPVz0n1xeNP=rv3qDMG06aSWRLTVvCfuo5tFyt9fz7KDTySV0A@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
1 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 08=
:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Parameterize configuration based on bus flags passed from the bridge =
or
> > > panel. The list of supported flags includes now pixel clock polarity,
> > > display enable (DE) polarity, and data alignment.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
...
> > > +     /* configure DATA order and alignment */
> > > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > > +
> > > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > > +             value |=3D DISP_ALIGNMENT_LSB;
> > > +     else
> > > +             value &=3D ~DISP_ALIGNMENT_LSB;
> >
> > DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to check
> > here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB/MSB
> > bit ordering in a classical way, instead:
> >
> >   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
> >   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
> >               R[7:2], G[7:2], B[7:2]};
> >
> >   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
> >   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
> >
> > I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> > panels depending on the layout. So the correct value depends on how the
> > panel is wired to the SoC on the board. Hence, I think we should
> > describe this with a new property in device tree under rgb/dbi or
> > endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> > document that this means the above kind of wiring - not all RGB888
> > panels use it.
> >
>
> Ugh, why is this so confusing...
>

Using 'nvidia,rgb888-wiring' may be confusing since as you mentioned
not all RGB888 panels use it. I can add 'nvidia,data-alignment' to rgb
properties and set 0 to msb (default) and 1 to lsb, or directly set
boolean `nvidia,data-alignment-lsb`. Let me know which is preferred.

> > > +
> > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL)=
;
> > >
> > >       tegra_dc_commit(rgb->dc);
> > > --
> > > 2.53.0
> > >
