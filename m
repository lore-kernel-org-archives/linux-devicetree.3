Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5353EB0EE
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423644; cv=none; b=WX0cow4Js9YbJeNrhxzSHfBrRqGmD3ldabxSJVcuBr04BjGMefoZ7BUm047truLwtgJq1SyrgPHVHu2M7UXc/GZeicsiqZkgZgAS8cP2XeBowvF5Av+Sa3PCTHr53Ca6BaB+ygitJrLN2TQrJKUCU1CWllJamTMGYYBATsXsjqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423644; c=relaxed/simple;
	bh=nUd4gAMcOpB9jeeI7zarxSmyxqEXFICLV7XY6/voWEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G5yVjoj8XcMDKRx981CeasQGnzEqNeXrUtF9zK250QsQRwzt7AxQd4aiYgrsS0weXklfiE8ubHOKqXwlewIshZqHm7096gtyKzq9MALPCfYk/NyqcC5ZWXZT/hQ5xLigwRoDSDHw7gNTj5GbBRnaHHmeH2IkhXM+FGh88uVdhUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mw1vA6Ew; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mw1vA6Ew"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso3778939e87.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783423638; x=1784028438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKrUxXCYekUi2G/xzFSEkuhD2hb9AvZ8aLdmpQZQD1o=;
        b=Mw1vA6EwiZTJ7E8TkyNtcp/+5lJ1Cn74qoceQNuo8IG80h8CK+FtVM1LUf00Cshmjm
         EIBKhjec2f/YDBRB6z6AFjj2pBTcoH+By+TClXFVBNWAzH/huvUkCw4Qg3Da8LXk9oy0
         EGVrI36uvkptO2SECPmJok18o/lB8zpriHiM+/dRFzAwNtr2THEdfD31eauPzErs0vRt
         VD8wDqt988wWWSynQfUxN8CTtToujVlCKmVexYOJhYPG2Z3wx92VZtJlrPG8paL9Hpsm
         CrAB4dRd8ckjJ6oCcGCqmGZm/VeDZKdPJzWCxO7ZxQX37Gq2QIiELxDlMYc+WAwuYlpy
         JqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423638; x=1784028438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKrUxXCYekUi2G/xzFSEkuhD2hb9AvZ8aLdmpQZQD1o=;
        b=QhF9IZkFcYnWL75Xn6pEltyBRs4dGO8iZ9xQd5h82Rm6owlFHSqJckDN57NEGnKU2J
         3H5d5Q6wuzgNKubRjCit4WWElKh0U9Xx6sZC83MlHw4tgKhjYhijxpYQvHuZ1hBF7rcS
         xBlqBCqP/cqB7+8ki8O3iizEeG7YdnF4nMndtDZ3uRmoc1kv8wK9G2Dlgsw5ZnYHDYlR
         2LZHWr7HCZi64WT4QrK/ABauZ8LqPS1sVok2/rn1c3O0eDBML6ixfNMdYO4LhU3g1WHt
         y5pRGjMhfn7NloT5gr0CJQUm5Q/JB45ySCi37+4/brEfuxo0c+6XQpXSAwSHW3cckcKI
         EEhw==
X-Forwarded-Encrypted: i=1; AHgh+RpT1Lr8xVAw2/VcrnCdE5ncL47Jc3hh1RU6ib9p7jeTmHovs89BU7aMSfogFWUQUKN3umF404w91ciI@vger.kernel.org
X-Gm-Message-State: AOJu0YzWtEf7in3Y41rQBXSCVKooNQqlUljj+57bTA/TvvRN0yP83MOC
	F/cdID//wV1NkuzfVHbEOBOtZTijfZrrqkVxeQEBxiH2vMFyDm2ypOMy
X-Gm-Gg: AfdE7cld/t3a7hs6TXlbW4FkdIX6W8J7y7OI5vWCfIs6hNWVd6dW7v5CfEA7dAMaDgp
	ido+4XkIN8QGzvDudAAVSEkWnbGuAhLK6lCnsNjgoulsNCyWd/WxVJzEtYlvMJI2m/N01CwAGMd
	Z9vELftB7Eu+VJf2GnYOXv4+u2A3WmkfLj4Q5DgR7CGcMM3HDhxSwFAcs0Ngbdp1kY9KckMwGg9
	AFyVo6i9rjZTPcRM+tb7AuYEriuoR80b47r3unr1DI5Or8XGsl9uPUUryps2b21boAfHr/fxnUR
	OjP1uWR5R0OUn3aaW3uAT9x35MwbpjwmXoYcleVna0H7I0tUsml2laPhi9oNWvevN3HjRlgGOEZ
	z5TfiTsTnD52wki1Jj1TbkmFghIJw6GuOgKw1bnxtoiS9iK/bJGahQNMPWGMOlhWEIj2TFKuvfs
	KSWJa/YvuQsLE3fWmm+fO2drSeSOPQavmdyj2DkUkUVA/JaQ==
X-Received: by 2002:a05:6512:8351:b0:5ae:cee7:52bf with SMTP id 2adb3069b0e04-5b007b70ff3mr874174e87.9.1783423637363;
        Tue, 07 Jul 2026 04:27:17 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1890asm23602331fa.3.2026.07.07.04.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:27:16 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@intel.com,
	u.kleine-koenig@baylibre.com,
	joshua.crofts1@gmail.com
Subject: [PATCH v9 0/2] iio: health: add MAX86150 ECG and PPG biosensor driver
Date: Tue,  7 Jul 2026 14:27:12 +0300
Message-ID: <20260707112714.2261727-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings and an IIO driver for the Analog Devices MAX86150
integrated biosensor, which combines two PPG optical channels (Red/IR
LED) and one ECG biopotential channel in a single I2C device.

Md Shofiqul Islam (2):
  dt-bindings: iio: health: add adi,max86150
  iio: health: add MAX86150 ECG and PPG biosensor driver

 .../bindings/iio/health/adi,max86150.yaml     |  65 ++
 MAINTAINERS                                   |   7 +
 drivers/iio/health/Kconfig                    |  17 +
 drivers/iio/health/Makefile                   |   1 +
 drivers/iio/health/max86150.c                 | 564 ++++++++++++++++++
 5 files changed, 654 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
 create mode 100644 drivers/iio/health/max86150.c

Changes in v9:
- Split MAINTAINERS correctly: M:/L:/S:/F: yaml entry in DT binding
  patch, F: .c entry added in driver patch (Joshua Crofts, Jonathan
  Cameron)
- Reorder includes: move linux/iio/* group after linux/module.h,
  linux/regmap.h, linux/regulator/consumer.h (Andy Shevchenko)
- Add linux/timekeeping.h for ktime_get_ns() (IWYU)
- Add synchronize_irq() in predisable() after masking the hardware
  interrupt, preventing a race where a threaded handler in flight
  dereferences active_scan_mask after the IIO core clears it
- Clear INT_STATUS1 before regmap_read_poll_timeout() to avoid
  latching on a stale PPG_RDY flag from a previous session
- Detect FIFO exactly-full condition (wr_ptr == rd_ptr with
  OVF_COUNTER == 0) using the A_FULL status bit so that a full
  32-sample FIFO is not silently treated as empty
- Use unsigned int for FIFO pointer and counter variables; use s32
  for ECG and u32 for PPG values throughout
- Use local struct device *dev in probe() to reduce code repetition
- Remove explicit enum values from scan index (= 0, 1, 2); let
  C auto-increment assign them consistently
- Use named .name initializer in i2c_device_id[] (Uwe Kleine-Koenig,
  already in v8)

Changes in v8:
- Fold MAINTAINERS entry into the driver patch rather than a separate
  patch (Joshua Crofts, Jonathan Cameron)
- Use named .name initializer in i2c_device_id[] (Uwe Kleine-Koenig)

Changes in v7:
- Replace devm_iio_triggered_buffer_setup() with
  devm_iio_kfifo_buffer_setup() to match FIFO-drain pattern
- Use regmap_noinc_read() for burst FIFO reads
- Use IIO_DECLARE_BUFFER_WITH_TS and iio_push_to_buffers_with_ts()
- Back-calculate per-sample timestamps from IRQ arrival time
- Use IIO_DMA_MINALIGN for DMA-safe FIFO read buffer
- Use fsleep() instead of msleep() for short delays
- Use NSEC_PER_MSEC constant for sample period
- Use devm_regulator_get_enable() for power supplies
- Use regmap_set_bits()/regmap_clear_bits() for single-direction writes
- Return IRQ_NONE when A_FULL is not set
- Discard samples on FIFO overflow (timestamps unreliable)
- Add devm_add_action_or_reset() cleanup for power-down on error
- Add FIFO overflow detection and reset
- Use regmap_read_poll_timeout() instead of fixed sleep in read_raw

-- 
2.51.1
