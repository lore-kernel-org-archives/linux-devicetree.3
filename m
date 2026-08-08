Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE18737BE93
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 03:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786161533; cv=none; b=JEYu96+u7ld555LTSAVuMlkBQY5HdphTwH6hqE08Kiv3LecNhlwr3EzBf1zKicSrjCDa+mne1KYwq9DdBTQX52XsQjajc1p2G5dYYkRCRcLtiBmc0sEh0PVHSDYW3llGqw47mnXWLviS1fi+nvTEXtBMPq5M2MuBPyNMqZKI1uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786161533; c=relaxed/simple;
	bh=E+COuTZDJto77RKbXXZgNOjB6BfREY2d83qy3YraK3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gE9GzyEJkhhS+PdPmbws2ImtiUx67F8YtDuo6DxQQzY0pEkeayQE578VgHxnf7bW/FEbzdE729MXzgxGZyvyys7qs/B7H858UXpdQf0BWn3iojKsequlDmSdMElcA+EHf4ZpbRSVLbCi/fQrDNe/6nc1id31RouHh3wZnC4fqv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBUwGNFw; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBUwGNFw"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so69840e0c.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 20:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786161531; x=1786766331; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2Cp+5uiiTsiC1+T4AyPEslwvRtmjSg5jSMcozPRnENw=;
        b=nBUwGNFwQPcJNsbCKSS21JCjejxk1H3uAT8x4zAMgfxZEMkWMgt4HsU6/SWjmhvNxn
         PLkuiov286zk5CpD2JRZUf4BLg5ySzYcgMjhugIuDLs7IAxgChHUl9NX5r1zgsdiD0p9
         iiR/NHVzEovEApe/h8p4mglVzRiE14RrcekYflFLsEe6PPItYuAjVOmfNxkyUr8u3Ydg
         C40/NlugYhRVfyXqZAvh8LYf5tZNifDofJW1zk4AR/1DDqrzn90Ru6NAbXwobO6b/DtQ
         xxQbCg5AXR4NZN3DJJndUDa+wlWYFslZsiCZP5VHH9LVPolrmfbuVkLYy1PsgK/EZf4H
         LpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786161531; x=1786766331;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2Cp+5uiiTsiC1+T4AyPEslwvRtmjSg5jSMcozPRnENw=;
        b=qvGhKG9GaLui8VjH4t9dbcsiU0ScJ8d82kVHIAtovuztYFKTgqIDPQPd+d16UpwVHA
         c026IzwW9mstmxFbnCDFL0N4ob34peoVATRcrEoaMdfU2wlRO20CDWN/fd5hpNCQkNsw
         NySz5ldMKjfpLBEDYBDdUbsadweBxWUO5I5icBFkmSTqkl2pmqTyhajGSMKVxOFBaBmt
         vubDYdNuibUDQ+EsCSCXQAwAFz50BTdBH+N8/ydGMqeD8nWi0+xXDZb2bWguAbtiVVOu
         F2AIqMyAnLP93VIopSgLehimUZoti3tZgMq+18evurqnmLmzL1TwIURU9Fo1T9nJDRRD
         apWg==
X-Forwarded-Encrypted: i=1; AHgh+RonOJ7wqiJanLz6wu5ufcRGAjlWuLzv851jWhYiS2E1xcp0ZzMvpcMaP0iCO0coUyDL4EIXqZPBsFpB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Zri61sffk8Nm/budd4nDnOMX9ke+uGJPvDkL4o5ZFBj1TrT4
	f4lHrJB3bPmyrkkjzS8hY9y9dwfIEsxzpigHp8MDjEC8V63rYjmzhrz4
X-Gm-Gg: AR+sD11JCTniTyHaYXiRspoFqhFdy4xoc0IEpMP4wJA5nF+Wv9WvcxP5P51dWAr5d4r
	KD5toGnmtBHw4t7wqbRH0+ah4Qw4m9i9rLMQk2jLa3OC6r9JpkBs5ltuBQo1KqhhBBpOc42TGj8
	Cw6nnAYsSGq6LULM5FpB3ygBUZ9tXfHfzWeU86u24sIsG0d78q2ERhVa7pxMsPvA/tGLynP6zM0
	+ucPVv1mt0cOBci87Usa7d2f69VKt7QY+movrEs/xMT9sodpFZYkWrhUBHRv88gMNqpoAz6qJ6b
	MA583VhVWGe8KNRODGCdqOgEmYDXtnzXYuKDZBWfal7WFkqK/HeskEnmOPLmjRxE8OnN1zxNXMQ
	Jq7O4AdihA5bEABIFtKZ8eC5IHSoCs0v/Rx865Iabjkg3ox28ng715PPsHLdZymkCovsGeaizQc
	FuBTS05yVrnXD53G6rYVtRIL9umYif5rLG5IJgVuVrs5mRBmwN5D5lU+tkf2vUUWYI90Fli7c=
X-Received: by 2002:a05:6102:f84:b0:73a:128b:ea07 with SMTP id ada2fe7eead31-760e8f3a718mr7088979137.14.1786161530558;
        Fri, 07 Aug 2026 20:58:50 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b212fa6sm1432936e0c.16.2026.08.07.20.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 20:58:50 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v3 0/9] iio: adc: Add TI ADS126X ADC family support
Date: Fri, 07 Aug 2026 22:58:22 -0500
Message-Id: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Pyw6CMBBFf4V0bU1noDxc+R/GRaEDNBHQFhsM4
 d8taJTlvZlzcmdmjqwhx07RzCx548zQhxAfIla1qm+IGx0yQ4ESAAuutANMJ16XKYhMClkpYuH
 6bqk202a6XENujRsH+9rEHtZ2daQiBfw5PHDB8yKpsjzXIiZ9bjplbsdq6Njq8LjjMP9zGLikh
 BJjiFGWas8tnzGWHs/wzfhdtCxv8iJluOsAAAA=
X-Change-ID: 20251129-ads126x-fb6107505cae
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6414; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=E+COuTZDJto77RKbXXZgNOjB6BfREY2d83qy3YraK3A=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFllKwtjWNf6KMx4Icfbo8oiXnZoksl9rw7NvlzR1Dbt4
 8Hp/Zs6SlkYxLgYZMUUWdoTFn17FJX31u9A6H2YOaxMIEMYuDgFYCJsRgz/0xnaPJ4WSSnkr1B4
 oVR3fYeftHjTa56Vjn2miY86u893Mvwv8MxTnO+lOif999fLL8/5X1jWZCue//+9RMs7/w+1H19
 wAAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi all,

This series introduces support for TI ADS1262 and ADS1263 ADCs [1].
These devices are very similar (if not the same), except ADS1263
includes a secondary auxiliary ADC.

I plan to add these features to the main driver soon:

  - Filters
  - Calibration (manual and automatic)
  - GPIO controller capabilities
  - Channel hot-reloading in buffer mode
  - SPI offload support (38400 SPS turns out to be too high for some
    systems)
  - Conversion delay support
  - Full support for monitor channels
  - The ti-ads1263-adc2 driver for ADC2

The auxiliary ADC operates almost completely independent of the main
ADC. The only consideration that has to be taken for interoperability is
when reading conversion data in direct mode (Datasheet 9.4.7.1), which
happens only in buffer mode, when multiple channels are enabled.

When reading data in direct mode, all SPI activity is forbidden between
the data-ready signal and the data retrieval. To achieve this a second
mutex called xfer_lock was introduced to block SPI activity on the
device.

This is one of the biggest drivers I've developed, so I hope the code
and the comments are self-explanatory. If not, please let me know so I
can clarify them.

As always, thanks for your reviews and help. Submitting upstream is
always a great learning experience :)

[1] https://www.ti.com/lit/ds/symlink/ads1263.pdf

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
v3:
  dt-bindings
  -----------

  - Add interrupt-names property to support the dout/drdy DRDY pin

  - Model vbias and refout as regulator providers under a "regulators"
    node

  - Removed ref{p,n}-supply in favor of refp[1-3]-supply and
    refn[1-3]-supply, to match physical reference source pins.

  - Add ti,refp[1-3]-refn[1-3]-resistor-ohms for boards where the
    external reference is obtained from a resistor instead of being
    driven by a supply

  - Support single-channel and common-mode-channel

  - Add common-mode-[N]-supply properties for pseudo-differential
    inputs whose negative pin is tied to something other than ground

  - Allow excitation-* arrays to have only one item

  - Drop the "no connection" value from excitation-channels and the 0
    value from excitation-current-nanoamp, both are expressed by
    omitting the property or shortening the array

  - Restrict diff-channels to 0-14: drop the "Float" entry.

  - Add ti,reference-reversal

  - Renamed ti,idac-chopping -> ti,idac-rotation to match datasheet

  - Add avss-supply (negative analog supply) because it can actually be
    below ground (min -2.5 V; max 0 V).

  ti-ads1262
  ----------

  - Split the v2 driver into several commits to aliviate review burden

  - Conversion delay postponed to a later series

  - Filter selection postponed to a later series

  - Clock now allows the full frequency range. Worst case timing
    requirements are now calculated taking the worst case clock rate.

  - RESET signal now prefers GPIO if available

  - Move xfer_lock outside regmap calls

  - Use match_string() instead of ads1262_find_string()

  - Add hardware reset to ads1262_dev_reset()

  - ads1262_wait_for_conversion() now propagates errors

  - Support external reference resistors. Channels referenced that way
    are exposed as IIO_RESISTANCE.

  - Drop HARDWAREGAIN in favor of per channel _scale_available with the
    new IIO_VAL_DECIMAL64_PICO

  - Now the probe fails if there is no 'drdy' IRQ (doesn't mean it's now
    required in devicetree though). Support for no IRQ can be added if
    needed.

  - Style changes suggested by Jonathan and David.

  IMPORTANT:

  - Rework regulator parsing: now per-channel voltage reference is
    allowed and users may configure a reference resistor instead of
    supply.

    Additionally, I added support for bipolar analog supplies
    (AVSS < 0V). This configuration is important because it allows true
    bipolar measurements, but comes with a lot of problems because
    reference can also have voltage levels below ground and most
    importantly the regulator subsystem doesn't support negative
    voltages. The approach taken to solve this issue was the same as the
    ad4170-4 driver.

    More info in commit message and code comments.

  - @David: I added support for the monitor channels, but I prefer to
    parse them from DT instead of making them static (similar to the
    ad4170-4 approach too :p).

  - @David: About filters... As I mentioned in the previous version, the
    data_rate configuration takes precedence over the filter selection.
    If an incompatible filter (given a data rate) is selected, the chip
    resorts to a sane compatible one when doing conversions (either
    SINC1 or plain SINC5).

    Now, I don't know how to expose this in userspace. Should I limit
    the sampling_frequency_available attribute (given a filter)? Or
    should it be the other way around, limit the filter_type_available
    attribute (given a data rate)?.

  ti-ads1263-adc2
  ---------------

  - Postponed to a separate series to aliviate review burden.

v2: https://patch.msgid.link/20260628-ads126x-v2-0-4b1b231325ba@gmail.com

v1: https://patch.msgid.link/20260612-ads126x-v1-0-894c788d03ed@gmail.com

---
Kurt Borja (9):
      dt-bindings: iio: adc: support the TI ADS126x ADC family
      iio: adc: add the ti-ads1262 driver
      iio: adc: ti-ads1262: support per-channel sampling frequency
      iio: adc: ti-ads1262: support per-channel reference and gain
      iio: adc: ti-ads1262: support input chopping
      iio: adc: ti-ads1262: support excitation currents
      iio: adc: ti-ads1262: support triggered buffer sampling
      iio: adc: ti-ads1262: support REFOUT and VBIAS regulators
      iio: adc: ti-ads1262: support common mode supplies

 .../devicetree/bindings/iio/adc/ti,ads1262.yaml    |  379 ++++
 MAINTAINERS                                        |    7 +
 drivers/iio/adc/Kconfig                            |   14 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/ti-ads1262.c                       | 1890 ++++++++++++++++++++
 5 files changed, 2291 insertions(+)
---
base-commit: 350d1fb9204b13c5f95e511e98b8bcb47574d425
change-id: 20251129-ads126x-fb6107505cae

-- 
Thanks, 
 ~ Kurt

