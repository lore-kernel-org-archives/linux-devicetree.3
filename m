Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792481250;
	b=PxeUiw1BGntqS7FlrAgagJcKMPz6NJK8BfSK95rSkhItdTtyWG/v+xhzoYmfxZJQ7Ke2
	 3q/mYqhBG5CYkeBt2LmWNKWFdEL4dpZzRsG5zJwXcfuisnmzqO8RLy+zjx5MPKOMn1DtK
	 ldKbwBE98LgCBno2ToirFp7A/T/cP6239nayfSFiXvTnJkzoysNnjjj+HMrx3tRdNi56r
	 AVnOmKgYL+3wT6dBCjZoyME2/FKjL3WoPuPC26LnH6xNJisrw1jnVtbMbnSASLPjgZWR+
	 g22rRrU8hd1FXlt8qauVhDjtBTofvFE0yyGsR4FSWgTvI0GfxjKyYTQD1IjkmGs0t1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
	b=z+xBKR39Z6egLVrIghaahO9mqhfZy79ys1YHoPG7/uhQy1KmjBy5SESFdtddJQqyt7Dx
	 bu2QvYVU8mUjzdgwlb8gG+pQUn08dUVpq8ljJDJl0+D8szwaQouuT5uLV5mIZ+b+yAl2e
	 9iZfc0apZy9km299H6giGWVO1rTUi3F7O4qVgFmtv73RZep7A1fXXkwmUxqZ1aIGLur0y
	 hXlgDtMQGXfFwK1AnjoaaX6PkAhIkZevbc3J7WejkuCcvHuprCB/r9bPqnDIN0YBe4AG5
	 Eh1HKiowN1pcCMPLIusMo18pkTNYMD54YvbiqvfuZOZ9GfQOBehgY1zeWiN8T1dhVoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BSkiROCn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B451B606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B451B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BSkiROCn
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso5572027eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792481249; cv=none;
        d=google.com; s=arc-20260327;
        b=q0bkX3e0pEZOt/PnUwh+LrHAbE+FbylrCXDhGpwvJsEDvX+tkDl6NNejSpSPWhbpcv
         X6zJJIyHq0Mb56t5Q/gMx7fobvbFO/YaF0tDP5IQMYy2e62vCEsDcCtMa/nVxVJVV6o5
         m3vbUSNUJt9S7AJjiHXyvPTLv6Ds1fTjwBrqQ5/HG2rgqSskMhw4bajeYWuCBCVJyDb3
         v5N5FlUWICGiQJbHHdiuQkYkw3za0ahfOBLblL9nQPc8ErUEoExu7tfo4axL5bRcIxDY
         nIFQs9dfIHvxOPQsrqQyr2byFS6aJ+JdG+0OtDlyt/lnvthyKr2mh23Iz3F1dFg1zk+z
         h82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        fh=hZefira3C5sR2sYCHKadKRY6IhlxrRFQw0tq7umQbxQ=;
        b=V+SfiOzOtStuG7EM2K+sKEYI9QOCdSc7w81BIEH1bpoi4Jjj2UVll++yi66LMq7s1o
         zcxT/Z34xS2ko7nh/Sh9OAvPMflLEgA0pEJqDXPsyn39E9xxHKZ8ksAE7f0axqha2FEC
         u9DxPURrzDysceYYhG4qeTB8nWr0UgXl3LogDRexKt2Xe9gW9pV8bv0S16/1em+4GyqE
         mt+HsX1eL6izQ/clSidAcakUsNcOthut4sKGoML/ER8LAFLs1w+K8ijyajAEP8vINAKi
         2Qnnnnh8bncwcFYRbV010WYfwZsFR3RdAsozR2NN8m+W+AXC522pTsUZnugX8dRGuEL4
         qvag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792481249; x=1793086049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        b=BSkiROCnNX58runhrTm481OeUe6TigS9vHK/+OpJrzISryqv6gzY1meZWXeXBK1TM5
         AC7OWBag1lIVxMOnonE9yViTuJFz8+NjIchY6oIM0Ms7rn26hIQRvp5350SzaxDi2Nr+
         AYxvqSFKAaVltVGTHYxUVSgKHGctsooVeSkzQUa0cEPLuxd6S8zkBcNqsYmZYludnRO7
         27/rpaV5jOvsgxXEYRNJPK06HDStg5yCj8K1nDSd7nR4jNMl2inCuFYB6qSlTIsDKgQX
         d4bolP76Dhzke2KFbwjisP6mXoxnu/0jLFvoOr3aGirCtZJLBN99e1IkjMwfT0FPYvyA
         qhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481249; x=1793086049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        b=znAD8kDpr+7R69ZFz07MqibdZbw4kvguBcxIE9GN57rIlpjiXTbHaaURLRXWyhtlLu
         LcdqpaKHbUpFKNhgTPO1sGBdCVhQGloTbcmCxfRm41SrLwF/5eprubfVBaq1U2eS7kIQ
         hY8RDn7+NYWd77dLsxdomOKl8L8JgE0sDl1sbAMzKaciKjjBBH4JLSTUmkMRc3TeYlnQ
         lPL7IgODnb2TYKN0r2vjZxwH1pb7mcgDPT/SnIVHxkRi3L8RcmCLDzlex0P4FFDbrfI7
         P5Ni/9KlyHglVl2cL9nFv6yFi4sNut+jYHkAe7PIaaqT6WU2lW1sBbOK50SqtYrkPQS1
         slQw==
X-Forwarded-Encrypted: i=1; AKwUvByWJPcbOfNFTWxg3RBA0eDl/j21WyBaZsyJHz9u61ifODVcXw3tlNkXu9DLV5gsQykXnZiG6wEXLjb8@vger.kernel.org
X-Gm-Message-State: AFq9FYKifC6D9dGg9uC6jHy+pJ3wZ9jQply0N8/TLHKGBPWmEqkzRHKG
	S5J7fvXK84pAe/S90ypruFSeZ1KjYkfWr101A0kHDVWHTWuue39SzhEvyf1v5YqHeW/mlUifvcN
	JCKOivWYX/c1MawxvXXHCbMImH9otd6JHtKCl
X-Gm-Gg: AYBFou00Y/qEck68iaOuVIiYnImpw+FBGLh5FH9rbHBKFYa6z3wdP937BSxDbXqm9SL
	8e/zxrFl5qOQCr3/1B06eBdqfLXkckzcYTv+6Efpn7cBbtAwUCivO0MqGG/n2NLIj+/Jb5VuDcW
	aNaZEOf2BwUmAD+ay/rKtdmM8XiDt0Y1jDOVdkVlQ1zeuqYsliJR24vy3IcvGXxFfjFhL+KZgII
	epR7BfV9zP3WByH/fS8V9ht36E3i4Y4bpio8/G6pSZh++62ZZhXhaxPwxjGY+9NeLOwqgFz6pjm
	hWYuXvgbz84jelv7WapSmqRxUMsDoXM196W8E16cSuQ0Tef8WE86grhhEb9N9YwtyWlUUAYT1VY
	FeAMYx+lw6d+F
X-Received: by 2002:a05:7301:140c:b0:34e:67d0:bbb4 with SMTP id
 5a478bee46e88-361a0e85fdcmr14132186eec.10.1792481248787; Tue, 20 Oct 2026
 00:27:28 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <70f4c4d7f6263385d29ed8baa2106769@fkr.dev>
In-Reply-To: <70f4c4d7f6263385d29ed8baa2106769@fkr.dev>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 20 Oct 2026 10:27:16 +0300
X-Gm-Features: AclHuK9h-tQcbXrVM0viwwPsC9zuaQ4jRTMIV3P7VlE38_D0lFsuAg_ZHkgq7SA
Message-ID: <CAPVz0n0Oiok9vx1xmTPPpv8+iHCfL4XTE+D3jBMc1rUUHAftMg@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] mfd: Add support for Asus Transformer embedded controller
To: Florian Krischer <florian.krischer@fkr.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 20 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:5=
7 Florian Krischer <florian.krischer@fkr.dev> =D0=BF=D0=B8=D1=88=D0=B5:
>
> I tested the v12 series on an ASUS Eee Pad Slider SL101 running Debian 13
> with the 7.0.1 postmarketOS Grate kernel.
>
> The system booted successfully. The EC identified as ASUS-EP102-DOCK,
> firmware SL101-0202. I verified keyboard key events from the EC keyboard
> and touchscreen contact and coordinate events from the tablet's maXTouch
> device.
>
> Tested-by: Florian Krischer <florian.krischer@fkr.dev>

Thank you, Florian! Your feedback is quite valuable.
