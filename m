Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92E2F1FD0
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778354500; cv=none; b=iJ/HWT1rxRBfYrb/QWeiX+OwgsMi8zIIvtLpjAp8BFYgfp5Iqz4vCL562fJSzpGHOB0wjKvxkJI87jNncbB9u17nRcCExifpoz3uuUd+6ElEiZ3DZrnMAIh4SLm7Y0GEkv30yoSDa/N6W33+DVPZV2N9hLWS7K7Yrhs9lzLdbA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778354500; c=relaxed/simple;
	bh=QioP3Qka/JFdqQFwCHDza/17w8AkssaId/xwPSd/cgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uq6mumtlBFhF1Rx9juH4BxJp9unLzByQa6A6CnA7ogJoVXMeYPRLHCRaq75JyMqEDve5guyXh9ky4Io9zRrJawYvNoQzwoL+63hyOKqq6+oj759bRZFM+mwR1AqWWgTrWxVEm5kmHPIuFXa4FPeYDX/L0d1nzIY9F27gpTzORM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPiAZo1C; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPiAZo1C"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40ede943bf0so2335468fac.2
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778354497; x=1778959297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bWX8jEbkkLX6d2SDTNLRmYT9TMQ3k8bI+ub8fyb0z+g=;
        b=IPiAZo1CAC+Q9SPrI2G2nSg0hXKXLyKfZ3yt8lo1XLglea9O7jjSZXEhhZ/sOLdPUW
         K9XJwcPoJ13Xn14OPBAlCLX2dMHN55/i+cKAIMU+t9u6dKRRR4DWRPecBTkncHLAtsaV
         wGvqBFQRRIVae35oKILQhyKz26RlvevU4voaHQnm4yUBTTl0HBDmAGukxa1DpJwWzTxz
         mL9sQzSuy51Ck0jKv3dRv9pG9xyDvnqEeMxkvgeVL+nzInj+ZAM841SU7MK6iAKcVFqD
         YnhVkCHT/6FwmcJ2zc3ayDoCdPVc7LLLOKWDe/UECAstLEKmhOgSYPJ1lJA0ndmxqaNB
         0VLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778354497; x=1778959297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWX8jEbkkLX6d2SDTNLRmYT9TMQ3k8bI+ub8fyb0z+g=;
        b=eUXya7m1DyobKSnl++5WlOS4ISSf4Dy/CFLT+YQv5p1/kNGRkBoU1uVMSHDB6k2PoI
         uQ8b1ynZjIopKu+bhgiqazwToL282A+yBDwRFEyao1uSEXi8vltzkz8wCgXcILutSQGD
         Ih1M5tnqTDMQ17iLKvSg+UX5jxpRooZqAWLZiO4pDOc70P9vVNv8zz5qCx4+faV9dOFS
         59OgaiK3eHPv/V19F1Dey5FgmPt4PZYyCi/ndX71JkQTQVxOkpbA2N2mWU5gKT7qomlK
         V7a9IQo/8SgYFHUAQha01oSIUyBE9BLqfTzS5sfvplV48WIj/ycD6KQRy8MboyelUH7c
         VLbg==
X-Forwarded-Encrypted: i=1; AFNElJ/rBCvBs5RxkX6uPgSEsfiIi1BDGz8FROIeObhQhv14KM5NAsueYu34nb16YWIcwLwjvvOOjlG1sg3s@vger.kernel.org
X-Gm-Message-State: AOJu0Yxstjbc3EtD+ULd1dUTY0ijeI3TWaVYetlvbQfbCNraHzljAwQ6
	+5l+ILn5WhUIrjH9N6aJRYUhNr26hm5updeta/1aT1gD5Fjz7iDyOThW
X-Gm-Gg: Acq92OEGmuJ5K4RyO2onFaP+ZN0Jt60ne2NxgwSsKjJjQYBzTR0dT/udtXZGLaildHd
	wj63xByaQoCHtBdABo7Gni/y1nP95nNiZ8BtVBCkA1RPqMRkxzSBS29prEGRQa3hz7WyJ57TjWs
	GO7dwAGEifodeB8Z3oyOgng3AVIE/Xkgn1kRj7kJ78DeEJrM6bvCIevpNCZtZq/H9xxl15D9CPm
	oXUvbTIGNaL3YByahoz3sp+3iWekDLnikp7N6FXqrRKIe6rpUI5Y4P9DrkKzn3AFgr2/+F6XQKr
	gO61PloC94uTYBqJFNnQJ2T0sU6rSHNg3TNJrjVA1Pf1xR/8sbmKTQshoOkIS/AeJNvr3AGDW6c
	/ldyZSnBH/PVdQL1saw+9E3W2ZAUolM+zwEGJjQ5wYmlyN83cLyoOsDiBG1WHXYGosaafgTf0Cj
	IBJO+J2S0BDmLjH0yRxznY
X-Received: by 2002:a05:6870:249b:b0:42c:111b:73fe with SMTP id 586e51a60fabf-434f64e9244mr11273892fac.18.1778354497428;
        Sat, 09 May 2026 12:21:37 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4355736f517sm5243896fac.12.2026.05.09.12.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:21:36 -0700 (PDT)
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
Subject: [PATCH V5 00/11] Add Invensense ICM42607
Date: Sat,  9 May 2026 14:18:54 -0500
Message-ID: <20260509191907.24734-1-macroalpha82@gmail.com>
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

Chris Morgan (11):
  dt-bindings: iio: imu: icm42600: Add mount-matrix to icm42600
  dt-bindings: iio: imu: icm42600: Add icm42607 binding
  iio: imu: inv_icm42607: Add inv_icm42607 Core Driver
  iio: imu: inv_icm42607: Add I2C and SPI For icm42607
  iio: imu: inv_icm42607: Add PM support for icm42607
  iio: imu: inv_icm42607: Add Buffer support for icm42607
  iio: imu: inv_icm42607: Add Temp Support in icm42607
  iio: imu: inv_icm42607: Add Accelerometer for icm42607
  iio: imu: inv_icm42607: Add Wake on Movement to icm42607
  iio: imu: inv_icm42607: Add Gyroscope to icm42607
  arm64: dts: rockchip: Add icm42607p IMU for RG-DS

 .../bindings/iio/imu/invensense,icm42600.yaml |   4 +
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    |  20 +-
 drivers/iio/imu/Kconfig                       |   1 +
 drivers/iio/imu/Makefile                      |   1 +
 drivers/iio/imu/inv_icm42607/Kconfig          |  30 +
 drivers/iio/imu/inv_icm42607/Makefile         |  14 +
 drivers/iio/imu/inv_icm42607/inv_icm42607.h   | 437 +++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_accel.c | 875 ++++++++++++++++++
 .../imu/inv_icm42607/inv_icm42607_buffer.c    | 552 +++++++++++
 .../imu/inv_icm42607/inv_icm42607_buffer.h    |  95 ++
 .../iio/imu/inv_icm42607/inv_icm42607_core.c  | 795 ++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_gyro.c  | 509 ++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_i2c.c   |  85 ++
 .../iio/imu/inv_icm42607/inv_icm42607_spi.c   |  92 ++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.c  |  80 ++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.h  |  33 +
 16 files changed, 3622 insertions(+), 1 deletion(-)
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

