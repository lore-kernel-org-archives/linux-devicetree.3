Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE94BC02E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 19:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526708; cv=none; b=WX+tDV0022ONftoHzJXhDREsOfM8xqvD3j0TtEo2DjizoYMl48mzPC0MWE7rDB2VtwnAFmzXt/BC8o1NOLwqfpAlSgUPphJW6btC3k7mJTEbgrRY3kFN7g6+3C18SWHaQ+VID7aifzzIqIlxgHjwBlTREDJyu0MnVS9JGwklQdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526708; c=relaxed/simple;
	bh=/bV64msSqSRcKdn5zUAfHwX3xqByCyEZfFcODECYZ5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HlTvM8ocG5F57YXHAuGLjvxAdjZhHcgNnGID/0ycowtAvovTt4PucNc15K/5EPoCTuUGFVo8kCNM5QbQALmSHaLs1o2TpJCkYjr8CivbxV56kxtPZH7U5UIvHwE9jyZLpyVsayj+pl13neCAboO5Lz1sOaBPfrOwwyEhi2HQ1+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7bKWAC1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7bKWAC1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso4138257f8f.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778526705; x=1779131505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YmHJticu6I9cJGzHOpTilWbp0zgjsUaADkfyTWFWIYU=;
        b=V7bKWAC18y0TpSw3qoSuRByWyygvI70FnIIGsNGixqZlBxuP6joMVrGxB9XibOZ1kU
         zSTpLuGA8MuiIpvj1/jvmZpKHt1kkjGL6fr3rYpL2c6HJtnpDPfcu83mJwVMoLgAtZxO
         GmE9NoI2CTXtW3VUfYNNZ1q88ae8s+JVR059abwUHUc3JhdY+RkFMOPbpiJqhfmHNAbG
         PszPQTnVfoS+VSh8qbBKXuKLqWTArVRDJk4/ZjUX4LjV/cMkT+hGi95FAGLqw+oQxcbI
         mHxBnUOYgTl6IyrNDgM/f39Ba8V2NLw/+fztt0a9zUaYGBofggeQSZOWgoCH9cFi2nkP
         y0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778526705; x=1779131505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmHJticu6I9cJGzHOpTilWbp0zgjsUaADkfyTWFWIYU=;
        b=JVHr7+c4ipoCQRICA/O5P0A0ZtG/NzpYYI12wZ4Xu5rpZxrGrEJwtBR6Dy9BHnGqWf
         crjd3BOsTTbc/WRRB5h0S6luTYMS9M7+Vq0Cic9EG7pccNvp1dZO4kVDfZZ4QGduodYd
         +bP4QGAOVE0fe8xB0yj3EZAq+PuHOA7b436LK3qbEiQjDzT4amm9v5aa+IodGcm7hpSi
         2YF4sQtp6x335p3ADGyEzd4jo85nnCYX1I4AFAJLZ8pm2Qx+XaD49JRC616kq5u/VlRj
         0srFDhWOvZAsMYLsn/ZxrX35e6d3CJksxoAc/XXVh1Rbr1Q37SP4AsCr0n4+ef9URUXZ
         8oIw==
X-Forwarded-Encrypted: i=1; AFNElJ/rnQyFFZR2Ucgwh3gryXWo8slOOk55BFb2BEjwNXDN67HmYNVp6whple5wyKX+ohn1l3J5/9f1Ssya@vger.kernel.org
X-Gm-Message-State: AOJu0YwGnIwT8wFhgOXfSqJF+3SiBo6lD5dt/nR9DBjvFik8Q94WuTaQ
	yxya7pKfbiO4DcrWFsfAw6fEPWWo+vHc5IeY1haJe42V1/JtXQtSbAzeWYgVcgKy
X-Gm-Gg: Acq92OGou8DcjKYyg804WxXPD/pwTvSqmqG/RxIIVhKb1z0O1tACGACVzciFLyy97hS
	FT3r8heUlxiIYcMWi37flQZKwRfLq7ZEJWty6qr8IpgZ9c4NoElgA7nWA5Ry+z8De27xOmCT0bQ
	vvZPnvd1jlyuq3+qmNiSjY6b9uESMRdCp96MZ+cAesfwKFsF63iK54vNIIDoOrmQ7PNI+uW7K07
	my2Dx1uO2lApHTbWUJR4wmXdpWFFAdc7YFuxFeCQZZLczLhp5K+zpptjo/eJEOGGf0+vvl3QUZ9
	x9JmEHeNp3PdPcLXgaiIbV1OB/zq345E/dJJqdWdHm5HAXBdDk0LwUSvfdft2Mf/vxSSoocaZpl
	UrUL/xpFO3arsZP6bzP7aJXOWTUHOtcnzvOttnPxKjjo2B1ron5DqrVNUN0L1CFmhK2W+L8IqjI
	wCccd9hC2Nb7ZnQ6N74+7BEaUNPasIohHSW4fK1Il32R6M5xBtQjfnNLujWmknI8lba2LjCLcIA
	LiWBeYn
X-Received: by 2002:a5d:5c84:0:b0:43f:e721:76bf with SMTP id ffacd0b85a97d-4515df66f27mr37344432f8f.41.1778526704678;
        Mon, 11 May 2026 12:11:44 -0700 (PDT)
Received: from ai-node.taila4f726.ts.net (89-139-15-25.bb.netvision.net.il. [89.139.15.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a5b65sm28541785f8f.8.2026.05.11.12.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:11:44 -0700 (PDT)
From: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
To: jic23@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Kulikov <vlad.kulikov.c@gmail.com>
Subject: [PATCH v3 0/2] iio: magnetometer: add MEMSIC MMC5983MA driver
Date: Mon, 11 May 2026 19:11:33 +0000
Message-ID: <20260511191135.36691-1-vlad.kulikov.c@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an IIO driver for the MEMSIC MMC5983MA 3-axis magnetometer over
I2C. The driver provides raw magnetic field readings with
per-measurement SET/RESET offset cancellation, giving 18-bit output
with a full-scale range of +/-8 Gauss.

MMC5983MA is not register-compatible with the existing MEMSIC
magnetometer drivers. It has a different register map, 18-bit output
data format, and I2C/SPI transport support.

Tested on a Raspberry Pi 2B with the sensor on I2C-1 at 0x30.

The initial driver implements the validated I2C single-measurement path.
Other chip features are left for future work:

- SPI transport: the binding describes SPI wiring, but driver support is
  left for follow-up validation of the SPI command and SET/RESET
  sequencing.
- Temperature channel: left until the temperature output behavior is
  better validated.
- Continuous measurement mode and Auto SET/RESET: left until the
  interaction between CMM, TM_M, Meas_M_Done, and SET/RESET sequencing
  is better understood.
- Saturation/self-test bits and BW/decimation tuning: not exposed until
  their behavior can be described reliably through stable IIO ABI.

The driver uses a conservative 500 us post-SET/RESET delay before
starting the following measurement. The datasheet describes a 500 ns
SET/RESET coil pulse, but testing showed that a longer software delay is
needed before taking the next measurement.

Changes since v2:
- Driver:
  - refactored SET/RESET coil pulse into mmc5983_pulse_coil() helper
  - used USEC_PER_MSEC for regmap_read_poll_timeout and fsleep constants
- DT binding:
  - removed redundant comments from examples
- Cover letter:
  - added "why a new driver" explanation
- Collected Reviewed-by and Acked-by tags

Changes since v1:
- DT binding:
  - added SPI bus support, interrupts, and vddio-supply
  - made vdd-supply required
  - switched to unevaluatedProperties with spi-peripheral-props ref
- Driver:
  - replaced scoped_guard() with guard(mutex) in a case block
  - added datasheet page references for timing values
  - changed product ID mismatch from probe failure to dev_info()
  - hardcoded the IIO device name
  - added trailing commas
  - added local struct device and regmap pointers in mmc5983_init()
- MAINTAINERS:
  - split binding and driver F: entries across the relevant patches

Vladislav Kulikov (2):
  dt-bindings: iio: magnetometer: add MEMSIC MMC5983MA
  iio: magnetometer: add driver for MEMSIC MMC5983MA

 .../iio/magnetometer/memsic,mmc5983.yaml      |  63 ++++
 MAINTAINERS                                   |   7 +
 drivers/iio/magnetometer/Kconfig              |  11 +
 drivers/iio/magnetometer/Makefile             |   1 +
 drivers/iio/magnetometer/mmc5983.c            | 345 ++++++++++++++++++
 5 files changed, 427 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml
 create mode 100644 drivers/iio/magnetometer/mmc5983.c


base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
-- 
2.43.0

