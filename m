Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC4DF59
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464456; cv=none; b=bSKPawESZt/WurPC5G/gdEy1ElP/axfp6Ern5DiKpdvgQqU0OWQVM+kZL6elZHWBjSbz+HQhBW/ZotBPWtDDk8QoM/TKarIYrhfhgUIbP4bbkhWgRZJBsNcnvW4Cm/1X+FRakQ+J5ynJQantTp5rP2eBw4bYiORatJ9nDzafxo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464456; c=relaxed/simple;
	bh=o79OwXp+nB2WI8QPW9U8EHinPAtqGbntaWN2rWZ7iQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLbUQpxiNCC95CtyA7efm78G5oEaWe41vtdBQM1VvmfwR55ZjyPyOsfDHPFkhRUVK57zPltGL72RsK6DKt1NvUEcZg/vLR5aK1nOi/n0BQ/SSvYpDcUTY8A67yJpm5R8mY8YWxbrQqBPKGQac0cGR3sXQCvgHt6/auLsxkoSfzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2gfNVir; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2gfNVir"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48896199cbaso30709235e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464453; x=1776069253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rH3pd/6i05BMy2p7WNOEU7tz8bhUgdoOEFSJvfQO1lg=;
        b=P2gfNVirZSH5mit8gwByLiWXZ6jZ2XJPECf2jH/AAZi9UvMztf0LirrwjDNNeHyCvL
         NZWzohGeB9x4P9dCvZ83HIaoseRIUw0qqVdyjfC8hWG8TvasbRImIcrtI+LS4Jxd7A0N
         rHzpPmap9TjOv5UapAgt7ry+5Y9/tBl+ewBVvctg+2rWO2YTJqR3kR69ffH7c6pEBjGe
         LcZYr0q8LYdsAwFF1PoH7oCbcIyquQooNcVxH57bTQlQ/QRJQV65R65MOOur5mpRlYDA
         1ioHg5tPiSF/prp6jz+odviqWQsKrEfADabyW9x8faHF4twJHyS5mdXpm9ANyerVmS8z
         2Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464453; x=1776069253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rH3pd/6i05BMy2p7WNOEU7tz8bhUgdoOEFSJvfQO1lg=;
        b=PyC0QhE7v8nKchvAohjijSLFdvcI7KadWGZ48Rt3RpAPuqUqgTimi0fdN5V6yvMZ0r
         Wk1Qs7Oghl3+uBjrDXm5XUxxAtv0Sg+FoDh3GnwFzxrvv/nsFjFfhHAYjsWXCjuXHZ8m
         Ja3SnM8UKzlP8LDIurBUlqRVhgItMNCT6o8qGJ2ub+vZtXsxOr6Xq+riCtIhppKminQb
         qCKiBC/5XQoKYI3jrBiqu7cQfhba6FVfNEiub9X67CcSU28R0e3r85SqveNeXEb++F9V
         wQ2BZ1rAlrli285KRjydZ4AfetcYCv0AJR/L43e0sXPlnE7jWSkrKJkP/SIo+fa0GWHr
         vMpQ==
X-Gm-Message-State: AOJu0Yx91xEgu6vQsFwYRM0O2nQjPZ+/bqXTddxqgnCB26m277mDFa3K
	HRrgVNvMBLQwJ0wmA11yLr+Jm34mLfiXhVlzOrEwVJBKx3UNowAZnqpV
X-Gm-Gg: AeBDievlyzst/45n6SSRXjPtFSCZXCz0FrzpAV/7o1uJ2IV/EiPlOHWlaNqKFNZJPV9
	j6XjgFiGssbWvPG/Wyi0HBKoEerMtw4DlV9kpT4sfWoEjfll0qnAX8FRhSTardo0GV4CgsSyz4T
	XUc+Llcd+NIA0EU6MnKp9IGKHLmgbL3Duys8wG/zJ4OGmXF+Ys4OIc2BWoWNarOUoje6jfnHf8Y
	KOb3zLadp/kbOosOMkA1ItG5N+CJuo4NzNWBFaCimf+6BA6j5+EnZKwXeQDBlDMoM8En7zJtoRJ
	fZ5woAii7OLcwVUhyFVDx9Q9JWR4GzlclmE6R4IFANlBVz+HgXTLIpf+TKpIBBVXGyWjKWHX2iV
	IIcAjP535+PAj1hqXJUmmv4w19JA02vUn7TIFliolWDOKkvH0xgjkW4iDKzLTOzqgDQMAjDiG+9
	p2ZGNX9BZEmYrm
X-Received: by 2002:a05:600c:46d5:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-488995d5fa9mr175334895e9.0.1775464452686;
        Mon, 06 Apr 2026 01:34:12 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/9] ARM: tegra: complete a few Tegra30 device trees
Date: Mon,  6 Apr 2026 11:33:55 +0300
Message-ID: <20260406083404.31359-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure camera support for ASUS Transformers, Google Nexus 7 and
LG X3 devices. Fix RTC on LG X3 devices. Lower throttling temperature
for LG P880. Add panel support for TF600T.

Ion Agorria (1):
  ARM: tegra: p880: Lower CPU thermal limit

Svyatoslav Ryhel (8):
  ARM: tegra: lg-x3: Complete video device graph
  ARM: tegra: lg-x3: Set PMIC's RTC address
  ARM: tegra: grouper: Add support for front camera
  ARM: tegra: transformer: Add support for front camera
  ARM: tegra: transformers: Add connector node for common trees
  ARM: tegra: tf600t: Configure panel
  ARM: tegra: tf600t: Drop backlight regulator
  ARM: tegra: tf600t: Invert accelerometer calibration matrix

 .../tegra20-asus-transformer-common.dtsi      |  22 ++-
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 128 ++++++++++++++
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |   4 +-
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |   4 +-
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   |  71 ++++++--
 .../tegra30-asus-transformer-common.dtsi      | 159 +++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts  |  41 +++++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts  |  46 +++++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi   | 157 +++++++++++++++--
 9 files changed, 595 insertions(+), 37 deletions(-)

-- 
2.51.0

