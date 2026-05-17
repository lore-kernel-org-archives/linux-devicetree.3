Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBF280325
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003813; cv=none; b=DlHgFBJQFRWhUyUFtxom6OTuk871aMn2ri28LpbbkxoSc2q6/Ny9YJKwD/5JpRAo9f26M6FUoY63cLq5HutRcVjgNaGa8BaIZO8128sCasgxZxBMPo+Sy5F3h+WSZoT3y4gYT4Rnoa9c9UQRQEtO3uq68j8uMoxHtJ4BCNjyH78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003813; c=relaxed/simple;
	bh=Y+Ex24d/as2CHkwX1uEjCtuYJgz4R8M4AkquqzZdRGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RR4qNvHeKMGe25q5JxovTZmgSOdrVxu2rS5pfpbSSlCOqDjjEpzYEMYripgZPBMImIWN0GrxWp/r+60kO3EzJBaw76EDFWx4s0cNnfNwiJbyr8JcPnDULl9vRxyHfv1636fV6A3U4OgK7Q9dveJWOaGW2Afe4uE7Y9nQ48/WHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejglwb88; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejglwb88"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-448528f4e69so616024f8f.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 00:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779003811; x=1779608611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIN4QPzSpV0aaXXOpKphRYVC2gTnp619k6g01a8YFLQ=;
        b=ejglwb88a7xr+VNBcXRowPG20Fb4Ffj/yk9XWlHVovJLEvHQb2KNJh8mqIuBs5ZkA3
         MXbCNva6vdDuvZKqNbQ6CeWdbTWCQUbtRF93XyKlCKaTVvuhsZig468MInSZxUKnsuJk
         4hmEiCTmAOIREGGzoLyJye8ZH7Nv0/kDGEWQ3xijEJ5+IM7bC6uAi1ReXE2jen4R1AVg
         W9R+ukHqmBVixMrZkq5fmohIsW/gRWZFVdjm3jhLLEtUz/ASn0aHUiNpo8mlUzMNnBZx
         7XBgDCLQoR62JnYpvUG5nDFbtJf46W9AVqQfOQEXT+ZhBiL6akdYCjgCYlFSOV52Loh6
         rkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779003811; x=1779608611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIN4QPzSpV0aaXXOpKphRYVC2gTnp619k6g01a8YFLQ=;
        b=qhDYJbNK8REFbYg/zP7jxgTH66sIHWODHi5WWYtgeUQqruMXubDG9NTr3AJwVnFsHW
         YBBMu7f+SJk3cdkzxIZXx5fS0ujwxRjEusVT302ne9mwGRAMfGbpJI9pXhcYOZvrYafx
         5Samr3PWtYiXIbXgXTmxGaWKGIf3lmVmKRLhjSms8gDjFyq52PgR/59hH7Aix7FiLyLx
         EIH+DjYc9O+If+UDTFTP5JX3H9WotWa0hFAA2jta+Ufxnrk33fI6AGyxUguEX4iXEcc5
         m/PAgtdh+9b6t5cNv18aYncI0SlIKHPq5z8agSfXrfyjrBMq9vKKndMuNrCu5VVgzibG
         My3g==
X-Forwarded-Encrypted: i=1; AFNElJ/4uSbYwJyJn0iIdPCYLi+dELIxuZTBWc0llZq4yJdWuzaBO4gQQar133vvPABCo2AbPfFkOeCEtryr@vger.kernel.org
X-Gm-Message-State: AOJu0YxdjrybhbvRXVWKPrYjo88SnrkvYJJMLti2olXgGIgx29pedAz+
	bJ7Qki+bQUgr+hRKKllknoouZ0RALz97xauI8/c7Jr62ClfFZzvvft3J
X-Gm-Gg: Acq92OFpR+qab0iWHlZ+bI7mH0leY/BXl7vPgM1kTcByGk01A1zKSMWFPJqwqnYb5sL
	4Y0WyETLysWFRlNm1RtsYQBKRUQnROwdU5I3RnsvBnT9A1st1+BdXAlVZfTaGVxQlPawD8ZK1c3
	Um/+GBiK/2FfsQDcjfeSywqQMZJz73J2lL8nJS6Tp0+SwbItru7aSFK+hmtuFhduhDGF18tR8iS
	b1PqNuuK5zcWbT4BwfsON3MwAxYD4buqaIqlT15EekcbzM1Z/v048OtAqYb0gHdaDAiBarwVOpB
	2pQHOD5vxcssYixNjE5nnXU5ggkturZK+8jPi9tSoDKK2nHE5ilnH35sXoniFaSpAnI+PR0A7ay
	LPIOa9OUCthwKiJEjNC1y8nlyLWdyF9dGSRdXHZYrldyv8M6SIxyA5HWeQt2/fXB3EMsux7JB/N
	ASOcwUC8Sbeagt
X-Received: by 2002:a05:6000:2302:b0:44f:c886:89b4 with SMTP id ffacd0b85a97d-45e5c589d83mr15861004f8f.15.1779003810524;
        Sun, 17 May 2026 00:43:30 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm27512864f8f.30.2026.05.17.00.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 00:43:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v1 0/6] mfd: lm3533: convert to OF bindings, improve support
Date: Sun, 17 May 2026 10:43:00 +0300
Message-ID: <20260517074306.30937-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert LM3533 to OF bindings, add missing VIN supply, add support for
setting mapping mode and LED sources based on device tree. 

Svyatoslav Ryhel (6):
  dt-bindings: leds: Document TI LM3533 LED controller
  mfd: lm3533: Convert to use OF bindings
  mfd: lm3533: Add support for VIN power supply
  mfd: lm3533: set DMA mask
  video: backlight: lm3533_bl: Set initial mapping mode from DT
  video: leds: backlight: lm3533: Support getting LED sources from DT

 .../leds/backlight/ti,lm3533-backlight.yaml   |  68 +++++
 .../bindings/leds/ti,lm3533-leds.yaml         |  66 ++++
 .../devicetree/bindings/leds/ti,lm3533.yaml   | 190 ++++++++++++
 drivers/iio/light/lm3533-als.c                | 123 +++-----
 drivers/leds/leds-lm3533.c                    | 117 ++++++--
 drivers/mfd/lm3533-core.c                     | 281 +++++++-----------
 drivers/video/backlight/lm3533_bl.c           | 123 ++++++--
 include/linux/mfd/lm3533.h                    |  52 +---
 8 files changed, 660 insertions(+), 360 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml

-- 
2.51.0

