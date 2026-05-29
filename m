Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293018FC97
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064109; cv=none; b=o4LZaFwV+W6W5ZZEimO+XfMPHBlqry0t2l2cABIfk2fQC/Q7IGYVx9HI6CRcSrRqmwcC1DDfSrY4TST2ogqyq7GMF75Ia7TRpeXbg0GCfEYXuZm7Z/0c+9JgDJ/hqrWtF8LS5G78uSzLz0GIQvOnNRyqJuS3RWT+HYSQgpLrLN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064109; c=relaxed/simple;
	bh=dD8VZwZ1foMHGV6A2t1e3zvHqcJycA2iok4+0U8/zT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sy/uvC7sTOD7otoKxQFEClyAzzpDJuha2/h5JNbpKxgYvrz7CJi2Cio3UZzT58ZbCpSp4lhVR4A5jyAPdI0znBDxF8NOnZhfI4ktofs3PinS7TAgisG6B04oZhwg1S2O9GhDu6gJ36lTazj0l87zTDTkrDdlQm+wfMUh8dczdqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=sWhlUHpH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="sWhlUHpH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so94452385e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780064106; x=1780668906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W47nz7+ZSiqC1F5GhlKMt1J1pKq4V8TQOQanS7X5yXA=;
        b=sWhlUHpHdoU13Jr/qEYMp5F8D8AB0CKrYpSj8QSVog971loxAu4Isg0U1Q4RSOSJ36
         AI1M1tHb7N9If7t6kV2Ex9ctfphfh2RCHRlOmLRUFJ6i6WBlHm8AUFm8855S7pBfRKRW
         AKos8Ftw6FDXs+3qbHdx9WZEn/Nq+uNOH6cO4p1JJJznSYU7hRMgkGBq4eeWlGQenMvl
         jjl5x8ibzioehtcgD9ZQ4GEI6+qv+WIVeptOKbj91utFG+STpYhRRDioB+Y6Eytu2vh2
         QTqudOvSva1H1ifufa6PFP84ozHK2xM5XdalA/yRVwOyjnSuKshcWByRKWPg55gmWdMD
         t4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064106; x=1780668906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W47nz7+ZSiqC1F5GhlKMt1J1pKq4V8TQOQanS7X5yXA=;
        b=qsZYyD/DsWP9tyeio3G/+YMhgAkcvYpijIvfzYvEUAvTSYnjOpROFOTuAiV5sNPcPs
         sPGG81/RV3fV13KvAopmFI0KWgOwBzd9uj6xKlLo4ItWnwBzU6J7y9tf3o8Sg4BH1ev4
         PKFkKJtfFtnBsslElmKzVC4mQ89N4y2j/geUkXtXFZ3gZ6V0AMrgI2t4Lyji5YbzsM/4
         iTgX2V0cCF29VqlosOsbbOLtVWpJurogGzywd+TXdV1dyDpenbsxiWod0VHABf0BbNOl
         sadR/fZZdQSXzSWjEH7F/8fp8MpNY2ZrYjWvKSnl61IUdTbvzIv1RJbX3/QRoXN/SP6A
         1I8A==
X-Forwarded-Encrypted: i=1; AFNElJ/7uIwAq9R2FIXBeo1QXLnyBow0x6VQw1nDYWGSHzgAqSuNVAKQEOhSQP+3H8+dk5+QVaKRK9rXTx32@vger.kernel.org
X-Gm-Message-State: AOJu0YzB1lGCnhui7q9fr83GAr81X9rQTvbJ6g9Jhd+PZqxtiETm2dAE
	vVFa5mdsTgA3OaHSDOwFqRNsxvWgUfsvWpS3V8yCQAtC8xDD8wTP5UpZOu+iRuMazgM=
X-Gm-Gg: Acq92OHYQhLcEDkX1i0JMdNNj8n56VCFpnDJPtdwJu01qqoWsz0P2WBuNKiaYEJDuU3
	Jyk6iekBWvglmlnEEvcHIPKH7tqeCt3j9bg0id2dNcllaujp4OUYRsjAnIjgv+GdSOsma5K3CQf
	/FeVyeELDIjVwVjSx/HnHw/mHs/gSQpYPNHc2wY+UjGSJvsqdNSfkkgYn/XIYtLcnYSqgyPIeF1
	MWE39FmT3eLuNBK8WSIF7RtxJeQJpjcfq7U25yT1HXzyPjStpCbZa6FijKzSuSC4gTudctiVDKr
	BnW1kUWNhc+niGl+s2NiRmaturakTSkPdSskesy9OGPP8eLMLBibyDJXpikorfu7aN1VnPRNMkR
	ubaWqCY8GT3rzy4FhDhOk+2/tl7yWHQtkRnq8pc2TdMittQ/VlzUOI5EuFK3G+sBj9Rz87jZG9q
	TSuCBG5rrsRFSezaqBDczk/usZk8vO9d6lNUTkMld4bU327vh56ho6nb1UalXGAt7TMEqoh9U/j
	6OtbKhTpSM3VygFa26JbSA0TnTyOEopwY3wrnNvjYuIGHxwcFjK4bRP04hDeRGwREEOrqbLg1/q
	jsXDlU5aOyRvoFZ4gqU=
X-Received: by 2002:a05:600c:3b10:b0:490:5872:e641 with SMTP id 5b1f17b1804b1-4909c0cfe40mr55505215e9.18.1780064105498;
        Fri, 29 May 2026 07:15:05 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0e42sm43091805e9.8.2026.05.29.07.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:15:05 -0700 (PDT)
Date: Fri, 29 May 2026 15:15:03 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Daniel Thompson <danielt@kernel.org>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
Message-ID: <ahmfZ0tdxbVfD_y4@aspen.lan>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
 <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-1-ec8194bbc885@linaro.org>
 <ahllT_HVTAJ5MbkS@aspen.lan>
 <e3c99fe3-9279-4dfa-af69-d9366ab06837@linaro.org>
 <ahlr5PnX5O0tEd6G@aspen.lan>
 <4001cf6a-b7de-4933-96bc-c9b4ccb53e4d@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4001cf6a-b7de-4933-96bc-c9b4ccb53e4d@linaro.org>

On Fri, May 29, 2026 at 02:50:43PM +0200, Neil Armstrong wrote:
> On 5/29/26 12:35, Daniel Thompson wrote:
> > On Fri, May 29, 2026 at 12:16:07PM +0200, Neil Armstrong wrote:
> > > On 5/29/26 12:07, Daniel Thompson wrote:
> > > > On Tue, May 19, 2026 at 10:43:38AM +0200, Neil Armstrong wrote:
> > > > > Document the Silergy SY7758 6-channel High Efficiency LED Driver
> > > > > used for backlight brightness control.
> > > > >
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > ---
> > > > >    .../bindings/leds/backlight/silergy,sy7758.yaml    | 53 ++++++++++++++++++++++
> > > > >    1 file changed, 53 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..80e978d691c2
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
> > > > > @@ -0,0 +1,53 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/leds/backlight/silergy,sy7758.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Silergy SY7758 6-channel High Efficiency LED Driver
> > > > > +
> > > > > +maintainers:
> > > > > +  - Neil Armstrong <neil.armstrong@linaro.org>
> > > > > +
> > > > > +description:
> > > > > +  Silergy SY7758 is a high efficiency 6-channels LED backlight
> > > > > +  driver with I2C brightness control.
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: common.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: silergy,sy7758
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  vddio-supply: true
> > > > > +
> > > > > +  enable-gpios:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +  - vddio-supply
> > > >
> > > > Sorry for missing this in v2 but is vddio-supply really a required
> > > > property?
> > > >
> > > > It's unusual for supplies to be mandatory (and the it is not mandatory
> > > > in the driver implementation).
> > >
> > > This device is a little bit special, the VDDIO regulator is used to provide
> > > power for the I/O via the enable input, so basically the enable gpio power
> > > level is provided by VDDIO.
> >
> > I don't follow. The EN pin acts as both VDDIO and as an enable but it's
> > still effectively a power rail isn't it (albeit one with very low current
> > draw).
>
> Here's the datasheet description:
> ```
> Dual-purpose pin serving both as a chip enable and as a power supply
> reference for PWM, SDA, and SCL inputs.
> ```

Thanks for the quote. It's a big help (I've been working from a site
that makes me read a page at a time so I struggled to keep track of
things).

This says that the GPIO from the host is merely serving as a voltage
reference (for the an internal LDO regulator?). That means it is *not*
a power supply!

It sounds to me like the chip is designed to work with a host where
enable GPIO and I2C interface use the same I/O voltage. By having an
active-high enables the chip can *avoid* having a separate vddio pin.

However, in a design with no separate vddio pin then it would make no
sense to model a vddio-supply in the DT.


> The VDD input is directly provided by the panel, so Linux has no control
> of it so I haven't added it.

Power supplies are often added ad-hoc when the first board that includes
a regulator enable appears. On that basis omitting vdd-supply would be
relatively harmless if you don't need it but I wonder if you do, see below!


> > It looked to me like the correct way to model to two power rails
> > going into the chip is vdd-supply (main power supply) and vddio-supply
> > (EN/VDDIO) I don't understand why a single pin needs both a regulator
> > *and* a GPIO in the DT bindings?
>
> I don't have a the schematics of the board, but as I understood one gpio is
> actually enabling an regulator which provides power to the IC (vddio) and
> a second gpio will either drive the EN signal to GND or VDDIO to provide a
> clean rising edge on the EN pin.

This doesn't make sense since it is a single pin. It cannot be both a
power supply to the chip *and* a GPIO input. It's one or the other...
and from the above is sounds so me like GPIO).


> So it's not really 2 regulators, and having regulators means the enable
> signal can be shared and would have regulator characteristics which it hasn't.

Agreed. If the EN pin is merely use as an enable and voltage reference
then it are not two regulators.

However, it is also *not* vddio-supply and enable-gpios. We don't need
the board design to check this. The pinout diagram in the datasheet
should be sufficient!

If you have to activate vddio-supply for the backlight to work on the
board are you sure you don't just have a misnamed vdd-supply that needs
to be taken care of? That would make much more sense given the datasheet.


> > > This is the recommended way from the datasheet, and I assume it will be used
> > > like that on other platforms (if it exists...)
> > >
> > > This is why it's mandatory and enabled first before setting the enable pin.
> >
> > It's not mandatory for the C implementation. devm_regulator_get_enable()
> > will provide a dummy regulator if the property is omitted.
>
> So yeah if you prefer I'll re-spin with the vddio regulator as optional
> because between both, the VDDIO is the only which could be shared with
> other devices or always-on.

Based on the above, I'd be happy with an optional vdd-supply and an
enable-gpios.


Daniel.
