Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAB4223DE7
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284604; cv=none; b=gw1MdtMhinSQeKH5hyzO6WITx1OhAXKszZVvU3HNOqZEwzCOCc+wpFQGXq/fbn9rWVvytT8RkmYD+DB6BMrA7zZ9XAjnHZoB8Ux9EFH/iRYTM+tTwI8iiHnU99qXaTsllU6O5kDq4n+JbWuaj4oxdx3fwFpquB6oUdDHN906lAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284604; c=relaxed/simple;
	bh=PFD2iL3lpSvNkhMI6YUePwdFN+Bl2X+7rN4+GU/fR9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ixcQt9xq8QMu1GQgkIr615C7iG1+F2+yT7H+3L1P1dyJ7duLNYXMPvZ3IFfevd1R4lD6U8XWv7Yiq3zLjBmgEjmmsWA3prVmZGUEzfcQtLxKhxesfOMyk8aEUVRi1niBcMUdHAGn2RK4UT3QcZ6V+0D9frDImkv3pJwEzVllx9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6LtIQii; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6LtIQii"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so6163992b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284601; x=1777889401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVjZJGi1bRfvcXa1V21Dt9zuEIBVC1nCvcLpxsqr/7I=;
        b=c6LtIQiiyUSLjyzovRZmBcso1MrYhtU88fvm9ZAxe2EiNnr/8LRBm6jchPjaRPTxVX
         TvfHPN3X53GjixhJhWH4XeTglM+sNB3Hr4Eg/a1dEcb0lMyv0NJAPkBMzqWHKL3W1duU
         zbY9fXrcG7RdfVicXCNY1JDbEJAwNQ3zJkYsiVuMtTYhCx6yQgzaelImyzVh7E789fK4
         GZrGK/NWG9yzKPXBZ/O50KifPIp1GTchNVv5JyTFqHjAFqvhGjC304mzk5Sr8baBM7b/
         KlXn2p0VjWeuirEILWcK+NlhpC0+2Db6egPxvKz0oMdi1mG9aQZtpZKKULyjaNY11CUH
         zgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284601; x=1777889401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVjZJGi1bRfvcXa1V21Dt9zuEIBVC1nCvcLpxsqr/7I=;
        b=jySBZEtf83upzj5dnfktqKJwvhALOvo49bMLP7HoROGtCPUkl4Oc3HYQjSH3MI9xAs
         hbGoN8+taAo/vgzGVfkCRxQYCY4yzvK2HMyjh1ebxn/V8+1Hj9UgnLahhGAwxceVBrBh
         Zs2D5tT99X1iCIBwcFWleWLMNY0I8JEVD1WuQN7cUFGpeHaj4oGcPgEoGNlP8y12zMG5
         nWKagykVxDcUnCdvGm3ZF9lrtbsBxaj/G3JlpTCbQZgv/zUEL5Wic+DnHCbfZUb4TxoF
         UqKYNB59XfP5hrWaSxMlGtzksWH+a/cGAHu9ntKjQFueW1KnNBaTdztfmj7q9M4MbjT+
         NDEg==
X-Forwarded-Encrypted: i=1; AFNElJ+aIiXd2pQjY2hExBgq9MRGw41QqOWOiriVCUdYYOAkuXyxmvKMmOpR5RxUyCSIDdG+J4daBb8B8Snc@vger.kernel.org
X-Gm-Message-State: AOJu0YznapO8s+M4F+usTOvMqBk3tyW1akfH9V0CcxwU6OjQ0iaN+idZ
	iu2Hop7N7fVCgjhsLzl9QWb+VXIV2tX7uNKY7QgGcrhwY+OO+ncHOtMp
X-Gm-Gg: AeBDieuwVEARlhRXWcX6/aXHMehDBVib1NmIkdAJYD2+48CdToT/K/c3W7lRR+hUnuM
	0ic3gUiHUXp/tB0tIeqNWpkj6KNCOuPxUhaEfWp32ovt4vRg4MqOeb04lnL5S1ec0udirEOYqUe
	1L01hiyZcvlhsQem6ls7hOohBpBeJUOaHeRA/+Ii6dmoYotO/1Vm4bhYJi3BCxRzEaEvS206LJX
	475w7axeRYCcdxKY86dhs9Lk8pRMAIWXVNqX/YGcf0E/dOAL1Ht5pO8fVrdNL2nTexOHSxpJBN/
	VxXGjjGd7yTORe/A080E3eEEyjRnp6nd/9IXc161yM7rcJzmNOt1xjvC/OzAPQl44cCq3tUViqG
	ed0AS4W9SJSdAX27va+ptRIH4eG/zon3+BEQpa846R5oX7VYjZpxqR6TGal2ZCh+tAkX9lm53jL
	ysMYQBYFj/RUhbGHIYOZ83+f7SGPbBaVX6uetvCy+0WShieylw9b6fEtwJcuPqqRrhmbvxFJ+g6
	HafwXF1rSHb+Ow9Ca2t4zZN/wn6pQU0WITSEbUILL8jcDf5/w==
X-Received: by 2002:a05:6a00:4186:b0:82c:21b8:4a1f with SMTP id d2e1a72fcca58-82f8c7dd163mr46226289b3a.5.1777284601404;
        Mon, 27 Apr 2026 03:10:01 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d016:e577:22da:dc9:7f6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm39534225b3a.38.2026.04.27.03.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:10:00 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] iio: adc: hx711: add HX710B support
Date: Mon, 27 Apr 2026 15:39:31 +0530
Message-ID: <20260427100950.33936-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the HX710B ADC, a variant of the HX711 with the same
GPIO interface but a different channel and gain model.

The first patch updates the devicetree binding to add the
`avia,hx710b` compatible, document the variant-specific hardware
behaviour, and add chip-specific supply properties (avdd-supply,
dvdd-supply, vsup-supply, vref-supply), the RATE pin for the HX711, and
allOf constraints forbidding HX711-only properties on HX710B nodes and
vice versa.

The second patch fixes a pre-existing bug: hx711_gain_to_scale[].scale
is a global array overwritten on each probe call, which breaks multiple
sensor instances that have different AVDD supplies. This is fixed by
moving the scale into a per-device array.

Patches 3-6 split the v3 refactor into smaller independent steps as
requested by Andy Shevchenko: text cleanup (Kconfig, header,
MODULE_DESCRIPTION), chip_info introduction, trailing-pulse
parametrisation of hx711_read(), and iio_chan_spec * signature for
hx711_reset_read().

The final patch adds HX710B support using that infrastructure. Trailing
pulse counts from Table 3 of the HX710B datasheet are stored in
chan->address. Three channels are exposed: two differential inputs
(10 SPS and 40 SPS) and a DVDD-AVDD supply monitor (40 SPS). The driver
probes vref-supply first for the ADC reference and falls back to
avdd-supply when the VREF pin is tied to AVDD on the board.

Tested on PocketBeagle2 with an HX710B breakout module. The device
probed successfully, all three channels returned stable raw readings, and
alternating reads confirmed channel switching between the differential
input and the DVDD-AVDD supply monitor path.

Build-tested with:
- make -s W=1 drivers/iio/adc/hx711.o
- pahole -C hx711_chip_info drivers/iio/adc/hx711.o

pahole reports hx711_chip_info as 40 bytes with no internal holes. The
remaining 7 bytes are tail padding from 8-byte pointer alignment.

Changes in v4:
- Fix pre-existing global scale mutation bug (new patch 2).
- Split the v3 refactor patch into four independent patches (patches
  3-6) as requested by Andy Shevchenko.
- Keep hx711_chip_info fields in their final order from introduction;
  the HX710B patch only appends new fields without reordering.
- Add vref-supply binding and probe path for HX710B VREF pin.
- Add a third HX710B channel (27 pulses, differential 40 SPS) from
  Table 3 of the datasheet.
- Use .channel = 2 for the supply monitor to avoid indexing clash with
  .channel2 = 1 of the differential pair.
- Remove dvdd-supply from the HX710B forbidden list in the binding; the
  HX710B has a DVDD supply and the DVDD-AVDD channel relies on it.
- Add NULL guard on device_get_match_data() return value.
- Fix checkpatch alignment in multi-line hx711_read() calls.

Changes in v3:
- See individual patch changelogs for full details.
- dt-bindings: remove vref-supply wording; drop repeated
  clock-frequency default text; restore example node name; remove the
  extra HX710B example
- driver: split the hx711_chip_info refactor from the HX710B support
  patch; fix signedness; update channel_set only after successful
  channel switching; keep HX710B scale based on the documented fixed
  gain of 128; add direct ARRAY_SIZE/types includes; use pahole to
  verify and improve hx711_chip_info field ordering
- Reworked Kconfig text to use "HX711 and compatible ADCs" and list
  supported AVIA ADCs one per line.
- Restored/updated driver header and module description wording while
  keeping the bitbanging context.

Changes in v2:
- See individual patch changelogs for full details.
- dt-bindings: add dvdd-supply, vsup-supply, rate-gpios; allOf if/then
  for HX710B; fix clock-frequency description; remove dead vendor URL;
  clarify AVDD as voltage reference on both chips
- driver: fix pulse count bug ({25,26}->{1,2}); move counts to
  chan->address; add fixed_gain flag; add .differential/.channel2;
  remove NULL check; drop reset_channel; pass iio_chan_spec * directly

Piyush Patle (7):
  dt-bindings: iio: adc: avia-hx711: add avia,hx710b compatible
  iio: adc: hx711: move scale computation to per-device storage
  iio: adc: hx711: update Kconfig, module description and file header
  iio: adc: hx711: introduce hx711_chip_info per-variant structure
  iio: adc: hx711: pass trailing pulse count into hx711_read()
  iio: adc: hx711: pass iio_chan_spec to hx711_reset_read()
  iio: adc: hx711: add support for HX710B

 .../bindings/iio/adc/avia-hx711.yaml          |  82 +++++-
 drivers/iio/adc/Kconfig                       |   8 +-
 drivers/iio/adc/hx711.c                       | 278 ++++++++++++++----
 3 files changed, 297 insertions(+), 71 deletions(-)

-- 
2.43.0

