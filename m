Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B0353A61
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980067; cv=none; b=d1+Q+Zf/K+wcP40eFHT9Ic01EzC8PlVx4/4F9H8w4xk5WXz1f/N02VrleJqnN7KhLhQUA34WuyiyTlMjME5H1HC+tbWuQ3oaqxMOv4fyfiiDbJHNFTaCMywrjmyFSgzhGHhq3wieNwp1f3BLwSPlYBi0cA555LojtOF+abSjC8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980067; c=relaxed/simple;
	bh=ExEk0XXLe3EGGmPH0Br3IkRG9fWWwoylZSKuosDpHR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IisvLrdYV4U7v4KfidFxlJX5E5LvD5t2TZdPgoe44hOSvczY64GOzCCEc5dJKK0LwKG2/ZBo7msmhE5RwqYPI5f4RRL2lhuY8PSaT7cwYOL6d27nWmYY4MFx+GVskLib5Lc2BxwVTqmX1mlGGYou84MP76AQqtRGu9+rDffIO2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YziHb0gA; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YziHb0gA"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-495c63c4141so2312923b6e.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783980065; x=1784584865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aB/HJVi7DLaihfsW9e7c+Q707fIkJMPaSU+Fs38C4Fw=;
        b=YziHb0gADFEUat8v8AFBwnV0KqOBqj+t+mnP4HmeP0GLOY2evERNQPHEOU41yE4oBP
         9zjzQalz4W6QEPIdKAObt2esFZe0GPGuN3YQW8yDUbGq3EZy7KZQOaMcXSq7BtKvu7x6
         QntzrFVBwNwGRWNTTUlT6C0XC+0u2t/EDCjVWeZELobV3gsORQrRLCfJu+ygdemfvHUz
         KHupDxYTnociZrsCqgylunQfvU30rqda75HCtwfaHeo5d7fc9mR3JHp4M4uvH/nYJ9gA
         0it8CZb0yE59Dh8o3SFgeIeO7fD/MsjfixsWAQMp9iWIRQ/EVvPvhMp+D7Ml6ILLiC5p
         U5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783980065; x=1784584865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aB/HJVi7DLaihfsW9e7c+Q707fIkJMPaSU+Fs38C4Fw=;
        b=o0BEl6Bbs4iHvVrlWmIg5X4M78C9KyNCL+eoUrTjB5FIdiEpFFT99DLgI6NC9uOTxX
         4FKdu90GaOg8llknp+D/v8E9Fn9TOIvCAE4bhn8U2CTnHe6o9E+7K+fXnqGSvMpLIZNj
         cEQOZQ6a8QAWMUtcObvK4OjNs1MDptmppO6sTkdlNTxbECWm/3nT7cbOrT7UHPj5zEhG
         JDM6YGkHjjjlxGWDnPqZtD7budBuui2VHbKpY9dDpptuTKx35smWkgr619wHNCPVrIXC
         272qeqKJtGUEbHk6T5m4elsu1fz2LWgJnMqtNXhW86nc0o6+BYeTMZVe78ScDVz83ETR
         LKBA==
X-Forwarded-Encrypted: i=1; AFNElJ+OiFUgsGm1ttRbar0TyPZutWecpegT+Lb1bIkNZLma6E0uVQuh5k3JN0oDu0wQi6t0XeNJ/8fUQvn8@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYFQa+tYRs5bA/V6fuqIPdEsveRyzmQxYDY0qqvAfbxdKyh5l
	CeERHOit9BJi139sbfeWEnWJLG8Kf9LV21e8xN2DuxpU3lW/HGehyYAJYISjyw==
X-Gm-Gg: AfdE7cmCR0bsCWssArurXZLelzhuVJFYpMMGgrSlyPpAm86EHE/yF1kOKAkHV7Fy318
	PFrR5kwnpfqYhDLX77myjWRMeQkltUh94KA2ys+0v7EzS/jG/thw+jmfU+JfM6nOXB82IvKDVgM
	0g5Hz61Knvh3iYLienNaYCvmeMyzT26cuq9hR7TqKbrwZQc0w1FRWNHj21SBBziRASOcddzVI50
	8cO2Hy9fJSNdRqA2RwVJfJIaXQaDPbo8IJf3whG96lHBzwb5OV0RDuSIvK88DF+uabMKvdP1lgx
	gehsC/x8EE41L/qeFFwfJYiN5At54zVfEwIFaIWYQp5j1TRMaQmiwG5E0DEVTCtbqfNXBcyviN1
	45IwCcmsdqojVpAvWxS/Ph0pRcrDYeOj2ooRr3+s33whnolFXA6Rl/p/YOrNCoW+bsJzfgCKONj
	TlJEAdDTVkYgvd20Z3KdM5TA==
X-Received: by 2002:a05:6808:4f67:b0:4a4:2720:a599 with SMTP id 5614622812f47-4a42afd59f5mr8473687b6e.42.1783980064770;
        Mon, 13 Jul 2026 15:01:04 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f3csm12939785b6e.3.2026.07.13.15.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 15:01:04 -0700 (PDT)
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
Subject: [PATCH v16 00/10] Add Invensense ICM42607
Date: Mon, 13 Jul 2026 16:58:30 -0500
Message-ID: <20260713215842.69097-1-macroalpha82@gmail.com>
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

Changes Since V8:
 - Added back IRQ dropped accidentally when dropping wake on movement
   patches.
 - Dropped "Reviewed-By" tag on patch 2 because of substantial changes
   made to devicetree binding documentation.
 - Additional small fixes as suggested.

Changes Since V9:
 - Removed interrupts (and buffers) from the driver. I previously was
   unable to detect deadlocks because it turns out my IRQ was not even
   wired correctly in my device.
 - Updated devicetree binding commits to make interrupts optional for
   users of the icm42607 driver.

Changes Since V10:
 - Explicitly specified enum values in header file.
 - Removed additional dead code for buffer handling.
 - Cleaned up headers.
 - Added additional locks as requested by sashiko.dev bot.

Changes Since V11:
 - Since driver has shrunk in size considerably, moved i2c bits into
   first code commit. This ensures that the very first commit with code
   can now be compiled. The commit after that adds SPI support as it
   was in the previous versions.
 - Used pahole to optimize inv_icm42607_state. Reordering elements
   reduced size in memory from 384 bytes to 256 bytes.
 - Added a map of all readable registers and all writeable registers
   according to the datasheet.
 - Added back some missing headers pointed out by the maintainers.
 - Added FIELD_PREP in a few more places to make the code more
   obvious on what it's doing.
 - Added a comment to the power management code to note that
   temperature sensor being enabled doesn't matter as the clocks
   are off by default when the gyro and accel channels are off.
 - Removed iio_device_claim_direct() calls since it was no longer
   needed.
 - Fixed shared_by_all attributes for temperature sensor.
 - Additional miscellanous fixes as requested.

Changes Since V12:
 - Removed aligned buffer from inv_icm42607_state struct as we do not
   currently have the need for it.
 - Corrected the order of the odr values in the accel and gyro files
   as the values were out of order (the place in the array corresponds
   to the register value).
 - Stopped setting the clock value depending upon the temp config. The
   datasheet advised to keep using the default value.
 - Corrected logic when changing between states. We only need to pause
   when a sensor changes from off to an on state or when the gyro
   changes from an on state to off.
 - Added missing includes for several files.

Changes Since V13:
 - Refactored inv_icm42607_set_accel_conf() and
   inv_icm42607_set_gyro_conf() into a single function.
 - Refactored inv_icm42607_accel_read_sensor() and
   inv_icm42607_gyro_read_sensor() into a single function.
 - Merged inv_icm42607_set_temp_conf() into initial init function
   since it only really needs to be called once.
 - Saved adding temp sensor for last and updated
   inv_icm42607_temp_read() to either confirm other sensors are already
   enabled or enable the accelerometer so it can get a reading.
 - Updated inv_icm42607_set_pwr_mgmt0() so that it does not update the
   sensor mode and forcibly keep the sensor enabled.
 - Added inv_icm42607_temp_filter_bw enums since it appears to use
   different values than the accel or gyro sensor.
 - Set the temp startup time from 77ms to 77us, as I previously misread
   the datasheet.
 - Additional minor fixes.

Changes Since V14:
 - Added IIO_BE for temp sensor.
 - Switched from ktime_get_real() to ktime_get().

Changes Since V15:
 - Removed interrupts from required property per note from Jonathan.
   As a result of this change I've also removed one of Krzysztof's
   Reviewed-By tags as this change probably requires further review
   from them.
 - Corrected a comment about reserved values from 0-5 to 0-4.
 - Reordered some operations so that only runtime power management
   turns off the sensors now. This removes the "ping-pong" effect
   when switching between the accel and gyro sensor, at the expense
   of leaving either the accel or gyro sensor enabled until runtime
   power management turns it off.
 - Fixed the shared frequency value not being available for the temp
   sensor.

Chris Morgan (10):
  dt-bindings: iio: imu: icm42600: Add mount-matrix
  dt-bindings: iio: imu: icm42600: Remove interrupts from required
  dt-bindings: iio: imu: icm42600: Add icm42607
  iio: imu: inv_icm42607: Add inv_icm42607 Core Driver
  iio: imu: inv_icm42607: Add SPI For icm42607
  iio: imu: inv_icm42607: Add PM support for icm42607
  iio: imu: inv_icm42607: Add Accelerometer for icm42607
  iio: imu: inv_icm42607: Add Gyroscope to icm42607
  iio: imu: inv_icm42607: Add Temp Support in icm42607
  arm64: dts: rockchip: Add icm42607p IMU for RG-DS

 .../bindings/iio/imu/invensense,icm42600.yaml |   5 +-
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    |   8 +-
 drivers/iio/imu/Kconfig                       |   1 +
 drivers/iio/imu/Makefile                      |   1 +
 drivers/iio/imu/inv_icm42607/Kconfig          |  30 +
 drivers/iio/imu/inv_icm42607/Makefile         |  13 +
 drivers/iio/imu/inv_icm42607/inv_icm42607.h   | 428 ++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_accel.c | 308 +++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_core.c  | 643 ++++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_gyro.c  | 305 +++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_i2c.c   |  97 +++
 .../iio/imu/inv_icm42607/inv_icm42607_spi.c   | 108 +++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.c  |  98 +++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.h  |  38 ++
 14 files changed, 2081 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iio/imu/inv_icm42607/Kconfig
 create mode 100644 drivers/iio/imu/inv_icm42607/Makefile
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607.h
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h

-- 
2.43.0

