Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD3E367F3A
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733541; cv=pass; b=HX75c3NmoundwheQkrYixrieJKLVZjq+1cM50n4ozRa4YInKELh4bpR6Mar7fFJCrKB5RHRbze9t5J8nvtyn6ODDN0UpnSDk7WXHx7YsVDPESKHRFDOFoWKSYEklPwAvsIRDNrnfge0ZCKHM0E0YnE6sCVfquLFQrHg+D5DrnpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733541; c=relaxed/simple;
	bh=+G5Wylw68XgNtH6D5xVeqvnZZP1BRSsmctqG/RsT6eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcXy3hE4Cn7eP4+wLElN7Fy/G8bU+UA5x+7EjltK/HDj51zQGikmpZed5cbrzZECX431fQ4Lz2EQzWYC+1w4dd6z8U9IN37rAtJ+142/3pQ9FVqe0N0Saj8dQBHmNn5xCO9iCJBbspBFpdA1zRU5eeaYqIl1NIrY08KVnMtPZAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsfkehf2; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsfkehf2"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15f47e6297so942139166b.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784733538; cv=none;
        d=google.com; s=arc-20260327;
        b=TOafTYLPj112kPludm7b6YmFjT7yJFWMxqI2H8ks8PssuTdMifTkTQpJvIia+h8m+s
         4PEVMjvFDQJA84yfMwik7yEgQKENZ9IAOmOsssm3FiiyFySh2URlJBe58Y1okg9zpvPd
         ZyhKi0w+1ZYZxjJ/jRymaU/iCLBrKyCyqdn28DLrnqCAfIrBRtgA4wHMuss39qGQLkLB
         UyjBic1KmEAwyL4HjEgyjJCsF2rjAgq+MYqUbeLO6JZxrN7REOEUaQTsECWPIwtvPHPO
         HOuSLjBc3moF0r4Lk65YpcQWgXyLts+zRXwb9Y+M+7FZO17ekF4Swo4o2Y7zeJdmJl1x
         Qm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i1afpsh2OIvkZaaChULugvD8FxciERHSKG0pHwByaWw=;
        fh=/00+5Khk760YSpA33Lruse8ycTwxyCODMkcxKamoa10=;
        b=Y3SfMmUJzXDuII4YT+2fjG2RZr/2SvKrdQ3zzlk7bWeN8/nzELsnB6JBF7+pikUeFj
         NEdJvaDHpTH7h63+UxHav50jnKkQCFB+LNVPJcr8gNj/sXmuneiw72EeDHjYl/CKq/Rj
         IgigcZEK9cN46A/seoDaBwlwhHKt8LzxdZ79zL2qbiujGFQkt0QsFnwlb71PYF3N1Q4k
         QdfoPEwgaHZKV54lcoF0tphhfg/82wi4vc5dfnPBybMqEEmtQ3oPIoXhypsqiQRBVi1g
         kWghbW1z1muRlK34+S7weTf9mP7aZ0D5iyPsdCBIegGKFRYeH1S+9TmOENbO6ol7SxKK
         dcuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784733538; x=1785338338; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1afpsh2OIvkZaaChULugvD8FxciERHSKG0pHwByaWw=;
        b=dsfkehf2gRTOmYGTA6noprbWgxhtuUvNh9D8a+5KkfbXWpWrlEEeSDEikbPJDmQnEf
         A5ubEifvCH/ISxKZf8WcPRyVfvl6+zssPCWUB3Prdret+KeZFqD1T4O9xq92ql7mKr/U
         JVet+r1zvGU7nKHuFf8HZHSTaw2FybLRbksdIJXoa+RkwNYC+Y8lslKiYvcDfdpHnmsy
         dJRQhfanfoJGcnxHHyNSHqQyEo65U9uqIVCWKarPVlwE1fpVA6aZ+hZZefRZtgdMrQyW
         nrjR3s6Y2pSgN7Q/JpOU5P/BX0XYtzH12m7uMipXFSFc7t/vNHGE29tY/OFi1PCO1zTv
         teSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733538; x=1785338338;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i1afpsh2OIvkZaaChULugvD8FxciERHSKG0pHwByaWw=;
        b=Wk8qVkBGPKTMO3/1uV1ZL+nlMB8Xd6p2gHh1uElh3Nc8S0j+249ZyiUDXlnoUdrmPw
         InY4tfBKw5NlA278WVP1YVmBGSKB59pU7vknuW8ZEdgfdol2JEpuasophiAUn+nVAiOq
         K38wUdzZeL6guouGTdPrigKZGFZncNWOwarqsyJ+CwqP0YyOHqAvZhNDLWARN6ugZ1Nm
         IWDGLhydvQo88M9NtsTHe2XdYvKqP7/rjlOjIAQTcHbFdLg1njJpRfN/AFqODVyUuxox
         WhOLjl4skGWmWQeO1kms9eORI5cir6pWmAYgsDYEJjtW3xBM2AORIcjSt1oii44iT+4g
         aLoA==
X-Forwarded-Encrypted: i=1; AHgh+RoTUZVNKQzSlZ9QSO/LitgC2JaxNCpsRj9Iz931OLZrwa/Z4nCtms0+1IRWtAFtYT1RlYmWXD1VfOaa@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr2MWvDx9sMdAfhD2yLSzyWUnwLE1dfoQpbvx6opUaKwJizWzB
	5wuumxfRLhn0QW+D317dMzLQbbXNwLdscGuNixtC7ZclUVyczCkFiM7s8v02DV/hd+NLxEEFMG2
	vK2otnG/Iw0Xi+nroqIeRHrkkU7Fl6Ss=
X-Gm-Gg: AR+sD137YFdUVYIvhKGk/BKGzdr4KcLQQW10j2BSPRAyYCrnJeHsRwfr+Y+oWLpB66N
	GZv4Ac3idi8b174l/1YenVxdXtUfCFRDTHfffHzaZ3C8jS8pKIJiFk5uh6JYggmN6rPVr/Xt8Jb
	94en4wIKgG33wzVjT3+qRxNIosZYUFv8WgUAUu2smr7wlrkq8hLNx7fnX6xgGI3tfcxnP3yQNjo
	6FVbKkvlV/pmW2F+Gq9IuakJm7MQy4IO+lBvEIIY5ArD3YwF/HKEeQ3i5KO860P7QDFnhAZ1q2T
	MCgGOQvexo9tiVAqTa/+RRywjE7AbDk9aKrRyhaaoH79nmB/2Hqs
X-Received: by 2002:a17:907:388c:b0:c16:945:97f0 with SMTP id
 a640c23a62f3a-c16b48533femr836839366b.39.1784733538115; Wed, 22 Jul 2026
 08:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721112133.70382-1-egbostina@gmail.com> <20260721112133.70382-5-egbostina@gmail.com>
 <20260722-ochre-alpaca-of-tact-ef17e3@quoll>
In-Reply-To: <20260722-ochre-alpaca-of-tact-ef17e3@quoll>
From: Eduard Bostina <egbostina@gmail.com>
Date: Wed, 22 Jul 2026 18:18:46 +0300
X-Gm-Features: AUfX_mxRkciUP9PmKB_Sf5WpXXnp_jwGYivbso-yHbHHBjEP1jiN3c0a8MRq-10
Message-ID: <CAEFOc610_15k2z-kCtuKkH3M3_ugE6uotvh+=oiYe560UOW=Ow@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: leds: backlight: Convert TPS65217 to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Thompson <danielt@kernel.org>, devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, dri-devel@lists.freedesktop.org, 
	Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-omap@vger.kernel.org, Mark Jackson <mpfj@newflow.co.uk>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, daniel.baluta@nxp.com, simona.toaca@nxp.com, 
	goledhruva@gmail.com, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 22, 2026 at 10:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Jul 21, 2026 at 11:21:28AM +0000, Eduard Bostina wrote:
> > Convert the Texas Instruments TPS65217 bindings to DT schema.
> >
> > During the conversion, the following updates were made:
> > - Documented the 'regulators', 'charger' and 'pwrbutton' child nodes,
> >   which are used by the boards but were missing from the old txt
> >   binding.
> > - Documented the 'interrupts', 'interrupt-controller', '#interrupt-cells'
> >   and 'ti,pmic-shutdown-controller' properties, which are used by the
> >   am335x boards and read by the driver.
> >
> > Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> > ---
> >  .../bindings/leds/backlight/ti,tps65217.yaml  | 170 ++++++++++++++++++
> >  .../leds/backlight/tps65217-backlight.txt     |  27 ---
>
> Biinding looks fine to me, but as pointed out you missed to remove old
> TXT binding.
>
> Best regards,
> Krzysztof
>

Thanks. Will send v4 that removes regulator/tps65217.txt as well.
Should I move the binding to another place (mfd/ or regulator/ as
suggested)? leds/backlight/ is arguably wrong now that the schema
describes the whole pmic.

Eduard
