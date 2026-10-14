Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C3238D41F
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978642; cv=pass; b=JsqNN32QuaCcbZAAGH2vtOqc9Yj5OIhuhpKy2lWD9QqavOjkIP5Xl69hhgiEa0ePQft8Qpt3AZYDHzvHzah3DMgzszsy1rFU7lzrEEloDsY6Um5IIvYR2xLiFg1BLoen2QOEUla0TnpTabsv3kdEJDFsuFkUWSfklR6lxWZVYEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978642; c=relaxed/simple;
	bh=YzE367kx9h5ucZyKgNsjxCV6DacyE/ZX6U4dDTaRoHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUefqaxFzUBw+xvmeSu4YbqEYUyZzYhSttQPakmhmYb2XEyc+p/7PRlqLygMxSxvRs1Xj10rpzsV0+YOdUUAeNXjhz/QjM+Y7kpAwqaXcatQbd6sW6tzjsi73YYMDjjZ9B75RdYq1hdpNyZVss06e1wG4LuA5ahW4QF4duLorrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0YmS6rn; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0YmS6rn"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48870973bddso2405793f8f.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 04:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791978635; cv=none;
        d=google.com; s=arc-20260327;
        b=XzkPTvamvRytNRl+J4OXtDzHFCWkXYMb5NgiEJ7NPxO7DjD92qRzHAN6dvtGYOqpnG
         O0Or6U/qnq1YNG57GYIwA6DIiDTja66d0rrM1nVjGclucZ5rmMexbeHVxVuB15uTf8i8
         t2z3oKYcTd2udgtZqpFORXL4YK/9n48+Y0/f0br2JA2DUeNJg5jA5Sc+4FDpR32ksc9s
         e4zwtm1kGgV0TOFDYp0T2R09/gDtYqUTzPS8DsveDSYH4yTPoy6q9n6dD1lubiYMKZZy
         s9B6dbSwQW83iNHNrjJ7ll7iX7wYbjeKyg5UBte0to7yBKxtD/pQ2DEY4SMzj8zGJShX
         BAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gsB6r14qi7ICCBa3crZHyjHVyyF0McKRspvIoEcEfgQ=;
        fh=q0RLrpmAJ/qg674ptnFpLW5Fh3XWkrYm+0sy1ZsSDRQ=;
        b=mvpasAw8OcOYFB3vODodUPAE2QX5kcAW9RKMJid20HOT/dlWn6TkKaOFXEjG+3h97m
         +eH8BcUczRGaLaGtnhDUPLNm9sHgST1DJeNOgXKLKkZ1gq24Tedn27uAH0ap/k8y9svn
         hup9twRA7i8W+betucABxPzlZHVtkBg6Q7Qpt9UgbzF+1Ze9yH/qhVCiT7WJQEje8L9P
         2yu6L5BgBBiVprZG6U2xaW9EYKgIrrLALZm63bSxSeKEvasQcFlCvLMJbcAp8F725tGB
         oD95C91AvRvOHQrrZ7a9v6F2s/14fp1FyU+5I1O3ung8ADON4JVTxL1o0JG0p/Ou71X7
         MMYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978635; x=1792583435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsB6r14qi7ICCBa3crZHyjHVyyF0McKRspvIoEcEfgQ=;
        b=T0YmS6rnTtHj2/FM1OJUokKrXHM3NME2WAkgPhv4Ni+pPVIDJf8AuBGKdVzDcplRmW
         S4XwMFY+X0+nfinJrD4iar41jkQ6h5KQFDzUdCTtIXs0JA/DcDJ3rxmvyX5jcnOEAeYa
         Ae4kdPG5xb/7u4J8Y6A5O1bYHr6PP5qs7+Krn9zAFIKbQbjZaNXROHRDBVm+NwROcXnI
         R+oLlGsJFtB0cXcKEAZ14jIbYXv/iq+tk6HTdoDaGBbmGe3FHdo224n9rf75AM0wYdW6
         r+VAHE9Yxte28L5mqZSq7TtBXBXKKCdRR46OtxIA7oQOsevZSQWy90n2CEp4UHGr8ZAG
         7gPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978635; x=1792583435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsB6r14qi7ICCBa3crZHyjHVyyF0McKRspvIoEcEfgQ=;
        b=C0A0VE6Khog2xzpspgbPixAWq+9n2PFeOp57wrHE3e+3j2rGKgvj+gGrcfC/986bBH
         NNuCX0uYIGI3squH5022rfrppbhaiaxuIR9g12ndDtpFnOWjKBEoQ9fdIkmoD6JePknw
         5K/pC+uAdBJSpcl8Nyupa3iEmMoyFM7GncbPaNApcdYSsikkQYJvFyRXWNbGeHBbFhqL
         J6pnouBMyoPccJZWvFlo7w6Z4bPW+wJ4X/bIXeGzJQnFlKB+mWwtBpzpJZu7Ekf5XahH
         L8TIFlxr3TCoH8Yv9RCTpZuhVNflp+RWS9D2+seaYCMEhyHYf1fZmVKLmivBrVVkJp9b
         QOiA==
X-Forwarded-Encrypted: i=1; AKwUvByUiCqwoXdSsopYpfZZT30pMhPbKF1HI+cd2KkdAKHPLfyFnAxGN7/Sk1LLuh7SQ+PDTjYBBgP/ZKU6@vger.kernel.org
X-Gm-Message-State: AFq9FYL4zwnyeSZ+GOqyfrZPRsU9xZHN8iP2dBpfh2o5ZfrVSJTvmeZF
	BS7h+VB05Yi2aDoTOUp3W1GuC+x/vDsP0Ywc2l86ssm8qIl7mQnUyiD4viN24e13LTdKrD/gXV4
	mKh+OLU8O1cYgcHu27rp+7A8ZdZvCXx2ObtxPrqs=
X-Gm-Gg: AYBFou2NbkH3cb+cPi82gbuJtz2bnA9Mvo2jh6UEQFCHYuB1TG+TQR3JoZFPchGTDJe
	sgQoWAGJK8HmvSayebzJtKv34iYi+yhKMU9DKnE5fyM5k0So5HUsqHwww7l6jWZAg9+LMH/z5ab
	BiLz9CibNlnIHyc/x7kw+SE4Dm2FRZfC6B9J3obDKbV8W8j+2bz9hm6ZFC5eZi3dC5sTxD4dmwH
	P56XU+J0jV5Re0GrsZ+b5nqdbfkJHYjxoXAVzKtrVQ0PIcOAZcFCfJvyMRs+Hul4P7xeu/GpV/l
	DnGjswON/apSA4Q6gyIWUZToqUGKnbViolWF/2HOIXayH+1186PMpVADr7S4kGldfI4bWqjzAra
	AYJvyr5MiHRBt30OznoljmgtNRYq16OSyBVngKOzjwKz8la/2zg0C0wRQEZ0HGqJInzdjtvJNjA
	==
X-Received: by 2002:a05:6000:2506:b0:48b:946:c1f7 with SMTP id
 ffacd0b85a97d-48db94bb90bmr29562583f8f.31.1791978634671; Wed, 14 Oct 2026
 04:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001154326.754314-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261003013310.D30A61F000FF@smtp.kernel.org>
In-Reply-To: <20261003013310.D30A61F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 12:50:08 +0100
X-Gm-Features: AclHuK-yCqqeOjMwwFQaMKLml8XUsF3SK8FdUMhRnNk9iZskJVvyr9TZ3F42bUI
Message-ID: <CA+V-a8u-xhSopVPya+tZRZrn8mSWYzsEAXHpRC6eTwCk4DUmnQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 04/12] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 3, 2026 at 2:33=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: net: dsa: a5psw: globally requiring interrupts br=
eaks backward ABI
> - [Low] dt-bindings: net: dsa: a5psw: missing port count restriction for =
ETHSW variant
> --
>
> commit ac61e34c73e390592b92437f35f98d8807997f55
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW su=
pport
>
> This commit extends the A5PSW DSA binding to cover the ETHSW variant used=
 on
> newer Renesas SoCs. It updates the schema with new compatible strings, mo=
difies
> interrupt and clock properties, and accounts for the 4-port topology.
>
> > diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5p=
sw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > index fab6aa6237e93..863633185912f 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> [ ... ]
> > @@ -73,14 +145,48 @@ properties:
> >                phandle pointing to a PCS sub-node compatible with
> >                renesas,rzn1-miic.yaml#
> >
> > -unevaluatedProperties: false
> > -
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >    - clock-names
> >    - power-domains
> > +  - interrupts
> > +  - interrupt-names
>
> [Severity: Medium]
> Does adding interrupts and interrupt-names to the top-level required arra=
y
> cause a regression by breaking backward compatibility for legacy device t=
rees?
>
No, because the existing SoCs already have the interrupts and
interrupt-names properties in the SoC DTSI.

> Existing device trees for the older renesas,rzn1-a5psw hardware that do n=
ot
> specify the interrupts property will now fail validation. Since the Linux
> driver does not currently utilize interrupts, it is perfectly valid and
> functional for older device trees to omit them.
>
> Should these properties only be required conditionally within the then bl=
ock
> for the new hardware variant?
>
> > +
> > +allOf:
> > +  - $ref: dsa.yaml#/$defs/ethernet-ports
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g077-ethsw
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 24
> > +        interrupt-names:
> > +          minItems: 24
> > +        clocks:
> > +          minItems: 3
> > +        clock-names:
> > +          minItems: 3
> > +      required:
> > +        - resets
>
> [Severity: Low]
> Does this conditional block need to restrict the port count for the new
> ETHSW variant?
>
> The global patternProperties for ethernet-ports allows
> "^(ethernet-)?port@[0-4]$", which globally permits up to 5 ports. This is
> correct for the older A5PSW variant but incorrect for the new 4-port ETHS=
W
> variant.
>
Agreed, I will add a check to validate this.

Cheers,
Prabhakar

> Without a port count restriction here (e.g., overriding and disabling por=
t@4),
> device trees with invalid 5-port configurations for the new variant will
> silently pass schema validation.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001154326.75=
4314-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
