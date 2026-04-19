Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0AA378D8B
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776587513; cv=none; b=TJEU0UkvEl9wmeli3zlm5iu4u7gVEiRZ+AadttZkk0vF+jpB0L50NW9HO/kmAZs7jk3qYqQAoVzVwrvDSQRRyIgbTCYvE6C6ITNb8KffPQ1IT09imDwcolgVXn3OZs7IwkeiSyJCj2JArndnV3S3/A2HEnOuP5og7QNKkS/+yOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776587513; c=relaxed/simple;
	bh=gnrgxSiEplSwxVqqHjj5p4vKQYyPxU64rzdSlduHd18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JVhdGUJx1u8kd9252niDo/hNgEglh8RaWymn1MpQNt6KJqqP+lLgOi1pG/q6jQ48LYijr8GiLlh2uYyFvkwRHKYS4ibubzRcCS4rak8xSZTDYmk8YDdEp9pIRrkVEVx2tPmeuOioxApHSmG7XrQuSFK9OW11aYGBP9bEGAeUb+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhAubaXY; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhAubaXY"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e800deae4so16450741fa.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 01:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776587508; x=1777192308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qM81ziYzPfu1Cz3YKli+lVf5D49rHetXa8ChE8aPwFo=;
        b=JhAubaXYXGF2slYp8hEe7kIwTPNWbqhPCqMfK0suS9zSP6oYYluOxuy826Pn43yNMg
         7V+uUUuId+q3szsjE3UVyXX01XjvjdssaW//juHrEiAk9bNGcgC5FrT2ULjmrM2VsylX
         FaIA5uDSPQsed2AioCfbEBgb2K3VjJAj/Ok1qy4qRYwlr/Kt0NUGIVXHeIPZfpll45DG
         SnvkKojC4wVjx6Q3QWIaFsQuZkQPs7hgBnXba7tDoFyXoPThiHD8ihFQzXLCQRPJR/jb
         3F0g61Hn2sXXpLPZ0dUxnWtjmvBCo/nzeJ0ryfD52cDT0ABZo2Kirres/6BMnw7MZVyP
         iVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776587508; x=1777192308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qM81ziYzPfu1Cz3YKli+lVf5D49rHetXa8ChE8aPwFo=;
        b=r11iIZk0c8llUjiWnlZvjKlrmMwBSTcJVCE9KPjqBLBCleex6Fxg2ysv0Fmjfv1oTT
         zWjN74UNKiRowOLGvvIhm2ResDKB/3DftJ+mus7YEOCq7swN93zvr1HM3xbaXGeh2+Dx
         CkMzDttMtGzeeJAdokz017Gc8qH+Y0xpKAGw141EZcqTaD01don81N3Md6Lom1IX33TP
         8S8l258vZL2bReCHHxkEb23wqemlhYFOSQpGBJ32bqf8R4Mzgx2yNlO/g3iRz2GUmmSM
         t8oE9IJtJwd8lP+RlwcoMl/vCGlZjFiUxVutuV+2ahN2TBzEpkQyaRjI596C79f5WsS2
         BYrg==
X-Forwarded-Encrypted: i=1; AFNElJ8stMt0ht5VKr7TFMMWRv9dahHS8QpmQymyDUWpUKZriI2ZqeiC0v3uSDwVJY7W7na0YFYAwPODOY/A@vger.kernel.org
X-Gm-Message-State: AOJu0YyxO9t0NhQzPDjyzkkXqJHHkWSBrju0yUFLfndcuw+2HTf6eNQv
	1IoJJ6v7ZvhbZu2U75Cv8kNzTWojl/tqNG35Yxd0IncWQ60X+dW+1/Yw
X-Gm-Gg: AeBDievCwTyAZNw67AM/9zsuQL4kITKbwozJRuPu1ErbRhuWBtwiDh5R5qHJ/xVWc3M
	h0ERKkf5PsurLfmciWTMs7WYTS2Y1n3Z2ouhrCbq1kIroz5CFKIZRMERnV6JV+PDuzPPcsp0VFm
	89s4YQHvUfw6sEDflvU0nw05onYW02vcIXdQv4zQD0KABkcmqlkKD893uBedhErXcMVdL7w2rY2
	rKh6qCgGFHdh0IoCSc/V4OauSqVHFsvouQ3qmrhm6CAdb9pqmcxGOxxbvyYAgz6ZbCh/u5U5ZAT
	VyU+Xf8JmDYYgkiBK1dXbJ9bc69gU9EPB9/6Gd3Va8CV2tlHee70o10bdTSsr9BLxrmrCNhorl0
	kYFBp89N1Ed4cqpaq0PH9ajwXJ0/sE0Mc1WO/+WhR3vofef1Nsb2uEdzmsTFNQ1G5Blw9v847pC
	5RYRPXeZce0OoQYAOOWuY6ym4JffLAZtAcYQ==
X-Received: by 2002:a05:651c:882:b0:38e:9192:b253 with SMTP id 38308e7fff4ca-38ec7b69c4cmr29093731fa.32.1776587508140;
        Sun, 19 Apr 2026 01:31:48 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm17852101fa.41.2026.04.19.01.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 01:31:47 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Update APDS990x ALS to support device trees
Date: Sun, 19 Apr 2026 11:31:21 +0300
Message-ID: <20260419083125.35572-1-clamor95@gmail.com>
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
Changes in v2:
- dropped all previous patches
- apds990x was documented in tsl2772.yaml
- apds990x support was added to tsl2772.c
- original apds990x driver removed from misc
---

Svyatoslav Ryhel (3):
  dt-bindings: iio: light: Document Avago APDS9900/9901 ALS/Proximity
    sensor
  iio: tsl2772: add support for Avago APDS9900/9901 ALS/Proximity sensor
  misc: Remove old APDS990x driver

 .../bindings/iio/light/tsl2772.yaml           |    2 +
 Documentation/misc-devices/apds990x.rst       |  128 --
 drivers/iio/light/tsl2772.c                   |   16 +
 drivers/misc/Kconfig                          |   10 -
 drivers/misc/Makefile                         |    1 -
 drivers/misc/apds990x.c                       | 1284 -----------------
 include/linux/platform_data/apds990x.h        |   65 -
 7 files changed, 18 insertions(+), 1488 deletions(-)
 delete mode 100644 Documentation/misc-devices/apds990x.rst
 delete mode 100644 drivers/misc/apds990x.c
 delete mode 100644 include/linux/platform_data/apds990x.h

-- 
2.51.0

