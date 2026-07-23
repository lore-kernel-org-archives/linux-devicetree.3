Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92709437112
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799617; cv=none; b=aoLTGveTJKThKYtgbTy+icLTuNMS4+MpqUKazTsmoanStY8zEne+y7ci1S0m/cM6L0dOnWJch7yWhXL8N3ppMuXKplxKiX4Q8/EgtRjvpt49PXNbiQ0QGHoPKB+yt5YzPtyvqNAYt14y59N71tfGAUET8KHyVHU2YlIS1Zo0ZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799617; c=relaxed/simple;
	bh=0TXrED/ELdAfYxoufpiHLXZ0/sbQ4UCoALRt+wj5+j4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXjBepdG3QuZhxmWG6T6rqK3AvPVnC0DS1taKEFp+XGH0BTchDuElLxzf8HIbFI+LNPpnsD6MPoV4UHhpsc7upl2vJSn7lt0FEAqOlO53HtgTxX/FxC9hvtuSgelrET/JoH6mYKSS+dMbmvJryzy8UYwOSiMcSw5c1Ubv/rPjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=OD0AOI9v; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="OD0AOI9v"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954aff6088so3501205e9.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784799611; x=1785404411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYRmmyX1UMFqTmuZPlCBuUIHyjl4ElamXFYGU9WMWv0=;
        b=OD0AOI9vgcMTIRco76uvRK6/JGPRLsrWQdPivfmGqLpFD3D3uNr4XbW10nBZuH9VmZ
         5PmBUok6USKNjXBrNpwnya80pbOzZg8M0YNCUCwCnLNamEASk0QUKgLQUKR1WO6ObE4L
         HVBDb9U2VTicE8HEOo+dbNZGL83cCA27zKkkHAE5gT33n/6Umed5ofaBJPq8IvymC4qT
         jFPnwEGerBGcqimIJL5NBIff52ewxsWcPtPBN+OShyd9rkdcoT5eupkfYGEF97PmiG9j
         XVFuCAahfdKzx3yQcIkkUjWKGinpFhkbTsy6lg3ZC4Jf6QDSkKYNP8ikeQszrtm8OIXl
         03AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799611; x=1785404411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYRmmyX1UMFqTmuZPlCBuUIHyjl4ElamXFYGU9WMWv0=;
        b=nm+3nQKJVwP2VCcCdyuUohsX3SfgwyO2ID66/ICrTQ6UGfWZad5A2YYNeKh9tMhbpz
         PXjbWW/xNU/MoH+h/7BMsZvl/jZRXEJcm8MwuSsTxjgBXXgGOSeRkbCWbwuJN73N6Yi3
         rqlIdM7npqqwp3hubtN2JFzGT2Dvf2r8/GbT8L2Idc5tekOVt1jqMAIAIWP4i5qlRtoZ
         BrJ3X0/LJslHNpw256daemt1YFSUfNcFGSHzCdmu2KiphGByV6MaldRIGfaA9I4uNutk
         1YocH3zKHpWWACR1gNpficnI45ztjlSlypHhjK9r3Cf/jCZGgDvUfcDnt3d/F9FEWqgk
         l+dw==
X-Forwarded-Encrypted: i=1; AHgh+RrLJb/ajJD0wrHetKNTfmwsygnGa56Vzo7tUFpmcpMl3JhIbDVfFLKL4JA2ibMN6mY+gRhLrq9cMbxi@vger.kernel.org
X-Gm-Message-State: AOJu0YzkDtJDWROtXvI2JpnCgUB9WUwgS/ODyeW1IER2nC/qEB9rOvlz
	iYrDQHlRqzzEeIIaJAcGBFfzXb+DX664nqeIaQmK/NQMxJx63sdaYNom8pipE1vPIX8=
X-Gm-Gg: AR+sD13BZgXG2yMelYp80q2dNWMpqay4+0juBYDUM8R16ttpaRqDdDtf+rSNdbuJw2d
	lEgInIEZZubEpQZ07rLVADHtyYVnQ9L/KE+3GTRBj2qtdnYjVAmzgKhThhwwGe7HC1bWFJS/Pad
	aPp63Af+RUr8qvdZba3J1ZNXZmnhZFBGYYeRik4U5Y8nfxwQ7EXmrRSbt56BDPSS73Qp7ITl+eB
	/53tNHnC1ScOsQMhan6fq+KJWRY1y0F1dK3jm97gGES9GQ5jYd+0YHtPNiXmXVCpa+Lok/5J+m1
	q1XNFrDZzW9pxUIKcHhMf+M66oZ4PdCupS8sVVGPMJmp7EcL3zBOrJ7/o2wM9Qtcvg0k+MNzdQC
	P5aCuuAZrjhhzz+rTGTdOHLMaieUTwJEfTEdplVfa/GGn3c9sOxbJE4qTOgqZF7QH0mqcYn1kV5
	JarOEteAhtML1br5B3f+KmLG/qhg+hh+l1GpCP+PXHTMhzXGUWMss=
X-Received: by 2002:a7b:ca4a:0:b0:493:b56b:c45c with SMTP id 5b1f17b1804b1-49573cf09f4mr14957235e9.30.1784799610756;
        Thu, 23 Jul 2026 02:40:10 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b030a64sm100986245e9.3.2026.07.23.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:10 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v3 0/4] Configure SYR82X regulator modes via device tree
Date: Thu, 23 Jul 2026 11:39:57 +0200
Message-ID: <20260723094001.120264-1-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SYR82X is a regulator that supports two modes of operation:
- Auto-PFM: Allow automatic PFM during light load (default mode)
- Forced PWM

Some boards require to configure forced PWM mode from device tree to keep
the supply ripple within acceptable limits under light load conditions.

SYR82X is a clone of FAN53555 regulator and its configuration is handled by
the fcs,fan53555 driver. All clones of FAN53555 regulator share the same
two mode of operation (Auto-PFM / Forced PWM).

However the implementation in the driver is currently restricted to SYR82X
as it is the only tested hardware. 
---
V1 -> V2:
  - Add missing dt binding property description
  - Naming changes since all clones handled by the fan53555 driver share
    the same two modes
      - dt binding header name changed from silergy,syr82x.h to 
        fcs,fan53555-regulator.h - dt binding header constants changed from
        SYR82X_* to FAN53555_* 
      - fan53555_silergy_map_mode() changed to fan53555_map_mode()
  - More detailed commit descriptions

V2 -> V3:
  - Remove garbage in commit description of first commit and duplicated
    SoB line
 
Victor Krawiec (4):
  regulator: dt-bindings: Add fan53555 allowed modes
  arm64: dts: rk3399-rock-4c-plus: Use device tree bindings constants
    for SYR828 regulator initial mode
  arm64: dts: rockchip: rk3399-hugsun-x99: Update SYR828 regulator
    initial mode to use device tree bindings constants
  regulator: fan53555: Add support for mode operations on Silergy
    devices

 .../bindings/regulator/fcs,fan53555.yaml      |  8 +++++
 .../boot/dts/rockchip/rk3399-hugsun-x99.dts   |  3 +-
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts |  3 +-
 drivers/regulator/fan53555.c                  | 29 ++++++++++++++++++-
 .../regulator/fcs,fan53555-regulator.h        | 20 +++++++++++++
 5 files changed, 60 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/regulator/fcs,fan53555-regulator.h


base-commit: 62b9452f5fc4d007f1ea31cfdbb53a96d91e3c66
-- 
2.43.0

