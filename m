Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB8314D34
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791733566; cv=none; b=N93Zjn8/9ReOHHsjyOl2nGygQxCIYk5W2Z/SW6VHBRJJYire7wPyA/M7K086IyTwKPi1PgIO2uoed8N/Wm4ac8xjrtDipcNbVoAkcxHf4PjFQMv3zpk/JYVscS8wGz2RFhYlG17GB6zdjf9Tqxv4ckOjQoFLH8nad2heNN/UMpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791733566; c=relaxed/simple;
	bh=+zlMmsjRtrMhV3IVJmRTns9Jx1vdF+jgPHovcTw5gNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lwa6CWHYNHZGcSlv9CEKaAThCub21rYpOpmECwG3pZcroIqA+zsmaqn40IqTm4xmUMdPI9XI8wvgPj4t1c7/0H3nwZzy9lQ7JHtz4Ovb+dG1Y0WX0mnnnyU5KgvwKZn7XStzR4K7PLwx3RyW0vmlcBWx23eb0egcxbU21lxZHAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibPdHstR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibPdHstR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so14353865e9.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791733562; x=1792338362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWtk7M4DwRl8OFBblism+Ji7aIBUvvGL32g8hLsp5pU=;
        b=ibPdHstRUcSZtHVcALtm8tgkTzUcE4sPv8KO+okOEhbP3wG3ZML/cHNnJNlC0rgZfr
         x3usxwzZzCW1mPjZFIc9nbDegL4iLYjgYa9fe5m2qSK+mGpW7dcyjZp1xWqHcM+Xfzpl
         9LODqgzQjOoll5WN5tKpQMR3yj4eB+O30/yJ3HH6WimAQaPCsALdmy9FNMQ+VIdD+vIh
         /JAmYQhIBJi1hTCEyiryHyWeuEUcMZTCVd69tYQasrFgyBBUqf0dIR+WAqvWHxsGrKRn
         bqoi2vhYSfIiLfD81kr52vbToABXrsC6lzPMLQ341vO25jZEOtV9U3V+WE6Zqbl7hxPp
         s1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791733562; x=1792338362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWtk7M4DwRl8OFBblism+Ji7aIBUvvGL32g8hLsp5pU=;
        b=URmsqw3gaVCFAQBd2olHNz+qJ19obpz8xzIaFMCKcHQJ3TBcDp7fu8XnJHtklrbgZD
         h4VH9TUe5D4v/bJWnY2TxkuyDWlOIzMXJX/GDpVS5/Z4egHtD2KI0sECAA0EeKm2dTzo
         YJ6G0K82I0znyFuk2tGNNzQaIbo8KOP1UvYKv5+esRshyOTDsgF/CmIFLrwziUfjQlwR
         AGpQYKYaaX3MUKVXHtB/ySYtzBPUsEQY1Ynzh9K34fz7Ci5c03BOhsugLvn7ca69CQcn
         Wt09A3fPNzJdrnWJyS1pa0bki1+j+LO1owJM5ZLj4Ee/Hnz7TBqa3Cbb4UOb2i/+72RP
         /5CQ==
X-Forwarded-Encrypted: i=1; AKwUvByFX5DkNteTHXqHDVFVpjoi/dT2N8aG3zFoncDw8aFoasdseRx7PQTf1h2RRMuddQVOX0FLfOH7J3pF@vger.kernel.org
X-Gm-Message-State: AFq9FYJAjrcWj+1qbjqnGC1LdbusKpah/KT/PvbVC4HeZ9WXAyyop/mh
	Ft2CLpPcFCnmYzzrOlLkIlpPejTq3qfd7qvbjzGPqjA+EpxENdbf6nJH
X-Gm-Gg: AYBFou11aTG7Cveg9QTeSXHnDvyL+vtbB6VB9eqn7Is4vjuZyuDadl58d/CT2/35NOq
	nHciav8aWDLQ5p/jQKdrMW1YHMxCAeEWRHFkM02DiUR7bRirKTvixn/qH+S41DP+KY4tbWKnxPI
	34qTFkamhD4ODqJQi+fT/jbx6PzyDRZSHikRpOv0sp51/z4kO5gt203I6DkbB++829Sr/IDmDBX
	OYeHIXPmlk42qHr6LZiqGLH7FAmdUBbqXayuEcUbWwBnuM9x5I3N43Kpl0XDZz/GGVGbr9s6Ubh
	Aku6aTEhxbdplO4l1AGCR3TsjkQM53WeOZD1QpjRPdf41G296pjqQQ5wc0cyTu+6X99fUed+6EZ
	/T2VaifvB6evQJwcABrpwCiqlnIcgK21M4md10y11HhnhqmbuNGgX2NkY+zxgNh7FkPlVzqUdfr
	49QEmdNtgNfkAaA4Hr8xabFAbX6P1wUOq/Ckj+GeyMLwKYs1VIykE8zofMCERKwtpU+9CGwdM8D
	qBOiCbrQQ+/cik0MVQCcNwdlEhO9aJbtuP+RbT8eXdGEG1Z+4xBOROz27wVq5nj6wtE1WTFOxhs
	7Fdkpzs4Q2SWicxVjESIPelrEqJMopLoHu5MKFtO5VWAI+czAQ==
X-Received: by 2002:a05:600c:19ca:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-4a18e4487b5mr137032985e9.1.1791733561853;
        Sun, 11 Oct 2026 08:46:01 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3341:ed52:5c10:2778:2fcf:de1f:bc08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db93d6069sm13996176f8f.0.2026.10.11.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:46:01 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	u.kleine-koenig@baylibre.com,
	Leander Kieweg <kieweg.leander@gmail.com>
Subject: [PATCH v6 0/2] drm: Add DRM driver for GlandaGPU (VHDL soft-IP GPU)
Date: Sun, 11 Oct 2026 17:45:54 +0200
Message-ID: <20261011154556.155831-1-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v6 of the GlandaGPU DRM driver series [1][2][3][4][5]. It
addresses review feedback from Thomas Zimmermann on v5.

GlandaGPU is a small VHDL soft-IP 2D display controller, currently
targeting a Terasic DE10-Standard (Cyclone V SoC). This series has
been tested against a QEMU digital twin and on real hardware.

Hardware/VHDL:   https://github.com/stiangglanda/GlandaGPU
QEMU fork:       https://github.com/stiangglanda/qemu-glandagpu
Userspace tests: https://github.com/stiangglanda/GlandaGPU-userspace-tests

Changes since v5:

driver core:
- Replace the custom glanda_crtc_atomic_flush() with
  drm_crtc_vblank_atomic_flush() (Thomas Zimmermann).

On the QEMU device ID: it's currently a placeholder from the
experimental range, since I haven't submitted the QEMU patch to get
an official one yet. Is that fine to merge as is, with a follow-up
kernel patch once the official ID is assigned?

[1] v1: https://lore.kernel.org/dri-devel/20260714101146.200416-1-kieweg.leander@gmail.com/T/#t
[2] v2: https://lore.kernel.org/dri-devel/20260730173643.256052-1-kieweg.leander@gmail.com/T/#t
[3] v3: https://lore.kernel.org/dri-devel/20260824195418.17707-1-kieweg.leander@gmail.com/T/#t
[4] v4: https://lore.kernel.org/dri-devel/20260913205007.118552-1-kieweg.leander@gmail.com/T/#t
[5] v5: https://lore.kernel.org/dri-devel/20260920193944.110983-1-kieweg.leander@gmail.com/T/#t

Leander Kieweg (2):
  dt-bindings: display: Add GlandaGPU binding
  drm/glanda: Add initial DRM driver for GlandaGPU

 .../bindings/display/kieweg,gpu.yaml          |  56 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  11 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/glandagpu.c              | 634 ++++++++++++++++++
 6 files changed, 710 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml
 create mode 100644 drivers/gpu/drm/tiny/glandagpu.c

-- 
2.43.0

