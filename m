Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029A1E511
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134872; cv=none; b=mr4uw5FJDNuCmQjlpAf3kaT403a3F9RVjqHoShgxYW9sUzGf6kvDcrAmiVsxFMpIOvYcF0sajuDFdCWBqFMIjsUVZhGSSi7OJcDptOYsF5K0akpjJXifOAuqPeeZ9YQkPewsrh/efWbIrmrXN1FKksrzWdeBinXluO2j1fnGlGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134872; c=relaxed/simple;
	bh=ydJ0FeTXnF3CWjz1VmMKW6XwgKlTkdUnjxsY2JTFk24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMyt3IUjqW7UOLvS0uZ4e8x4eZvCzypHWSfTmZsRdTuSeaUrP1yX2FvVgVRdGzxpxEud+sgH7xtHqAlft6L4v3T3iTEd9QMFKQlLina/QILsprqxcczo/gUg4//BWmkCPmEaB6r95pN9O8xb4jaP/5zPGpOuKylRzwmO3ZvYIN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3qXneyG; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3qXneyG"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dca4debedaso2940626a34.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779134870; x=1779739670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2aMdRv6ihcWtjppf7zSbeituA+UJ2sSFZR2RWfS3c1E=;
        b=q3qXneyGldwHqwPySDXDiyL6BhHx0O6zMii1fBxEK8jojeT4720PafC1t7kfJSSvxl
         LwkLYWx06umGcdSzIyt8nmbwbNkUpLU3yIUi7BH+rF0t+34vfHVKpflX2xvwuwXqfGGX
         owzh4JvN03jpuAsI7aEJbfu04EQ/SdDEQl7wC1FbRiH/x2lkkWhlXTHaZ0dBqh6QgbyW
         DTSpG4Pw1+BxFatqoioCjmDJs4JvPPqKedr/d6tA7WHt4Jg4L9tGAbmzz3BWzDKJe35S
         8Le3662y2s2dQqVog5If16WWzLbXVglV5FghVurIEhIaLz6Rw9fStay2pmn72FvnijJa
         d+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134870; x=1779739670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aMdRv6ihcWtjppf7zSbeituA+UJ2sSFZR2RWfS3c1E=;
        b=SnWP/hT/xJZi5GtNFa1AGt9smho6bpYPmJGxflBrTphORTlokw5PaalaMNYSCflXf0
         D9uN6ilCs5dlH0eBR9WVBCpskfT5fN4i9Q62Npzo9VgfhSeRNOLuSvi7eUProrlsjGxH
         vwNhz7ZtZS338KikUHG7Tqi7y1PrvDDPTS5aVnQTlGpKlNf2UaJQ0LhbHMfRRuebaGeb
         DYUI+Ou2y1uQW06dpM4oLtHklTuHO8U/+0eRE8ru8uq2rS5s7P27dMUbC7VyWt5AJRrj
         b+gWsKlDHkFvTxcZ8pXstssm7cCO9G3TrzOlSCWgBDDVoCrmUKGXbHolvlCM0i8o12so
         88Wg==
X-Forwarded-Encrypted: i=1; AFNElJ9CT3mSGD2JxwP81xHP5+tbkDJjvSAlqEs53TZOOOxDv1ZR0dbeWdyeeejr2GFJxRaAbRgW40Tzfus9@vger.kernel.org
X-Gm-Message-State: AOJu0YxmnW33ej0dR/hqX2LkhLsgyhmGORG2j6q5JAKpLNJ1mArqTt01
	DVH6fO2b9MXNzQ4b2zzx08I/G+/IOn+IYK/tlyk3fptCiGVaT2TirDdZ
X-Gm-Gg: Acq92OESLdH3k6t8KZC9daw/o76GudrRhmvXKHTPIOHYIUrXwmbBipxdK29V2OUZFtu
	PzzEzf8GE9AWGCTeAoYNz1zEAesd6JAlPCmPtMXmdTfbNE5Dv6uMRaUZlgqnuD8FQBuMsofOCfK
	+AOAzkWqGYwVEe4GoPspa3nnbKIJhdnsSQWIYzhn+t+rh1GtUbb4SkDois+9hbQ0BS7eK7WeVKT
	nYpsyL5p79Fsqst4/W1bDJsMocQJkJ408QhOK433R69ZyN92cL4C54TszqAHjtC0531SOquACg+
	mRw7UZzXyuWHXvx2BQ9D1rSlHNYkaO4wv02ykG1+aY7zBgrnyjGuORazO8vEsejakaQaHLEGBFh
	PYJyI8DNe15He8M6mB/V9M6U7tOLJfg3dcWzeItmyn4q56ZnGqklk4WysXp66IpvEY6fqFjvjAh
	49x07+uquOM9HJqVnUf9aL
X-Received: by 2002:a4a:ee07:0:b0:694:914f:c18f with SMTP id 006d021491bc7-69c94294299mr9985227eaf.3.1779134870134;
        Mon, 18 May 2026 13:07:50 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d0462e85esm6113360eaf.6.2026.05.18.13.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 13:07:49 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V8 00/10] Add Invensense ICM42607
Date: Mon, 18 May 2026 15:05:15 -0500
Message-ID: <20260518200526.458421-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the ICM42607 IMU. This sensor shares the same
functionality but a different register layout with the existing
ICM42600.

This driver should work with the ICM42607 and ICM42607P over both I2C
and SPI, however only the ICM42607P over I2C could be tested.

Changes Since V1:
 - Instead of creating a new driver, merged with the existing inv_icm42600
   driver. This necessitated adding some code to the existing driver to
   permit using a different register layout for the same functionality.
 - Split changes up a bit more to decrease the size of the individual
   patches. Note that patch 0004 is still pretty hefty; if I need to split
   further I may need to create some temporary stub functions.
 - Used guard() and PM_RUNTIME_ACQUIRE_AUTOSUSPEND() on the new functions
   per Jonathan's recommendations.

Changes Since V2:
 - Went back to using a new driver on advice from Invensense engineer.
 - Further split changes up into smaller chunks of functionality. Note
   still that the largest patch is approximately 900 lines, and that while
   the driver compiles cleanly at each commit it is not able to drive the
   hardware until the commit that adds the Interrupt (as it also adds the
   Makefile).
 - Change the error to a warning when the devicetree binding does not match
   the hardware ID.
 - Dropped the ack on the devicetree bindings, as I am creating a new file
   (for a new driver) instead of modifying the existing one.

Changes Since V3:
 - Numerous small fixes (too many to list here). Thank you to everyone who
   provided feedback.
 - Split power management additions into an additional commit to break
   things up further.
 - Consolidated devicetree documentation in existing
   invensense,icm42600.yaml file.
 - Removed most of the FIELD_PREP from header file to c files to make code
   easier to read.
 - Changed scale values to 2D arrays for Gyro and Accelerometer.
 - Removed IIO_CHAN_INFO_CALIBBIAS attribute.

Changes Since V4:
 - Additional numerous small fixes, thank you again for all the feedback.
 - Dropped power control API and instead run device in low noise mode.
 - Split devicetree bindings into two distinct changes.
 - Reordered adding of enums and structs to main header file so that they
   are only brought in when needed.
 - Stopped using enum for driver data and instead am using pointer to
   device specific driver data.

Changes Since V5:
 - Corrected use of "dev_warn_probe" to just "dev_warn".
 - Fixed some return scenarios which would unconditionally return 0
   when an error was present.
 - Corrected use of max() to min() for bounds checking. max() was
   incorrect.
 - Fixed using "st->conf.accel.odr" in the gyroscope function. It
   should have been "st->conf.gyro.odr" which it now is.
 - Additional small fixes suggested by "sashiko.dev".
 - Added a regmap cache. I used the datasheet to try and determine
   which registers might change without explicit writes.

Changes Since V6:
 - Corrected additional errors identified by sashiko.dev, mostly
   fixing potential deadlocks, missing calls for pm runtime, and
   potential overflow issues.

Changes Since V7:
 - Dropped Wake on Movement patches, since some of the functionality
   was only available for a device on which I cannot test.
 - Dropped support for SPI 3-Wire mode, since it complicated the
   bus setup (and I lack the hardware to test such features anyway).
 - Fixed a few additional bugs identified by sashiko.dev bot.

Chris Morgan (10):
  dt-bindings: iio: imu: icm42600: Add mount-matrix to icm42600
  dt-bindings: iio: imu: icm42600: Add icm42607 binding
  iio: imu: inv_icm42607: Add inv_icm42607 Core Driver
  iio: imu: inv_icm42607: Add I2C and SPI For icm42607
  iio: imu: inv_icm42607: Add PM support for icm42607
  iio: imu: inv_icm42607: Add Buffer support for icm42607
  iio: imu: inv_icm42607: Add Temp Support in icm42607
  iio: imu: inv_icm42607: Add Accelerometer for icm42607
  iio: imu: inv_icm42607: Add Gyroscope to icm42607
  arm64: dts: rockchip: Add icm42607p IMU for RG-DS

 .../bindings/iio/imu/invensense,icm42600.yaml |   4 +
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    |  20 +-
 drivers/iio/imu/Kconfig                       |   1 +
 drivers/iio/imu/Makefile                      |   1 +
 drivers/iio/imu/inv_icm42607/Kconfig          |  30 +
 drivers/iio/imu/inv_icm42607/Makefile         |  14 +
 drivers/iio/imu/inv_icm42607/inv_icm42607.h   | 428 +++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_accel.c | 587 +++++++++++++++++
 .../imu/inv_icm42607/inv_icm42607_buffer.c    | 573 +++++++++++++++++
 .../imu/inv_icm42607/inv_icm42607_buffer.h    |  95 +++
 .../iio/imu/inv_icm42607/inv_icm42607_core.c  | 597 ++++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_gyro.c  | 552 ++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_i2c.c   |  90 +++
 .../iio/imu/inv_icm42607/inv_icm42607_spi.c   | 102 +++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.c  |  80 +++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.h  |  33 +
 16 files changed, 3206 insertions(+), 1 deletion(-)
 create mode 100644 drivers/iio/imu/inv_icm42607/Kconfig
 create mode 100644 drivers/iio/imu/inv_icm42607/Makefile
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607.h
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.h
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h

-- 
2.43.0

