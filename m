Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17123374E5C
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022303; cv=none; b=t6VNinnwUKh8Qk/JQZuaJPD2HLMHXx+LyrnX6QaHnvcEef5YC6uoDKZXtbVKOq6i0SnFkSNDp149a2q3KUQ0muMBxo1k8ir9jBuvvipneG+Z/2kSU0yU5g7UeXcJxBTjcbxqQ3Su9zP8OohtbW1X38AHvugrtU0XIIBS5xL5ZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022303; c=relaxed/simple;
	bh=3YzZMhV2Kq9lLtJSLI346uWkJqVEa6j+MtFmvDNeOqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpopOjdLJbc24+C7Z0Yui96iupOJoEV2ittM77GhWtje1Se0mXLQA5xnCxqhwBxzPwsDZHOOsM8MmbqXVWYdsacejpsK2zBKmVwkIDDbku3QBWQA77e9o/NnprgxsPkCK8pLxQKzJpfqDyCbAOSOD/8UhNUmc0rsqyJp5mA0juI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFf22cuf; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFf22cuf"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8664769db58so49700087b3.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022300; x=1789627100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKnrAbcjeOnk62ec4y5R13bg9Rx0FTj94sh3BmJh88o=;
        b=UFf22cuftVa9BulfSEJ1XmYo3xpz5sXwwzq9qkkDc2Yl4cTHGEg28jcuE8xPYRE2Hd
         Bi0ml8Y8DzEBEyFHN6Hbsp0pJd9ogtkAS9dSnA/M8hAVxtI4t56LxeYtaziYtEqHXLY+
         mXg/YZhs49AYBZGYadacIeMnqsGG7fWjW8qiqkfOtTZpTtsCGiq48qzKu9FesW6hPyb/
         ofvbKZQYgJ1Tgz7vztXXS+peEYnSIVvFJUl49TXiCfFQaE7FSrdByFUaJee0BgDl+cSi
         eSjkmmdGA8Tz7IFziqHJfKtrH7iR2MDV+b8zoy95k1ofkBkoDWGWtP6k3qCU9W7I+ZuN
         kjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022300; x=1789627100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKnrAbcjeOnk62ec4y5R13bg9Rx0FTj94sh3BmJh88o=;
        b=HOmnUodBiSJ2gb0bvFH+rkzfMfYGFUaVG8JzUi9D6qCau8wv6bDIxgHZaGAKqe8ng8
         uqNYhM2kZCK1mp9tBDUudpjNNJConeJgoFQh0XCL7XqqvRvCFdnmYU1HMmeGN5EUvtsp
         Q1i4GSBBzvGPySUvKCQUcNj1yjsC+mwNd2XX7Sm3VoMwFSDN5oFNIcsAet6jDcupnO5V
         wahSoPxkl76VBlEr5a50l9/1V81pr9DWjZJvMcE/T4O3MkHJVqEuQmmVPetvaOQN6Bdb
         +yAdapYZ1Yx+6O9iYX1in9Uvs2w8POvefw8qo1UbkseeQHHT+Z2LBUQmGWsiz8YHe74v
         ul4A==
X-Forwarded-Encrypted: i=1; AKwUvBymeOsDltCdfjH+dd0+YJshhG1vUepWIyNKzCkwYKcAujEXKLf3xMz3+iXiih8eeg4NkDfL3ItHubxG@vger.kernel.org
X-Gm-Message-State: AFuF++lRDFeN9CC0Hm8IFXIvxFRTHV2xGAqSTCoDD5ysyMm3P38/8UoP
	Et1EcT8Y3HPslBUznDVD6XXxVEyt8v9RBIAPsEC7T/LuaUMtIFYwiUqc
X-Gm-Gg: AYBFou3scsq2AcUyJ85cTIVby50IK5jePVjLc3PwM9SVxCPh54NnMfA8XQKDLKtL6Zs
	Kyqv621T5mWFi7L0ua2e8wTgAxM0po9+ciVzL54WR/32D3zwkdb7juyr+oVlpJip5CtcJ/Bv0Fq
	2uPzKxbsQc3nwV48H8sBnjPyD2Gr3iCAq3r44gIl4CP/xKUil778T3/Uuy1ohVVIATc5VpbgL2x
	iS4TAf40kbTX3L94QGtZV1wwSxICg0OfiR6XKUdtrojO5L8cygyX9jcpNiAc0H807SB+mDBfrJy
	AENeSgVU8vNpcPt+IGe2bkOMHkPW3FzM1FA9kjjiJipDkFVFZACVdabAdQDfw2Q4rGQ4LCGFLXM
	h64NkpBuA6Q1ZxyixbBrer/7JJOHv46/C5T6cIDNMdlwotvGZBP4kXuhPtysiwaiHcZndzJrZxr
	cz0Y66051PuRyv+3MeG7V1KwsgZWLmxtS01pwAP2CiavuQbUv4rcC4iQ==
X-Received: by 2002:a05:690c:31a:b0:80d:964f:88fd with SMTP id 00721157ae682-871221a70cbmr173607087b3.5.1789022300655;
        Wed, 09 Sep 2026 23:38:20 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::1e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-873194f76e3sm105440077b3.5.2026.09.09.23.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:38:19 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v3 0/2] Add support for AS7343 multi-spectral sensor
Date: Wed,  9 Sep 2026 23:38:11 -0700
Message-ID: <20260910063813.56419-1-marcus.yu.56@gmail.com>
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

 .../bindings/iio/light/ams,as7343.yaml        |  72 ++++
 MAINTAINERS                                   |   7 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/as7343.c                    | 397 ++++++++++++++++++
 5 files changed, 488 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
 create mode 100644 drivers/iio/light/as7343.c

-- 
2.55.0

