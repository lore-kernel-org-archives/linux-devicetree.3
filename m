Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9D32F5491
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859789; cv=pass; b=RaS1kfFyBmqYKdhoDjR+wwb0qksU4Npk+T5k1DbHPcI1OKzO9BPpJd4J3snyhL2IT+1B3OsvWBonMVhxDmmTj+5V6ecDM5O4DC+ORCDG8KxJMPsJottK6kterV35AGrum/vYUlsOzNWf9jDt7Q4y1drHiOOtn+vulGpqymeXlZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859789; c=relaxed/simple;
	bh=rijSLO8wERJrlBkKmldP6GoWjVWR6dDNxw0bhl7eoSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiMPqISPvkalvVfuFHwgXK/Ygf6L11nUN4xSSj0U9kg1ip+5YF8/3eotH6BM72mGwQ0f5b4thQU6LLfUjz6+qIB+0I/bxsgL7kkPdGRJAZ4H0LauFUF79bXxDm5WkPjhTsJPE2M/F2Ut6HZHzTieNrPuOCu+bZt64ta4lvvD2mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MV6AECKh; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MV6AECKh"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3922b35e69cso90274251fa.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 22:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779859786; cv=none;
        d=google.com; s=arc-20240605;
        b=YMgs/Kwy8BTgOHpQqY8CoudEUtzRaR0ufzl9SeHANuahKqG5+j9Bdj8s+wVwHVrvVI
         PVcZXEL5h0kEXe+WwVf9B1Uns8ne91kRqRR7KXXEnto0lePa0BBNxfOdfQLkyNT4iZd5
         g/hE41BpancWRRzQ+kBz8Eeg7c8fiH0zlThMyzJAxj6cthVgf+7VzTHbrfe/be+5hxQN
         lxA1Oa+opBUcsMy6aHmedK5LiILOJXH6xgeR/Sope+srruEL4wf34IE7bm1JW4l94hf0
         igKqCmxHhcbHYpvzWDBb2Ob10/eQ5Qo96px7QSNMLMkBO9HtbneXbcva3fa2vPMm7xCD
         wg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sWU01JGA+KO3onhm4zSW7+7G6c0/a5rCe2jY0OsegKE=;
        fh=1uz7DZWZcmn+iBRwGHDFluwVPqDCT92Ua+bjE1rpDZk=;
        b=JI1SV3EooKh02EWgez8X0J5n0+Qbd/3D/mPISL4MhJFin0o2uVQY3u7e9Zfx2jCfIh
         PXFCclIwPAbCI7CiH+sJYD/oLC0FSFtKwzRSuTCu/F6wqw3iPqu8E0pxY1JwDoABUEf3
         EUxanIRc3jOlENdjfkNZVcKciTO4pW5iHjs9nDObAW8nVhyPn9mAbZE4/tKb9s4uXjzf
         XNUshgZWlfT7MquN05pEr1d3T/CyhMdJ6TzdIszXFQS595b9CQ3cdg/nTfJErw2XDpWI
         1pvHdNtMR0ZEf2Knvd6rI49JCyUSkFFbpb7hSJvmqRA9qbaFjEXTceqgGBZQ0Ljq4Xlf
         0qww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779859786; x=1780464586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWU01JGA+KO3onhm4zSW7+7G6c0/a5rCe2jY0OsegKE=;
        b=MV6AECKhggZoGg9XhcycCH5RW1A+Mg5EQ1yE1J97E9fev6TY1PyD+rXxj0XOnnSDYx
         FzKrImGkzKg9ZKIfRb9+s+EgIB+V9OX+PU6mQdpWThDlf/3gMAC55TEgJItxkSLhG/iD
         SWRG34edcY3ziNK6Qp/0/iofT1Llvl5Ykn5KJT6GXU12aYy487xhC0uVWb56EsmnAoKK
         cDe22baOf/s7jsn8DnY/7MZtCcfES82o6/nWR/nlqe8zEDz15RpNFcuqRERZ+EgOPRXw
         IdmDFcauN/f6jovIOPtGyNA3WyV5VY7pcg9eRzilRjN5PRHqhLMj0XmWsCXoVIyK0L7S
         4Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779859786; x=1780464586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sWU01JGA+KO3onhm4zSW7+7G6c0/a5rCe2jY0OsegKE=;
        b=GP8jk4jeoTqFqnta8ixQ0sNYeaPeATyCrrhzWgknPA+DBawYhoqEzMOzQ22BvkkuOI
         nmwQBE6dbc/16U90B07TGe6LsJy7wk9vyBEm7QfA3JImeBpCV55QVcbIC56H01Hj++Ob
         svvbevrDCz1UFQweZBfRZnamVnaLLVV0WSPh1qYW/MBgpitiOEcEQ5wG3PPxgK1PGg0t
         qaJBMNAau6rfidu0/zb2KJNvkiD4ls8nlwyCs4HVbaFKBc8l6BUfmj5rtL4QPNe89mfD
         pA7j8GP3CU8j2RQ9cQNStfp5gG2AY1qoDKOynp6wiB3iSyDwxCOY4Qjld7z7e8MGArfx
         w8nQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GI8GZl6WcKKDVNLhllp1Bt78PBf3pxY4pJj87SCqObCD6jSSLvMAGuMB5bv5Uzw0kKciTfQVY/EGj@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqdQ4z31zoMTGDESxJ6S37s34L9O8BaOunI+/25uGOFTitwG7
	6y9Oc509nOozJzXia4gug+4LQaDczX+h0FV451nvYvge7VG9cKWdYm4nFodbMNEfHarMBL5ThUo
	CAnMnjyGYn9ZEbkR/ldhb6PYJhlI8gMDoX+c/D343Vg==
X-Gm-Gg: Acq92OF9MkVGv6kULsikMI80MD4MONdtiLU/e43u93u9cdIZCSfwMyiYo4b+QGxrImQ
	awJ1MJ818Pr7qdxUk0CDXrO4r/D2pupqxhh+u1M0pkfXttycePPbAAzjtKnsooTqFk4TgjdgM/M
	66cCIv4kgTg7PtdHsCmk443bwjrqCiM38+4voZrA5/Z0Ttpp5Kx1Lgie2l4a9+B6NI1+OWRfnAn
	0SKj08Tf0L2KqgKCDE8nbVgSvTA/uMc/Xm3IMtSLmAoAEW39Q56QbzQ4F/0c9orUGU6ubaS6IRH
	OqL149f7V2f8f82SQOx2FtP9oJ+qPEIVi/+xNFViAI+nn4CBDg==
X-Received: by 2002:a2e:8090:0:b0:393:e50b:6b2a with SMTP id
 38308e7fff4ca-395d8c935d7mr49951611fa.11.1779859786057; Tue, 26 May 2026
 22:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <af0EGv172ZMl/6N5@JSANTO12-L01.ad.analog.com> <af2gJyG3rDjsjFmo@nsa>
 <agdKRhtywsThg/gT@JSANTO12-L01.ad.analog.com> <20260516113738.4103f388@jic23-huawei>
 <fe766c2a-3662-4896-b7ec-b569791630cd@baylibre.com> <ahXle0pZjpldxASF@JSANTO12-L01.ad.analog.com>
In-Reply-To: <ahXle0pZjpldxASF@JSANTO12-L01.ad.analog.com>
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 27 May 2026 07:29:34 +0200
X-Gm-Features: AVHnY4KPeRFOt6loq4mrCx4OstUgML83TNvRyVA8kmSgRMQGC6K9ziPReSIphZ4
Message-ID: <CAMknhBHe4vyS=5vbDwonxzr67Z9=bRm6TW_n=yowBN1My4jA=A@mail.gmail.com>
Subject: Re: [RFC] iio: adc: support for multi-device aggregation
To: Jonathan Santos <jonath4nns@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	nuno.sa@analog.com, andy@kernel.org, marcelo.schmitt1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 3:50=E2=80=AFAM Jonathan Santos <jonath4nns@gmail.c=
om> wrote:
>
...
> We had a 'hack' in the HDL where we tied the CS pins to activate them at
> the same time, but since we are aiming to handle each device indually it
> would be nice to at least enable all CS defined in the devicetree. It is
> strange that we can define up to 8 CS for one device, but the spi-engine
> only selects the first one.

When I did the multi-data-lane SPI work, it was only for the multi-SDI
case, not multi-SDO, so that didn't get implemented yet. We would need
to extend the core SPI API to handle this new case and then implement
that in the AXI SPI Engine driver.

>
> > For this type of SPI controller where it can read multiple data
> > channels at the same time, the .dts should look like this:
> >
> > spi {
> >     #address-cells =3D <1>;
> >     #size-cells =3D <0>;
> >
> >     adc@0 {
> >       compatible =3D "adi,adaq7768-1";
> >       reg =3D <0>, <1>, <2>, <3>;
> >
> >         spi-rx-bus-width =3D <1>, <1>, <1>, <1>;
> >
> >       /* other properties */
> >     };
> > };
> >
> > The reg property is the 4 CS lines and spi-rx-bus-width having 4 items =
means
> > that the controller has four SDI lines (the value <1> could be differen=
t if
> > each data channel/device was dual or quad SPI).
> >
> > This goes along with what jic23 suggested about making it similar to
> > what we do with daisy-chaining.
> >
>
> Since last week I have been testing  the approach you and jonathan sugges=
ted,
> handling the multiple device support within the driver and using the mult=
iple
> data lane. Additionally, I have included the ancillary device to manage
> the devices individually when required (and to make it easier to write
> and read using regmap), but some other problems came up:
>
> * When addressing the devices/channels individually, I would like to
> select only the respective SDI lane on each transfer, but with the
> ancillary interface there's no way to define a rx lane mapping.
>
> e.g: If we want to read a register from the device 2 (index 1), the
> ideal scenario is to activate only the SDI1, so the controller writes
> the right value into the read buffer. Without this mapping, we get
> the trash from the lane SDI0.
>
> can we add some new parameter to set the rx/tx lane mapping in the
> devm_spi_new_ancillary_device()?

I don't think we should be using devm_spi_new_ancillary_device() here,
but rather add more to struct spi_transfer to allow selecting a
specific CS line in the multi-data-lane case.

>
> * This driver registers a regulator and a GPIO provider associated with
> the main SPI device. Can we register them for each ancillary device too
> or this is not allowed? I am still confused on how to handle this kind
> of situation.
>
