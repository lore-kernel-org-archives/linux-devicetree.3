Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030AF3CB56B
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180632; cv=pass; b=hk8vu5hn8uUHhKxMOxzsqwx23rU6VvIlCgEq6ekpxLI946z7IPDiGD1sZhPefVrmfWFFimfQ7r87F+LZnYtJHV+IbOXIm68fddOPGhV1nG44OVk+00Bc6nh4B3lVwQ6X7gGLhmp13Y3otZU2PRTB3AcEoZo95zEPPJhdhobfIgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180632; c=relaxed/simple;
	bh=o2UJylUuz6w51NEA/fkXwj3lLUPFl66l4s+47Rkdu88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2wSWt5FvrnI7aa8i6J2Y71kBvZZz8sDD201C/hzz/NSD28Ib9cMghAjente2Sjb5d2b3/vy/3lQWv4T2xWFcDO5W1sfghiRX6yap1MkSxxjNVJP9bEArgHRUdAZbNegpDVwM6mTeRnrOeES81s1/XigExKJ5d1bb/x3ZMyeB9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r11thk7N; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r11thk7N"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c197e7e4e94so499119766b.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788180627; cv=none;
        d=google.com; s=arc-20260327;
        b=Bw69RqmrDiDGq+zIO2KRpYccBzIIJI+wmjGZ3HITYTFwLrAE+6vQwv/hjGK2CG6w9p
         aruKBwsU1BEQPCH8N/BlaCNou+G0MIXDWvVU70fWLlqilR+hQyrsQIspCxgYoDgH7OxM
         0y8E6q41P4ntK5G8ps0whV/1R/C2s8jq11+up8RaCajWrNGvC4PkNRJh+BYhbOVLJP3t
         AB8pdq6hLGNVSMyaHRov4u6RWPKczMfvZccdO74XPQFq+HAA8qzvNzBoetyBlu7+el6r
         i5piT1iGXPK/tDhgwW1SdGm82b1CYiN7XERdjWeJ/M9dW1HOLb07CLEs7EjD9d1E/2wi
         F0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQtOWDkW+w7ybqaZBfV9HKOca4eSda4cgJxTQC5fkhA=;
        fh=E7UbdN8770Ev+9Q1OkeLv9smVa2cGhc5lSP0KWQBhLU=;
        b=LXFa5m1q6Uiyi42it6sw+Q6c2nyVtDnneM7aMWG5+9iCahdcnsNgnEIX41L3HkPo4U
         Otvbl8M6kmINhVjxT4g2excZAzV38Gd2jCFMdH7gqiIe4iFaGkmsKcynwlPwWz/sBPSO
         hefx57+6u7SHqwgiBQmxWsHKHiuM8pUrpfkojVzH1k142CWmxb4tfUs+Qng1T5ea4SLo
         nS1Hj/ZQQR60vy1ta3GEFBkEUkdhojdHE8Qm6SUiwpOaEveEM65BhqSiOwBqAAV7quQd
         6OArjwdnLLmZaw2i0jP3QKizZU8IbZr4JXIpWccwWwMqggHZ5UlrrLryXUbOpOkGY3sg
         0UJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180627; x=1788785427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQtOWDkW+w7ybqaZBfV9HKOca4eSda4cgJxTQC5fkhA=;
        b=r11thk7NKsuIeGqEhv7ZfDJ1L32RquGeaBeHaHY55k2VhJ/Ex33OYciywswYL6wtJe
         xxwI+w9q7goqskWLFVVUpWEPeCvXvabyrdib7ZfyD/HBaGwkXvhuDyRrWKpL95MrcyYG
         Fcwbcjvp+gqbE/WcAPhWIfNtSnu2Kdb2vAfrkJLKLjDEp9rdqGLVZNBrfs2YO0iO1war
         4MOUvylEbZdGUtAu44gPjwm9zdyDau/EMwpRwMg+LOVQAg1Sd/Sh6cGDt48Qfwgd7JfW
         3p82YWLAKe17dbHtq0oGCcRWsUADr3KwC28csWQuc9aWsY/GwSy5eALKM2yAqZcA04HG
         axmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180627; x=1788785427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQtOWDkW+w7ybqaZBfV9HKOca4eSda4cgJxTQC5fkhA=;
        b=JpZ61xSSgrGpkFjlBH3nckdCDkJT49B9m/bI52IVZPAOseBn+ni1uyRPVAnSUHDBPi
         E5q/xC03JqqiCoU2yuDsw+FoXDrFLmEldCrWNVo72jLnfAFkmdr2aBaM9u+EN+5uYF/c
         B5Vhn2T9P8dCso9mtONQyIwF5uKPZVmsPjafmlwLwRYB6EZse8Nj4Do/zj5KNKko/zst
         I0xNDrNYVGit3up8uXp5fuQscAMwGkZl4RNtRJqw0DLC/ZxIVHNzvj3cAOwVzBPYRXEk
         KwjcSwrz232wtxhcNoWriQ19Mf4znF0BHxtRmtYL5LtM8flj61d2XqXwgnjJK4NW5ozZ
         ZBtw==
X-Forwarded-Encrypted: i=1; AHgh+RruYdEe3joFHupVlT4dU/Kb4UgIgCFtkKueXq9SQY31pptTYZyjF5VtCPUybNisMAhlh8v2TssI3eFm@vger.kernel.org
X-Gm-Message-State: AFuF++l56/BelfeKOFNR8pYzz6wmPt5p/OxF4BV55eilUbquLMlDWFll
	tSAjH9bbi7etn5cEKRifuFdVhzPdUsx9mDZUPzAgGB2urW9mIwmHFTfucUavnUoBcc4Wmq/RZRv
	v8p+2cCEdMtBah+XXGw/TqnKxHK6DVsU=
X-Gm-Gg: AR+sD12yXR8EbiBAPoWzZSbLb4ZymcIoi80lLCI+K0o1OGQmLOIYteUUnzsbqbpzvuY
	bI+M2Fp2x1S3n5rGslXgkP/cOb6Wzk083ht34fT3C883rwsPySBt5sE9VfGYrzU5KSbmqSm0k9b
	9Wpaq0K+opGPDm6rH2Xr8S4ocKASwj11CaGlG8LId1p2h6s8gV2jIwjimIGUHcxkrv8X2Ba4BLC
	1f+qZjTL2dDCWm3L/PHHwpqZrWdX8U3BEClXkWMiikCGpgwISmOQeQRkrNFlRsj3JcMXjvIK5N5
	IBmfVwUV7AKmM/xoCBbgfzQhkns1l11qc4uxbhKGf9K0bw==
X-Received: by 2002:a17:907:e917:b0:c15:f598:60c0 with SMTP id
 a640c23a62f3a-c2556c61b53mr1648394266b.4.1788180626731; Mon, 31 Aug 2026
 05:50:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch> <CAMFFDGgTnNouukst3V1rEg0NCNMW-BZ6tM6+fbQc0zeXaOb72w@mail.gmail.com>
 <daf98fe8-70f9-410e-8a2a-042a671086c2@lunn.ch>
In-Reply-To: <daf98fe8-70f9-410e-8a2a-042a671086c2@lunn.ch>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 18:20:13 +0530
X-Gm-Features: AcwNN1X0boEpGKg5x_16jtNRieTR5nthk-taojlLL5pnPEzmWybbo4sOjQPV9Io
Message-ID: <CAMFFDGgaEXdCdoi3av+HSLfUCZx-_0p4j7c5bjwiq_F08et2AQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks. As I mentioned earlier, I had already found that the AST2600
has MAC-side RGMII delay configuration.

I will now check the actual delay register values on this board after
U-Boot has initialized the MAC, and compare them with the
corresponding U-Boot configuration. That should help determine how
much of the observed behavior is coming from the MAC-side delays left
configured by the bootloader.

Tan Siewert has also confirmed that the RGMII traces on the B650D4U do
not provide the delay, and pointed out the difference between the
SoC-specific delay handling in upstream U-Boot and openbmc/u-boot.

I will investigate that before preparing the next revision and will
remove the RX-only delay claim from the current patch.

Thanks,
Prasanth

On Mon, Aug 31, 2026 at 5:42=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 31, 2026 at 06:43:46AM +0530, Prasanth wrote:
> > Hi Andrew,
> >
> > I do not currently have the PCB layout or trace-length information, so =
I cannot
> > prove that the board provides the TX delay externally.
> >
> > What I have validated on hardware is:
> >
> > rgmii: fails, with RX CRC errors and no valid RX traffic
> > rgmii-rxid: passes, 5000/5000 packets, 0% loss, no RX CRC errors
> > rgmii-id: also passes with the same traffic test
> >
> > This shows that the RTL8211F RX internal delay is required, but it does=
 not
> > establish where the TX delay is provided.
> >
> > Given that I cannot provide PCB-level evidence for the TX delay, would =
you
> > prefer that I use rgmii-id for the next revision?
>
> There has been a number of threads about the Aspeed SoC. It typically
> has delays enabled in its MAC, by the bootloader. The Linux MAC driver
> does not disable this, nor does it mask the value passed to the
> PHY. So you see many Aspeed .dts files incorrectly using 'rgmii'. Over
> the last couple of years i have been pointing out this problem, but
> nobody has stepped up to fix the issue. Most DT developers just leave
> the Ethernet node out, in order to get something merged.
>
> You case is interesting, because you are not suggesting 'rgmii'. So it
> could be there is more going on.
>
> If you look in the email archives you should find the information
> about where to configure the delay in the hardware. You might want to
> read it out to understand how the bootloader has configured the
> hardware.
>
>     Andrew
