Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C2130BF66
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 16:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826700; cv=none; b=TQqImJ8GBeAxQ1XCBPSddurOsX1ACgQIFaBLH6QTTbd3b3/VzUHiQEBuR6xkjGAyi+RKYmHJE8QkjbEP+MEHkcCHzhR2I4/yxOPvRaUqJspcvkQ7wJBHR6JW466BkCwmAD+Ar18NSEFdlRsvHpNb+cjX/+GdL/W8nCbItRk8V6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826700; c=relaxed/simple;
	bh=y+9xN+1jfnMVYLvwRJZSv0ezZVwL6LabrDEHqq7wFB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xy2DLlpFO8D6Vf9tOVefh56aHAD/OPQh6A29WtQdRCSJi2rhtH7l0kcnZ+evwhwb8Kt+KKsOOFvNO/iJ1ayauvQXnRM7Sh+SZooB1qiI43dEbseZRCGYHz3hWSx375de3l9sybM7Gv5VZwOCfZkFuP9PKGP831fnd2+DXDvVDwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOSh3htg; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOSh3htg"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b93698bb57aso644805066b.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 09:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826696; x=1778431496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+0umxCULiEOpYYoS6pnO55Z9jlD+e8op4Q5ysR57J0=;
        b=nOSh3htgkvFWtAo1UyX+K6p7lw68/sJ5GsEfmX1hG3LVjn0RCus+cl5OAYrH/3qw+r
         veD+WSzp3MXFSrz4/fetBd0Pkqc9G9T2y/sUiYvFnVBvRW693tlwjyzItg426x3mLqYK
         qzgT63kxEK2gL50BFOZ6Yp4xv3p1ih1MGcct/ymTHjH8uDi9DdHx5a9lqFPkLAmSfQXM
         em+CTFzi4owrW1/6Zud8CpWmr9RBLyW5L9hno8vFMtzkRl+I0M7VWJKjk2eRONjMPtS9
         1YLFfEr4T+u7PLDFB8CyZlNbIxOSaRFcuuDAsUG+Vx6eR82VymmtfcQFhCCnByHSNClR
         8WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826696; x=1778431496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+0umxCULiEOpYYoS6pnO55Z9jlD+e8op4Q5ysR57J0=;
        b=AnCcqJrPPSveR7RSJLpDG1g+/YSe5svtEFPypeNa0XJW6xl2I7bGbRXpvF6edPbm4c
         VIJpxspSYims7ZhFsvF+NcyiZEPhxroq4BlxkBQMAPJQEuKfFrt5yQKC5KBUs9o4a5L1
         5z8qmhPPKpCD8JBTxBQTuVoT/GsWIIyKMwec7Zv86Pi2Qq4FcTzkfydld1qXp2d6a1x/
         AAw7bbaxVSjLlintxOI+1x5b0pZwaFAHogMMQr0M6zNdNdom6KsRwjV6Ro1hDQPnqhyG
         kTxyheKA/X6GxWEsbHhyWz8A7ggRgdTXT2svuRh39M0Qig2rA0aAyc0TN4fKySgofp2I
         wrcg==
X-Forwarded-Encrypted: i=1; AFNElJ8VqVV74iJTpUBFNHrZeIyjT3auLXBe90rpiCJfhx2uvdPmnBDbGiZVhT9esce6Wu9nMniPPJ0Rs+Tg@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTlve/gh5904XPkkPTsxYIoVIAmuZQITg3i86yFHiZTJqrb3g
	7V1fPZJFoWS099fxr2gfhQXvBntmD0AkeJWC+lxcBQ2N9cbt9mRaXDvA
X-Gm-Gg: AeBDiesET99LBPPz7SAszXWjgr83WeAe+bOXOK0lhFIsGZdNeojdsNOUALH9a9tRsEk
	gKC0cGQw35PM2KEGGcToPCfCoqpJCHI3vGsa+D8j0Kjdoi6yntef5V4lS0++Q/G2U6qLPch50G9
	7hDbQrNjXH3Am4rugEFSAp8UAjhIO6nuOyBeqkK9o1C88UFF3gseKsLENe2VgrtFUkME2I59IAQ
	erixy/EdPvydU/PuWUwk/hUx4EDj4FOeEgDgqqwbYu8n948q521kggCjVdRvIEwZPbvVt9spHLz
	lZcQc7r1WutpFSjDzc9xHaKHND+ZbEHEEE3kLWt15PQyO/neAT2fBsDC0zZmgtl92/u/4M2/oLh
	M9w/mveN5VsQLm+6e7hu82E1eL0oFOy91Kgzn85ePsEuA9Xr6JYNVbmuerWAmloSSutQRlrdF0n
	BmXXmnyJA9cbBBVVw+c3ku9Us=
X-Received: by 2002:a17:907:3f1e:b0:ba6:79c0:c743 with SMTP id a640c23a62f3a-bbfe08823famr295010266b.11.1777826695583;
        Sun, 03 May 2026 09:44:55 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:44:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v5 0/6] media: lm3560: convert to use OF bindings
Date: Sun,  3 May 2026 19:44:39 +0300
Message-ID: <20260503164445.215540-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

---
Changes in v5:
- schema adjusted to take into account lm3559
- device_for_each_child_node > for_each_available_child_of_node
- lm3559 and lm3560 configuration was diverged with data match
- removed redundant header

Changes in v4:
- fixed current being off by 10 in schema
- label property from schema replaced with modern equivalents
- lm3560_init_device moved before subdev registration
- v4l2_device_unregister_subdev > v4l2_async_unregister_subdev
- added subdevice cleanup if second led registration fails
- added check if "reg" property exists for LED nodes
- added missing fwnode_handle_put if device loop fails
- added bitmap to monitor configured LED id
- added pm_ptr() macro for PM operations pointer

Changes in v3:
- added note regarding lm3559 in the schema commit
- lm3560 power on/off functions converted to be part of PM,
  dropped redundant wrappers

Changes in v2:
- vendor properties swapped with generic LED properties
- added mutex lock usage optimization
- power supply and enable gpio commits squashed into PM
  configuration since they are both required in making
  proper on/off sequence.
---

Svyatoslav Ryhel (6):
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
  media: i2c: lm3560: Fix v4l2 subdev registration
  media: i2c: lm3560: Optimize mutex lock usage
  media: i2c: lm3560: Convert to use OF bindings
  media: i2c: lm3560: Add support for PM features
  media: i2c: lm3560: Add proper support for LM3559

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 163 ++++++++
 drivers/media/i2c/lm3560.c                    | 385 +++++++++++++++---
 include/media/i2c/lm3560.h                    |  84 ----
 3 files changed, 481 insertions(+), 151 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
 delete mode 100644 include/media/i2c/lm3560.h

-- 
2.51.0

