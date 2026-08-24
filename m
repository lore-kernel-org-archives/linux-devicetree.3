Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813C724DCF9
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558772; cv=pass; b=CltsXKABNjAIDl6qcKIvIs5BXaG8z+gJodqBLpOJgNTqfvavSLTmsFmygCniVr4SyUxJVOlgEKgHviE3b5Hz3vByYdQHQ2/Z5Xi2GyNfhRUEjy9U2fDneGyv55t+9iGma9NuI6kFtqKkqZtldTnJ3yxXnh6k3LoOfojXmY2lZGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558772; c=relaxed/simple;
	bh=VmpChf6xXFcaUUTODb0Ytp/g261rckBfcDFq0PJcnOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gn2fSFqWmvzvNs+AJ7AnVJtJXn7uVm947LMPvHA05sVwIfDsXTl/qW7KEV0Rv7u1hXmGKG0rylvrE1m3dNOa/HcILAZjrmWCItMA2NyLPMKtOqT6m+t537j0ZjY1JVB512r41/Js1mecjOmp5xoGWBYEOEEx/+g6vg4Zg03Vvjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQBd7vj7; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQBd7vj7"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so2748861e87.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787558768; cv=none;
        d=google.com; s=arc-20260327;
        b=XIQRIMpIDz6Y1CO87E/FiualQPvsWHYMe5rmg6xu3/u2FPz/WOI5GTmHDtOg1gTUT1
         HMixITq93aMYL+nLwxBHsi2dX9vp59Jaz0QvpuAFEQdfNh9cQCuAvywEXcrDK6yoX2vV
         suW+lhBa5dSynbnohA3QcmAo5/BsxBgqODH5rHkp5DBr61eV1TFkZAoOYq9UWtuO0xyt
         Paol0A0DGdHltIo3G5JnsMbm8tDRloqQg/lHyZUZNJ/hIIgihuo1mZo4mAywtZgx9BYZ
         qH90Oy+OZgzvZGilzOtnBfqlYGjTppahml+Rfx3VnfOuTs8wGHoJS//cjLnv0o9boI9z
         1AUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H1zokSLfOVJ4mDolTI4j0A98Cqj+A69UP0Nzinjm7sU=;
        fh=KRP/V1HBQvk1PTAgyUbSyqXj3aCb+QuoWtPQHKxQ4Tc=;
        b=K4TO1BhYYpjRcV08uEpgIkcPp97IxtzEx3hsmSA/3DvNC80tqXaaa9eNURroCbEu4x
         TBfdkI5bjqlZkNHn3mVAGQs6mI9mQCMOOs5n3HOTQwyiAZOywtmFBEz4HPNCkmWseiPT
         nP5afSNYGW2kyQyoVtzXwQfCMLWlxBazd9jJEXy3mGsb0Ki7Ue2JnJEcs9oclhx++PoS
         Lq9RndmaZLgFGJNPMGLcX8mKAuSMfsouMwP8SjZa0zemEHm+GhD50BU0ghQQFnkG1nnm
         TZRoM/pjCWh8qsYWC1vijQiapc/hZmGmozoOlA/6E5baaqbN9loSCdh9zjuQDtRi6KP8
         N55w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558768; x=1788163568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H1zokSLfOVJ4mDolTI4j0A98Cqj+A69UP0Nzinjm7sU=;
        b=UQBd7vj7J3kE3hXjc6jHLB6bkc6WO3M//ROGAeB/9jvpbdioEsO0F0x3JWNP7egR4n
         yCqiiWzWgakNwafj9bRp6AxU+oSK71mhFUjEBVE+clRqZ++7j36/cvJyNOfVFNNlgzqe
         s0EhErrAzCyDON7OXPlndYzUoocBO4vWD81YSQiaPVc2dBflVt7IU889aH1T1/QoB9e+
         daNSGa9aBakoaKlVNtVfqbXFN2jk2YDbhwdwPrdP6MMYxFNn8roQIQa++YVobEb9qd6y
         8vtX0eF82idmIztgK3DF7G9OmeUP6spzQxmA7YlWdsBNLHbyxLYoV2A/rEeH/ZH/po8s
         G0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558768; x=1788163568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1zokSLfOVJ4mDolTI4j0A98Cqj+A69UP0Nzinjm7sU=;
        b=NUkRiETXkdaK3nH5cOd3/3ZGgv+N6Ox31L7JJZZ9c2oyFHVrzujxBxuNClsiP6V0vr
         Ic+a9IZXNFhoc0VSWQY+sUm7oInmzHmADMVT9KSs0t39X3lbCw8btYe5OKV8cw3pxgGx
         Vqdn/ahW1ze3pOvnDIJZ5MRxoPEPlwsm4gzXO4MYZNCDPa+ISGgYWGTtjSXK7KDwZRVv
         /VTGlS67X/CVinhbmgoNfmEZfrCxJBSuD+SEl4I3+ZHizWcn8iSOSl83t4EsZjZQ3z8+
         pMxiSBrkVLUFvwhfaZmXXINtS9yn4GUyfBS8Fv1xFta14l0JGJnNVnYd2hAqPGIz7/YU
         JBzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrfyYzSkBl8oZ+HOXPpwlBVvecXCstwXWFyNqr+rdLVfCmQU4id/OsFVv4ISBiJeOVIrdRJkMGlXIz@vger.kernel.org
X-Gm-Message-State: AFuF++nvz42iTK7nZQY3thcOjQ3mtouyMO6tqmO58FFKkTRk4e4RDrjx
	eJsI1d0W3XZ+/rDlktechOBCUjafS2oMzNxm7SmhvU/QCHCTAPBSgK/Yjl4q7QpzqrCwhIi0qx/
	S3xumFzjn8oYxDlM80IzZy4NTF3XzjIc=
X-Gm-Gg: AR+sD101w+hgtBeNjIDqvL48nE54DG0ZjRSCCTOqcQuYBZ8YbX/u7mNkXXYixvR9alO
	GV+G53/TX99dSy4tZiX5VNbRmPjeTEAkVWiM1kaEY/v7whZw5JHsOsHIIyvdEWakeHjcjkLV2PP
	/2mWDrxARcTv0nQTbfMmTcljwpXqUP+GxNfrduQPFnFi7gaAQlYW2ZTmMcEM9ZP5Jcm5NA0Popr
	XkWt8YxlpNK0gS8RFtWa9E3mVPpk8ImvU+2gzzVP+XmWVstfqvoE+5ICsFqaBWFT9wGktw2My0X
	0CpGsVfyagDqdGRdDp8GLkRSZVFOUXn33lGCt/QKeFBgNkhb3T6CkTRM
X-Received: by 2002:a05:6512:3b88:b0:5b3:e52:a005 with SMTP id
 2adb3069b0e04-5b48b67cab5mr4058802e87.4.1787558768410; Mon, 24 Aug 2026
 01:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-ti-ads112c04-driver-v6-0-0e8f0aacce9b@gmail.com>
 <20260820-ti-ads112c04-driver-v6-2-0e8f0aacce9b@gmail.com> <aogvjsjOatTpiw7j@ashevche-desk.local>
In-Reply-To: <aogvjsjOatTpiw7j@ashevche-desk.local>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 24 Aug 2026 16:09:14 +0800
X-Gm-Features: AcwNN1WezVQNnJHyOg-HarQoHcYwKFS3qCgBfN5CCDwYLE4-Bd2IUFhx73q-H8s
Message-ID: <CAF7HswOMH2FGEZR+ZASDrSQjgi_YCd=6ZUoxTdTBfwsec3Y5YA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] iio: adc: ti-ads112c04: Add support for TI ADS112C04
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 6:59=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Aug 20, 2026 at 03:51:52PM +0800, Kyle Hsieh wrote:
> > Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
> > delta-sigma ADCs.
> >
> > The driver implements:
> > - Single-shot conversions using the IIO raw read interface.
> > - Dynamic parsing of single-ended and differential channels from
> >   device tree child nodes.
> > - Hardware interrupt support via the DRDY pin, falling back to
> >   software polling if no IRQ is provided.
> > - Per-channel reference source selection (internal 2.048V, external
> >   REFP/REFN, or AVDD) via the reference-sources device tree property.
> >   refn-supply is not yet supported.
> > - Hardware reset via the reset controller framework, falling back to
> >   the RESET command when no reset controller is present.
>
> LGTM now,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks!
>
> ...
>
> > +     /*
> > +      * Datasheet: td(RSSTA), the delay from the RESET rising edge to =
the
> > +      * first I2C START, is 100ns minimum.
>
> This is order of magnitude delay. Do you mean 100 =E7=9B=9C? (Actually wo=
uld be good to
> use Greek letter in the units, looks much cleaner in the comments.)
>
> > +      */
> > +     fsleep(1 * USEC_PER_MSEC);
>
> Otherwise this should be simply 1 (no multiplier).
The datasheet says 100ns minimum, so the comment was right but the delay
was far longer than needed. Changed to fsleep(1) and used =C2=B5s in the
comment.

Thanks,
Kyle
