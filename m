Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4345F34D91F
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787081160; cv=pass; b=Y3PllxNxo4V6LL5bFflCm5DPCzhNqZprdXVZ34Sh8skxw0f5mLe6XoeE86g+33RU3JPlMGikFIw9/sPxW7Q9hqpKY33GsKBWWlK5JiGiz4BpzRvVtCUU7Yj9V6N5Hdvmjk5Sdj1JSndM9V6BAbAsNsJ5SDFbLm3x2K4EBU9SzQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787081160; c=relaxed/simple;
	bh=cIIgdfvOLCmJHlf73CIXlFBeEaUWMa0+els2tooXNfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJ0XRp2ltRMewODLRVUqNvdmRBjnEoBdhkB60+xx/FcL29K1xiexdPoske59RwZhTTjMpYzUSzxK/Gd6etcr+EHCro98Bht3qzfnyuitgzUkxfgoZ1t7EMkU8CU7t080GiNjqAzZUdSTbAeVPh9Kwuozpxbb5Ahe/CUXKiZouqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivUMtKYC; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivUMtKYC"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b13496112cso215211eaf.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787081158; cv=none;
        d=google.com; s=arc-20260327;
        b=WHxbsLyWlCYr37UmeYKxbLoKnNgv94OcrISJN1/OAs32IzNtFF7nxPYbJtuNZ0xKGa
         2D8B5fY78wiQ9Q3lbFfUIaxKoTnt+JA/OGV+o0D/iXqE2iA1f8Hc0aiTRNodSSsdrxZt
         wNJGlb2fKSG2nmApjhlpKWhCwYQ9SiLbnkI/P/RIeYTjhEUR9RjPCWXn0q1l/MsowP4H
         +ng2iWlqFJjysKCTXq2OAygOWYQ81KsRzUe9vXo5wK00bM4ByQxrcuLsPcv4XW52mchT
         sshGYUEnnS1FBak/kCEWiQNbpiDm3biGKZS+qbn7fMA7x76UGMusg2u+xIr+GLOjX1m8
         5JsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q4R+heqJ1jW1B9R5mRMe5BfQRFgnqTQc8TRqWj0es9U=;
        fh=tSkjk7gvsJijC5mkHgLt17ClvNIv0tP5bl6XXeFuk6k=;
        b=lNusVmsa3m9dxNNFdre34DRmBO9uP/X9GYZnsoTZ20N9Bgz1f7E5GVZ23YcRoYtLe5
         vOc0lYdBXT8ekCGuCKq+F310fuHrA0urevmJvjKDpqgRKY8XYUgQy/ElwyeQs1h6A6fX
         rzWsq+at7AcheravXiPqJd/rNz8//qTqESLT2CQtjXIuLNYSeYdDDhk1VYt/YG6GNA8l
         IxvJW2UEfTi1jYAfnFw3H/GWRzsI2EQ1aUjUZVhRM3dmwkPtkU/IIgQIGVoun6JfIAhg
         HtK2xdn2cDbTio6ouo3NbAaBT+VG1mxNKSVpX9h3wk4LpBWD+XWIM4qm9wiWSyKTqO3Y
         0gzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787081158; x=1787685958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4R+heqJ1jW1B9R5mRMe5BfQRFgnqTQc8TRqWj0es9U=;
        b=ivUMtKYCefYkdoxvv+WAZrV/jtl3jtU00JXrYQ/8Y9KzD6Uy7OKKT8sv0zz2+r0h90
         UCiPDjaxbtrHgjd+sN31KRdtvBjgAoCnqvNZPBxTHikUeaHSMXyqR9GsXqJY1LUa+Oag
         2S7digPBaS3YDQVNCPOT3i9dNgOaKuXHFS19QFbgZWZvAqaCwEHG99U2sQRvM7dTxJqb
         TGxasnkQi7LQSStnR4AsXSiv9JE8Pp8PMUyJoUuSjK58jD6QOao8i51qHxNhgPHPeCew
         /VJpjwrgxRpbVOTaC48nsSa46js9czeDnMIMPHztEQAUXS4g9O+iodTmaBDnyG9Cew8W
         K08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787081158; x=1787685958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4R+heqJ1jW1B9R5mRMe5BfQRFgnqTQc8TRqWj0es9U=;
        b=sZ818eVsMkojmiADpBS+2zA+G4htJLva8IR/tROckKcIraX1P9iJ7q5gr1XzjwgXUT
         jBRxqfbofVtYJ/dDwcDd5j9BFI653sSjTBzBFOfhQHWEvjfy+O/B1k5W08nVYESqhEih
         0oriOcqW4XnUSbFWvg/tzrA/JxLHf345HmMIOG3YigI8aoWuJOkKFTANV1BJP20yGMDI
         bCM0TY/dKAuybQgB+NaEpPZpExNcNnEfduNHiBZzVBM3xpisuVAoIJUzWbXIYvlnej+b
         lom3TFNgj86m87OVueOzVo57MICHeiSWiQrnnstccHYTPHOl+xHc11rSpatxAoeKPB2b
         AFCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoN4Y+FUOs3JYDvOzi3D8CnwCawkadIpX8NrYm06+VFOLJG7LZze++lJJsijaYH1kSb01ig0nX2EhW5@vger.kernel.org
X-Gm-Message-State: AOJu0YxfYDsGBkWU+z8NRDbPEvf62VGqa5gitttsjjgN7YC1mIJEJpfr
	MDNQVCbHkJxCP9ywF6xBDXAh+ko8LeEPzDbD0h32KVnhPScW7dUk0l5UCsAvXgmRTl5GxK4jNbA
	HNwQ6HBrxBmLahkL2iMrOHJB5ZGF4Ejw=
X-Gm-Gg: AR+sD11rbg2rees8/rc3KqyQ4yiu0GT2/7Ch7ihGOuW925CTyBsjLNgjEbBJRiHpBx8
	nX656wLTiirWiTVqwjO0+B3e3zqNj9I32P8eM/h+631il+XHeKWUqXvQbsm2riVpDNIxaps5RDj
	Q3D/jMvKCn1A+K+G/nVP6yNLLbhWCqp/FbireLY3Y0eHIFttlYdDp8ucMLOUdA7HZZTjsa5Q9NJ
	oLO7GjsAf/2RH/V+JZiuTkNx1dsDBbNZMavS2xqbOb+Gx0gKkNvVzhdiU4fWyC7licjvKtAgLLr
	YHZCXsCtQiT+JW4ak7ddy6RsO8peBIJxqTJAH4I6rSdfDFWlQeZNqZau9tANZ3yZyTXGp+xtzsl
	kFFyuKnczoaBd4zQ=
X-Received: by 2002:a05:6820:1787:b0:6ae:9e00:c8ef with SMTP id
 006d021491bc7-6b11dd6581emr9168780eaf.14.1787081158039; Tue, 18 Aug 2026
 12:25:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
 <20260818080626.30430-5-amit.barzilai22@gmail.com> <aoQalR40NMFSg8zS@ashevche-desk.local>
In-Reply-To: <aoQalR40NMFSg8zS@ashevche-desk.local>
From: Amit Barzilai <amit.barzilai22@gmail.com>
Date: Tue, 18 Aug 2026 22:25:47 +0300
X-Gm-Features: AUfX_mxSHb-78EKn8JdKVlMLMgR765ctFD8-Qvs1aN8nzyH7_8okoURw2uODcNk
Message-ID: <CAOEgbEoMOR+WS7TzY5+k6G464uUdp+rHJqvhY+6gRE8nCaT=gQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] drm/ssd130x: Replace positional ssd130x_spi_id[]
 initialization with C99
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Piparo <holofermes@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:41=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> >  static const struct spi_device_id ssd130x_spi_id[] =3D {
> >       /* ssd130x family */
> > +     { .name =3D "sh1106", .driver_data =3D SH1106_ID },
>
> Hmm... Is the comment correct for sh1106?
>
> >       /* ssd132x family */
> >       /* ssd133x family */
>
> Overall, what do these comment bring us? Are those families have somethin=
g in
> common? Because the driver data is unique for each device, so I assume it=
's not
> that compatible inside even the same families.
>
> TL;DR: Perhaps simply drop those comments for once?

Agreed, I'll remove the comments in v5.

--=20
Thanks,
Amit
