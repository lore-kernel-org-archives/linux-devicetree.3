Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF8B33A9D6
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994824; cv=none; b=e6M9Yj8Cl26OPmaFIz4CMnmR6JlGaeAk8v59H06Z8R1ZxuJ0qZdW4Rpsr4nsFwi0/oGl/j8logZzPC4y5BhzM0vpSr+nV6YCDoNifNbKBlmBuXNm3B+XyhLuAYtDRzGNkvOLDNnVh3ggXJ95+NnAIlOSogXBxt6MMVvIG6WcD/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994824; c=relaxed/simple;
	bh=kUZGbDq9WpTBtre2GQ5Ziwf59wqQVzYHrIF4ZKPEVNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHQm/mYS13vNALptLiG8ojPg3i5+eQp9lPVFdyotGdiZEgI6Tqvo5JJ4oFVZp8UQHoHt0LzCJxSPuiV4sXjcXEPhbZ+Rfg5JE/TIKNgNqxq6kcnC+wLVEZYEEZbU3SjVhdniryJR7yJVnnW1s+xzXDqCQMgWUi5e0LdUm+XyOEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWGvSdFB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWGvSdFB"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45edc09f51bso1446179f8f.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779994816; x=1780599616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XUlKabLsvPo4urKed/VepR1EIXnYsx8+KH3pjXxVl7c=;
        b=eWGvSdFBuNZRI2aD6q1+JowPFvFKxYYeDt0Qx2cHTsfW5qnwHDQYor0bQfYZ5T8qXS
         a4R+4ykSkPljsB3i+85wPL+R6jT1oLiQfo+663PF9TXC++8CPVOP/LSyPFCctj7cB7dy
         kqO0wODYCoBG+bpXr+5vVnnspDiGa+81P7pTzPgxDyRkQrcowp7CxAlFY2PsXsQgBlbg
         jCXQ6HSsIjnkfbnxqSqQeFcsVbgMM2U/gUKGp6BJBnl48n4bh8AE65M6FMyVh5AEJnoA
         gBO6aZtkx1cd2Z9k13vdvmUBxF06fW4qxRS58K2IY2tKLcaEpfPc6pkL0WWJvE1hRJYf
         bvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994816; x=1780599616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUlKabLsvPo4urKed/VepR1EIXnYsx8+KH3pjXxVl7c=;
        b=dz/BX6fgm0pvYGY8/rAjUglQvJMABOe/Dy6Ba/fzoncIsuNWynvA7/aqKSdoNhQoIi
         OeZ7ygH2lvIkhP+2N/VpVBgwz2fn8DjKHCkYR5vd+HbMgHbtikT5Ktzl9cma0+pvwel/
         1G8zvoBkuHCbgHYdZ0MnhIVYftoZN5d+ushIBuA/4fJwQjmZEmXksZfobRIyzd1NQ8f2
         VQeuyWNte/oD3e3bhZt+qiVoyEjNlXAt8BBK/CQsBbV//pCIHuexiAuhPA1OMSUTxd4g
         SDW6yK4Q/egsVX0od0WVu5PEJ2ME7EjztY8vuMnn8xa+fuC8TsJJAvYEDlA4DDYgB+KI
         TSAA==
X-Forwarded-Encrypted: i=1; AFNElJ+xtFJJ+WJ8ZmpAfFlEoG4UPpGvt6qfyEamaLswmt2lIxu676UUKlfcvFIlan1RsOpvV1kiKuyOxMLu@vger.kernel.org
X-Gm-Message-State: AOJu0YwpLGunpU+62XBIOKk1YF8HSRwPSLH3Nq7lvUGgjnfDjdBFdgzl
	QV7624OZ5LD3ng7mAvD1MWhdv7w6iNTvXgWINrY03ni/AI2NJWKnfRvI
X-Gm-Gg: Acq92OGXsxmL4JGvMOkdnoD50xlggAn17gmd77RI+WDADv4YhVZj9ut5Lu1StP77QmK
	99IUnREOGOZH9NkEF0wHU5BoiL8PzjRam2N3hxeqYinEkvgKkMYLroNr8IdnIrqiK5DcFGiM7/i
	eP1B0EKikKWv0ZDsVSw0TCbNQKiYKID+3Vs/BLINNj7MuR1qaGQkbHyaHVCN2TT/c9Njv1rCvng
	82fcRA2XrXeLL0vLhSIxjPNsBND5cQG7w9hvcjan3fSB7KmOXWHj18NBk1YO6ibhar+hXTTLEXD
	dxQXUyn5jyIT+iYGhUtS2bK8qImtE3NImoHhl2bB/x0mfwlb8UiVhDl/q1J0Q4B4QlBHfzHkHOb
	4yCmhWgKIeqZa5og0qNyve7/5p8H3QuQgDYaL1meR6uLley6PE5JFWYZvHE8YaMxFRsWV3pjnjB
	fRvdFKmnjPOKPqL/KPqETWaqKepmdrItx5GTFsVU+otjzJvFAGZfKmd/eRV2aLcvvTK6FeyJ6Dt
	Od054TMUsqhOMzTNA==
X-Received: by 2002:a05:600d:6447:10b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-490426c5b1emr346262095e9.20.1779994816326;
        Thu, 28 May 2026 12:00:16 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45ee2a12a69sm8625408f8f.16.2026.05.28.12.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:00:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 0/3] clk: add support for Airoha AN7583 clock
Date: Thu, 28 May 2026 20:59:53 +0200
Message-ID: <20260528190000.9164-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (3):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  18 ++
 drivers/clk/clk-en7523.c                      | 239 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  62 +++++
 4 files changed, 320 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.53.0

