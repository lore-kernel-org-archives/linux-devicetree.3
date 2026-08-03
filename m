Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC2742BC4F
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780221; cv=pass; b=TxFfp5oSiC4XuHE/R/qKk9BUDhscr6UGq8UT8Mq+VLFWTQIC1Lk7qu1X53wAztctfrN0oXAx41/mcrferjvZmdnGDj3gu+jaiBgprHe42X0IkbpEN+d9b2rvdYNOxQww2hDckSIUNMdaZwQilqtArbm+9Auou0HnEoirKxY4+SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780221; c=relaxed/simple;
	bh=ACfuI3AX9kRQ1+CBBBf5za/2rVC3FsYXI8omco7jK4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/K16t8cykR6VXhIhckYQIrxiqNyvPvKjltdyYivEkp6gBcR9KqWtcCbpJ9b+22bFaEmEq338AtY+S5uzDq23Rt80U/x3TzOrrAGXhST6Et2Na3zLVrGpC0Eg33nzkM/zfFo+QEaL7Eh17u12B6Lq5di+jX1Duz79P+QsbzjGoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8rdjtCS; arc=pass smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8rdjtCS"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7475a4f8b05so2003187137.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785780218; cv=none;
        d=google.com; s=arc-20260327;
        b=CLSRYbcetjbt7nS70HG4NLwyYuAZfXvPbJZ3yl3NVaYAOvKGRkGYg9CX6InJ0aUL0J
         alKBr3MT2acpi+jIlY0BrvBtX6YV8bQz1cPM4Ui2UBYMqA55MKkJ2xy4wOkyaiHSZRyQ
         uvkXvX5PRtscqBhni8UGs32meX3mQ6jYkrOHIypQvtUvDYNInJtJHNnKq2megeqrHji4
         t9Wetg8xGqi/eSzHQrHDYyl+ldVcBCrJ48zrH5eXxpzaVklxv0OpYFLZBR3s9UFQIUUF
         qPCzzp0RYQ1U6s5PjsfKdgDyi8Gs1geKAew7P7E8/6WdquQLvRvr22EJf7o6CnhKl+ge
         aDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        fh=1qxB1R5ZafDf9anS57ExW7GfGxLxoqF7jElxbs7iqxk=;
        b=fkb5PtHUEgyRc9Dk0MyI62YKH9fJPPyGw2D/4H/8CAYh5GzmmTU9NL1F4UBVDEl5jh
         Zk06x5OfX0hO1bOMfZcVMfDa74+XwlfGB6FBsEKQz/TfkDRZGHV/rN2Kg1q7WcE7EnN9
         XSIgIWcv9DhuQNWyDs60LYz3DlxyZTSEPLFzOtdMkj9mv6UFFJ2BVTPf/XFUdhKKQ3ye
         34DcgOTK+gP9LOP/d6s0/CxaL0odtY+v76uV8oVHKuW0kS3BQxCH/UF/ZgVaqf97OWbj
         6CCJw6JaMP4/5/1a/7ewuc/b16aUeZEfY6MR7NgN58JuN6Q2+T5Zn9FXlG90smgpyzEo
         Pfog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780218; x=1786385018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        b=X8rdjtCSlSv+4fH0zqn/t1oQJctljVdd6i+nB9p4sblbQltjHgzQk3we5TxCPwj7gt
         SbRoev7y85CkzLEVDfAIXCGPjsU2RWS/XhyVMFb0lVxlGI8XvhInr3mjgTeDhMYbmyOJ
         rGlofDzjTHTcYGkM3HYJTwDLk3zwe77ZgAxRu8B7hNr5JuJFGtsPd0q4w1k7QgGvFj0w
         EsENgbjrOZ2gjvYvTtwrJPogTH4eaGWBSUfrwx5fBR4BpJiyqN+EOb+0WCOWOnIraheg
         HPMPrD6E8gFLQvWaC9XtnUL8L4t6TDmtROlli3oKaz0byG4Y+XLHywFJsfAxxnmNDxLZ
         S9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780218; x=1786385018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        b=IlTNCTrIXropIXpQDhJ33ETCQmEkOiSzHTz+oO3L0ZTX+IcPcnAvqTV5kQCVpzvfWm
         sGfccN/+6Me6NfzcRaqj/5aVR/boljeX25Cidd34du0AnpRPOgzB+nJQwlgNcFJrr5xX
         X8dWAGCJuUAKZBxQKJqh9A999vAZbLeIXQDHffnDMPf7sIC6dIBkf5cAH2gJCtjWYNIN
         ZKMOSHkIhmnG4nxREVmFcFEBQz65hCAzYpfjHm8rFmNdhF1jOF5RI8wAvSfx1uTsEgqW
         FjqpPcVTzjF9pGQUFPNf6NVcaANLNSNeW803lT105CBdFZMifdxDNPSTAgcW0B+tzsGD
         4PYA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+bqSIKePrT264SK1XPNcZPZuB1WDpFghE9cEihHgVvsJxKO2yVIeA1DchaNmmAF+PE6oJ+8ZsJLRT@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJyk/dm+u1XrM2uAICvh5oxQoXXtPBG2BU7IjmMH7mhHEEA6W
	F3Fm7hhx8gGwg//WW/vycuAq47E+yuULP64/kuhKXUheFd9Djx/+OIJ2YdnpHLsw0YOeTxFysQ8
	I3npPqZZBp534lgoRycIU5Pfvn6Nxeng=
X-Gm-Gg: AR+sD12UE/yLFcyw5PZbOeBRafPFRqLVK+p/ccbNJz5W1L1n9Rfq/JREG+SvRDZt3pH
	jbuDrjvb+HQ2wjvfZU2s/LUugi3JX35airqAQhEAuZRATi1b7/1vZFdkGrKkfXHLMoFyPmWmaci
	QQ7jwG+PU3jZ9QYIsyHnvbs5fwkX9cllC9wPgT1b9J+tAlSxGs7ak5mGmQMbJmuJBewXLk8ROrj
	wpXTCH80hDmTwm0JkTSYcSPC5fs7ZiuPSwiYwfUyD9IrjZhwaJj3pJGahZL7rYBx1s0q6keKuRy
	3q4kHTr4ANtj+WJA9L0Na2+VXVGC4CtAg3uSFwC7hIJ49h2/I9tIUMDvDGB0JIvxhUHeg9V7TPk
	g1X18sS1pDy9DLis4art+56k+bT3Fi57mZvzIsxXj3o1LMgzZaA1tonGJfYawxJQOSNnKZZ+bwt
	ELFJviBbYi9l8TRvXizfcCeE+eoqmeIqkmxgyiyxFXzYPHFelV
X-Received: by 2002:a05:6102:6899:b0:726:8813:2085 with SMTP id
 ada2fe7eead31-75b23d6e2d3mr8230898137.13.1785780218392; Mon, 03 Aug 2026
 11:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-7-0a53cd9e21cc@gmail.com> <2979768f-4f83-4f28-ace3-826f4b4c6844@lunn.ch>
In-Reply-To: <2979768f-4f83-4f28-ace3-826f4b4c6844@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 12:03:27 -0600
X-Gm-Features: AUfX_mybO2gp37G6C7TCuAPmk0gNUYqtWf9KEEokxzjK6lix8AMcIQeuj4MOO0w
Message-ID: <CADvTj4prV688JDR-QAuNd+jTVFyE9aicRaciqq0M6sB0V2GiXQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] dt-bindings: net: x-powers: add AC200 EPHY control
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:40=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +  phy-mode:
> > +    enum:
> > +      - mii
> > +      - rmii
>
> Despite the phy- bit, phy-mode is a MAC property, it defines the MII
> the MAC uses. I would not expect to see this anywhere else.
>
> The PHY driver is told what MII to use, phydev->interface, which takes
> the values PHY_INTERFACE_MODE_RMII, PHY_INTERFACE_MODE_MII etc.
>
> Please explain why you need this here, why is the MAC nodes phy-mode
> property not sufficient.

I have reworked this for v2. The phy-mode properties will be removed from
both control bindings and their DT nodes, leaving the MAC node as the sole
source of the interface mode. The PHY driver instead passes
phydev->interface to the selected control provider.

There is one ordering complication: the control block must be powered befor=
e
the Clause 22 PHY identification registers become accessible, which happens
before a MAC has attached. Early discovery therefore uses the hardware's
reset-default MII mode.

For v2, I split the provider interface into separate power_on() and
set_interface() operations. Once the MAC has supplied phydev->interface, th=
e
PHY reset path calls set_interface(). If the provider is already powered,
this changes only the RMII_SEL bit; the normal phylib soft reset then
completes the handoff. It does not repeat the full control-block power and
reset sequence.

>
>     Andrew
