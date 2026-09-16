Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883A351E440
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575630; cv=none; b=K92tzIVWVRJR6iaYh6t57dXq73TrzqwhXZHOH9c/VB8SHoyw4S6AU7Vj7DtBX5PA39vNkQZZIFWUXofggyCMA5z/XQPyPohsVNsFpVrjsKtE2yN/lRDxzywgeofX0u8QGBe2R7SMvo0T34vtfb2EhyUj7h/4dOBq/R4QgnBwofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575630; c=relaxed/simple;
	bh=UsAFZojnkBe7Pc7IV6xVMTqLnVeTSaUXZionFa6MTew=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DgTmiyMalRbjk8qJxFD6xA2XVQEXKZTcES54ccs3YZ7DA//OpAHitI7iHzsWrztqmxekTXSt5JjpweX2ArFg34eW8bSt3eDaUYyb/IrNbDr8IROLdQd2ydhgsedXKiJ4z6CwnRCtBdkNdQHu17s7DKq1GMgREq/+oj/qCZln6vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie; spf=pass smtp.mailfrom=conchuod.ie; dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b=Fd954jfS; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b="Fd954jfS"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so186374166b.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google; t=1789575625; x=1790180425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rUKDm+AL8IancfU7CegZvxZqqpiRkJ0+AnO4LoY/TC8=;
        b=Fd954jfSvO1GDZLdSmsziL0wSWLu/mPIYGzK6SgBg8P4a1Vz0Z00TZP3nwTb1yIHbu
         xxUjm3pmhVfoJ2jkIKX0HvRfPEUeplCiowUkTu66AbjLIFKfIRMlkf/GLj9KY03G0fuu
         mKkV8PbgAW5bdUzecyqQn+10QIhwAZDOkXeRdwbL9KTB3nwTyoEdZ4OBn1LylPVIMPy3
         Jf/jSSOGnvvskHxhAx2RX2+a7IdCUAXUAkSkiAtDBqmZ4h9YtRf3RA8slPxouT7sKdae
         Dyi8v1jxZA1msLPvmD3Cps5O+5n8SZwaR1oo5cfOLHEdI8zRIsKJ0sYAe3aXyD+853Ru
         gJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575625; x=1790180425;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUKDm+AL8IancfU7CegZvxZqqpiRkJ0+AnO4LoY/TC8=;
        b=XFRmz7RyD1D8MKZqpKoBareobi0sxK2HotmGgKbZna/fQ9xwessi4Gd5y2Nvq2ibwx
         EEeb4TCq0ej9ME/UOYV83yZJTr73hGZqed/JlysRZKGbWmOHJ9xg1eSKUOzEYGldUM+q
         ymLTmREOP82+neqi6bT1Fk58am5DnsuKM371lpF8t5VCcERz4iRPPJmSmLWAbkmdd0iZ
         g3ibW9w2RvRSmo28qY6BkkUrgu8jlT3PajErgSvS3LYetqgJszls8ayncKQaReagqu3E
         62D7IWh2XasoAWSU4SeKe/No7Rj8IPPE3cLlPXAoOQ94xpamp3DwodBdLxJoAMCi1gUN
         7dlg==
X-Forwarded-Encrypted: i=1; AKwUvByYX3gZZlpJAwKM6zW2Z3DoPc4l8uSgFyMSI7GTuGoglkIPbfLWmJ8HdLLbx9MjAJdnB7plZKyQvKoz@vger.kernel.org
X-Gm-Message-State: AFuF++m44+Wb45jDd89v7wbNdIIVyurff5MXp7JzPfSCxbBqx0P3KcdI
	M9Vas+3w6PkB1hRupb6nA32y7em6DJSiC8SAF6WB5HZsDy9T7takHacsBKoABTlmkg4=
X-Gm-Gg: AYBFou1X+N7yVObJ90CK1RY3uKTYvjJjfe3LOA6XtGraxwT4vJ68HjzBK4rjAEl2rtJ
	nlJisobJCvRGlRdh72es6mrALHctfAHPn2Frs3CBXzoJmGmfU6kO84p5/WBkKIn32rgHhv1/JBG
	YbMFEQZI48Obtb/aNGKDCg2cRNZuX+VtVmjPd28vOgeAe4d/31eUp2ZKxmibztT40tWCi+oUuqF
	vNXrzMlbCErnpMpaqxEhToR+5hDaQIyssB8xMwHk1zE01OZuvbp2NPwmxbu4hutFtnqPAwwM6T/
	gGPWd6YLFVjvrB7nba+4/1PUYV5Sc+dlvEp+gz7BSNO1v4JoMlNUJFvRdpo2TBmgBQCMnrTeOY/
	hJD/ko8dCQkgMhmSdCW2hHs9TRLMcAAwtwK47AruODZxefLYPtlGMOc7Xsce1wfQvMGeY4qmwVU
	FKlGVmaSIk9sPDHDJyeAMIvHZ/plmtdN4l7+h7Smqj2vDnQoF9oSEC0HdSE1aRXNkpwN969F4=
X-Received: by 2002:a17:907:720b:b0:c21:450d:cd7e with SMTP id a640c23a62f3a-c29e51dbef4mr252197966b.9.1789575625448;
        Wed, 16 Sep 2026 09:20:25 -0700 (PDT)
Received: from ehlo.thunderbird.net ([77.20.9.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5b6712sm173059866b.39.2026.09.16.09.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:20:24 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:20:22 +0200
From: Conor <mail@conchuod.ie>
To: Andre Przywara <andre.przywara@arm.com>, Conor Dooley <conor@kernel.org>
CC: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
User-Agent: K-9 Mail for Android
In-Reply-To: <20260915230127.7aa4386a@ryzen.lan>
References: <20260914210115.28151-1-andre.przywara@arm.com> <20260914210115.28151-3-andre.przywara@arm.com> <20260914211940.256A11F000FF@smtp.kernel.org> <20260915005122.40ba2d7a@ryzen.lan> <20260915-flip-steadfast-9198d002f381@spud> <20260915230127.7aa4386a@ryzen.lan>
Message-ID: <04140E55-E1FF-4B8E-8213-154B588E9E2A@conchuod.ie>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 15 September 2026 23:01:27 GMT+02:00, Andre Przywara <andre=2Eprzywara@=
arm=2Ecom> wrote:
>On Tue, 15 Sep 2026 17:58:50 +0100
>Conor Dooley <conor@kernel=2Eorg> wrote:
>
>Hi Conor,
>
>> On Tue, Sep 15, 2026 at 12:51:22AM +0200, Andre Przywara wrote:
>> > On Mon, 14 Sep 2026 21:19:39 +0000
>> > sashiko-bot@kernel=2Eorg wrote:
>> >=20
>> > > Thank you for your contribution! Sashiko AI review found 1 potentia=
l issue(s) to consider:
>> > > - [High] Missing SoC fallback compatible string 'allwinner,sun50i-a=
100' for the Teclast P80 tablet breaks CPU frequency scaling=2E
>> >=20
>> > Well, there is more to it=2E We should rather add the a133 as an expl=
icit
>> > name in the driver, like we did for the H616 family=2E And the whole =
OPP
>> > table is still from the old A100 days, it doesn't really cover the A1=
33
>> > or A133P values, which go up to 1=2E6GHz and 2=2E0 GHz, respectively=
=2E
>> > The bin selection in the driver is also not adequate, the BSP code
>> > seems to use the SID cell at 0x00 to select one of two speed bins, at
>> > least for the A133=2E The A133P is probably still different=2E
>> >=20
>> > So I'd rather keep the a133 fallback compatible, and adjust the drive=
r=2E
>>=20
>> Can you explain the complaint from Sashiko to me?
>> From where I am sitting, without awareness of allwinner SKUs, it seems
>> like the bot is suggesting that you add a "random" fallback to make a
>> driver probe=2E
>
>Well, this is about the DVFS driver, which doesn't really have a nice
>device to match against=2E The nodes under /cpus carry the cores, but
>there is no notion of a SoC here, it's just about architectural Arm
>cores=2E So the solution was to match this against the machine (fallback)
>compatible, which always carries the SoC name=2E I think other platforms
>do the same=2E

Yeah, I get this part=2E

>And while we have DVFS support for the A133, this only supports the
>"allwinner,sun50i-a100" fallback string, as this was the only chip of
>that "family" at time of upstreaming=2E The A133 is using the same
>die, it's just a better bin, but there are virtually no A100 devices out
>there, as they were superseded by the A133 very quickly=2E
>
>So what Sashiko (somewhat correctly) mentions is that with that
>a100 fallback string we won't get DVFS support=2E It feels odd to name
>that tablet A100 when it's clearly not, so I went with the proper SoC
>name=2E
>We did the same for the H616 family: just adding all the names using
>the same die to the DVFS driver will solve this problem as well, which
>is what I am planning to do - unless people have different opinions=2E
>
>Hope that helps!

So yeah, it bottles down to Sashiko suggesting that you use in invalid fal=
lback given you mention a different programming model, although mitigated s=
omewhat by the fact that a100 is a worse binning and is probably compatible=
 outside of dvfs=2E
I'm just very wary of what sort of garbage that Sashiko will tell contribu=
tors that, unlike you, don't know enough to realise what it is telling them=
 is wrong=2E

(Sent from my k9mail, hopefully formatting didn't get screwed up)=2E
Conor=2E

>
>Cheers,
>Andre
>
>
>
>> >=20
>> > Cheers,
>> > Andre
>> >=20
>> > > --
>> > >=20
>> > > commit 582b866f1ad9000afddf47eb7e4c9d37a95dfbc8
>> > > Author: Andre Przywara <andre=2Eprzywara@arm=2Ecom>
>> > >=20
>> > > dt-bindings: arm: sunxi: Add two Teclast tablets
>> > >=20
>> > > This commit adds devicetree bindings for the Teclast P80 and P85T t=
ablets=2E
>> > > The Teclast P80 is based on the Allwinner A133 SoC, and the P85T us=
es the
>> > > Allwinner A523 SoC=2E
>> > >=20
>> > > > diff --git a/Documentation/devicetree/bindings/arm/sunxi=2Eyaml b=
/Documentation/devicetree/bindings/arm/sunxi=2Eyaml
>> > > > index f04db28c630ac=2E=2E28437c47ac01b 100644
>> > > > --- a/Documentation/devicetree/bindings/arm/sunxi=2Eyaml
>> > > > +++ b/Documentation/devicetree/bindings/arm/sunxi=2Eyaml
>> > > > @@ -933,6 +933,16 @@ properties:
>> > >=20
>> > > [ =2E=2E=2E ]
>> > >=20
>> > > > +      - description: Teclast P80 Tablet
>> > > > +        items:
>> > > > +          - const: teclast,p80
>> > > > +          - const: allwinner,sun50i-a133
>> > >=20
>> > > [Severity: High]
>> > > Does this strict two-item compatible array omit the necessary fallb=
ack string?
>> > >=20
>> > > The sun50i-cpufreq-nvmem driver in drivers/cpufreq/sun50i-cpufreq-n=
vmem=2Ec
>> > > requires allwinner,sun50i-a100 to exist in the root node's compatib=
le array
>> > > to bind via of_machine_device_match(sun50i_cpufreq_match_list)=2E
>> > >=20
>> > > Without this fallback string included in the bindings (and subseque=
ntly the
>> > > board's Device Tree), cpufreq-dt will not be instantiated=2E This w=
ill cause
>> > > CPU frequency scaling to silently fail on the Teclast P80 tablet, l=
eaving
>> > > the system stuck at the bootloader-configured frequency=2E
>> > >=20
>> > > > +
>> > > > +      - description: Teclast P85T Tablet
>> > > > +        items:
>> > > > +          - const: teclast,p85t
>> > > > +          - const: allwinner,sun55i-a523
>> > > > +
>> > >=20
>> >=20
>
