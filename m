Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1223E92AC
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409609; cv=none; b=EqjNBQP3z6NaJLSeYv/bx3kmqHm0CT7Q4GjbUG8zBpjw2/ot6LG9X/5oxX6VzuKteJTDoehwlFwkU1VJHN+CF6AbByjkgEBozFfbrqeG9Etdgrc5uvtViV2scfrVwxbL66vRzb4Fi4B9fw7HDa13dWcaAmBAo3Q4ZSU0W/nOW3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409609; c=relaxed/simple;
	bh=NAKH44qt2oTNzlxm4XgXcV4lpZYmcZSpQkmfeS751Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UxaWv6qtyLyPjOEJmzwxKlFW6Vy+5rsAtnBP1ImCx7N8M+wxRn86Wdx5WdWwIDgvz9YYsaLOm3l6DcdMUG3OHuvt7xMDGRqwopnxYga0THSE4P7WMNh5TDxq33jIIIM01mwir21RKFBDhpu8k/vyxNZjaauFSIYAYPe85PCphbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HN7rsOjo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HN7rsOjo"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490a7876f8cso25604075e9.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780409607; x=1781014407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxxG3sxLN/Uuk+t7td4zwCVsz76654fGw3zkw6fR8J4=;
        b=HN7rsOjoA2snU1JGa1ONqIco91+Dp6q9f34TtcWhN08GAbNC+UxSJq1lV5lUSW8mmP
         auo7UuEoZyA+ptMPBcHDm7RdFrRYrv/Cjq0Aj6/GYC+iP63zdNRbz5A0H5i0WbpI6mSj
         jzeXwmap5TL7WEfKlOuNUGfFP8PadmCVCvmccy1HxRLnU6PjsUxPJ+pMl6/fok5SuPih
         BZvca3yT5MsxwxPLog8yfvgh3Cox9iiaT26Eo6XCx2MsPpBraKNsydN0Xrbc+i44HtA9
         5NoCR4ks/71bIbiLlkKkh7+QUuYU3anSL600BYJetoRlzi+ZPpOeieaJ2OxGdHLjhs7g
         vwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780409607; x=1781014407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxxG3sxLN/Uuk+t7td4zwCVsz76654fGw3zkw6fR8J4=;
        b=LzwQeDEzljo5uYbq8U9LIdrN+j1K1lz+/2/H/zEuCwDR7L/8pOCGNAeoNtufT9UhHX
         O5p/WZCJ9h4z/YsdOrh0QfO56ryMRHsgkB9j4ygh4LFjFRj2wH+eFtmZKL3L8DSwjOwI
         3OCx8tWzU1AtpNuOCtH1PLBNYyKe4mOjyQ8P0hgihMutMHrJxzyBgaagVvz5GZ4Ap3g2
         4032c+Ri76zTJzivpD4yx9x1BCvnQ1WPg3kFACyAXqO7BDounWCJSkDlTC4WFIj+dFRr
         T07jKBsm8PzMhR0yh+zwZHXw6GQ7FGwdaVkHovbp0QQUpn69pPk3fyoUNZSDIFuuCXM/
         330A==
X-Forwarded-Encrypted: i=1; AFNElJ/fsPsoZAWu3nHsRlg4GkhdWGBYDiBVRaK7ckA2RMeMU2Ni9YL0U8MsArvdJpE8DRxyQjA/q9h76wYH@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6cSOQliQvFoP3TFH42ReYE+XOXLKiWYMNr+/ol2PyDOSFPpg
	4R1tVjNyKox7Xa4PSAIxx12XrhjtQAqw4WxBrYlRcSuJ7fewPccVerlI
X-Gm-Gg: Acq92OHt5oiTdi0aWk+Z5YLYtJzs3oL8/EuwWcb7rAmixM5Uy6EcaUJDiDameo5euiT
	UQwtDN0Ffe3P6EV/Cy5k+R73D4ypacVr/GlO7hOsZV23cJU+RDta6sfXGpnE8eNxIQWkuQlWDG/
	VXA8pBuV4HVhJqqqVBE/UqZ4E855LLoQcGicDACCKcGy0woaS1zSEP0HeChQv7mS9aqhZ4klET4
	RJ98pqLekdDpaPbSV4fvHQTkdYGw1NVnrV/wSgZgVncHXLyQ/HPrUWDemHNVd4Foy94kVqjneUt
	iliRmnnrnGoYdsBkk/t4wHrVAbAttqf/4irDHgEwXsI3BRSyhHCA9/S2vsclX0+PufzcdBLMHvr
	NQvNnsoqGlqScCb4PDOic6YlnI3mRE5AJ/YQ5H4emyR+Xj8CvTFBZhR5KDk78FtajW47dN+1puj
	T1PXr4r3xLE5NE8tZemRY7aIG1s7868s9zDAkd
X-Received: by 2002:a05:600c:8582:b0:48f:d1c0:721e with SMTP id 5b1f17b1804b1-490a2921e1fmr225702915e9.12.1780409606574;
        Tue, 02 Jun 2026 07:13:26 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e0de7bsm60816345e9.3.2026.06.02.07.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:13:25 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: ti: k3-am62p-verdin: Add device tree overlays
Date: Tue,  2 Jun 2026 15:13:10 +0100
Message-ID: <20260602141311.1366818-5-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

This series adds device tree overlays for the Toradex Verdin AM62P,
bringing it in line with the overlay support already present for the
Verdin AM62.

The first patch enables Bridge Tied Load (BTL) mode on the Nuvoton
NAU8822 audio codec present on the Verdin Development Board, combining
the two loudspeaker outputs for higher output power.

The second patch reserves the AM62P MCU_UART0 (Verdin UART_4) for use
by the Cortex-R5F co-processor as its debug UART.

The third patch adds OV5640 CSI camera support on Verdin CSI_1 in two
variants: the current CSI Camera Set 5MP OV5640 with a 27 MHz oscillator
and the legacy CSI Camera Module 5MP OV5640 with a 24 MHz oscillator.

Vitor Soares (3):
  arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
  arm64: dts: ti: k3-am62p-verdin: Reserve UART_4 for Cortex-R5F
  arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras

 arch/arm64/boot/dts/ti/Makefile               | 16 +++++
 .../ti/k3-am62p5-verdin-dev-nau8822-btl.dtso  | 14 ++++
 .../dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso | 17 +++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi  | 72 +++++++++++++++++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtso  | 18 +++++
 .../dts/ti/k3-am62p5-verdin-uart4-mcu.dtso    | 13 ++++
 6 files changed, 150 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso

-- 
2.54.0

