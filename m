Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF9311597
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 01:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789177163; cv=none; b=Cw7cdBW+Ys/svRxi5WbIoIApMwmLNS8TrUY/NBMr/oIQGffPzIJeBvro8qWY2+h+/qbyx93+9kdrIgcoOvtkdXOK0f80i2wbnVUIpc4O58wRpj45qBUoY5RCNiJ5EFQRHJe1bMJ5Wt7a0R4m0cZL0RqQXafKpE2kj3joZ2Jz4UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789177163; c=relaxed/simple;
	bh=ptpKRlILh3vy2G4ftYKshvhPYqbk/M3xp8SzkyOJ56E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8gxIUxBgr1W4h7+pbUQK3x4sw/g+raNpgQJ8W9I5m/5keLa+/gdxZdkfQ/vrrmsmpsOTSNP1wvKBfv6hpVwCp5DvL389wUmoVa25AexVe7XcejhPxQOK3yhbmcFDSo5/dh7tezuPzi7kT9tw0T1Em8g6uYZIqibVrBX1B4S4d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOgVdFjI; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOgVdFjI"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6712f981ef2so1186580d50.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 18:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789177160; x=1789781960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8SziI5Cbw/9BaPigJwwxI7zbv9V+0J2bjlfJq82EFc=;
        b=SOgVdFjIKremXvtCBctMP8r3y6iYMRuDH9zg7f3oif/NmgOgQ4G05+MZEiw5+9YCmx
         ipR/ki32tnHVEyozmrS4MJKE0icOmEcPFUvoT2iMR536z2H9NtR5wY+9+kbqc2dUkKq5
         kBN8oRquxd3alPLjkWNVppiYPJTUbcLkejXYzUhtUlUVo1XZrMENehSJXYBSNnN0/+vY
         g23o+NX+M5oashRo4MwsCoeHqCglu0satQI8CogvJ+X0uuOnfYy1zVHN6RXMQoKYCCvk
         L/qjpSE7ufLjPp+U721KcNdIrXeQI8RMNAnRNLAuo/wVs7tCGzyQDCsnwAlfXEGLRbNd
         7yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789177160; x=1789781960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8SziI5Cbw/9BaPigJwwxI7zbv9V+0J2bjlfJq82EFc=;
        b=O2pNPV6TjmbT06Qixi6WhGXbhU2B0FJnxVGaLArcWfiL56H6oXf0WoFwCo2+LhXXxi
         RxiIs8reEfe5mdR5LnYpI57jtHHftfGxOwvgp00JG6bVKqVY4I0KT74FKAni/Iu/S5R9
         yH6XeGHkjAqz95JLwv8Aqr6i1beCmYL/tpdCnaEh57x30HEArStNzJi8iARYEr2wmDZc
         /N5tyLMIzRe/8Lh40Mz6J8wjp3oEaa4cy8s64GHlfhLDX3aOYan9Jn/vIH1qoWlqHG2j
         2TuSL7JgrS8XoYAcLGB7Vn2wFPUL377UAK3w0GqaH+Qj0nawh6NUcmpVBO9ANHVKZGhA
         q/gg==
X-Forwarded-Encrypted: i=1; AKwUvBxbE5TB3WLos95YSYcLoGE74z94OXLmDxaQhwPaDdAjEW6AzWBAxlsEtlEBRx50ozM9yZfYwXzC2yuG@vger.kernel.org
X-Gm-Message-State: AFuF++lIgT7gcM1c+puvhHHitNKD54S0vXUvdPtZWy6gaPJdpo5T+JM+
	NWVz0yxXpr9+TSFiYpc31Tgpzg+5u8FSstqAovpQGnI5VOWXnApFkA+t
X-Gm-Gg: AYBFou02EAYhs2es97t3IdAGUHEAO+1PMYugdmm67DWYTiahl2gnmDu8++T0YczpXWx
	oV9tdSbDP6jXjULt/st/vMhYgJJYtk/hlESnHmEvA3aAX2q9P8FWeH7ZjlpeQDqMFuUgDdeL/VY
	3+gShEfKLsD1I1X/60qwO14BmzgVLy7dCd6u5yAvuK5PL7AfIOx5zqk1MwUCPuFCfrfVOf3i6WX
	d/DLCFoGgtOluMnc2uQdvYDy11zlg7GCkbdc+mMgMwW5Lhn1pdMa4V2EIBSccJ5NL0v7463XZOJ
	aDpi1FQ39SArv/iO259Gypw3vPqHFDE1E3NBMRVUcZw4YrEm8M2S72BhWA8OAIqMuoxwe0xNPLd
	mi1jdhVmqeGRUPCZS4qqT4qeO7OecsLKnkcrspVBff7bZTNsCDm5ccWXol/RLVqDOyQdlD41p/e
	XT4khtybPYxT6TwnZ8AcuV3VXPiqL+vwu0NAXJXGuzbDBg7d05dCsE8g==
X-Received: by 2002:a53:d950:0:b0:66f:c24c:98bf with SMTP id 956f58d0204a3-671246d16b1mr2103008d50.46.1789177159642;
        Fri, 11 Sep 2026 18:39:19 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125df315fsm1751757d50.9.2026.09.11.18.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 18:39:18 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add support for AS7343 multi-spectral sensor
Date: Fri, 11 Sep 2026 18:39:10 -0700
Message-ID: <20260912013912.51887-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the AMS AS7343 14-channel
multi-spectral sensor.

The sensor has 14 optical channels (11 visible + NIR + clear +
flicker) in total. This initial driver supports reading raw counts
from all 12 spectral channels (11 visible + NIR) via sysfs and basic
power management.

Not yet supported:
- Configurable integration time and gain
- Interrupt support
- Clear (VIS) channel and flicker detection

Patch 1 adds device tree bindings.
Patch 2 adds the driver.

Testing was performed on a Raspberry Pi 4.

Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf

Changes in v4:
  - Fix led-max-microamp property in dt bindings.
  - Use REGCACHE_MAPLE and add volatile table.
  - Use PM_RUNTIME_ACQUIRE* when resuming.

Changes in v3:
  - Fix gpio description and example in dt.
  - Only start measurements after suspend action has been registered.
  - Add a mutex and pm_runtime_resume_and_get before reading measurements.

Changes in v2:
  - Add the LDR, the interrupt pin, and the GPIO pin to the dt bindings.
  - Adjust the default gain to x256 and integration time to 50.1ms as
  recommended by the datasheet.
  - Use read_label instead of .extend
  - Remove all unused scan_index related constants.

Chang Yu (2):
  dt-bindings: iio: light: add as7343
  iio: light: add AS7343 multi-spectral sensor driver

 .../bindings/iio/light/ams,as7343.yaml        |  72 +++
 MAINTAINERS                                   |   7 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/as7343.c                    | 434 ++++++++++++++++++
 5 files changed, 525 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
 create mode 100644 drivers/iio/light/as7343.c

-- 
2.55.0

