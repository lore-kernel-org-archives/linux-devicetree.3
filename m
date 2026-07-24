Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E639377EA1
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909196; cv=pass; b=qOHx5w3RmEl55YC3rB9z3iL37YIDGk4KuwCKn6QrLHUa+xJ2XSbOst1P9tLS8At9CEGc525iXw+0gvkOpeJD6X7gqKLx6ENTRCmWveu0PLtJFDzLuRHKKFFHHZFdDRo48SdL/cgwSQcTN1GHU302r1sXQinSbMAemUFMvG/Lgqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909196; c=relaxed/simple;
	bh=1dBkWVsU5nHQtb3BqWAkQFOoST3tB7IFEaIZgopWRGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijHCTrFaQPw43A5eleYkvRU87d38gX5aStimzSGcOKtYmTcrF1Of+Inaj1JIUpICx7ZeCN2GsymiYMKGEgxIgbKPtPwtHDeVwI4QQgCsLDUQTaBuKofJ7BHma10ZhUD0+BvANnwcm4BDT4y611HFoTJ1M20PpORAlCwlpAqgdPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO2uouth; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO2uouth"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81e6f0b4610so4672577b3.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784909193; cv=none;
        d=google.com; s=arc-20260327;
        b=gHfc1peg+tcL65o713m3XXo0yotwB3SXDdhPQOXHg9CXM1kW2g2BUjFdXF7X8N9bCo
         SF2NISjZ2CvNMxvOFR38bO35H29SgAbHbcQ/hDzJdSmuN9nlPKjBSj/SIBK2ohABaVMh
         q4YPj5mM1bEpAgZX2CITdNAjwTUiu+OSjSOY8Ki1rMa5WDQY8UXfu3d8KM/vCcjxlnBM
         x3TkJ5nkR32nOwYtWvVAn+wcEB2ERNKNisp5PdLNwQITgQ1BEgoCUfyDSP+uEbuvvsI/
         ebszPF8yWjd38Y157psaqL0wVuvMty0IdnQuIYIXumkSD5hRj+14odU/GuYqpubfxNcI
         Imgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ew5N2TuKUsw5wpMVRlPG3PrZBjIkKWPJShY0hQYMAWU=;
        fh=DMmHBLGsXz22+TKBIgTSFt3EBCGkVsbJ9S+ItOW5v4A=;
        b=m00w/VkUEVbUufG54U1+PxX8IekeqsMDiWVp5dzFQ2ubcyjLPqtA0JNuK+4oJJm1NF
         nMuGSrhJ+NIE6dYPwlHT5bbYJq0cY1G91Z3r8pncwwHgpszVocoe9CQfhW3XVAnImuXB
         AruBMaSWd7ZWSki+ssvxHlbPjsl8GbVJ4GhWWkB4tyrOHEyh+AkPJiXcSLLfuwJuKHTr
         UsYEJW4KYNiUZvkkQmLPXZiVpzfKtkCLCimZMSip4B8i2pb2bfdpBwDVrti3EvavFnIC
         XQaI5512DOOJ6FM1RbiCPsfkX5ZPdMd7cCmfzvfTl6UQw+BQFkBdzZ0v5GQt9o48qz2B
         pVxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784909193; x=1785513993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ew5N2TuKUsw5wpMVRlPG3PrZBjIkKWPJShY0hQYMAWU=;
        b=OO2uouthDhLEjPKAJHic3XFqLdb9Kqi8PIanuTGzfZkZf/PbZXulPzmIz2wVXi6k/x
         srbjUlq2Gc2vylaHKLx/3Xwu02C5BakXDra9HjdmKaT2OvxQAzUvhNDRGqwh9QzPbVDe
         kVVSkUtnH3O+faTHFqskIkgqECZhe1/75Pb/cGM5wQu2USv3XsjwPsBcXs8pqM9kpWDh
         AQtE21RS4pnQA/G8hB/IuSYluvy9PqUQbSQdITKYb+lyW9jwsbTkwhIPzEd19Z+9m5bp
         zlWDgszp/jcPFZd4so/20xEecE5/I2lpEsJ6qm0UqX8mNd5YoM50xxT+kTtQAt/FAp2I
         4ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784909193; x=1785513993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ew5N2TuKUsw5wpMVRlPG3PrZBjIkKWPJShY0hQYMAWU=;
        b=GimkFQtWWoD18kosLU7/Di51Tis5Mwiee0QIPRAgyNzmZNnTmeQmlHnptvv4Tk7PZl
         BaEahw4qQZau7Uovcuj9d3W5A6IsRFelfQ7HALzJdDRIiE522VbU50M/r6dh5+lGYsn6
         puIizfCordk0ie8mUt3sd2wSPzg5NFy+fo0UwLBhRO9Iu8M8UT1BqS88TC7PbaEnZGaV
         RdH5uv5u4zhyKv9tU07OeVpERRK9oi97TJFFzzpr6PqZsWX35d3hCrbCF4NHQaZLliTk
         nLc8bbekuXW4m+IH7SX8vNPFaVgCvbaS1nvoW16AeAXjk7sAzH1lGmR77CgBnzLhykvI
         xSHg==
X-Gm-Message-State: AOJu0YxnodNzd0SZL8rKOT6y+ytNL/lKLhz+ux/xuSOvo8NNI7Rv2Yja
	dz1OJvA2+wM1LvdPXaTa6YuMvVxa3BnHbkxXDOzy9iLCKFxa2+wKlkpKFn3msoqbA6eYHhF1ojx
	y68Slm0hQhGcEx2U+Oav6Dz4/ludyZt0=
X-Gm-Gg: AR+sD12pIz1mUFGQyBVB4iIiw3fjmNXr5MNht/qu6iWNuPT8Fd+99M96s9G4fcnUeyN
	HPinWZRwGrFeNZ11BxxHBWmWfM+oVJYeRnAc98qiYYsc9eeokY5HZZoFa3n+N3kpI2FSFVOhJ9f
	Xe02oYDfq+3orK57sdxVeOqQC8clf+Q2iKukHJAUUVT87PGUINqtq2Hqwv2inG22G52q2hoHfda
	46ArCcxMdaYSTVZk9TDyqcBkugxJIBPG+UiXHGjATRUWQIUtZp0Z38nmw==
X-Received: by 2002:a05:690c:7403:b0:81e:8985:4046 with SMTP id
 00721157ae682-81f4c34faaemr23190557b3.53.1784909193265; Fri, 24 Jul 2026
 09:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721082410.18275-1-kaipeng94@gmail.com> <20260721082410.18275-3-kaipeng94@gmail.com>
 <aee1e26d-d3f7-4903-a34f-02fcda6a6beb@oss.qualcomm.com>
In-Reply-To: <aee1e26d-d3f7-4903-a34f-02fcda6a6beb@oss.qualcomm.com>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Sat, 25 Jul 2026 00:06:21 +0800
X-Gm-Features: AUfX_mzozQx6sr91XfGqke3GYXZuO5xcMO6Cbzc3XJrpc52p229Z8CNFI3YTA0s
Message-ID: <CAHk8ZduR9PxqM1-biv_6jAZ7cej-+JJpFHkjbSB3-Ba=-csKkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	konradybcio@kernel.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 6:22=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/21/26 10:24 AM, Kaipeng Zeng wrote:
> > Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
> > It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> > This device tree implementation references nodes from the x1-crd.dtsi.
> >
> > Supported features:
> >
> >  - Internal display & Brightness control
> >  - Keyboard & Touchpad
> >  - USB Type-C, Type-A
> >  - Wi-Fi & Bluetooth
> >  - ADSP & CDSP
> >  - Adreno X1-85 GPU
> >  - HDMI & USB Type-C display
> >  - Webcam
> >
> > Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
> > ---
>
> [...]
>
> > +             wcd-playback-dai-link {
> > +                     link-name =3D "WCD Playback";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6apmbedai RX_CODEC_DMA_R=
X_0>;
> > +                     };
> > +
> > +                     codec {
> > +                             sound-dai =3D <&wcd938x 0>, <&swr1 0>, <&=
lpass_rxmacro 0>;
> > +                     };
>
> 'co'dev < 'cp'u (other nodes have it correct), please also re-sort
> the -link {} nodes alphabetically
>
> [...]
>
> > +&iris {
> > +     firmware-name =3D "qcom/x1e80100/ACER/SFA14-11/qcvss8380.mbn";
> > +     status =3D "okay";
>
> Let's also keep a \n before 'status', file-wide
>
> [...]
>
>
> > +&mdss_dp1 {
> > +     ports {
> > +             /delete-node/ port@1;
> > +     };
>
> Hm?
>
> [...]
>
> > +     wcd_default: wcd-reset-n-active-state {
> > +             pins =3D "gpio191";
> > +             function =3D "gpio";
> > +             drive-strength =3D <16>;
> > +             bias-disable;
> > +             output-low;
>
> You don't need to specify output-foo on TLMM pins, the GPIO consumer
> will assert it as necessary

I noticed this before.
spkr_01_sd_n_active and spkr_23_sd_n_active (in lpass_tlmm) are also set to
output-low.

I tested that Gnome cannot detect either the speakers or the headphone usin=
g
the current DTS.
If I remove the "output-low" from wcd_default, Gnome can detect headphone
plug-in (not the speakers) and speakers will randomly output an audio pop n=
oise,
specifically when playback starts and stops.
I kept the "output-low" of them for safety.

Is it still proper to remove this "output-low"?
Should I also remove the "output-low" from spkr_*?

>
> Konrad
