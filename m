Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A348C3839A9
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663448; cv=pass; b=KIXlD/oGAxWUzGpQgeSN+cZ4oqf8kBJqKJ/TYIbgVW2d2/7/zBhATBW7xzPowxS5TxdWIkHG349gu4Mtzc45CBkSNDC9AE7AsJCcCYmr6EHJt+QzvdfDYf+15RzN/2mmKBNs3g08CDmbKxeobqriAPDj6Cje02UfLkMTQdQa3x8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663448; c=relaxed/simple;
	bh=02FhfIBqMMvQXAFc8ywza3WsDbF2gi0rUDQddC21ZyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7j4i3nW1dYmtF3uBEwDSKRcXxnM4ZGrYM4gix+DQ5EKz5wB9B42YO+M96Md1jB9np6q0GIO+jagANcqSedP10mDpw7oaCncrOUuVg4p1BSWoRTGubqxsE5ELKNmPTcyv3hxWIw+ugdqwd5zfCl7S9O/3nYAE5CPtKAHOtGCvb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTD27K8B; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTD27K8B"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15e592da74so656283966b.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787663437; cv=none;
        d=google.com; s=arc-20260327;
        b=deJUTj3PbLIZSIhH8txymr9ZjMwhCeKzaZ5gI7MRTt3R9gqbyUG3c8OPQO31zRYHxc
         GxwB5qjIw8UDPeZ4QL8K3GBK1lofjDB7I+RCC37sHWhLs865u2of3wAUq5K4T82o1e3V
         a3wpeZKqjx+TlpvurTERb+TLA8tct3VK2R7n6DMA4/MKm3LrMOR1CkV0si2yiKF7dG9e
         SeQ98z5VtG4io5WG3P/GsnIhUAZAhFgoKxn973haq1h5bgKFK13+5pgmROTTVQ60tigf
         eCFVtRxjMz/1aad+o6Yt0ALLS+HYgwI4sBYWb7B9vElIfYqTpGzETgXGT/JR0udmwvPM
         6Oew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iuMwj835HhD4A5CZXk1Hdm7IMcB4Kfutchy14lcyny8=;
        fh=e00/uiMQ0d5b+Mad50i+kOK1EMor1ek5HAqDxcon7vg=;
        b=dN1Lz2BPQfbbDlkljUHx/rFPq38bPbLwg87wr8O1zzENV5MHypW4ZGBiqXK/gm5CN5
         wAADEqOJkaoBK2Ev29l10S6vs4Cce+qzs4Ysrv1sPNjhZCAQuXL7l0n8ULoopZVss8ZO
         4+GKe7Ly4F1Q795X2r7cx8F91LRAQaI6h9EbT57PxMVqMXsEKfIqWYYeLJDh8L9FF4KI
         055KEcpDg0PW8CeXt6napXI+wHz6jCJX0A0+748nJPcjXtOoeS25OcY/G3za50O4Xqye
         i4mSCx4HepnJvM7YOOPj7C/BC6gOP3rRP3fJL1uc4hPV1O3wNgKIsbDNVEy7Q84d8+7Q
         4d+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787663437; x=1788268237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iuMwj835HhD4A5CZXk1Hdm7IMcB4Kfutchy14lcyny8=;
        b=DTD27K8BmV9EEBv7J3uEHqthV0pcKxDfi6PXr0088Ii1HelBk73k5HExF7IhYM1wW0
         HSCnVozStEGbBPwAN2w7njqTN3d0QQVZvpwWSTjPvH6zTUugMCMlMA11hXGHR2YNGolL
         HOA5iBtA50AOSOv7Vm3+AT9y4DXHRty1NkWEM7siAtLcIYVJD5NlmdaM/zZMhTjUVh3o
         hDdWF12VxHFziW6A9gFvjRolb6/o4FP19w7c9e3lUm6KJYBwUPDxLOjSNC4SDTzltnGt
         2DbKqsp4iHwsbxPZ/2VhUa6DJ+xDyTN+GoWmWLIrQ7Wown7JS5pFv6d+ABtVTKg6oR6U
         77kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663437; x=1788268237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iuMwj835HhD4A5CZXk1Hdm7IMcB4Kfutchy14lcyny8=;
        b=nh0IHCH4P9XxThcHskEB7M2+XU/dybFBaGYO5DZpINe1KrZxOQ5LUALsj0m2GOBiM0
         /Ukw2buT1+OV7WLNGO3dyBTLv1/Kbv68ybcX05Z9CxvlSDcXaA8i8Mn+u5hYUWx1LA8U
         Og+eWfc7wABtXuAhJ8Syt6jwbHKJHmlOOhAsyzuSVRsf5r6p4kOBMD9FceWX6Jh5/KzG
         WkK32hjE2nBfz4AHHxX+0/hivjy8Hkg239ATK9IGQEsRXbha/QcQQzccDZoUc3Ff5RBX
         WaM6FTAb/vWPbgiuxdsmEMm9BkgfsllV9BF1+PYl9sVKN5sXB+ysYubA7RDbxhqEnP13
         rOcw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1q43VPGSc7SuDYv8vyT8H2dJYqLs/RSyZOODTNydmLKg4hZK5zejxpV399E2ORBbvBNuMhgX0PhC2@vger.kernel.org
X-Gm-Message-State: AFuF++mWkDImtOhQMeQWukAmvWZNTm7gxSKgknPYn/41Hrcpf52SnQ+N
	Hd4WDz80rhnAO7t+DpiFXaMcCwOKAZ0sOt5DbiO09ZdB//oThrSMk7kYGKeCCZRM4VMnM3zaroi
	+1yxaaoV8c7/qKUaj9tJgxLsVRpqjnF0=
X-Gm-Gg: AR+sD12ADc3sUwaROrwkjhTxH9Fdosrauy77GkssVnNLX92fTI3blJgSyaHmAtZ8WRp
	KOooCHZeC9U0pS6wMmbWNG40zvz7nB1Et85tSEbPkoFFZultEppvUAYB5LK4uUZOGOlE9zEebKs
	pV8VI6OsWVifmkpfE0SvVwKZHZBFNA5JPUYOb9tqWzk2nVsBgjCUbH6QsmwC4p8b4buUYLsz3kp
	GiHJwoCn0Aav1iJ7AWsaQYOxCHzZsdRP4ouBaSbXLuWzD77tn5Q89EyQdzRsTZ2kqxAhh3FB8cD
	pJp//94EM60Xty+jC2MU/rYQSfY/TmjFX0795z33MxLxe9Q=
X-Received: by 2002:a17:907:60ca:b0:c24:6985:d7a1 with SMTP id
 a640c23a62f3a-c24924b79ebmr3067182966b.7.1787663436768; Tue, 25 Aug 2026
 06:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
 <20260824125523.131762-7-biju.das.jz@bp.renesas.com> <20260824130453.D03C01F000E9@smtp.kernel.org>
In-Reply-To: <20260824130453.D03C01F000E9@smtp.kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 25 Aug 2026 14:10:25 +0100
X-Gm-Features: AcwNN1Uq7B_OPhhUOfAGvmbEHdK5dtPV8yVIVtP8a8LSe8nf83A3g2sBuIV4qcY
Message-ID: <CADT+UeBsPrADZdx34qS4YLyDwmO9Lq9qJMYWzhw0HW7+f_yZCQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/9] dt-bindings: pwm: Document RZ/G3E GPT support
To: sashiko-reviews@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-pwm@vger.kernel.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sashiko,

pwm.yaml  already defines this property[1] as required.

[1]https://elixir.bootlin.com/linux/v6.0-rc4/source/Documentation/devicetre=
e/bindings/pwm/pwm.yaml#L23

On Mon, Aug 24, 2026 at 2:04=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Add `#pwm-cells` to the `required` list. The binding omits thi=
s mandatory property for PWM providers.
> --
>
> --- Patch [6]: [PATCH v7 6/9] dt-bindings: pwm: Document RZ/G3E GPT suppo=
rt ---
> commit 9a7d174b7aaab1e8640a8415696ce9830442c765
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> dt-bindings: pwm: Document RZ/G3E GPT support
>
> This commit documents the device tree bindings for the General PWM Timer
> (GPT) on the Renesas RZ/G3E SoC. It details properties for the 16-channel
> 32-bit timer, including interrupts, clocks, resets, and power domains.
>
> > diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.ya=
ml b/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml
> > new file mode 100644
> > index 0000000000000..cb4ffab5f47fe
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml
>
> [ ... ]
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - resets
> > +  - reset-names
>
> [Severity: Medium]
> Since this hardware is a PWM provider and defines #pwm-cells in its
> properties, should #pwm-cells be added to this required list?
>
> Leaving it out allows incomplete device tree nodes to pass schema validat=
ion.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824125523.13=
1762-1-biju.das.jz@bp.renesas.com?part=3D6
