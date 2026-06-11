Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD813672A0
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209717; cv=none; b=ppNxOS+d0J8kBJEhWlakbx3Nt1E9ntEsCKlXSZYFdsWLuc7C9bxI28YFncQGhfb8ofV6646GSZcb5X5CVqvnGrPOqDRSanWJoy0o48lMjbIOt2HIXXYSbJBDfBaheccnEeojAUVXvORnBP/kzBzphiszcoiF1umQ5q2FSVWv2gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209717; c=relaxed/simple;
	bh=xWO9y84dMLToSux1j4oJlDixAjIOe9N5RpotK2gDFgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=StBQFlAxBjRavCAmkl3CULd23BWhOKGf0d8AER9supsdOGsYTLodzHzuhoTp5Ik22+G9nk5xAu+JwxorZXcfFMwZXBbmTBeAq4WXLAgXbI+7YfkKZ9g1il+uh2oROnlmd91XCB7fJu9j13KoUCfKJtb0a2iu5P8tT54/K7lEBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmlZdrFi; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmlZdrFi"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-48611addcfbso163120b6e.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781209714; x=1781814514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujUOWYjkgDPSRJzQ0aFRyemjYWsqusJ3rUsMa9F2Mr0=;
        b=DmlZdrFiwdKd+wQMFAQnje4a8DQ9jpflGZ6WybNsxmGaNKhCQPnxWghPA4rLXdLBRC
         Si/YPz+FpZpvVUkQFcsX3r2whKkju9OLOOAC92Jejat7Q+2ucljZKMBFvV4uxDuvx6SX
         Ewq0nCxgMERpDfaOWFlcy3mWyZIoHkz6BPpuKg3+wmieP9Mc+7GODqRDmz05lPKsEuiv
         zrVPjBrCYP2oNWHpR50cM65nTGIfrRP3mr0P4bhiNp4st7eKt1sL+hJgJOPYMEpkYLr/
         sCovlj+Jtz+ghQ0wn8jnTY7K7oLBnoXm9NUg4sCHrq0Xn8TlkP+EsNjt+jB2pEZkNtl8
         TpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209714; x=1781814514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujUOWYjkgDPSRJzQ0aFRyemjYWsqusJ3rUsMa9F2Mr0=;
        b=UI8HPks4TFfX+WhVdZiGBU/36Z6q53n8suTMqSzPjXYnQO9ixxPu7s4wxMDM8flXsl
         lc6F2AkREgc8LKLERoHy82C828JL9RSqufjaT4rE8EXCb6X1ajrR5WvJ0rYtyZGevRRx
         95U4UqN+AWtHMURfZqHqXn0NLmUUG6bIFv+YjaIdvIDKBkhhX1pZFCt3siVKGXghIFxr
         +E3QbHaQcLIPE2jYurwyT+0VW8YzZy95Hn71iFusJC0oHPYAMNpx/16ltmwKUQTdl7Eh
         +y3veGfiULf91UsaaH0/5CO12mC8nS+6PPPOmt5v0lh+1a8tvs5m0xbb64f6QGcAlkZA
         PF4A==
X-Forwarded-Encrypted: i=1; AFNElJ+oU6fPDnwWbRinOczzz7zix2HAd+lSEdP+iTdM3Ez0wr3QJSDkfE/mOO5NrqUGCEt+lqOGpiZ/zBtw@vger.kernel.org
X-Gm-Message-State: AOJu0Yye7Uhnm/VB/aPP7VjOxMW6T1jaSZPKlOq+zu+q3mol4wmqinA8
	FtO/gJ+KHgpuPk0LtR2KLdICdH1AzH7rbuqcljgc+CHfT3pd4N2It0+M
X-Gm-Gg: Acq92OHOQmdLL1VLqD2r5c6bVyvM2vMBFfVdRRw8b08nLpmCZrnBybY5/9zGOwAoxzd
	5JKper+/K9nZkYrHd3p87kxpve1JAQ9VPqhhQkfg5SdpgbTc/VYEuXL1oDkclfeX2QsJAU/oqF7
	LI1YL1R8gYo0wl3c9NJ8DUO+LF/DLYnQoAS1j/pByKRQ2bhnkLfsMgNS30Zjj1H9d9yAd4YE6bU
	Hx2qad1QG3wnMfADkR2S6DTUAnjVRbwxandrTS5RpXPJ5Ns6GKSYtW+p9FbLh6oPMHr1x3e1r6B
	YGZ5/jnPdAr7rCEU6FKLyC2KuJa5SrZLFmcT55R/jBkY9jHFKCpW5iqlcFQpUIAPYpN4hVECvLd
	wH0m7Zn+o6JjIMcQyCfmOuvyj238VOYINqesYv7ZSmT9+eFnrvcREhtlUM/6jCyZQ1KbmNs9UJA
	ywQH/+QjCu7wqUg/AD6ZWs4w==
X-Received: by 2002:a05:6808:6901:b0:486:b56c:f786 with SMTP id 5614622812f47-4871a1a62e9mr2753925b6e.30.1781209714324;
        Thu, 11 Jun 2026 13:28:34 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44244cd05c9sm1796134fac.18.2026.06.11.13.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:28:33 -0700 (PDT)
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
Subject: [PATCH V12 0/9] Add Invensense ICM42607
Date: Thu, 11 Jun 2026 15:25:57 -0500
Message-ID: <20260611202607.85376-1-macroalpha82@gmail.com>
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

Chris Morgan (9):
  dt-bindings: iio: imu: icm42600: Add mount-matrix to icm42600
  dt-bindings: iio: imu: icm42600: Add icm42607
  iio: imu: inv_icm42607: Add inv_icm42607 Core Driver
  iio: imu: inv_icm42607: Add SPI For icm42607
  iio: imu: inv_icm42607: Add PM support for icm42607
  iio: imu: inv_icm42607: Add Temp Support in icm42607
  iio: imu: inv_icm42607: Add Accelerometer for icm42607
  iio: imu: inv_icm42607: Add Gyroscope to icm42607
  arm64: dts: rockchip: Add icm42607p IMU for RG-DS

 .../bindings/iio/imu/invensense,icm42600.yaml |  20 +-
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    |   8 +-
 drivers/iio/imu/Kconfig                       |   1 +
 drivers/iio/imu/Makefile                      |   1 +
 drivers/iio/imu/inv_icm42607/Kconfig          |  30 +
 drivers/iio/imu/inv_icm42607/Makefile         |  13 +
 drivers/iio/imu/inv_icm42607/inv_icm42607.h   | 417 ++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_accel.c | 376 ++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_core.c  | 543 ++++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_gyro.c  | 370 ++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_i2c.c   |  98 ++++
 .../iio/imu/inv_icm42607/inv_icm42607_spi.c   | 108 ++++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.c  |  76 +++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.h  |  37 ++
 14 files changed, 2096 insertions(+), 2 deletions(-)
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

