Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87FA3E556C
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449545; cv=none; b=FH4UhuBOHvv2df1iNm9uhWjOXIZllySMNxkmCax652acLbGyd3/YYHImpcbyNX9IhXrWnyrF9/028OT+IG9hxTz1K2bNsGqlFMMGGF25XEEddYRpTytnWkBu8cnB0+cK91UP2FZXeKPrjV9I55MFp2h4CzQW5WAJpkz/aFTEfDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449545; c=relaxed/simple;
	bh=igOIPBvufIdq/zX1gcJ+5PZ3YA+A8TDi5yscYGtrCSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbaxnwaAgMfWwAZF+zHNEGVP5mP437NJVTnVVAuMtQ0tno3kbB3MMIdTtD0omnSY2pHEI6yMzmtylp4K1kx5uPpyk2f0K9zetlU+8CF7d+GzRmeopmTP/y7mqQbIriRwUgZs4rbxEvkyuq00kCnIsANRnWI/4/TD/1xjMFK/23E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-798374d0f44so14887567b3.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449543; x=1775054343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=61Bu6okO/rekN6OSvH+vN+cZWNdav7wgTTpXxse1ogQ=;
        b=NpyIFttuumVUj/XJCz1bPtn1rbUn8JAKTf7IfmIWwDGrNpyEwfusYPFa16kl7o67r1
         hCfXHcNFxfMEGIT6sUF9l1lp1dlpbZYbYd6i1D3gI4FZqARth4wWm4mzhwVxIhw41/wK
         CLELaVcL33zkMe23iDMR+c3/VMEL6XqD+kZotaAFv8fBl6X2X64m9TXbltJYBVeIzveO
         d9Om4EtsneImwWq/hMJ7bglY6uw8dlJm17nOZ2zzdGGZ4rFzbnjYFIzdFIS18SZ9gPjL
         bjGzD8xJIHJJvpeRU1oYgqCXu0vPk/vxCvuWnFSjyFwOh4AV6pFEvbk/qys6/szgKLxc
         kQdg==
X-Forwarded-Encrypted: i=1; AJvYcCXk16iUoXlipiv4TD1ZRu7gZVeo0kLZqFto25PcMa37ED9rTs+kjK3+5pUrNsbPYmqaTPxWZUHi2cO0@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLuiLxjuUe7GU7m7/IZPp6e+68ui3QBPdtjGdpy5trC0qb5pB
	xVBY9yhZerv9QriEV6kaYJwGkydi68u3nfW37dy3FUMRvrcCm0bfPjJVwQQwTjn5
X-Gm-Gg: ATEYQzze19KBUPoaS6Xph6QHxGoCvXzl86otQXdUeTYlMZdpjCAGNNVZPDddHQwHy4i
	h3cPkzG2zDZW7gk9Fh9f8bSUp3dQKmZhRSC1lexFFupq4Eg+4R64dUVU80YuND7YgkKztoqz7W/
	GJwkf7ywTFAK4aXYS7sXTEu98FYOgh3SJDIC241a+fQ5b8thL99wFCF9VnCcgIs6MPMK4A+dqy+
	0jINSwnVR5CDII/2j5lFnFmCib1NI+y1iaJD3vlG6pPFL2ASmiV1drJ5/BKm4ouFfWm/MZMid0g
	LrF4WkHnpcR+bM+x4mm7W/v9qeCfFMqjblG1RvymC/ctzwHhNyfa0s1jS31T1LmNZuniSxHFPjn
	ZNSAnuwN9TFpQzckrdf+bbCyb8O3Dnsq5oqIaozzhTOG4RtnZk2OUZjlLmIKRy31wcqMNEE2edV
	ZEkaXESDUCsYNFr8xuw/6eCZyXyeO4yuxyDCoiKajg0pXk/qcH0h6ltkJFvtB4zk/Egm+y9Elx2
	5r/64INLMztUpn7LRjq8QTLw0TJgerVY8xcICe8eXeRBw==
X-Received: by 2002:a05:690c:dd5:b0:79a:ac83:ac67 with SMTP id 00721157ae682-79ac2e7e1eemr70830877b3.9.1774449542467;
        Wed, 25 Mar 2026 07:39:02 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79ab6833bf8sm44593257b3.36.2026.03.25.07.39.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:39:01 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a8e873ca1so13175897b3.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfGXTTLL3nFqkU3QqTRzfWR+IuPpUK7dFCmJsI8IUYCaG98OjcBZPR21eFtDMVcCq9mKZmBY75ogk4@vger.kernel.org
X-Received: by 2002:a05:690e:14c6:b0:64a:d677:85c with SMTP id
 956f58d0204a3-64ed7976bffmr6741184d50.37.1774449540439; Wed, 25 Mar 2026
 07:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325063254.18062-1-email@sirat.me> <20260325063254.18062-2-email@sirat.me>
 <20260325-gentle-earthworm-of-progress-1f9f46@quoll> <CANn+LW+Y6j0xk2x02-BUL9qNq2gf-PXspi4wP_KGd7Abz3hOYw@mail.gmail.com>
 <4d10b6c0-d599-4fc5-b9ed-ce669ac46e84@kernel.org> <CANn+LWJQM45rAT+mzS9ZEGBgmqChbxUtStdzhbzthXUPJ=2csg@mail.gmail.com>
 <20260325133806.00007b68@huawei.com> <f27bfbe4-aa90-4631-b96b-efb8465b05d4@kernel.org>
 <20260325140633.0000059c@huawei.com>
In-Reply-To: <20260325140633.0000059c@huawei.com>
From: Sirat <email@sirat.me>
Date: Wed, 25 Mar 2026 20:38:48 +0600
X-Gmail-Original-Message-ID: <CANn+LW+X5puvzY+cKYKAbWY6L2d_0P_2AZxuRkwH7ngc6T-vJA@mail.gmail.com>
X-Gm-Features: AQROBzDkjAh4hCh3Uyr-Slorzdt9NTaXwv1Q7lSZlelAjuGoxx4z2SpgGTTNCdg
Message-ID: <CANn+LW+X5puvzY+cKYKAbWY6L2d_0P_2AZxuRkwH7ngc6T-vJA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: iio: proximity: add ST VL53L1X ToF sensor
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 8:06=E2=80=AFPM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Wed, 25 Mar 2026 14:44:13 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > On 25/03/2026 14:38, Jonathan Cameron wrote:
> > > On Wed, 25 Mar 2026 15:18:05 +0600
> > > Sirat <email@sirat.me> wrote:
> > >
> > >> On Wed, Mar 25, 2026 at 2:58=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > >>>
> > >>> On 25/03/2026 09:48, Sirat wrote:
> > >>>> On Wed, Mar 25, 2026 at 2:05=E2=80=AFPM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> > >>>>>
> > >>>>> On Wed, Mar 25, 2026 at 12:32:22PM +0600, Siratul Islam wrote:
> > >>>>>> Add device tree binding documentation for the STMicroelectronics
> > >>>>>> VL53L1X Time-of-Flight ranging sensor connected via I2C.
> > >>>>>>
> > >>>>>> Make vdd-supply required. The device requires power to operate
> > >>>>>> and the property should have been required from the start.
> > >>>>>
> > >>>>> That's ABI break and device for many years was working fine, so t=
his
> > >>>>> should not be changed.
> > >>>>>
> > >>>> Jonathan and David asked that vdd-supply be made required. I feel =
like
> > >>>> there is a conflict here that I am not able to resolve myself.
> > >>>>
> > >>>> What I think about it is the binding does not correctly describe t=
he
> > >>>> hardware and we should consider this a bug and fix it.
> > >>>> The driver worked because of a fallback mechanism (dummy/fake
> > >>>> regulator) and not because power was optional.
> > >>>>
> > >>>
> > >>>
> > >>> I looked at v6 and v5 and I do not see such comment for binding tha=
t
> > >>> existing device should change ABI. Can you point me to it?
> > >>>
> > >> "Make it required and add a note to the commit message to say why th=
e
> > >> requirement should always have been there. Devices tend not to work
> > >> with no power." - Jonathan (v3:
> > >> https://lore.kernel.org/linux-iio/20260322115704.10b2e0d4@jic23-huaw=
ei)
> > >>
> > >> "No, bindings should not depend on driver implementation." - David
> > >> (When I asked if I should  drop the hard requirement in the binding,
> > >> v6: https://lore.kernel.org/linux-iio/55e92148-b5de-4fb8-af0b-947623=
5341bc@baylibre.com/)
> > >>
> > >> "From the point of view of the devicetree, it doesn't matter what th=
e
> > >> driver does. It matters that the chip can't work without power. ;-)"=
 -
> > >> David (v1: https://lore.kernel.org/linux-iio/d0ec6a2f-6d30-4774-8950=
-15dd3c4b020b@baylibre.com)
> > >>
> > >> I'm not sure if this is the correct way to quote. But I have added t=
he links.
> > >
> > > This came up a few years back - though I doubt I can track down the
> > > exact discussion however.
> > >
> > > From a Linux point of view we are breaking binding checks only if the
> > > supply (that should always have been there as chips tend not to work
> > > well without power) is not present.  We absolutely have to
> > > keep the driver running whether or not the supply is specified.
> > > Do other DT users provide such a constraint? I've no idea.
> > >
> > > If the DT maintainer preference is leave it not required (perhaps
> > > with a comment saying new users of the binding should supply it)
> > > then that's fine by me. I'll keep it in mind for future similar chang=
es.
> >
> > If this was other ABI, e.g. clock, then answer would be - do not requir=
e
> > it, because that's ABI break. Therefore I would stick to that also to
> > regulators. Once Rob also expressed such thoughts, although noting that
> > it is not that big deal.
> >
> > New device in this binding of course should require the supply.
> Seems my memory was less than perfect on this :
> https://lore.kernel.org/linux-iio/20241119140409.GA1093349-robh@kernel.or=
g/#t
>
> Rob expressed that we are inconsistent on this, but he'd rather not
> have regulators as a special case.
>
> So let's only make this required for the new device.
>
So since it is a new device, how do I require this? should we split to
a new binding (like I had in v1) and make that required. That would
also allow us to correctly name the xshut pin.

Or do we do the "allOf:" exclusion? In that case, I think it wouldn't
make sense to someone reading the binding without the context of
commit history, as it would imply one of the devices explicitly
doesn't need power.

I'm willing to do whichever is prefered tough and move this forward.
>
>
Thanks,

Sirat
