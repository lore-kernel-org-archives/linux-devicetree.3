Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887578;
	b=ibP2lWjXxxYOZfV6SRC8unpswcHm1+sfJx3wb6vwK9Zf6qvLlqMxocmceIZhY4UcWwYm
	 UI+NdlZiDUdWH+rBaGM7M0b2rZgZokm32NNfBMJiG7gfws/LXQdJSuRFbhY35BOnApzTy
	 T9O9bnvuWKFHd7FaMGHOqimXsrO7BTuZ8GkQgPnxnUU8c+08jnt00w4HnHGJCnMH7/6Rc
	 e4PVRS4KeB1e83ZEikErzJUvKH6pS+u/XAy3L8OOcdMvxBf6426QBEMlkkAMGiL0i5U/n
	 Yf/Jqmtr5UDd+JgXiPZ+j2xtN5iyn6AgfiWy255D93KOouCe3zO3Grx/joLnwrmWuWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UJCvvH2LVzLLKKiKlCpu1moOiFoxJyhCDFLz6en74v0=;
	b=CVC2Zer6zvfTliqC2+urztEgAxNQYYaPHQ6jHDsTjdWjoEyVPimGf604yNEjzYXdNTrN
	 XTQGBMDMuAU59o8DhVbW67YY6Sgp6NX/FKtymyRIA9ezDlMkgHXej+6GASketdTtM67vt
	 gPbtTpp2Eb9VNd5smO3kIiULDccn4pQ1sgSDzURBTmZsp75wtbTCjQ2BtKBBKvGU0Dgt1
	 KOPYtCqvRRlJ6t+55rsGEaRjzHWUAHPiwdXLugGlBxbFPw71RTZN14zMhdWP9wE2+F/b9
	 EWjzj1NlInzdj39rEWo5apLjSW6aAuhjZLz5aK0qEHpDd61LfKsb4iLl8zACHiLiyXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="fOD/4HlG";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B0B606D80D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B0B606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=fOD/4HlG
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214af2076so13907365e9.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793887576; x=1794492376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UJCvvH2LVzLLKKiKlCpu1moOiFoxJyhCDFLz6en74v0=;
        b=fOD/4HlGPz3p6ReV4CfAWtPZfVdjBTvS80aQFytCHG+6jvIftCSh6f33hBH74qDKMD
         ftCb2VZnl35ODwucMVWosLYjOo+gqKLVsfL4wRp+2ScgKMOo4xVnCgqfr8/3m8l+r9/B
         kC2ereSHyGhSuzM9TwXN52enpcQLEgnTub3nyrkWfpPQWnf+4jt6m9gFA7NjfG3ZXmlA
         NYhJmxex+zpzci+DTQCBHdH1/s5ASBB7wxqC0XO8zKYB6o4ySvfD4DC6PLVDtU69CbjI
         8siL3N2z7ShBjJzbX7zhb9ks3cqC79+P2To5mG7LESNlNW+mdoKOvw+RX/ntmvhwfP6S
         0Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887576; x=1794492376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJCvvH2LVzLLKKiKlCpu1moOiFoxJyhCDFLz6en74v0=;
        b=z6NQmOPgsTGLNdOfTDgmGW7IAJBZXrD/tgKwTKpLcZY6TIYXiP4ndQTcy7frR4IVrm
         vIhS1q9OYuIFEdPuws8GJlC3/FApAYMmjSFTzs4YfBpeHgV/jBmekG4LaiwGCyL5Juq5
         knZo9aifZWRuoawe91Akoi6dhW4jJgu6hIHofqRtkmizP9TuzWfAMbMFPuSthWIv07js
         UPZvL3+6mZizxYiimhxwTiQde8CiJkOVnCaDL6UlmUZiiT9h4PBwitOnKK0Oc1sLQZF5
         ebz4TExdwhfAdJESjabi7c5kUKC6NXF7b05jtdVbpkQJ5O+q9xQke2aHeffNvMzOBPY2
         TMuA==
X-Forwarded-Encrypted: i=1; AKwUvBxns5I9ywbPNG+CZOPd3ZAxcz6VeS7N9twFGo5pigcM5QGV8bBRafxW0CQfPKAq7bu+BLwV8b3jBcQp@vger.kernel.org
X-Gm-Message-State: APuU4Z8v69WKDZJ6guo6CtP0t5dXw+pBC9Z87CqiAE+Z9aKc/PxpsV3A
	z4CTyzr8McSa7j+Jf9OxIXZ8XVmak3JM/vwcG4lXL2YcC4fdR/a0Pac9lZtOAiL2N1E=
X-Gm-Gg: AYBFou1mIjU5j7NZUPffKOnL0Ce46nsCYEySD9vDWIoweif0H1SST5Z3Tqg636EZrSi
	FeAfHbb2m/XWXxkujNElXnmvC4B03fCkYzFpoFR2iaFnVXVblcJfLA17nfsf0cBVexCUMv8Tuo0
	OjlJKUBaLctUheOqAikK1F9T4SJMTOhw5eIWDh3KAsD9UMPJyodL0KMh7ylgGvWKJexwCWTAy6I
	pG0sf0HA8xZu5989dnu/AQUsztTz89wqbZwf0GblUFWpBVkfOFlewJ7/LjG+NWiSyFrhM+9xz6Q
	dkfl2wejQCRTJWyN05TrwvkSykhefo6iF2MhU/IKreVWKL6Ez0yPfgzmsn9eccU2/sONLnmQvsB
	j0hGWsT3WDGaqyIKY7ssb2XUdLi577r/0UrkqQ/po3rMwLhaAWDf40XbU/4tFZL53duxqBNEYgq
	plCBQ5Z4ygsF9Y2JxLG3h7OfJcY2XUTf+pVcgDpKek7AYbxEYsECULrc0PVfKWIBnNjpf+4myPY
	LSdLoOE4ItiHAzW69ZZzF5+jzAMVOmaexPpbOASVM0/ei6eBFxrlvwrlpHHcittRzVcWtjLdmJf
	jUh10ffkoPUPN6M9/dk5Go7dtFY6T5E2j6QdvgHNAwvjGnska4XBozjZ7zjDuqn81+5Pax6i6Ns
	aubGfq+d4NCH/A9DfZzA1TTczyaS1tAey1YQ0g5VdN0h6rzY7bX4LPx4CYtebacHTrdHe4I2zeb
	Zjbuuy+v93ySXU
X-Received: by 2002:a05:600c:83c5:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ac17191017mr399753615e9.8.1793887575774;
        Thu, 05 Nov 2026 06:06:15 -0800 (PST)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm59048765e9.4.2026.11.05.06.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:15 -0800 (PST)
Date: Thu, 5 Nov 2026 14:06:12 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, richardcochran@gmail.com,
	p.zabel@pengutronix.de, peppe.cavallaro@st.com,
	joabreu@synopsys.com, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] net: stmmac: support the TC9564 SoC
Message-ID: <auyNVNo2I_Xunxi-@aspen.lan>
References: <20261019030129.1470307-1-elder@riscstar.com>
 <20261019030129.1470307-6-elder@riscstar.com>
 <3d0b17c6-3b94-4e36-b7bc-700211c83273@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d0b17c6-3b94-4e36-b7bc-700211c83273@bootlin.com>

Hi Maxime

Actually, this might be more for Alex to find when he works through the
review feedback but...


On Mon, Oct 19, 2026 at 09:52:58AM +0200, Maxime Chevallier wrote:
> > +static struct tc9564_mac_speed mac_speed[] = {
> > +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_2500BASEX },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_100,   SP_SEL_SGMII_100M },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_10,    SP_SEL_SGMII_10M },
> > +};
> <snip>
> > +static int tc9564_mac_speed_select(struct tc9564_data *td,
> > +				   phy_interface_t interface, int speed)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(mac_speed); i++) {
> > +		if (mac_speed[i].phy_interface != interface)
> > +			continue;
> > +
> > +		if (speed == mac_speed[i].speed || speed == SPEED_UNKNOWN)
> > +			return mac_speed[i].sp_sel;
> > +	}
> > +	dev_err(td->dev, "%s/%d unsupported\n", phy_modes(interface), speed);
>
> Is that "mac_speed" lookup table actually needed ? maybe a simpler switch/case
> based on the speed alone would be enough, or do we really need to validate
> the phy_interface_t each time ?

Once we add 10G PHY support I don't think it can be based on link speed
alone (for 10G PHY we have to write the same value to SP_SEL regardless
of link speed).

However even when that happens we could still code it up using switch/case
and ifs.


Daniel.
