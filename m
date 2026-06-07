Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31811328243
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 23:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780875911; cv=none; b=R5uLqg1PWng6KmyIqnz5HR+dFGrnosn1Laz1AemOMn+hlHyzM7c88ldwRt2e3nDuvZjwRM1yzqdYqzXNjNUYSw5ot36QDcKeCmOgIAi8fVxUo7R6eiraKsBsi40oXZsdNkj0RPega78DrJFOKrkuNC/Jv5WoVMBroRdjFIr/eBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780875911; c=relaxed/simple;
	bh=ZIwLVrv1HgnG73iPHOUTfKF++AsJf71N/rHMQbqfk4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MpeFcTNdCXn6P/sNtOTThEv2MjiE5gMsjYOTSVFVL5E+Ej9bhqR2rMug3upbx3whAoOoFPxhoO/2oE0RozsX0l9/zkosFaEl/mfdKKCaSW6sdw4jzvrFuI98NbxQOeZYKCC+VASNP5Keghx19OJw1FZfSkOsfO/Xt9mmseobSu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXdzl0yA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXdzl0yA"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84232e83ca9so1538119b3a.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 16:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780875909; x=1781480709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqkSLcaCVqTAnIwMjGmi7aDRUogvZTPKJm11XJXrxi0=;
        b=WXdzl0yAAMiVR5dWPdJvdy79IJSYK+AqFQabUGBFW1vmxXLxNbmgo+kkeREa+YTq0a
         9AgTD4PUlCb5NNbg2O1VrfnQRc3lu7FHEluIinwX8ugDnGrTj0Qa7BdEOeh5mIlraTpl
         DZUkxUwcTEB6Q/76XmMQCVvxA2fpaybvB1+P3LITMOfCx9DcRtE2+MHAfMAz4iAuZWTO
         PPb68VcFqeaMjNple+JT9Zg7+jWss1cS5nhHlwhvhB5SMowc1yJtrcwNyezD5wgw9d5Y
         2mvaUkjNWZyLVp7XsLKihB771t0SMFXFXRUxTaZa5Gd9o1gXxzMFV2aUn0lsF1Xpl9pq
         X/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780875909; x=1781480709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqkSLcaCVqTAnIwMjGmi7aDRUogvZTPKJm11XJXrxi0=;
        b=MwQbx35tubGnHdO27300JfVJNek1OjBqrlgpIAB/aHPTWxmWjRm0gZN8DPFUmw8wMi
         a/CBxv6WxIt9d9TGnNxCz59FBBqusI1dAWCwLWFihMwqQZlOD5IZ+91Lp8D6oD8ELx5c
         YXyjbmKwWJXo+icjm2l4n9z2u45/ARo+lyz/Pf/HcvOeMoyew5+dAHGiQ6khop5VSNvR
         KPa2oqswksKwny1zBMKGux0lqnGdTkjy0xlMz4/ATeWjg0U3d+aXoP3MI814ZLogzqCy
         OtZJSGX8yqvBT3wxRQ9AB5gLdJybQ1vC1Cr/4pJrsp1v00ZlLTwm37UDR1LMSnydO0/5
         oN2w==
X-Forwarded-Encrypted: i=1; AFNElJ/BsnaHPA0JS+p7N37aE2+Y2Na4wJ8EzDLf2ajJdfe+orEYVHLJ7necW496tPAChqlLsQGK0nZDtaUL@vger.kernel.org
X-Gm-Message-State: AOJu0YzCfn8cPBpWMNYdJVBFzv0Jwz03sPaY3xRvpc3cjqTBK2ySOXNp
	ompEq0wMQ64qB5oW2xBb+oJ4QbtOKbTqYdwTHjQLxPK8d29rM9Tg2bcl
X-Gm-Gg: Acq92OFgzYdWpJKRi5gCqTm8YRQfD4Ju7phmsadagzB4BgHw77Xz2kje+Xb3z3MEXO+
	8Um398jPtKhnKfR/5Wlf0mvznwO0DWA8bq0pY+FOYInQGROkWugOPmVr3SlncJBU45t7K5srvkG
	s275PlGYBoApf+cuHHCtoHjvFvLEU2mAxN4xLWehGZ7tOwDEb2US8oYJpzuPg6hc8pPin5Ta2V/
	yWBqWAOEi12Z3ThIT0Ej9p4ujkzl5gOXHKhyRdIuJwxwipor6LPpUeMpS9OuWfk2/ObpoQOyBEk
	AlXwj3kL5qSnlbsp0H7RP9dkcKvpcbZaE7TsQYUN7DsqjCT/fiz2a1ZmN4/ImSYAjOUKMZAnovi
	f/5JQSpDX5PiatqWsXOOyDVEseGUohaI9nYpr/SWiKT0ONrZORV8jOv4Yuk0AZMGxP6UMob5qld
	IzGjrwKAiCkSNQ2RH3KAcMzrmW+HNjo2tCjfdiFimuAH4WtGb8V3DylmvVR3nqUzTcl/IcZ0CH6
	ruCsH8wLvHaWHJgF8G6HZ+xhjRL7AHXqETHwkCFQmwLj5mX
X-Received: by 2002:a05:6a00:908c:b0:842:688f:3089 with SMTP id d2e1a72fcca58-842b106519amr13270527b3a.30.1780875909261;
        Sun, 07 Jun 2026 16:45:09 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19257732b3a.44.2026.06.07.16.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:45:08 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH RFC v4 0/6] iio: add Open Sensor Fusion IIO driver
Date: Mon,  8 Jun 2026 08:43:37 +0900
Message-ID: <20260607234343.22109-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC series adds an Industrial I/O driver for Open Sensor Fusion
sensor aggregation devices.

Open Sensor Fusion is an open hardware project for sensor
aggregation devices. The Linux IIO driver is an initial host-side
implementation for OSF devices. The driver receives OSF frames over
UART, uses device capability reports to discover supported sensor
streams, and exposes supported raw sensor data through IIO devices.

This series is still marked RFC because the DT binding identity, the
supported OSF protocol subset, and protocol extension and backward
compatibility rules are still under review. The v4 series
intentionally models the Linux device as a generic Open Sensor Fusion
device rather than an OSF GREEN board-specific device. OSF GREEN is
the prototype board used for current runtime testing, not the Linux DT
compatible or driver identity.

The current wire format uses the OSF0 magic for protocol major
version 0. That is kept as an internal wire-format detail for
compatibility with existing firmware, tools, and runtime smoke
evidence. The public driver identity remains Open Sensor Fusion / OSF,
with protocol versioning handled by the protocol major/minor fields.

Project links:
https://www.opensensorfusion.org/
https://github.com/opensensorfusion
https://github.com/opensensorfusion/opensensorfusion-hardware
https://github.com/opensensorfusion/opensensorfusion-linux

Runtime testing so far has used an OSF GREEN prototype connected to a
Raspberry Pi over UART. On Raspberry Pi 6.12.75+rpt-rpi-v8, the
driver registered osf-accel, osf-gyro, osf-magn, and osf-temp from a
capability report. Raw reads and software kfifo buffer reads were
tested for all four IIO devices.

Changes since v3:

* Explain why the series is still RFC.
* Move the DT binding out of iio/imu because the device is a sensor
  aggregation device rather than an IMU.
* Replace the OSF GREEN board-specific compatible with the generic
  opensensorfusion,osf compatible.
* Treat OSF GREEN as tested prototype hardware / board model
  information, not as the Linux compatible string.
* Rename the kernel documentation to open-sensor-fusion.rst and
  reduce it to a driver-facing overview.
* Add the IIO documentation toctree entry.
* Keep full protocol details and compatibility rules in project
  documentation rather than duplicating the full wire specification in
  the kernel tree.
* Avoid using OSF0 as the public driver identity; keep it only as the
  current wire magic for protocol major version 0.
* Add FourCC-style wire magic handling in the decoder.
* Use GENMASK() for the capability flags mask.
* Clarify signed 32-bit little-endian sample decoding.
* Stop counting normal partial UART receive waits as partial frame
  errors.
* Avoid decoding complete frames twice in the stream/core path.
* Remove the local scan[] bounce before
  iio_push_to_buffers_with_ts_unaligned() and pass the values buffer
  directly.
* Remove the meaningless temperature available_scan_masks entry.
* Update MAINTAINERS paths for the new binding and documentation
  names.

Jinseob Kim (6):
  dt-bindings: iio: add Open Sensor Fusion device
  Documentation: iio: add Open Sensor Fusion driver overview
  iio: osf: add protocol decoding
  iio: osf: add stream parser
  iio: osf: add UART transport
  iio: osf: register IIO devices from capabilities

 .../iio/imu/opensensorfusion,osf-green.yaml   |  43 ---
 .../bindings/iio/opensensorfusion,osf.yaml    |  43 +++
 Documentation/iio/index.rst                   |   1 +
 .../iio/open-sensor-fusion-protocol-v0.rst    | 308 ------------------
 Documentation/iio/open-sensor-fusion.rst      |  62 ++++
 MAINTAINERS                                   |  26 +-
 drivers/iio/opensensorfusion/Kconfig          |   4 +-
 drivers/iio/opensensorfusion/osf_core.c       |   9 +-
 drivers/iio/opensensorfusion/osf_iio.c        |  15 +-
 drivers/iio/opensensorfusion/osf_protocol.c   |   4 +-
 drivers/iio/opensensorfusion/osf_protocol.h   |   4 +-
 drivers/iio/opensensorfusion/osf_serdev.c     |   2 +-
 drivers/iio/opensensorfusion/osf_stream.c     |  38 +--
 13 files changed, 145 insertions(+), 414 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 delete mode 100644 Documentation/iio/open-sensor-fusion-protocol-v0.rst
 create mode 100644 Documentation/iio/open-sensor-fusion.rst

-- 
2.43.0

