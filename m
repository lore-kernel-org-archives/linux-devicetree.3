Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F117437C919
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982518; cv=pass; b=XD5q3LZcpr5I44I8EBoHoWL2Wh8OqrVlWMLFuQictvg3JrwR3ghNn1+b2MDEvV4KoDbAH2zRJlbhyLol/H5UiluB6YIAr+4ceevrYSmZZJbJTYlAc0/wyvJW2tx4mOfv5ICD1WTrziiYLLYbKi+NyPJDxx0mP1BLnH1SHGbVbIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982518; c=relaxed/simple;
	bh=L3T+3wGsBJs7zduASW3ByDwRpUrTYKu58amffefOwQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSwjRR4ILd4FgPuFLPR5ZxCJ5H5Mc5vaXwo6CyNtH06kBKRvdipwSdzEWGC16wFjHIUF+jQJ3UREGAeKEvPbQLyJphzvOIbXE6L4EvUvIOoNvlAcKQkuJwi1yfjlASXU9OEVo8Iu4hUCw4NThMj9BFfhrgfnBoYagvghm1F5Vb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9XhxrfM; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9XhxrfM"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38c26612508so49808731fa.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774982515; cv=none;
        d=google.com; s=arc-20240605;
        b=luoH3CUUHuugAFIUxMMGYfRKPnzaGyQNueP68yYDliPYfHP5oqVeG2bja5G8sv6GLU
         7KKSMq9V2GwjR+PHQeHIBYbY9kwvm2IoKxoRO/bz3ozZat1zgMFX9dr+rU2CElwyJHpT
         Q8WCm64qsRdqbRHbyQj1fKUEV801gLnj6gRH487v5/9JHh5gvgNbHV/ITCJltr6vxVEu
         X99dhHaDCUpeBNbGAAspCIua2fNBMguJi1pimuuk5FL9221AQghiZ1HE0DR1X56ljV9m
         qsKCkU/IJKQkeGbuzxolfGCY7zyOYZv2i+IThgthNQeXExeKo37ZOFCMXHYAs2Ht0/Cv
         j87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LueIi/8LFIpJS2kk2nmHhYDXoRTlURY5kQyqGLWB0V8=;
        fh=2Udbr0pSgG8G7KIEohJIDvvGqExaHh3uyhCxS/k8C68=;
        b=NCOz0ZcMu0naKVsCJRE2yQ45EA42YJfS5XtwLnFNf+zDkxRla01SDPX+jpk3L9hkuw
         jv8XcZLdWG7h+9ViH8xGF+845khjG3HIuqVrfgtruJMdRHfCN0GMAX4SO1uNl6znNkYL
         5QSYvpLsFZ9UT5VLdrIcbhcadfHOQ9U144nYHwsJEkU4TSoU6ygbgKtP7D5K9ulGO65E
         RB6EaE2io/sPHCKeWjSlNpHaX9kiCNf2wplAZHMZ/tRJznE7UL5/jHQXlaBaG02dI6u4
         QuivS7TMoncClNee8WvnAfx7+8DlWyOnfNzDhTxeFwvxYnWWOoJnW+47x5zfii+nrVfD
         U8xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774982515; x=1775587315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LueIi/8LFIpJS2kk2nmHhYDXoRTlURY5kQyqGLWB0V8=;
        b=h9XhxrfMflMyPBfk7IY8NnCKn3qq4v2QL63cZlccIzSvCHdki+Rp7ScIc0DoY5oMWi
         IImCFjkxZf0pTvpJi+K3TbKZwwUhtn5v+rxHCVlp9nbmoeLOFvO1KWKg1o+XLodNmFuy
         oLufpIymo8UlhA318kjy6hEzbFSg1N+hVEtBTxX54d9v/AONJ5oneZr2hliTOfjhb9Mo
         58BUR4Bxd3uKjOoyPp5M8DOPb5ecANe298zcky94nKgmnyFSu7NcGeZAjCOGctSvcFmS
         OF7+RwOdmftht5AlxVF5JRbU67yXnh1L7AWWhSlxcLqAFrKNcuSjrIefqX+M+py5cdME
         9wtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982515; x=1775587315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LueIi/8LFIpJS2kk2nmHhYDXoRTlURY5kQyqGLWB0V8=;
        b=U8FZEQR2vpkPz2kXK1Ul2jvjrd2dStYKPLZnOxmMIawn8VDfhKhbvj7ZA/HHYvHwfs
         hJBTp8R/ej3jhDMs/0P9TtuNdhWD2iwMUoJui02rHv0OOfH8wUZL+MsdHOG69063tG9k
         WR+cPjm3Vjgppox7JVbDjhwmQDKIJaPD3w58r60qXq90g3RVCa2mW4FFjukuAL0CumCa
         TNqYoNIFUR37H6yqxcL5bqmyPInO0wp6Z8NYei2gja1mViHBEJDTEigRKhcKCw6C1LUh
         QIf0EitDYM+mLY9I1rUr0q5KWNUn1Op3Il2bGmYVWZOCST1A8pz94korjTD9OkneHFdS
         WaKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc7r/x6RAoH4T3ZsZq58Qc6SOQzhp6Miiy8fwnopyca3vQQ8mRx2GCsnwn8r2JLwzXgIAPu18axfgd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ywdY5cjP1IPMcSd7M8+FFmFpkvuiKXVRFCFMOtXttEc8fxYf
	MJHX/OB4+GP9J9huS3R8BL0MqANG0koz5FF81z7/1nEMqsNo6x5vyIt0KRodXYBNPQB14CIBb/h
	hyZB8NIMsqspPt0bFYT+DixQhx6ZmIdk=
X-Gm-Gg: ATEYQzxj88bzz1cWc9OsvO/7Rfl424+JkXZ4cQLC0omxY2RIL3Q56I6b/tLnjCnXDdm
	lyOnnIOVCxncxzCspLspjU0Jgb2Tmrx48zjjgDzrBgaBk/p0OJiUhoEqhg5y8tSVXrtQAe6d1V3
	Puk3lr6pTRymy/rvryC2gwDkS8MsSvEfvpW6xSzZUTKMkfo6q5tqTS6OxCadBWgzJ5w/cUN2c96
	K/GGl1RhIkZOOdkjL02MDvbbsU57vXFqVqRkWzPOFfe8yRms3JbzXA/H4m1Hv9MJb4iJ9xBVL4t
	EBPX/WCrm0pHUPem6A/LPJxgD9pY+hBj4RaLpaHE8sePXo9uZ5PCENaQny67FuNLkO6eFQgukzI
	WWDg=
X-Received: by 2002:a05:6512:3f0e:b0:5a2:b304:e95 with SMTP id
 2adb3069b0e04-5a2c1f3600fmr200775e87.45.1774982514815; Tue, 31 Mar 2026
 11:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-ch13726a-v3-0-e28b6f97fe80@gmail.com>
 <20260323-ch13726a-v3-1-e28b6f97fe80@gmail.com> <20260324-dexterous-snake-of-progress-ea8783@quoll>
 <CALHNRZ-TAQmcwYr9iW+j+S5Egh11C0LpPeY1SO=hgDdvG8otqQ@mail.gmail.com>
In-Reply-To: <CALHNRZ-TAQmcwYr9iW+j+S5Egh11C0LpPeY1SO=hgDdvG8otqQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 31 Mar 2026 13:41:43 -0500
X-Gm-Features: AQROBzDmsVsXdGNm4Y8F0yD_afgM04AELEWNE4PydSbgn0g84rsHOPHgyxrQXfc
Message-ID: <CALHNRZ_SnMmqLU-Sk7hVJOukPtVxdg1bQ0FncesXUJcxQwPV4A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add ChipWealth
 CH13726A AMOLED driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 11:01=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Tue, Mar 24, 2026 at 4:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On Mon, Mar 23, 2026 at 12:08:32PM -0500, Aaron Kling wrote:
> > > The Chip Wealth Technology CH13726A AMOLED driver is a single chip
> > > solution for MIPI-DSI. This is used for the AYN Thor bottom panel.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  .../display/panel/chipwealth,ch13726a.yaml         | 65 ++++++++++++=
++++++++++
> > >  1 file changed, 65 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/chipweal=
th,ch13726a.yaml b/Documentation/devicetree/bindings/display/panel/chipweal=
th,ch13726a.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..5d964900795653401a871=
994bcf6403cdeaad64f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/chipwealth,ch13=
726a.yaml
> > > @@ -0,0 +1,65 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/chipwealth,ch13726a=
.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Chip Wealth Technology CH13726A AMOLED driver
> > > +
> > > +maintainers:
> > > +  - Neil Armstrong <neil.armstrong@linaro.org>
> > > +
> > > +description:
> > > +  Chip Wealth Technology CH13726A is a single-chip solution
> > > +  for AMOLED connected using a MIPI-DSI video interface.
> >
> > Here you describe the hardware, including what I asked last time -
> > explain why this is ayntec thor panel, but not chipwealth,ch13726a.
> >
> > Then also name the file as the compatible. If you do not know the part
> > (model?) number, then why do you think filename should be called
> > ch13726a?
>
> The vendor source release for the AYN Thor calls the 'panel' ch13726a,
> but per the data sheet for said part, it's a chip used in various
> panels, not a panel itself. The handling for various panels using this
> chip will share a lot of similarities since the chip is what the
> kernel driver will talk to. The alternative would be having separate
> drivers and bindings for every panel that will be mostly duplicated.
> This is the case for multiple things supported in the kernel already,
> such as the vtdr6130 which is currently described as a unique panel
> but is in fact the part number for a ddic. And I will need to refactor
> that for another device I have in the pipeline. In fact, all the
> device panels I need to submit in this context reference ddic's and
> not unique panel models. I'm waiting to see what gets approved for
> this series before sending the rest of those in.
>
> If I add something to the description like 'This chip is not a panel
> itself, but is used to control various panels', would that be
> sufficient? Or does the kernel need a new way to describe ddic's
> separately from panels, since this seems to be common now?

Krzysztof,

Any response to this? Or do I take another guess at what you want when
sending a new revision?

Aaron
