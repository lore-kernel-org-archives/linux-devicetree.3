Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E743EEAC3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784795929; cv=pass; b=ZP8/WfZ+hcTvWZuEZ1XTTbL8AzCu7EHtwoL54P1pL6LFbvcArplB0hvAkVUJYO0XCZrCBz+rvE9iFV+UvwB7qyI5tkk5uEz+kFCM4EhxSv69LcuklWFQs+IdIpk9sKvLprMJdXBjDbhFlRY+f+zm1MEU7eQJsOib3UAKs/1ahp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784795929; c=relaxed/simple;
	bh=LXNG4juoJR9m6STysTUueeLzB0zjPHuTa0jJDTpwYbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qagHY74nZ2ezEsZs0tnUlL7G3o6eXEVrRXeCYEr9Sk6WazM2PonwzQUWRa929xYb0mmTUEs0dWspSH+Z/FGRIHeJF5zZW/5myzqwjJIbiTZt+fwOkxtuuGHWWDMYuYw2kfI0NBWFxIR10s2BPMWuLyTQp5jNZCOQUEWpyJBiM1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWietTz5; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWietTz5"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so2620791fa.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784795926; cv=none;
        d=google.com; s=arc-20260327;
        b=M7/i+XraiQR8r7sGM/bEwWHSsgat6nmU++q850BC+T4sm8KBPhZ59tnIdVyO65AZ57
         FLeM8GicdmSx2MAMbtt3B/oJBzpXTWXeqwHKcf1mKYwOGT/lqoHdRFFLUwLbveW2PlJf
         23MG0kF2etVC9Ll1/4Kr6R7wpD2EsJwp/d/4jbmMQHgcinxRSgtdemavX916K1duOsgu
         Z9f6el4FHOKv4L3CqomicAknAwTChud3oaXLB+bs8Roqpd1K3noUv7GmvuBcpO8Py4qm
         PGaTqnNihO2gNGkVRHUFKjK/xAPRhcHLmee4zF4NGjeiETysrFajYWPC8sKqHA+958MZ
         /3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JMndNBDrNRSXZklDAozkSv6Z/iRQ8qtJLkHPftqq8ss=;
        fh=fkVRFAxQNsOUYFKoshPla1K4l9j3EpfY/L2HD2Mgmqc=;
        b=MuUiFBmS8qJPCz550J3ZwEMS2FrdiK5wR+K7xXn1TgzvuiVAY0nGJEhtrpxeISmz6p
         XunJ4yOL3HJGH6IaKtzniAOrCIAIm25Ojr0VimGTNTyCEb7jzQJExLOo3zP+pLYz/dpt
         JHoSm81FK1cFGfVuHzV+34mTE0aurwnxHXWglNG572NbWemhBRP6IvfB1SPDLHwcS0Sk
         5d52zDeSMZlCfeZBxAN5T792ZQ2LNYA1CaaYyHpoeSCQ3y1eeBw2ms8CJX5CavA96pIN
         d6nP9q0js95vEJaVUrgOd3Pirdv8oSeWto2Ne6LalLR0dIKDqFVOcMgDNlzgGefG7NFX
         e4Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784795926; x=1785400726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMndNBDrNRSXZklDAozkSv6Z/iRQ8qtJLkHPftqq8ss=;
        b=hWietTz5gX+05TL6DIrTupncjXdhTJiMh7dWVdfggwwL1zaM6pvTFxO02IUdkLMqK/
         pbdW6E+qtkIypsPE9iHdqeGXuTI4Q8yfdsdO0V0wktNd0Jp18kssGW7nN2W+NuTnMDY0
         BITIMOhdBcezHZfIubhQLPHZRAdYIpwJMC6C5QH0rwVth5v4pSnKb49H86NXUviS/04U
         Q79i59SVdOG7E53C/77hIZoSRMr4dNVzqZlA1ELOxvYPvtBsx9+u9t70gmBcuBEjeSyj
         plSY1yxaZkbqJEcShCw8KUYn9F5I8AhH8JKAn2b7sJW3l1tExSlQcyUd5sHntZWSgvjs
         izlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784795926; x=1785400726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMndNBDrNRSXZklDAozkSv6Z/iRQ8qtJLkHPftqq8ss=;
        b=Mtkqk9QBnBPR2atqudOfe3ILe3FQvu7Tlj5Bzu1Ghz4GdS6Xx2HjaNb74vXDv8WtKz
         Dc1U2EyjU2ZwPjs1n1mr9yqz/tNkU/tiN6whMjXqXK8eTwXI199NSSv07ZMpyxem9/bt
         yqYdL5jig9L1jVLNZBIlV+xr/4DUyymlYaeo4a9g5RjmxjR/EHiSb2PoTAsIxx9FB0HG
         5MvFpzw2Dh0tY0jJqRna5bWWZR9tPyjLC1qMU91AxByroV0OpGipQMD6pWD4pbzggsEG
         3M2e/7Ifo8ZvGX63viZskdmdxwi33Er0ZPwn2fNHmjRFZNCkHbrC3Mz8/pgKwunSUCq/
         sIoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrv/+p7i9ydxtmMt6ZCdh08/7kdeXL4v6tC6wpsUgh9LYq/N0FzSoZb46zYKp6/fFywkgDarEK1fxwT@vger.kernel.org
X-Gm-Message-State: AOJu0YyYQ1G1xMphYQycnRG6ZG+IekQpPR1NM+SDIi0yPBn314GDjB0l
	vVeWsgtlzl9q2ie9CzssJbU6RxsULa2PNjUbsBT88RdgiUVzz5G+knxPVRZ9SWISUNptEuKA7kb
	SHdSjboWELYpPknTYpUg8iLXeB9gj/5s=
X-Gm-Gg: AR+sD101zgCP1R9xOwPEo4jg4Z8QTTDjI6NpNXWtdfbflWDYUc/rK5fdtC9+2JozkXB
	XYlcUQt0nd9QzDt5u8H3SVXRf/v1OF38vk2WR9I2qM5tyFQ9AgDKQLK1e2z75KdHxMQPlk6yPPj
	UWvXykyeJ3BNs/5uyTg1qpjNjNSqybROuiP+ZgiqABtJ7aACLmCdXkdG1XvIhRS9prVkMaynw9+
	SmQoxMEbugtnzm+KRvQ7WdkCKCKj4t+nvgVJ3iW90hEa7rl7qcjRIOJnPDa4UU=
X-Received: by 2002:a05:6512:3f4:b0:5b0:7766:54d1 with SMTP id
 2adb3069b0e04-5b2b2f54040mr266927e87.27.1784795925744; Thu, 23 Jul 2026
 01:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
 <20260615-ventura2_initial_dts-v8-2-c89f92c80447@gmail.com> <de6f82c5601a4481e418270171e803340368bd2a.camel@codeconstruct.com.au>
In-Reply-To: <de6f82c5601a4481e418270171e803340368bd2a.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 23 Jul 2026 16:40:32 +0800
X-Gm-Features: AUfX_mzgVslcyDePfLi1-LkdPZo905qgCpAOduekKppC45gZMvMEvUh9-ZO5AuY
Message-ID: <CAF7HswMG1HWxELQxTSaEWVeWi2Mjk8HpuM18AAVLCV5j_r467Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks for taking the time to review this.
On Wed, Jul 22, 2026 at 7:46=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2026-06-15 at 10:46 +0800, Kyle Hsieh wrote:
> > Ventura2 is a Rack Management Controller. It is a modular
> > device designed to manage liquid cooling systems and monitor hardware
> > states within an IT rack. The system uses an AST2600 BMC for management=
.
> >
> > RMCv2 serves several critical roles:
> > - Detects liquid leakage at both tray and rack levels.
> > - Communicates with and controls liquid cooling equipment.
> > - Manages leakage events and executes system recovery protocols.
> >
> > Key hardware features include:
> > - An extensive I2C and IO expander topology to support comprehensive
> >   sensor monitoring and backward compatibility with legacy trays.
> > - MCTP over I2C support for asynchronous device communications.
> > - A dual-flash design for BMC firmware redundancy.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
> >  .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2903 ++++++++++++=
++++++++
> >  2 files changed, 2904 insertions(+)
>
> We now have scripts/dtc/dt-check-style. Running it over the dts with '-
> -mode relaxed' yields 49 instances of 'mixed-indent-chars' - these must
> be fixed. Further, can you please look at the output with '--mode
> strict', address all the warnings that are reasonable, and then discuss
> what's left?
I have fixed all 49 instances of the 'mixed-indent-chars' formatting issues=
.
I also ran it with '--mode strict' and addressed the formatting
warnings accordingly.
>
> Otherwise, there are still some concerns reported against the bindings:
>
>    $ make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-ventura2.dtb W=3D1
>    ...
>      DTC [C] arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb
>    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/lp=
c@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast=
2600-lhc']
>    /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/=
boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: fan-controller@20 (maxim,=
max31790): 'channel@2', 'channel@5' do not match any of the regexes: '^fan@=
[0-9]+$', '^pinctrl-[0-9]+$'
>            from schema $id: http://devicetree.org/schemas/hwmon/maxim,max=
31790.yaml
>    /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/=
boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: i2c@400 (aspeed,ast2600-i=
2c-bus): Unevaluated properties are not allowed ('aspeed,hw-timeout-ms' was=
 unexpected)
>            from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.=
yaml
>    /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/=
boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@48 (ti,ads1015): '#ad=
dress-cells' is a required property
>            from schema $id: http://devicetree.org/schemas/iio/adc/ti,ads1=
015.yaml
>    /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/=
boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@48 (ti,ads1015): '#si=
ze-cells' is a required property
>            from schema $id: http://devicetree.org/schemas/iio/adc/ti,ads1=
015.yaml
>    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bu=
s@1e78a000/i2c@580/power-monitor@69: failed to match any schema with compat=
ible: ['pmbus']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bu=
s@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,a=
st2600-i3c-global', 'syscon']
>
> Can you please tidy these up?
The board-specific bindings have been fixed:
- Removed the invalid `channel@X` subnodes from the `maxim,max31790`
fan controller.
- Dropped the deprecated `aspeed,hw-timeout-ms` property from the I2C bus.
- Removed the incomplete `ti,ads1015` ADC and generic `pmbus` power
monitor nodes to fully comply with upstream schemas.

However, the warnings for `aspeed,ast2600-lhc` and
`aspeed,ast2600-i3c-global` still remain.
Since these nodes are inherited directly from the SoC level
(`aspeed-g6.dtsi`), it seems their YAML bindings are not yet merged
upstream.

>
> Thanks,
>
> Andrew

Thanks,
Kyle
