Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ACE1C84A0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774840548; cv=pass; b=a/KBMtpbfy3rTYr3LNagaVmfK+/loBVj2kqo7tD7SR8WrcnMdc+FDSF132VPC91s4Qq2U7s10cyUsr9NRmrD+az2UXPW2UcsREmJpZy+RirzjEItwhtXh4fHzJGoYKj/UlKKrDQT2KxymTSjkMxh8fMTIRX2Kia2eB7072X0UNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774840548; c=relaxed/simple;
	bh=FVMXYmRNSK5Aq3wZtSGqZwzT1AZquu20CiOVo+iR0q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlAPq55k/1m5IHL2Y22ULr50kXvlBVvSeasuGTFrpGdzp0g3+mvoMZnosEVSwmwQ9CHEVDZDzW2ZcMnhEg7OKff3LtR/G+RNqLoCEjL/JpkB97jBMMZho6aMH4ng9ZYV099XbW1XR8fFwYebDWC22/wKq4papbPCAlRsMIKeuuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLb/xTms; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLb/xTms"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso555595a91.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 20:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774840546; cv=none;
        d=google.com; s=arc-20240605;
        b=lE0gtNj2ndcrEs4+aaWAReyuMZY53+Iam4g2sJo+XXiekTfmFwnSfQUiyJ2OZwx19/
         CeQxw6tnHu0o7G2vi/O01z4lpipPFhC73SWgAK+k/Po2hEDKVZreK3X5hoinJw9duV1I
         GowLkgULXco7eYdrEhnkKHR5EjRna8yNltP56CYxLElGtmSUZo/HuOEuuO6Zc02ufoCV
         g/vSO9TNzSHIDKYIdks75pWFx2LhiN1XREcRNSdxxJZaO+apGWZ9ncrfcEv2Cp3jlgcb
         fabjgB+w5lAZ9dgO8OfWPbB4Fw6GAjIdZWp8FY5STiSWAHf8yyjsAxw7Pd2NPrgCR3a0
         wPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVMXYmRNSK5Aq3wZtSGqZwzT1AZquu20CiOVo+iR0q8=;
        fh=QQRcwY2HLFnMUAix6vulkcvEmIXcTUBrgH5da6BsBNQ=;
        b=YXDPOLlNvzHyPcGGziNQzzTqia3km/mFJ8hUMtn+IJuBq5WA21U29fZADSNJiV3fwJ
         rFP7H07Upcu99K5ryznQFecGN/8aSyMw/onQVBZ0H2QtJ8iQ5AXWfuWW7qA08fPIr1RM
         r0hkmCbkEZco+McNKW+FNwVB9cuWMfFhSrrqRUFW8atqf8sVBkxcq/1mZ+XCbhnRxNwb
         pj5KfjvLBkPSktiq/IL7msctmwzbUagJyk5BhfHgXdPHsmVGZSWzE04vv5GR22RnyhPP
         YqjzCiC9bQaRJGajCRQ4g6aT09pwIfO0SS+9YggBnnqhaxyqxymmc+6bb/HlR+6LPSez
         LWng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774840546; x=1775445346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVMXYmRNSK5Aq3wZtSGqZwzT1AZquu20CiOVo+iR0q8=;
        b=FLb/xTmsz4Fz2Wngg78mgB/x5vL+Sl0tcRFreSagxfYbiXsvlWZ2evYdeo8TXIJNGc
         G1S+VeKpoblqFUOqt9WxL3awSbMB6bLxWHORZFrp7VmxI8sx8PqBQ7/8VJA4+OxM8O6H
         FMdl19HM3QhhbmmqS3z/wjx289rvtRSIFi/zyTr0DOhpRlA19q5dsyYGjinLqGCy2AQZ
         QyodS6ekLl48lW7hqd39BqkjBvNC6KJz7rqUn/36qkoUwWFJa2H7CUVfJhK0lYEt3hCS
         bF8BP+5ZL8NRC36rBtNtmtpwoXcMnwT4IOaXSMa3DuzotuHwcUMN/Zsd+grjAKdW3Z5+
         5VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774840546; x=1775445346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVMXYmRNSK5Aq3wZtSGqZwzT1AZquu20CiOVo+iR0q8=;
        b=YG7jBCY7ZSvmkjFbBDfYPR+/PEzsZloKPobLTHXiLCa9Rrkk04j8InK30LWA+CVJev
         oqPHKKzTABqeGfEgi4zL581xZGINm/svrpQfzRWwECtF2l80yI3p7ksCFCDn9umqGlRS
         hKUG1Bt1F6UpqjJ+ihpd8WO5vVdzuWzMpYTGXwlI1w+5xLG5nI9txzaQFm3R4azSIFRZ
         mFiF5OEa+DbwvpmGQdJTx3/NUYkt8fLzagVWp4GhGCyVI1iLBlkqYE2OtrvIojwpdVtA
         3cxVBqO8NyDGUUVoRzbiH+pxwwFRMaadpphr4x5Wk2gSaVU/kVTUUEB68ZAPNffu3yzj
         prow==
X-Forwarded-Encrypted: i=1; AJvYcCWNevbUq8g2Ck4QTGtgApF+zHrVr8h1ylRJXmSmXFb4fZy4v4sjI7sxf7LfnBroBb6l6c4CSRRSSRES@vger.kernel.org
X-Gm-Message-State: AOJu0YwCO8Tp8P9RijDUFvcNI4eCHreCsIl6VRngANvHexC8V5W0ALdI
	X45ymUeNNe2uEIKmAfUa0WYSPZ5T1anxmF95gBZO3bQbUswJvjSb0XAhqJ/7yx5slJqsRUDzDuL
	i/XAs1Kra5y5QywMhjHFJQH+5woNsYs4=
X-Gm-Gg: ATEYQzx9vPZyvRO+tahbQmTjoElt24gS2nMgvHdHZZ3ZEZKruCy43U0I09solA8zrg5
	VaFMCNR+iLsOfEYBaVOU+ht6rbM9avaCn9nzBMfiDXWZ9A4UWACapwxRa8bEoFC+aaZmmVyPAr6
	bhr4VRbRt6wiIWdGbLnR5F6/4uJ8pvJiaozLPqKjb8ABtNNntY7Eb6UpzDUvC0WCK45injLLHcT
	VVYFpqotVLNzXQEUulqGnQon3asWPXbPKSXAYk4sdUi3jIMbrt2THTK21O4R7l86s/g6Q3RTP3u
	9sbnuP6F0J6S05k5wjU=
X-Received: by 2002:a17:90a:38c6:b0:35d:9d4f:f595 with SMTP id
 98e67ed59e1d1-35d9d4ff8a6mr3077625a91.17.1774840546438; Sun, 29 Mar 2026
 20:15:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
 <20260223-yv5_revise_dts-v5-2-fc913e902488@gmail.com> <73ea41bf341df0e3215c58a029c9ea2386c4ef8a.camel@codeconstruct.com.au>
 <CABh9gBd3b9TB1-s=Gq1q-M8bX+4UioXePUF0DPVrU2N3N8S9yw@mail.gmail.com> <d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@codeconstruct.com.au>
In-Reply-To: <d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 30 Mar 2026 11:15:53 +0800
X-Gm-Features: AQROBzAgZ9-0Ybc9ZvULPVMA1y-kfdj-DVMBBwWYIa1fxoX4faQR_SIhsXqj-zQ
Message-ID: <CABh9gBddmoLWyJpuKr8ieWCCHXgPPNn+zCS2WDkUn8x2NBkzqQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] ARM: dts: aspeed: yosemite5: Remove ambiguous
 power monitor DTS nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>, Jackson Liu <Jackson.Liu@quantatw.com>, 
	Daniel Hsu <Daniel-Hsu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 2:07=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kevin,
>
> Sorry for the delay.
>
> On Mon, 2026-03-09 at 11:41 -0700, Kevin Tung wrote:
> > On Tue, Mar 3, 2026 at 6:41=E2=80=AFPM Andrew Jeffery
> > <andrew@codeconstruct.com.au> wrote:
> > >
> > > Hi Kevin,
> > >
> > > Sorry for the patchy replies so far, but this series bothers me and
> > > other priorities keep bumping it down the list.
> > >
> > > On Mon, 2026-02-23 at 19:17 +0800, Kevin Tung wrote:
> > > > Two different power monitor devices, using different drivers, reuse
> > > > I2C addresses 0x40 and 0x45 on bus 10 across Yosemite5 board varian=
ts.
> > > > Defining these devices statically in the DTS can lead to incorrect
> > > > driver binding on newer boards when the wrong device is instantiate=
d.
> > >
> > > There are effective methods of maintaining devicetrees for variants.
> > > Why are we choosing to remove information about the platform rather
> > > than use existing techniques to properly describe them?
> > >
> > Hi Andrew,
> >
> > This is due to hardware design changes during earlier development
> > stages, and the fix is expected to remain stable as the design has
> > matured.
> > Could you guide me on the best way to maintain devicetrees for
> > variants? Thank you :)
>
> My expectation is your platforms move through several design phases
> prior to (mass?) production. My suspicion is that you have sent a
> devicetree for the pre-production design phases, and you're trying to
> evolve that one devicetree to match the design for whatever current
> phase you're in.
>
> So, ideally: Send a devicetree only for the finalised design. Don't
> send devicetrees for pre-production designs.
>
> If you feel you can't do that for some reason, an alternative is to
> have a separate .dts file for each phase in the design process.
>
> This may sound tedious but it doesn't have to be a burden to maintain.
>
> For instance, you can use one or more .dtsi files to describe the
> common components and relationships for your platform. These .dtsi
> files are then #included into .dts files as usual. Often .dtsi files
> are used to isolate different hardware scopes (SoC vs board, for
> instance), but we're not limited to that, we can use them for the
> purpose outlined above too.
>
> If there are only (very) minor differences, there's also the option of
> #including another .dts file. From there you can adjust properties or
> even delete nodes where it makes sense. For example, we maintain a .dts
> file for the latest revision of the AST2600-EVB, but we also have a
> separate .dts for the A1 revision with a different regulator setup:
>
> - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts?h=3Dv7.0-rc5
> - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dts?h=3Dv7.0-rc5
>
> Any of these are better options than this current approach of trying to
> justify incompatible changes against unclear design boundaries.
>
> Andrew

Hi Andrew,

Thank you for the guidance.
We will submit devicetree changes for the finalized design and ensure
they align with the hardware to maintain stability and avoid
incompatible changes.

Kevin
