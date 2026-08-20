Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB09385D70
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202411; cv=none; b=k5ylXZpYIMDk/jKrwWIRHzKd00hJetGBpZJtSc2GAy6qovzQzFic4sAlC4TxE9amca6OoyBGgMNphn3Adm69/oIoRpqmXDREGnT0jMN2kft8HSmcY4GaHUZmRKNszCmbYaxgis/VrPHYPMxNeYZJ0gNTB/BOvucsGnG6x5HAOww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202411; c=relaxed/simple;
	bh=tppiwU0afVTqKAsxHD7NixQhO94yjKbGlSO7BWcNl38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8i8SkQqajCnMivU2O51Sxwrtx4ik7dhelck4n5hS4A0Ak29dEMu3mhojxiRcMgS//b5eBUdSPGOBkYMMcYkCqz42SR1uNrM3KlHctDqAEPAntfhdsU8uh75c8ffdyygeQTaueqw6TawgK45OGE3fJ2zZJ3iD6gjsMRJc4uj8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5dv4fFy; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5dv4fFy"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ced3386430so15585115ad.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 22:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787202409; x=1787807209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJsCOrmxkPDlt4vp4WrYe2lu9E0Ol0sMmnqsSnQvLkI=;
        b=m5dv4fFy9lXteWvmDVqOS39Yc6X7+tLaSZsT4Hk+kof39Sg9XdLAFs9l7ynPFVRL7L
         GKuMnHVMOT5EsHREzKuCUjamwlmkxkqofFNmvFylUmdT4Wjv/zWNfC+Aff+Dsnobu9rF
         uhyxpohHms3q2wG9SxK43abhiqm2tVact2+GVAt/KAUT5zbGQAtDF7PobWRC+Q66pebz
         ekriEmD7NuwRrgH077oskHlr1+5lTMJm4JJA0TvhZs4yM7gfCGgeioxtDDLeJ7qz507a
         NkfLbMzxvNXXENVI0knuV81rMk5D1bSDb8zw8bno+sA7+3uFB6xUkaDHkD/oV5xy2y0u
         ltmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787202409; x=1787807209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJsCOrmxkPDlt4vp4WrYe2lu9E0Ol0sMmnqsSnQvLkI=;
        b=F1UIOKELsFTItTfozcbN9hL7CgverLj13Fx5Y8MhNqBpgU8OfdQdX2Ft0Gu+3OCckH
         cGQuEpfdQfSXqZI5+GbkS66L7oEFDDFfY62j0ohHsGxNL/VCBLW8SXSDFR8r6XOfmvXD
         Es+8vohDACJFBvmLIqrFpPDrE0tYAcYO9YF2lJCU72BPZz6bEe8YLdqGaXgsz13kT1Ly
         9RoRYUazAh2iSwZEfRjkVZe2E3kvgPVtQu7pzxthJz+xKoVPhB956wb8CY/yjDLnz2LF
         JPm75IEhpPTlYby1v+iVSg3ebW18W67pggWivSmK9TtbSSah1+5mgcfTDgrnC1amOhuF
         OfPg==
X-Forwarded-Encrypted: i=1; AHgh+RoMAAC6ivc5qczqMYKyHkc8+Cv5hq7n9J1oUgKcS0SftKhpO4VMaQFUBa3HFfB5jXHTQuZxrsiF7UVM@vger.kernel.org
X-Gm-Message-State: AFuF++laYRwvTOKQB9fHxmm6JsOmLJ1UWv/NQbRDPfuoOtkjRTUyJ2dQ
	QbSYInKKMoo8G5V2KvbujoKrFLo+TMPgjXfwBW7YLxPS45ENkSHSjkFK
X-Gm-Gg: AR+sD12bpkGOFZBiNry0hHTWFyB811aXC+aPvGDf39Lbglh2FONLf6MIilad6WAD5ie
	KqUpXS1rO9nlFWsI/B0gXIRmbcC3c5aNPXfO085gyqfSrakOLb4w97NnXF9VjjeQIklrjf3ZE0h
	oGybVtijtR4+S8rqlyzyOrXs8cvDvw5mx6qshZA332wFg/uwpraExWS5W+rdCV6neDJepi/6ZR7
	i7JX5fHvCFhxHHlPOf/JbOscE/n8QI69kKLrtFWlNxyEZ0NxeJHUo1DCvT6JkQB4nbG8exNPAd0
	VFQUzhprhFvlE10w7cqJBU3ao8+tleSLtmlmK0y40eil6KNfSzAvYOkmlV6eLvx0V+MHEBkAh23
	RXbZOEt/5zSDfvETuzHYpYAQFiMM8wKF5xt1MonEYax5K+1zesyNhe6cu9NqNA/KyZ0JVkZskD9
	o0q3TcDgK4D9MOii1clq2pfKcIVGuEDR25Gz6pmUp6CISc85s6Sr6XoD7h5aJT9jR69QjzN9O0V
	lyORAV+TUkRPdfMXvXB5lFL8WyBnmC3Woz1hz7bdYlQDDBW1MYXa1dCsQKmszCJfJXuUo3lwpYB
X-Received: by 2002:a17:903:350c:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2d601a8e888mr195631285ad.14.1787202408730;
        Wed, 19 Aug 2026 22:06:48 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d58a82dsm2040685ad.18.2026.08.19.22.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:06:47 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	joshua.crofts1@gmail.com,
	u.kleine-koenig@baylibre.com,
	julianbraha@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	grondon@gmail.com,
	devicetree@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v8 2/5] Documentation: iio: add Open Sensor Fusion driver overview
Date: Thu, 20 Aug 2026 14:06:05 +0900
Message-ID: <20260820050608.5440-3-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820050608.5440-1-kimjinseob88@gmail.com>
References: <20260820050608.5440-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Linux IIO mapping for Open Sensor Fusion devices.

The overview explains that sensor channels are discovered at runtime
from mandatory capability reports. It also documents that OSF0 is a
wire-format detail and that protocol_major and protocol_minor carry
protocol compatibility information.

Tested-by: Randy Dunlap <rdunlap@infradead.org> # docs build
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 Documentation/iio/index.rst              |  1 +
 Documentation/iio/open-sensor-fusion.rst | 72 ++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/iio/open-sensor-fusion.rst

diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index b02b879b053a..c2b7963348fd 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -40,4 +40,5 @@ Industrial I/O Kernel Drivers
    adxl345
    bno055
    ep93xx_adc
+   open-sensor-fusion
    opt4060
diff --git a/Documentation/iio/open-sensor-fusion.rst b/Documentation/iio/open-sensor-fusion.rst
new file mode 100644
index 000000000000..c28886f3b961
--- /dev/null
+++ b/Documentation/iio/open-sensor-fusion.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Open Sensor Fusion
+==================
+
+Open Sensor Fusion is a sensor aggregation hub interface. The Linux IIO driver
+receives OSF protocol frames from an attached device and registers matching IIO
+devices for the sensor classes supported by the driver. The actual sensor
+channels are discovered at runtime from mandatory OSF capability reports.
+
+This document is a driver-facing overview for the Linux IIO mapping. The full
+wire protocol, firmware behavior, and hardware model details belong in the Open
+Sensor Fusion project documentation.
+
+Device Model
+------------
+
+An OSF device sends binary frames from the device to the host. Devices using the
+``opensensorfusion,osf`` compatible are expected to provide
+``CAPABILITY_REPORT`` messages so the host can discover which sensor streams are
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
+The driver supports OSF protocol major version 0 for the IIO receive path.
+The current wire magic is ``OSF0``; that string is a wire-format detail and is
+not the Linux driver identity. Device Tree keeps the generic
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
+The Linux driver handles device-to-host frames for:
+
+* ``SENSOR_SAMPLE`` buffered and direct-mode sample data,
+* ``CAPABILITY_REPORT`` based IIO device registration, and
+* ``DEVICE_STATUS`` cache updates.
+
+Vendor-private message types are ignored. Command transport, calibration
+control ABI, fusion output ABI, and runtime capability removal are outside the
+Linux IIO receive path.
+
+Timestamps
+----------
+
+OSF frames include a device-side ``timestamp_us`` field. Buffered IIO samples use
+an IIO timestamp captured on the host when samples are pushed to IIO buffers.
+The driver does not correlate the device timestamp with the host IIO
+clock.
+
+Compatibility Notes
+-------------------
+
+The project protocol documentation should define the compatibility rules for
+reserved fields, optional flags, and trailing extension data. Until those rules
+are finalized, the Linux decoder keeps conservative bounds checks around the
+currently supported message layouts.
diff --git a/MAINTAINERS b/MAINTAINERS
index 17652ba6039d..9550cf1900bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20297,6 +20297,7 @@ OPEN SENSOR FUSION
 M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+F:	Documentation/iio/open-sensor-fusion.rst
 K:	opensensorfusion
 
 OPENCOMPUTE PTP CLOCK DRIVER
-- 
2.43.0

