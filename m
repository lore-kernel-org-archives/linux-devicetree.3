Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17C738F226
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401559; cv=pass; b=p6vdK8wk+9E12cL/BH2kQHothM/rlE0GXqVaPG5fmi6c/w7RhOGZhcSr7wh4MjtSBfjOWQ4M6dW2NgK0xax5MJAmOgm0vID+m11U1pMDT2pMplVZARnpjmNKSP5/kSMG80pKui4LPDKyyKa0TJV9qSE44CsKWBkjPkROR6xBiTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401559; c=relaxed/simple;
	bh=Ylt5hXVNR3LTkhF9xMnTUwL+GT8ti/XzIGNIjpX5U+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHLUby19gr3WfHyl9kuGZRyW8SM9LiTTULR6VxFdoUq+A4q72h9C8lzjnvdxw53tQabKSo3ZA7p/Vtp87MQ1WHuzO3ZS7AjzX4v+zq6bhMZyYQ5tJLNBuv8lFc1ddIx99yr52IXwwL5f+GBNfsNa+Reba2GfhPkjfu0wBesJSjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+i0zebN; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+i0zebN"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304ddfcf72cso5242232eec.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780401558; cv=none;
        d=google.com; s=arc-20240605;
        b=bOMEriJOh3IO1yRWDcK8RVuInH24p+LnRvWVGm0OCsPE3TKmHqGgfWx63tYr/RqELB
         kWCKhOh7zazlX9W9POibJD+ft0HEBYBHOu8qwz9svZjPJsV+h5xprjAM91VwyPHO1bM4
         P1Sr48S3I6DTbN0/AwDVLarFeZRKet2qqWP7yrQktpBrRcfK1xZRGR7Qt1XosLIXdFF8
         32CnWw//TabVeBsnojQ6zp7Q0BwIUNtXYC2qHQhKyQcK2btgbiHIHY6UTJXf2ZUbBs8T
         BQSwxQOQZ7qD7u5zi6DH2s7BLdJYlfIM5/MnEUXF0VLuuhxSihJ+oXZW+7VQPsHxkD+z
         L9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QwoGUg+AbKtXga7fuYSOtkP7mpOfS4rBc+JAo9UwGTw=;
        fh=xMT8mXr10QBgkkOTewKgTxOnPiUD4WEJLdjxjY8u/5I=;
        b=hLVAFOP4c6R8sBN0ItxSHxNzDAtuuZ6vmZwMrNkz21Phw2/v3OrcHKuRN3IPaVqOZ2
         xgmayHazUmFhHMRGMTzLjudyf9WGHab30GYWAWIwnRGvNo9MQVWUx4NynKE7CV8+A6pC
         ngwbs+qAmwvriW6TX9GXbD88ztyT3JLRiUpxclwDyy5bVyabpiLMBqaMnZdba/IaHscI
         vl6H0PG3RT20ZpTvaX1K4n0C19IldcDD66LqoIRyoJS+sfUPMZvRWld3C7SmYPUA4PWw
         m7DEDe/7FYTdIwTbp2unUttdEo3fCRfMD2LJVdCPFNdDVLhtTrvJFLTezPdXC4MKAZkz
         U5ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401558; x=1781006358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwoGUg+AbKtXga7fuYSOtkP7mpOfS4rBc+JAo9UwGTw=;
        b=D+i0zebNudh0YjRVZbcwm2tiAX6+eLuVdjhng/hb2GBzm1G7Ny7UVck00J6L5iEqJF
         sRh26UJBKc2ea5QyZbGvw95QLpRT/yxnGqh0Cu0tSZxDcSpj/zTfI6KYRPMt8weZNIWz
         nJEYhhKbokyH5ooAzPhIaTqCRIVi4gqM7l4CFeA4jXoC7kUiasZ5guEpLD5+dbnL8LbS
         bzhuhyLkHAWsDruWQSg4K8D4OQ2gWhOr0MRgl5dtZdjQUcPImVPJd6WuWzRJHtSqyxF5
         YBygyqeZU99cYMYWm+9lwA9BrUe6kgYpQ3IR2McwgllSud3fyVl4b5cCVJv55MqLeNb2
         QOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401558; x=1781006358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwoGUg+AbKtXga7fuYSOtkP7mpOfS4rBc+JAo9UwGTw=;
        b=FAVsny3qxicQNRRc43fXBDvHs3XYyhDCdaOU7wqBMIq/htbOmGNrTMcQ6yRaUgWJFe
         aWmFRYVZi0ji85G3ORsObMhMFY+0ZAxqtac35rBn0FmvNaP7jHdDb4bWF6/jxK5WGqNw
         el8mCjAwa8PBPQS0Fe3aoWH3w9EIBnDOeec1CzTIq3ruLnYLU3rRCFQmWUn9Frc5sWx0
         vQeQgclqNUcKiHNdmFdqGmi0UzCyTDblBxL7R24z78r5Wj5oSpyG3oCS33g5j0+ul/Sk
         VQ9Jy0pNFV4AP3V7JO1NY1T+sArI262+pmve3dpTrHY8dFhETkKuHuVS6ODWTZynquqd
         TWuA==
X-Forwarded-Encrypted: i=1; AFNElJ9CAOwAH0ZjGuFGZsNxJhTmVWanGCwXae6HwvvMWrblngebqGyupvCTL32meV3BqYCzWHCcn7smIBdE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9tvmcBcXQwTHXQ+HqRWovWEMaPjTQCNMSbY0yd4ZJsWmXpPZA
	pdDW74yog7yvPtd0LtoONgX+gEyRz2kTbCkkzldeGl1j+Ryz8hrVzGhrJRGBeONQuqi9h6u1ruh
	OfGzuWNJx8oUoJcT3vRj/W6+WRILsnBc=
X-Gm-Gg: Acq92OHL4USyRsnpfwuGce6egTNPMo6w12/O53nBpBxEbACkvnQV9JzzCASZurQTYX1
	CC/FcBA3SThqaNiSq2hAllQAjvz/wZ7bTVK1teak4mh6CeYZMuo28cDAjw8BbWu/5gXfBlSOjOx
	7PIRdxhd1qp9zTOxvGAiCnIFcXjtR573Exl/6rU3VEq3EZWDU2Nn0zUWlUQ2GSmflcWgr+b63uC
	Wjey+Her0QWnffZzNrhdGsa1kJmTuKL3mYU6nV5W9f3ePB5YzPrO9PEkKTRteFRKY5A1zvQFHqo
	O9sv1ARIZnwaDmXHrN4=
X-Received: by 2002:a05:7300:e58b:b0:2ea:edc0:4fbe with SMTP id
 5a478bee46e88-304fa5230d9mr7590808eec.14.1780401557759; Tue, 02 Jun 2026
 04:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-9-clamor95@gmail.com>
 <ah6PxFtoJUWkd79P@ashevche-desk.local> <CAPVz0n0P7Jk17cM2M1zuHZfySo2=Uibr5izwKU2tqiBpBcg0FQ@mail.gmail.com>
 <ah65hfgoM67V6-iR@ashevche-desk.local>
In-Reply-To: <ah65hfgoM67V6-iR@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 14:59:06 +0300
X-Gm-Features: AVHnY4K2SWFA6Gct86VkeqymRy-YvpCnhDFWoUYjixtaQro8Ol55fBi-H9259ik
Message-ID: <CAPVz0n2V_a8Qf-yzsOipDRDtpH6h3ECJAXTYuavvMdj5-Fk=aw@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] video: backlight: lm3533_bl: Improve linear
 sysfs logic
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14:07=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Jun 02, 2026 at 01:19:00PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 1=
1:09 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > On Mon, Jun 01, 2026 at 06:18:28PM +0300, Svyatoslav Ryhel wrote:
>
> ...
>
> > > >       if (kstrtoul(buf, 0, &linear))
> > > >               return -EINVAL;
> > >
> > > Besides _assign_bits() in the below, side note here to unshadow error=
 codes:
> > >
> > >         ret =3D kstrtoul(buf, 0, &linear);
> > >         if (ret)
> > >                 return ret;
> > >
> > > (obviously in a separate change).
> >
> > Won't happen in this patches.
>
> You mean both suggestions or you are talking about kstrotoul() only? If i=
t's
> only about the latter, it's fine with me, but _assign_bits() makes sense =
to do
> in this patch as you already change the parameters enough to make it bett=
er.
>

only kstrotoul()

> ...
>
> > > >       ret =3D regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTR=
LBANK_AB_BCONF,
> > > > -                              mask, val);
> > > > +                              CTRLBANK_AB_BCONF_MODE(id),
> > > > +                              linear ? CTRLBANK_AB_BCONF_MODE(id) =
: 0);
> > > >       if (ret)
> > > >               return ret;
>
> ^^^ left for the context.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
