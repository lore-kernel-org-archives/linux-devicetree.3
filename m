Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3D9393DDB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141758; cv=none; b=u2jroUbWkH/+hQCyo3EoznUCwAhq93huRbW0AhneDxv+b7dyt16rxDzKqInxs6FHlnBF8A5qOVaQbe3OnC5Eo4xvvSsXsAlLkmR6G4o2ekpmnncqMJ12UGkOPujOOcbo0e/OSF2XfLzIA71YxBqAhoubFEEEvh5d+IqhFIcmep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141758; c=relaxed/simple;
	bh=acjswfeq8oZRH84QTr3JJj65K4KOGRFPYT+Pa4T4ICg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ig7eHx5gt9m4IKHB71239cayQMWOr7Yk9vB0Xvw4WQjyfbvhykDJdCeGSfMKS2o56aP3yWvwra8+nVCGDGCffwlZ/6tZSsvIpOwf/mp7qlnmeWxkbPK1W2D/BloTE0tpbMPQDdV7yZTMoKd95/NNRw4mRPrdjNXE2+j7Iyviarc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKVmGiPE; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKVmGiPE"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-83537a80ab6so1916671b3a.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141756; x=1779746556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yTPoUclSMNL0BJRpMJ7+gdny1W+4ZcS3G2Is/IZvIk=;
        b=FKVmGiPE0b35iZBxAxNuIVqXuCLFkKL5gBE23C4Y0oMFlOkIt8YIWNn3FAiCZq7ZT2
         X9AR8Rbej5P/6EyEtZxBxa2Vhwr/DQEL08tDj2uakBTDoIdF/EGJ0CZlEvYO85woD+m3
         T2ZsJ1Ytn9X5/URXPDxBEDaRTcktaaLxHFduzwpXcldPkxsmjW4RXL7Pe0BXIdm9DH7g
         RlFqMXwr2E7bkU3sElQl+a6wYrSbRdCiTSHGg7x14p0XNgEEg5W41Pie/li6XDUy2yuX
         pJMOa6AvxFHERNmzGPSVXFRT7RQaNz3K+5ahLlcOmsC7Zszj42deiTk1PwRC1tCfvArs
         v0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141756; x=1779746556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yTPoUclSMNL0BJRpMJ7+gdny1W+4ZcS3G2Is/IZvIk=;
        b=DbkxdUwIJhAGZnyXbntlkDnRoEUi0KJA1wnxRtWlEvDkGU3zvltE4QKP4iiOdFGiT6
         NAiTtCsjEC5kvKgF3Y57SKzzZt7gECunv6Y767MstGSFOlV8yptKLrSHctD3bGd66rSq
         i9FxkslFQV/wa2BZmpbZqbpHJ0tG6OcAjuQqU+twAcWhm5KovltnLtt+u9PF9gbu6EdZ
         /+hhdTctXVaM9nTw/SOumBwIWv4C4S3ihIP+oy1Jl40Fs88oTjm8HnWpzJ6I5E0qo6/J
         8UhJoCBssmqgAZIJpPs5OpUNxv2e7zdQGBY1BjIQdAHRcJ0rG7NQacK8/lYRAYyfeFP6
         a7Dw==
X-Forwarded-Encrypted: i=1; AFNElJ8VWSq7QhsePtB0RdimD1U+evGWItKAqx80h6LVpEdcvxrMLyA/HvSFqkLApyHL53GmsKNflMVqhpDI@vger.kernel.org
X-Gm-Message-State: AOJu0YzGVVE8owVGOqdBjKbOWqtEF8/FanAB+NGRf86X6diLtt0fN4wt
	ImYRgAozfnnl/Y9Q+hL+ArhwtFFnD4wqc80rApToZhjACVfyIg3wTzlC
X-Gm-Gg: Acq92OGSK5JG06rb7bo81+F8xcDMssuiMhDrdRoBJGjUh3RcABq7/mrVYsohnyeuRQ6
	fgrQBijkGywm2w9q4fnsTdv8i08erdf0OrdkQv7S5cUELmm1JBFK7+iMYMzCggQATama/+pcCON
	sGluyMCDQJcA0gjob7FkWKnj9PUSvCJ68s8Rkql4yxI1xuq+gkOIXwI/ka58soCKr7SngHr9tuX
	aH5cUi60c7jwA2B0G6chntb3Jq2GGRQLTZKD3TF4pNFBisbQe3lpBK2QDV9VQNo2I0BAzbc5e5W
	lEivPzDQHK2BLrNRbUm8abwVFDvfJQHziemk0Kp+4Uy64ebnix0+NnwXj+zHJtTZL0xJkJ2pjqA
	il948Zc/b8tRMTkF+I7c06VPI5eYQ7Y/WAi1HXmubURj05rVmABnnpAw+WTL4twblK63rQS/So8
	ZfrgcyCsVce+8EDpUuyx/ZsFCCMB3eE+4jc0lRVQyYMDWCgi8ypr7q+gcblsVTPa17zdGpeqVzJ
	bNR2LuA+9JkQEHJpWpv7QFsG71Pu7LWn2wLk5rak7MKEl0SQSLPQdLpmJTf
X-Received: by 2002:a05:6a00:909d:b0:82f:4566:bbdf with SMTP id d2e1a72fcca58-83f33c9a61cmr16922727b3a.14.1779141756403;
        Mon, 18 May 2026 15:02:36 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977b128sm15772960b3a.22.2026.05.18.15.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:02:35 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Klinger <ak@it-klinger.de>,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v9 00/11] iio: adc: Add support for AVIA HX710B ADC
Date: Tue, 19 May 2026 03:32:16 +0530
Message-ID: <20260518220228.63322-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HX710B is a 24-bit ADC from AVIA Semiconductor, related to the
HX711 already supported in this driver.  Unlike the HX711 (which has
selectable gain and two input channels), the HX710B has a fixed gain
of 128 and two operating modes selected by the trailing PD_SCK pulse
count after each conversion:

  25 pulses (1 trailing): differential input at 10 SPS
  26 pulses (2 trailing): DVDD-AVDD supply monitor at 40 SPS
  27 pulses (3 trailing): differential input at 40 SPS

This series first extends the existing HX711 binding and driver with
preparatory refactoring, then adds HX710B support on top.

The differential input is exposed as a single IIO channel with
IIO_CHAN_INFO_SAMP_FREQ, allowing userspace to select 10 or 40 SPS
without needing two separate channels for the same physical input.
The supply monitor is a second channel at fixed 40 SPS.

Patches 01/11, 02/11, 03/11, and 05/11 have already been applied to
the iio.git testing branch.  They are re-included here so the series
applies cleanly as a unit.

Changes from v8:
  - 04/11: Dropped a misleading sentence from the commit message that
    suggested HX711-only binding extensions live in earlier patches
    (they do not; the earlier patches extend the shared binding).
  - 06/11: No code change.  Added a note below the --- line clarifying
    that __counted_by_ptr() is available since 6.12 (this tree is
    6.17), so the annotation is well-defined.
  - 11/11: Redesigned HX710B channel layout per Jonathan's v8 review.
    Modes 1 and 3 both read the same physical differential input, so
    they are now a single IIO channel with IIO_CHAN_INFO_SAMP_FREQ
    instead of two separate channels.  Added hx710b_write_raw() and
    hx710b_read_avail() to let userspace control the sample rate.
    Introduced hx710b_trailing_pulses() helper so .address is no longer
    needed in the channel spec.  Fixed hx711_trigger() to check the
    return value of hx711_reset_read() and bail out on error.  Fixed
    channel_set update ordering in hx711_set_hx710b_channel() so the
    field is written immediately after hx711_read() commits the new
    hardware mode, before waiting for the chip to be ready.

Piyush Patle (11):
  dt-bindings: iio: adc: hx711: clean up existing binding text
  dt-bindings: iio: adc: hx711: add VSUP supply property
  dt-bindings: iio: adc: hx711: add RATE GPIO property
  dt-bindings: iio: adc: hx711: add HX710B support
  iio: adc: hx711: move scale computation to per-device storage
  iio: adc: hx711: introduce hx711_chip_info structure
  iio: adc: hx711: pass trailing pulse count into hx711_read
  iio: adc: hx711: split variable assignments in hx711_read and
    hx711_reset
  iio: adc: hx711: localize loop iterators in hx711_read
  iio: adc: hx711: pass iio_chan_spec to hx711_reset_read
  iio: adc: hx711: add support for HX710B

 .../bindings/iio/adc/avia-hx711.yaml          |  77 +++-
 drivers/iio/adc/Kconfig                       |   8 +-
 drivers/iio/adc/hx711.c                       | 362 ++++++++++++++----
 3 files changed, 362 insertions(+), 85 deletions(-)

-- 
2.43.0

