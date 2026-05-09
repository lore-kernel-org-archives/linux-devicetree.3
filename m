Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E0D38552C
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778363501; cv=pass; b=Jio3kqbCXPVtvi2P3tAwOjLoV7nCYh6y7rvtBXpDeD181VLgvg3YEMAgYhOJPsibYUL96xoD7oJMFydtQqvFJj2K28ZVDxEiQIsLwn7sFDaY0jOgGu30v5zU+QTFLaUljlVEyR0j8mCkWAsCA9765dCjD3E2o2VeCZFV+9qDk0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778363501; c=relaxed/simple;
	bh=HTgJnIspA8SL0/LOnXAdd7GWGGxEkz8RxcVZRJZYOu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1XL3b+W696H5xUkqI3YBccYOKs2Xb6BFZmsLxHM34JW7tHWPWF7d0D/M5Fl5vbbIulOohSyU3WWdACEPoIShJnM8uRWjkSvPkW50n0lio9z7qrnRPNLS3AfhXfmEyLHNY75ZOzWUDRDVmMEegAzJRpi0vzVtrnXlpIRTuqtdHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1y9BcwG; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1y9BcwG"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso2681762e87.3
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 14:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778363497; cv=none;
        d=google.com; s=arc-20240605;
        b=VtwH2jXXb1BtvLZTKe8aZFvbyKbcE4ztiEQB8IYesKpzTnYiubjpcTJjoNUs1VoE5l
         N8M7o63U9Zhi9yHXtVYg2B5k5CbEfV+q5yRiWF33kVsbOGc0wCBbTVicFsvE1RnztBg3
         dgwwIUHAr40E37HuK9gb7s52ZGeujBSyMNEflFi+AQr7rmfT8NOcAo9Xm4Y6adbrqpHF
         hOYu2+w+jD2T8aZHn8MuRO40mZdB0tnU90q7D0jyJ9dhH/B0zb2S4tVvurK0Y1bn2HhH
         2V34bY+HJ8w1JIsl77zkHDJUU1ft+NzKtuftxNZLb7a7qRcWAUYC9+aPSXOlP08zzJge
         hc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pmoJ0zncVztoEGB5Fyotot3fMyh3LTsXg1G4a/N+lFk=;
        fh=RZbAzXznDeLYMcCxcFSs+8HPBRBJdJwyO7buO1VyKvw=;
        b=dlEDHIcmCg7eY6crTjrlJlEx5CtpLTNL9oiCmSCryxJiu2jlMQu4oQYDELI+PT/6ru
         2Gygjlqsy0O64epJiMLviWlgQpDT6GgUmetxOMTd8pDWET7fvfg0lOnxO2zSduSxQTHa
         XWvBEsa91mBo1T6/w6N7mHBnTosaejnOvOdPiyXL7x7GU1o/a75dH5DHrvKyIAJdjX6x
         MFRf1jrXyxJ38PD4yzgp+GXrqjhAaMwZ8iKH3naF5jrv+QTzzCv5mU9pi2/u0WEkZhZy
         KBNESYL71AP46NBJLXPIDEPF4mb7h4/VRVvUEiLMzQ+dofVwRmXL1LPh1Rbq/2G8oRZA
         HGCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778363497; x=1778968297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmoJ0zncVztoEGB5Fyotot3fMyh3LTsXg1G4a/N+lFk=;
        b=P1y9BcwGWH/tq/F58NuP4HNhkLlNP5eEjLEfzAjKA8H5sX92dxGTPbPWkt7V0hMGdf
         ZSe+FIjhqhBuQ16Esxa+op8e+FJKIlhshgGueo4RrRnK1/8aPG0/9kIEpr0rTqYxMO2p
         XLmPA8RPl0LBpnKXNHnNDM4KrpxgMbU/u466zIrNz1wxGAdUKeLDTJDxLmqvvb8HqQUw
         /nw4mwIFi6F9VPmIxIQTjjqBR4DCeORNo3EO8dpDEX+lNBRYd4KeC/Bxa/eYTCmzPNG0
         h1sA4BmiYEI8rkBl5GLLsPB5lN+hAgD+rMOF/3/n1T5Dr1AaCsz4gzry9vu+vwwT+62c
         Rfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778363497; x=1778968297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmoJ0zncVztoEGB5Fyotot3fMyh3LTsXg1G4a/N+lFk=;
        b=DlillYSjjrRQcMIXbI1w7GIpCaX4B9fRbraRngA1wEgVR6cdGkcNxwWS5BtsIOXt/o
         3WuMwpIdWNRpTG5upkfJtbjxFRkEgF//0smzuoeVvNIrureLGJBojBqJvfQStnAllmJm
         9855pYLy2dq79BNgEzSZ3vQUAAmmtgCQjA4rx/H6E8TIi9Bu7GkI+dl1L5EUcbHx7Ls9
         Vx+wsw7IIcYSWVYO055jepEqrujxIkrdznqISQ6Q5mB0YaOfp4sHkow7v3xPlynA4BTk
         IkMi2kQWTLtYlSTBKYgKXyBNOJxO7fNpnYMM92nixi9vE/79UGz4q3116eJSTq4Y7ofz
         siZA==
X-Forwarded-Encrypted: i=1; AFNElJ/+orRSI5vjdyu8Z2HbL5F0PAxAVxI4UnD+GnxNSQEYAcCAOe6yYpl355jp/K5iLW+hE5RHb0BhXdJA@vger.kernel.org
X-Gm-Message-State: AOJu0YyNe8KH4aQe6LJRAHLlEl7U5gEqFo4y0Ru0SbgXPnxEIwCM43xB
	MubBWuY0FQ0vin1AD/6FKzpC6FDdbqpFdvaKmS8GFqQrO0JSeCWOI1SvqzsSUPdaK7YmNHmkpnY
	Bj7gqFl6xKhRWJze6HW/767oNlg8oyRE=
X-Gm-Gg: Acq92OErv2KT4d9pFrvi2F9B1bjTUqLelQSGQ9ctLyM3D1SWMBe3ccCsHvs8V/EBylR
	8C6fjwmJGRPYW4q37fg3FBpq6Ez3XYa0Gojg7Oy/D+Szyi4oTBaeDcIc8vaw0GJlwb8VilZL10T
	lu6nNm0smZwvEL3V8CCWmj2zB+mLFgt14nxt8TIpsxqN1g9IvoRD9c2AvgWbU0SEPdQ4Yq+6iTA
	ooTjWr48AU+x+UaQ/Or3tkijzuqbjScR1EoGwS6D2eVNsRj+z2pk2XHeNOIAQMP4TUxacG1LgZK
	QjORTxxmQJwRROm80cEmvENvJ4X1U7V7rbUywrlfw9RBQv7YL/FSAkqE7K19HQEreUUG
X-Received: by 2002:a05:6512:1293:b0:5a8:82f5:8d1e with SMTP id
 2adb3069b0e04-5a887ae6596mr6277755e87.17.1778363496893; Sat, 09 May 2026
 14:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509-icna35xx-v1-0-688d3d4e10f9@gmail.com>
 <20260509-icna35xx-v1-1-688d3d4e10f9@gmail.com> <177836192983.1140170.1302751195131262657.robh@kernel.org>
In-Reply-To: <177836192983.1140170.1302751195131262657.robh@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sat, 9 May 2026 16:51:25 -0500
X-Gm-Features: AVHnY4I5YflKHkwlc2U_edUbwDTHpTOPyLPNatkDyf8Famn_WXTN3gmZWohLwUw
Message-ID: <CALHNRZ_NVnMBJ0+aBrc1MOtWz+NBX6vFahJcOWDmfW4A=iMhFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Chipone ICNA 35xx
 OLED driver bindings
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
	Maxime Ripard <mripard@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Jessica Zhang <jesszhan0024@gmail.com>, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2026 at 4:25=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Sat, 09 May 2026 15:18:57 -0500, Aaron Kling wrote:
> > The Chipone ICNA35xx series of DDICs are high refresh, low power
> > MIPI-DSI drivers for OLED panels. The icna3512 is used by the Ayn Odin =
2
> > Portal and the icna3520 is used by the Ayn Thor top panel and the Ayn
> > Odin 3.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  .../bindings/display/panel/chipone,icna35xx.yaml   | 77 ++++++++++++++=
++++++++
> >  1 file changed, 77 insertions(+)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/display/panel/chipone,icna35xx.yaml:2=
8:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
>
> dtschema/dtc warnings/errors:
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260509-icna35=
xx-v1-1-688d3d4e10f9@gmail.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>

Ack. Will wait a couple days before sending a fixed revision to see if
more review comments get made on the series.

Aaron
