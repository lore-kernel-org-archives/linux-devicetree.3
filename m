Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC67C43801E
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784071360; cv=none; b=SBvytQiLUVhXn0x912EVFOBLmHOXDxN9k/uXNYG8RhNvzUIlZc8i2ljLozR2pNPz/RYt+ENhJ26X9RLy+odfRTRxu1AcCxoZ8XX43BtLPelqwJSBWC6nbl1eJFlQhK8EzdgIQPLRi4JKbTaF8XDX8/iceOWREh7aL4b23PAKCPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784071360; c=relaxed/simple;
	bh=uVTmFUQgmyurwuH+tx3PsrqDbjyomC1q+WpJv1Hqk7s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=prekwAGQ+9v0E/iJvb7nCzveULWGDyelQmYcqImLuhp/m8nRbDTKqSRdvKdgkwS149UkJafhv0nPlUnGvjXs7I/VF5nkXWgzbPUnvz0bePKSvTASiW4VZzn7SMM+i+pHdaySL0tlhlXpOKpD4mZoy+TnCnSrjBD58wvck2DFyFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CkWWqQAJ; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CkWWqQAJ"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6a3897109bfso1550856eaf.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 16:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784071348; x=1784676148; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+cwf8KxMbFBSRLsIM9pgNBAtX7liX+tdcg0AtezEmQQ=;
        b=CkWWqQAJ29KzyP9hvlIBzwiToiFgoEc+FqGE0/5K1Nht7C3E8ZuiqKzN8vTgj94wN4
         GyVD6EQcQvjRZmoZdAmWNH25r9SzbhdriRb97gDHx/thw1+qcspsG5Yj5bbwe4TSdCzl
         bd8hIs7QVrGXgaa10BGKxR0dlEITjOGf9WDZdjbEeEiXQxc5oVMrMELtx/GrYlSyF8ed
         f5m87gzyZX32UoPegkee8bzEc+ht852NCPEe4HcCT9ftWS20YMeXxKzwIEadamOxbGdo
         0+BrZBXRMAD/gbCuDQtC9SctVuaNx7SXeSXKE4wT0UBhQurVge5oWjtho7WJgTI6j74W
         ZZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784071348; x=1784676148;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cwf8KxMbFBSRLsIM9pgNBAtX7liX+tdcg0AtezEmQQ=;
        b=gXJcv+hlw0S3T+t0QCSwCa/ix3bJf8k7JL4r+n3ITIMDMXoW1bHnIocdM5J8qJR9L+
         cgXhIJSVysW3xwx3F4dWud4FMZhOVkOBNghbNonCcWkbWdkPmmaHiAOJzhWrA4b7h/TO
         007EYktkJd5GdYW43YtJQZ8VYc6A8GM6SaYetvzUCEAi5KvGOKtH9MyeLr2nXwHJAhhI
         uKmldGAp3dwM2eB+Gs8tuzXBAQUetPVSjhndjl0p6UXdU3fCbjgAlAitMHh1KR4TpJvn
         TZq3hmUbdDCniSC2CRxth4MUMRXYB9yQWmscBevdeH0Vx15Q8Sao4pFGTldN6BtRRZu9
         Ckew==
X-Forwarded-Encrypted: i=1; AFNElJ+M5MDEdwpvSLHGob5iHGOBYN/Q0do7+Ss7JUsBzkSKcyLFxZiyJAZ7MsHvrwdhpoLsPtfPXvF+wAye@vger.kernel.org
X-Gm-Message-State: AOJu0YzYdxLlADPtYuF5AYVt79kkXGgRXW/Bny0ShoRuJhbDw1C1RDZ3
	UVqw9LKAAdaQ9G8sLGeFP4DpRmPrEOS3DvZclQmOMOvXJwcJeX+3ckv85UxH/W31S6k=
X-Gm-Gg: AfdE7ck6UIXN5O7iYhm0jK1B4edCU+d4fMRgOWXXJRadoibB+3kNg93yZrws0JN9gLL
	ThrisJSDmYoSN9g5erdwCUNXYOc6QmcAoPBUrTjg8MbXVLN/c8ndr6VJjo3gSjTD0o8qATp6g+C
	po3Ep2g4Gjw1FwrjnmmDmZShvJqY9vlhOqsiBxwaSFqW/a/EfpkCHiN1s6EZYQP/n44m1iyDz/T
	Y2HDM1m3Bl11+3pNJXnudnebVUaP7rvzYGvneUP8zOmxtrTlPrBKCyGqd+o9GJV+VhM0d940Iwe
	K28xWmhV6iyB1bqHJgmPFInR1TyCJjpmrVUQz5X2D+Y3cipaqLNbzJxabHtTFr8sfr0OIkimrGS
	oIDnDRzdLuaWByJl5M4+fTz3bqdDs6wmiXHF3hQCdNVwcuRTYoxkbOPB8b3K2IXCfTukN9gGiF8
	A4S1/Q+BdFKJiDa42DStfWzQlXTgBw
X-Received: by 2002:a05:6820:1f08:b0:6a3:98e9:c979 with SMTP id 006d021491bc7-6a3d9eb4c9amr487045eaf.14.1784071348385;
        Tue, 14 Jul 2026 16:22:28 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:280e:69fd:7612:d5a9])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a39af0e953sm7561978eaf.3.2026.07.14.16.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 16:22:27 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v4 0/8] iio: adc: new ti-ads112c14 driver
Date: Tue, 14 Jul 2026 18:21:22 -0500
Message-Id: <20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNwQrCMAwG4FeRnq20WdcxT76HeFjSTCPqpJ1Dk
 b27nR4U0VP4Q/L9d5U4Cie1nN1V5EGSdKcc3HymaNectqwl5KzAgDeldVqk000g3UseyQJQXga
 DNbiqLgrHKr+eI7dyfbLrzSunC+6Z+smaLnaS+i7enr2Dne5eFd6WvysGq41mj6EJbUUIuMLmd
 hCMvKDuqKaWAT4c+OdAdoixRoOlt/TLKd5OZc0fp8hO5XwogbC1wXw54zg+APHzsWBdAQAA
X-Change-ID: 20260514-iio-adc-ti-ads122c14-d0b92479334e
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, Nguyen Minh Tien <zizuzacker@gmail.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6881; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=uVTmFUQgmyurwuH+tx3PsrqDbjyomC1q+WpJv1Hqk7s=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqVsR3/6QLfJBL/+IOg/+8c9Zwgt3H2SzSP6fvl
 yHFk2BgvK2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCalbEdwAKCRDCzCAB/wGP
 wHB8CACUjUheIgeqLJ81rSmMLMf7v79zeRKeSchhhnPdH9XQi7FFw8tGpVlSxA3Apwnea9kwgYY
 AZ1eUGqDas3N37L3T23Bi+mn/v+kXsghDiXAViLlOoSdR5KwBHDGkS0KFJ+hZkbHX0ObJIDMARc
 xaGnt4XeKA+KFrq2kcBExsv4H4w2L1H2BOhGi9k2NrzYyJwUYUvseqiXIeIWBbvOc7WAuJ/A1dO
 KVc5zzaiBat3GdqHw8nqNIsrsR4eVhAElecEg3sl7D1oDK6K0/UJnfTq6kmjWTEBp3uBIf88zmT
 hqsP8NQprBp1wgg5tnWIW4wVrDgiHwmFC41V+VXzc1flowAR
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

This adds support for TI ADS112C14 and ADS122C14 ADC chips.

The closest thing we've seen to this in the kernel already is ads124s08.
However, that has a completely different register map and the DT
bindings are incomplete and the driver is extremely basic. So I've just
started from scratch here.

We've also had a similar submission recently for ADS1220 [1]. That chip
is in a similar situation to ads124s08 in that it has a different
register map (but the submitted DT bindings are better than the ones for
ads124s08, even if still a bit incomplete). And literally as I was
writing the previous sentence, another series [2]  was sent for yet
another similar family of chips (ADS1262). That one is even more complex
in the feature set than the ones I am working on.

[1]: https://lore.kernel.org/linux-iio/20260610151342.44274-1-zizuzacker@gmail.com/
[2]: https://lore.kernel.org/linux-iio/20260612-ads126x-v1-0-894c788d03ed@gmail.com/

All of these chips have in common that they are designed for use with
RTDs and thermocouples and so they look very similar to each other in
terms of wiring and feature set, even if the register maps are
different. They are in the gray area where we could either keep them
separate because they are just different enough, or we could do like
we've done before with ad_sigma_delta and have a bit of an abstraction
layer for the register differences and otherwise try to share as much
code as possible. Normally, I would lean towards keeping them separate,
but in this case, I'm considering trying to share code because the
devicetree bindings for the inputs is complex and is going to be mostly
the same across all of these chips.

After seeing Kurt's v2 though (that doesn't attempt to share code), it
seems like the chips are different enough that sharing code might be
more complicated/messy than I initially thought. So I'm happy to keep
going that route.

This series includes just basic support for reading single measurements
from the ADC and gain selection via the scale attribute. I plan to
follow this up with additional series to add support for buffered reads,
filtering/oversampling configuration, event support, gpio controller
support, burnout support, DRDY interrupt support, DELAY support, CRC
checking, external clock support.

The most interesting part about this (that I alluded to above) is the
way channels are handled. These are multipling ADCs with differential
and single-ended inputs. But what sets them apart from other similar
chips is that since they are designed for use with RTDs, there can also
be a current output required to excite the RTD and this current output
might be different for different channels. So the way I conceptualized
the channels is that the devicetree specifies the conditions needed
to take a particular measurement rather than being purely a physical
channel.

This makes things more flexible, but does make the driver a bit more
complex. For example, knowing when the current output needs to be
enabled or disabled. For now, I have chosen a lazy-enable where they
are not turned on until the first measurement is taken that requires
them, but then they stay on until another measurement is taken that
doesn't require them. This can lead to some oddness with the diagnostic
channels that may be measuring something that indirectly requires the
current output (i.e. the external reference voltage when it is connected
to a resistor rather than a power supply). This means you need to take
a measurement that requires the current output to be enabled before the
diagnostic channels will give accurate readings.

I have also pushed a branch to [3] that contains the start of some
documentation for this driver that can give some more insight into how
the implementation works. It still needs some work and also documents
some things that haven't been implemented yet, so I haven't included it
in this series yet.

[3]: https://github.com/dlech/linux/blob/b4/iio-adc-ti-ads122c14/Documentation/iio/ads112c14.rst

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
Changes in v4:
- Kept the review tags on dt-bindings patchs, but made some changes to
  a few of them that are worth a quick look again just in case.
- This didn't come up in review of this series, but in other mails on
  the list, Jonathan has been commenting on improper use of claiming
  direct mode, so I have added a mutex instead.
- Fixed use of 64-bit scale storage on big-endian.
- Removed burnout code (saving for later series).
- Most other changes were minor/cosmetic. More details in each patch.
- Link to v3: https://patch.msgid.link/20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com

Changes in v3:
- Mostly cosmetic changes and a few bug fixes to address review feedback.
- See individual patches for details of changes.
- Link to v2: https://patch.msgid.link/20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com

Changes in v2:
- Added patches for adding properties to adc.yaml.
- Some of these are coming from: https://lore.kernel.org/linux-iio/20260622-new-channel-props-v2-0-aafd5369f253@gmail.com/
- For now, I have stuck with one channel per single-channel pin or
  diff-channels pin pair rather than some of the other ideas that were
  discussed. Handling burn out current enable will be handled in a later
  series. I'm leaning towards something like the _burnoutraw attribute
  that Jonathan suggested.
- See individual patches for details of changes (mostly renaming DT
  properties, fixing some driver bugs and style issues).
- Link to v1: https://patch.msgid.link/20260615-iio-adc-ti-ads122c14-v1-0-e6bdadf7cb2b@baylibre.com

---
David Lechner (TI) (5):
      dt-bindings: iio: adc: add input-chopping property
      dt-bindings: iio: adc: add ti,ads122c14
      iio: adc: add ti-ads112c14 driver
      iio: adc: ti-ads112c14: implement gain on internal short SYS_MON channel
      iio: adc: ti-ads112c14: add measurement channel support

Kurt Borja (3):
      dt-bindings: iio: adc: Add reference-sources property
      dt-bindings: iio: adc: Add excitation current sources properties
      dt-bindings: iio: adc: Add burn-out current properties

 Documentation/devicetree/bindings/iio/adc/adc.yaml |   41 +
 .../devicetree/bindings/iio/adc/ti,ads112c14.yaml  |  217 ++++
 MAINTAINERS                                        |    7 +
 drivers/iio/adc/Kconfig                            |   12 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/ti-ads112c14.c                     | 1206 ++++++++++++++++++++
 6 files changed, 1484 insertions(+)
---
base-commit: aa58ecc73466d0cb8c418de98e2225490bf600e3
change-id: 20260514-iio-adc-ti-ads122c14-d0b92479334e

Best regards,
--  
David Lechner (TI) <dlechner@baylibre.com>

