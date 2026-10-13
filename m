Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA152F281
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914988; cv=none; b=snZedRb21Wci2EclN5IbGrOk/6bzXb5ZnX7y5QaZ4y4tovX14DhezJmH71nrjccuyHcxhAQxl9joZM0L2mNRY9pORDykmhEWorVIqr01VkYknyrDRLHCVEJhfnEc0jOkKLBWuavV/fgOz53glkdcuRBvS8r6jhW6Ueuns/sab9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914988; c=relaxed/simple;
	bh=N4LcWhqablCQy7AuG+dp47sWdEyawhDBW56fssZm3h8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZr/ICuSdFcjn3y+ZAwrkaeybhOtVOrgCzwwzzGo5GL+hiAcgXY0ZzysjN9lkNUSbgQp9JGBb8xYIZ+c37H3W9f0Knri8+Hw9+T94AghMnnCfpkpvTH2LICydSidXeuvuwUjzBUMcalg1mEm9jkJSHVZ3hVyoD+WLAZnOL08P7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfM6KVaa; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfM6KVaa"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b0584ad71so1901603f8f.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914985; x=1792519785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Ni5fu/M2p02kW2mgvbfBzY77o7xL0dnmXboaLsv73E=;
        b=XfM6KVaax9ZXLk8pbu4y1pufX2UIYwLl/SutWModRW8s7ada/ZPQHmrw030BVBVHDv
         g2NAYDVHXLkmBRWfVvHoMeikvqRyjOdGHa9Mh04sWQzkEjZ74WJMLcj7EAFxSu80cryL
         VUBEQveztV05RQr+mSVUd/VY4O2Cu2c/1CR6kH/K8vz5WQyDeW7kGW/doZclWPWVRZIY
         G8CUeALb6lQGqWZhtREAOqSdse3sYbdrlGU5qArQB88XaWKaWYugGNrDCnIukE8u6vI/
         BQ3jSnkbLMXR5Aws+iAVnG1dq0+z2ACZOAz1ml1KocYUONziI0nKvhxj5O9wn8IxbKdN
         CMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914985; x=1792519785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Ni5fu/M2p02kW2mgvbfBzY77o7xL0dnmXboaLsv73E=;
        b=QPpoHSfoP8VN6BFCY8LiKKsq6bP7UtauQff8mG5tba4nZHGxbfNzSEf/KtKzj+ZuKt
         Ub26tmTa36re5mcUOlFatQswY2PXC7eznXGb9sd/1nrcu5XFgvjCHdN6JPcRMAcZPyN0
         YudjkOGk/r5n/6e71EbfU2fGvequtev1xIQZJ8NZpnGLBxU9UQCTj+6L0J1RcPegSbsO
         4JWpNoufTcxQrXdR2FaHj91g+LqWm7nytnSpthcwRc+ok/jR5sYGFNJc/CpSktBANopu
         1zmP9MZ0RazwrahM46CQZNA3B6+nzfhigkP9XHjU6dovQEHKyya6BR6t9OQbXgH5Mpfs
         ACmg==
X-Forwarded-Encrypted: i=1; AKwUvByXRiB7wa3JnTznYPy6CzkKlSpnwqttsjlB9ffpDY0EZtVSY/micBLhZm9aQ96XEFDG4G2rKZKmsFNV@vger.kernel.org
X-Gm-Message-State: AFq9FYLPSnunsxTzdO15it/bv5ROwWcXQlPrcbce8FoKBtwNgv080dnf
	gIcU011uzKVnoXM68+BUe+IesdEzruoXQ0LyZKYQGp7vfCxRzYf6xqyKlUY2ZQ==
X-Gm-Gg: AYBFou0lWCodcDdc6SUqvZTEef/VJnf8oOcAV+FYwpFgY4kS94LobAZcwKvmsPUeQRy
	7qjwH8iDov9FfeV8XHFXQjnizh3Re2MeDQHXWO4lGUBKCElKwVTqi/wva9+DXmH8bt0s4iFNVj4
	WM7b3vpLypNqVQtPnmZwMZEEiuZiXci2WrUujXqaBwsvLGzVxhIf8LM/v1hE7QU7mzDwpavQrx2
	H9nY5CXplgL9hiRNvxUB2YSF5TcOVUPmzW9+z3RKyCb5yDgd+IjDUcI7qRDumTL2D+f3ZpL9ksF
	9dyUueYrDr+cPw7+OjO/ivN/IUdJv4zO71xhL/iyakvt0uP9H8ZN7CYXFfOJHz2U448xuYYPu9E
	absNr1pwiz6oHZLKMufZdSTeIDQdmcfpxRNLrME6saggALwMqDnCnzRaOCMohseOkpp5dBYF38y
	paEPUg1RT5G5rCdWZGD1VLkScSj69LhcjHGKWoHhyeRylOIKejawld+WbzfJUfKfNji9or/BMMr
	/Jd+P8RyB8BvDEAbTlIwq65q4fIdw==
X-Received: by 2002:a5d:5545:0:b0:487:27f6:a4e5 with SMTP id ffacd0b85a97d-48dbad4b6d5mr19310156f8f.53.1791914985161;
        Tue, 13 Oct 2026 11:09:45 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] mfd: aat2870: Convert to use OF bindings
Date: Tue, 13 Oct 2026 21:09:29 +0300
Message-ID: <20261013180933.487013-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

---
Changes in v2:
- fixed led-max-microamp scaling
- fixed max_brightness parsing
- fixed regulator init_data and of_node passing
- of_platform_populate > devm_of_platform_populate

Changes in v3:
- removed max-brightness property
- switched from dedicated max_brightness property to dynamically
  calculating brightness steps
- update regulator registration to use mostly core regulator framework
---

Svyatoslav Ryhel (4):
  dt-bindings: mfd: Document Skyworks AAT2870
  mfd: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 120 ++++---------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  77 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 259 insertions(+), 317 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

