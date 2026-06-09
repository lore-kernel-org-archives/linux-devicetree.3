Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600493FD147
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003828; cv=none; b=q0N5e9jPr6kZ6wbNwy0l1rJAc6VBzZDsElsHwzxZ3Vpst9M+tpuug1j7izBxxU6chP1XMcS6tYo7VEXBDVv57dkzX6c7VfzrXpJa43cHuVUK2dfDUW0PF6Rr30IOEx+KRIPMp1iiq32Wce38aPheUcuhgDcWHq/IvX6xed8ibhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003828; c=relaxed/simple;
	bh=LKxo0fMd2e5AxYLGvb9IhES/FecwFKryZEiDRHJ+mlw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRuYV6+6vtmfawx76XPkc6ITqerCKiD+Mm+gKW0nHlEhTkLCszoE3DSZNCXKmRk5j0ECzyoAd+gLXKMOjCckiVB8b7o5iJS3eRo3v21T11Y//FWf0CaUvKR7RiAsv732TebaZM1RyC2rId1FjZnSFFiwLDvzf6D3FI+lvVdQjBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZubZSRdo; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZubZSRdo"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so10127301a12.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781003825; x=1781608625; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0R1/uOav6x+N5u8la1mzmW5tGVKOxiRp9V60pMgD0IQ=;
        b=ZubZSRdofBGJQftKMUc5iy2QOJ2xfy7ayJgwhOzg3sJji291iZd4dFwgRIADlxzQT8
         /xeEQ4OAYuH7rkpf02eXFbCvdRzHuxMoTK4czdIr0shQfADihfMDpSYxQrV1xK6HatI9
         QsYh9fDuffomalsZMEY22EZAvMpJoztvnb1kx0DaIK7ePvHCWw41T6/R+ZrFwIcPLYMq
         wDCFeZli5C0ZbXIVyStenJFJzu6rm2+yYxtoAXkI84NmfoWtedZaGPBZHRJEFMSjU1kB
         TZOlMUK+9aCPd/BdWmD3XJ97+g8jNkr1jIPDU1AYYN8+WYNG6do3FH31ypWwrxHXfp8L
         bmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003825; x=1781608625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0R1/uOav6x+N5u8la1mzmW5tGVKOxiRp9V60pMgD0IQ=;
        b=lFQsREb2j47CVssgf9AFNS5WWWBZrfdbDRzskdOvtM/9PfmLfAdQxMndnzM1ok40UY
         ousPGq+5sNH+vyTFSuhRWOC3CpPzj2RRMZZaf9hsi8Vec6WF4GWomFObKRa4dgU89OOM
         6bobSnUpVHwU0+gZtsdSJolec7NNzcR9y1XuS68OHzekQmyuRycas2naqS5VHUhV7EUy
         GDFgatCPDG79Zq9Maljn2pI2afznqnqui2D0GrROZUswCcKUYLrrjVt3L4l/qRs2v3Rh
         /L3ojjHEmkQHzf/6reWsqQjswHmRhGk1+m1Z8ygYpbDBkfFO5FzefGke9/Irlz3vzw3J
         8F2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+9NXH48PwKAQNKbtxqA8m6sRMGwM1SPy5QrWwxz7uVhb2cPUpy5meUeHkDBYs56AiRSK936p7abzij@vger.kernel.org
X-Gm-Message-State: AOJu0YxdugM6ybDmRU8OIblnstxi0wzpNKNcTnBzB37k8c3Cc+JreanM
	sGQTPvDyp0Et7afQkuZOhuVIiTbVjkpbc2mM4Po5+bEPGsCtoOJydfMn
X-Gm-Gg: Acq92OE7M4wEmKhUXzkvKEbs1CHPaUrA+grFcvVSk0AB3xG1vuH3Jt094AwpJXr50wm
	rxqB1WWwMlOfVBcZoRmpR3UM0FjM8iQ6vEu0AwzQWta2ZYziuuFN0G8vIR/gySTNzmA8RnMTASc
	TGPMBctOJ8WyzVxZzEdzPbsfjG3bBZecmpzNgetIFS7Q7qRqft+jud8iOn5sap7PgrZiRJm1ieH
	4Zgrj1D39s8t06Flvy3fDhgLUUDxRx4ykB1+i1k7zGFUw9g4YFyGXMLnm91ha/DGX7NtP28F44V
	tEa5q+wM37yidCtuGZMLofCD1Ohfq2EV86p2mDdFl+y0ud17FTq0mTZgGnSaKOaGaKNyF614JgX
	DQRtkJf9683X3p5WX1K3ve13Z8EBNQEmhoPqFiaZo/Ypuq9FivJIDYVhUYbs3s9vgSuf0sclMNR
	9BepB8zbVxs5Skj0EMlwX3l1X3ICnEpXtAL+a+3WG4cKmzmuwlp0d1HvjivFIkfeMok3/pS1pi2
	/4tlDdXTXMZVTB+Mn5EwoTobEXVTHMJML3wGnha6Tk6dHCMvacI8pRyQSok
X-Received: by 2002:a05:6402:3905:b0:68a:c316:34fc with SMTP id 4fb4d7f45d1cf-68fa4e27b23mr8291432a12.9.1781003824324;
        Tue, 09 Jun 2026 04:17:04 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2f34asm8762792a12.4.2026.06.09.04.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:17:03 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 9 Jun 2026 12:17:01 +0100
To: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>, 
	linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v2 06/12] iio: dac: ad5686: consume optional reset signal
Message-ID: <ltafhuqwbdnj7qadn2p5f7exwcpz4fvr5jaizj7q4peqgt2x4b@z23ss3usjskv>
References: <20260609-ad5686-new-features-v2-0-70b423f5c76d@analog.com>
 <20260609-ad5686-new-features-v2-6-70b423f5c76d@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609-ad5686-new-features-v2-6-70b423f5c76d@analog.com>

On 09/06/26 10:29, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Premature reset line deassertion during power ramp-up due to the use of '_deasserted' combined with a manual pulse.
> --
> 
> commit 61717352bc99739a9f89195c3320a934e033ad38
> Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> iio: dac: ad5686: consume optional reset signal
> 
> Add RESET pin GPIO support through an optional reset control, which is local
> to the probe function, and include a delay for the required reset pulse width.
> 
> > diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> > index fc3863274b291..700798b80f044 100644
> > --- a/drivers/iio/dac/ad5686.c
> > +++ b/drivers/iio/dac/ad5686.c
> [ ... ]
> > @@ -506,7 +508,15 @@ int ad5686_probe(struct device *dev,
> >  		return dev_err_probe(dev, -EINVAL,
> >  				     "invalid or not provided vref voltage\n");
> >  
> > +	rstc = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> 
> [Severity: Medium]
> Does this prematurely deassert the reset line during power ramp-up?
> 
> Because devm_reset_control_get_optional_exclusive_deasserted() automatically
> and immediately deasserts the reset line upon acquisition, the reset line is
> driven high while the power supply is still stabilizing, before the 5 us
> power-up delay has elapsed.
> 
> This creates an unwanted rising edge on the reset pin during power ramp-up,
> which could cause the device to enter an unknown state or latch up.
> 
> Should this use devm_reset_control_get_optional_exclusive() instead, which
> does not modify the line state during acquisition, allowing the manual toggle
> sequence below to safely reset the device after power is stable?

It has been discussed that it is better to get deasserted and manually create
the reset pulse. Will move this down (after the fsleep(5) power-up time). Or
better move this up (before the regulator enable)...

> > +	if (IS_ERR(rstc))
> > +		return dev_err_probe(dev, PTR_ERR(rstc),
> > +				     "Failed to get reset control\n");
> > +
> >  	fsleep(5); /* power-up time */
> > +	reset_control_assert(rstc);
> > +	fsleep(1); /* reset pulse: comfortably bigger than the spec */
> > +	reset_control_deassert(rstc);
> >  
> >  	/* Initialize masks to all ones */
> >  	st->pwr_down_mask = ~0;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260609-ad5686-new-features-v2-0-70b423f5c76d@analog.com?part=6

-- 
Kind regards,

Rodrigo Alencar
