Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B48372ECA
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 22:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777673663; cv=none; b=QUIn1i9nVOFrF8Je/rkOkdzrxceu/fYfrhGcxrVArhBhxbrHaAEA+2usRA9Ec5xyH52mGRMzVw/OURAvE/MH0eO0cXb8ai8T0087qLlDGaqYqWu1eXkPHRKHYL1i1wX2PdYqzzv6ds3Sv5tb3yRNTo/7LAwRkuWK1Hnm83GaqVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777673663; c=relaxed/simple;
	bh=uIEC+gaUFWg2Vq0+zMbQZK+Vrfh/4lveC26NtpJtKRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GZ+dhn5TIcdb99qczMzH+RxeJmtB1aQzmm89kweedvbwSbQ+jjllfFRpuMD7JsPvaF9ZDaO3AQfcmoQKtPmaBeosEQ7lXFvzwJyZH+v4U97g1T/7wgcneL9MTjVelydGlUa/F6FqafT/dMyODCkcDMEfPH6qa8EdXTqr2r4voR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uo0eFYLI; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uo0eFYLI"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dbca22dbfeso1333374a34.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 15:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777673661; x=1778278461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=McHLo3cj7iFPLZcReAQtNpsae+Pg1Wjxhu0OhYjCJIg=;
        b=Uo0eFYLIII72Ry+RicEzOCW9YBd/C3H2LbLYqKIH8XJpvxQhkn2zvcjP2lbBvTOyql
         ZUjIRyfHSr0nxuSs44YGtbA9b8qe9PiFHMTmT5j1TJU93jeqD1kc8XDHz1Wk3+vT+G5Y
         4JRB/n+fOqUkEUPl5QhJVJbLfpLYs23KHaZ9m/wnpWKlcCbb03AieLMNtdp1z+IhruhM
         NIiHI4BSc1pSB8jUePYFkgaXhovu4Y3VOs8zaubj1ert7H1a7Iz+rJzfUk1JPt+Ajdoj
         nLG0AL6i9iAH3papkKRppt5ft3bJ6zOQO6Um22sgEj+6UQ9PGmVs3UchDJxu4u6rjXjF
         8uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777673661; x=1778278461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McHLo3cj7iFPLZcReAQtNpsae+Pg1Wjxhu0OhYjCJIg=;
        b=iNPrCpqLjX46jV5C3uRHDVcPACmiKafdSQXyIGL7oDgzo7m3QHkPuQeNtEgJLW4apv
         0fFDqh7LgLREfcw9xkgSHL0PooC7VAXVHDPuThL7SBX577fDBefIZrfESzRPd42iSi9g
         ahtb3QHnpRS45kAmYsQ3TCqMlzij6Vmpiv9Tx3w73XmKGTggIN3CB7vr6b0Q4T5ul6Is
         L+4tpT4jOR27J1n/q1nj7brQSDZ3OV45F5OheiVEZ70w6u+wZH+IsezJetHnLbj72hQ6
         dXl4QE3ZFJMFlx0se/EGpu4m49TubE0TUWC4QbB58qr1lBRrz3JyDIbJhxYFjW7eRo7V
         MOfw==
X-Forwarded-Encrypted: i=1; AFNElJ+eqCRM0NPfxQ8+VMvdq+OAztCq9cUykfLD+bY/CdmsN48Y+X5Jn49ykxd4+0v0LOtIbPK+/lAH6OWa@vger.kernel.org
X-Gm-Message-State: AOJu0YzJHKvE8S88VOIOg4uMdaPJK016nWCFhB7+ZsfR9eazDT8pMKfN
	6lLYcORmuZRmoHvOMk6faTJk/EFAszSdkjnnf7RCwKv7/wt/CMFiQVhU
X-Gm-Gg: AeBDieumeLoNqHEND8/jpKp/QzaLH0e3oHSzd/12TSPfV0RcyAepINvy2+/d+Rm+dy+
	KJA0AxjR6nOVxNEXKUSAVQnnf3Ni5NrHyW6WjFOyxroWFOpVoUe/ivrE0MPJ/TbvIMqg6Q//TWf
	Vyodkpl1INa3GjE0C7yvHbKeuXhPBejt9J2OD1kseLeWimGIKYwJ3fjlGswTqUbyyNrJIQ8yh23
	8oC9s6k8WmJjr3zSUTxQ9NC8D9awzZ+pCS8YB5NkjzsPO3S75lWva2hyxGH5oC5SFJry7owT5xk
	Xeb0geS35RsIFeD0toRTyifFY4kxsWzeWVJirHcZnm33Xe4rxmJU16AZw9asfvJlGD2WeNk+SUq
	o5bPV0oB5SypEYxQoWmwgCTT6oHdfppXO9Uod90+4TndV28UG/HflxLZOHKiB78B9sXYMAULCWx
	zsJcEY9HWiuhM6SAXqGaFPDn8c8n53T10=
X-Received: by 2002:a05:6830:8d1:b0:7dc:cd0b:58b0 with SMTP id 46e09a7af769-7dee121bb21mr834710a34.3.1777673660884;
        Fri, 01 May 2026 15:14:20 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ded51a9612sm1827337a34.26.2026.05.01.15.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 15:14:20 -0700 (PDT)
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
Subject: [PATCH V4 00/10] Add Invensense ICM42607
Date: Fri,  1 May 2026 17:11:39 -0500
Message-ID: <20260501221152.194251-1-macroalpha82@gmail.com>
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

Chris Morgan (10):
  dt-bindings: iio: imu: icm42600: Add icm42607 binding
  iio: imu: inv_icm42607: Add inv_icm42607 Core Driver
  iio: imu: inv_icm42607: Add I2C and SPI For icm42607
  iio: imu: inv_icm42607: Add PM support for icm42607
  iio: imu: inv_icm42607: Add Buffer support for icm42607
  iio: imu: inv_icm42607: Add Temp Support in icm42607
  iio: imu: inv_icm42607: Add Accelerometer for icm42607
  iio: imu: inv_icm42607: Add Wake on Movement for icm42607
  iio: imu: inv_icm42607: Add Gyroscope to icm42607
  arm64: dts: rockchip: Add icm42607p IMU for RG-DS

 .../bindings/iio/imu/invensense,icm42600.yaml |   4 +
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    |  20 +-
 drivers/iio/imu/Kconfig                       |   1 +
 drivers/iio/imu/Makefile                      |   1 +
 drivers/iio/imu/inv_icm42607/Kconfig          |  30 +
 drivers/iio/imu/inv_icm42607/Makefile         |  14 +
 drivers/iio/imu/inv_icm42607/inv_icm42607.h   | 438 ++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_accel.c | 989 ++++++++++++++++++
 .../imu/inv_icm42607/inv_icm42607_buffer.c    | 559 ++++++++++
 .../imu/inv_icm42607/inv_icm42607_buffer.h    | 101 ++
 .../iio/imu/inv_icm42607/inv_icm42607_core.c  | 809 ++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_gyro.c  | 536 ++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_i2c.c   |  91 ++
 .../iio/imu/inv_icm42607/inv_icm42607_spi.c   |  97 ++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.c  |  81 ++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.h  |  30 +
 16 files changed, 3800 insertions(+), 1 deletion(-)
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

