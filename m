Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45F3F164A
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507423; cv=pass; b=qcw9HR1bxl10JTa+UuXXSPod0DLDoqILJTy7Z1k7GWqz/RIrHeaLko8OD+fSYuB/98nWik5vBFs2KJdnufcUZvXAZ7jVkDaQ/gnxGsIwO4fBFhtivOcfpc2MyABjeqozzbofBEU4BFelfC8nBTa3AT/zbH++ij+OagsUPt8fJFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507423; c=relaxed/simple;
	bh=9YG3YiuSsjojmW6A3ugXZPxI9/qnUbBiyh2KgjsRZ3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2XnUGheQpLoZEiYcuP9Y4rj/n8FTj2K7fHPNbkX6c5jInwNHFaTr2RVq2ClSkVPu+40ZfaQCF/ia/ze7X1cCMF0ti4dkI1jCIb5rTqhW7SH5/VBTPbusQ1zxN1tPchs08s9KzDOAbsVVWlvYf4qCvEY8rdnk4xyBNcSxjGtY9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0XrlNNW; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0XrlNNW"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-393c93a01abso36705111fa.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778507419; cv=none;
        d=google.com; s=arc-20240605;
        b=ZpNDqfc2KuqphzaIm9iwY7XhJmtoKwSajYiyYcYjC2KWzDv9f8y8lsVCnIamap0dHP
         bf0AQTMhHgsQCwh2TJ8tQap/BIRO8OxJ5FaQQH2mdfAFTJ9JnNuIiUShbKF9h/ceQIjR
         xuuVUeijS5MMC1bWFTeReU2mHSHn+ZRC4u8dNcZJI7PNVB5C5nBJAR3PlBuWT9+dUZ5f
         rmFph7UHZd//iEroak1WZ121UKiXrpd1b16a8B6Adfrz9zSW2kcqS/w3MWNsMvdfyhvS
         nTzk0khTll+4dRxhlj6J4kTbzltUOYzaE8VzZJaoQ5JbzX0ldBk4nFJEa7WtvMzAVZ0n
         BpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7zC1RYg8tYp3lEqo6W4RmkrRDKh6czAweS7OgGTtxuw=;
        fh=N2yGwKCJ5vb38eFZvtCj84H7k7B+JxREizCkcAzw9S4=;
        b=Wl0iu57SDfOtEvK2CshcVu6ZHASUqYeRoXSNjCebC0rAhOsos9XcQteLvhG0GUTMcC
         nLK18H0MmGYp3J57SjJiBlFK2igrB+1NfpYXnU+taoswsZz75ZmpTODjxME6ScZO01Sj
         563f7hzkGCJPIt4GQSCpUzV1XEDTnpvznztYgDKrK+7Tr0Te7TIGA/6dLJZqr/AGWxsf
         4D+XhTP9VpcHccx9I6jgSFL2fSIL/EL82Kz/1ectTiB0mHW+olq0doBZCqoz9h0n7wEG
         sUaLjg2WBHyG7JQS+aJKo5BvdKcwKAaPHaKaxDuuVMbjTieg/rAKpeR+rOQYvfm51Uun
         R1og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507419; x=1779112219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zC1RYg8tYp3lEqo6W4RmkrRDKh6czAweS7OgGTtxuw=;
        b=j0XrlNNWo2qcZki7gxrPpErKiRUNBamLSKTdVqr7s0B/7wq5X+EHcn8p4ZiKlcInCx
         OdwDlKCtB5HHcuUPeeYYCuqU2YrgVTM8gZe5He0j3+45Tc5q9WQb0cWZCmQFviSLFlwj
         Ph7OJ7qQ3oVcGqUnM/InkR61QNGqUeoxFFsy7pXS/HEkmxvuDetCqRlHS+3VnaOfnYJ7
         3zXGgqwbHIGN3HArOFnJXn9NIK+NRqTbtEthwELANTJQVva3KY8hC0wvAf/N37iY0QYE
         iYlAF9k6gAi1qhPGgHQuitqhrlgdgAJpqJItHnU2TQLlW9PLsOqrnDMLfP5hX3KbqIKb
         xreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507419; x=1779112219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7zC1RYg8tYp3lEqo6W4RmkrRDKh6czAweS7OgGTtxuw=;
        b=LqR3uf7LWMKTCCEhsTOEwFIb+xC5jKiHTuUV2ipxsbeFeIKcSWBqn/EtqVYiKVcxDM
         g2yOaprr9jCd2/FITxsZC9Wi3P6rn1OXw9Uo1xzOwPC27FnTlmcKXQES6hSaV/n+ciVF
         pBpRjgEyjtqlCTRN6Rn+cXCTAFTqD4eCnQQRdFiYqioNd7VCMWkKc2riXexljnzV+kX1
         xLvHXYS0UsJZTx0NbUgalS+AY6AudOTdgFbVXF8Wa2vt5tIFcgffcD7IZ4IwC4qySNEp
         aVK+TUxTQZ7ORzpHw0do+GREuz4UUPT8d5OaxWKbv/+BEvlkOZQ7GS9xrBHC/B6EDZP/
         egBg==
X-Forwarded-Encrypted: i=1; AFNElJ9CZylAmXW8rZ8UDCYNM3d58VJQhd6eIKOzlUh1rBW7GobCd2ClUNG47RnCk4TJHQQLXBNtFn4KaM7R@vger.kernel.org
X-Gm-Message-State: AOJu0YxXUrfASvbES+WjPvDqSovidha22X/tcR84hVMtA2ZhPfLQglEm
	NBpnINKGklHFhnqaIrir8qlTRhGRzzr8ujrxo+MB8ExjQXwu6L9H0SOaEWOeI3Z9YZp+3DhIkWt
	kjPKGZLaeubAr+jNDA5ym9/46NJDK6+Q=
X-Gm-Gg: Acq92OGuRF5DeFWpqSRG3UQLjJkPCbtxu2DxgIHfjmaIZbIPUmC20GY7FDrFbJ7HZS4
	bpVwycHtTXcP/jWCKsQhRUPjHoMCjLrb86OHaJaywCdw2WYWNvsBi4s1QYi0e2gc4RSlmxTjxme
	fUNNs2T4lb2D6w1LO/Ul5Hg8ECkMtYTgzVvTpzD8zlOtSsCx4oaA5J+cJ3C6CRCYI1TwpbbdjkN
	4lCBUxMKXQlllrEQbu2Xpuo7zVdfFUowsO8lQ68A1YV2Az+o54yoXpGgSj4IVfqOkt4F+zrowDo
	CTN0Pu4YaW8Gc4aXDITqJgtiNUfcQdJj7KCamj35lay/JfRFcw==
X-Received: by 2002:a05:651c:503:b0:38f:f8f3:6c58 with SMTP id
 38308e7fff4ca-393f4d1cb99mr44752051fa.11.1778507419262; Mon, 11 May 2026
 06:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510194947.31997-1-piyushpatle228@gmail.com>
 <20260510202657.38326-1-piyushpatle228@gmail.com> <agG9FAXXiTKDIEDf@ashevche-desk.local>
In-Reply-To: <agG9FAXXiTKDIEDf@ashevche-desk.local>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Mon, 11 May 2026 19:19:40 +0530
X-Gm-Features: AVHnY4KoDwq8UL37IRCHA4MrolOptuT28ZabDwx-aMaHdYGg1AJuTbAKe7sUm-Y
Message-ID: <CAMB+xkZ4MjhR3jU_L3=a=2+ubJ3oeL=x18dypEbRDa9My=LAzw@mail.gmail.com>
Subject: Re: [PATCH v7 11/11] iio: adc: hx711: add support for HX710B
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: ak@it-klinger.de, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 4:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, May 11, 2026 at 01:56:55AM +0530, Piyush Patle wrote:
> > Add support for the AVIA HX710B ADC, which shares the HX711 GPIO
> > interface but uses trailing PD_SCK pulses to select the active mode.
> >
> > Model the HX710B with variant-specific channel tables and IIO info,
> > track the active channel across conversions, and use the fixed gain
> > value when computing scale.
> >
> > Also update the adjacent Kconfig text, file header, and module
> > description so the driver text matches the newly supported variant.
>
> ...
>
> >  #include <linux/slab.h>
> >  #include <linux/sched.h>
>
> >  #include <linux/delay.h>
> > +#include <linux/types.h>
>
> Seems wrong order.
>
> And here + blank line to make linux/iio/* to be a separate group.
will fix the include ordering and grouping if a v8 is needed.

>
> >  #include <linux/iio/iio.h>
> >  #include <linux/iio/sysfs.h>
> >  #include <linux/iio/buffer.h>
>
> ...
>
> >       /*
> >        * triggered buffer
> > -      * 2x32-bit channel + 64-bit naturally aligned timestamp
> > +      * up to 3x32-bit channels + 64-bit naturally aligned timestamp
> > +      *
> > +      * aligned_s64 satisfies the 8-byte alignment requirement for the
> > +      * timestamp. For HX711 (at most 2 active channels), iio_push_to_
> > +      * buffers_with_timestamp() places the timestamp at offset 8
> > +      * (scan_bytes=3D8, already 8-byte aligned), identical to the ori=
ginal
> > +      * 2-channel layout. The extra channel slot for HX710B does not a=
ffect
> > +      * the HX711 ABI.
> >        */
> >       struct {
> > -             u32 channel[2];
> > +             u32 channel[3];
> >               aligned_s64 timestamp;
> >       } buffer;
>
> Why can't we used a recently introduced macro for this?
> IIO_DECLARE_BUFFER_WITH_TS().
Yes, this macro can be used here, I will use the
IIO_DECLARE_BUFFER_WITH_TS() if a v8 is needed.
Also when should I proceed to make v8? Is it needed?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
