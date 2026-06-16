Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECDE39A4D6
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594603; cv=none; b=Y9ze6tdjGbGPIN0hMFdKMaDwDdZqG8qJrhliv95LAo5quUkaeM9hPPZxfP+NDJnLQ//gZ2M/rYeodoMaVrjD9GZwMAYbmm1v7hLgdwHWHOhNxBsUHLchcN43c7tiRYvObt9gVYL0oa5sBbWf0+OM9UHel4azSKfs7BfcZ3Sbumw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594603; c=relaxed/simple;
	bh=bmfwXkXMYCQ+RKrS7k10m9FyRWRufppNyWl2BrUYexg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1Cr0momnm83oWPUZif/Pget4RmdvlFJMgXRGbTC34fi2SSzYoqIp1E0GGnqJqhj2nwi6CIVRi6kIoROwSyKvTvmT6gP1DQ5uG+DEVmRtEDjANT4SgOY2lVtn8wDPQ7j/pzll2yfwqZFGevz4wgA5PPrGwQW/zUqQgs6qcHreJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBbN/W1/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBbN/W1/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so26651095ad.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781594600; x=1782199400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+5vGSmETl/Ms8XBPdeUCk9fXSncbDGOOiAZTfMUEf8=;
        b=OBbN/W1/mAj19AKMD0BoHllo/tq2hkKmxDgZo+XGKKHykp24yb6K0gUeyhT0JNj3Lk
         iHoPwLd1Rf7bmeXxZl/kw3fYhKHRhzravy36mxjc8FDuiaPjRAplGX5e8tgBqq3rwl/m
         VH+zVOyFLDQoCqeyoaVbGjoyTcHjpGnoMZxo3E7imI8by0qGu8qG+VgkfXBWKn2yQ7yF
         L8GpHZIcsOqKROhwX00yeY28tFKwET5/eY8Aoa7hHG5uKx2Zgj5wJcPtVJYytWFpGAJs
         dTZEs1yoLEbyh4Xgw03oq5zN7iBU5cienCFHrPhnt5MqUN+Igc7R6bH7MB7hUOOxx09B
         Pjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594600; x=1782199400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q+5vGSmETl/Ms8XBPdeUCk9fXSncbDGOOiAZTfMUEf8=;
        b=Ds40KsozAM+AcvQqIq8o2zf4BKm4TRafcGMY+PnkVb9GTwC2Vwq9BGUwC3mI9Jg2Ru
         yoEWN3raj1HJKW1oZdEbak7m/DQBbJ/Ibxu22tECe/lLMyDPSt/ruyiMLyOrH18/0IEt
         bKXtlboOUYmJqMEABRIqY2L91DFPxrZEiVydCnC/j/Ddomxm/wkwENnRndvz6zQi8oIu
         QfsFwaNQRT1fmyaJDAmlnbcQnJ7PKRicqK5yageGmdx9yE1XlrbZkwKFR7fDqIQGFLgg
         q8lENWBAIn5/6qdmVo7wSKFzH9fs8TuZZtxMQtmAxlpAWKODRzogVkZGbPvk/fsxP93s
         KESw==
X-Forwarded-Encrypted: i=1; AFNElJ8pwywmxdTUfVipy+F/tgllwlNYp0F4kureT4sWIArMueEghnf1A06Fi0u360fwPVmGf/CeDYOP02KS@vger.kernel.org
X-Gm-Message-State: AOJu0YwbOsuW62inkdpAQida7P9cLeUJnQe7BTDsUwgxAxMshIUlbXWy
	bDzPPc6XwAq/eWWzs4EwVYW4WX3gBHjN49qPHm6jKTCHADiazG9F3WND
X-Gm-Gg: Acq92OHC51l2GTNvJGaLaRMWj4V8RNxP5EzlrIzt0Pl5tnX1s9O6M19o2gaPVU0QhC5
	9XjVisbKXfgUKDLY4hIc+e8P64vPsh1TqyQ1j7AwqO60LF1U73bmX/jRUNrvr17BI/uyiUpKgdg
	mhvvFPg9vEODFLlLu38cv8Pkxuh7PpP6rgRyGhYqaajVjUWd6vQ4Jrh3LoerojPahc9DjEwvOtD
	Bfg8137ajESemDgjtq+Q1EpUBjtp3AvWRE6juBjB6xlxxxA4g2ARDaiV6sqGI32H7WboUMo9woT
	bQufUTeDzDDOW/G3w3FximiuN0RMHBlrIGOPx43hglt6fscwy4ajAv/TXy1Iph7te2VjcPZ8dxh
	L2eNgAsrIVaHt5Fgm/OIzz9qDg/SZA5WgkAz33imiR64Gy2kFFo/IHTqhOTBFkI6rAeGbY28SCK
	ufl1gxHIvNkqtfgIhPgmbDJSuKY9ZlX25NRvR5VoIoexN3ckrdwuKySvPYv6HdsrzF9cD0KxoPP
	lOcqcCJbxUp68u1d70pgXZykFLlKmh2Dr76gMM=
X-Received: by 2002:a17:902:f645:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2c69a1f51d9mr24931525ad.31.1781594600358;
        Tue, 16 Jun 2026 00:23:20 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f1014sm123513435ad.16.2026.06.16.00.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:23:20 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinseob Kim <kimjinseob88@gmail.com>
Subject: [PATCH RFC v5 2/6] Documentation: iio: add Open Sensor Fusion driver overview
Date: Tue, 16 Jun 2026 16:22:38 +0900
Message-ID: <20260616072242.3942-3-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616072242.3942-1-kimjinseob88@gmail.com>
References: <20260616072242.3942-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Linux IIO mapping for Open Sensor Fusion devices, including
capability-driven IIO device registration and the initially supported
receive path.

Call out that OSF0 is a wire magic value, while protocol_major and
protocol_minor carry protocol compatibility inside frames. The Linux
compatible remains the generic Open Sensor Fusion host interface.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 Documentation/iio/index.rst              |  1 +
 Documentation/iio/open-sensor-fusion.rst | 71 ++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/iio/open-sensor-fusion.rst

diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index ba3e609c6..2713ec5e0 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -38,4 +38,5 @@ Industrial I/O Kernel Drivers
    adxl345
    bno055
    ep93xx_adc
+   open-sensor-fusion
    opt4060
diff --git a/Documentation/iio/open-sensor-fusion.rst b/Documentation/iio/open-sensor-fusion.rst
new file mode 100644
index 000000000..cf3bbd761
--- /dev/null
+++ b/Documentation/iio/open-sensor-fusion.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Open Sensor Fusion
+==================
+
+Open Sensor Fusion is a sensor aggregation hub interface. The Linux IIO driver
+receives OSF protocol frames from an attached device, discovers supported sensor
+streams through capability reports, and registers matching IIO devices for the
+sensor classes supported by the driver.
+
+This document is a driver-facing overview for the Linux IIO mapping. The full
+wire protocol, firmware behavior, and hardware model details belong in the Open
+Sensor Fusion project documentation.
+
+Device Model
+------------
+
+An OSF device sends binary frames from the device to the host. The host driver
+uses ``CAPABILITY_REPORT`` messages to discover which sensor streams are
+available. Device Tree describes the attached OSF sensor aggregation hub; it does
+not enumerate the individual sensors discovered at runtime.
+
+The currently supported Linux subset exposes:
+
+* accelerometer samples as ``IIO_ACCEL`` X/Y/Z channels,
+* gyroscope samples as ``IIO_ANGL_VEL`` X/Y/Z channels,
+* magnetometer samples as ``IIO_MAGN`` X/Y/Z channels, and
+* temperature samples as ``IIO_TEMP``.
+
+Protocol Scope
+---------------
+
+The driver supports OSF protocol major version 0 for the initial IIO receive
+path. The current wire magic is ``OSF0``; that string is a wire-format detail and
+is not the Linux driver identity. Device Tree keeps the generic
+``opensensorfusion,osf`` compatible rather than naming a product such as OSF
+GREEN or a wire magic value.
+
+Protocol versioning is carried by the ``protocol_major`` and ``protocol_minor``
+fields at fixed offsets in the OSF frame header. The driver currently
+supports ``protocol_major`` 0. ``protocol_minor`` changes within major version
+0 are intended to remain backward-compatible within the fixed header layout.
+Incompatible wire-format changes require a new ``protocol_major``. A future
+device that cannot expose compatible version discovery through that fixed
+header layout would need a different Device Tree compatible.
+
+The initial Linux driver handles device-to-host frames for:
+
+* ``SENSOR_SAMPLE`` buffered and direct-mode sample data,
+* ``CAPABILITY_REPORT`` based IIO device registration, and
+* ``DEVICE_STATUS`` cache updates.
+
+Vendor-private message types are ignored. Command transport, calibration
+control ABI, fusion output ABI, and runtime capability removal are outside the
+initial Linux IIO receive path.
+
+Timestamps
+----------
+
+OSF frames include a device-side ``timestamp_us`` field. Buffered IIO samples use
+an IIO timestamp captured on the host when samples are pushed to IIO buffers.
+The initial driver does not correlate the device timestamp with the host IIO
+clock.
+
+Compatibility Notes
+-------------------
+
+The project protocol documentation should define the compatibility rules for
+reserved fields, optional flags, and trailing extension data. Until those rules
+are finalized, the Linux decoder keeps conservative bounds checks around the
+currently supported message layouts.
-- 
2.43.0

