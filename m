Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C794446F5
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057157; cv=none; b=Pft+wMDz6Qx9AM1g1lBYvpJBDrmI7wW8D8o1H/l8acRuaEBmUtLF4+sW4SvXqrOdhOiQFIaA8p0qRYXpMvfNzD6G48wkaqNWtasSROZy0cVWCM800WJc7kBoNAs1hkhL7RXXhD9R6tYqlqcrjsN3zBQY2ukTKMV69XTL+le9Z2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057157; c=relaxed/simple;
	bh=ahscmd9YT8oibDqCY6Oc6uJhn6xbs2gH9045tEkGePc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAjSQ9rtmdIwMLdFnO0TJDnTUSkfgTulUFApsuPJM6lAuPAbNwp1e+8dNS7acnMv3RxhYVlIzsLzPUokdB2y4e/cXBGlFqkcarRVbnSWpIcJbXaX9U0RMIWmLuYQ4IhFVpR8a+R3whFUwcGx3TnBlgnPEHL1UxhD390tZp2o6hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BMBMcJQC; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BMBMcJQC"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-43cce34c881so744932fac.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057151; x=1784661951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfB31hq6nij2zrbqGroJKSVeDBtuN7UhhDZLTpuuWH4=;
        b=BMBMcJQC9JHScWT/uBYyJwG6PNecmJ9jE7nAxFGcCKHrAv8sY+49/fho/k6mbRcFa9
         U2HQy28CgrTlFJv0Sc4/VTYLgR7gh3SOsmcF2rBlQgBQv9no+Dxb6Otxf6lodA+H2W2c
         7L19EFZLvvPx5d34UEYBifoLdjL+VHgQxRGJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057151; x=1784661951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfB31hq6nij2zrbqGroJKSVeDBtuN7UhhDZLTpuuWH4=;
        b=PISjZhTCwT09GkRJWVCwM8fCPHxherCju8His5rl3/mRfi2jyE6bM6jEg/zNTUm6+A
         wil+gGBxTLgblHBrIkKnlbhvmTRryBxkjpaWCPWIKe6YHpqyITglmcyx37d0YyEx5lje
         kxAIRNrsbmVqaBq6cXb/kTEgTWjgSWSYhXPmI0gp+IjmlFKpYbSg8ZRfx/YjEuSFLJoO
         t5dFyPtj3KSSmYGtdZ3QzpuKCWt05QQjU0/jCjocxqZ0YGwmUdnGgXbHNo2D933Tp8Sb
         KQvhEBZCzbpM2TfuZZG6URibPQlyW+oBO5evsF0z9zh08PEboDbOwXkjrq07daJ4O5Nm
         9Syg==
X-Forwarded-Encrypted: i=1; AFNElJ8Yw2vWUxzuIBXvvJZd9yADTm5rmdo0HXoMivmHVBsx4D6fmy7EGty55scsngn/4xBZNsLPfvo1dqGY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4rN1KtT2kBevAZcnfMqixfGIUfnL9gB/Md5c3mQO1IhRpiRf
	Xjb/MkL4b6sp9ail3GJ9lB3ymey0pQkj4BjUbpHLFqUAt4iuVnHt7Xtsczbzqkp/1A==
X-Gm-Gg: AfdE7cm/aDaF69eOhpJsMA9caTgNXe01DEzRcM/QQuCjSlX9qzR+v/ndUwszAUXlo6D
	VgH6iP2aKsll+H07HLQIszzljoVF97l0f3WYxHJKBLG3xG/FrORfBPT5xWLzVixCF4pErKxAtAk
	S6QZPSl/EPdNEIn1JhWw510R0M0V0hdF1NjTWhFeZyS+Jp7bGW7uKTzOuqsFmsZUQTCFWCXyi6p
	EcDU/wiPCdgi0rYTY0zTpQ8UmCB7FnAUpj+e2ZpX18VZHFHttAt5F0eEEfXWLEHKC1Id2AKAdqz
	rKYAWpojxriJYUsM5fdJqblUhslp/XQpxIIotti2pTG3H4t9NrZ8fHx9DK2JrjAl143cc08upxs
	kuEg8hfdY46P2tfd2KUeGECtPDbYChhxzYxZa+2fEd9FUeij3r28feYKs9NKWu3RPn3IpgoDwFU
	XSgzUbico=
X-Received: by 2002:a05:6870:1793:b0:417:4888:328b with SMTP id 586e51a60fabf-451f13ced10mr7772617fac.20.1784057150898;
        Tue, 14 Jul 2026 12:25:50 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:50 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] pinctrl: Add support for the Rockchip RV1106
Date: Tue, 14 Jul 2026 13:25:28 -0600
Message-ID: <20260714192535.2082729-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds pinctrl support for the Rockchip RV1106 and its
RV1103 package variant, split out from the initial RV1106 enablement
series [1] following feedback to submit per subsystem.

On this SoC each GPIO bank has a dedicated IO control (IOC) register
block, unlike earlier Rockchip designs where the registers of all
banks share a GRF region. Following Jonas's review of v1, each bank
node now references the syscon for its own IOC block through a
rockchip,grf phandle and the driver uses a separate regmap per bank,
so no regmap crosses a block boundary.

This v2 is tested on a Luckfox Pico Mini B (RV1103): pinctrl and the
four GPIO banks probe, and the sdmmc pinctrl state is applied through
the per-bank IOC regmaps, with the SD card working.

The corresponding devicetree changes are part of the main RV1106
series, which goes through the Rockchip tree.

[1] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1122658

Changes in v2:
- Add new patch for the per-bank IOC reference
- Use a separate IOC regmap per bank, taken from the rockchip,grf
  phandle of each bank node and identified by the gpio alias, with
  block-relative register offsets
- Reject drive-strength requests for GPIO0 pins above 6, which have no
  drive-strength registers
- Specify only the first iomux offset for each bank, letting the driver
  calculate the increments

Simon Glass (3):
  dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
  dt-bindings: pinctrl: rockchip: Add RV1106 compatible
  pinctrl: rockchip: Add RV1106 pinctrl support

 .../bindings/gpio/rockchip,gpio-bank.yaml     |   7 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 168 ++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h            |   4 +
 4 files changed, 180 insertions(+)

---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
branch: rv1106b2

-- 
2.43.0

