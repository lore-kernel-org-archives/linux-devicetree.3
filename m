Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8168374A0F
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 22:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781042862; cv=none; b=Y7LfxrkaRwfxeS6xh37bZK/sZOH3UoZsd95rLBQCyhFHFL6Z7tLi8fi1Hv213vVnJqaRSBAjlmxrH7hfgNAphVkn+7B78fqFTpQxtO1/9eGnaSbDl3F0NS752Zbqrv8x67LOvXBjMBnCVN9sA9dX10W1ZooG8HCrIdIZRDb3kk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781042862; c=relaxed/simple;
	bh=pfst8Pl1eMIbnL+CLz2qwcP1CNCJ01jwiT7Pi+Po1Q0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kQ52aoKL8XNtx0T/JCQXxsJJufTuKsxTsH/yX+vUg7mpOrNS+YHCCvvMGQ9pEPmjV881HO4/H6Q89Xo8gfy+EDcxtFP2M+Rf7WmUyxLFJ51VkTdy+8l+nEPzQWZfTEvltPrczo9A0JOx68AtJ8+PBCknhqH+qgECzz12zOGBmVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JSqBpBgO; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JSqBpBgO"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8423f52af13so4256125b3a.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781042859; x=1781647659; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OuxYNglbzg4w1eq48zhKqAxq6WHek0Yx27zZwn93ut8=;
        b=JSqBpBgOpUPU4YnujU7ZlBFkeoQAFz5S2qGBkqf9kyY99omh+7WQ81++jex9DzmoFf
         156HOgHlK3g42NnoqAxLcIQ675bAOoOGfk4AgBZCqaw/CmvopbvHnUI8wYSOIHd3fNEF
         91IP7masUWzLKhb/qslGjsgxpDW1WQg/D3TGvayx5APOHAfJ4bP21kie+4H/u3cb8kPD
         J2C+kpHCKqoMbd+O/uPf7S+DJ7r3Y0FUBNoGxrjYIX05JscBcvTR0Iwlo18igSn1hAM0
         PAWgp50XcBY/z+hCAGkHoQ9YoON24rr8BiakSIVp9Zkaz2OYKP6eKoPdZd9xz7DxeQvc
         rCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781042859; x=1781647659;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuxYNglbzg4w1eq48zhKqAxq6WHek0Yx27zZwn93ut8=;
        b=RkEo/o5zZoaH2hT/7tpUTWX/AtajDPDt6Dh6Cc9c0idorEqAQpQM08EpUWlagY+JU7
         K5pxF4qXTN5B4epzS5s3Vwwf52/oMh7MAq3P9XprM8lZP8Sq4fIJxzNTM/Hr73QKYIjV
         AmY/B59iGFqaDK3tpkVuT10SHkPbfnbJXHyZ83LxWfxwXbgy9IKEPOSdWkz1hK8cx/7i
         zccWsDGtJBC77gEXkp9lKD86NIDipX3ctpFbWC5/959F00Q7qbVJ1+b5/unzDnJvO8Bw
         ZBjt/6FILfZiPsMASQFVH/9pfS4BCRZKYauh4i8LOC7m2MaI7PNksNTImCa8CHZtaabv
         uFwg==
X-Forwarded-Encrypted: i=1; AFNElJ+9ZRv65DrF4MEFNBl8pCXU155j+CzlLP68254X+/GuXKWuVcEyQtc1Mxxnd885g4Zkqxf7n/KNdr+3@vger.kernel.org
X-Gm-Message-State: AOJu0YyVU2NWK5pyjZf3CGgv8tTfQC7gtamJ9TMSx4Mgfm8mffohdytr
	53d209O5EYLkGv2i0Q55UdhPoBE4A0MQ/Sm2gdd+jc043NpdHU5vuP57EJy+dBLA4vU=
X-Gm-Gg: Acq92OGhcyNykyokfdJTmQwUflcdCeWP2RofA6JMYjtL5m7RLbq7vkp/ToGg2XvmT/Z
	OLzvkirKtZ+MGAIiGemOy2a3hDkRhW8/D3PUNAF4xYmh1f+QV3yLIBHJ0YkffR4gfHFEdC5httB
	Y8eK6p/RQEX/UXVzkJ3Y8yCm8Y2IfXzpUygcxCi6FgPGC5l4bjuq4n9kSKXkbSYgWnsZi9F/QUX
	pClxeWlQqgL25BE47H+LfeB3OeipEDwN7ahQD0p/kxWjyn6cV8fyg8QVpV2ZBu8B8qx/jKbSVAC
	ZWfccuL3nC2RzTc473YLRSerzH/dwxO0WZNt02rl5lWaX6wSGz9jYaQ99sLHUgxZsXMtH3jdvWG
	2GXDUsxX+wWToRXYDFux4UNqn+Oa/f2DUky8cYcsrZeUYRQ6/9/U90desE/PHU7+2kZEdhnfw9G
	VJsjAfPN3GNPowAJUW0QXOHsPtkDZWGIY=
X-Received: by 2002:a05:6a00:84e:b0:842:708f:39a0 with SMTP id d2e1a72fcca58-842b0e1e4c6mr24016847b3a.8.1781042859082;
        Tue, 09 Jun 2026 15:07:39 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8428221cc48sm23176324b3a.8.2026.06.09.15.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:07:38 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Thomas Richard <thomas.richard@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, Nicolai Buchwitz <nb@tipi-net.de>
Subject: Re: [PATCH v2 2/2] ARM: dts: ti: var-som-om44: Add USB Ethernet
 controller node
In-Reply-To: <f3280b6f-7cf1-410b-9711-6dfaae2596f2@bootlin.com>
References: <20260506-b4-var-som-om44-lan7500-v2-0-b8af59ab877c@bootlin.com>
 <20260506-b4-var-som-om44-lan7500-v2-2-b8af59ab877c@bootlin.com>
 <f3280b6f-7cf1-410b-9711-6dfaae2596f2@bootlin.com>
Date: Tue, 09 Jun 2026 15:07:37 -0700
Message-ID: <7hcxxzmkpi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Richard <thomas.richard@bootlin.com> writes:

> Hello Kevin,
>
> On 5/6/26 2:13 PM, Thomas Richard wrote:
>> Add USB tree description, including the Gigabit Ethernet controller
>> (LAN7500). Adding the LAN7500 node will allow the bootloader to patch the
>> devicetree and set the MAC address.
>> 
>> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
> Could you merge this patch? Or maybe you have some comments to do.
> Jakub already picked the binding part.

Sorry, due to travel I missed this for v7.2, but I've queued it up now
for the next merge window.

Kevin
