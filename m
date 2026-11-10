Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794309998;
	b=jn6Bz5OuPO0SumccbmhSXVkcHsF9OHE0pquD48Pt5DJLYKc+cscoLKtK/UI+KcouEW9J
	 SIUHAZNoeE2srLJ2hx3c9YsBza1989CV6XcNZKfj0vjAkUwUql1TcEcdm00j6kPzwl2uK
	 F8jM++erIRrvSi8PRtNhJcmUqPRRf4wH5vCXW8Di4xhrTOYvegFQKxFlY/8exJfdsU/8F
	 SpXIRcX+00nXmFuotlfd/4/7RG7S/0UoV1he0CU+7HRhNgvuv8jxxIJETUjYzb3jZ2xvX
	 GIPzD3/We9+op+mtfHh2/sLAneFE9KW14hf60L0SDOLRqvj0pEoa7A45WLR0FPYGjjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
	b=jraqNfoBob9REHKdy/bsEkROZ6N4ODWZdqj81lbR6NIY9VHRyiSm885CRPHEel26WpVh
	 KeSbERQ6/8CrXPkFltMOo8KOs19MArF4bH4lH2gIrmdzhzSh+ZyOjufF6SyUZtpGeWeY4
	 GZlavGLpxygbvc99TutWuQzZb/3d5xfoHyBLFvFlHryh6zj3jZxFeOjluyaXUVrP3347r
	 4q3l4DFs3LhFFi/419w2lUHKL4uVieWVvAL5qnoiofwBvZTbyBKARKaxQFEMZQDwwDx56
	 uI1MJEp31kBSQWPFp6n/cu6zAvLpGEehP4g3hPDuysjjnFGlU3zyAIAK9AYsiR5aAdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O8QUX/jx";
	arc=fail smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494B8606A32E
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 494B8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O8QUX/jx
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b30477a320so14051367b3.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:26:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794309997; cv=none;
        d=google.com; s=arc-20260327;
        b=bAEArFCWQytVXrEY1gkPEtMZsX4byxJoGYSnzEWoezbqSC7A1qWr/LjxGAwnKmte1f
         MYBANMukxkCCQVfEDgu04de1xLReyeuUhTaxFOp0lDbrvwpyC04ieTwpb9mIluFP0dE7
         SrVoNh/7lIGWxYe7VIk8zrv9mNX1nzoirPXNN9Q3AYKibZAcgPMlgmMZkOvClTKylsxD
         LP0jbTTJAQ84AB/hahyuFzQQvV3ctKTMn7LLb1o7WeZCDoU2szItmU/J+wRjTdpz+ZML
         4zSlsG9tsdOKhHVkJNQXGvHZmjLA6HyhuWXDvmRzWM55wzI+I47Aq82OnJoJ3lRrPG9R
         pLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        fh=VvKVSO4XjEejPOyL/wGfBJc69+LnYJj0lSBG74YmDHs=;
        b=MwtXhRbCjhIPAKkZxgmlGmlHmwDtChFS2zGvBdiwSQt2neqzAR51/0LhTUDLZMnry5
         CcDllmF4+FksnKY1v+x1s7yusjQrhcAIzUlwCcVbj9+KOBPA672l5qGd+dYVb/7zYgKA
         /vD/xPhHL29OKm4ESNhUI3QloDP+1/r2vu45k88Sln4Jc3zZzU7uXC+wg1atNJ6jd5KV
         1t0shG6mIjYBQYTUSfpPe2qaQ+dcXwib4gZJoNbNRyaNmg9KusXmBFH9LK8SE6PYMMSp
         8XKldN1n3OagKw/oWvirSJnXlGcXIFQkJAkreYJxiLOFATBck1uJL6hLl8btVHZnqVvl
         4Y4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309997; x=1794914797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        b=O8QUX/jxibFeXJZFXp3x9ekr6Hb5ZyG8ENJYU/s24eioSequ3810kAvz6PFc/NR+b9
         2wgMS4nzsryX7Ryjx85SwvLOAFbiCNUBrbN8yXToI4x3Ui9XtYJb3/WysQxwd/G5OfPv
         0F676GV8BgNIp8SP0IuEPdpG4sjqx+Lv7pii9P/bgfoj/l4HSzlbqnlZv4Yx25ZReLS5
         ia9aHbmJ8mHx/M5K71HC8fgNRYBKSiNQ0FEkFRvQ0ZQinORZ6Bs0B5l/JoMwVNI815PP
         RJU5E3Q8caUSx78qX5nas5C6co5zsxOYb6RQPwgHPO/VumJXOqiSu1LRROhe+SSSfrH9
         7J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309997; x=1794914797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        b=Ju20M+FADxnwvvaosUeCl4Ncs5IRfrlzRwQjpMQi8sPxuesyTF3wle7O+6+xMi+Bcb
         +V7R8pnj8z3STTlFvWxix0myFsqCXiqGQF9f5TvrH8O5y8w8ikNoSj20d43ZuRVKxfUd
         TouEe3vGbKPdd1kG1fzwVVRsvgsXTW2KLzYPieSvhgqELivZ+Bryp6H5ijraLBPLJ/kh
         yGEyrwJAqTtaHbpKosaFhYOLsyj5ALsJORbkLLAy2G7rh+HQu/rsPqUjlqQ3dXmM99mr
         Z/o5LIa9LIsBs6CYXpKLg5lL3/X/2CwFvvDhbhMfHq79bxRr7pdqNo/Y03CJBNPNRkqL
         cicQ==
X-Forwarded-Encrypted: i=1; AL+hErH/5zaSA0r26lwgbUzqI/SnNe8VG/WKt78PsF6MiZzQqifdpoFU+JkNLwFnq3xiFPCvj7aGJAAWxkNy@vger.kernel.org
X-Gm-Message-State: APuU4Z+3fLMEJnB6nmtFhk2PWTTncFy+gVPhpApuLeittcueQw1Z5ajz
	eAQ6du+jsYFG0/6aK9su6qXkhpGoIT3ZqEjvLyJLk+IyX47U7ep5Q7lu27Mq1mfk92lB3uIiBZF
	0iHbWZVCty0bsaUM02tqLWXQF7EAI1PU=
X-Gm-Gg: AYBFou2oI3rBqLzHWgaWIjHaMhI3igX61gDaRf6DFvEzC3t+tX/ksH0PlhfEsuUClQr
	DaVe9evPRXW2iWXtteM6zl8pgKBLx7cQjNwwV/PKkX/+9w60HHTP9lf3mSWJZEB1jGBzhs9hWd1
	s8XAwny8c/thd17NJldikIgsvZ0mf+43eyQl5iWQHH10AQFPLaabpzKYSHRe8sGfSadHolNbueE
	6+sctrfXCUlnk4tgYpape8gjmTABvhGsN7M42+VKvUdhbFeah1m7fFQHjEtJzZq4fj4TqqGpEKy
	ssCCYgCc1QxLsB5Bwe0qQWe1w5ojlWA0FXmwTglywLc1w2DJW0/XHHJaB7sbpyezh1HOWe4iKlO
	AMyqqS2N93X3S6QTbDqzqtaOhXbzZl6TgfsWUHFfnR3RKpoIG9DKnvI/Vszt6oi3KWxE5pT+C1+
	QbLVr6DFs7S76ZGZkm47WUw4dBVSTGJHe9+BWuYQ6rZB3QxhU=
X-Received: by 2002:a05:690e:4506:10b0:67b:e544:7adf with SMTP id
 956f58d0204a3-67c567cb670mr755726d50.104.1794309997113; Tue, 10 Nov 2026
 03:26:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-2-e2c97b82669a@gmail.com> <20261110-accurate-unselfish-cockle-3a39bd@quoll>
In-Reply-To: <20261110-accurate-unselfish-cockle-3a39bd@quoll>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Tue, 10 Nov 2026 22:26:25 +1100
X-Gm-Features: AclHuK-5Sr8Vu0dogwKG9EMBtjFYwuxFFj20UBqhmDk8dxo-p_0NSr8q2RJWh1g
Message-ID: <CANpmGNufv4_PM=1D1E-KRNQOuCPj8k+sGUJ1Y2HkkAtoSuL0Ow@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: input: apple: Add DockChannel HID transport
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Just an enum instead of items and const below.

Thanks, will do in next version.

> > +  apple,has-stm:
> > +    type: boolean
> > +    description:
> > +      Specifies that the coprocessor provides STM device and serial
> > +      number query endpoints that must be ready before registering HID=
 devices.
>
> Isn't this implied by the compatible?
>

No, it isn't, because whether there's an STM or not is decided by the
type of trackpad
used, not the SoC or even the MTP coprocessor itself. My wording in
the description
wasn't great and I will make that clearer in v6.

Rob suggested apple,has-stm as feedback on v4[1], we used to have it
as a separate
empty node.

Right now, as a heuristic SoC works because the only device to have the "ch=
eap"
trackpad (and thus no STM) is the MacBook Neo, which is the only
device with A18 Pro.

But that isn't guaranteed to be the same in future. I don't think it's
right to base STM
presence off something which actually isn't the actual determinant,
and just a byproduct.

> > +
> > +  hid-country-code:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      HID country code for the keyboard layout variant.
>
> What is the meaning of values? Do they map to any existing ABI? Like USB
> HID? Otherwise, why country code is 32 bit integer instead of ISO3166
> codes? As pointed last time, this should go probably to a common hid
> schema.

It is USB HID country code. I will specify that in the description in
next version.

Would you like me to add it to
Documentation/devicetree/bindings/input/input.yaml,
or make a new hid.yaml in that same folder?

>
> No default? Not required?
>

I will make it have a default of 0 in v6, so that way it can be
omitted by the Linux
DT. The intention is that the bootloader fills/adds it.

> > +            hid-country-code =3D <0>;
>
> Which country is 0? Isn't this just a default?
>

It is "Not Localized". As said above I will make this the default in v6.

Thanks,
Michael

[1] https://lore.kernel.org/asahi/20260925-apple-mtp-keyboard-final-v4-0-30=
4c267518f4@gmail.com/T/#mc53edc016ef1484c18e217b941b927bbf86f2cea
