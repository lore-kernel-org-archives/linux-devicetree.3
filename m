Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEEB426D22
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799925; cv=none; b=jdl4xTxh7gHez+B1A38IgMLZdh9rtgqv0jYOjMGyrT9OFJAP8A01nN68yyxPzdWU0mxovdSbGrpVm3N6iDbl3BSXALB55Wr0VVOeWI5ApL1TzEeAlm8uiYhyJMZChgBosxElUjrtaguMTN+CU1K1z5teZXK+CvVAN0ZNmtnPj44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799925; c=relaxed/simple;
	bh=o6Lwomr9kCQRXkGx/1Vs5RaKg0u+FQqJS1OP3nbdFz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzJSpSjFolGcDhNQ6vl5Cj9jdXaPwjdNL9JvFFd8MPgwW9Gf2BCobk4J1C2Gwtd4E0Wrd73uB9FCUATJTsrOk6PBioQM2btB9ig2JSe0qi6feZyfOdOwwdmH3Hn7yLCZD0c0jyCsiLds64ecmUDm7C646AFIfu+2mPA47//sO/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bid0R0Oq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bid0R0Oq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4955158f26aso2794155e9.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784799922; x=1785404722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i93T0tzgCY+DP8cUZolLm0O+1zIztO+HaXRQpxg7jVc=;
        b=bid0R0OqyBRyZSFJUTZO3/rtufQncd33mF5APL3kH42rivUI88XuxtTIHFbBEuxxci
         AD34gyxfG713Os4Anb44Rv2Qp0o4HVINv+XTty1IsniMP26o/XQ8NfFF3wCA88tZ9Lvw
         fuX0LdgQhyYJrPtJ0mYZ5aRFxGV2OOisKpIekmGEdY9a1reOefNVM/XbpuFwftLAS1gv
         DZ6F3x8y6p5z+SXLjTdmVU5iZf4c8fyTBN0VCB2UxSZ6swpqIr4v+0Cv56kQKZlSYIkr
         tWwD9X0ZPN+3H6COlCu28NbzUxNDyeVxDqx/R+fBbMnHdkFLfaq1ZRg44J/joIJvatdy
         LANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799922; x=1785404722;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i93T0tzgCY+DP8cUZolLm0O+1zIztO+HaXRQpxg7jVc=;
        b=YNVFFJ6lrV+LN0AMAe/mQUFfLmsgvYeKoJmhIA+j/LIpRKECuqvQcei1oCdwYgdQqy
         f2b4O1KwiKCzUzAkyP0gO9NUJxlc9lZU3w8NKh4a2j6lvZcnMbzWOLSRY1cBBPaJu4/Y
         4lcSZk8YHynnZBjeo0ymJtuSBYEu3zBcm43zh61BFt4dKvDbLrtJpRZuV5W4fTPGOCIK
         pAcAJwshec8pGpAYPRUKpi1oQp2A8sphC6/SqOrd97rHGY7lV9kMvl3Yqg45MAEgkeAN
         IR+J2Tza3aTOLAYGNF1mB54YxbfMA8Qx3zJDHJDtaQ5OoThA3Rl1Y0V7Dek6nJaX2Dl1
         KdYg==
X-Forwarded-Encrypted: i=1; AHgh+RpzvMujYvW7pxC+hv0NwJPTI/FMQmXSYBfyRq47yvxp6wBzifqaHdreI1z42tcUpxpW1ZI1tPYMPd3E@vger.kernel.org
X-Gm-Message-State: AOJu0YwNTAq4Yr4TJvrrtcawNq4ADTGAHso8OIDUubMAOM7LipaOROIT
	F1phBKW1S75abfmpHLig7Jp+Tuq1t9DkXH+gXgGKdQy52BYGigBhOAGk
X-Gm-Gg: AR+sD11z15iK2KQxklVdSt4N545gcQxHeVGa7LjgiuK4MnWP9gs6kPmBVvm+g5IO5dm
	T1VowKIxeAwtCcam/Yao5/ecHpRLSIxO8fi0h8l9wxcjGD5Fh8Hl0g/soMCytwYwO6IDMJ0mdpa
	NGCG3AZyI0zcLfArUQ/u9jg79HxKzUkdQtdC5FU8O03zyLveJ/s+jrqn/ECSVKit0zNIbXAV7Qh
	n77JGDR9fj8KJhUhth68pEKCk5YP7pBlkNBoFauP6Cl81ccHfX/Jg7TcImzt8ri7zw06T7tsWCf
	K2G45OzJ2yFtqRv58ca+1/4CDkOUsPoSsqAsHNxOLb7gv9a3TwT5nt9sp/rPvlv91r7iG72I2Te
	JWV/P9SfoFqF3Jw99JXRppcnLXpFb8Ic8iGWbBanMZvJi6odrTug+Ajp12wqWoODYDednmobiid
	csZLIDH6GlM4QMUAlkh0RSxJN+PFRQVw7ssRbiWP1L/ucaffu39H/x+jHS4HRFPZFy0FbWrtIMk
	rQHi4wowmZj
X-Received: by 2002:a05:600c:858c:b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-49573cf6d48mr24942485e9.22.1784799921848;
        Thu, 23 Jul 2026 02:45:21 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f11c:ec01:4d68:7f50:f537:5e2? ([2001:9e8:f11c:ec01:4d68:7f50:f537:5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b0395f7sm90229315e9.3.2026.07.23.02.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:45:21 -0700 (PDT)
Message-ID: <beff7c47-ef14-4108-a350-fb07bd56e166@gmail.com>
Date: Thu, 23 Jul 2026 11:45:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 1/4] dt-bindings: net: pse-pd: add bindings
 for Realtek PSE MCU
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Sander Vanheule <sander@svanheule.net>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, Conor Dooley <conor.dooley@microchip.com>
References: <20260715075530.2491534-1-jelonek.jonas@gmail.com>
 <20260715075530.2491534-2-jelonek.jonas@gmail.com>
 <b3456b41152613ed45bcfde92aff89d0c33fa243.camel@svanheule.net>
 <3f71640b-9f22-4d0b-9c4d-dc64c397d286@gmail.com>
 <amHEgOAWYXYuZwnl@pengutronix.de>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <amHEgOAWYXYuZwnl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksij,

On 23.07.26 09:36, Oleksij Rempel wrote:
> [...]
>> Correct me if I'm wrong but from what I see, most of that budgeting machinery
>> isn't used in dynamic budget evaluation strategy, which is used here because the
>> MCU does budgeting on it's own.
> Hm, I guess the wording in header is a bit confusing, I see now the
> misconception :)
>
> dynamic vs static means - haw available budget is calculated, not where.
> Dynamic can be implemented in the linux core too, but so far no one did.
> Static can be implement in the MCU firmware as well.
>
> In static case - the Powered Device tells us haw much power budget we
> need to reserve for this device and it will be permanently accounted.
> Advantage - every device will get what it is requesting.
> Disadvantage - we do not use full capability of the power supply.
>
> In dynamic case - we do not fully trust the Powered Device, first we
> reserve requested budget and then start measuring the PD consumption.
> If real consumption is less as requested, the reservation will be
> reduced.
> Advantage - more PDs can be attached.
> Disadvantage - a spike in consumption of one PD, may kick out some low
> prio PDs.
>
> Since the dynamic case need a lot of measurements, it is usually
> implemented in the firmware. Both strategies have advantages and
> disadvantages and MCUs may allow to change the strategies, this is why we
> provide this information.
>
> In your case it is not documented, but it can be tested if you have
> enough PDs where you can influence the load.

Probably takes a bit of preparation to set up such a test.

>
> Not sure if we need an UNKNOWN flag to tell the user - we do not know
> what to expect, use it on your own risk.

So dynamic happens to be the suitable case here right now, because the core
doesn't handle it yet and the MCU does it on it's own without the core
disturbing that?

I'd like to avoid dealing with that in this series as this seems at least to me
like another deep rabbit hole. The MCU comes always in kind of a
pre-configured state, having several limits set so it should behave safe
and mostly as expected without the driver changing anything.

>> Using vpwr-supply on each PI still buys that the
>> supply is enabled and ref-counted by PSE-PD core, and keeps potential for what
>> might come. But no requesting, allocation or deallocation of power.
> Ack, in many cases it is for diagnostic. Please note, a "manger" is in
> the practice a multi channel current limiter/regulator. It has maximal
> load per chip and different max load per port. This can be properly
> reflected with the regulators. 
>
> For example, RTL8238B-VB datasheet do not document maximal rating per
> chip, only per port. Calculating 8 ports, with 36W max, would result in
> 288W. It feels like a lot of heat. Can it actually handle it?

I can't tell, but I would guess so. Several switches I have use a single PSE
chip for 8 ports. Given the advertisment of 30W per port and staying within
the overall budget, I might expect to be able to use it. Or the vendor hides
some information.

> May be the MCU firmware has integrated maximal power limit do avoid HW
> damage. A proper information in the regulator tree would help user to
> understand why not all ports will get requested power.
>
>> Given that, I had a closer look at PD692x0 and it seems, this has a similar setup.
>> The difference here being just that there's no multi-manager concept. There is
>> also a manager-level supply reference "vmain-supply" which the driver reads
>> and applies to the hardware, which does budgeting also in hardware.
> According to RTL8238B documentation, it has same multi-manager concept.
> Since one manager RTL8238B supports max 8 ports, a switch with more PoE
> capable ports would need more chips.

I see. I mixed up the terms and thought this "manager" is separate level in
between. If "manager" == RTL823x PSE chip, then it's the same setup.

What do you suggest? I would like to avoid doing any half-grounded claims
or assumptions here while not fully overviewing the whole picture. At the same
time, I have the feeling the datasheet and host command guide from Realtek
are genuinely trying to fool me.

The setup seems to be very similar to PD692x0, we have multiple managers,
managed by a controller (the MCU). The MCU mostly does runtime discovery
of the downstream managers, so right now there is no apparent need to
have the same manager + port definitions in DT as PD692x0.

In reality I haven't seen a board which has different power rails for different
managers. So there's usually a single wire from the PSU going to the PoE
daughterboard where everything lands on a single supply PCB trace. The MCU
has a multi-bank concept, however it's usage right now is rather confusing.
Managers seem to have strapping pins which tell which bank they use, and on
the MCU side one can set power limit for each bank.

> Since we already talk about power budgeting - all of this make sense if
> we have port priorities. For example PD692x0 firmware has default prios
> bound to port numbers. Is it the same with this firmware?

Looking at several switches, by default all ports have a priority of 0 assigned.
Thus, no pre-defined prioritisation, it's up to the user to set this.


Best regards,
Jonas
