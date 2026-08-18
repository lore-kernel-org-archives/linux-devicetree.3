Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0F834DCD2
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787081166; cv=pass; b=isAj0UStTomuxHDRGKbTuTKZf5S1rwK+oT6XFlvsRg89tukConTQZiS3fKbGdr9RKLtxvVR9sRSxxrGgwpVoI2aVNQ0v4uW8p2pTPAyheannkRCVo9flxxyKnfveAxdHJZ9KwouT/8f39O+YzAPxSo/z+FJpFYkxnb+g0q1jksQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787081166; c=relaxed/simple;
	bh=xD+DTq3vAUF/JATmwOhJZ4DPUbk6IOr1mBsW453i8Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RC1ZL/qqWvOvb8quFJHw2kgBh0PURyp5IN7rjFHLD/RvknCmxFjX3Spp2adIROXVSanAM0LG2kugEbsSCHo605jJjyY2nZsQsbFAvDeJJ1zPFNrMkj/cx92mjSeC5dhSgwylL3jLlS7mQGjcd+0UPEaQgCc9jeVNtqQTptvXmqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZB+r/Pw/; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZB+r/Pw/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fde295992so88827f8f.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787081163; cv=none;
        d=google.com; s=arc-20260327;
        b=oONPaMGhI6EtYfbncY6YFNoiKl+JMedqDjmaYkTa/+6sKTG5a+fsqClHO5R4iMUJ7F
         3+95RsA39rc07wW5OAXedC+3iUwWSwFTc8KD0rr92ISot4pdtG/jlg8RA8LWumhLm+vT
         AJdRSFBj9rWAQYCUthFucYSNUBAmsL448c9uKf+/Tb+qT4ycNY46uhSv2dcF6lYdMEl6
         M6/KWIo/HsndEpZbARFkO3lm5dLz9Q4dlbNVd9Vs6l8jX3J2PB1kPiJGoeMMIJI9VJd2
         G6qE75jtHLMzU/3aloxRkwohJGTSdrQgl5GZjeOISp7mW5M+KwEKeb/R7UFFKmRcNerb
         Dp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=si7KMVjebKUIdClbZKZkuqtNOVYTxZqvVqmzIewFdCU=;
        fh=0VSrUe1UW4he4CckdqV/LmEiEQk929oxULUYMQ4oeUo=;
        b=Hb9Z96OJukGt3bmpWmuc237cTzk7qyLotbSHzUjw/aUqr2evyXgbq8qGqDigjDPiad
         IFD9zZi3bkDyoZ+02FWqY3m1Iob7FcEQR/K4OSKRxQcOCebbUUZRK3WoZ1fKGD8zknp+
         elfz68l3dSbYPo+Bji0Y7Mpg4mhiVtlH1HIWxhIaeU2tbScNH8ajN/n4lyODKLmjV0ao
         wZP4A0qtHyXSC8qANG6qrxCX6IwZNdvi3DzimtqG2rxcZmn/9C0ewRbnF6cV8CG1zulQ
         k20yJF0zl8PnWFaYsjEZpt0PaAqdxg09thNhkTDJnR5AnaFgY/I/BUWNg4LkKmvReJ0e
         Ip5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787081163; x=1787685963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=si7KMVjebKUIdClbZKZkuqtNOVYTxZqvVqmzIewFdCU=;
        b=ZB+r/Pw/UkVy8Jj9GPs7DrWnXh15rWQNW/Iz7wlrQawJf4W30/1ZgwDvWVdzylKS4s
         9z5ocxBfC2JnxpiRnxZvGTE6khJb7RpOBsmeUtwVU3EVd39qvqOaIYxoxas5FIVfhRWF
         kpoWfjMkHMlTjgcYx0WqaryOIdiUmMaiMIvyLKDnPEdJAiZGwdo+NZ0drN7Fk8u0Foo2
         7CR46I6R4SO4EskWjMaJsrxReIDQXclpqjVViHEND2QEN+MGyXyPwDpYqRh6op0dtVtQ
         ixwZusHXnILXKOCjZY2JUurhUFC8JbDiDjpbko7yH2dKRF8W+jJ8iLQZHjuEqLq0/Dre
         IE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787081163; x=1787685963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=si7KMVjebKUIdClbZKZkuqtNOVYTxZqvVqmzIewFdCU=;
        b=m/kzA1lA3im3kqUuNuXdDM09ATyZaE1JuTOOWgZdyglX/CCL7eh1idXNw+ISnOioHK
         TVYlFYVvEMU+Rk6cOlLyFrVzZ5QKh18n4KUIbq89SWZkCmZ9LO9VkdMMHEd1pnOdbScg
         NcMmFFOKMYeBua6UKCHeAOPevhwW1hyZioJ2WlUJ5GjhxgOLhxzGPXyosalMcN7grpuo
         KG0uVD676GQ3FBhDCS9qHjxXK/+g7b959x2S6Vfi5HXZ1r7VB/ykZt8HDJNAoR+Tbuun
         1DkrL/DTeEVcB+Pl3mbjRuIS5RsRm0IfVBQpCiFGarsvNvwOyJC0tlVFe0lbgorfhOwp
         FpVA==
X-Forwarded-Encrypted: i=1; AHgh+RoXm6Yt00zNzeodTEZ4xQ3jYCw7kmhHlzvR2CPTf+kDkbpSrn/iY91Sp/XIkt2kYp6l7kuGmIvuoBUr@vger.kernel.org
X-Gm-Message-State: AOJu0YwKu5y+Urn08La17D7TUgEzaSMUjeOEdeAB7KXsf9dxC7F/LkD3
	5MdTtxkD2vrIy/mFTCb7EwWyPJXS9c7ccpW56HYnt2phe/CL1cR8/I6l3u7qDwDmLp9Fz2cqfON
	fy7BiHSlE+nOJkvqlcmDwgBGcx1zL5Vw=
X-Gm-Gg: AR+sD11bhhR1bXRAHMAfztX4/sCs1SjEiiE7K4khxmRo/S4EUt3gldYZhZZ1SMiIbD0
	HZh8VFEzdP1ukj+jGshcZAPeFjJEkXmb/rM5kmWnC1xVWqFF82LSQQLuwZ9y6/oPRs3nU2NZLvg
	OgkCy9rBjcxFtD/bJD4jOezbEVGOgZc2vLjCvBLqmU71sOzpWGJVkUhTYcyR6jN69qbMjMuYIwb
	X9EbQUVTdjh+UkF1cWv3etjrSqe89oddcjv4bzXy84xse7iu6w8cyVizxeTzy6GXM0xEbpjiDZH
	Uu5AhR4JIL/5c6cuP0XIkYTQU3qmxdMjeEPOWvAINFsHCVqa7UWUd3E/5zsRX46miYOcQteoPFE
	E04h/BV7LduYkCTNVt6jHzRKaZxXJcgN0SK62TN9pEmwWet+ErTKhgOW760HI5Y0=
X-Received: by 2002:adf:e50c:0:b0:482:a9a4:91e7 with SMTP id
 ffacd0b85a97d-482a9ede2f3mr11527757f8f.15.1787081163046; Tue, 18 Aug 2026
 12:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706180331.3AD811F000E9@smtp.kernel.org> <aoRB8CrV7ECOG33Y@ninjato>
In-Reply-To: <aoRB8CrV7ECOG33Y@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Aug 2026 20:25:34 +0100
X-Gm-Features: AcwNN1XvqpNfeUIyYJ22liaTzQ5Arj1acbogU-h1r2Q7CoLl1dfoF0q-qvhOhnA
Message-ID: <CA+V-a8tJAStSKfsESoEE8vUjgnR+P1yKeYKTnpN43+=MtgbCBw@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and
 RZ/N2H SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, linux-rtc@vger.kernel.org, 
	robh@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Tue, Aug 18, 2026 at 12:28=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Should we add match data to this compatible string to identify the vari=
ant
> > and explicitly reject probe with -EOPNOTSUPP if the clock configuration
> > would require the unsupported SUBU mode?
>
> Correct. Matches also my notes which say that this code
>
> 445                 if (rate !=3D 32768)
> 446                         scmp_val =3D RZN1_RTC_CTL0_SLSB_SCMP;
>
> is wrong when we have a variant which has no SUBU support. Because in
> that case, we need to enable SCMP even for 32768Hz.
>
> So, yes, it is needed to mark which variant has SUBU (RZ/N1 only, likely
> forever) and bail out if no SUBU and no 'xtal'. The above code needs to
> check SUBU support, too.
>
Ok I will introduce OF data to handle this.

struct rzn1_rtc_data {
        bool has_subu;
};

Cheers,
Prabhakar
