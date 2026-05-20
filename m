Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0592356760
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262143; cv=none; b=dTB4+uERCAVfp0beRHE8Ro7ELgensT1F+KgR4xhmMpEywI90zRl4FxIwmmp+tEhd/qLg3oaryt3R6JiaVuRh4GBUGPIevBRF3DurWmBhCpADAeIBMY1evp1x2UpqM8bZCo4DBmrQrKUIIhmX/ExZguRzQeJvVPE4NYm3jnbn0UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262143; c=relaxed/simple;
	bh=mLWIjo5Mf0fC0ZEIMKv/YgqjtFFyvLeeu5kpLLlq2so=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RoIWz87lLypsMQZcMbx8EUalqZnmyY4+p3cuzjTiE/EzS1sHw0irVVYWYfbzzsbd2YW1hTh1TIX/DVKN4Bt2Lq5wf2bJCWYYPQUzxVJJjLqCY7+bo7NjiQm80YeB11B52VrjMHfwAqqRdGXfIP4sQRmdpC9KJaYxm5DCSk/jRbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHPY3U6K; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHPY3U6K"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba856db1c0so32810925ad.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 00:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779262141; x=1779866941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zj0vx40UntDsD2TYK6nD+GW3q6EMQAvEH6QbIchZOP0=;
        b=pHPY3U6KVdXA/bd/wnZOJdGdxIpK857/62PPrjOBDf7aYPitGEoc/+KuZi0bwgRt4F
         N1f/lbSzG5ofFM8RJjfjI+kQPxNBhruWqTSaKaNyHpByN5doQX7HzNntfQwbcJyuxMDH
         q9e905dPlohTmaXW7iyOw97Jx6mQALAn+9VFJefBy0o8QQnsf/2GFptU7ziXn8E3gDcH
         x/U7Ikf3yGQMgUm0A5tkFC69w8KnLkjWV2RsZtrSz0iu8CR+lmSZAchtYhuhBWq/gHOW
         xhOckvU1CDI08FzCyrDNjRddiMJ9vLaMXEvtPS5TLOL2i9pddvJAqsH4p0s8ZYf7TF+3
         Mpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262141; x=1779866941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zj0vx40UntDsD2TYK6nD+GW3q6EMQAvEH6QbIchZOP0=;
        b=CgY9POebdRCrm9BYMyJzD8qMiIeVuUKw4Y6cS1pEaSz2p+89if1BQeFhEgLOSksaa+
         QCE9AThYVsvKzSQipDXzxGdJLiGLXrJ9EPud9xlFimHb1gbIRCkBLP/Grte7gu+Wapta
         WHvs7YWe7g4dRaz7Tdm6dwXWiKD60L4Q29JglkArWU+dDdCHKq9cBSYPiV8UgdfHm7+q
         41E8a3b0m+ELz67auJqoh6A26yyOjVywuaHiO5Gb+wbJQZoO0zwxgeNhHQy0N1v49zOV
         rdxG7cbFaLk/878YK1KWcWe68WHwEplF4F4DgmUWGdGyozWfnT6sKfDOhOMMALCsSR7f
         J76w==
X-Forwarded-Encrypted: i=1; AFNElJ/5hxPp4ntwO9zKkE+rdhPXudaaaQF3sc2mGxwVHukcMRKY57YLl3rWnuyG1R15j6D2OQc7pSZp/77D@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCEiEj1/4QbIbdEkBt+V1GJ+S/AMXGrfqB6GVMyO5F36+dgrW
	RLgEi5v3COiiKbHluF4tbN4KHBDA7rmKvEpWQ8xjyggd8TlzILt47/LpWPGCAzbJZv8=
X-Gm-Gg: Acq92OE2jdO5szBDzV7GM1NUawID/DMiJNrzgU0RHHqOnwrv+Urg/Omp9hwWJpLyX2l
	eyd4QaeVAXjc6qun/4u1HnI3pdkktQR/KdNsBR7MK+iCLWFtxDLJJypIt2tenbDwc3pjPA/Et7h
	tzrj7WxBwV3kCAZppeBwV8BTNdl4dfluRV7Vkqm+dvrk9UeV8vVtC5KoLF2h/yszpfuO8c3+rjC
	Hq/G3gZLu6Nv7GBgc/IHrYK8ijysXq4WMc/26z+Zm86g6NTMVibdUf4BoD/39UToghJNLTGW7pQ
	Kn0OCQ1ljwngFNUDYX+e9oSS6V4jJJ62+TvIjrVFxLt6ySFIsw5iChQSR4TazuK+j/pcFjIxKBO
	7lM/dYjk0dugSj66UCbqNmtnvGdOaTZjlp1r1rYyWj2TIUi3/G2E2BM1h/E0QvDu+wCkP0DwGNn
	UN+0tOsQSufkpVFXN12cR/VE6xUlKFmbHXV9qZ/OuC5MSomdJQHv/Gjnv0/NtelsCtZ4Jq2xhb3
	EB8Bgl64I891zZ9zpfFgp0r50Ssz4bNdxSOcw==
X-Received: by 2002:a17:902:7892:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2bd7e87d577mr181963515ad.20.1779262141029;
        Wed, 20 May 2026 00:29:01 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm206258595ad.25.2026.05.20.00.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:29:00 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/3] iio: add Open Sensor Fusion UART driver
Date: Wed, 20 May 2026 16:28:40 +0900
Message-ID: <20260520072843.3593-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Open Sensor Fusion is a UART-attached sensor aggregation device. The current
prototype sends OSF protocol v0 frames over a host UART link. This RFC adds the
first Linux IIO receive path for that UART stream.

The first transport is serdev UART. USB, real sensor reads, fusion output, and
production timestamp correlation are intentionally left out of this series.

The driver code is kept in one patch for the first RFC to avoid intermediate
non-buildable states. The internal files are still split by protocol, stream,
core, transport, and IIO code.

Current validation coverage:

- STM32F405 test firmware OSF protocol v0 UART stream at 115200 8N1.
- Raspberry Pi 4 serdev probe and receive path to osf_core_receive_frame().
- CAPABILITY_REPORT-driven IIO device registration.
- IIO read_raw for accel, gyro, magn, and temp samples.
- IIO software kfifo buffer userspace read.
- scan decode helper for buffered samples.
- dt_binding_check pass for the binding.
- checkpatch.pl --strict with ERROR 0, WARNING 0, CHECK 0.
- W=1 source compile/link phase clean in the staging kernel tree.
- modpost unresolved symbol warnings came from the staging tree missing
  Module.symvers.

Known limits:

- The sample source is synthetic stream data, not real ICM-42688-P or MMC5983MA
  sensor reads.
- The IIO timestamp is Linux host receive time. Device time correlation is still
  open.
- Runtime capability removal is not implemented.
- The staging layout uses drivers/iio/opensensorfusion/. The final directory is
  open for review.

Review feedback wanted on the IIO device layout, timestamp policy, binding
shape, and driver directory.

Jinseob Kim (3):
  dt-bindings: iio: imu: add Open Sensor Fusion UART binding
  iio: osf: add Open Sensor Fusion UART IIO driver
  MAINTAINERS: add Open Sensor Fusion IIO driver entry

 .../iio/imu/opensensorfusion,osf-uart.yaml    |  33 ++
 MAINTAINERS                                   |   7 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/opensensorfusion/Kconfig          |  15 +
 drivers/iio/opensensorfusion/Makefile         |   6 +
 drivers/iio/opensensorfusion/osf_core.c       | 334 +++++++++++++++++
 drivers/iio/opensensorfusion/osf_core.h       |  81 ++++
 drivers/iio/opensensorfusion/osf_iio.c        | 268 +++++++++++++
 drivers/iio/opensensorfusion/osf_iio.h        |  21 ++
 drivers/iio/opensensorfusion/osf_protocol.c   | 234 ++++++++++++
 drivers/iio/opensensorfusion/osf_protocol.h   | 100 +++++
 drivers/iio/opensensorfusion/osf_serdev.c     | 354 ++++++++++++++++++
 drivers/iio/opensensorfusion/osf_serdev.h     |   8 +
 drivers/iio/opensensorfusion/osf_stream.c     | 212 +++++++++++
 drivers/iio/opensensorfusion/osf_stream.h     |  31 ++
 16 files changed, 1706 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-uart.yaml
 create mode 100644 drivers/iio/opensensorfusion/Kconfig
 create mode 100644 drivers/iio/opensensorfusion/Makefile
 create mode 100644 drivers/iio/opensensorfusion/osf_core.c
 create mode 100644 drivers/iio/opensensorfusion/osf_core.h
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.c
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.h
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.h
 create mode 100644 drivers/iio/opensensorfusion/osf_serdev.c
 create mode 100644 drivers/iio/opensensorfusion/osf_serdev.h
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h

-- 
2.43.0

