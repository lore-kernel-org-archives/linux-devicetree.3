Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B017305689
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230162; cv=none; b=Iv8nE9j/p8InIhEH6/LuZ+TsBYLNvAu0sQ4UV/UNdFRB0iV5ecdbPlyDZFq5Whqo2PMc6Y6u96IeUW0YWqw3S0xLVmlrcsDwM3aPypW63LRvzIx8BgakLm/C38zpklHIfesBY3iVowtw1U6XR+ZiPkd0DoEUItEqVn/uAdKvNPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230162; c=relaxed/simple;
	bh=T0SiTGRObhjsTPu+h1FAf6ljLkbOXP1HNR4jj07g41o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJGaMoR94jT8m7XLL77LLIyNDb36ogguNc7QdklH359uPxsO7w8LlLRGrW2IoU/RfMXzWGScux2K4YhU9nVUxn52M6FHz4pjftnRCjd3v6hjIyFvdST4Vs1GJubLormitOow1FQ4cLJ0xEVxJy3c/zdG0fBuxLmK6kwxhF5QpB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl6QRMMb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl6QRMMb"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ad583dc41eso4795988e87.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 08:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782230160; x=1782834960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55KrpsLVrgFVm6uOkBGmtvpWY3NBouDgLEEMArVVBP4=;
        b=Pl6QRMMbajWc5rT9fyDk6HNtIoimUjVleHOLKMB5gs3yVIszFcWgQNSf1kgKoG6eXr
         bErZkIMIiStMvd/whBOrCeO1VMqj3+sW06gh5KVSTMzU8LfTkgVNp3HNe8Zl033njdFC
         QAJ5gGGZzG6/7ueqJCPStegxuPq7aOefGYOZAbZi8uyzFu8nyTPbAwxkmZ1tNNYQQC/+
         XzxDYaYWaOuDvBlNph6cSedtbnxmmqNe+po7bRLJstzUtWeYHUgiOj1r5NHA4mR+JHIB
         aP9FBiHcczVghcsbV1/2VFzL7iqm26p98QPCx4quLvgzPELVTZihbcQ2M92vWY80PiS8
         qWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230160; x=1782834960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=55KrpsLVrgFVm6uOkBGmtvpWY3NBouDgLEEMArVVBP4=;
        b=I10rDIo1bmNkeorTdELIwNeF7ejyvAmzqlCObhV2uc5uV8PD510k1UQa0vahsm+WAE
         VqKmzBpNCB+N4PFT+uD+dRst4ybeRNC3KxchAE/RvcR2O5FDFAbCeklnYHzF+rzDxgo0
         3cnBWvDgVPNo9sCK/4/412D5+KRNUxyWPCcZ1BfSuh+NLJ1QNfwNfmu0LAO5ViB9q+h/
         JmCysRXeiWQwz/NHPhLVUYGub9AoHiOTxat3GNl/0R8boacS7XM+dgYhpY0pGmIjIhBY
         zlxySTnBQqgX7LqLDI6ZGMVpI18vwA6mDO0pi5OZQ9lncHb/JJDsdgODBCXuxvQOZlGx
         OurQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JEM61efwP9VAsEuS5ykP8qdaRmasCi/57CTfnrBvPSg0vKEHO4oHFifbUG6TQZTI1CVAWayBByZXm@vger.kernel.org
X-Gm-Message-State: AOJu0YxM4kBo2NCKRDxxdA/jT1iJlZUyD2wW7bNNvo7x6jTPqWVin5z5
	q4GlhKloXJFoMLwp+YZB7L1baH8jRiopPjrf89H+KQgswKU8ggzVpiQR
X-Gm-Gg: AfdE7ckBWVGm7yvusxnG36XiGttc6zt/nirlVJHqBQiXOBfNMyU/h7H22H5T5f8U9ZT
	9Au7hJI/pRIiIOJGlAD/BnVlT4dmGVNe2MLy9Omx39wT2S6hoTMG6aeeermImOnxwIv/Ejs1hXO
	wSCMn9SPp0xhNCOVbolp/2sD/l6X6TDnjx2KWuRes8NeTbyicA8Pt/8zmCIOp6XmF2EhD1BZgd0
	k8DvjE6znVzI0vo2SZWapq+SKp/rSDJhQurXZhzP/5LpZ383Y3S+B4grlWANfMfEdZ3+RPtulTN
	fKkQMbsFqQ6uXE5OD6eq1UCG6e5Xozoe4jd9Rn08MQWZiBN+QkYH5P9HuQMkJLdqxufUdRCOF5g
	1OnkGwu+ACFbsfzmt5HmwNYNEfqD6KiQuLJZe2p/CcKjrKLYJA2whlPThDrB14YA2etQ27w0S5w
	BZiMHfkcP/i3M7QluRTrZHpIx/wriW014/eF2D3/rG0pqTJw==
X-Received: by 2002:a05:6512:6c9:b0:5aa:71de:74ca with SMTP id 2adb3069b0e04-5ae3511d20dmr877415e87.28.1782230159378;
        Tue, 23 Jun 2026 08:55:59 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a6a2sm908946e87.46.2026.06.23.08.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:55:59 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v2 0/3] iio: health: add MAX86150 ECG and PPG biosensor driver
Date: Tue, 23 Jun 2026 18:55:53 +0300
Message-ID: <20260623155556.13701-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260623140113.12574-1-shofiqtest@gmail.com>
References: <20260623140113.12574-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX86150 (Maxim/Analog Devices) combines two PPG optical channels
(Red/IR LED) and one ECG biopotential channel in a single I2C device.
Data is produced at up to 3200 Hz and buffered in a 32-entry hardware
FIFO with a configurable almost-full interrupt.

This series adds:
  1. DT binding YAML schema for maxim,max86150
  2. IIO driver with triggered buffer support
  3. MAINTAINERS entry

Changes in v2 (addressing Sashiko AI review, Joshua Crofts, Krzysztof Kozlowski):
  - Fix buffer overflow: expand scan buffer to s32 buf[6] to hold
    3 x s32 channels + 4-byte pad + s64 timestamp (24 bytes total)
  - Add iio_device_claim_direct() in read_raw to prevent concurrent
    sysfs reads from corrupting FIFO pointers during buffer capture
  - Fix FIFO-full detection: read OVF_COUNTER to distinguish a fully
    saturated FIFO (wr_ptr == rd_ptr after wrap) from an empty one
  - Fix active_scan_mask handling: pack only active channels at
    consecutive positions using test_bit(idx, active_scan_mask)
  - Remove IRQF_ONESHOT from IRQ request (not needed for edge-triggered;
    iio_trigger_generic_data_rdy_poll is a hard-IRQ handler)
  - Add set_trigger_state callback to enable/disable A_FULL interrupt
    only when the IIO buffer is active, preventing the interrupt line
    from asserting before the handler is registered
  - Fix endianness: change scan_type.endianness from IIO_LE to IIO_CPU
    to match native integers written directly into the buffer
  - Add max86150_powerdown() devm action to disable interrupts and
    assert SYS_SHDN on driver unload
  - Add devm_regulator_get_enable() for vdd-supply and leds-supply
    before any I2C access
  - Add devm action for iio_trigger_put() to balance the reference
    count increment from iio_trigger_get()
  - Split DT binding into a separate first patch (requested by Joshua Crofts)
  - Add MAINTAINERS entry (requested by Joshua Crofts)

Known limitations (to be addressed in v3):
  - IIO_CHAN_INFO_SCALE not yet implemented
  - Runtime PM (SYS_CTRL SHDN bit) not yet implemented
  - Not yet tested on physical hardware

Md Shofiqul Islam (3):
  dt-bindings: iio: health: add maxim,max86150
  iio: health: add MAX86150 ECG and PPG biosensor driver
  MAINTAINERS: add entry for MAX86150 IIO health driver

 .../bindings/iio/health/maxim,max86150.yaml   |  67 ++
 MAINTAINERS                                   |   7 +
 drivers/iio/health/Kconfig                    |  18 +
 drivers/iio/health/Makefile                   |   1 +
 drivers/iio/health/max86150.c                 | 612 ++++++++++++++++++
 5 files changed, 705 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/health/maxim,max86150.yaml
 create mode 100644 drivers/iio/health/max86150.c

-- 
2.51.1
