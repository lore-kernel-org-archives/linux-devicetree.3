Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702458;
	b=a1PWqSxSfIboZdZJpKutHM70BTocrcPDvWUA0OOkDzmcMoXUk+AE20XB63oQLUfoQidX
	 UTWhX/HJ1bBj+0T/1sQ5cs+vkD1aaHzjR0FV8WRb7PwIsW1ZJlWd5xs1h4SJgZ9P4SaEq
	 MCXcS3li9JTbVY+7lgYd0ae0UUq/pRxPWN4Zezum/hBBENkxfUYiGkhI5+y9xue40gXqW
	 r4Hf/nLh/J/UfFdjuvOy46YrLqcu7dcsHt6sa6hBK3xcAbrDERQMHSqcGxMnxuBc7M0Yy
	 VrZ4ckdzkLSETfZMHroJS7aO2NkucN04/h9b5CUIQwdfu2eQS2TVdpZaKwJE/7wxN9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-Developer-Signature:X-Developer-Key;
	bh=QR2Zep7WrET0CztFBu6FKrEoP6m4586wAVNxVzFnIm4=;
	b=HAIa4oYdGPOsJpIeclQdCkPI8v+24v381yuYNr9r/uzovk1vHcotbUrCiw7tBBz5f9o3
	 DBpY5NytltyIaSJbNmNAnceCzseoyB4QCqTCgg93Kfy2myMmipuwic2nloDN0kuu1n7NA
	 SBT3YNKlxI5UyFLsmbWvBDc3sNKiDtNhAlq2acQLneL3D0U1xbivu3GE0a3maUzzAsr1J
	 3pX9RUbxILBaBnzCjyXoyfOBXp5hgrulcpz1F3HsT1J5oFjnurSozqXW4j6ReuQ/vHmDA
	 Lj/QqUw87d/NYm5XGvgRslCHaWq8ZaMDUh8H4myOuva1iIXWk1U4DJnfJrp4JS2C+OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0idu334;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F70606A68C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22F70606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0idu334
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c516a1623d0so767550266b.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702457; x=1796307257; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QR2Zep7WrET0CztFBu6FKrEoP6m4586wAVNxVzFnIm4=;
        b=K0idu334bSpfGBR0F0IYK/uVGrqCZPY4ujKWd/VHRNCL6NYtr43SwKrpbOq6N+8JRB
         qmbbsU/prQpWdMGldd3KQsHz+ytZnPm/TZxBRcOV6Zu6f3B5ok6GXyiw8F5x9x6YcVON
         Y2FJDG0Qu8jskxNrJRQ78B+SyWI57oQTjBX77Gp5Q8W1SSF6qJOxSFUEAARog4F3JUWY
         4DfohQzZfUHVQ35szCWkekHUIvSagFIsbINmBhbrQH9Ia9t8zs49X0vnaXZl/jbUukd8
         p/Lne3QK2xDEE1jE6Syp+ZFqFbj84qD3K37CZ9umUyw8mVJczAh8YCiNY9g86zDeWBQw
         U42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702457; x=1796307257;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QR2Zep7WrET0CztFBu6FKrEoP6m4586wAVNxVzFnIm4=;
        b=SOXYuy+qQukTX5QmRyxDs0X21fSDvJK6Qtu+ekEXbrXDy8goCvhpQ8g9VviskZNNsY
         dJGhLmGN9jGYOln8ujdJ5Q+sjNp0I3wweKePVriw5EwUjYe88CJdvDFmNjbOExpIAj4C
         uovmfIdd44zHd7ZVfE0vxM2ibvcZTsy3FERdKUf/9jTOO1e2kKroQdEnkQg12KdHrDzU
         dHOolNj08vETXsHdWLyHRlMfzQGR57s50KAkoYjjiNrJz1K7QsJ+yx+zisPbOFnjKpqo
         6srY4IM1WgE7sJuE+/eCmeLnB46k+fgrC8tRPTrmpkrG7N7U/lY9sWDDDok3rBimYYRC
         WcHQ==
X-Forwarded-Encrypted: i=1; AL+hErGH28rA/x6AurEAvSUk5hvGVXciv0Sv0OnQbAnH17YHyB9/acd53oqKnPm2RTrFaa0+XpBLTHzaOs8L@vger.kernel.org
X-Gm-Message-State: APuU4Z9lgRyRWNhSodzTx3JsAw0ZXKB1ejupmeLq6W3DcaMz2N7Q/f19
	aUGTl7IdcKCLLADB8CbAWgINkit5W51rzccRRsVpgjL2SPIv/V+I8G+0
X-Gm-Gg: AZFdTZdLjx62k86VECej56A71Rjrk6NgLCPVGNgoYp0UA8jPQTe6d+l0O1YLK/Yfli3
	csMsaortW17jVHObjCDmF/1vX28NEtvy2JJizFPizzo6JQlPdsjMea4AE0qBFiKowtjS4h3B8KX
	WblC3AI0SuhA+LKQeiwJdlCa8ctd945IvKmnwR2m+FSRYfEV6v0B2vlnjvb8GkpNDxIMo04AbwG
	W5qlTdixHrM0tPmMXXXUmqFoM5IkkQu8/YmcFYy8dh6kX+nJdMi+/24JmW5m1I/Yw4Q01CXtJSD
	iVSlqRl6yIBmJUDnqOTTg4OMBNIBqG0VZtZq9KNEdSkBMJ9mTE0eKpjjj3C4ZY7qohVkngNZ5Nt
	2DPEAp2GBPwcCosstk3KxqWXzhFo//tGM8BbpgituJhlzVWeYsO8hTO3GH8AdONU60uwNxeFv1z
	WLxha7ipO+jtOGUmuR4us3kKQK2YcnV/uGiscmKejKU4lbB7ZIY34E+JKOVRjOjKSWS6DAVJMgM
	5oC5SIWI4Jz+MYjH4sPT8khqP1G2ihQMHge0zThOZOjQWJvMYhMPozoumwSMHgMhJkthCG9Qvjg
	jQcR1Vn8kUybY0MmGAlJBxMe5BLuR2x9zlgfnmDO/L3vBn7wz/B5TH8K+yT48g==
X-Received: by 2002:a17:906:c413:b0:c4c:b4fe:c9f1 with SMTP id a640c23a62f3a-c513a9ac859mr1344463166b.35.1795702456400;
        Thu, 26 Nov 2026 06:14:16 -0800 (PST)
Received: from localhost (184-9-209-87.ftth.glasoperator.nl. [87.209.9.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm743886466b.43.2026.11.26.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:14:16 -0800 (PST)
Date: Thu, 26 Nov 2026 15:14:15 +0100
From: Robert Ijtsma <robertijtsma@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] iio: light: add support for ams OSRAM TCS3430
Message-ID: <20261126141415.116a2eb352e6@gmail.com>
In-Reply-To: <awg91DruXE0fZ8l-@ashevche-desk.local>
References: <20261126-iio-tcs3430-v2-0-6c5329d20919@gmail.com>
 <awg91DruXE0fZ8l-@ashevche-desk.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795702455; l=1816;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=gNevY/tPkIzLk3f0o6o4Y7qPPhRcZrsoVhWvo8HivFg=;
 b=fy1yfUaLT/e8BPA21k3+df6KxpJ4Oki2qY+gQEouQ+efr5runxF1u6NsBA/iCjPw2G6SgtOEs
 03WFO+EA3ZrBzOXEJ3/mjxBepVG5yd5YfpvMM7X3RK7fjemVP1QW1xF
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=

Hi Andy,

On Thu, Nov 26, 2026 at 04:10:28PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 26, 2026 at 09:11:46AM +0100, Robert Ijtsma via B4 Relay wrote:
> > Add Devicetree binding documentation and an IIO driver for the ams OSRAM
> > TCS3430 ambient light and CIE 1931 XYZ tristimulus color sensor.
> > 
> > Tested on Microsoft Surface Pro X SQ2 (SC8180X), where the sensor is
> > connected on I2C at 0x39 and used for ambient light sensing.
> 
> It's still unclear why a branch new driver. Can you elaborate on this?

Sure. Compared to the existing ams/TAOS color and ALS drivers in
drivers/iio/light/, the TCS3430 differs in both register interface and
sensing architecture:

- tcs3414 and tcs3472 are older TAOS RGBC (Red/Green/Blue/Clear) devices
  using the legacy 0x80 COMMAND-bit SMBus protocol (register offsets
  0x00..0x1b), different ATIME/gain encodings (e.g. tcs3414 fixed
  12/100/400 ms steps; tcs3472 countdown (256 - ATIME) * 2.4 ms, max 64x
  gain), and RGBC channels.
- as73211 is an unrelated MAZeT/JENCOLOR XYZ/UV sensor family (I2C
  0x74..0x77) with banked config/output register spaces (0x00..0x08), a
  1.024 MHz clock divider, temperature channel, and 1x..2048x gain.
- TCS3430 uses ams's direct-addressed 0x80..0xdd register map (no COMMAND
  bit in register addresses: ENABLE at 0x80, ATIME at 0x81 as
  (ATIME + 1) * 2.78 ms, CFG1 at 0x90, ID at 0x92, 16-bit Z/Y/IR1/X data
  registers at 0x94..0x9b, CFG2 HGAIN bit at 0x9f for 128x gain, CFG3 at
  0xab, INTENAB at 0xdd) and outputs CIE 1931 tristimulus Z/Y/IR1/X
  channels plus photopic Y illuminance.

I will also note this distinction in the commit message / Kconfig help
when preparing v3 (alongside adding MODULE_IMPORT_NS("IIO_GTS_HELPER")
for CONFIG_TCS3430=m builds).

Best regards,
Robert

