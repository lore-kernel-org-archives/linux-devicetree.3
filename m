Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E9B403B1D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093228; cv=pass; b=nlp9K9XX1erpNHCqi0i/DEZlXcnjJIXmoSe0dFCm85PLa5BROkToN/BHqwPXh/rX/X3iMKyqoT9NKFLGK9STwInvDa47AtTCQCD2J3t0nv3MuiGyhtJH071Dk1FxqbT4aT17jg6UEvWpJZWPF+7cDdQZNJo02qtx2Ge4Siht5ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093228; c=relaxed/simple;
	bh=rPBVbarQJunKddhuJZ36mYpeExA3zm9sIRg7kXIiufE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qY8XVQqjMi9b7KTjvVhlFsctxkCBEl1cPHievq8b+Dia/PihAjd9X9JUD8AOf90AG1yXp2HwcEqIM0pk6gz3GfzPHZ/Ry85jWmi2kX23zic7akH7yemBuanFSsffXecTgmihGkHTL12kHr5s2oBEV/h0Vqt8u95zEgFGt2m46uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sp2UbMvE; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sp2UbMvE"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66049669d78so5937209d50.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781093226; cv=none;
        d=google.com; s=arc-20240605;
        b=jQ+HDUe7Q+58hhh0L8teQ00Sf0rFyMDmas3BHR77wzotvDghKd9a3NumOoUwTdyAMo
         NYwW+Gf8LqwLu3Y4sc3JjKEE4C+igHxMz6NxyMUsHdpsITJx15wsNg1+q60Sa6mqVfgl
         yU+qKtmExPKeNS09eVLqPSbnNVxSUyBhxYJopmGMtR565O3LKOzVw/T+v80VULcLvE+r
         KLK8w6UMhl8zjKUCDaFzcyufRzhq/VNHiFm5rLVhXIzVdHCwPuSb3n+MZcyImnzTR+jc
         FFYogdOY5jWy8T1zO3+WaI/19RWtGyyiBww2yYx8XTLTslfwS9XAB3sf4+hczvDZgbwR
         3OUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rPBVbarQJunKddhuJZ36mYpeExA3zm9sIRg7kXIiufE=;
        fh=dZx9gt86beA2bol8Xx7HGFMDK/zw/9cY/CC2kixDLtw=;
        b=FTCzL48Q5ztLDfHLl0aSRdD0jVMHjETdg3ViIEOJq0yesbfLhLU4CTp7Jh3x2o8cv2
         NHgk8K8GuW+w6+ZvapQ++emQHIqd0KOC2/fAiAf0mkP1Wjq6wzehfvFnv3B5ybURAlkr
         JPsLrFUo9hMg9eapsaAW7jlu09gpzwPW9Q5yAHfo4V85B/3SiVXck0AlD3A50JOOpN9e
         jowcqCJTWTpwhWqZmNUZhR67o1P22w3xhmC9doaQXzppWo4wS6Pj1Fjs8CZrihHuwRaC
         zVKD5kWhyJrhxzWYtyeK8QzNr6k3TLg69pC3q/VbW/YG0mpPgEXE7KkJcjA3aT/T3uvP
         Y6bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093226; x=1781698026; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rPBVbarQJunKddhuJZ36mYpeExA3zm9sIRg7kXIiufE=;
        b=Sp2UbMvEwjbwDOyXCQgs+QC1ubM+FItEiywFLw6LhQ8aitjrJvWCAdWlOaOBtSnp34
         p8o3l+Q0zSXjP4zsmpOeh8yBltFJusF87r6aP2/M7NpXFMuwH5ZH0PJ5EhGXKU7n4jnw
         C45g8cKfy6Gza32RrLXDXDfFqedaPykhS67MJ3KGDR78Az/NSS8rzj/eSXARKFkPD8Ul
         80FZjgmX4G/VmfYcoRgyjtaMRbMtbiuwpQ9DWtdV2T5sUt1TsAuZ1Sd0i2N9dqThjkLJ
         bGUJipQC8BpVWCh034SX0aesOCJoxwbf1u6CDQGEtn20ES6ytNVdMkEmlt9kKixmeNQE
         XYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093226; x=1781698026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPBVbarQJunKddhuJZ36mYpeExA3zm9sIRg7kXIiufE=;
        b=efq5ElsWDwcstbk/DjKIxxhfeA4OhQsACc8YShCgheFbhO/csGfpc8Gc+YVU7pvodQ
         VKjX/rDB0WGp7u/J7wfDNM61F4PmrwoOp72T62ZdRjRfgu21TRo8EoK8KSWz0ATc4eBD
         dNBckwXrFDZYovkosln3mZSr0m+7C3hX5RKh1Y7D1SP+L42WKZpHwcyX12ydkFht2R6y
         5rFMKsp6IBqiDIG+iaKvt0G+F+G82XD595m40n/2j0suntEZrQuQFxO9rdubDsHPTSE+
         jufyxAoYWJzP9aVt41gxOrNQF85uDkwvKdP3hiUrVi5GY1Mqlf7NdvT2SEiawbVivQIN
         M67g==
X-Forwarded-Encrypted: i=1; AFNElJ+HQXnmim3QYtWUBmQxk4jAYN6HPCnCX1QxOsqAy5H8fQJlrdSjUMxCD30Ub3xZPSbMn+Ku7XxTsQIc@vger.kernel.org
X-Gm-Message-State: AOJu0YzXTt397h9tM+a1AU9lM3ikrsIpfAI9bTBaYYcixoEGnkwValSv
	khMuOzMA0UxRDdFHm6H4jtYn107jw3CC7fV+enVylgLMQGcDvoOLu1dSavdt8UN2IIHusmMnojh
	0J00VxL2LNtOq8HYFYoYB5V1dhTnm8Tc8Ig==
X-Gm-Gg: Acq92OHr/MyGfoCchWiKoDrg5TOXDHiK1n35XSgL6CJ5S8DTJe4Y+U1vun77V2QoJ5t
	m16ywnI781bIAk2KfpSbuKLWpnFF1FCr8O5yQi5k9XVQI6fcDehjqAYM+DqhwQ84KHvwzjYgspP
	Ypr0s9JI3E4Y54IZWsXfZhj+ushaINkEsjlqlSvBBVJV5REpd92W+xS8fUuBw90lnsCPJ+kGZC4
	gZSKrbknNWmgvbs3pSe3ej6Cu+/GOP5/6zEDHN5ooDHZ2DTk+PpxJxOgH3lOPEG2ZsRawUWEeUn
	fSCDB1t+8fZGstEhidz/
X-Received: by 2002:a05:690e:134d:b0:660:433f:b0e6 with SMTP id
 956f58d0204a3-66108356dc3mr21625926d50.26.1781093226210; Wed, 10 Jun 2026
 05:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609163919.3321228-1-tmaimon77@gmail.com> <20260609163919.3321228-3-tmaimon77@gmail.com>
 <ff53862950a6075c43bb8f1e47c14389d6fc7575.camel@codeconstruct.com.au>
 <CAP6Zq1gBcSEQznnQ+awrqacBXjTOWELQsMLDXL1yw8_daCzMOQ@mail.gmail.com> <8a059e3a4a3338bc03829071a720012bd426bf6d.camel@codeconstruct.com.au>
In-Reply-To: <8a059e3a4a3338bc03829071a720012bd426bf6d.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 10 Jun 2026 15:06:54 +0300
X-Gm-Features: AVVi8CcbfduWf3TegsXkab0KWg7M5FV7yhmspd3KQakMOXk24-UcA1-8_To79Tw
Message-ID: <CAP6Zq1ic6nvk4JFTf1Re1ySqsYmWdP0ZcGOuUWccS0mfY31Mtg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com
Content-Type: text/plain; charset="UTF-8"

will send V5 soon with message modification

On Wed, 10 Jun 2026 at 14:58, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2026-06-10 at 14:56 +0300, Tomer Maimon wrote:
> > On Wed, 10 Jun 2026 at 13:49, Andrew Jeffery
> > <andrew@codeconstruct.com.au> wrote:
> > >
> > > On Tue, 2026-06-09 at 19:39 +0300, Tomer Maimon wrote:
> > > > The NPCM7xx FIU controller driver gets its single clock with
> > > > devm_clk_get_enabled(dev, NULL) and does not perform a named
> > > > clock lookup. Drop the redundant clock-names properties from the
> > > > FIU controller nodes so the DTS describes only the resources the
> > > > driver actually uses.
> > >
> > > The devicetree is a description of the hardware in the form documented
> > > by the bindings. Generally it's not right to discuss Linux drivers
> > > here: they're only relevant in the context of Linux, but the devicetree
> > > binding governs devicetrees over multiple projects.
> > >
> > > From a quick look it seems that these names are not described in the
> > > corresponding binding, therefore no drivers should be using them and as
> > > such they can (and should) be dropped. A driver would only be worth
> > > mentioning if it did use the undocumented names (as that would be a
> > > complication).
> > >
> > > Can you please rework the description?
> > do you mean change the description as follows
> > "
> > The NPCM7xx FIU controller nodes reference a single clock,
> > but the FIU binding does not describe their clock-names properties.
> > Drop the undocumented names so the DTS matches the binding.
> > "
>
> That sounds reasonable to me.
>
> Thanks,
>
> Andrew
