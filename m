Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184B73BADAA
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507148; cv=pass; b=A0LlH5BnNkwUUKFn3YIiQLSpMThdehk43MVb3UA8L3yNXJsudVGZzJYnxO5VKHIyxuRi8618m41+1075l+QQ6n/aVK4Gk3vh6144aFvuFIO3O+kUBIOWVefS8hBZEVR6v48Ty0DLUzMDyCaYT/lM+QX2SgqF/TLu4SYxzmnCjMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507148; c=relaxed/simple;
	bh=3KnvTe9/cN+WWCSEbW1BSjd4/x3h8ZRmgkqV9achZb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnnRQ08ClLbAE+3clohjmcz91FrtoHTaBB8UG4/pZV6Z1ckUPS5imeSaURy7zSj274xotMreTAv09YWJha4ALUTNbPAjHMVPfnYe8ekjuww8fKQ5PEyU0DWiLuz1pYRRUUVHObkQtnws7H/xFEmXj6jyzNPJqyjiu2cHunw8YJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFAWGcC5; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFAWGcC5"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso5636144e87.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778507145; cv=none;
        d=google.com; s=arc-20240605;
        b=LDW81u9kNMY+GETT56+sNmhL0+imU/D+lAgPsm52YIeiPNHs3X7xIsk9Z/7XmAN+LF
         L6DZF2pmmfOmyC5szNSNbhfpx5ibs0PS9XcAs+xZvMkstbTNRvjg8XDDUhD6pRMrk67x
         yeaDMETmqGrsI66PzXOSpbv3UCKKSqcOBvbMMoYL2eBRvOlcKTAUN6vxFCTxhmcflF90
         yoxOkf0qz2pJBUj2GLbLSneNrSPpHD1z1ooKUiDJMStdXv/ZCyIp0OuOnsCb8dnxvY/j
         8qg88sjMwfGnMNIH0EyGdYgBwebUn0HzTabUHY0bLJvYVqG6CHaaLxpDtBRs3n9YNg1T
         Z61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h/8qSIlDWL3NvkqtCpX9JKQ0XkALQkfPhFL0geiOC4M=;
        fh=EBvQvmxNNN1YoeaV32q1zok+kUZLjxGxvyxP/pflOoM=;
        b=cQCWgYf08tOSsLQwacsAeY/Zr0gJHiozjHVFtqUVYgy0n1sYBQyHpocYwah6Qi/rA9
         fF4ALBZ+KRBvGFUfUmox2v1+bByRhMf0lR4YIJ/23a5FyPDPByMxDb3qwBsAVdXbRja1
         L0ZQ0sV6zOsEEeITZb+ua8EkHDN1MN3IUGRa9oSe1Sslpct0l7060Tfd640nagPynj5O
         DKe1p6jM6YWnfPBkC6Xh6sGrwbX1LnkqhGy3BhlZU6yQKClOTSBt7BHeojfCop+AwY3k
         FLcctsDqWXPgSMzEt0yJoBiy0sB03nx3+0m9PqCiKGLKqODEkBvHxx3hLGuWo4qF4wNe
         Ef5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507145; x=1779111945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/8qSIlDWL3NvkqtCpX9JKQ0XkALQkfPhFL0geiOC4M=;
        b=fFAWGcC5IWiAJDEYO2VSVlTIbJZU2ZKTt5f5azxZriJO5a6y6k5Sjxpj8OEq5jCR6L
         UzbnyEsjY1hwZKpwgfdmfhC7MeIoZHWWC3U6NsQoqFhSa69azxgQo/U1D00w7yOvZ1mZ
         xK9utN0iTvOv6Kxo/hgocrj5SWsPK7hHmrXj7765E6IkcybrkS/caBIF4HLKx51j/4Z3
         gzM12B6n0vqJN8UlWUpzEAFxpu72tnift+MsHuSqk0ROxRGXcBEppVKpzWYgFSk/FjSl
         BmndeLW/nkBxZ/VXKwteH4buUUocpoV/Fd5x4ZDeeBaLls7cPJ+xWUCY4bWyqVQL583n
         rX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507145; x=1779111945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h/8qSIlDWL3NvkqtCpX9JKQ0XkALQkfPhFL0geiOC4M=;
        b=GENuQw+do9IWdalG+gE4wFPzmaAHb3cFxPduqOaqaMZCWF7LGaZ67bNH+PMmlDcjB1
         nquhQ6mXqiVXGs0QVy+R3N2m4ai23FiF7oDveVTBC2LGiFbkM6K9ItcYRsi1CB+oydKU
         jJ+5dPhAAwupq3f2HF8QyFc0GT4f7SgAicKd41UAbxgDW7usvxkHBBSlVXFZua0iNoc2
         KwQ8EQcJ3KVbTUtyLxVC/HWQeOnJG72tLWI9Rwysy992uOR/php8Rjfdnzf17TY/fmC5
         q5KS8h2Hna+JKU9tdEC71NlAeXVZQW2AbpTLcXMRHPYJAcX1aBNc//bVXVVaJtD+lGHF
         1+0w==
X-Forwarded-Encrypted: i=1; AFNElJ8E6mx3rs8joSPl9wYNeTygv0sw0PYmQQX9YuZpDhwWWwg/Hj1uwfJDK+941Cjzu9l77asejriu0rl5@vger.kernel.org
X-Gm-Message-State: AOJu0YzKm0aLioZDW/0NkLYvnrt/N7qIKt+2m609ixTvwl0+NJCKmTjB
	+YAd0JRSpqk4DABGFRnUxdWeSWG2ryZxo+u40/U8j1H6QjSM5/9YxaGZTVQ70hG3+Y2ut/xmw8A
	WqDg6hoFWyX95POKnKLPwNYdI3ag9E3s=
X-Gm-Gg: Acq92OFCCepfxNt00DEtY670agXsLDyuInh44egqHwkvSvy3x+Y7cr6AOcC981x+7D4
	ljLPNJuELKtAk6+6pQT54qH4IbembIG2dkyq6CzESwE9SkcHXA3+PNNmvSlBx2Im0qHoDlAdEV1
	tPSPBzxDz1hOfMzyGBvTKk9WQEPHoKX5gJNUF4uEMBYeIlZo2RdalGaTU5cGUWy77beYHEyU1PQ
	96pj+rzFwG7oeEfKFcL6pSdzEdQS+4jG/MtaZ8vvGwCKwPBqEODsMPtgyWsinPoInmPqU1z5N1H
	8h7SmXwqeLxkdOb7j1rZZkCp5ZyKwHIHwpdxmWDZcifDfMoTGg==
X-Received: by 2002:a05:6512:3ca5:b0:5a3:fd0e:ce6f with SMTP id
 2adb3069b0e04-5a8bf22c902mr2267374e87.23.1778507144944; Mon, 11 May 2026
 06:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510194947.31997-1-piyushpatle228@gmail.com>
 <20260510194947.31997-6-piyushpatle228@gmail.com> <agG7SvqOB8fRM0mA@ashevche-desk.local>
In-Reply-To: <agG7SvqOB8fRM0mA@ashevche-desk.local>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Mon, 11 May 2026 19:15:08 +0530
X-Gm-Features: AVHnY4JoGVbPKk9EZbOVpHOWfLQGYkmhL8suLnmfD3S81pXSQX8RZpXfSIDNsjw
Message-ID: <CAMB+xkZ65L=McOcwJ-WprTqpuBYnZRSZwO43ReVjbhKQ6TnjrA@mail.gmail.com>
Subject: Re: [PATCH v7 05/11] iio: adc: hx711: move scale computation to
 per-device storage
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: ak@it-klinger.de, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 4:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, May 11, 2026 at 01:19:27AM +0530, Piyush Patle wrote:
> > The gain-to-scale table is global today, so probe-time scale updates fo=
r
> > one device overwrite the values used by any earlier device instance.
> >
> > Fix this by making the gain table const and storing the computed scale
> > values per device in hx711_data.
> >
> > No functional change for single-sensor configurations.
>
> ...
>
> >       for (i =3D 0; i < HX711_GAIN_MAX; i++)
> >               if (hx711_gain_to_scale[i].channel =3D=3D channel)
> >                       len +=3D sprintf(buf + len, "0.%09d ",
> > -                                     hx711_gain_to_scale[i].scale);
> > +                                     hx711_data->gain_scale[i]);
>
> Since you touch the only line of continuation, fix indentation at the sam=
e
> time. No need to resend for this only, hopefully Jonathan tweaks this.

Ack, will fix it if a v8 is needed.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
