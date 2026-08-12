Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EFF38236F
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 02:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786503070; cv=pass; b=SqK/qJfCQlLguOYwZ7k1KGAUdgYXrVn18fswPsacNKh9q/LIqRGMeNNcK9sCco4x9u9zwAaP2o5WO8L48K6qGIK+vOBObSeA9FlzU52pkbopq19+nTLc+Bibgp1leaI+6Mgu3iayUyxSp3WzVvyOTU9JFE7zUril3W5A2GVTxB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786503070; c=relaxed/simple;
	bh=V854Ow2c2JggNkbUsdfKDXvNBoWqMEC1lG5D0DCmDe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqEDT9aldVBbfVEvOkmu9oy7aZ8grmfmyGZjPw1FeCsPzvZ483scsd5DSb7AabQNyXjYkDzvukbgrwIStSU2Cl27dcsGfBiQrfOv1y+9BQyhvX4U3zyvZJCciQ3G9PqSe9YIk8FTJCy08S09L2dXd1I3Q0N8pIOxBsX1UdIKD/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9Xv0e/H; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9Xv0e/H"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b015b2d792so352220e87.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786503067; cv=none;
        d=google.com; s=arc-20260327;
        b=dizmq9o2eYBRSQoJsmcTDC6bLULo4qULFNhpk079EE1OxWYXS9GMdAns+0hD59HZAH
         uE9pwCVfj83DXdawV2zu8W0Q9hqs+qOi6rz6uTUk+22m3kUQiqQRPaeL7vn69c2du+7p
         fbFx/jyep/pW6ncp8CU5Wq6J0C+RTExtlPuF08HBQ0x7xjbL42QL0yKxTF/j3p812QA/
         9Du04e1tVszWwKbpSjbyFbGyypFI1abHxR507Az5TYbqFPJvBORUhXOEQFw5pWhQmkN8
         QWcW268QoCGSJhtYlKhuStgxSxAvGt/1ADpmFDQK3ApNE7JxDMeUax4TfM87jgj9URyI
         AnQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8qdxGMS0Je6Ctd6C+/Ey4+6laaYf85O2UWbiB0Tw8Vg=;
        fh=mt3FBg0EtTxtRla6ke6ItNobxU88gDslD5Cs+hkv0VE=;
        b=E41h/njj+bpAH3YoI7L8qEG+HP+lcolJBaj8dR1SB60BTrW2varCFEGrCWvV/jeLzT
         CVuZk1Z5eije9t9fslvtaqKPESotVGR0urmepTTFY4zmqVkQmjECkGJf3CIZazw5HEic
         ythKqKGCUoFMJRkQ3rDsJM8SyUkPFlK5YcJDyAUDQUH73oz3UGQwOhIWeVnzG6u4u9pz
         XgaOUnllPPY1e15YWOmP5uxliyw8eYCKTbIH8apbL3pTWV7AGLPXoMNIM57+HYWDwwpR
         Z2LdrID6NWoIUuYUPlF+626ooFlMnRapa5YTsTUTff6XTbu+nZJ8AFs3mAqz53VhU+xF
         Lyag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786503067; x=1787107867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8qdxGMS0Je6Ctd6C+/Ey4+6laaYf85O2UWbiB0Tw8Vg=;
        b=c9Xv0e/HavEqYpw8lTxeV5GyK1chgAvRD/Rt0IHTEQ5TrpfZdLyO9GCiW8GiflD1mF
         CPMYESXycb87iUZnSUjEDJZqfWuWapjrGy/bUEiRhvMpJhMOvD+cOSO9bCOCl5sFL0+D
         uNPMQYq0FeCOI76Pcta1LsIgVPwgWUbIpz+wqVpMt+KeR3zPZb+oYQa3C9dBaPp/MEFl
         KZjC5RqU0S+M5fz8Sui1fEyERbl2sDKoOzimAr4iR1PZPQyUVVvE9RTRMJc+FVwgRYM7
         frX+YRtw6nm6wnMAsT6GaCKmVGGTTc1B2bBPj2w/Pe8JsCn4hVeYeTYpeEj6DJ42blZG
         PVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786503067; x=1787107867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qdxGMS0Je6Ctd6C+/Ey4+6laaYf85O2UWbiB0Tw8Vg=;
        b=fVa4RtDCdeqKZUeBVtVQsOfi53s6fajtA45x6GBRSWUjhqbjdPfXY3RF1WWFSzGsX9
         HmHtiDxLbWTQGbGrqfj0kydt9o/p0ff9braUPoP6GyT4gsvcILzeHNsB7tD6y2SWswxU
         1x/l9HCYX/k698od1BXQyc+Q9NgxBLqU/Ss3zYDYpnmTLDsoWLK3a8GBhQ41svEVdLA+
         E1k6Hncrrs/276iu3u7euw5vfU4lSFE5zEKEKQ++RisoIIk1KcbtFSuXfvCqWzB1FVhH
         xLDZabaDrj+ppIUpa1lODIn8TG6SWmwvYpNeDQK//rYTnz+aNmFAeQ++rMXadoe0MXA2
         2TfQ==
X-Forwarded-Encrypted: i=1; AHgh+RroXGxNEBe0DLkXTA1tcP/er9SLPpQiqXcm4c9JC1Z4SbXxrVDOazQqPfBexIYpHjwo4bAM6W7jkw/F@vger.kernel.org
X-Gm-Message-State: AOJu0Yzee66PJFmeZYgU2l/HhYw8RmpmI0njeqTKE4jAbdupeybSwhks
	WBPmFKLnz8u2izre3m3/7wtm6kLhsZmsV7u/VAiAWYrIQ9tDJ1NQhosJafPTcWwUKf0O5L/1fdS
	Hq6h+pl70QX469gk+uMuNG8euWs5N20M=
X-Gm-Gg: AR+sD12QXCA93NUZNjb5nfegIntVzJDOc1/zfLlYETL40KlQpDW47X1TAtxQ3MFe9Ox
	6NCKk6Lc9t5uTroeVshwRBwLjxRJ5dxGmG13tVFApcs65O7XkbtnnJjTaUYj5ZOhH1Kl2OfFEhi
	YIhYmP4SxtaoOymZy52JlPIpeaOVD8+7JMaOsVSnT6WvxdULwIivYBOl9/zMdhPBE+zYPIJ+nbM
	0ObisSjIf/JgwwgDQhNlxjrIpUcElhwllJgTGVsZEVV4p//FxA4IpYt/yLiL27+FGVqTG1AW+Z5
	JouU4LwDXuX9uTEEVZT9Fa1/tDDDSDzF/I3VdCiTVkEp+A==
X-Received: by 2002:ac2:4353:0:b0:5b2:9357:b8ce with SMTP id
 2adb3069b0e04-5b44e31ebffmr172006e87.40.1786503066563; Tue, 11 Aug 2026
 19:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-ti-ads112c04-driver-v4-0-ae704ac17241@gmail.com>
 <20260811-ti-ads112c04-driver-v4-1-ae704ac17241@gmail.com> <20260811-union-editor-1d475c5f32cc@spud>
In-Reply-To: <20260811-union-editor-1d475c5f32cc@spud>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 12 Aug 2026 10:53:57 +0800
X-Gm-Features: AUfX_mw_q5_mMZ-WJHvUb4Gvmf9v3nIjjfS1widE18Qorp8AFIvUm08pqXCCl0c
Message-ID: <CAF7HswMcBx_DS4gLtsiy3ceBYBABF1ktJV4=+cDwAD9gLhP26w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Wed, Aug 12, 2026 at 12:56=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Aug 11, 2026 at 10:48:37AM +0800, Kyle Hsieh wrote:
> > Add device tree binding documentation for Texas Instruments ADS112C04
> > I2C Analog-to-Digital Converters.
> >
> > These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
> > interface, programmable gain amplifier (PGA), and data-ready (DRDY)
> > interrupt output.
> >
> > The binding uses child nodes to dynamically define the connected
> > single-ended or differential channels.
> >
> > Excitation current, burn-out current, and reference source properties
> > are also included to fully describe the chip's hardware capabilities,
> > aligned with the ti,ads112c14 binding conventions.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
>
> > +patternProperties:
> > +  "^channel@[0-9a-b]$":
> > +    $ref: adc.yaml
> > +    unevaluatedProperties: false
> > +    properties:
> > +      reg:
> > +        items:
> > +          - maximum: 11
> > +
> > +      single-channel:
> > +        maximum: 3
>
> Can someone explain to me please why the maximum for this is 3 when reg
> goes up to 11? What do the additional reg entries beyond 3 represent?
reg here is just an index for the channel node, not an input pin number.
The chip has 12 usable input MUX settings (8 differential pairs and 4
single-ended inputs), so at most 12 channel nodes can be described,
hence maximum 11.

single-channel refers to the physical analog input pin, and the chip
only has AIN0-AIN3, hence maximum 3.

Best regards,
Kyle Hsieh
>
> > +
> > +      diff-channels:
> > +        items:
> > +          maximum: 3
> > +
> > +      excitation-channels:
> > +        maxItems: 2
> > +        items:
> > +          maximum: 5
> > +        description:
> > +          Additionally to AIN0-AIN3, IDAC1/IDAC2 can also be routed to
> > +          REFP0 (4) and REFN0 (5).
