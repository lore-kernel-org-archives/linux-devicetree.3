Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165DC4FECF8
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785605; cv=pass; b=ix7SenLPBeJRLecQHA2XSffFZgBPbfd3gDtpWReghC3uyItHu03R3AH1//cyGRfmdpevqZy8qpR39x5uXShyNNVP4AMq4z9EBQLgXDVI2LeDEKHSIQ0QnjzcqAU8jh3ixEOVjfKrbwDj2UsUTr8irgjromZFwjqSd/88bn6nYwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785605; c=relaxed/simple;
	bh=WK/XpWKPIWOEnWF+g+kKFp9YCg+P+PyUPeF7SMSzQdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbLeJrA48wa2cbzkdDWx7/fV34CdIghCdl+nwDodN6j/T2tY+HPY45BDVEs0432UI2x0LyBS0HBaJa+3+MWiptZw8xbieINP3+/FVDrjfX9l/PhXqFMRQFU9bN4ZkxZafYO+RMug/qWikKDE6RBJSOXosQBEnJiB/EzNmAR+/qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhyXr3yw; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhyXr3yw"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a860e532eeso52483397b3.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785592; cv=none;
        d=google.com; s=arc-20260327;
        b=WqtPptLkMK3Zny2AaQ9TPtXBk020IGpQKaN6+4J1y0R82Fl6nk/fq5QFAFpjwq7CZi
         bdzo5Z4febj8e34xnEPSwEbOk2Kt+HyqQfatn+9ZM1kGR92UGto5yMVJDiT1KKLAouwg
         Q811j6UahN8syG0mEBgPkhDePw2CqIv6xBxN2h//Bt0mw8aMN/RiBOkzJ3USVgSUa1CP
         KDjdgtX6+ikdUwSxQIwkekHTHBbSc+AjzpXw0JxiYwz6dTR2irsSBjl8ENx+wrH08A9v
         5TsrrueQn+c8ZqwJrJuxe6fongy6SHvsi70Xtv+5VDW1O8t/EOJz0/tH7VwYyYGmCpqJ
         o2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhetewjBy/ZOEbYKEMiflEbYSnDNrXKR9ujhYIYqZ9Q=;
        fh=Yz7yURudACPt6oNtY0GGhe5C/9zYdafXIRpzYP4zHps=;
        b=lafwpsVT/vUBg0qd4LyuXqRwmVcrIebZpTn5f0Zy8GGYCWZOQOi0MC9zxcNIJIw+yk
         zKJKNJD85T9ngvkKmkxk0fT+Y5+e4Fhsc/Qgs45FA5LBwaSDfBU55k1UQFWh1q3aYrf0
         Qup8YfR64m9+6Pvt91K58AndvJZOLBqIKb8TwGuuragtoz0i8ieNU8ssOFDnH1INjuIc
         Gq1STJoMUSmp00r3hMxxXBLhthpLNGl/DW5slaieOVtSgWmnH+HnHMKJDigIzQY9h5AW
         PYLUp/PIP5bfdKuTvxs8VXjWzuu4z92xPUxwsYcnp8ietrW9hcvXAX3JPGBQVyVv5gl7
         rYUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790785592; x=1791390392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IhetewjBy/ZOEbYKEMiflEbYSnDNrXKR9ujhYIYqZ9Q=;
        b=ZhyXr3yw98Rkn00AbBd+D7MOSoewuPpH0kd6CtJU/EoO5pRm6gY9oCO1yePWqVz5ot
         gO8UhHkm3nh1Pn8OMQkQPWFUpDPCwfSe4LZ7hgWlpxDFDRr11RtEYcz5FWmdP2wcMRNP
         wxr+3+6c72g8BDjFhewiz1VxxIxofV7Rt/A4STV9SWFTA2MdCaPvUiqNLM16mWKXyf11
         62i5FfpBHZu7gnW5FRZNwnHES1gbpU6ZmIJ94FgsRjzJ8KMT0A0A/3JrR1e3Vtfzm80/
         kW2TL3No5jON6hHxU3M+KEJVSDshDO2kqT7zG51IW2ARvjWrP8oDXbmON0HrkJKEwcAO
         0+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785592; x=1791390392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhetewjBy/ZOEbYKEMiflEbYSnDNrXKR9ujhYIYqZ9Q=;
        b=Aryepm4P7P84ZY7ymKz2veetKjjwtLsqdCm+mA94raSYpFMbXFwtYa6R6RIDvGqH/2
         gBrnqOzDo90nf4u3JXT6x4bEnJunOJpXiCgWR3RUMUG5isEzw2S7q9t8DGuFzp4ltqFS
         Im3y1YKONVMeeWsA+iG0to0RdYD3+mXgDz5oze+gmOuJZDJDHXDbbwATE6k54B7fcJd9
         0KDscUymEQe8zZdrQpzz/JRki3Ap2mvwJ+XkNMfg4ZZyjYVyhdFff2ZvnMUtZvnzGSdV
         K6eAnX1OiHhv76pvMYI27UWGWLLZHqHFRXADMxUQ+Tw2taVUdExnCqTpPh8Ou79HQ9TO
         JXxg==
X-Forwarded-Encrypted: i=1; AKwUvBxCshcBPnPt6ObF5P+SuFLRHKHYR/s5uC9kZG5UsZtiiSlmU75XX54I0FXwlLip9XxUsitdWTKu3cl9@vger.kernel.org
X-Gm-Message-State: AFq9FYIoCocHqF4vkMXPyNfR158dJW+K0AfLwRbuI7kA3RpHadc3iaJe
	2vgK0+j0roYUf9xpUnvh+25DPK+jrphx5dcHAl8GIw7/CxKvuWGd/9W78MYdyS/TGQavXB8d+aA
	1KQLUUTHEvbjX+c7KBJAw7/lnZOlzYjj/KofTuLm0Ew==
X-Gm-Gg: AYBFou2eigXErRuq4rogEoyp0XG5P9WkZWc8uEWiujckQ4WTAGgzsedzEcG0+2xSZQ7
	LG2PO9Y2/N0IkMYQHlegEAlbbdK7q3AsDupRp1utXe/P+y/7FmmwE6xFBq6YjxfHcAAsmtPMLng
	GlRN1T9GJVBPzv6gZtc/ahEfbAvZAzSLZP8bFKUo9d7Adb3763sRV4jaoyrS2AgexQyssPgu1u6
	ykcXMt3fdF4Uxk9ldCCNdG++B18ZpSoLoSGNS751RiMo3+Kod4aprmpRhswNClalG4yfpzBHc1R
	KQmjQSm2Fgy/uAzvu0/JE+w5M1WCsEOMED1OmIlOPyoktdDF0+pxj4jwmxZFy/e9
X-Received: by 2002:a05:690c:e205:10b0:8a8:8945:c3ce with SMTP id
 00721157ae682-8ac92d31f55mr6394247b3.63.1790785591578; Wed, 30 Sep 2026
 09:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll> <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org> <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
In-Reply-To: <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 1 Oct 2026 00:26:19 +0800
X-Gm-Features: AclHuK8qxVxvhel2lglijF9Rc5ozZymwHXuo3kOm52fjKYrNUnWjF5DWZXE12Tg
Message-ID: <CABymUCP0Wk+wogyj=8CJJ5qrGtw6qe_FihB5vuSxBc1wVd37sA@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel support
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus Walleij <linusw@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=B8=89 15:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Sep 29, 2026 at 3:35=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
>
> > This entire binding seems like stitching two devices together, which
> > might be fine (I don't even remember this stuff... two months old) or
> > might be artificial grouping of separate devices.
>
> I think that's a good point and fair pushback.
>
> Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> https://www.youtube.com/watch?v=3D6tNGW8PoSzw
>
> The current binding does not reflect the physical topology of the
> actual device, and the bindings need improvements. I have a feeling
> there is one display controller with two physical panels.

Sorry to confuse you. There are 2 r63455 DSI controllers for 2 physical
panels. This patch set aims to hide 2 set of DSI host/device and
associated backlight/power/reset handling in a single panel driver. So
that it is much simpler for DRM CRTC/connector and compositor to
handle 2 physical panels, just as they handle a single panel. No change
is expected at all.

>
> In that case I think it's better if we do:
>
> panel: panel@0 {
>     /* This is the two-panel package with one display controller */
>     compatible =3D "sharp,ls026b3sa06", "synaptics,r63455";
>     reg =3D <0>;
>     #address-cells =3D <1>;
>     #size-cells =3D <0>;
>
>     panel@0 {
>         reset-gpios =3D <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>;
>         reg =3D <0>;
>          ....
>     };
>
>     panel@1 {
>         reset-gpios =3D <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
>         reg =3D <1>;
>         ....
>     };
>
> ...
> };
>
>
> Yours,
> Linus Walleij
