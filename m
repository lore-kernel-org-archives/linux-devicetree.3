Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2502338C43F
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892520; cv=none; b=jDFDFgWDY6V2A7PUEaq0rCKk3K+KvZK9ovmJY32L3d2n9jcP/1q0JGNZgO/VLzd1SkMsAYxLR34jKEVEsbgqwfI82NDb4yL79EyabcjjOl908oxqMkWInoDVO3oP4/DgFE0S4QTutJev16wvzEp3jlkwEFnA6qhnXBxe74AAulQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892520; c=relaxed/simple;
	bh=usrk/brkiF0gDQ4v/eaKp9rFYPDNwORJnY4Wqr4tzRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCNM7Yr3uEu7ejDEK8D+DpqHg+6zgJHYqsQ/mACWaw4r6+WixZ5+wtDOYLgOM7LKoTZhPzafMc+HH3AdpzOQlrYdf9pTwx5AymWKFDsynQH9Dalsujo1oRAZy3y46s+Ja5k7unCf3dFtN+xPa5iMnZgyFweUxhsRL4JKcTxhQds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HB2kG0Cj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HB2kG0Cj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44e1860558fso7475980f8f.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892517; x=1780497317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXJMeIed8n1hIt+0o9e1Q/FT5FxrTL6nQCpAB+Niu8A=;
        b=HB2kG0CjLZb5WmMKkMT9uvRR1UZYZ7JJpYQ243kjmAk96GBg9+pKU3PVDu90hGdZJk
         eZ5j3ejqATIG3GgqQq8xaWQM5YnZW83kmIylDWd7G+1MCcTzajB6BDywe/m2FVX+i0NK
         EvuUzNY64JNVZiEzABJUnmPxM8DbAyTyhvycDDd/u5Cat4gJ0UwELgO4EqpcOCePtPzb
         /uvXB5HGSGqsQz55mcsjld/B7VtcA2MBZAzOdbvr+WZcec8eaOTJF+tEaAtqoK+ixH5U
         VQ+umW2a54l+XKX8UXupNH+Eb0B0IYpgUMrVEZN50jWXrqb0KGw5YWT4vqWxFvCBZMQ1
         Y9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892517; x=1780497317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXJMeIed8n1hIt+0o9e1Q/FT5FxrTL6nQCpAB+Niu8A=;
        b=cu1fLOME1XWW7egSZkjDqCLWc/lD2n3vgNVYyyuDFMOKjJGgSVBicRUhgnOKaUaxXo
         8PBKzTyCSOM8X2xad5qln+PXo/1zqpLt1UwjqNQTC3fIw6zHW2xkfNYmq27yLij3b5RP
         P78HAuEo/toJIHocRv4+KQz48qdjxyNp8DH7HvW2WQT3VG4+a/qe2LuUknlJG2nnggYO
         yhyWVytTKg09iMTDir+K0r+r4grwV5XZibyk8TN1OyJ/al+xFE+ZVPlXlY48ajfWaZT6
         8/OsQBUt4zfJp48SeDLKKFvdBzcF97WwB64ZUcrQB+2D2Hx3cD6iiWA2L7iAyGrtXOIG
         F+KQ==
X-Forwarded-Encrypted: i=1; AFNElJ9L8aKAO5ezKBd03oXfmdtfbLlmayOIPn3Dlw8sqBXp0N0R/Fo+R7XvE424TtiDAvF9wkOApFH2+bj7@vger.kernel.org
X-Gm-Message-State: AOJu0YzvnIvka98yIbZU+VeOXOeiTk91PP1ZXZLUkJOPzxrCS4MhooxL
	j0w8CdLeDgXyYFxfuIxh3F2trUOwfm/JOV+lu4dItEyFdFS7G1Vdk0yU
X-Gm-Gg: Acq92OENg7b9++j6WdobkMMHlxOnSwFLOfBkiVFBQjUWKOZ2X4ujzzenbvvRFXNJRSZ
	D9UKSdg+BYdKP4Z3x8m9iqjpz8X68J1++IDjL0bMX1Jib9JpVfoDW4RCZEb0w+mSmE1MKFUCzXh
	UVzz2uw3W+/PBcd/zNGXHFOIWJXo7SJCpnKv9XntNt2zko2nbSnDjnN5Ofl3Kh+j5OfVi9dbFbI
	jJl72PfAeHLZQW/jn8nB80RaF42dZ/1tLt2jT1BQH6/di7KuT+nFx43mONhZs4qDzA0sz4URwrH
	5xMMD6q+3EMYi6nknE0CYRJ1XOzZlkcXIf4VLwwdhdW1zEiFYzm6AzN9Gk9uwHUN+OpAR5qX0cp
	xjDQCIklmxPOGWC+0awXvoZzQryMRDM4ivPjwxMhiHbvQjhhVDea1FqgjAVH20h/ibjeHj3A5Yu
	qYrcz/PakxUcRawLk=
X-Received: by 2002:a05:6000:41e3:b0:43d:50c:6f18 with SMTP id ffacd0b85a97d-45eb38a1687mr33364115f8f.11.1779892517326;
        Wed, 27 May 2026 07:35:17 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:16 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/4] iio: add Sensirion SLF3x liquid flow sensor support
Date: Wed, 27 May 2026 16:34:58 +0200
Message-ID: <20260527143515.102794-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260526171214.750c2e25@jic23-huawei>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260526171214.750c2e25@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 17:12:14 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> > 1. Subsystem.  Liquid-flow sensors don't seem to have a home in
> >    mainline yet.  iio/ feels like the natural place for me, but
> >    please correct me if hwmon (or somewhere else) is prefered.  
> 
> I'm fine with this type of sensor in IIO, but open to hear from others!

Thanks - keeping it in iio/ for v2.

> > 2. Channel type.  IIO has no flow channel type so far.  The series
> >    adds IIO_VOLUMEFLOW with _scale in litres per second per LSB,
> >    so drivers reporting smaller units only need a fractional scale.
> >    IIO_MASSFLOW (for gas-flow sensors) was left out on purpose --
> >    happy to add it in the same series if that's more usefull.  
> 
> Would be good to have a little more detail on difference etc to have
> that discussion.  Superficially I'm assuming this is a compressible vs
> non compressible thing?

Right - that was the distinction I had in mind:

  - IIO_VOLUMEFLOW: volumetric rate (m^3/s in SI, exposed as l/s),
    well-defined for an incompressible fluid where the volume at the
    sensor equals the volume delivered.  This matches all "liquid
    flow" sensors I'm aware of (and the SLF3S family in particular).

  - IIO_MASSFLOW: mass rate (kg/s), the natural unit for gases because
    the volumetric rate depends on temperature and pressure.  Most
    "gas flow" parts on the market (Sensirion SFM3xxx, SFC, MFC
    devices) actually report a "standard volume flow" (e.g. slm at
    0 degC and 1013 mbar) which is just a fixed-density restatement
    of mass flow.

I left IIO_MASSFLOW out of this series because I don't have a driver
needing it right now, but if you'd prefer I add it as a stub here
(name + ABI entry) so the two siblings land together, I can fold that
in for v2 -- happy either way.

> > 3. Subdirectory.  I put the driver in a new drivers/iio/flow/
> >    since there is no flow subsytem in iio yet.  If colocating with
> >    drivers/iio/pressure/ (next to sdp500) is preferred I'll respin.  
> 
> This is easy to change later if we make a wrong decision. For now I think
> iio/flow is fine.

Sticking with drivers/iio/flow/ for v2.

Thanks!

v2 is up, addressing the inline review feedback from you and Guenter.
Dropping the RFC tag since the three high-level questions are
answered.

Wadim
