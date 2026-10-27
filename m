Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122368;
	b=x+HPRwfNvEPzcfofb7kW3NOJHsfSVe2L0x/VcBKQYnUrvXWRaj6MfKXKo20AvPzF7dVY
	 cNwq/sPxVQNQ4dzvDi2jEhaX8SM1T5zPNJepR8G4Ih+G6t5S+lFtgqMLp4brDBJRh/16g
	 rn/AEXFCi0k20X96454lw4plxL5AEfb8rcj80w8PwVKQXb3j0EIKR5RtVz7Wa/vH5jlZI
	 mMHEE8D+QZTW9lGSWAQJ1YFBsKkuRlo3v+Vf+kVT4NhU1Ao4ZfV7IVZuuDIYxnA4jOyCh
	 1mVqVSlD4IwllSWj0wgUEDULYqqNLrOwRROmuCrnNFHCd79YwPFZleyOLFKhjXa9IYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
	b=De7eZvoRPIw6rW0DA9594swXNxvbbgkflzRLrkJki/lRj9EDSSphwv2+Y+enYt1dHZgT
	 8P4Hjb+L4rD9AlA/z6jZqmQj1qYSaUwTFWjq6hvdKFyfSW2j3ySuKnpxKCnDz7NwZUqBq
	 UyOboCQSjR0su/qMCW3/x0D2wtkj6FiYSEmiKlyfA/Hb0FRBpsFf6sj80Tkyf1fzu78I6
	 WvPJnYrtuBkCNhHxBLfOppWYh1mUztNE+jCPON4WAZqf3MPFdEaU0O9A6Y1RLUoR1U+zs
	 S/Yv2ognEJFMEjInM4CHgvTSMK6TKJlnkd0HlnrrYGmLawTa5Jrt2n/2G0Ub0nQZoww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IERQJ8SK;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348F6606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 17:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348F6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IERQJ8SK
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so719765e9.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793122366; x=1793727166; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
        b=IERQJ8SKVi7acDhRQssNKz1tac/IbKaQ1f3zM2O6OFxp7pR62BajqEQCEG9JaHuJ0M
         nQcwhrNTXW9RxyhteLIPA9LNKH3J8QG6lRhv0OL4TUC+apZBNfnCpD+BF0HWr/VmHLKj
         QLLQFq36t5Dn2Lbi3bALdp6V6iWGR0HV+f1uumVypHlLGv2yedaXHJ1JnI/oj9ZLGnjq
         QVjST8/BTNTCaXMtA8cSAV1xFORYJbiv1UzZNmsysoTn46/NG8HHUwfmp1BBp1TrWO6S
         RsL0VSK+XetFWxWIQrF+txjov/HPcyrMrdiw0sWqufM1K3ER+n4eY4ikpmfRoDWv53YC
         TSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122366; x=1793727166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
        b=OaYjcqRl5wizKqJblO7+fZ4+sIcGP3qxMtyF8B8bH78swYaV5C5D3BaUNv6UCOUdZG
         w+a2mihldvub79TubA6srXy9IlstEJL8iNKTTW1nAK22LnZ5HdMu+zFtQXLTeL8B+KBY
         K97oJNrTbsU9onQzGvIHHjFiVTRF1xfVGS0XBy5pJDXUuXDCQ5tlK96HhranpTPGlkk0
         vl0z4wOKwR2Ju74/eaYLL9HF1W5RX0h5+EDS7Y36F94KstoIBGmGV8w2TKcJBmA7pgtD
         OgaTtNjUYOhZ22sUz97dPGdlmJHcaUZEwW75QI4PJlVKx9ZXq3rTTgy1XjZsbclNQr/u
         vqkA==
X-Forwarded-Encrypted: i=1; AKwUvByjleHes8Fy4/L2qrByDj0lDfs2NaTGzI3bWiOldY7O9YE/RRFf3qYslg9g/fkU7/cPE95sW7aFGhEM@vger.kernel.org
X-Gm-Message-State: AFq9FYKw2v3vWkGbiPAEw5DE4hnZc1fze0xKOVD4rguW3w9Orrut9N0j
	Zkwa0IJeE7KmE766YYrniGRe4xt2cPdsqhN6Ho+rYg9Z9fXeNdYIXaadkNr/sTOuhTndC5cSdYp
	KMmDCxpQ=
X-Gm-Gg: AYBFou2Rk5O5FAnjDYmG5C/uWJkchFHCofetodE51LklUOUgft5kSzy7djBrVPmMCfg
	UKW9rbNE03H90NNeVtJNQqFhMZV2EvZvVQtRPaGBgXDiYEguU4Av8QFhZfMlzzRFCVzcHffsLOB
	8TMpz1UlEHEf/VJNHRuC2m+8mJxxoBqYgd6zFeOqXvai5JBUmdtmWqCtmLLcngXv81orllTB4s3
	r0dT1+LwfN8R6iW3xxzZqpUS8ZXTPFA+4aKM7FC6lpUsItWhbNZWWMpQkcmPzpFhoIHXmzqovOU
	z5iBrVhTgYeJ6Kl+huCDKE3LOWJPzuEZ1YcXvbvqCZfgBYpNXfkwGuYrhY6UNRv60ZveLLBI304
	D10DqewxXAm4BkvcZZfIvfQcj9ZXAZ81WhbxA+Z/gM+20Z0RtKz2gMTfmBAm7natwbdPklqZjTm
	CtxN3b1gRgJibz3yXSOTmaUQZaKKTUdYcQOcN9LnKwkTWQ2UxS8f1DhhjgiL6Ohr+wCV9OMbsAJ
	e29WkPcANGYbpwiOPMQ+tPfpPz3oCMqbNzm5saxLP6WKhN+7nSxBO0=
X-Received: by 2002:a05:600c:4ece:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4a35ac9d100mr198532065e9.7.1793122366508;
        Tue, 27 Oct 2026 10:32:46 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92b881f90sm5173585e9.11.2026.10.27.10.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:32:45 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 27 Oct 2026 18:36:37 +0100
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auDhJbMOQ-qAeBBs@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
 <auDRHk8eaYife2zH@monoceros>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auDRHk8eaYife2zH@monoceros>

Hi Uwe,

On 17:32 Tue 27 Oct     , Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> > Add a hardware monitoring driver to support the fan tachometer on the
> > Raspberry Pi RP1 southbridge, found on the Raspberry Pi 5.
> > 
> > The RP1 PWM controller block contains specific MMIO registers that hold
> > the current fan speed in RPM. These registers are periodically updated by
> > the RP1 internal firmware based on the tachometer pulses.
> > 
> > Since the Linux PWM subsystem does not currently offer a framework for
> > exposing integrated hardware tachometer readings, this driver is
> > implemented as a standalone hwmon device. It parses the
> > 'raspberrypi,pwm-tachometer' DT property to find the supplier PWM device,
> > establishes a device link to ensure proper lifecycle management, and uses
> > RP1-specific PWM functions to retrieve the RPM values.
> 
> I wonder if the tachometer readout should be a counter driver? That
> would allow this driver to not be specific to the RP1 hardware.

I suspect the counter driver won't work with userspace daemons (e.g.
fancontrol) which use hwmon as an interface.
OTOH this driver is indeed specific to the RP1 driver: the fan rpm are
read from the same registers range and hw of teh PWM controller.

Regards,
Andrea 

> 
> Best regards
> Uwe


