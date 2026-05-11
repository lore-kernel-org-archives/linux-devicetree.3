Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3A337B027
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505023; cv=pass; b=thEOrtHnUJTowceTmDhYq5M38XWdIX2vBvsRzkNWMpySgWQri1CmkZKZ5aAUpqbtZwqUDZDS4jizU+Xrhe2ox/sGGJZWmeYOFVt0eTmKnAC40UbFZtF7RS4OdhtvxJe2PL4ER1ULm9UjbupY30xi83hshHvSrnxxPse2byrm3qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505023; c=relaxed/simple;
	bh=9I8sW1yK+1uF9zmqUjtnhC2S2QxfHvvouTgT1eiyjzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXaoC6jvLvNs2hO9Kl8vI9MJdnUMsOruNmeI0RyxMMPlke8+5HaH9fVNN1WAiIBJkMIUymdpub+Wf2xQf9hGCAzR0Wvmtcqw3IVnRTOpdu7wss4NKB69yPUVT4CqxdGkrkiZLYQ/E9x2z5FDaV32MngHtpUrQvf6il1Pj04sKKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7LE38Oh; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7LE38Oh"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65d071aac6eso3757181d50.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778505020; cv=none;
        d=google.com; s=arc-20240605;
        b=kzAcKcQFpjocOO8NXmHr9i+Nmcu+SiXBzNmaZi8n1VBQaHR42ZvoiovugV+FGkrwRa
         Dkg4inpaZK58nif3or9BU6sAZ/OWQsAs+z6PkaEhy5LV8nRgAQAvNPwewc3KYHjWtgT+
         AkEE2vN1ThISU1i6DDn4rUjmGCiH8o8GtjL/aciPY98vBMlM5jEvSGFNqDU8Bl7rLqMI
         ziPIfRF8coHjROwuaQ1v+u4YruFlUWVqxvaViFNBvO4IGZBxnKuWq/2lMqfloMRfyyVs
         Z56atQmB4tUGPCPjfDfi/hM0I4lxeff8gUU4rhXDNEm3S9iojdVns9g30vWOhO1mV4zw
         p2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EMlQ7Lcxo2gsa3Lli7NaTUBt5TanTRF2EnHPAACroY4=;
        fh=//xTupMt0pAZFv6NnHiQIeXn1Ycw0ltZaC/sYlqiKIg=;
        b=MfzFQkVBgLrHWC8Tl36Vw7kbhvy9h4vfz5pmySF0xkEEYXyEJjFNf9IDI7mTR+cWI2
         P3GD03bf2iW/GxzYyVBy5JQZDf0Ls1fpKaWCUwq4Tnu4CKF9pPkwtqCMZ8naQfA58jPa
         c8P32WkFyMKdjxy/uvsJtfV1RmVi2C55YZEuy4VXA/53tERr8VKc56CbfQ/2/NYhF64z
         eWcVaOGElugz9ouNPQLV+qJqU4S7tTvY6FbvunE9/JjB0WzAkBV3lLEcTO/cglqiydzg
         KGvefFkVFjbUyKmfkjLkcABKAfEsR54SEJ5ql5iLGOO51tR8RtRKVuqQdC7UHnVB7Ad0
         dFrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778505020; x=1779109820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMlQ7Lcxo2gsa3Lli7NaTUBt5TanTRF2EnHPAACroY4=;
        b=j7LE38Ohz16Zo3MLibRDZsXmAJye7pl1Qoy3ZYwsCXPZ1kJWLgVb4nxORwAglUJ7+9
         b9V6+0JefRnF1wITYHFvOjfpjnXC6YLTlLmrIGGTsQawcmnusA1UvMj589W6KTeWcckK
         C4ijZFbcbWWo+p/Y+x7Odp/+B7OVgfrTxGP2z9ohAJaJz0+8+ccsMcMwSkdk7ZMDkkcp
         PjopJFHi8MqPyqc0eO/FULHMfc6HIrUgA+FxtWmpbM7ki/GvSUpPv2aaLEOCplK4I9C+
         oQcKX/oxWeYOAfMea15+FNhFyDmNDzRatuaH2+lGPT+aGz6KD72iqmIU4rWqR4DyIkYZ
         HZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505020; x=1779109820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EMlQ7Lcxo2gsa3Lli7NaTUBt5TanTRF2EnHPAACroY4=;
        b=NbOpaOErJA4bw13s824IXI2BhJJy00ApEv5hmOhku5/FGZhoONGcVBc1gdnLoOTilz
         zTHSOickunGTA3BTHCaf8JhL2VlTnrl9QGhIJlwrMLzDV3koclI3JsOKDyIakV2ZBGDn
         Oq0VpsQ+2SCzey9/dpAvaPFA7NjHJ75Yld6A7hCdZ0VwUCQNGSx57AJLoAcyD/Hj4qxy
         OAsVAzTokHEHpoMI0m3z8Ptb/kmjpncUbhqNP3/QPlm0rtz7goGLzlx9ivUabcOF5SHB
         7ef3rKD+RKZ5i1+VR4XzYXvhAOwOqN4MGIjsJ7smXTwFaiai+I9HtK1Xi8N6RhGguyw/
         tLZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5qWURZWATtstivvZVye2FfC6utIS/wQyBxn4Ed3tIHOOVYajSVaKzDxIINjUXcoTZPM8a7lOR0u0k@vger.kernel.org
X-Gm-Message-State: AOJu0YwAK/yg7wvbhLTo8gO2VS61zpGFAesNlVrZ21rZxkMGh411AlLl
	xVRYttfK+U0FE+SEeWrDUpzp9dBT1Iq/UJ+0879Xwchzx0itL85GpZmv1TiMG4dWb4m6HJt27h7
	w28Y+aSZ6USw00kkdozC3AkrS5oA65KZeeeGBjBE=
X-Gm-Gg: Acq92OH4wxSE6F3zHC3vXa2YA2fyj4IFTzuo+3Q8i52jEpyPFMim7jq6Z3BBPesWp/4
	LBbBRTIe8mP+vxETNIOuwgJPHCAVBIxfUNuyySoBZ839F0gpLTR+6s57LzEjxteQlcay+Sfoiit
	E2RocndqFPofV/lbUd6F+QSlj16W65YB4Nd0jJX5cnrL59WJrO2DuSvBf4cH1ssNxZ+wu+9DaOT
	uPgZFzNG0lnaPPBs68GOY2AD07zm/erHUl2CP7CYBvOgE0KREya2vYpIMBzT0SqwwurOtzQDcPd
	E6vXZlDfSGzgzHDd3p/TykyMtAWON4L+oVSpMGGrUC1EsMqMHPe+
X-Received: by 2002:a05:690e:1906:b0:651:b53e:4acf with SMTP id
 956f58d0204a3-65c79c4e1bcmr23389872d50.26.1778505019585; Mon, 11 May 2026
 06:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510020758.233721-1-m32285159@gmail.com> <20260511130959.7cea81ff@jic23-huawei>
In-Reply-To: <20260511130959.7cea81ff@jic23-huawei>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 11 May 2026 08:10:07 -0500
X-Gm-Features: AVHnY4JVwVt74p8AFne9jPgsWzoREMqufrpvP7IUlPyPsKSVfN07JtRhDihE-4w
Message-ID: <CAKqfh0EOAie4bjCPaOcocw_N5KpzXoG7hxrT7s-dKpairPUYzg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: chemical: sensiron,scd30: Update
 maintainers field
To: Jonathan Cameron <jic23@kernel.org>
Cc: tomasz.duszynski@octakon.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 7:10=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sat,  9 May 2026 21:07:58 -0500
> Maxwell Doose <m32285159@gmail.com> wrote:
>
> > Tomasz Duszynski is no longer the maintainer of the SCD30 driver.
> > Replace his entry with mine.
> >
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/com=
mit/?h=3Dtogreg
>
> That link is not stable given it's whatever is head of my tree rather tha=
n
> what I suspect you were aiming for.  Use a link to the email on lore inst=
ead.
>

Ah (right, git might rehash the commit). Will switch it over to lore.

best regards,
max



> > Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> > ---
> >  .../devicetree/bindings/iio/chemical/sensirion,scd30.yaml       | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,s=
cd30.yaml b/Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.=
yaml
> > index 40d87346ff4c..a5b0debe85b1 100644
> > --- a/Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.ya=
ml
> > +++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.ya=
ml
> > @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: Sensirion SCD30 carbon dioxide sensor
> >
> >  maintainers:
> > -  - Tomasz Duszynski <tomasz.duszynski@octakon.com>
> > +  - Maxwell Doose <m32285159@gmail.com>
> >
> >  description: |
> >    Air quality sensor capable of measuring co2 concentration, temperatu=
re
>
