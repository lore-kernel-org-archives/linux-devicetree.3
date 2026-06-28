Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E9F2FE59C
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674068; cv=none; b=mrcQ+8k1zIbUCo9SC7UOWRx9l2QGb+8G6seS0tuQ1pwYNyC3/8/CsNz3pFy5NAA1d/qotIa4yES0Za5uLgvzhuKbpDl2Vz+IdWVfj1q853sMGEAvP4T8aX7+kbw9wMB+OsVpSRjc+QMIjw6KPuQWMJLyRhAP8yRe/OlkZQgi5U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674068; c=relaxed/simple;
	bh=GIBybOeaQlWJOTelKRylTuWz5WpRQg5fFI/o5/cpACE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SD3LRTUpYIfufQ01BgistSW0On/Zcoj5f3xUR2s91cEdDeDKWrdMmxRZTU1Zn25OQBL8sWjdwm/evtIBC/2pU6iV7KU2bhe3JVFs5+sXNlOk6Uhf32qZPlbkTKhi24CSuV22rEVPAiz+V5GoSIQ/7gVrc4t654oIneeerUJR9XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDYDxfc1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDYDxfc1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c9c9913ddaso3397695ad.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782674066; x=1783278866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDKPzrmjT/KpEP+HQO05oH/j1kMvH69bNR/Nsv/tXRg=;
        b=oDYDxfc1BvswliIyRGTVhfHNhTLLvc+7xvKvCWR6hLmgzXTXr2BWlsrz4jU/LwTv3k
         pJ05F6xhGrabmBD+G6t/nC0wtg/pz+yqQGVZxVpKyWQ42SNOy3FXnZgePORuKy69h8Pt
         nBgHIhLiwT/9BvpguO4Yhkz4syF5yDedtx6VUoXV08AiVsRhuCu76cE7F6yOWcQ6hXWf
         wEGRDbDAl+Po8Z7IzErpGD8Vi5B2kmmwrypnxijXUyyWwHne++ijc4Z6Vvqk+BBZikw8
         cR64039YZU5mW0Hq1fkJAPKsOWJc3crNBUrPaFECMuo9gaLirwroZj3/H4QTDZKBx8k6
         wleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782674066; x=1783278866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDKPzrmjT/KpEP+HQO05oH/j1kMvH69bNR/Nsv/tXRg=;
        b=JwWe/AiZtD509+KWlyA8rZVeKQtZJ9HtSAMZTjFzsp6ySs3ltfriCfoZ5B43ovVXuI
         4D+98wzGjpRzuLnvAzedtlo/1XWTegb0OTnk5KAYRv7Dyjrhm3PoIh8tXDKIuhCo5Ulg
         9xBNfxwSpumpq/XV8yfJJC7Peu0WMG3DmS1oCQqY9gl37CKn1nPgo0ZuAYL0bIUpthGv
         HK3SWXxYIZbmkgDAL45t0yWjug1NA2VW4yRUnkeLAiDiJMoZ1x8ULFxD2jb4eL/sU2Jd
         rp/aNLBFfdOqeMz3wcwZpK9HnXx2y3Euzo6MlNXx3MUIQ3vRDSbS4JQzDZ+Xx04f7oxz
         u5lw==
X-Forwarded-Encrypted: i=1; AHgh+RqANVFsqpOJdSp9R9OnPQKZGWVFSC0tY0ZFcqMMyEvfQavzIh8DZKMpwGLWby+2VyCcE9qE1m4BO0lk@vger.kernel.org
X-Gm-Message-State: AOJu0YzilMEJn5onZZS7ZUWnS7Z6qABytEJFfpI95nAEMluaHfzvgsGa
	+CVrhbTh5kJHaxgNBCOIAVmRLClx8hEIc9MpyHh+j8QuYd+fEPdIgkcz
X-Gm-Gg: AfdE7cny0Gr8M57XrUYEZB2dWEb4WZQL3pTIv0ZHwCCF/XJ2yvRyVIny1t2Lb/zprM6
	heEdXFZnesHf1mcNn2UGQehk31KO4s9lZnPR9zOjrHScPS/I8ijrsPnCEEFn/EIdPYjr0hb407x
	hvScBQoNldlrt1OWy+FTwlXNSmqxWJ2YBr+5i3WXE2letNV7U4JtE05fGE5A7NK/9m9df5N6N3T
	fu7iI9GBVBjR8VqIAHlhzuMGMDMxTi3vSfB223dg/mOTIF4X3zvsgg0VPaN+kso1EPxKx6vPvcN
	VVV5341oho1Mowntr+lO6sYluAmUFreba9I+FdyxQ9QbXCp+Tz96W4Py6ZdDOuORertO0gTmSUm
	V+fwcjs7+ggqMC/k1KI9olXxGRxbJGb3mtLbrNrfdqzJeIyXKL+MBkgD8Jrzq28ecZoBlLpZFGO
	HXloPtjrHzHylxOxoL74LC5XL6YCB2Axm0dqxg2f9ZYjY1QYsxR+P+cUWYuZzmZMR4gzTVcFw+F
	ikTWM0weBq/a3HZMcykp3kB7T6q
X-Received: by 2002:a17:902:cf0f:b0:2bd:73f4:8e4f with SMTP id d9443c01a7336-2c7fca76990mr104730245ad.0.1782674065966;
        Sun, 28 Jun 2026 12:14:25 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca0b454815sm1354385ad.2.2026.06.28.12.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:14:25 -0700 (PDT)
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
	Jinseob Kim <kimjinseob88@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v6 2/5] Documentation: iio: add Open Sensor Fusion driver overview
Date: Mon, 29 Jun 2026 04:13:34 +0900
Message-ID: <20260628191337.937-3-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628191337.937-1-kimjinseob88@gmail.com>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
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

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 Documentation/iio/index.rst              |  1 +
 Documentation/iio/open-sensor-fusion.rst | 72 ++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 74 insertions(+)
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
index 000000000..832901f5e
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
diff --git a/MAINTAINERS b/MAINTAINERS
index e4df9d8dc..17c80b55b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20015,6 +20015,7 @@ OPEN SENSOR FUSION
 M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+F:	Documentation/iio/open-sensor-fusion.rst
 K:	opensensorfusion
 
 OPENCOMPUTE PTP CLOCK DRIVER
-- 
2.43.0

