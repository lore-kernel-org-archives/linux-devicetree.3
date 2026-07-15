Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E1323416
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113282; cv=none; b=p4aRfsGN1E3VPYBes4rouwS6tpp0DK7RLq6/aOBfBZjYHGVecjFhGXe46XrGNAgNN36Uqop4luZGN5zoGodocjtDICStLRBzliE+MALj64DekQCwKHXn6ePX/Ob8spgR0JXH7FSp5161NAx99o/Q+jkVNGMgia1O3CglqjmweEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113282; c=relaxed/simple;
	bh=bFCp9CMHCHsdHnu03audrknBr9ukhd5xWk99ialwlfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ida4IIMXuKmg+wW8XR19BVg0AiUBCGmtZqeEFCRI5D4IguCY9T3hoJlUPR/xLywNs+AacSVbuXVSSugVG4E7aLPnludBaCTfR8XPXsDNMhfhygDgwzBN5XDmOgvzJnZjiHwcpM1rRFHhS22RjFMa/QChYlw0IgDIbc2X4G9y5zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxeTQpPb; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxeTQpPb"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-667f0cfb2bfso813269d50.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113280; x=1784718080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ba8rcUXQdsLarFisL+/pK+7ENc59ySEgz7MRaAReypc=;
        b=KxeTQpPb6+ZoXDtmcV0TfbO6FLYSLzGxfYShg/9+E6rxyYTeI0ajVejTvzugHcj+eO
         VzyeTaiAiJC9H4/jv6+dS81zu0rN2HZ6V/1SE4smL6ydnqPimJNJA5jM2PFNo6XP5quC
         wpYEYRmPm7JMiwddox4/JV8zLGQZ7KmnsBAUmGhZpoA/xao75n7LNN/P9j29FUVfo4ke
         GMIY/3A3xxPVmux2AY/9cvgVqOE4R/MxWmDvWLAGKTKCqzWwkC3tkEl4QcszL2HRBpSY
         xx+nQAUdIIa5UWyIbMPSkxkdLY4FycXh7Se0d8ACJYftiIN2psHAEqHwaAG2fjxBehq4
         PEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113280; x=1784718080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ba8rcUXQdsLarFisL+/pK+7ENc59ySEgz7MRaAReypc=;
        b=run/NVnHx0m+Nd2rHgFwH3ZMBPmkgj5izNstlP/516YZBelSgAvERuvJVpMJmiPBpr
         ArKt4Bo+8zEExIPS4rudGwfg7NPOmN5szSsFh6vAnaswHfmhlz9TwIfd6iANOJQPaoAk
         HYhJJDDxUg4Pt2Jf8mi9NifacFL/ay3hR8oFZoydtFGsx/MNgew5QvhVswFiBzpD43hw
         EAvYXLVrqDG/RL1R6um+xdSNruhiZnpX8Ebqe1mH8E//mdxQ/BiFAaFSoA0slwtZudoT
         Kg24HTruqm6QWNJRRd+DyGxj61DOkRD0/SSMNrjSOoYw29MppFkGTheCbAUecrM+gIJ1
         z+Hw==
X-Forwarded-Encrypted: i=1; AHgh+RpG3VuckubW3fsZB3RNVFtrhLuD6XSpUYvQNr7xCCnFGRXSJIEG4yYpN4TOAgLL1duXjg8rdNm2v61N@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy1fDI6dSRyZNSpAy5IFrkTv9N+ovwLLnp0MA8TPPGF0/5lc5I
	QmsjqwgRmb8Ger4MF7fvbRulZlTEXA9dSFgL8Hl+vTQIHkfC0g3Ev8E0
X-Gm-Gg: AfdE7ckcuBuwJ0HpZpzDPHF50xJa7Voc82yExrv5P0ga7zieuJhQNxn1B26LiN5e7An
	ndE4+13hclJLnf29xrXmPQ4Fz3aqmjcVJmuTP4BGVK2uEElUwMs6ks/JU1ApfN6eHqHEzJPJpCd
	sCOL/VQ0SQmRcXlpoddvdavlbvWp5EiTTf4pVfygy2LlANqVOF/pRtvQK+/2mCWTTqQOGrdDlYk
	vy3aHFvrP1d8rYm4xuuiOEEz+u2f2pKhWAjg4K/4vmb9aEBNnslw0etjDmYNkS9tZIHqCT+dbPn
	NGdHJ1gSwH/0EHWStwxuw8IEHMXW5zJ80y/ha3OA27QZQAHQppblEDKlMriYRyC/AQWJAjrEiN2
	NJx1BwBZacZGwBEvUN/W28WKmxc+6pTZByC7idDkzXR/9NU+ZT5Sz8b0zEt8NR+u+4EMJ1+5CZI
	YVmirWNr5OhSzu4dP86REl
X-Received: by 2002:a53:b118:0:b0:667:8b90:2e5a with SMTP id 956f58d0204a3-668078c895bmr3427781d50.102.1784113279355;
        Wed, 15 Jul 2026 04:01:19 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fbd8c5esm59066d50.3.2026.07.15.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:01:18 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/2] nvmem: rockchip-efuse: add RK3399 OTP write support
Date: Wed, 15 Jul 2026 16:31:05 +0530
Message-ID: <20260715110107.409204-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds write (OTP programming) support for the RK3399 eFuse
controller, gated behind an explicit devicetree opt-in property.

eFuse bits are one-time-programmable (OTP): once set, they cannot be
cleared. Enabling write access unconditionally for any board using the
rockchip,rk3399-efuse compatible would be a significant safety risk.
This series therefore:

  1. Adds a new boolean DT property, rockchip,efuse-write-enable, which
     must be explicitly declared in the board's device tree to enable
     OTP programming from userspace.

  2. Implements rockchip_rk3399_efuse_write() using the Array Program
     Mode (A_PGM) as described in the RK3399 TRM section 21. Each bit
     is programmed individually using a software-controlled STROBE
     pulse of 15 us. The SoC-specific callbacks are managed via a new
     struct rockchip_efuse_soc_data, and nvmem_config is moved to the
     probe stack so read_only can be set per-device.

Hardware precondition: The VQPS programming supply (1.8V to 1.98V per
RK3399 TRM) must be present and correctly sequenced during writes. The
driver assumes the board power design guarantees this when the DT
property is present. Future work may add an optional regulator reference
to enforce this in software.

Tested on RK3399 board with rockchip,efuse-write-enable set
in the device tree. Read-back after programming confirmed correct bit
patterns.

Hrushiraj Gandhi (2):
  dt-bindings: nvmem: rockchip-efuse: add rockchip,efuse-write-enable
    property
  nvmem: rockchip-efuse: add write support for RK3399

 .../bindings/nvmem/rockchip-efuse.yaml        |  11 ++
 drivers/nvmem/rockchip-efuse.c                | 152 +++++++++++++++---
 2 files changed, 138 insertions(+), 25 deletions(-)


-- 
2.47.3

