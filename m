Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C233DB64A
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670369; cv=none; b=rIwhRlZHgGutByFtL9QP1Et07WEspCCVU0JIk4m6PmUjkNa/w/L3akV3KzJZmSEjHlarzdOZjNBJ3zDnpjzdt/iDeqoFxvjtR7g+wMlfH1MJOXfIgYb3K8WU1nyTYhcXEWZANetBB1JPX21X/XrNNsDdeH4iHaqqxd0njsvr0s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670369; c=relaxed/simple;
	bh=aOfRpLqaJPAJe/Il7ITGiReMsqW93goifJWQbOYSJng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxRdYG5ZrFjSVV+pUJzf8x7ElpAuiwWILarXnopI9r6KfhyudrmYbcDAIJ9q+xEHUN1bY5+Gv0Abtc8QusRWiMeDM1BjtkGleBOIkRNIilgb+itbmTkkAfjPSnpdPG6cVof6/KgBCleQJlSbfMdKPiR9CnD69sgOPmB6W/XJcpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5DPe/eh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5DPe/eh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cad85b7b5aso788275ad.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 00:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670368; x=1784275168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LGhozyiYsWCt50HZ2wp+cS9ho+JbwJYDGpb0yWaMYc=;
        b=Q5DPe/ehyOdROzixfp8ORhIVqlCrkBFkrthfG+7IBQpXFiT8vUJspTOhsISiou1GZ6
         xVa+c9t52P2wM3Nye4wpZlxpjuxAev4CA0i+8XQF2wwfo+WgOI+3bTpm62NqIos7df6x
         lnEjYfjjlWXChPCQglNySWWfik3rBuljrObKJCiGd6mvW12vIV8xvkVPn7lGQBU9kJkE
         AXpi8YDSMDyML9bBbtGtDokt0lsWP82CR7N90jX6VbvDj3fztEJ9SLjH8yeQbJG/e0LA
         RoAqP2gVJYBfZkkJG91uYOmmitNbHMjrM1C0m+GDi6BugBmM//Ki1OrbqIzEyPghrz//
         IxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670368; x=1784275168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LGhozyiYsWCt50HZ2wp+cS9ho+JbwJYDGpb0yWaMYc=;
        b=RGQYsOZxD6N5mP0FFlHxL6HwrHAfeK8DcJXcL6lAGNn/mIfVjecUCIIIMnEEzQWMI7
         qr48xm+rwqYLTPbMaynLjgDcBL/so9nlHcZDzLtTVBgztjHAtlnlTLXbpG5mph6dGP7L
         4Mq0fyxJjN2RKOsRwDc9gEFhHZ4c6Xko0JoPvygOyzxSagw79+23hfcHp/1vXV92UZdj
         Eyae5+iUvVvbLyQZEq6qOkwOLyO59aDQ+h6gnyXTjehCfW3k2+YMnHUkCxOBQj7lwhUa
         VncVpHkNhcamj+axty6kws/SjRaBdUGYFiC0Wye6VRtjOSg6ReUUCjumkqTcoNAMDdn1
         7Q5g==
X-Forwarded-Encrypted: i=1; AHgh+RpkeCbVoy8ZvMl4loo9y8/pgNFCFgFwSNoBAMCzfpBuwbbCZfPSh8+FxVuuAapITL7jXuRVPdgKddQd@vger.kernel.org
X-Gm-Message-State: AOJu0YwEdgt/yi0djBehZ7u4vFDqHtJ/RJTHA8n3yQrO1tx343AlMNuO
	gMzUr34DolISuqB5LGdBrsJuGGha8fUFoiza6eef3y5ud7g5+2tM3obD
X-Gm-Gg: AfdE7cnsvLbIVbpJLd9sMYKuchZT+2hvrjKhyaLlzV/GWA9zN8fZAYDCedFZBe5QVCH
	bVpqdmyOKx3D4msz1J4CScW03OSomh31cXdigwLhBw5R0uUI+r6J5mlMt7nUvk8z1JUfKAjZxDX
	T69SPF1VTX8uolz3Szby0ifoU+GhS4XTvHsNoJxLclp4LRXRGBvd9kBuy9OONZkE0eaA8brzFrL
	q+g34/IBzawwS44EHxAyeMAvZi9Gw0L311uk+2nHpW3N7m2XyoiqHS/edtGkUYsich4uHHs6qPC
	ZtVfXpSOA2NazJgMABVQtcuTwNytM4NwVWrH27qJr8nAhxQ2/5TNI4gcDf36RMtY1SNRRXbe7gV
	rCG1X02nmZvy7GHjR5FY6R6Vki/HNtU3cMjzGRTMZCw7r9YNXywIL3ewVvQ2LNwmmc03NlMWkBB
	pFYYCWN2zZNyh3F14=
X-Received: by 2002:a05:6a20:12d2:b0:3bf:a543:e7da with SMTP id adf61e73a8af0-3c0bce50f42mr9139492637.3.1783670367797;
        Fri, 10 Jul 2026 00:59:27 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:27 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 0/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Fri, 10 Jul 2026 15:59:14 +0800
Message-ID: <20260710075917.159969-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Duo 256M is a small form factor development board based on
the Sophgo SG2002 SoC.

This series adds the board binding, the PWR_GPIO controller node for
the CV180x/CV181x family, and the board device tree with support for
the UART console, SD/MMC, USB host and the onboard blue status LED.

Tested on actual Milk-V Duo 256M hardware: verified boot to shell,
SD card rootfs mount, USB host (root hub detected) and the heartbeat
LED, both via the default heartbeat trigger and manual sysfs control.

Changes since v2:
- Add the PWR_GPIO (porte) controller node to cv180x.dtsi as a new
  patch, instead of dropping the LED node (suggested by Inochi Amaoto)
- Restore the gpio-leds node for the onboard blue status LED
- Add my copyright to the new board dts
- Drop the unrelated Makefile trailing-newline change

Changes since v1:
- Removed the leds node because &porte was not supported in
  cv180x.dtsi (reworked in v3, see above)
- Retained the &usb node because it is already defined in cv180x.dtsi
- Cleaned up the trailing blank line in the Makefile

Chen-Yu Yeh (3):
  dt-bindings: soc: sophgo: add Milk-V Duo 256M board
  riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
  riscv: dts: sophgo: Add Milk-V Duo 256M board support

 .../bindings/soc/sophgo/sophgo.yaml           |   4 +
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  18 +++
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 121 ++++++++++++++++++
 4 files changed, 144 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts


base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
-- 
2.43.0

