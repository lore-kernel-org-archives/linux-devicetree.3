Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538BC369204
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777121692; cv=none; b=e0gmoaqwdwErIplDFqLE1ibM/WW+2eko3JwS6OuHgPotgHN+IWKvVkxNPcNC0S7aoQDAWH6itNW7M/G2ICnlaAOfqw+DQ3Hvh4/jDazIflSXaz62ZhMGj6GygSmda0MA7evT3aSJS+6pd4XDXd1Pfkyk2zcpAI2PYW0O9tKgbZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777121692; c=relaxed/simple;
	bh=Qu18/WAxy7pSgmSjN5nfIZEKo5O/oY2bbdaVU7rwZZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gIMqf5vfVrfMVDIZV0nA9dWi0o/oVWb/KiVZuFubBBXj0r19CWkUjNc9LtDp0JKMLHGUbwjmeIDIIZZv3ICo+tiLhwCIlXH2up4hzXbkfTiv4Um2hz9E/EIMJRmPxcKyKmmomaKv2cPsNsenAKDvAZNZOZnrbt2Dy8FLDm0Ae30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UosU/PAv; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UosU/PAv"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e91b06006so72403451fa.2
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777121689; x=1777726489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9MujvPFIO9IoskE4wX3Cu5o3M/qCzpzUl97wUtWfqQ=;
        b=UosU/PAv0isJRPeZQE2P66vBgoqiyoHtvQ0cC4/vXOMqJKf5WB1g/yrJFUOLqHBy2Y
         IfK69gcCMZBmOgP25yJ4ZRC7Xj8XmI2/av3miOpGz8kLhfTaqm0y7986ApG8F1J9GvFF
         5fssw37jVTo5I8+YNtNTaaxe83abLMHGlt6xedpyYUUd4yhwAtans0RNIgXsoH73LC7K
         mpdlcsElkgWKZSTdwkoz1sr4mkJzpWXNEJB4BuNUMSV4LCwE/WSE+7rP0CZfOyoYBxJe
         IzLr+P7bCHO7dwBV8nF9k6f//bw1vYhs+T8ym2/6jx2oe24M0kmII3KCIBHQfvS0/R21
         I7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777121689; x=1777726489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9MujvPFIO9IoskE4wX3Cu5o3M/qCzpzUl97wUtWfqQ=;
        b=gWRTucNqSO8OCwqhzxq2TAXVrVFXvOLbrizTWuvGSaBj6bRH8KEW3wy/sJvRhzd1Ms
         FqP5mfMTIKR82loH3rPxleKcq/xTSOemS0i7UXyl+f/c7cUp4vqHZnxCMCJGMHpOm7Z+
         5+miQVh6WefrAo15VfU+Q76Ro6t7Vp1VNIYhOiIA01xruExcuFF1db4bcTkaiJk956vI
         beYYT6Huou5xuJaM774xVliDMhLSW8lCJfgJ/p6lETs6TRew845iv2GwOAhMupahNdAv
         l87oy7it2Mzi1tqpecxPnfJR5Y+zP8E+RfxZsWRG2kJOYUDY9BtWNV/iYA719jhOoV03
         F5lQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jXN63gIZBrg3dofF0KgHil2cMjAdKhZ0vh7vN+66VSkESjvuGhvRV1PNoeOAweyUOa4jIAqjJCiTJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwEoII1tu6KOAbLRskAOBmnksOO37nk/VxKjVGhm28g7YQ5Rsmj
	9cCppvFRhGLgbbBZd0urxihEgtnwiG2yOvDXLeZADleuDGPQNbRZih7k
X-Gm-Gg: AeBDietej5dEUGRCAd1FRPcejcvWFPflpwcCseQ/rztJI4KOtdb+1RV9RXqGLVJETXe
	NBbtG00Xc6fi8QzMpeiY4vnGJEa+9EfTBt9Snvr3NFOYHYTyTN6t/ueS8/41Vp3on3cQLlCMG3N
	vi6lGS3Rc/WpKWPwvgssgdjRkCKh2HeLfOlUOjaOYmqYRHNVoCqiXb9wy0sZuJtPsof9rQfjiZZ
	3umptJdAPs4/PAC08dltdIMg4eUfUN7Ai1NHBiyttQzXwjzVq3PbzX0KQr24tjAJ0LNn9zE0Czd
	hDcW4qWJQRfFElT85McYmxUhSR0kHdRREVsylKUNPS6x9v2Kum4tu9VJm9KVkeMYTHqrGwAyhw/
	QJ2ysme8SPD9HOZ6+cUm8oM5K0wIReM72WLDdk9rVQtQUJ3SJhTVjAwKOKm89k8+UUwaRxBFK28
	wQUc+Mf5HkQyOwxJwV2GHslos=
X-Received: by 2002:a05:651c:4188:b0:389:f0d9:398c with SMTP id 38308e7fff4ca-38ec7b42f03mr88438351fa.31.1777121688906;
        Sat, 25 Apr 2026 05:54:48 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f6b20sm58334271fa.18.2026.04.25.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:54:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/3] Update APDS990x ALS to support device trees
Date: Sat, 25 Apr 2026 15:54:26 +0300
Message-ID: <20260425125429.65154-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Avago APDS9900/9901 ALS/Proximity sensor in schema and add its support
to tsl2772 driver.

---
Changes in v3:
- switched from apds990x to apds9900 in the driver
- fixed misc-devices/index.rts
- expanded and adjusted commit descriptions

Changes in v2:
- dropped all previous patches
- apds990x was documented in tsl2772.yaml
- apds990x support was added to tsl2772.c
- original apds990x driver removed from misc
---

Svyatoslav Ryhel (3):
  dt-bindings: iio: light: Document Avago APDS9900/9901 ALS/Proximity
    sensor
  iio: tsl2772: Add support for Avago APDS9900/9901 ALS/Proximity sensor
  misc: Remove old APDS990x driver

 .../bindings/iio/light/tsl2772.yaml           |    2 +
 Documentation/misc-devices/apds990x.rst       |  128 --
 Documentation/misc-devices/index.rst          |    1 -
 drivers/iio/light/tsl2772.c                   |   16 +
 drivers/misc/Kconfig                          |   10 -
 drivers/misc/Makefile                         |    1 -
 drivers/misc/apds990x.c                       | 1284 -----------------
 include/linux/platform_data/apds990x.h        |   65 -
 8 files changed, 18 insertions(+), 1489 deletions(-)
 delete mode 100644 Documentation/misc-devices/apds990x.rst
 delete mode 100644 drivers/misc/apds990x.c
 delete mode 100644 include/linux/platform_data/apds990x.h

-- 
2.51.0

