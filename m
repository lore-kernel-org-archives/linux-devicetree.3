Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7593812EB
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784454848; cv=pass; b=ArxyanjGusI7mg6XlXgXVzOr1g2gd1Lt73qb3jyAmhmbHmuPxmtpCyMHjvHIPHVB9US3GHU0re0VEttLkrsxVX4neIyxtabWqDYylSYGdw8wJ2e7AXYV/AG7tA2BsbhpXoq6MOjG7Wmg2bzPbXU9k/8D8qevX5gj8hvqHyP+knA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784454848; c=relaxed/simple;
	bh=Dj0w+ljIvfyL0X8ARKA4zzlY3yd9IT7rYIdvJJ87vnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKzfq8/l1A++dkxXScarQNwldlJab2TxqmHUjZjstEjvBly/w0wjlZ6EcXVKnZYuKFs2s6JmBkX2EnMK8GFKQfxIEqq8zYr70v4g2QT7DnrSOMOgPrqJ3bp/6zVj7oOD+5ukWyarXWqsF3w9k4W1MeoUmTOMfUzEM14qWDAjNK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXaJVtTJ; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXaJVtTJ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81f08502c4bso239237b3.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784454846; cv=none;
        d=google.com; s=arc-20260327;
        b=k8nuobwIMBgTFKdj/LhqpRqP3GaMlrN4mIe/2Rvb8rJBObZyQHgYHlz2Xr1tpSX7jd
         e4O9rC26kRdP40ApADkBvbU2hGEugukrOqSTSPT5EH0Bo1O3K3JHQOItwAPpg/0GwDYz
         2TlkQNCOaGUV7Q8jWazPU2GwUn2lumFTEYQbOT8h3HPUCX/J2iTTDkjf4qUBIg1LawiP
         SfpaBFJX8VowdXfos1AQ5sUPRjzS1QWTWOJNFVSpTWz+Ot2bf6myRf3EZzYOv7R3k+NZ
         zsji1nTh/eKdz/6LICwblL505Dz8YA12zA/Hklw8OuCwB/pugtpDOPKuB31Hw3wHlBOM
         uPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xHGgD8K9zQ4es88RgHY8FFmbRbAWwqwav6HnZA/PD+k=;
        fh=VpLN3i+agL5y9B8V503nBnHy4KySK9iV/x5TQy/4F9E=;
        b=nF7amL2MVu9+JdXOKaO1FYIU671tE/WbqtaH6D1YxXiftrog46RBRiW+h097qPIsSb
         LG2VA0VBPUaVrz3wJ/GMnacxI6DmcDSq38qahPARramuVcN8sKBi+WF403X+busb9W2z
         5dP9A0KTbC2OyfhUwHoG21CO6q/AAGtGQPfSXh8q48zqXhMQrwntrTDxH+ngaqtz5wwq
         sIr+VFzz3pYn8Hhvtms+RI/uWVzJkLg29rKNKb/hJIyoIjurdMRbZuuvHduaghcuZ25d
         R+D0EG1Tg5kHsfYFS4wARlRdufnsuZ6HdP1NBzBOyKjEQQLGueA9u384uj9BWkITIsWd
         tPbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784454846; x=1785059646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xHGgD8K9zQ4es88RgHY8FFmbRbAWwqwav6HnZA/PD+k=;
        b=ZXaJVtTJIBFdH9heDSwQ/WYT1RRdz4tyKPW5/W/Kn7z06zoxSE0Gw1+QjKmKEEDp4l
         MnCfPn42chR6JKY56kaK4hIuzEo44xlxyC/Uh6ImNCoTuPpJJtrI8tejs4XoDB2lG2Yb
         H9JCGM/oZCK1VelcQbWf29qO/EEMs8MVssMmQxBWuRdvVJ+LWc7zDqt59iVcVxs0FDi0
         Jjwi30pr2DAAEj4Gi0a/tfvbjyeB5DdeCHd6g72wfxx95DXNIe2R24Y/AB83zpUfLBEd
         x6MeAuH7GjsVTHa5T7BYzIDQT4pEfxv4mF50SAG7Yemc+GKc5dJMc0yDbDUIohexDC1s
         ocYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784454846; x=1785059646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHGgD8K9zQ4es88RgHY8FFmbRbAWwqwav6HnZA/PD+k=;
        b=gqa5k9Nryg//QEODdx4Y87B0QZKdurTNpFj0OkbW/0O4/kqTbUpBG4R2S2UTi/Zpdv
         8wLdVBrDo7qd+GtclYizibLWsr3M19UtbqX9CruXXQ/qr4x80z6GsR0BqSIiGIvNxSTK
         oJEQzrU5x/AN08lEWs5+56bsbNsfpZ4dr29h+gqn3yrFqHLxK8/Q8toLkHgEoCxajZ2y
         /akuBl0Vta5RSgEUNbJp1LzMrdwyJwILPtlCuIlt8dI6E/jo8P4evnUTE7WT8dhQ1WgP
         hQMt/i4j4zEAdXH8jKsM+5FRn4XAZZB3uLZDMtoD26InvNiTg8yLWyi3G67XMsWxNKIw
         v53w==
X-Forwarded-Encrypted: i=1; AHgh+RrpzzoAIXx8a/y8OmuJkdySzNIBRwrNOPDhoJMPCdhAHVyvrxAHlQF85Srgi4+6NVE1CM890dFIwbiE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/Brf8hG94JVRVwdTflqkKm1O9niF2GmH9THZJ8YQLL4ZNRA3
	/nZpZYDgYVSRiqz42Zs21Ct4/7fbijyIJxD4eRQIWMLP3oLWxGap0OMCpKlLlxUXhmIKEiMOdXU
	Y+1jU4kt4t9+gURETV8eXaUdHIen3oFg=
X-Gm-Gg: AfdE7cmlxSL2xx92RtAsfrpb7uZ+Yw83vELxkyAS/MbVxcQDNJ7fBSkPw7MF6Nt1wa3
	gwc0YiWt5Su93LBpk7XJE4YScgVSQCgCCKHvkwHouKF4hyy+JUJbHRG2A15yfDa1rsL6It02eUZ
	pqWOcTEYIomAoKBRiNlGmL/H92Qb6pJ0qsjGLvoPiG9ZwjyxmbOm24I0tHZT8ZRA833sjqMCZ0x
	uxTrBfwh/DawAW8PdVBqmmP+nsoevl7wrxMpyRpekh+31k0F6bt3ekSKK6QxOiNSmZMXqzrqwm2
	3Gwu2bHq1hqfYRgLe2YR9qF6je++71c=
X-Received: by 2002:a05:690c:60c3:b0:80d:8bad:2ceb with SMTP id
 00721157ae682-81ef217a008mr32451757b3.0.1784454846106; Sun, 19 Jul 2026
 02:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-2-royalnet026@gmail.com>
 <20260719-sassy-muskrat-of-finesse-b426b0@quoll>
In-Reply-To: <20260719-sassy-muskrat-of-finesse-b426b0@quoll>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sun, 19 Jul 2026 11:53:54 +0200
X-Gm-Features: AUfX_mzrG1Pq4Zo417YCDgy1H34zh5K02k55OjzpmQP6GATHpyCvJf-ba4NVTOo
Message-ID: <CAEWPSH6aUOzxhweOdwi18LgtsUQhQEfJ0usWJvsC7WHF6XMQzA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks -- both done for v4: the schema now references
/schemas/sound/dai-common.yaml# with unevaluatedProperties: false, and
the consumer comment is dropped from the example.

I'll fold this into the v4 respin together with Sebastian's dts
comments, holding it for Dmitry's testing round on the driver side so
everything lands in one go.

Igor

On Sun, Jul 19, 2026 at 10:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Jul 18, 2026 at 10:57:25AM +0200, Igor Paunovic wrote:
>
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.ya=
ml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > index b7f6c87..fa6cd0d 100644
> > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > @@ -78,6 +78,13 @@ properties:
> >        The phandle of the syscon node for the Video Output GRF register
> >        to enable EDID transfer through SDAIN and SCLIN.
> >
> > +  "#sound-dai-cells":
> > +    const: 1
> > +    description:
> > +      The HDMI RX controller has two digital audio interfaces, one for
> > +      I2S and one for S/PDIF. The DAI cell selects the interface, 0 fo=
r
> > +      I2S and 1 for S/PDIF.
> > +
>
> Schema should also reference dai-common.yaml and use
> "unevaluatedProperties: false".
>
> >  required:
> >    - compatible
> >    - reg
> > @@ -129,4 +136,6 @@ examples:
> >        pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &h=
dmim1_rx_sda &hdmirx_5v_detection>;
> >        pinctrl-names =3D "default";
> >        hpd-gpios =3D <&gpio1 22 GPIO_ACTIVE_LOW>;
> > +      /* referenced by a sound card as <&hdmi_receiver 0> (0: I2S, 1: =
S/PDIF) */
>
> Drop comment, not needed. Consumer is not really relevant.
>
> Best regards,
> Krzysztof
>
