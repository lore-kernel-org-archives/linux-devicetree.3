Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762098;
	b=v+6ooAuZ+2y+j5R8t/Db6/OtygjZCf6GkSY14FPqtsXcmb5WFmrAGGBKAeXt6CO5/tF2
	 V+A1beRGmAGfpc/KbeKsrJWaZy6VJ2PUtCAg1gfQWrLDvG+87Xmh5e0r8yyZYPwtPGbj/
	 Ck/MWHdAuOMH1DigT7VI6xF5VpBu+4eUEwkvVQCBZiYdjRwQcca6lakO7UtrYeDwZNjdt
	 Ff1wm1nQWwmaCQrXQ2qzgDYiW/IlzBIy0wmfcWnbFyIT64BNOTGXKGX80x/SbqsJYOws/
	 cDrr0kEh7JQWqZACXPQkrzBGXLszuBrh+XTf10BnpuAmFImjiCNsbWJVut8oWe+f80Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
	b=17rlj7WG3RxahulwdtDmKge38vOen49uzeCfjjwVQ6xVUFyfec7ku1NpenR0Ier/khE/
	 AU3aOE5bhaJomFNNU9tv5leJ858SX0wRNQA9KI0FkW4LnjixqgktdCvBsYuL0ifpJIeBj
	 o0WrOnzzrY2/PO4r9Ozg9BgLACqN99lIfRSYWkumrZvrT8NNEos1gZCx6VcClSwACUINM
	 6kqgPYGINXTKATrqcGdDTSl1YwPRdR+Ga9f7lbsl0O9u1TJLRbKUd2YSRHNdClJftiJ5o
	 Jq8Yd+x+u6xSbgw+z4YNTJ2291SoXgm9WU2XMknDZgnIm8Gcn2BxDxa8v32Aj3zKV2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0uPOeqg;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C52606A88C
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C52606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0uPOeqg
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491aaed7565so1157049f8f.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762096; x=1795366896; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
        b=P0uPOeqgL+Ozr22vFeYw8xScHK88O15rGxbv8FwzdKQ1nyYB9uluioHIEs1OU2SJDX
         vvoXbaXRN1/h7HX+g9bsRS9InHpDtO0bStHEJykILzxQH+E+BYPxq7BxULvnFiOMM6b/
         EACPMneJmTYOZDrPQawB75GstchrzjB4CU3VSMt9GanIAOcMyP561Om1k3txjjG5GoB8
         WTdnUFOS/SY9NKHS/xmwy56RdSUxsu5o0bl6cl8LFPm9qGyac0DCnxBMRsECx7BWIVbM
         c6HyNeKAJ8+3vOTKkuyYF0SQGRXFuLFGzc42HntptA0+5WA/jcs2/hTinq/wZ8yHuO0z
         JOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762096; x=1795366896;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
        b=jlsleHIdty52NEFjJUuRCM78ZpcYlNDxBErisLIqjtcS8ZmIt1gJhZAPS938ryw3Jh
         0qviMdrlC4hupgZEqpr2Cjil4Gss4DFa8XpCG8OXa+a9vepjNGi65SMlLQGQ20ZCHNLY
         G46YWZiM5UqFU9syxfnNDmXeS4ak3rusbMc1Ius0GZN9TTlzk2jE8XFshwvQO1I69wdS
         vWyHH9k90bHZfksgEJZ0dLkcwuS5jqRIFLd4NI7Vy63hAbZ8sp0bfr79Vnl8GuVkQAkV
         MQljdjsUkkO28JH4vxTTBCcXOLCzxC4dx6DeWtAMCoBJ32rFeYgeQ4xNzSIGgRy3P50x
         APBw==
X-Forwarded-Encrypted: i=1; AL+hErEy68sI+uMSVhs4rKDqnc1SlyZCYhk4n2dEv1VykJrbkvXFSyUelfhwOKZma/0ZAhE1g+jkCrrFR9Vd@vger.kernel.org
X-Gm-Message-State: APuU4Z/6UCqUuWomtKpdSlkQtAaNwVyoh8r9YCYpIuBn9T2/kr9geJ1C
	SP4I8tW5xPoGsbvqNgZESnsXaqcdJP1Iw0OfrRbl8LJEUbQ1lw0Amuv9
X-Gm-Gg: AYBFou0/mYBit6YMhYropoMp+gmyWYsuTBVboUDwLL9n1BFKCiyf5nv5yhkI81V0xDa
	k8h2TN47L6epjUZRDT3/fKf+4JUTfNmzsJYT/tCiRLI+xejaaL7jm10ommJULYn7E/AKgfAidwx
	+ZjnkJinNMe+mH/kQugF4AGSj3Ek4WuBAkwCsjXU1gZsta3EsX09Znzf4ZkB32JxSEwcnhugTTA
	ZJ6eLgtkMkc7S+LBYHIRMrj12TJBWVVz2+7aCebUGswwtxNWFHXiYQAxupaBrqTmHDJ5eY5a5AA
	5cCavw9ezjgECk3vIg87XYS3TYScOGAwL0rjn1Ej3ctykUI1nCcrrX6ZgUss/EZiPUrLD941/Uz
	uTRaJxC5eGE8p8SR7Vg9ZR4PJsofkLFquY0R0fveWxkVQNFAEWV7sdri+Kljv6u3oSCaVR77pvj
	RB+V4g9MMsfpbTLuKexvyzocrjLr+A8MCr0L3BDu69YS9/HUmteTbW0ocOzwnkCLByFJ4s+44R5
	8xYGTXicuuIji21MXDBbaSnhrmvFcl5jI7xPEyPpopiZ3nwg2rGuQjvNXS27rRDBhmkNJR/8UsC
	OJbKiEgwdVKPqWIwNIR4Vw+HUrxVPbFPxCVTIm2aeAedcMxNuYuG0DUhoS+e/xBdq7eONJ9HdWw
	eWpG55PaIC0Lq6tILOBD0sSOftHXIG+2LyqkR5XiITpqRnd7heCEmrLC3Oonypjn7zAGrWX8UVb
	zSSRDoackZJPU8KpRS7pYH1SFoDjVvrZHvvIwmteWbOxZSLzz195DM+eVFm4DzFsOuEQmH5whDy
	ZZATfEj3wBLTRC5ahPcEnhETQ==
X-Received: by 2002:a05:6000:4a1e:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-49c72ab0820mr17765285f8f.32.1794762095871;
        Sun, 15 Nov 2026 09:01:35 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm12650661f8f.50.2026.11.15.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:01:34 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency
 scaling
Date: Sun, 15 Nov 2026 18:01:33 +0100
Message-ID: <hUUAMPreQkqgr8nLJGKykw@gmail.com>
In-Reply-To:
 <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
References:
 <20261115132215.289236-1-jernej.skrabec@gmail.com>
 <20261115132215.289236-4-jernej.skrabec@gmail.com>
 <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 15. november 2026 ob 16:09:23 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Sun, Nov 15, 2026 at 9:22=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
> > so the CPU never scales its frequency. Add both, like on Orange Pi 3.
> > OPPs above the regulator constraints stay unused.
>=20
> My review agent noted that some of the other boards raised the constraints
> when CPU DVFS was enabled. Do you think it's reasonable to do the same
> for the OrangePi? Or do you want to be more conservative?

Yes, I'll prepare patches for raising constraints.

Best regards,
Jernej

>=20
> Note that I already applied this series.
>=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/ar=
ch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > index 40c5c42b347e..a2a2e4cb0256 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > @@ -5,6 +5,7 @@
> >  /dts-v1/;
> >
> >  #include "sun50i-h6.dtsi"
> > +#include "sun50i-h6-cpu-opp.dtsi"
> >  #include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > @@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
> >         };
> >  };
> >
> > +&cpu0 {
> > +       cpu-supply =3D <&reg_dcdca>;
> > +};
> > +
> >  &de {
> >         status =3D "okay";
> >  };
> > --
> > 2.43.0
> >
>=20




