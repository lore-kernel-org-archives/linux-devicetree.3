Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25565390212
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998688; cv=none; b=Rg3IMXSFzmTjsz6ovA/MBOJkaKP8mCcuaA3m+L1nyLrPRfqzfuUW6BvNIaXhJj6S9qNajnmXjlr++VkX6gQcj/kWZV+duBjl2j9ooOstAqUa8CgGjFkAnpH8+jJn8Wfo0vBcMN8Ta8lW5p4r8MeGIHutJM+gAqRkmFYvHFicdDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998688; c=relaxed/simple;
	bh=NLJUcKx8SEyu9XZkzQXY0DpeIK9z2Ebxv6qBFZ7vicA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bn5kgkG0AYq0JhIfBbApoThNMBwGTtJFdrrUIMcVRRR5nXrLH1CeqVdJTaW5pZ3v07rJWH6g/2oXMQwyeVu/G40BaLEKnyzC1/7lQI7Ol8YJGOgVrl3kWoRUsHhkz2CxmIvbEhvl/r+569y/VBl05Js0uiBq7P3CMzoU98a7T/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKyFJSzF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKyFJSzF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b3637b90so45667585e9.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998685; x=1781603485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=73q9o/RbMs9HsVClZc0TR5gGHz7oJNAXFjfet/bYLwE=;
        b=kKyFJSzFTU8F5Vd2o1GPuxRExAgkdNX9LRA6CUdMrtWPUyT5N5wNfHWoz9OzmRIFQR
         0EZajOUL8iLww1tVkaeUkbFMhsHvZ/4rfOX6kiCscPNdt/nXK432YBkcojJABW+2k1iE
         t8HWr4CjHXTYaUqZLHsHlB7EJq7U+6IKOS/Mty1qKR3rLN5qvbwXN8xdUxmZRRKsHGuA
         /3EXf8niblYxUwYEsbcfE1whiKJNhLId1tiwlK+9HhIMYxmRqEWD0dpDyQ7XfI+OXNw0
         6us7aOhBLs1WMEhY8NGS1bb6lDdQFttZlGvCBVYioUWBIaKGcaznhYOJNq4s/FlHbSNR
         oafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998685; x=1781603485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73q9o/RbMs9HsVClZc0TR5gGHz7oJNAXFjfet/bYLwE=;
        b=HRmRbhBWOX0B5v3zyeTZvZre53XzM/+thAVbShPE3RWBdoL+9omOBBMhsnrNC7B5lh
         A1bmA34GdFTO7x2Cj0lIey32FwYFydEdODLOrqVG8ujT24EDiF9fWKGA5ES9AHJOxdzE
         pZAvmTvhf7sqRRQ0fJb4PnI3r9oH+At/HeiTOgpwDDWIvLMdagt/KIjwL1VfCrYZL0l+
         Sdj4JbCWX2LGFXio0kHonipOc761suUisV2V1w8teBMYNYb5eNVqqXgRMD/uH5lZ96a8
         hTd22mVPy2gNIRRD1t0m5v6rzE52ENF/7shA7+Ljw7nkE9qnwkkjgagJf3l+BNNp5FP5
         h+Ng==
X-Forwarded-Encrypted: i=1; AFNElJ9XkvAmIbR+UAS3yHxXCEOBxfEaXMDLUSDCKoqPvmULumtlnAkrvq1JdPAXHB5+XDCMkxUU5sySV75u@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4qKjgnGV9kYMFqZ8UJzdQLuR4ulhNUIf1Lx/qTqP5YkLuECkc
	FOO63MNAMLtNgRJrauaNMyydImFT9KbxsDI1xYxkfAlxfxj6MdqoOdBm
X-Gm-Gg: Acq92OF2kvsPTsVYQkr3A9EsAlvk4ZqCAT6Y/jBoN0lt7S8F+yIrVq7PFd/CdQoyElL
	NxjLNefMaLbe8adS8jgd4vgpyH4uhjWthe9mnrLt9ln0NDK9F6ukJrd2aQ21i0E3E+wB5DyTCtJ
	lzxfKnSXrClbyaOYBPkBvfaYuX1HIDHXBOOUwjnJUL2RYBjlSXwOtKHW5gOehT0h0I82gmQ/+oo
	1wK7R39rkDvj0Dw0EaodbUAio/0t3e1pSK2ppGZwL7NlPsfSh57N7g05thLMpDfIEa9qzbAI4gA
	aws4h9OrQ1ZXxKj8oebAf/Id06wxj3pZlrw8vesknqoH2jQSLHH3ux+gRvI9f3WiwYWqrSLBG4E
	uedGiah3oc5cXPAV8N8TKdnJYWm6fJwfDeLvzoYOTjwVQPEjhil2Lr3mmZf1W56J+xoDKxovHJw
	VqaQOgK/7K1NvB0FRePsa0/50UiSmlpi11uWkOHYvEc80WR5xD2SmQK/ObZk4ZB6VqLQbj3ekLj
	uFvcHH59O8WaTq47zBun2SgTt6Cgm+mu2cd3oNgNcwKNCt4YlUjBwGzAg==
X-Received: by 2002:a05:600c:34c3:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-490c2599e11mr350748455e9.7.1780998685051;
        Tue, 09 Jun 2026 02:51:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm471043955e9.15.2026.06.09.02.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:51:24 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v5 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Tue,  9 Jun 2026 11:51:17 +0200
Message-ID: <cover.1780998600.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v4->v5:
 - Fix nodes order

v3->v4:
 - Add snvs nodes

v2->v3:
 - Fixed wrong som eth phy address

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 731 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1214 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

