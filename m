Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523683F9F22
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774457122; cv=pass; b=lWD8rA4yIf1lwZb++62/f/t16p/zRESkY3HU0tkhBusBrOVIN70Z4AXMnL3dz/3YKJDeiGXvmwF2vFEc58XgzAF5rI4Mi589AJ8iBu07eGJv/uHBC1335dgiU6nBhAloC+HtlPeCiJr4o8TIXL3FY+ZNRBu3q2G8ne1CWNdVCIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774457122; c=relaxed/simple;
	bh=bXhKFbpYfRsNRVt7ICqpN4QU6L2WdsLw2xe7XFRwToc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAlgDYhBrKgrRZOWenh2KCjhXtkrlh6jVxFacu4HDEzQz9akUdakv0IkEPH/tomPgKr19C4t4wH95JuDzErm5uAwkL8LEqfgeR8EkfttA/AQbzQ5dqURhrCFZCUpfq0MGLnabXC1KZKlaxcG5WmttUbOwmsIfxFoEqru6Zaz72E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgWQ9VuR; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgWQ9VuR"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a1443780c4so1049745e87.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774457117; cv=none;
        d=google.com; s=arc-20240605;
        b=gaeD+Cg3TQzPBesjrO8nUZy/iVULi5u0H4a6ziQfrk7IbtHV2gXVChnYCfxvxWB9+O
         LQpq+DmQ6MAw2FTXNzBIKbPsKzXc901eyf49iwd9+6gjeLFdRCbNl2CAJkxka/BrVB4i
         U1mSQEpfm60zvd/NIysZrx16PFDOTwMSwI2xKISsm1XswWCGz5nXY+VK2r4XvxXSd3x3
         FpGAB8uSBfaqdq/THbMXae2HI18kTojIQR+YTxOmwZ5jaOlgSuOHTPGamWxMNZ8+46sC
         Hv2/jOilN4rUJlnmUfMWJQqH3YH+v3LoRTPed0nT/X80nuU++Pe9A9Sa7Nh+05LjO/Mh
         Gbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w8/VbjDDHOiMARELyvArbMNY9dfsY5Wb54POTD3vDT0=;
        fh=LlYr/yvmxScjbmuTlcWnS5RVhFC4iQYGISBq6sANDmo=;
        b=dE/crpO9w57w6oW1/0hVTAJkGYN5ZrcmzlGr0kzzcCoKzM45DWq75KZhzVI0D8RMUM
         CGmaNY1ruFROM80QTeid830Oozdcwoo8jS91MjsFWAFp4F+6Mchm+I0NVtYkLwviCs6M
         mOzyzQG5sBcfzFYbke6BmykLMi0Amg8dGd2UlqT9l923M/z/NJ6+niyZZZkHbm0BmPbQ
         RN2cUsXHA7hrZVfb+YY80UCfmEj2ZxhzjK3bZguY7mA659WpDDTCB4th6d3PnPt661GL
         U9AJKKRa7ZqbCKoMq4QWaWbY9/s2uxMG1wwh45Jo0eGVzmiClEaIxE5SFRxOzZTb6nwI
         PnLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774457117; x=1775061917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8/VbjDDHOiMARELyvArbMNY9dfsY5Wb54POTD3vDT0=;
        b=WgWQ9VuREa7upRa+nBSxON9eFeSA52ulmspoKkrM4Hw1FVPiC6LFrqqxG43RM8pkp6
         gVG6qbdvJAOMS0dZzV1e1yYktwDb05lyvjFGIae87+HYtgyXxBRbxWyfNbq+hZ4OWwwM
         heEqg5hXbN+dc+14eZWKmsK2BDAnhzktREGmktmhH5DDoUAX2fw8qSfGxSmlSvayFhnb
         dt/eBlNazlei6jnwmA9V+ompi5EKSnzltjOvfsQXek+ZDyoxHIf4GQ3tm2NyxLIB84kA
         jFvWsetX9rV9bICFgZFrSHeafP1xwH+vVfaPjnCNscy93FkLgJek879fgnfrd6bMUuOS
         toGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774457117; x=1775061917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8/VbjDDHOiMARELyvArbMNY9dfsY5Wb54POTD3vDT0=;
        b=RsrzaraQBasqVYHeBwRwFgpX/YFW2eDYylJaySAvW+IdNyL3nlblx4Suiyh+3yH51K
         HsoHKIUPQrfeze34ile0b1+YO9B7UpGamChQDx2hFU88M7lT7WSFcD+xyepYfT0b0/4l
         MNJHaWYYxz+Z5hmcodbaVwmtI3e7SvV0orzpzenbOHx3aArAT+sE0gW1BQw45FhX/w8T
         PYRWm1ZlgdP7TCTDspIVE1TD4tk9DWAMGQEktp7lOTtGUbuLq6okINFShZOuo++/4HY0
         8p8qRSh1k1z/9AOSjAjldlnexGyrkqL4pQ1YfdNVdyiHJz7uxeybQVNu2sj9mJeovi2N
         N6/w==
X-Forwarded-Encrypted: i=1; AJvYcCWUlaPfO2tJWdgJR0K+UE3Ta+EKcvcWCLTKgh8brvahAnhV4EjI7FpkQC35OV711SFYCm8LLu0y0JtH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm6AqB2jBT58uVJpNjNSLoVqZprOcqaBzx0NeTaRk996O7IKjn
	+xHMK4IwiykBkrW+LrU+1yEtbbS1wee79uylFDi5fcFZU2qWb9iUh/Hm6E1IIRdi9rNz/5CbG7J
	CKACC5YNBTwmJ9iyeBC0XBSQBtD9BymWKvQ==
X-Gm-Gg: ATEYQzy/AwlEAra7xvmJ5F/yGAzYWk2syAwNABKWAjZ2fcKU3mBFfVH/7PJle+c8lC4
	zjk7ijkJ6vozIv9rU4N0hbIkXvUb5OCsuZu0LnjdHs2s1B6FdI14YWI3429+2U8hH9MtqtzNkM4
	jaPlVGUguSO823kxEeeLDNPzgjfSerijIVzW0vqVLQCvbgYq++hqx7lo6z/T8yJlwJ8T7QK2NcF
	1CyelVVWWjg/w2npoEh3wPv/AhAokgvDtq7zFHlR3ThyTjSpL3W6ZZfX+OtQWMwYntXm+2HszLB
	mlNMeQdMgL8Uty3HjzaebR3v+41mE6WX7SXUm926ZbrZH5hKqMY8D6paomECH9Vz13O3
X-Received: by 2002:a05:6512:3d29:b0:5a2:7b8b:8a80 with SMTP id
 2adb3069b0e04-5a29b4ef8a9mr1784091e87.3.1774457116829; Wed, 25 Mar 2026
 09:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-6-33a8ac3d53fa@gmail.com> <919a157e-84cd-4588-8557-64542fd08e7e@oss.qualcomm.com>
In-Reply-To: <919a157e-84cd-4588-8557-64542fd08e7e@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 25 Mar 2026 11:45:05 -0500
X-Gm-Features: AaiRm53bjqDbFTUcGFnKfbzKfzKSDPwXT1T1vWRH26ZyUIlh2rF-Fh8Y6mZcsr0
Message-ID: <CALHNRZ8xX8BVKHFkHXhB9AWXAi0KfWoJmBEa_STznUnOZKiK4A@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Add AYN Thor
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 6:09=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > The AYN Thor is a high-performance Android-based handheld gaming consol=
e
> > powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> > AMOLED touchscreens.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> [...]
>
> > +&{/} {
> > +     model =3D "AYN Thor";
> > +     compatible =3D "ayntec,thor", "qcom,qcs8550", "qcom,sm8550";
> > +
> > +     gpio-keys {
>
> Please override gpio-keys from common by label reference

Ack

> [...]
>
> > +&mdss_dsi0_phy {
> > +     vdds-supply =3D <&vreg_l1e_0p88>;
> > +     status =3D "okay";
>
> nit: Please uniformly keep a \n before status

Ack. Tried to get all of these last revision, but looks like I missed one.

> > +};
> > +
> > +&mdss_dsi1_out {
> > +     qcom,te-source =3D "mdp_vsync_s";
> > +};
> > +
> > +&pm8550_pwm {
> > +     multi-led {
> > +             status =3D "disabled";
> > +     };
>
> Please override the multi-led node by label directly

Ack.

Aaron
