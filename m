Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF2F3CD8CC
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132364; cv=none; b=TVKn6dK0jaZnmehQ4kIqgBvdJHjoIeaenROYRtjJbCVhJIje7YIn/T3CuKMkbq6pvSJ7Fm9wV5Ljbnq7p2JDOpzdTgsFcm2e6YPEjC7d5mBapQNm4y7I8dM518aDbwC7zPNvGMzkbqe4CcAYymmrL8kVnmznkmF1DVPnBsj9/IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132364; c=relaxed/simple;
	bh=l5oEal4VAJKhbsdVKhFkkLQTTN9gxEOa+mODKSDfhF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=frR20OoN7mUK2cRfpfm4LI9/8T0DD3HPs9eojwk6//p5Wh5vRJX94JwWR5p/Nt4tCtJAy5zdw1cHkX4yum8ooS3M2i4Ksd05P5qiAjhcfKb79QqCqCUwDZAovsYS/TXQ6YYZSnOGdA1KnmXhZLFefd20udD1n18sQgIOzHnGlW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqUa020L; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqUa020L"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so7125565e9.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 09:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132361; x=1791737161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=SqUa020LlTv/IOjOOlRowv3Dq1/GT0bqbP2z5vXTkA1mM8eNLr4fyf6eH4iqFGKHv8
         NMzNuWfUWovsXHO97I55MiY6Z1++qV34AwBuxvqqFBGT8exvhryGYt9cVR7vv6vbOP9b
         R1Y1R+3q857f+KV9xli+/dHuqG+swcyZPsOox2ah6vjmcM1RQ5PHOsZvl7A4HzOTM1qA
         +6aaj5A9ylw9wpOozNIRiMTYTC3/jDiEkEwz1EmR2w6X72tmAlcxMLUoMJ+jTa+VRs/o
         BpgepNPHAljx8uHLn9rVPGYWX/JNbCQ62PtKifrnfj4stLXN1g6iIaYmxFxOQE1CcFZK
         3obA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132361; x=1791737161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=pqmy8Kzuc5R3DD0YZ4lhCQuFzL9tEBWj4vKpf1SPMvIZcORBKUGHyS7NWYkHPn30zP
         1cfACPHghbjzze/Qh52ow8ck54/TNDG9K5NnnjgPOhDutE9jyLhVIsW+GMEf6nrUnu06
         Ymm3pGMt//w2gSTPmFKlCJ49Oew62fu/dDDoJwNPrD3CeoAYlMVCg01vmmrYUgO09zkY
         WLkCw/u9zLV/nj+t0I2kcKQT4vMwo401fod6sSpmRU48iC0BoP+V7hHE1HhGQS394Jmt
         dOMKgTAhBsftm0OdVjtYRmNqLIGLdmF2jMqQcv5HZxC0ZWBcIPyuXt0H+J/je32GDSe2
         WWuQ==
X-Forwarded-Encrypted: i=1; AKwUvByg5+V5ptsn3HNS3OhDcBBsPe7wdFvI5U8cNTdsz80l0CwAmNoHofHAE03h7HzwkXQfGKpKncd2AUIz@vger.kernel.org
X-Gm-Message-State: AFuF++lB2V1VV80NlkP6Mn1tqOZy815hLj2MkQEiTbgVltu0BkljcSn6
	UN381pMCwmVBJpXwndTeFMHkPaFQJ9wyX45yTTfWLRNNDT5igtvmCurZ
X-Gm-Gg: AYBFou2FUFwAxlhLk4/VIyEOdPKvmBHnW6LxD3k53/siHQnncbAK8DWNJAlyDkn9XSJ
	9BDkITgsKfC6VSWXiPA9OhPFxGMIaFX+V93gRiBJiXPfJXkJhtb41Owrrxw8ICu4FDSV3UW7BZJ
	uet2Bq/+bLbLDa1MqtchKtgKPyC1bZOc5NYGm03Lpv4RmetVafGW8IsIVMgpn90wOK9+ZCV6IzZ
	rzD7Ajcb0TKp/bC3JtC8y9Ry5ZZW4dtneKCTwglyA3xxFwZ7j9oSlicTYZa/0dzj8PAAJFMIwpv
	Ilx96vsdFLb5fxzmJMCeTOIf/9I7grIgim6z5ABdhUc5ZIBqhwiz/9V7kZzrOWoK7nr5ulpVZEO
	VshM6lwp8I20vCZrN56R0IQG39C88dB8RcOdHlknl9eoRrSVCSdrGnbVp3CA8C1oOas2vAXHbTP
	cm2dUkOvQuChMOlZBUKLJxI/1GxMFNuXTeaoYrmjPnDKK4z1TjhpsJG4QqqOZ3N5/8DUjxM/Vp0
	zG55VOzsW8ELK0Kaw+LRpQ9oHjFaw==
X-Received: by 2002:a05:600c:c177:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a168103397mr86677335e9.29.1791132361371;
        Sun, 04 Oct 2026 09:46:01 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm21801435f8f.13.2026.10.04.09.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:46:00 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 0/3] mfd: max8907: Schema, pdata and poweroff
Date: Sun,  4 Oct 2026 19:45:37 +0300
Message-ID: <20261004164540.198446-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return
---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  38 +--
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 309 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

