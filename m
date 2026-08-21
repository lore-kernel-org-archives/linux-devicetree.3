Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E33C490BFA
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323115; cv=none; b=qBEjkesH+8moDUBFvkkxRTPKzi+uy373KKOildB0OKAL8T7l6S6ugb4S2/RuKouULNoWZyOlyWrC5YmUjxxkihcfKvqkB7AhDeORt2Mqm1XgbuCX3E6/jmnMAikuAN4QdTyQqRkU4c/qx2S99KpLXJi84Zrh1M1/fYKgSvtiDmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323115; c=relaxed/simple;
	bh=bXQElwg2kECULXg2Mxmkh+mTILQH0EePq+c9oQ529+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ddPyquj+iVwYsif30SyFz5GK4pVcbyPj95TBR436YWjTonHhANnZPLn/fTd+JEgutvh9otl4nw5ZhHjYrDekLBu+/pLk4LUyFHt0QVHbsGKWuMjawOxBFgq6po9pZTKvZHQa4Hn6HiNgFvMHVHMQmzxgj9/ItlF3udJvCKaTJbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iw7k0iKK; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iw7k0iKK"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81ff017d420so31760257b3.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787323107; x=1787927907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJ7GeXkvxDCAB3BMlDYkkSzT/Txb0FUDU70/A4GPBvY=;
        b=iw7k0iKKdWVnpHUSqClDaEBFjsDlHZsvOqL2KtmQFPXAZHGn/XRrfZ7vxlIcnIIUz9
         F+aTFXcNsv3YQITKU0xE2FRryIXsWw3o82BYoO7W617onXQhMWCMgUfpwRQtqdAL6A1y
         LacJRVqYWTIfjmlw0y2vxvZGlZEog76Wm3OQCXwFhIUpeI1PRaZokRSQyvS+MVCfpDcz
         dTwFloUd9454JYJsrR4fnGySROpxlWrNX1F/bcCGmbg81T0wicRUhJg+63tdRj+q/nqk
         t0bJyGvmDx50kh22RmoSxNRq/0+YTiPybcgZqQO/Wqfmc7GBrksCo46n1vGbS1sHuCxo
         xupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323107; x=1787927907;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJ7GeXkvxDCAB3BMlDYkkSzT/Txb0FUDU70/A4GPBvY=;
        b=H4/010ZXR/n4GFvbRlI+mRF6LdBPGNi1Sq3sMmDVNwG6Ug7okazGi+BsY0dY+vyIbO
         K9+HUtXLgUYxPyXD90aLLchb3s1149GB/+eSqAMgkNTkc6uAF7X+Dk5hCiu0PnfDCzWd
         kn6zqs3B3FnA3qWJ/87R029Jp/WsqizaoGIDH4sVM6T5QfT2HDfscKtYZrzvjOzwMkeJ
         nAj18j4X5N8NvEYj5PQO6Tihw0n7Aof66Y8YE/skF8PpIrnUO0tZsvyI70Fl+rmZoZWn
         7rFni0qQI7eAUFTDd+zB66J47wZCTKz74kw1IIZEbgx8I4VRnUJknJLr+i6WZyODyGzA
         yckw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/yqp1jalP5Ug2hzKL0XEB/8PrhOpsqoLtqM7hGHhumgVc6Inhl6s3be0cBaylPExdTLH9ETniBlZC@vger.kernel.org
X-Gm-Message-State: AFuF++krWompL00D8T+YfvcQ8QaonyfhqBtJO4gBN1Vh6qLLa1uh8N9B
	Vd0HSgiTmHh+bu4irRKLAItHIfrNEFTM+cEtMZG5PyENKBWLCGw2QWc=
X-Gm-Gg: AR+sD118lzUQ2Wv3OEneTy0TkTeEvLi9cVLTzGxrZTZXjaG0Zc8HcbvmmPFc3NjXLx/
	KoZJdokpBFNixmPcIgtY8PcFV+JbThgPA9zGqhNX3canLj5ZUPIZZzkgPRSz0p07M6znPIc/EVT
	Urv0MCKUDGNjZ0vXtrv1AS0IYMMvbNMMa5s6uaW6AJFpS+qGfM14u/H821EjHLjFT5tGF+4hkYw
	GhS7Bl/js7MSSNIThzh6b5JC7FA99ICAjJtp5lYkbxLsFfh0Mj1hS8uyr5oiel2Kth+MKWe+RLf
	cu+4NUP2vPmsdsgGlshX3KASv4+0mp3ZUbl4AeadW+pyUm0R6CI1pXCKlfFjSYRoPgiQot+nTSn
	e7q+L44huiD2TVzVEJIpHi/I0LrF3xjnqEVI6/FoYkGNFvpFtJ2AmfNwEn+daUDGSU01ihfn9YL
	rFE6a8XaZGJRgkRiItZJsWoi/SqgAHgr526dZE6dsC+LnJfrVk0gE2eBE54WGQqoKmGTHCYoyi9
	4pW5qcH/xEriY4IFJwSZpqNtlZXW4Gx8lqHzb81
X-Received: by 2002:a05:690c:399:b0:81e:c500:c6d0 with SMTP id 00721157ae682-8470139a4a6mr60233797b3.0.1787323107244;
        Fri, 21 Aug 2026 07:38:27 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845188b28f2sm41868277b3.38.2026.08.21.07.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:38:26 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 0/3] Add support for CH1115 Controller
Date: Fri, 21 Aug 2026 11:34:15 -0300
Message-ID: <cover.1787321297.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series add support for the CH1115 Controller [1].
It is a monochrome dot matrix OLED controller that supports several
interfaces such as SPI and I2C.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

This is the first driver I write. The work is based on the driver
located at:
- drivers/gpu/drm/sitronix/st7571-i2c.c
- drivers/gpu/drm/sitronix/st7571.c

Tested with Raspberry Pi 3b+.

Changelog:

v2:
- general:
  - patch series based in kernel v7.2
- in dt-bindings:
  - Fixed linter problems
  - Replaced first_page property with offset
- In driver code:
  - Fixed dst_pitch calculation
  - Renamed file from ch1115.c to ch1115-i2c.c
  - Support flip-vertical and flip-horizontal dt properties
  - Fixed several things found by sashiko-ai

v1: [2]

[1] https://datasheet4u.com/download/1576606/CH1115.html
[2] https://lore.kernel.org/all/cover.1786110720.git.nico.antinori.7@gmail.com/

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  89 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/chipwealth/Kconfig            |  16 +
 drivers/gpu/drm/chipwealth/Makefile           |   3 +
 drivers/gpu/drm/chipwealth/ch1115-i2c.c       | 854 ++++++++++++++++++
 8 files changed, 972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/chipwealth/Kconfig
 create mode 100644 drivers/gpu/drm/chipwealth/Makefile
 create mode 100644 drivers/gpu/drm/chipwealth/ch1115-i2c.c

--
2.47.3

