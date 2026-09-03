Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632723A875E
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461952; cv=pass; b=aJxJXzZpIBHXwjn1DkCA0YbyRONMA4baT9ZkJ8OLdUhDHpIBKxRtlXL6zMzkr5oB2GvY0OUsYYdkK6KqTIJE2EM0IkKoxNG8grXwSvIlFtKOZqrhsV5hrpTo6bi+wIOVJrXOvOU9VGZ6y3c0iGPUo9UVGMgICOHHP+M9IWgw2/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461952; c=relaxed/simple;
	bh=/OxdHj9ysvfR57EEzc0+AuUsvMW1G0r5zIF1Md1GvvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3eB+vV5xu08/TepyxnSA2y5RNr0dBNixbMjCMXcJotO468auTqCjbj0503hk1Zzs+Zc8BXmA8KiA6wDKq7f4u9ZldQ//9Exq0TrcTQfP6dGrgrV/C0HFEqJ+Vs28evh5IuUZbU4DwGKDftewKfBFmeaDhIyIhxF0kp3osn4Q0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njSLHGQx; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njSLHGQx"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso156622a12.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788461945; cv=none;
        d=google.com; s=arc-20260327;
        b=YSbPsMGfyY364QBfuZTjv9Hq3lud9+FKl2/OfIts/xOY1hXcpFeT3GK+uv6vmf+wnB
         myvfcb8LoZhQCNqyC/ifcfA3uFY/45xbhQFrAJkd4TwflEFimudAJ+rW3tWESlFLTT/N
         v7XyHlOzxaPURkgVpb9WJnOmV+GA6keWAN/rVzeX7i+m789SwU+mCFHlKIUOCB/IlRP/
         LDu4OV3n9C8xASe+ZGRctsOGEJfEdjLC98yi2UzB/0iWg2KChwfZSulOIGxMgirnv8bQ
         9VLgc5CbNvqvD8LYpMjZIi8Z4TZwNje0Nm13l5jLWIr3cSL/roo7Yd7b6F8iUb1ZuWyX
         GIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nI/hqBwcSMNIp3RBgD0iAO6W4qosGQLQpAKeR8JRNrs=;
        fh=uUNjYBd0MLCsd0yhx86O7NMWwS1lXwTZkCgV/zy2+HY=;
        b=Fn8t75O9q93X+ii0t8c8dli9No2FF1zXUvu85rhzFNWX+C+P5fUcsTkJpaVnggXqAX
         pvd3EpGKjzNYZEKH/eyCH32vdakD+9QllqXD5U4LCCwgHjZd4m0pMLG7NPs42vELG3p8
         MyJhPl6N7FoHhvQ37h3dOG3SutDvnN3XaDVT+8HYvm9Cn1TIiUghratV63pYkZ4R9yCr
         19HohnDSglFvhfq5XpzcXlVFJ5VR8pCloXRHvtB7ddP02mqyx8aKtpGe1td3G5IE2fG1
         +S/rFrD81SKp9wc8GEAaF3Dr3AbuMw3vvm4jibUmXpzi8AKPKQ482WpLRPp1NNFkO51l
         1bpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788461945; x=1789066745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nI/hqBwcSMNIp3RBgD0iAO6W4qosGQLQpAKeR8JRNrs=;
        b=njSLHGQxCP2li48YR6bUqLXOlIVAOS9Y4DfCyF+hwyMgmNTpgeiJ5/HJ0/q0FpxfcH
         zWNz3e/bRS6ozvpZiy//nb9Ywndb+AjQCmAFskXYWkIIoSGuz8C2RSwc4iREuLGrugnT
         q3DzOlS4ydOhd6BdRx0AoN3EabGSxbkvWtVKukNvb4/swQcc3ZVNhBfZTHN/oTcW/hdp
         SAwGo302vNaGl+2mAv9k6AZ+RtVMPcdEARFSVPFr/wCArpNHT1qn03CrC4AQeo2QvR4M
         aDW9BIVfPgE/DgeuKDbQT3AQFbaDgZGdK3KJHxt871q6kx7pVeYaKfZhCiVwtNUFTuoY
         z7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461945; x=1789066745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nI/hqBwcSMNIp3RBgD0iAO6W4qosGQLQpAKeR8JRNrs=;
        b=j991SqYFcbU6R8VK62qqv5eoUrpjf28CnZuF6R2zJPOsLBjxf1biB/hjNY5YfOpO7o
         e+iyCIM3sPQGykITHYCVCAZA8BcmQOHeJqBT3caJFDahFgtIehHHKDpOMhhJJa1g7ho1
         v3lVS5REi12RkVmaY7yTV/oJYkuo7fKbABPnAD7b3ssQgMSauWt2S/+LW5g9hQqqfxpR
         L7DhBtWX2dgnbkD1J4cgcMeuCL7J6MKYAsFRl8p2sR2JaF8o+lpBmtR+xaalDJ9GH47I
         ENKAKccb3fezH+DxnGRbsJRAeT6R1F5c1v4EzJn4xDRMRBXjYSzE8Y/ywvn48cVjIUYe
         TRGA==
X-Forwarded-Encrypted: i=1; AKwUvBzkz03PC+4ttuI7TCeaG3polY2/erbGxC5dFzWqqLeXYkHuXIh5mEjQtcMXVikQCv6j2D9T9DFBYiAB@vger.kernel.org
X-Gm-Message-State: AFuF++lG5oCQmnnAwbBK/LT5KMYIPjHpPiYkQ3XyFbBcXUdUwqRsAq6+
	vxxpD4eqd4zDrq9jWQAmZBx89xzd7D2JMKqfkPqC8pz+ZTuokNhRRa6CYd8hphgUqDmAAh30KU0
	PyaHaZlsWM5ns/hK2bsO89Aag/xrkafs=
X-Gm-Gg: AYBFou3yPOgKhtuAKFdMagIpTy7snfpfyCPAPzU0I/0xTJuKJ/kg94jwUAhhtLep5EP
	WIUiaed2xxXHXYYJbBqPsc3XDOVhppGMxJCPomBc4IWnZseBK/cHF/LV/XSjdcP5oFy7U5B7h7Y
	bOBTUhrWkkP0d/SGuucHD24D2rXEqX9ACQHtUl/M44ZbrIQsZ7unH536QanRHu5ctPPOpQZMljg
	PYaaDGZo0YOZmbjYifqFKuTxTLiQ3mUxJ/XTJEHW+5YVsBsy+nvzPRTSawe0aKnYHqNIPX4kBxM
	HTKbbQMtNvpUeP9NucZlPa/cc1RPi5HYNV+9zLmCDltwy4uQN2TgIhVtRA7s/utyK/zLixYp5IS
	uW/qYmkRC37nMfk+vUJh4yB3O3TKgo7EpkvRv0uoTgBYk+VDxFxTIsciOzS06dvdcqvuPtpjVyT
	c6c3wgFrEjm6ysXfGn9VcGKgUW58tf1vEBweiCowEElAZ29m7KZPtoLNM=
X-Received: by 2002:a05:6402:3886:b0:6a6:32f5:5571 with SMTP id
 4fb4d7f45d1cf-6a7e8f946bfmr27530a12.19.1788461944874; Thu, 03 Sep 2026
 11:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901004203.49686-1-rosenp@gmail.com> <20260901-corrode-unvented-4cf271941722@spud>
 <CAKxU2N9X=fvr-a5h5o5XaRLuRuSUq7wR85xmSduK9vff4z4CQA@mail.gmail.com> <20260903-pettiness-crested-c4fb1b3ac05a@spud>
In-Reply-To: <20260903-pettiness-crested-c4fb1b3ac05a@spud>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 3 Sep 2026 11:58:53 -0700
X-Gm-Features: AcwNN1VKJMbKCu_T1F0VY384x3qLO0B2LRU-9HQpE-yQn8Eo44X7b4XrjE7mWcM
Message-ID: <CAKxU2N__+u-mJ4bbAEFcT3jbxPShi4BeEj+0cAN3oHWzqeGzZw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: 8250: add marvell,armada-38x-uart compatible
To: Conor Dooley <conor@kernel.org>
Cc: linux-serial@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, in file <devicetree@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 8:42=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Sep 02, 2026 at 02:34:55PM -0700, Rosen Penev wrote:
> > On Tue, Sep 1, 2026 at 10:51=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Mon, Aug 31, 2026 at 05:42:03PM -0700, Rosen Penev wrote:
> > > > The Armada 38x and 98DX3236 SoCs use this compatible, either paired
> > > > with "ns16550a" (armada-38x.dtsi) or on its own
> > > > (armada-xp-98dx3236.dtsi). Neither form is covered by the 8250
> > > > binding, so dtbs_check reports:
> > > >
> > > >   serial@12000: failed to match any schema with compatible:
> > > >   ['marvell,armada-38x-uart', 'ns16550a']
> > > >
> > > > Add a standalone const entry and a two-string variant paired with
> > > > "ns16550a".
> > >
> > > Only one of these is correct, add one and fix the users.
> > > Given there's match data, it's probably the standalone one.
>
> > Commit 62480772263a adds the second one to support earlycon.
>
> So the one with the ns16550a fallback is the correct one?
Good question. I posted an alternative to this patch here:
https://lore.kernel.org/linux-serial/20260902222555.30C151F000E9@smtp.kerne=
l.org/T/#t

If accepted, it would avoid needing ns16550a in dts, and a v2 of this
patch would be the first hunk + dts fixup.
>
> > >
> > > pw-bot: changes-requested
> > >
> > > Thanks,
> > > Conor.
> > >
> > > >
> > > > Validated with make dt_binding_check (8250.yaml) and dt-validate on
> > > > armada-38x and armada-xp 98DX3236 boards: the UART schema errors ar=
e
> > > > gone.
> > > >
> > > > Assisted-by: opencode:big-pickle
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/serial/8250.yaml | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/D=
ocumentation/devicetree/bindings/serial/8250.yaml
> > > > index 8c2c177faf89..f71c6afe02f2 100644
> > > > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > > > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > > > @@ -109,6 +109,7 @@ properties:
> > > >        - const: aspeed,ast2500-vuart
> > > >        - const: intel,xscale-uart
> > > >        - const: mrvl,pxa-uart
> > > > +      - const: marvell,armada-38x-uart
> > > >        - const: nuvoton,wpcm450-uart
> > > >        - const: nuvoton,npcm750-uart
> > > >        - const: nvidia,tegra20-uart
> > > > @@ -119,6 +120,9 @@ properties:
> > > >                - exar,xr16l2551
> > > >                - exar,xr16l2550
> > > >            - const: ns8250
> > > > +      - items:
> > > > +          - const: marvell,armada-38x-uart
> > > > +          - const: ns16550a
> > > >        - items:
> > > >            - enum:
> > > >                - altr,16550-FIFO32
> > > > --
> > > > 2.55.0
> > > >
