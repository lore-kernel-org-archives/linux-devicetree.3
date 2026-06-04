Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037413CCA12
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567950; cv=none; b=Q+1d0lLpwPB4Dr+nq2nbCZwoshJCtKp2yOoEMPt5+zD3sDv0+yb4sB9hCLdlPD60+HZOT7DPHG92K7xEAYoZc2U4XL7Td20bq2qd2wBw9by6sm0Iahc2zpb45XTy8dH5Ew4sjS0Twioq0oXiKDQVDgS0CsWuB7sb32gj39KDZTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567950; c=relaxed/simple;
	bh=gvWm8Gfcf0n/b7hTtodI9YkWS/lC33ZfvVYL2iazTWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7C52SMsCGJaBxFFK37K72qlHRs073I+3LenOdlMbIYsQHp4DB1MRqD17TuHiTW/eLx9faPVSsTfd++KoSAYTGRcpX32AuIrMWNSiMaN8JzP5wzWQxLJEPmSIjF7p1b5WD+bWzMMZr1W+w0orbloQ79VTi1gPnM5QRTqoXmdQbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2kNXpOJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2kNXpOJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b9b15af73so439570a91.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 03:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567948; x=1781172748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o8iQzsybxThr4vBjL6O/h0dJfugpHWY8oKYxnchHSCA=;
        b=X2kNXpOJgGNCpj6FIUqJQv4LlUZ+YHuAMq5WGY+PVHtvJCd1qsdnDWuhoH52cH5v7K
         m7OekNK1Fsn6abzBMuGmEWjuwzxtY1LngzR3qbUbzjuZY7dJVYyZJkWFzuiIhaM31nLY
         OdPUJWu4XZ0C4izEXiCnhSXMv49tfEQ2M6u7+fTeBso/Af+39JvoQYlNLbQaKZ/LTBo+
         jFEH1lowXUaUj3rHu591YNtqLejRW9aRdXUD9/zdZ5SRkuVUzXy/iiuCoUcVbycqcbeW
         m/FZXw6QZr4f3h4Jx1jJOmB9ki3v9tvyfew10MWN7YkEuDEBxJx8lByRzGL+ZJsw04Pe
         bpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567948; x=1781172748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8iQzsybxThr4vBjL6O/h0dJfugpHWY8oKYxnchHSCA=;
        b=GQ/NU5LYKHJ+/x/E+GeoiLQCpAvt5sGGQoRxGC5rCbvvOZYWqwW55V25BjA353yf48
         C1wuFPtsIIUtX8rn4fF7h1OBdPQ0bXueW+eJDXTNKHbpoq5sz/rFx+6uQiU9mW2Xc0Mg
         f71j6GkY/9vLhPVoQUZIPlWne60wNTqs0GjleeLLZsS5aFUOSQ5QpOAk233EUYAzXV69
         6dlcj7uLmAPBtQp8eBgjCd4Dsi647BBEOuquAE2Rb03qnvssbEdlHKZ1REbT+AFHpxA7
         BgYCIseFiBzEAlKFwXkPIbnpGEAerPe39OdlEExHg6pACEXlZgBnNV6SUPBmZKBbrUu6
         zdTg==
X-Forwarded-Encrypted: i=1; AFNElJ8DApp0mvtVoQtGSdhXQi0lA1YE0X3Mt5d1+pWWvaW3pnH5YTYGvbITPWVX3YnuVIEviF5hTO43MBAz@vger.kernel.org
X-Gm-Message-State: AOJu0YziDRMDF0rzYKw5OzKjnE28LQ2/UV8ker27zvU0HG9URKYb/FjP
	WDfzzQkMYfWfJP06zlseO+MDj7CVizt/cxOTS79crA5zHvmrOY6rp4i+
X-Gm-Gg: Acq92OEoU4kHLnjTVVT9tPyYy0DiZo3c70vLxbPP8BAniFt7TY0LzBI6ffRYQRISG6t
	d2cPZRMYPGrgenA4lSex2X76LdCFPRLYR8jQUDAqXWmDT0ZFLufQOMT6CcsEdJDYxX+G89/Xw72
	dFqvFDvHuuN965UGml+oja6j7tjq0vJtW9TmQufrqjatXcHPESmvR+DnsZzF33eQHF9yMJ77/Bm
	Bcy7QwnTGqrRZ6kfYO4h86lGzqT3d5KXwB9HotfkfxEiHhlM6TLtKbtQ4RfYJBOekdiPm+VaJ6h
	PF046RLGhl/JkfQyWnJQrhuhFJ9xf352T6u5PwTK8aFpNcpQRNXxfFqXjeNam/8oi4Ynfq7GR+h
	imXiMCpaDLfDAf7YXU1ZOZkRxloFFthGELuAS7HeHMtG3IiwYEppl3y1cPpLMe2NyWzbHx1zhgi
	ubm7TlbbgV7VBeqp34htZXvefw+3a3nOmyEFgITstXfqAYsTEPh6C/zgk77ed6ewUwAx4KjeVQQ
	VAGPwNGZP+r7M9002FzEQM=
X-Received: by 2002:a17:90b:3f90:b0:36b:71e6:3de8 with SMTP id 98e67ed59e1d1-36e34770907mr7588205a91.24.1780567948238;
        Thu, 04 Jun 2026 03:12:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a29cd6sm2483385a91.11.2026.06.04.03.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 03:12:27 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/2] phy: nuvoton: Add MA35D1 USB2 OTG PHY driver
Date: Thu,  4 Jun 2026 18:12:18 +0800
Message-ID: <20260604101220.1092822-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton MA35D1 SoC has two USB 2.0 ports:

  USB0 is an OTG-capable port.  Its physical signals are routed by a
  hardware mux to either a DWC2 gadget controller or the EHCI0/OHCI0
  host controllers, depending on the USB ID pin state.  The DWC2 IP is
  device-only in hardware, so all host-mode operation on USB0 is
  handled by EHCI0/OHCI0.

  USB1 is a dedicated host-only port served by EHCI1/OHCI1.

About this driver:

  - Runs the PHY Power-On Reset sequence, with a guard that skips
    re-initialization if the PHY is already operational.

  - Supports optional resistor calibration trim (nuvoton,rcalcode) and
    over-current detect polarity configuration (nuvoton,oc-active-high).

  - For PHY0 (USB0) only: registers a USB role switch that reads the
    hardware ID pin state from PWRONOTP[16] on every query.

Joey Lu (2):
  dt-bindings: phy: nuvoton: Add MA35D1 USB2 OTG PHY  binding
  phy: nuvoton: Add MA35D1 USB2 OTG PHY driver

 .../phy/nuvoton,ma35d1-usb2-phy-otg.yaml      |  79 ++++++
 drivers/phy/nuvoton/Kconfig                   |  15 +
 drivers/phy/nuvoton/Makefile                  |   1 +
 drivers/phy/nuvoton/phy-ma35d1-otg.c          | 264 ++++++++++++++++++
 4 files changed, 359 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy-otg.yaml
 create mode 100644 drivers/phy/nuvoton/phy-ma35d1-otg.c

-- 
2.43.0

