Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA60E3E317C
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785090128; cv=none; b=NDBvVgTFH6pjHDJ23EwRQcrFvhQi5pHoD+DG2vG34AmoG7xPMt/KXa4BHHaTtDu1ITaoi4PUrFHUgU1cmeBIujCCufOeUnWP5miQIDrt99wU+vUMfHTLmufJUG1icpIvA0k911pK3QcC1PVyKu0ULVeoX68L+kqKWbwcn1HlpA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785090128; c=relaxed/simple;
	bh=e+sPd82/VOehP7llSGZWs7q2sdYUWqswQwnffhXGxyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bx6ehBXSgAto43WlLbK0bAoOBngUzBLqzZEF2JWRL8Jlb4mEKq1qRECIll5KcCEWXiXBAnm5PCmIoDPVqsnU29xD9a9wjD4pG8LismbUWypVfyS1mc5ixyPLpgX64YH2+S0jACjvZAUhBn4LE5BTv5pEiES0eTXKnbg8lQ98kws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZNqtKqJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZNqtKqJ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954d29264cso10018365e9.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 11:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090122; x=1785694922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRAQur8L/fejABMUOGfnExKTMwqijNNgWK29zDYECjE=;
        b=hZNqtKqJpS+vz7OF//CKpcr5URjiZRmKrMVpP7V5z9ig69ZYYvNrS8Pq7qFs1SKAE8
         6bqRop1fI56KtoMRBTXFjt78JRM4GleOeEU7W5CwIhHyQeNAPmNQhihiXunDvf8JLLSs
         YsSHisdIV4iCd+emtC0+xiP38JQ9sKZayzksPvUtgsrzxLUbDZHct2Ocw5bDesja7fty
         MzSgFT7wCr7MYtzjeu7X4wp3Q/UmWymqAXXWTsvoFvgYv3w4YbWfhkP1RhX/onhU9v/p
         3AnjOJ0eC5bOzj09IQ0kFf6F7iyQi4813neKv+VneW32SGNieZq2Qo3XqW7Wq58196X/
         t9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090122; x=1785694922;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wRAQur8L/fejABMUOGfnExKTMwqijNNgWK29zDYECjE=;
        b=iFHlxWvS4G5uqcSfpqt7RQ7VGq0Av96MpTJHVt//eQf4ZghVJV25iFaflGIOHyEyrm
         E+QJx5NzmicGozMSHz5kanxijW1mzrcaMc9ixw78zBCz3716wnTXkYCp75hOoTCYdd0b
         rut5hCqPLuc6pxVvVf3HttyZjDFX9cMkKg4mTq5jhZe5T/zkejwb2Bwm0rkxUGMxMhue
         CfZR+bJ72/7kx3W8OBJxrYRn8gi/jz/ywCQysfgnCr/jKn9e7hZp4xMQCShFAZjK1NZk
         LihSjRdUc49b8Pu3r1JaeshOTPB6G7S9/3SveBkviqjTazpwrvyfupT+pGHLsmnZRo8l
         afBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNBTql2IkrRIFKNQ3kFdXeaZQbWbmMBTim3R1iiZwxcqD+0xL2Imm/16UCWBdJVoYnBsSXN+0ksLUp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw96LBe6Dog7cY6M+XS2/b/8aWjDkzEEUA1xig/cPsMDCOkrVBa
	hMT0WcRs8r48qTw6rjJ61ARz4yFbYSsHfu279FSvPnLcPrjMbB/2O5LI
X-Gm-Gg: AR+sD11CfQkwBy602or7NUfx7pVNqBsLub5SniTKEeZhVqkNQqWlx5y7DlrpSLIWb2G
	+j8njKqSkzUJ0Iw6HMxGYhGiXvt9/D5vmBIr2iWk8g2+MJUHm5gCNfM1XrlTfy+HAQTnsgZCdVG
	0lzuCplMcbSuGLYr9Gjt6vuUFOlyfupI52WFecQCBN6jcBlRu8OJnc70DG/QFmoMistOgK6zx/F
	AGbsDvVUddgcQIaOFkCQLVreAjD4lqKQfH+hcpfmaHNoet6OKAWV6SLrRL7Du1ix4pBkLj2J7uc
	GPwBaG1vW/+FY23EO/9klkrDTSqerM72KH9HIK87EOPqbEvui5+3mDVNbHkOXbpIiB+AUwzJE4c
	NAJW8tF4FMEbgGv8RUkzYjUuOA5CJvQuiNwybtU4OVDtqr4NRxqXA+HmsP+e31VP5Dr8Xlt2lD4
	gM0SutgH3pmkiZGn8SUsZ87LX2bIHkXl2XsU6yVg==
X-Received: by 2002:a05:600c:8b75:b0:495:4d00:2fda with SMTP id 5b1f17b1804b1-496b56e6efemr88359835e9.2.1785090121922;
        Sun, 26 Jul 2026 11:22:01 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:01 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 20:21:55 +0200
Message-ID: <20260726182158.249449-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
Reply-To: robazza.alberto@proton.me
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alberto Robazza <robazza.alberto@proton.me>

The Orbbec Zora P1 is a vision development board based on the Amlogic
A311D (Meson G12B) SoC, with 2/4 GiB LPDDR4, an Ampak AP6256 combo
module (Broadcom BCM43456 Wi-Fi over SDIO and BCM4345C5 Bluetooth over
UART_A), HDMI output and Gigabit Ethernet.

According to specifications and how it advertise itself in the original
dts configuration, the board is a revised version of the ODROID-N2 with
WiFi/BT and Amlogic A311D instead of the original S922X, so the device
tree builds on meson-g12b-a311d.dtsi and meson-g12b-odroid-n2.dtsi
(mirroring meson-g12b-odroid-n2-plus.dts), extended with the
board-specific GPIO wiring for the AP6256 managing, the status led is
green instead of the original blue of the N2 and polarity is inverted.

This series consists of:
  Patch 1: add the "orbbec" vendor prefix.
  Patch 2: document the "orbbec,zora-p1" board compatible.
  Patch 3: add the meson-g12b-zora-p1.dts board file and Makefile entry.

The DTW was built, validated against the amlogic.yaml binding
(DT_SCHEMA_FILES), and the resulting DTB was boot-tested on the board.

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0

