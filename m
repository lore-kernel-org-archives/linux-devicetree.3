Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64283B19CA
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023168; cv=none; b=OTSFNOu3533ICU6xiqWJHCl6ym99khvGNGYeA2G5YFsoWwg2hOZOKS+Miw6wnUUiCpD7mHO0LIncun2sFbbtr5qGB86TwTm1rd52au+RzHEqf+ejneZxhKfr54Ifcx50RHIBbmYWWE1rQO5Z4OTxxpg5EhlsQhp3d/MGMrCLvGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023168; c=relaxed/simple;
	bh=snDuUV8OH8pBbLO4QJ3FxHi4k+soHp+N7K3PSeQb2P0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LDPxmw2HTkOmQ3zKnitGmwmT0No/GFvG0/3YI/5/fTD2yg+UaNtqfEfQK/BlpacT/1Gms+31RwVgyZFrxamdt0x4DLLw3QVlvlCi6LhcsBDGyMOemwgrukiEezX1Lkl0XR7LVXxgSKVRInVio0VH7z9EF3ahEHD2+oXVmyzKpE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkxI36Gs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkxI36Gs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso20756885e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023165; x=1781627965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEZz4XYqJIq2oFsihOIDTN5BDVC6/Vtpv4g/jjgK7qE=;
        b=RkxI36GsduiXmo/jftvO3IkyJL+UmLGe+WMjHV+SCCKZwDScQIBAKrgCkJcj4EGK9s
         jta3tWAduXG0vhsoQcuPEsOPnqFJCP/3VXtDjL0KPspAHdMLE4YaZiB3MX7BscCXMhf9
         q9Ki80z3k2RkasCOTxai3PvPBFnwdnUcNvg67vZ6plpaN6/8r3Q24OOC64CfohMOG/px
         Z2thc9vfsGEou5FrqXDzeIngmv9qi8RS569+w4eRXzpubO1+U4pu0SHLQH0QfZssgyBQ
         ToX43lP5NiCe2dgcvgtYPqE3D8C15r3WOsE8xzJoC+RGeqDznHQMLLB8oMuPcLT6z5eW
         kt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023165; x=1781627965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEZz4XYqJIq2oFsihOIDTN5BDVC6/Vtpv4g/jjgK7qE=;
        b=Y/Ew0WBQdH5Dy6J/NLYiTrY1e8Slwdyw2ZPFMW55LvHOoOtWQn0SGPgBnizv3vHA7s
         3hqkany7GhaLizID7yXr1J1GafYTaR41vKLwdpshun9qHxZtmPUO/6j40F0mp1fdsncW
         SbJCcQwjcTjRAJgUCwLDPLNpmiq2kALrLEWxM9NltNuPD4MRo4xVduViDb9InvtKDinQ
         7FbBxAn0tsdi1jKjJ+MhP8W9UfZLHdpJyA8nUentf5fVP6IOx3tLlX1MfsuSBKEzLB7B
         6CXt62GFI2/VyanK/zsDzbLhigY5fgtkcvAUsAWxQNb6UCHs9JvHHA2JNli/aYPMjrq+
         TZKA==
X-Forwarded-Encrypted: i=1; AFNElJ8bjpS8yNgc9cHG1ZeINe2qDM97y0MUByqFrv5QF06UeKsAwX0wKCydjKKjsNnsROl+faNeAk2uhl71@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd68X/7Eqd8MwyWsDjCwdLk5YNXXCgC2IFFVVFQVlZKPlyLC05
	euAFGHOHPy7T3yxAQE11+0t8uBzlNtS8cNIuOZlfdNK3RhDFwOQdcBoB
X-Gm-Gg: Acq92OEE2Grqbs3yDrikGm1HsAnDeQB7lv80RZSgJlbAliugNuUtyl8H72FmZJnM3K+
	ms5+kVSQhShJK5TybazN5Lbs0hb4rTRDsshVz2OY8wohG12II9gN5bOrbW7BEsyydGn1Xq0/XCN
	VdcACMo1L3njT7SrQGeqc9hK/jmMiYP427ypb1Ks4iSha7G1J1EXlp6tkusKL0qWaCL6nZDDrda
	NvQGqmDUyNxrbvuv2FuVUlJZdiT6TiGsEvIVivjvxnhY15otwXzqWgizQogLTmR4bR2WnMG4caU
	QjT4c6T1BV57n3IlfTKiiqr3GOYylOTS5llHjGrNsazyqGjohdJPLKQm+kw+Scegc//RDsjaaXz
	sJWGyV9BT24jQGFHu24EuQD3QdiCCKdFQfMpwaEB1UbkG+YX22IBuuVubvTLhYveHUfmHYtbilG
	XZyOColeYaiOBcrgPntGp2e3k8DHu42xQGuh9LUFGVCEjO
X-Received: by 2002:a05:600c:8285:b0:490:abef:dae6 with SMTP id 5b1f17b1804b1-490c25b09bcmr362197115e9.19.1781023165112;
        Tue, 09 Jun 2026 09:39:25 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d2d11asm440860805e9.1.2026.06.09.09.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:39:24 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v4 0/3] Nuvoton NPCM FIU DTS fixes and binding conversion
Date: Tue,  9 Jun 2026 19:39:16 +0300
Message-Id: <20260609163919.3321228-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series fixes the in-tree NPCM7xx FIU controller nodes so their
resources match what the DTS actually describes, and converts the legacy
Nuvoton NPCM FIU binding to YAML DT schema.

Patch 1 drops the bogus "memory" entry from reg-names on the NPCM7xx FIU
nodes.

Patch 2 drops redundant clock-names from those single-clock FIU
controllers.

Patch 3 renames the schema to nuvoton,npcm750-fiu.yaml, explains why the
direct-mapped flash window is optional, keeps the requested example
ordering, and simplifies reg/reg-names to the ordered minItems form.
=0D
Changes since version 3:
 - Split the DTS cleanup so the reg-names fix stands alone as patch 1.
 - Added review tag to Drop bogus FIU memory reg-names commit.

Changes since version 2:=0D
 - Drop redundant FIU clock-names from the NPCM7xx DTSI together with the=0D
   bogus reg-names cleanup.=0D
 - Rename the schema to nuvoton,npcm750-fiu.yaml and keep reg/reg-names=0D
   immediately after compatible in the example.=0D
 - Explain why the direct-mapped flash window is optional and model=0D
   reg/reg-names as ordered minItems arrays.=0D
 - Drop clock-names from the schema to match the driver and updated DTS.=0D
=0D
Changes since version 1:=0D
 - Drop interrupts property.=0D
 - Drop unused label.=0D
 - Keep reg as the second property, followed by reg-names.=0D

Tomer Maimon (3):
  arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
  arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
  spi: dt-bindings: nuvoton,npcm750-fiu: Convert to DT schema

--=20
2.34.1
