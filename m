Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E12311C38
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 20:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782245491; cv=none; b=ENURtLIAnlaDDq+fsIk0HGYtVHeoj3IS4n2tWctjM7/QRexN722LOcrod+SPLR19Ik1gLzVWcef2wpQus6UG/VXt9XHlM0Qf3syiIe9ri1fe3d1MRn5S12GMF7zEzUAiSfnH3v15NM/qp0HVcrdJhop1ihdPDjv6E6v4BlVvQw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782245491; c=relaxed/simple;
	bh=w+znsPWR2m+FtXWrHaMqdzCF10WMGywSmA7kz9Jb7Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiHyAYACNqI3WfSMNKwA+rQAbt7RipJekAAcCe/+enB9HBouOi3Ge5D6C3QtsDZy6U/eaiDfHDbPb/Z4z8h1gJd8obhPPR7NKAfWLPWOupxpRAgQfynD+XdWxNeWxMnm4l09iHUPlrGbZEs31p6m2OR26TZ7uf7t6w/VaZZSKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lhnk/2K1; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lhnk/2K1"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ad68b30252so278437e87.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782245488; x=1782850288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eemGmyIckec9AvxQSb5eEYFJSl0M4CtoU51u/KMfkvQ=;
        b=Lhnk/2K1N/4+Xp5qhGXa5lEaPN2cp0zR8vjZjAHMHqLU3cMWMajxaIT54s4I+hTdM7
         4WEF2s7hwvwew6XTiI3OJLVJg3wkkcsP1CIkgY77sbbu9C+Ttfx7df1OzjqN1yBIUmNj
         VeFE6ozvQsQHwANRCYnRAeyczXZGikryhWCUe6CVuIY7Lua0fHyJvb0FPdNgFCDekcVM
         hDt7XlmKHeAs8fB6IG3ZNDnCbLppUKBCT5dyGpcbdNf8fhg4g2eZ1/dj4JG6Odck1T+b
         JBdJmgne9KgkXtHet+h3qPHxmGD2P6yNCDhPL7QjiRHYjnVF1h8RS+MPihrrsmL6SFUq
         RVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245488; x=1782850288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eemGmyIckec9AvxQSb5eEYFJSl0M4CtoU51u/KMfkvQ=;
        b=GycRY6oTPmfppTeVUtE0ZXA/pVpmiPhfKtnnlA1dYx51wAGif4NllVJXU9rQv904e8
         tmTk9y2AdnolxLTwFqbfyPq/pOHxr4bkFLux0WBcninGKxU/wC0+/gRzKDJjGiTZ5X5b
         SdgOE8i2qvtoAQOoQP74h+KDhzNhacxZmdribS+MGHN2f06sz/FgOeP5nS0ZSsLVU+rB
         7N3jgFPkNFrwMCJM539dPyD/+JQWAYA4AAuxx1CK0N9Gpugx/Wdlum69B8NPmVFRDQQa
         12VJYbTF2zYO1HDXmz/Eq8tN7uXlCQvAwjbCn45A9UpL/t1Y8mAwR1bxaM9nbn2Gniry
         IJyw==
X-Forwarded-Encrypted: i=1; AFNElJ/IB6TYJKcXFgY/WEsePzzqpoR+3hLqOWxlyIz7OuFQCKD9G08UzQzB91NVx7NkvmO5Fd+amaNfyy4A@vger.kernel.org
X-Gm-Message-State: AOJu0YwEIbr9WgTlLX8+kMehkXUN5X7xrzBD/xgIGdqQRZuAisbhMytq
	PBBLsrQlBfHL8XJ7KwS5cmkQy4Pr0W6qoZmmvLfZ0Uum8zVFCxXtIIdjNOAkDcWzqH6HBg==
X-Gm-Gg: AfdE7cm3PJvjudAYJyB7yin4s3e6xIf1OcU+TpATqqszKNnz9LQAkLSBJUPTlRJ6tB0
	ejOhfAKPUTIOLJKhINqAU/I+YlfTTN+NhEQbq1XYteAtOxHG1h7hFB8C1s9bP+RcuBoo/7In2px
	/9TMXWmMbdDgkwBqks54+LSUpxczQ8S0iZ/q0eLWgR1GB/5qvQnqCYNLt7n9LmuCv2QEXXbH1G3
	ko8jucm5f2OwZC5CShpLt7QNYun1SuIhvco84QSjtebAwPwwK6VLG0d9Xd2ZMa2Unt/QcDAreHP
	g2ZXkQUKj/fAFeP6K9TapCqe8Gn2l2BbaiU5awCVMwjIqUSwL2Ph0dVXSt16xMhYk7QyzTjePgu
	f/xdjzktkdcmGySHHftxBNNYWxKmJtds0Rm0VgJ2pfH93Rm1G+PLStITTJNaQN94MchnleD/QKn
	JU6+TOy+o756sRWTm0nZ/LJvBbPO+kQAsR5mpZxnU5EkP6Vdr0oFSIn3uW
X-Received: by 2002:a05:6512:4605:b0:5ad:3035:b353 with SMTP id 2adb3069b0e04-5ae9d5b8117mr7515e87.53.1782245487593;
        Tue, 23 Jun 2026 13:11:27 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69551082sm1063392e87.26.2026.06.23.13.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:11:27 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	conor@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v5 0/3] iio: health: add MAX86150 ECG and PPG biosensor driver
Date: Tue, 23 Jun 2026 23:11:20 +0300
Message-ID: <20260623201124.18271-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260623174600.17100-1-shofiqtest@gmail.com>
References: <20260623174600.17100-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v5 (addressing Conor Dooley and Sashiko review of v4):

DT binding (Conor Dooley):
- Rename binding file and compatible to adi,max86150 per ADI policy for
  former Maxim products.
- Add missing power supply properties: avdd-supply (analog core),
  vref-supply (ECG reference); make all four supplies required.
- Fix vdd-supply description: remove voltage tolerances; say "1.8 V".
- Fix leds-supply description: say "typically 3.3 V" (datasheet max
  is 5.0 V, not 5.5 V as previously stated).
- Rename example node to heart-rate@5e per prior DT art.

Driver (Sashiko):
- [High] Re-assign indio_dev->trig after trigger registration so the
  hardware trigger is the default and iio_trigger_validate_own_device
  accepts writes to current_trigger without a manual sysfs step.
  iio_device_unregister() releases the reference via iio_trigger_put().
- [High] Switch from devm_request_irq() to devm_request_threaded_irq()
  with IRQF_ONESHOT. A hard handler returning IRQ_HANDLED on a
  level-triggered line unmasks the still-asserted INT pin and causes an
  immediate re-fire loop. IRQF_ONESHOT keeps the line masked until
  max86150_trigger_handler reads INT_STATUS1 and de-asserts the source.
- [Medium] Fix overflow timestamps: when OVF_COUNTER > 0, pf->timestamp
  reflects an earlier A_FULL event and is no longer a valid anchor.
  Capture ktime_get_ns() at drain time and reconstruct timestamps
  relative to the newest surviving sample instead.
- [Medium] Pad fifo_raw to ARCH_DMA_MINALIGN bytes so that buf starts
  in the next cacheline. Previously the 9-byte fifo_raw (DMA target)
  and buf (CPU push buffer) shared a cacheline, violating DMA API
  constraints flagged by CONFIG_DMA_API_DEBUG.
- [Medium] Replace blind usleep_range() in read_raw() with
  regmap_read_poll_timeout() on the PPG_RDY bit. A fixed 11 ms sleep
  risks reading an empty FIFO if the internal oscillator starts slower
  than nominal; polling with a 25 ms timeout is robust.

Link: https://lore.kernel.org/linux-iio/20260623174600.17100-1-shofiqtest@gmail.com/
  v4 cover letter

Md Shofiqul Islam (3):
  dt-bindings: iio: health: add adi,max86150
  iio: health: add MAX86150 ECG and PPG biosensor driver
  MAINTAINERS: add entry for MAX86150 IIO health driver

 .../bindings/iio/health/adi,max86150.yaml     |  78 ++
 MAINTAINERS                                   |   7 +
 drivers/iio/health/Kconfig                    |  23 +
 drivers/iio/health/Makefile                   |   1 +
 drivers/iio/health/max86150.c                 | 730 ++++++++++++++++++
 5 files changed, 839 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
 create mode 100644 drivers/iio/health/max86150.c

-- 
2.51.1

