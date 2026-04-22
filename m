Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B595A38838C
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845622; cv=pass; b=NPdnfMV81erqF0UPyNoXdc11qcyELaurxGM+hkD1hj+UuR6eqa/sq/vesURk5orJ1pXX25ehOut2Tt82tF9xwh+p5gjQt4ybKJksTkMpGEPahgEE0vei3IsgcKEMxgIZQ2vn4cZBi7CFlt14bQRT4QIzJHA2TXvnPOrAxD4uKSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845622; c=relaxed/simple;
	bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/cZBQydaPVOJu2M62iqFs+AA0glys5kT6aJ6d4Ef4UYJXgdz42yYUFfbv+iNOCrW0hvkWcqsEkfSXOwKn/Se51jkeLyNeyMr09MxFwax9q/B8CiD4BF58ydJ5S+mixUhgx/0gd1CNrP3RuAcdw+PbPCaoeBF3JAXGfFZRa/ZDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhdkYqdw; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhdkYqdw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so41209055e9.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776845617; cv=none;
        d=google.com; s=arc-20240605;
        b=JwL4NK3J8ptm01KL3xm7G+CwL1NuO3vHGfoynXF63A/V8s9UUX6Z8oGYB6sN5sH/ol
         B60QlWBCeXyQihRExNb+H14xVli1Y/dwNzuRXClFZ8wWivNJykCXCUNx4UZFCuwu/riQ
         nCpOKDwvhGXQoFOIZt99iCH8MgbrcZBN3zC7tQEM2m+WP6s7TH5zFFf01KC61Vlf1sYG
         BW7b3KKTWejcZGs2FyYipo3rhtU+sOu9auTg8i7L1vPf3UqZ7D7ZYBO6MIR+HKPqdy8A
         no8uaZjeLfXku1vUn49Ch5FMvTs/VzfbjYr+ErEVoHdWhXeu+Fe5oxylqTrVba6Be5V+
         WPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
        fh=PNqurpp9LvOQhOPlbCZLx8tBxskrzS2JzwFVtsQM3e8=;
        b=LYYZ/lAQ/SYFK/dvU2kFQSYPyJYxHU76aEdb6XaKmpEybT9yPZzgkBkeSNj6nIpym1
         l0E0W8nj0g8wVcm5hrQjr4dvvm9Rz+OpknbBXNYNeFgKUI2c7eh4SsKhfVcwUMVo7i5O
         OGzL3Hn/oItpjwgwqw0D3OtM4qkcchduRu48zcupvcbAVKohV0hFy4WtEyJo/bpP0Ab9
         5skcnkGv2Vng9gnLb5uqTxRK6qfYTwHOUdCCPUfV+qC+zleENm2yRw4u4EemPxWgBdNB
         eCJx3+bBPSxad/syKsKwhNLZB2yzNvGBqA/5/6Miz+RZ3BYU8p9WzopUbNAiDXyLvvWD
         XbSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776845617; x=1777450417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
        b=IhdkYqdwbGvyeUKZWE3AJJxXWaQIWiZtNGRyLt5NlcBIloJdXxD8kYLA7GZdIoH9up
         C0oQQDq/9kox5oSTmte5rc4G4dagdgNTOkDgt5e3vWCAjyqpKvyRrffd8OJvWL8EQeGi
         ul0MPHIM1OkA0TeBIVThsN5iudqfNW4UwhfwI8sqdWdUmGIHIwgK+OCu6LQVIFExTquO
         QbfQCshAAzgAzP8nhhIGFX3nOeUgtGOjrAidowi5ZrlgGxBBrPpQzuoD0vKW0egw4UO3
         mOfiYOMXoG28pf4oYR8jHDBpyGgaJiLJtNPo8kxj37A17RhsU4mnvA8oqmhC+jGDFces
         bDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845617; x=1777450417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
        b=bSvPaE7GMCPZqSashUjxc+7UZmC75cSqnEjGHdsXOw4yPjwlqy9AyMy93tdU7+Je/d
         HdmX6wiUeIX5UAJ9lNBZoAP0c0wTiNxvoNOTes9q0JpJXgG+GO98kWOfdHaCqeq8AATF
         NxP4cV6dBma/6VtLLbSspQpNGYbbJmnMC+zUW/vo8jeyROMNBhJELLzB8o+SUBztJFn1
         ATbboHpeqVV7zMf5V4Eh9xZ8uP98JFJp7Z30DkuS/MiGcG44VfhTQixzwGccQfY8MDyc
         bkFB8SuJFp4Wm40gaIWk0pRBKvIEskERNjZuoMNsusX5tDYnvj1vt+0wYyMJHEiNPKaB
         i9og==
X-Forwarded-Encrypted: i=1; AFNElJ/7LplR35qN/ZJbo/2UOICAKo+dV6Z8fmwqdW2vwy7xwDqfPAkBWX9rd0QPsBTsbRwae0dKcT3GzF/d@vger.kernel.org
X-Gm-Message-State: AOJu0YyM28RJmDplNNGNMgjaa5tWVb9jgZkHrhJcQ0/qtrSe5JpkpJCy
	NvfTAypMnlC2ypd/I56BcHR1kOg4CB92EjHLU4hPf3DkVICrGwJqmDqaL0+i4P+ZMqVSoGUQOS7
	7UxAd4N2O5Ws/Qtf5r0FL2uC5AQdJFAQ=
X-Gm-Gg: AeBDieuXe5+280Og3vWcZlH7hPIDwKR65JTycQclzLzxigrAYbtdaBpQ3A9IkiE4rkH
	dnPL4LVcoajSXm4d7VbBs6P3J6VaPwvzmlAwDtQzuczxvtjlhE2Ieq35qK/KyOLNNDAoi16r5kw
	qWkCEEBOH/lm+l09nQm9JE9mSzfJdLRpvl0Gb4qXIbMtkuUfyBsYNcRCytUHmuaAu/iHdMqP2Z+
	r5NItw6fRfRPpPDFirUqX0Rb5W2YeF8V6hAlmX9KhQrefcHr9CtxrAmpsz6fsBjev7wXEnsM3RX
	37Qhfwzb4Cbe36b3JS4=
X-Received: by 2002:a05:600c:c0cf:b0:489:1f3e:5f6f with SMTP id
 5b1f17b1804b1-4891f3e62a7mr115275205e9.12.1776845617219; Wed, 22 Apr 2026
 01:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain> <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
 <aefXJebe2F4Z193F@kekkonen.localdomain> <CAPVz0n111oHa2UdJ9LO8PTYcRuAmUem6tQdPKABRq1YHH8ZDgw@mail.gmail.com>
 <aeiAq_eep_fqwewN@kekkonen.localdomain>
In-Reply-To: <aeiAq_eep_fqwewN@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Apr 2026 11:13:25 +0300
X-Gm-Features: AQROBzBoeRBOPowp3OnCxGEpCKHgoXA68JG6VLytQ68roGoPnIj5MHCz_olxf0M
Message-ID: <CAPVz0n13wS1TnF_z-muwtnP0BK6FKiu4-6h5k6s6hm3p4i=0_w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 22 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:0=
2 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Wed, Apr 22, 2026 at 09:29:51AM +0300, Svyatoslav Ryhel wrote:
> > Noted. Any changes required into the other patches of the patchset?
>
> Please see my reply to the bindings.
>

I am closely monitoring all your replies, and I will apply everything
we have agreed on. I assume other patches from this patchset which you
did not leave comments need no adjustments?

> --
> Regards,
>
> Sakari Ailus
