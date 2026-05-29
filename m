Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525533E0081
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056655; cv=none; b=RtZOPlfOraLA8LuBcoE7pk7fZrhwDD1X0+6SYcZolyVWA34EWscf94lBA9roodupJwCSHcf8p+N5wIm0KTVeLG5MKeRVS+9qXJkc5LkhG+4Igd6zTeGZ92nRR8yi8oP8FAv3PVJK5uZW7S8b65f7VZAeOuC8DS6JNvMMa4pOXZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056655; c=relaxed/simple;
	bh=VH7Ka/cVlmbRionnl0lrx6wcs7N1rLhq7lvEXxwhNn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mm3kqU98mILP3y7F4ec5RhJGTzaUJ4HdUkFtfcUply8PDdVNehkhD8oW2N8Y3diywQLQ929E49ZiQtA+cyBALRbGpCLTX5qRfYehQz7Qefgl+19XT/WVVpVtxHkEwROF/rwflwdbw1C8tr9EDXT6F1hP8MDcbbsY3Bdxf04dGBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1JzPhCH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1JzPhCH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso229400a91.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056654; x=1780661454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5cZYVzlz8iPqUGTkOYAZDMrEG8HTlDhnuFROv+PHGc=;
        b=h1JzPhCHPiVtSVUVGO8LtJQRY2k27A7wieiqp5kKLXOrmzxU5LAcuON0e/JrY2hqQw
         1PcBmK7sFBfsUJArl2qwPIZEMpkjIyeX5GpJZJBXuAX5mP2TjWMYgXhZpPjVUGYfoes9
         bDBEUc6qELI2p3Tix4z+SfC79mG7td5b7OsS98X+fxNAt2YkRX5wFyQK5AufYlyHQqno
         dpGYu5v+tF/hMxsx71W3u4gRY5XG6MQGgVRI2YvnELeUy2T2nHyaiGK5BDl6UvhaQgvg
         yxE5zIx33lOxSI8oAza1tedI0B0R56nlkPBZJTjp5Q2pg6t/vXYDlJjt4XjFjQf/3Rzc
         xFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056654; x=1780661454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p5cZYVzlz8iPqUGTkOYAZDMrEG8HTlDhnuFROv+PHGc=;
        b=NKXKDr+oe6CelwBPNJbentJvX6zLJlIWIbCmghb2vPo1TnF3lzVg3uJ6Lc6x20Hhkb
         pi8vzyx2djv77MN6pyOxBd2IA8SZfs1FsyZwsfc7HsBOMNUFMeiXx9/yDidZiA+jRUr0
         yLGQdkVsi4pYdqOxC+9C6mkCEyhXzfn2DuVCFEEkBX8tBI8qL00iwkBsiMJWdq84C03U
         HhiijWhTCkq2Qk/2AQugau6Hy1V3q8vmzXIkqT7t9j46GirMe8cK/YPDrpw3nTS3dXBZ
         i3zQNRI9yng7+xwnO2Cww/Yyi93S2Q1riAJtYtO6OueuVyQFZY4VYfAuuUwB0VvCjjmi
         YkyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hFKoBXkiWfvti30zYpGI8YL4kdVlKeauPSpQJZBdjzeO+Ocuaa+sDnjv/vZsiqxPnCzwJYJ36yuS/@vger.kernel.org
X-Gm-Message-State: AOJu0YxcDpVz3Z9/t7yPv4XFOC4NGSu6VAgt8TlwiAOWTE/taW8Cz3CL
	F4VxIOchvyogc24cJnSNDlR9jRWtRA066dLqA7AZ+e83qUkUWm9uVgHk
X-Gm-Gg: Acq92OHPyfhnaF6a9hdLoPfPTv/svtdIhtBTPhzcaxNUmwL70zkPDIPYSDUDqWw6vcM
	AbkkVgcnDSTuhvvCOXN87KHcpnxWLA0aqwAyvHlyI35Kcz/oW68V6oG/soigYD1Sgu/mLdVM9Jj
	RB76UhuORwPy7CMgt9hTMVODI8XF2VccuGUx3IoThpPKT20yIScBaSonY3v8zoh7p7h3LrGA2Re
	0cjrrkyM3LOtxB4pos2tW6XBt6vQJFLzLPdfPI8/77JfQ/s0BZ4NQtD7mq5bCgoB3GXc25hv+6N
	1+BOADKnXHKe1mqjST/1YPlTC7VmfdeLiNtdSsQYMQndFW74M+u1D2QzvRBGC/wC8BmF3LxSv2o
	sMuAysyNS5bd0UI3HqHIWHS/o1ThT4ePQK+Dgf3s7ZoUdbhnHT+WN0exEBrAV/u/kJKOD2yvdpH
	z+m8iOhx4G69olSRKkrkXpctei+lzhRxu/9/bbKZ8x2OpmPcFfoHFqG+KDnPXG/lv/pK2sCggrx
	bYO1izDJHCdo1dErCRsI67PhTPMfpvS8BvZJxXSy9uEAPnn
X-Received: by 2002:a17:90b:3f85:b0:36a:4832:54b9 with SMTP id 98e67ed59e1d1-36bbceb6f21mr3286153a91.27.1780056653512;
        Fri, 29 May 2026 05:10:53 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdf3afc6sm942820a91.7.2026.05.29.05.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:10:53 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 2/6] Documentation: iio: add Open Sensor Fusion protocol v0 reference
Date: Fri, 29 May 2026 21:10:01 +0900
Message-ID: <20260529121005.1470-3-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529121005.1470-1-kimjinseob88@gmail.com>
References: <20260529121005.1470-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document OSF0 UART frames and the supported RFC driver subset.

Extend MAINTAINERS to cover the protocol reference.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 .../iio/open-sensor-fusion-protocol-v0.rst    | 308 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 309 insertions(+)
 create mode 100644 Documentation/iio/open-sensor-fusion-protocol-v0.rst

diff --git a/Documentation/iio/open-sensor-fusion-protocol-v0.rst b/Documentation/iio/open-sensor-fusion-protocol-v0.rst
new file mode 100644
index 000000000..80852f4cf
--- /dev/null
+++ b/Documentation/iio/open-sensor-fusion-protocol-v0.rst
@@ -0,0 +1,308 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Open Sensor Fusion protocol v0
+==============================
+
+This document describes the OSF0 UART wire format used by the Open Sensor
+Fusion Linux IIO driver. It is a wire format reference for the host driver. It
+is not a firmware programming interface.
+
+Background
+----------
+
+Open Sensor Fusion is an open hardware project for sensor aggregation devices
+and Linux IIO host support. It is not a generic sensor protocol standard. The
+first concrete hardware target is OSF GREEN, an STM32F405-based board that
+streams OSF0 frames to a Linux host.
+
+Public project documentation is available at:
+
+- https://www.opensensorfusion.org/
+- https://github.com/opensensorfusion
+- https://github.com/opensensorfusion/opensensorfusion-hardware
+- https://github.com/opensensorfusion/opensensorfusion-linux
+
+Wire format and driver subset
+-----------------------------
+
+OSF0 defines a small device-to-host UART frame format. The current RFC driver
+supports only the subset needed to expose OSF GREEN raw sensor data through
+IIO:
+
+- ``SENSOR_SAMPLE`` frames for accelerometer, gyroscope, magnetometer, and
+  temperature samples.
+- ``CAPABILITY_REPORT`` frames used to create the supported IIO devices.
+- ``DEVICE_STATUS`` frames cached for diagnostics.
+
+The driver ignores vendor private message types and does not implement command
+transport, calibration controls, USB transport, fusion output, or runtime
+capability removal.
+
+Device model
+------------
+
+An OSF0 device is a sensor aggregation device. It sends binary frames from the
+device to the host. The host driver decodes the frames and maps supported
+sensors to IIO devices.
+
+The hardware used for smoke testing is an OSF GREEN prototype with an
+STM32F405RGT6 MCU, an ICM42688P-class IMU, and an MMC5983MA magnetometer. That
+hardware is the first supported target for the RFC driver.
+
+Transport
+---------
+
+The transport is UART at 115200 baud, 8 data bits, no parity, and 1 stop bit.
+The Linux transport is serdev. The v0 upstream driver covers device-to-host
+frames. Flow control is not used by the tested stream.
+
+Byte order
+----------
+
+All multi-byte integer fields are little-endian. Samples use signed 32-bit
+little-endian integers when ``sample_format`` is ``s32``.
+
+Frame format
+------------
+
+Each frame has a fixed 38-byte header, a payload, and a 4-byte CRC.
+
+.. list-table::
+   :header-rows: 1
+
+   * - Offset
+     - Size
+     - Field
+     - Description
+   * - 0
+     - 4
+     - magic
+     - ASCII ``OSF0``
+   * - 4
+     - 1
+     - protocol_major
+     - Must be ``0``
+   * - 5
+     - 1
+     - protocol_minor
+     - Minor version
+   * - 6
+     - 2
+     - header_len
+     - Must be ``38``
+   * - 8
+     - 2
+     - message_type
+     - Message type
+   * - 10
+     - 4
+     - payload_len
+     - Payload length in bytes
+   * - 14
+     - 8
+     - sequence
+     - Monotonic device sequence
+   * - 22
+     - 8
+     - timestamp_us
+     - Device timestamp in microseconds
+   * - 30
+     - 4
+     - flags
+     - Message flags
+   * - 34
+     - 4
+     - reserved
+     - Must be zero for v0
+   * - 38
+     - payload_len
+     - payload
+     - Message payload
+   * - 38 + payload_len
+     - 4
+     - crc32
+     - CRC32 over header and payload
+
+The frame CRC is IEEE CRC32 as implemented by ``crc32_le()`` with initial
+value ``0xffffffff`` and final XOR value ``0xffffffff``. The CRC field is not
+included in the CRC input.
+
+Message types
+-------------
+
+.. list-table::
+   :header-rows: 1
+
+   * - Value
+     - Name
+     - Direction
+   * - ``0x0001``
+     - ``SENSOR_SAMPLE``
+     - device to host
+   * - ``0x0002``
+     - ``DEVICE_STATUS``
+     - device to host
+   * - ``0x0003``
+     - ``CAPABILITY_REPORT``
+     - device to host
+
+Message types ``0x7f00`` through ``0x7fff`` are reserved. Values at or above
+``0x8000`` are vendor private and are ignored by the current RFC driver.
+
+``SENSOR_SAMPLE`` payload
+-------------------------
+
+The payload is a 16-byte payload header followed by ``4 * channel_count`` bytes
+of sample data.
+
+.. list-table::
+   :header-rows: 1
+
+   * - Offset
+     - Size
+     - Field
+     - Description
+   * - 0
+     - 2
+     - sensor_type
+     - Sensor type ID
+   * - 2
+     - 2
+     - sensor_index
+     - Instance index
+   * - 4
+     - 2
+     - channel_count
+     - Number of ``s32`` channels
+   * - 6
+     - 2
+     - sample_format
+     - Must be ``1`` (``s32``)
+   * - 8
+     - 4
+     - scale_nano
+     - Scale factor in nano-units
+   * - 12
+     - 4
+     - reserved
+     - Must be zero for v0
+   * - 16
+     - 4 * channel_count
+     - samples
+     - Signed 32-bit channel samples
+
+The current RFC driver accepts only ``sample_format = s32`` and only the fixed
+channel counts used by its supported IIO devices.
+
+``DEVICE_STATUS`` payload
+-------------------------
+
+The payload size is 20 bytes. Fields are ``uptime_s``, ``status_flags``,
+``error_flags``, ``dropped_frames``, and a reserved field. Each field is
+32 bits. The reserved field must be zero for v0.
+
+``CAPABILITY_REPORT`` payload
+-----------------------------
+
+The base payload size is 4 bytes. It contains ``capability_count`` and a
+reserved field. The reserved field must be zero for v0. Each capability entry
+is 20 bytes:
+
+.. list-table::
+   :header-rows: 1
+
+   * - Offset
+     - Size
+     - Field
+     - Description
+   * - 0
+     - 2
+     - sensor_type
+     - Sensor type ID
+   * - 2
+     - 2
+     - sensor_index
+     - Instance index
+   * - 4
+     - 2
+     - channel_count
+     - Number of channels
+   * - 6
+     - 2
+     - sample_format
+     - Must be ``1`` (``s32``)
+   * - 8
+     - 4
+     - scale_nano
+     - Scale factor in nano-units
+   * - 12
+     - 4
+     - flags
+     - Capability flags
+   * - 16
+     - 4
+     - reserved
+     - Must be zero for v0
+
+Capability flag bit 0 means enabled by default. Bit 1 means calibrated data can
+be provided by the device. Other bits are invalid for v0.
+
+Sensor type IDs
+---------------
+
+.. list-table::
+   :header-rows: 1
+
+   * - Value
+     - Sensor
+     - Current RFC driver mapping
+   * - ``0x0001``
+     - accelerometer
+     - ``IIO_ACCEL``, X/Y/Z
+   * - ``0x0002``
+     - gyroscope
+     - ``IIO_ANGL_VEL``, X/Y/Z
+   * - ``0x0003``
+     - magnetometer
+     - ``IIO_MAGN``, X/Y/Z
+   * - ``0x0004``
+     - barometer
+     - not mapped
+   * - ``0x0005``
+     - temperature
+     - ``IIO_TEMP``
+   * - ``0x0006``
+     - humidity
+     - not mapped
+   * - ``0x0007``
+     - ambient light
+     - not mapped
+   * - ``0x0008``
+     - proximity
+     - not mapped
+
+Scaling
+-------
+
+``scale_nano`` is the per-channel scale value in nano-units. The Linux driver
+maps it to ``IIO_CHAN_INFO_SCALE`` as integer plus nano. The exact physical
+unit depends on the IIO channel type.
+
+Timestamps
+----------
+
+The frame header carries ``timestamp_us``, a device-side timestamp in
+microseconds. UART buffering and host scheduling can add delay before a frame
+is processed by the host.
+
+The current RFC driver does not claim production-grade host/device timestamp
+correlation. Buffered IIO timestamps are taken from IIO timestamp clock handling
+when samples are pushed to IIO buffers.
+
+Non-goals for v0 upstream
+-------------------------
+
+The v0 upstream driver does not include USB transport, fusion output, Attitude
+and Heading Reference System (AHRS) output, Kalman output, calibration command
+ABI, custom sysfs control surface, production timestamp correlation, or runtime
+capability removal.
diff --git a/MAINTAINERS b/MAINTAINERS
index 26bbdf8d3..6ccaaa738 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19981,6 +19981,7 @@ OPEN SENSOR FUSION IIO DRIVER
 M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
+F:	Documentation/iio/open-sensor-fusion-protocol-v0.rst
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE
 M:	Rob Herring <robh@kernel.org>
-- 
2.43.0

