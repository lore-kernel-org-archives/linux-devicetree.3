Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627EE3C5525
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056647; cv=none; b=XRqQ2SWtNfUbMk1jcoposTAkuT8leOpzkjRmbwHYPe17jRI/98r2BMdvFAcs3xYxGp8KutUQGzyjQ/TqbVLD9XTJJIGKDJSpNWIJ0df50ePpUARX5wZ1BZ4PhsPO48/xGgut1Rwp6ll4crU2CaUr7/BDHMcvK6EWEmbZI7VLCBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056647; c=relaxed/simple;
	bh=TVCBkSH0t0I/QdJHG/97TcLdJ/J00jwLfv2FVpplnfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ov2Z7clGOibPkicA+4ythDh5FBf4EXpOT8cKfkztZrjgHx3cWZAyJAy01oHB9Ztvr2kPwTD6pNWBv9E2jpdEMHBneDpZLaOJA/Iam51js5AgRdrC6QPWSstsEg8qjMiMaJejTc7KdRBmn74Y0edEMxbYkIU6T2X/5cq2wiyQB3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtQ0kcLV; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtQ0kcLV"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b0c968fe8so3400866a91.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056646; x=1780661446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+lw2/6g+NhHdfY1R5gSsEUHoCuNL+aJO/wx8JDQeY4=;
        b=NtQ0kcLVN8uTa0Nf0GZirVkpjtZ0o0eImxU/4mIUgwJRW7pKu4DBBdSc2blny3zM2q
         rCUJZvSURWNCIhYXMucHfr5d2708h6RHOfSVqk/P0ynxDb1sWnJ65/2hN4WbAZxcyUfZ
         +G9LTWECihF3hbmutFXx2AGzmd+vcTTumCZ8F9yA1yF2oHQ/U+Rwx0cW49tRF0l4GI1f
         3rGo/0BGP7+6u4V8gBhF8OMCzH6Lpj69xocneaiSm/5KuobxXrhpfqUKwHA+kTfRdUxr
         jlzpBiBO90F46HD7v6mwrkoUrSCHPsojqv65EZuLFc0iNuzEme3R7bIrxtGbM3zXb6Gt
         JE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056646; x=1780661446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+lw2/6g+NhHdfY1R5gSsEUHoCuNL+aJO/wx8JDQeY4=;
        b=qcm3wSyJFdEvHubWvRENzxizL6S8QgAlY8vdzaulPcbTSXkme6uuoUaq7taItHF0fF
         SUFKONR/CvtRJnRMH22siJdfYP92Yi3iEEbUg2d5B/mb1G4j/7KtRFdR3wYGIn81XDzE
         zdIanjGpRsod0+ovkH8PHenhXRSRXR5uQMmDHYxyLVphXYaRu2bD75QRkScdUkjwMs5h
         lEIuYzp/fMEhflezGk65RnjG/xz+slYxskdOPqxF2D6/VUJcA3G8MXYr0VDJj/utxzcf
         rbu3dt+++ocnWUimw/mUtx52A1mi5j8gq01c7zRLTy0mzLuo9Ks9YOp5fDsoTi1QXD4V
         0AeA==
X-Forwarded-Encrypted: i=1; AFNElJ+gB78jhWkwNDHgsOSsg1d9M5UEYlse92/spghTbVIFCiFwxoSLx9Zyu90yrYMXDaUg4cqhOsPGEWwh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9tn8KrUOMBVwAnxIDHbkNzcPOWNyuPhJsNSy1mOZ73QPV6e4q
	yZ524CWIlZiiLocwkT/yNfaJ9KOADyEmxUCwK+HyxJ6505p57zoDwU27N4i6nUgLnfk=
X-Gm-Gg: Acq92OELn+T9OXUxA3l++WF9hJoO5PdpfhHwSZF32p/ztDx/cbRGv4USBEXG/4J11Rw
	X+203zyDvikrXFqav+3EJU+wAzGMgopaeqN5vRT8RossKtcNIs86LwVovis/Ubgxs+kQyW1xL+Q
	fbtNBqLQwgrfpq5cb85P5etcVUx6Ke+hJ6EIlITbvn1elry/XE1veHN8H0RUbtpo32XpDTliYcD
	XK6hj2JwTj2OzWrwVg3dCD1j63IV87P1D8t8OjLUwpXXghIJzwqz9UHnnU1IdGes8nOQxV0lWb/
	ExGkqVolOdldq5v0AK2sLHudMKZY1lPIC3cYD0vubMs1rSk67yhAhWS18LkGmIITYVMbHJqzwPb
	tc14eLsRmlKI5s7epEt+PEnCU1wy4zphO051wJJlh4m3Q/YfTjpBOdayYrtUvP7csT5aWPk90sx
	s08f0MsZXz7XzzIfUnaAIROFaQZ3iQ1f8XiCz9EjtIfD7QdvkElKXCYcMyD01aUuD5RBD+qhtWm
	h5ArsybPQ+/kiy78Pbz1cXfLL1PmyuSmQZAb04O0u4RUCaE
X-Received: by 2002:a17:90a:e7c9:b0:368:1088:bb1d with SMTP id 98e67ed59e1d1-36bbcfd9807mr2907182a91.15.1780056645424;
        Fri, 29 May 2026 05:10:45 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdf3afc6sm942820a91.7.2026.05.29.05.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:10:45 -0700 (PDT)
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
Subject: [PATCH RFC v3 0/6] iio: add Open Sensor Fusion OSF0 UART driver
Date: Fri, 29 May 2026 21:09:59 +0900
Message-ID: <20260529121005.1470-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC series adds an Industrial I/O driver for Open Sensor Fusion
OSF0 UART devices.

Open Sensor Fusion is an open hardware project for sensor aggregation
devices and Linux IIO host support. OSF0 is not a general standard; it is
the current wire format used by this project and by the RFC driver in this
series. The first concrete hardware target is OSF GREEN, an STM32F405-based
sensor aggregation board that streams sensor samples to a Linux host.

Project links:
https://www.opensensorfusion.org/
https://github.com/opensensorfusion
https://github.com/opensensorfusion/opensensorfusion-linux

The driver receives OSF0 frames over a serdev UART, validates the stream,
decodes capability and sample frames, and registers IIO devices for the
supported sensor types. The current RFC driver covers the device-to-host
path used for accelerometer, gyroscope, magnetometer, and temperature
samples.

Changes since v2:

* Reworked the binding around the concrete OSF GREEN hardware target.
* Changed the compatible from opensensorfusion,osf-uart to
  opensensorfusion,osf-green.
* Renamed the binding file to opensensorfusion,osf-green.yaml.
* Updated the example node name to generic sensor.
* Added serial-peripheral-props.yaml and unevaluatedProperties: false.
* Added public project links and clarified that OSF0 is not a general
  standard.
* Separated the OSF0 wire format from the subset currently supported by
  this RFC driver.
* Clarified SENSOR_SAMPLE as a 16-byte payload header followed by
  4 * channel_count bytes of s32 channel data.
* Clarified device-side timestamp limitations.
* Spelled out Attitude and Heading Reference System (AHRS).
* Added sensor_type, sample_format, channel_count, reserved-field, and
  payload length overflow validation.
* Changed reserved fields to validate-only handling.
* Fixed IIO_BUFFER / IIO_KFIFO_BUF dependency handling.
* Added channel_count checks before pushing samples to IIO buffers.
* Added locking for cached latest samples.
* Removed explicit linux-iio and devicetree list entries from
  MAINTAINERS.
* Folded MAINTAINERS updates into the patches that add the corresponding
  files.
* Addressed Sashiko feedback from v2.

The runtime smoke test used for the previous revision was performed with an
OSF GREEN prototype connected to a Raspberry Pi 4 over UART/serdev. This v3
series was also checked with dt_binding_check, checkpatch, and a W=1 target
build in the local full-tree environment.


Jinseob Kim (6):
  dt-bindings: iio: add OSF GREEN sensor aggregation device
  Documentation: iio: add Open Sensor Fusion protocol v0 reference
  iio: osf: add protocol v0 decoding
  iio: osf: add stream parser
  iio: osf: add UART serdev transport
  iio: osf: register IIO devices from capabilities

 .../iio/imu/opensensorfusion,osf-green.yaml   |  43 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../iio/open-sensor-fusion-protocol-v0.rst    | 308 ++++++++++++++++++
 MAINTAINERS                                   |  13 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/opensensorfusion/Kconfig          |  14 +
 drivers/iio/opensensorfusion/Makefile         |   6 +
 drivers/iio/opensensorfusion/osf_core.c       | 305 +++++++++++++++++
 drivers/iio/opensensorfusion/osf_core.h       |  70 ++++
 drivers/iio/opensensorfusion/osf_iio.c        | 285 ++++++++++++++++
 drivers/iio/opensensorfusion/osf_iio.h        |  22 ++
 drivers/iio/opensensorfusion/osf_protocol.c   | 247 ++++++++++++++
 drivers/iio/opensensorfusion/osf_protocol.h   |  95 ++++++
 drivers/iio/opensensorfusion/osf_serdev.c     | 111 +++++++
 drivers/iio/opensensorfusion/osf_stream.c     | 207 ++++++++++++
 drivers/iio/opensensorfusion/osf_stream.h     |  31 ++
 17 files changed, 1761 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
 create mode 100644 Documentation/iio/open-sensor-fusion-protocol-v0.rst
 create mode 100644 drivers/iio/opensensorfusion/Kconfig
 create mode 100644 drivers/iio/opensensorfusion/Makefile
 create mode 100644 drivers/iio/opensensorfusion/osf_core.c
 create mode 100644 drivers/iio/opensensorfusion/osf_core.h
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.c
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.h
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.h
 create mode 100644 drivers/iio/opensensorfusion/osf_serdev.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h

-- 
2.43.0

