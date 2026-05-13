Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030374C6F15
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676593; cv=none; b=itSzGFqUHvOAhcD7e9nLx9cz2EwVvsvPoY2Zd59Qt4hB3cOlikwwOHwpsQpAWidIt1PvhU9fjfevwh4Oa6M6rGyLuwBTZXEoexypth5fXZsssf94IqzKy3y7jcg/BzrSFQIMPq7OjqbtFNSxgkpJxSk3+NAJMgTqslAgtZseNhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676593; c=relaxed/simple;
	bh=nI7YOzNufegrzrQMgLxNrwAqGVHXqCpVokhfGj2uJHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhwQ7OE4DPmROOY8x60eLe2iK5FFyGlUZKnhPNfiPjXe2qQH3LVsb/PGOO5IlfPPcho59fFvivIOXgdl98WVtuka2szt3wZqSvTeP+rlgJBZJJ2iPGHsu8197jFJoEX2sYZsWQe9SL5PS8vMq2Do1u34WFcDSdf+LjPxefBvdDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=anv6YcyT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="anv6YcyT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so61563115e9.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778676590; x=1779281390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u3zF8kES347TPoEbvDwkqQbzfa05yrB1P5lQaxsmy/k=;
        b=anv6YcyT1kkN39tGg5nc5kZAg7zQpsefqN7H9k6nFlR+iDHfySQCgjAqbF1Vit5gd6
         HGvL00FO0ndFtwsAGqbZi7Lq+ftGXgmMie1BQilW144IsLtBbTz8EenRf2GoJtXZXHct
         8L45vMDjh070y3wWVV3Db08kBBIq0CLPhLkZKaHQuey9Hyn9kLtUPM6d/ueYS1lLmDYi
         DWzO+AFK5ewpdDMcSm2BQfdphnr1Dy5xQINNfDbQhJegZhXsUoscwrcjBPJAQ5hersSM
         Dk6KDwz/c9bXB9CgGMtY4vaFx65TH67HQJC9zt82spg6F/gWQGD3VkvQOfMJy9D4lOVf
         BfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676590; x=1779281390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3zF8kES347TPoEbvDwkqQbzfa05yrB1P5lQaxsmy/k=;
        b=FzwZ6w6VszIEOML14XHQsvSMPSPpl4A6NYWKUAjnK93vx593ESRa2NfHLYHg3p7nAw
         Y0jTmDPsUbcKAUNu+w3zElFyWSRJWgvrx4KpWTRge19u07QS7ij4Y4D6SMtzNhxubYEA
         yAA/+XPWZTSBCefTNeqPM0mW/ESnvd3Y8HjwlFUZxMNMdIm/26CK+EZHs57gPW/dWjRY
         UPr3RhxOCy2GnYzOH9hAzYwY5PmnWyEAIS24O+ASkuFr898FmaK8AtxeY6b3RIvBTAzs
         13TOKOq6t90npOL1ksrKDs1GhpSvxMLnd+Hn0jB0X2v4Jw3upwfk8vnYYmYVorFTdZbq
         w7tw==
X-Forwarded-Encrypted: i=1; AFNElJ9/cDRSOilUie4cd2e3DEKOHEo+V4881on5t/kBK0h2qyV8vcTjNV6Esh9lHpQOsnCjJb2Pn/eQoxKL@vger.kernel.org
X-Gm-Message-State: AOJu0YxLrYooFu5JSEtWIFcUR0dYp5E9KjZw96dzdhgXRdJwXUQO4WtT
	GCwPdX3q+Pn1mVkWeqxTqunytWEBhyQaOFX9daXVZaFzvh4d1oBgz6OJi+i3/whfuyk=
X-Gm-Gg: Acq92OEaR19JN8biAycc6zzJlQV7Uzu6drNYmCVVGR4g1YEeJWYuO95v1qbT+Jwn7j2
	8OW7LWMF/ts2ROH1PyAjHGIhJjknzhB72IMD9041KOZtu+vfdwlyHhdaEhrqRpDcXGD/QkEisZz
	9nVYE9w6JqLE225laxieqb/PpghyEClXXVtAhVOu5xSYCnpWhN4fzNrFKkKOco/nVnbLrwysrR0
	BW5RqYQcgk8L3BjKZvHxe/cCtgiVrRHiudYPH/QvBEWsfwLAbYS8LcfzVDbf2ELk6KblX9pH6ij
	8Th/lT9bvHUQen8p1pVCMzZeOOcfl6S4H2MGvxU4Jt0CtdLTaxnDqkWZZIQb5Lhopd+L2zaapl4
	YfHLWxtb7pzjJUwwRRIatsWKUm3wU4IGrhbA8yX5KVloF+VyBsf/wxow5qonQVKn9RjZNUvpLhx
	m3b9Rl/K+oic6OPJY/Cx55JiwHdiafrwscIiKfD5KJbtcL/uaDFGfy1+WHqUukOBzp5joZCYBjE
	Xxp5atPtHYHmDMlopnG7eHZswBRbXCtuQX/+w3HYc5lehSD4EbNc/E0M39pm+qkhx0RC2I4lawe
	8S0CQkWN
X-Received: by 2002:a05:600c:6305:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48fc9a32aeamr49565525e9.16.1778676590239;
        Wed, 13 May 2026 05:49:50 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8cd49fesm78578015e9.0.2026.05.13.05.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:49 -0700 (PDT)
Date: Wed, 13 May 2026 13:49:46 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
Message-ID: <agRzai1UoHEIotZe@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>

On Fri, May 08, 2026 at 04:03:36PM +0200, Konrad Dybcio wrote:
> On 5/1/26 5:54 PM, Alex Elder wrote:
> > From: Daniel Thompson <daniel@riscstar.com>
> >
> > The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> > TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> >
> > There are multiple builds of RB3Gen2 with components included/excluded.
> > That means whether or not there is a phy attached to eMAC0 depends on
> > the exact board. However all versions include a TC9564 combined with a
> > single QCS8081 attached to eMAC1.
> >
> > Add properties to the existing PCI nodes to describe how the TC9564 and
> > QCS8081 are connected to each other (and to the host SoC).
> >
> > (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> > binding, but checkpatch.pl doesn't recognize that.)
>
> This should probably go under the --- line

I'll leave that with Alex...


> > +	qep_1p8: regulator-qep-1p8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "qep_1p8";
> > +		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
>
> If I'm reading the schematics right, this is only required for the PHY
> - is it collapsible, or does it really need to be a-on?

It could be turned off if the socket isn't in use but it would prevent
hotplug detection from working. In practice that means it can only
collapse during suspend/resume.

However the real reason we jammed this on is because I couldn't find a
way to get the phy/mdio code to turn one on. However it is possible to
add regulator support to MDIO devices by extending their existing logic
to manage resets so it can also manage a regulator. It comes out fairly
clean so we can add that to the patch set and remove the
regulator-always-on.


> > +	qep_irq_pin: qep-irq-state {
> > +		pins = "gpio101";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
>
> There's no pull-up onboard, should we use the on-chip one?

It is configured the same as lt9611_irq_pin (which I couldn't see a
pull-up for).

I switched the interrupt trigger to active-low based on other feedback
on the patchset and the counts in /proc/interrupts remain unchanged
(with a single figure value). It certainly doesn't look like the irq
line floats when the PHY interrupt is deasserted.


Daniel.
