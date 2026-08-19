Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA944399F4
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131280; cv=pass; b=F/ZfKwDMBSRWw9q58Elf5ZyDuF9GdGIRcpXOFBVl+WQ+2PFmtScFJ82Mka1PQH2VSzJ2x2O5Dl/whnHJ01NGuhcVODA5zCz9LH4h/dPHGefheZEo7rdNPz3z6XD5NWkbHTKeSN8awMUxOMQhGHz5dVXIj9GcXm1uDruLLD2/zdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131280; c=relaxed/simple;
	bh=SRKu1RMP8lCKPR+HYznxClqvbk9Ij8Tx9Yd8BcRgYPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMkm8k23WYrpO8j/T/7cT4HH19IypXZ2YjDXJTINp7mxqVDacQN6u/BrMUfKzFrdQPRWFmJw2eUFKn7pjipR5qb3WqP2bI87F3gEVJB7C2Db/GboMmcHf7x/v4l+jPah2omhtZ0Ri566srDszIQYPdCLMh6BoVyJWyneTug6XSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dt9ETela; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dt9ETela"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c197eaaab00so132804966b.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 02:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787131273; cv=none;
        d=google.com; s=arc-20260327;
        b=LWk1zIOXnVsadGy4lCKR2Of6FOm7ihQLvx5wXk6ZS9a0JjakbfYNdyitgM7wLErkz9
         WZFLYpkIx0IIwlZ9shOsagVXeGvaXCsQz7gaa0LqwCHeFALN0b8i9Z94l3660bOFiLVd
         nFcLPIRjej8QsmjpUdYv0PTByxGrWnnTs0lZwPYhFTmX16U2Lr3t8mX3DsOhRyMW2wLn
         FKU9kiLQQdElxXyYuHOxyhVY4S75fM0oDZ6UcfKMxTdfm+l/lEcyRrZbHhxa/GDg0wag
         111LGDjyu3+GMsbfPve8VsUtLwFi+1NU2pM73/KOLFkwdiQvZiQ4C+voc8sIFok+6jrO
         dkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vi8ghfGMWZmpwEtSeTZjCsYAT31WP+MRhmUIZU07Nc4=;
        fh=+4YFC/DxY2CuO+jXY1cZ2qkfTV82FtX0MXYzUCCuDyw=;
        b=m32vrGWYHSe4JIW+dxKNCN/eQRVE4hcteLGUK0uI8UJc9WOuXAQcFTYf6+1Hrl3dVX
         5QMhDPzn2C4veJGGm9nHQ8E8tVAC/3fEw+pKyzkNZZzTqsQWthGf8cB1h7WW5ItJ2nD9
         V6uoGKSVpQhuz+fDNwkhdtOo9DmlPtApgEyItQll06idiugc4KTWBDvpdkmP1rVQOcCW
         2FuZ95ISbVQFXYSyb0wfgs72hRxnePXstGf1Kyt7nmjZyIPBolxoMNMmVcQsCHx7suAe
         dd4OLlC+6IScmdpYuM9qUSxHbiXLoYF3IbPkJzAH8PAFblemNB7hruMuRPVe/RX1pIoC
         oK8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787131273; x=1787736073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vi8ghfGMWZmpwEtSeTZjCsYAT31WP+MRhmUIZU07Nc4=;
        b=dt9ETelalYwPNHWrr7GzEURejWE6D9Ja4V/si2XFpml/u2fYfMjWLEllo50zrCZBvN
         GjhrV2jBxWSVkgg0y7IWniXkxNgRpoGLtAuWNG9vY0NXblDMu/xsECF6ohQjMA/GZmUX
         SDLHUkXwJlrxtTgnIK2+ZGwxCPKx60I2SjL5TptNpgGGPK3quZccmkaaG7DdG/mYeMDX
         yTx8JkK3Yzg582kqwzWTk+5j7Syvgwu+Ig0VMuknW0Sc9FeWFFBk2kMEr3PjDPgCJIdB
         Ih4uEmuYPJmCAIOsBWZ6WSGUMQw/kTRfkcwI0qnG/k0dvaPCTGw6c7JSqfFbeC1MphA/
         m39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131273; x=1787736073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vi8ghfGMWZmpwEtSeTZjCsYAT31WP+MRhmUIZU07Nc4=;
        b=S3Nd9OiKJcSZ9VLeOrpzeOWf7k+kLuFFX3mYIq8cqV4CbGkYLwiS6F5t2caATtGktp
         gnjJJVMdvXiP5MLJk31FENv09/TCTcZo3v7YsklrnR48ixG3F/QVQQlkMz8BFABJfgti
         i7LxHRI9vLy507LLScKRXOQ4BXpCbsmiHAaNk1ZYEmvfnvPhJCygCipkPntRT9wA98i9
         fnwPowxhL2bwqyStX3PCo7sMlgeaQPfel1GejDDya4DOP37UKh9YVbFrky8FeDfpcwzn
         Kl0RxdDiCC3ulNrUOdfBygO51R/BCv4XEIZEJ3xUxbFGS+krx1oos8lIGxsGQHr27aEL
         9mCw==
X-Gm-Message-State: AOJu0YzpuHnSh1mFX2wf8s+zj/B8HlxGz5Nq5kzM5B5NLKelrYmK9dzz
	sYesVEfnxlA5t4wCfteJJsntRkyOLynd1WOicSaxYtL8FkH8LyENVFpIXRk428/DNoV+kD9huXU
	2NeLfGvXfs/cmkYdjG1LgGuTNivCESNY=
X-Gm-Gg: AR+sD10zVDUoOGqLrpf9Dsyd75avpT6jS8EjM5z9n88Ibnu1B4sCfMnZzZABm+mOmjI
	T/NPNfGm22BT4QJI071UPCNVkWXR+c4C7ReLddtGShzZEklzM2tobrJKoROkM43GTzhcXskcELl
	4gWDD3yNtuKcqeWHp8qU5tjLEzWM+r49Rpa4Lo74mr5nRzoMGIRyBsTLXNUJqlq1Mmw7D8M/Nvx
	FqIsJNsVDIKSTilyzqR5oQhse4bCSZBGDQLL9DhfXx1nBQSJ3xHwij9i6KLnCRosCGUnqWKXDR6
	CE0pMjw9Z7R9knFO3NzORvv1tQFlVrprl1Fpt2J7ub2Zm6YP8itw2cLuDTL+W6mKcmeJmJ0eh/8
	xiQ==
X-Received: by 2002:a17:907:c16:b0:c1f:bda0:a771 with SMTP id
 a640c23a62f3a-c242e22d850mr188578366b.13.1787131272600; Wed, 19 Aug 2026
 02:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095233.420823-1-clamor95@gmail.com> <20260721095233.420823-5-clamor95@gmail.com>
In-Reply-To: <20260721095233.420823-5-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 19 Aug 2026 12:20:59 +0300
X-Gm-Features: AcwNN1VQ1pRWSA2IPSzjj2VjuH6jUfN6i7gcHLhHAkq5FyaNBjl025TKLUB959w
Message-ID: <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:53 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Only Dock keyboard input events are tracked for AltGr pressing.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/keyboard/Kconfig                |  10 +
>  drivers/input/keyboard/Makefile               |   1 +
>  .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
>

Hello Dmitry!

May you please take a look? ATM only ACK on input patches left.

Thank you!
