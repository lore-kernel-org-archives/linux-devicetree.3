Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D093955FE
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036302; cv=pass; b=SllfL+yZdO/dGuZy+MDEGeDkpCkx0zLSgRjYwu4c7p51vhOMNDUbXd2F8Ex2Y3OYB618GDwBZ9oxqzuDYITNmZqIxCAMRNknFLItLR6B7tClnyqtFNRMtEFj8+6Np72WpCtnYDNU3J3VxvhgFD+3JbimI5n/ghD4Xtd2jHt6Hn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036302; c=relaxed/simple;
	bh=T+c9KwHBMKJX5H+fSuYaxTfHRJKO1lpeNRCqOQ4gZas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdjjYhF4f/g2FapnE/RayOgvHJIJH75XzNMOHnQsaTV2xEJpabMwfVqCGQWIQtyrlasyqMfFSt4RMHzCtJN1KjHan5DoKxiplzTnkoObqc4b9nZ8WPmaOaaQYnkIgynQhMeDG37WOgiVuYt+D9NzdAZg9t2Z6aA+toceytECrb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGef8C7B; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGef8C7B"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84eb992a881so2290522b3a.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786036300; cv=none;
        d=google.com; s=arc-20260327;
        b=bwjr+aIqDAVVLiQatkSkFvIOG8LGP/VMyTyci2KNYx58vbBla4Ey89OYQGSs1fpHnC
         QS3VPRSp1NietU9JXqwyANrqRkB7ow9WH/+VZb/0rb9gwqRuSqxZWWBl3fgEDRz7/jo2
         CmZzFpHwpv58r0iYsG1Wutmzq1E13WcbdRgU2BmEIQwRzrOxRPgFq6rAt8Op0Y2KHVmy
         1z3HIfjuBP+JMiDaAHflUZUDzbgpG4drdUAVNFRO3y7AcJ/fqG/bMI8Mqex1zF6KWtCD
         8TdS9Qyc4HbveyI1D17uUfakdeDCjKeWQVvevBoJMgc2oHZ5GUeXQl1f40MverDhNkPx
         xlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dUc3PxEo9OjvYh6zyCkhQpEvH7cKoP39Cy47FDBl7oA=;
        fh=/ljp/ZPxvNUBgCyizY24rlwTC+vc9sov5YscGOZW0U0=;
        b=nWWuUcOUSG9SaIJaK3m0OBy45OVid5U1vToohia+EVLNOaiUmK66Je8IPHGsrKepNW
         9v4OlI1PlIshdwLYmCpNt8kzc6HKC1dlguMkyazY7ENZmAWglyLV5HTY5mKYSWWP0ALW
         tlNXSgrTDVygwoHXBLyeWHSk/0uixejHnyv+sULrtHZ6f6zXqUH5zMaBjn/AaVPcqrAW
         M7pH0+1UkPjjJbmh/dS5WaW9pkcCZyn2gnsLtcIf1wwGVjsGJ+swa30UKZoYD7/jRKmY
         lWa5utzWzSvCZMYZyBjJxUnap+yuxq3Q4xuZg7JgWwmnX/WeMETvDrQ80N4IaYyBjvhQ
         nVpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786036300; x=1786641100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dUc3PxEo9OjvYh6zyCkhQpEvH7cKoP39Cy47FDBl7oA=;
        b=UGef8C7B2cklnd7xpYBoK35bqhTm6lfqAM1HZfbBH0NPMKXe6EEcYoltpCpLEq2S68
         ZNm/xmdpbZgv/FvWgGyVyRhJeEVS9KeMPw2HkjIJlwUmAZK4VQ7jUPqm9VwuELwRTwVf
         VaZcGVbjfBCMBxQDzh0mJKsMpp3EmHJ160576D90helJog7MuTWYGLvZLtfcHgSa0FSP
         UxUysr1ipj8T9pver6uCp0l3LYhh07q21EjRacE/uKwmyvATwmSPmFUcp9T6IP1t17Lw
         N1gIVoybo0FQEHc2mKi2T9Zf1AnNwYroeSQDzO5UbLTi5PeN+qFgv5B1qoRHqCSwx7Ug
         l4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786036300; x=1786641100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUc3PxEo9OjvYh6zyCkhQpEvH7cKoP39Cy47FDBl7oA=;
        b=K8E35VlXat4IHsuGtGvSHggLGZi90HAxsbzMFbPyBhu00R0ElkQ32Lqbj4oAuNaMtI
         //MebSNOL+qNYaFkqEiYNMqQ3EmEMNSoaYz/zgMauYuxUZI0n7CdDow0JAOfEKuXwnA/
         19owcxCCxmvdZDDXClhZW1BI52ZD4/SVNKcKZ0CwpqZX4IoxvMZNV9lKGjyoDwUols9m
         pYJ8wlqAN/e4WGpzzZsVm8+qzE0C1m0ZwLo1ZTSFNdwzSpHbeV3bR2935tw08ZPRNJwu
         xryxf2E/zYpRlmuriv2yp9uiIX2p4ViS/F6ZYJvRLdct0OVZ5uKBmf/D8jIcS2lQi7vB
         zmZw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7f+NWILb/dBRhka/Ent8aiqVNXTT2+KqcvCasl+r74V4V+SVryzfgP3D7KwYyJEU7+l0CW2xkUTo8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3pweVUIS68V4TdDOD30sE2lXmb2jbYhjLAfNSxoqF1lKhfvzh
	zD/nKwGOYJYjTIXazJr4YCznHvopTuS13ubGGhjPDRCLHqoKrtTbfpmptSFU4hsRGhqa/sWU/88
	6ymKY8Pa5vHujj/oeh7+79yNIxiZ3Dvc=
X-Gm-Gg: AR+sD12CAGZVpO9oOZmMvLiVgtpA0VEaIqfDDZldG6w8uPBHkcYxigh7+IkL2yLs4kf
	G2xQaW9TtMJhsz/sikgOUeJNYOyWCAm++oq5VxRocc8mdhB+ySBZUgP378CVxAXwuEnpiwmfvC6
	J0+3IDMVVexJsN9Y2R/RqjPfoed+HIW2Q0YlfSnEHu9rPpOBVeuVOZE/b30RGnsqMjlkCO1/VgK
	ecCmQIL1/m1uvXODTRQ5y/f6ieWzug1qEDqUBTJS4QXtgVIwOPReBPCQkb1zWgbbLtH9nZk2/OO
	QgwknnaUEGwMb9Yxpjz9FmGIKwbTcUXBY7/3pZ6RLE7uUCfJvRzd54nAbyFEX7DNo7mIjYw9a61
	rhw==
X-Received: by 2002:a05:6a00:909c:b0:845:3fe5:cddd with SMTP id
 d2e1a72fcca58-84f4fee1fc6mr4208416b3a.36.1786036300505; Thu, 06 Aug 2026
 10:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717185033.246580-1-jakubszczudlo40@gmail.com>
 <20260717185033.246580-4-jakubszczudlo40@gmail.com> <20260718020145.72762d9d@jic23-huawei>
In-Reply-To: <20260718020145.72762d9d@jic23-huawei>
From: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Date: Thu, 6 Aug 2026 19:11:29 +0200
X-Gm-Features: AUfX_mxDirMrQJkcLbeWjVytzn8hPeCC_w3HokSsbjdCracmJFAenFia7CFpbd8
Message-ID: <CA+gq5JjAZ0itJQMp99+qKvN5i++a76whTRmrLgaj0eCwV=4zoA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] iio: adc: ti-ads1100: Add ti-ads1110 support to
 ti-ads1100 driver
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, marcelo.schmitt@analog.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mike.looijmans@topic.nl, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jorge.marques@analog.com, antoniu.miclaus@analog.com, 
	mazziesaccount@gmail.com, jishnu.prakash@oss.qualcomm.com, 
	duje@dujemihanovic.xyz, wens@kernel.org, sakari.ailus@linux.intel.com, 
	linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sob., 18 lip 2026 o 03:02 Jonathan Cameron
<jonathan.cameron@oss.qualcomm.com> napisa=C5=82(a):
>
> On Fri, 17 Jul 2026 20:50:33 +0200
> Jakub Szczudlo <jakubszczudlo40@gmail.com> wrote:
>
> > Add ADS1110 support that have faster datarate than ADS1100, it also use=
s
> > internal voltage reference of 2.048V for measurement.
> >
> > Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> Hi Jakub,
>
> Seems some stuff in here should be in patch 1.
>
> Thanks
>
> Jonathan
>
>
> > diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.=
c
> > index 363f790ca5d5..19533667e6cd 100644
> > --- a/drivers/iio/adc/ti-ads1100.c
> > +++ b/drivers/iio/adc/ti-ads1100.c
>
> ...
>
>
> > @@ -139,14 +177,16 @@ static int ads1100_new_data_is_ready(struct ads11=
00_data *data)
> >               return ret;
> >       }
> >
> > -     return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]) ? 0 : 1;
> > +     return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
>
> This change and the use below seem odd to be in this patch. I guess
> they should be back in patch 1.
>
> >  }
> >
> >  static int ads1100_poll_data_ready(struct ads1100_data *data)
> >  {
> > -     int data_rate_Hz =3D ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK,=
 data->config)];
> > +     int data_rate_index =3D FIELD_GET(ADS1100_DR_MASK, data->config);
> > +     int data_rate_Hz =3D data->chip_info->available_data_rate_hz[data=
_rate_index];
> >       /* To be sure we wait 5 times more than data rate */
> > -     unsigned long wait_time_us =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, 2 =
* data_rate_Hz);
> > +     unsigned long period_us =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, data_=
rate_Hz);
> > +     unsigned long wait_time_us =3D 5UL * period_us;
> >       int data_ready;
> >       u8 buffer[3];
> >       int ret;
> > @@ -159,7 +199,7 @@ static int ads1100_poll_data_ready(struct ads1100_d=
ata *data)
> >       }
> >
> >       ret =3D readx_poll_timeout(ads1100_new_data_is_ready, data,
> > -                              data_ready, data_ready !=3D 0,
> > +                              data_ready, data_ready =3D=3D 0,
> see above. Seems to be in wrong patch.
> >                                wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_U=
S);
>
> Sashiko points out that the polling period is very long.  Was this meant =
to be period_us?
>
> >       if (data_ready < 0)
> >               return data_ready;
>

Hi Jonathan,
can you check out version 9?
I made some improvements and tested all changes on the newest kernel.
It should be ok now.

Best regards
