Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C37F30E827
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674059; cv=none; b=U4+/xyizo8w4xXFz7rlgvit3gAtRa2VwOdR3T/VFEsRqUDtBJ1yVAmwTjfquuh+VfSPhm9xpjkz6WxtWjqL7SIjLy9+EruZY+UJSOroJfaSI/GandwXYIXcw+JS6CvrS0XwQDkgsv5dWgFGezsLB6l+3jc2v5ouzP43z0l3Qd4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674059; c=relaxed/simple;
	bh=ZzTYGVCy8fODFj0xEVGqVe1G0+adzKhYacNbiy+2CXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FiQ3lJbAD31xXiXzalebGxeLXjhe41cHw3oVWZ4sNK7CtULVyFWsvew996BBRLD7WuzORvdJu9T04Lb+WtAJdbsoODSrVdFi/EopMWoB+LfvPpGlbFgAaXIhNPC179FobKxjxNLkSoFhO460vDZrDrrk5CPOpLQKXCN/yGQe1C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HY1VIDwS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY1VIDwS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37d7c265ca5so2045062a91.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782674056; x=1783278856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YjPPl2WZyg0oAL3UMriRRxZrSS5zvLZMLEmgTiAO/eA=;
        b=HY1VIDwSjptksZ/Q+8klUFfIXQOk5AS5Z0CuTiBgZI/YJe2a3rTv0ZENA+j316SZWj
         Sk8soowC4mlVldPIy9xWWrNrTGtb7nB2ZkjuOUK2lT6CJK6uxvD3p4w7xVUMo6cTaa3S
         ZGrPreJBxBGg79oh3i5u1m0M7rDXcCD94YiV14LY/OG5RENOq8ey0Y0AdjVyWf4qfCbc
         FlhpH0sUKAPU9/NXQtTb93QhELN8VRlcjEwylUAIpRqqxYYvQAkJHtRX2uaX+YyooxOR
         MgT03nhBicGGdkYr0zC+iX5PEc9fY1ERq4WmydYUhiu4WAWqDIJdlaFXL7POSWqBvxcK
         FSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782674056; x=1783278856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjPPl2WZyg0oAL3UMriRRxZrSS5zvLZMLEmgTiAO/eA=;
        b=q9m1wqm1fWDmenGdGowrIE3YGkTlJZY/5ZSJLaMzgx8Jd3y9vIDyMpgeGShdgDnKF6
         UaUPgCeCzznaUp1nKCzo0DYmL50Xg6hzGxM2Hqjaa6U27gHq3QuPi3P9NW7Jbgzqqxeg
         9yvX6ZXAP591bhAcjjSaKL8u4dv6tEl6L1JUbErXz3F2jCSA6u0UXUNqSHiWX2wOyNIv
         Fcn6/eyapNkIs0ZAm7Vw+2hoLrJS5Bo+e9FdPpl2qnbAmT5xY2Be/M6YQQ2+jPlMJFuf
         M4d9BzFa5+YbsqJJnAxy48MkZG6bvd+99DNZ207rJWEdWBM1lVOI82YJ8ye7Brt1SE8a
         opRg==
X-Forwarded-Encrypted: i=1; AHgh+RpS7TGCyIVKTWW30gVo6daCjb/6NnxbP6tyJEU+9T+t4b4t9zuQn/nsXiv/SFwVlw99hiqThbXTfMJB@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3xlAAao6XcYmzTgeLwioM8zIYK4NOWq7Ofw1nQm8YqKh6PDY
	cyyBomG4T1Rh0322qBIZ51v8BwZN0j8U/0rr7RGfjex6VOm5aXN1Ipfm
X-Gm-Gg: AfdE7ck5+kW28f36ip5zQ4fOv5yO4p4mqapqGnPdlS5PJb7RBJk5OFqnB7BRaopjLGC
	kUr9qb5eR+qleEG/0atkVHulAh9dgX8zkr71Ta6/0Od+tgQ1GvpDYGepQtGmOMufD1+7VWuM+2D
	Senq1+/5HRgH6WXQ9pgreD6SvtFIBgtmzKbQpwJTnxDkYsB8kFaLuSxx6gFl41xYVZu9nHzeUg3
	Fla0pJcTlnAwKNrCRW2jIhTNa06XcaZBBpkczCr/frxwT+xK9B2VYB2aaTrkmZc0Jzn558OfvbF
	aWgxyfx99VKBOMaTfCvrVFcCvZ2SnFS+qHR3Rn/TzWfnoJ6wiqhE3+9bnMig/3D6TzkJoFBf8ej
	l2M21WLtadvJDsoyz4lPzfOEeYmMwwCEF7nKCjqelP2CZgmWJWs4mhFRVU5KghpXNXw8tqC6EoB
	1Se2KST9hDQ8xta4hEkgswP09XOvM2lXdDKJYGY42Px+m4WVByLn9CEP56Yo0S1mne4xtYbs3ao
	+tnQBoA9wmauKS3VWrbWjbMKnDx7Q4ofJlnfBc=
X-Received: by 2002:a17:903:13c6:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2c81c051932mr95767075ad.19.1782674056502;
        Sun, 28 Jun 2026 12:14:16 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca0b454815sm1354385ad.2.2026.06.28.12.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:14:16 -0700 (PDT)
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
Subject: [PATCH RFC v6 0/5] iio: add Open Sensor Fusion IIO driver
Date: Mon, 29 Jun 2026 04:13:32 +0900
Message-ID: <20260628191337.937-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Open Sensor Fusion (OSF) devices expose a UART/serdev host interface
for a sensor aggregation hub.  This RFC adds a Linux IIO driver that
parses OSF frames and creates IIO devices at runtime from capability
reports provided by the device firmware.

When the corresponding capabilities are reported, the driver exposes
accelerometer, gyroscope, magnetometer, and temperature data as IIO
devices named osf-accel, osf-gyro, osf-magn, and osf-temp.

This remains RFC while the binding, protocol subset, runtime discovery
model, and driver-facing ABI are reviewed.

Changes in v6:
- Reworked the series as a 5-patch standalone RFC.
- Folded the previous transport and IIO registration split into one
  final driver patch to avoid Kconfig and Makefile churn.
- Addressed binding feedback with generic host interface wording,
  mandatory capability reporting, runtime discovery wording, no
  Linux-specific binding language, and no fixed regulator provider in
  the example.
- Added progressive MAINTAINERS coverage as files are introduced.
- Removed patch-split wording from Kconfig and introduced Kconfig and
  Makefile entries in final form.
- Applied style cleanups including loop-local variables, unused include
  cleanup, and a probe-local device pointer.
- Used designated initializers and guard/scoped_guard where useful.
- Kept the stream parser from discarding unauthenticated frame_len on
  failed decode.
- Synchronized IIO buffer pushes with
  iio_device_try_claim_buffer_mode() and release.
- Replaced iio_push_to_buffers_with_ts_unaligned() with local zeroed
  scan storage and iio_push_to_buffers_with_ts().

Validation summary:
- git diff --check: pass.
- checkpatch --strict: pass, 0 errors, 0 warnings, 0 checks.
- dt_binding_check: pass with dtschema 2026.4.
- make KBUILD_MODPOST_WARN=1 W=1 M=drivers/iio/opensensorfusion:
  pass, no compiler warnings.
- Local stream parser corruption/resync harness: pass.
- Static IIO scan layout and padding checks: pass.
- Raspberry Pi hardware/runtime smoke testing is pending for this v6
  candidate.

Jinseob Kim (5):
  dt-bindings: iio: add Open Sensor Fusion device
  Documentation: iio: add Open Sensor Fusion driver overview
  iio: osf: add protocol decoding
  iio: osf: add authenticated stream parser
  iio: osf: add UART IIO driver

 .../bindings/iio/opensensorfusion,osf.yaml    |  54 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/iio/index.rst                   |   1 +
 Documentation/iio/open-sensor-fusion.rst      |  72 ++++
 MAINTAINERS                                   |  14 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/opensensorfusion/Kconfig          |  16 +
 drivers/iio/opensensorfusion/Makefile         |   6 +
 drivers/iio/opensensorfusion/osf_core.c       | 291 +++++++++++++++++
 drivers/iio/opensensorfusion/osf_core.h       |  70 ++++
 drivers/iio/opensensorfusion/osf_iio.c        | 308 ++++++++++++++++++
 drivers/iio/opensensorfusion/osf_iio.h        |  22 ++
 drivers/iio/opensensorfusion/osf_protocol.c   | 258 +++++++++++++++
 drivers/iio/opensensorfusion/osf_protocol.h   |  97 ++++++
 drivers/iio/opensensorfusion/osf_serdev.c     | 114 +++++++
 drivers/iio/opensensorfusion/osf_stream.c     | 189 +++++++++++
 drivers/iio/opensensorfusion/osf_stream.h     |  31 ++
 18 files changed, 1547 insertions(+)


base-commit: ab5fce87a778cb780a05984a2ca448f2b41aafbf
-- 
2.43.0

