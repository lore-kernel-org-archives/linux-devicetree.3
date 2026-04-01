Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081C43E48D
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060746; cv=none; b=H+24uy/D+O5AAiBq+T8du8Md/+U5VY/WbwTia+edDPF7yLSlZl7kdFQR0fZNYV1UehtgkaL5k+dbnc/Pdvau/Ghw1LiNr6Lu2L7aGnMCd49ujbyrKlVU5EdQb0Z6lB+7UktYmiajr38+WeozaDUaB5wtYLxNVJWQ3IMSw+NQ4SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060746; c=relaxed/simple;
	bh=JHZaomVmYY2I/XkWsxtkjS8/76dzEdRMGcPYxXG9t6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPvOw8OW4a8FFqWREIlrbirVuttJuiOV2e8bUhSvQiPQxRWNST6a3GYt2o00D++FW8CqfM0YGjs5CHh84+rmasmOtdvDq7d7CTpXvDvQYhwbSTN89ijEp6ivQc2K3e58AYq/3ZvgbQIuWQC01q8gWDOmZVLwrWR+3BU5db4i/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai; spf=none smtp.mailfrom=mirrorstack.ai; dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b=DiZrhrB2; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b="DiZrhrB2"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35c1d101355so3044342a91.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mirrorstack-ai.20230601.gappssmtp.com; s=20230601; t=1775060739; x=1775665539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdKWlJC7fiD6nBYqrx/pcO9OeCyCqC2Lwr6JIyiolS0=;
        b=DiZrhrB2ih/LEIgnkmZxmi/LCjauEYWqooDiH/Y/5zfiPVvAYtKKm29SDwSNxTI9OR
         7ctDUImxINWOws5/VciluwBgjIq6k7TqFAUzhOxhAAZ7BhzDMq/oVSE43e7ciqtRMpRo
         GORye2kcBhzdgrKoTqgtyfhXEcGPp4kQ1NTQ4bYMqp4AR7dZZtJEY6UX4W9xAh91Xrvb
         /ysrjWmV7T1RUHgx436MbwCIX2ml/Q7ph8hbYHdyohnFfa9Ewbp5YWkQqImC/RbsiQ83
         bVapC95rAUwB+n6/opGyaGVXjsCMS693H9GoSGhB8Kg8xHs/UCUTi7u2oSMAiDba0Ebs
         DgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060739; x=1775665539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdKWlJC7fiD6nBYqrx/pcO9OeCyCqC2Lwr6JIyiolS0=;
        b=feZCp0Kxa8cptA7oJJPtDAEqQIj6iaRA6vQw4Dt1aKqOeKZfmG6Yo73+fVeRccHMTN
         J4huWBEk6IBeVbpWCtVCdojZ+QPe4/Qe2EJ8DY+a8zmCjrM0pf+SX3Re+vpDkakt6a39
         yJNDD4C6eWVEXhTan25cCWrtihRqW98tTCsuHU2DKSIJJMheLDCw92Vzx2bqs4AbGGQV
         p8qS6wWpPdxEZP1966W4KWSIAABnmosngJet5Db/7UvBSHjSXmWamHB1XT5cN0JglHca
         k8jF8sgBASeuB5SuXmfL9xIkQ0kVcY8ZlE5qjDbUrkvMuLw2d9A+vkAtap3E2yX5xx1u
         sIOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu7f5t4M+FLlnUk8wQ/um+RJgIHtZtwJcFfrVywgJ9eP4aQTE9fRDXxRWfP5wdchGLlE+NlKGMsKTE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp1LMokb//3fwWnVGw6zBF1IUH+oHrUAvIFFvhtBVCqqebsrdb
	Z2CwHqL8Dp4pG2RL3wbdvmTuINBrUcqg/um51RKW6RUdpJizVFT2/A8LIlcJleFpymd5
X-Gm-Gg: ATEYQzweiKvgTzeUH/sNiRcc+KZRQn9/fc6ofxhBqLQuAWqFp6FZU3+sY9IemkvQ261
	fHbUXwZkbuXMMiwOc5xl9pkGDIzQAT6NThQ7zl445EjDbqW/uJ+GtPbC0cKLevciidcc46OgN1P
	g5VwuuHhw7zxuXmWGYIZUurH0cQZZn7Z++49FtaoqdlSKoYqeYkBdUnRwXFPTA/mG0TfvcibJga
	bqsy90TvOtn8VylQ8ZqTyJVA0dwBHswThsg+B4eyhlfjft1xSYfhTqp4ZZVeWwPC4l4clU83DyT
	wAxZZVGvGLowDCXuLMPQarVrHfht6pK5iNWOXwRNlpUp4q9IypHckTEXCkF5C0UjkC5WeFj8Ix3
	aZ0pn6d4K+YWd+Zh2iKDAdBWopdWtWTKWE2ikBmqusllAlnrrJjZQzg6wUAbHaQxTDCz6j8usvn
	Aw3yLpxA1nBMzfkLjrV0/zbttu+ECCNBwYOK6BysG4TvCDvh+GObBvdideGT9k37yiXWAtVrJt8
	B8YGAp0XjYafNmGAVDJFCxNuOkhoX0FWE5NNWY3G8+LwerA6H82
X-Received: by 2002:a17:90b:3f4c:b0:35d:8ea1:62c3 with SMTP id 98e67ed59e1d1-35dc6e43b1dmr4400337a91.3.1775060739077;
        Wed, 01 Apr 2026 09:25:39 -0700 (PDT)
Received: from ip-172-26-8-186.ap-northeast-1.compute.internal ([2406:da14:e8:bc00:e546:17ee:7142:6d05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34eesm281813a91.2.2026.04.01.09.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:25:38 -0700 (PDT)
From: Sheng Kun Chang <nothingchang@mirrorstack.ai>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng Kun Chang <nothingchang@mirrorstack.ai>
Subject: [PATCH 0/3] Move adis16203 inclinometer driver out of staging
Date: Wed,  1 Apr 2026 16:24:54 +0000
Message-ID: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the ADIS16203 Programmable 360 Degrees Inclinometer
driver out of staging and into drivers/iio/accel/.

The driver already uses standard IIO channel interfaces and devm
managed APIs. The only missing piece was devicetree binding
documentation, which is added in patch 1.

Patch 1: Add devicetree binding documentation
Patch 2: Fix MODULE_LICENSE to match SPDX identifier
Patch 3: Move the driver from staging to drivers/iio/accel/

Sheng Kun Chang (3):
  dt-bindings: iio: accel: add binding for adi,adis16203
  staging: iio: adis16203: align MODULE_LICENSE with SPDX identifier
  iio: accel: move adis16203 out of staging

 .../bindings/iio/accel/adi,adis16203.yaml     | 52 +++++++++++++++++++
 drivers/iio/accel/Kconfig                     | 12 +++++
 drivers/iio/accel/Makefile                    |  1 +
 drivers/{staging => }/iio/accel/adis16203.c   |  2 +-
 drivers/staging/iio/Kconfig                   |  1 -
 drivers/staging/iio/Makefile                  |  1 -
 drivers/staging/iio/accel/Kconfig             | 19 -------
 drivers/staging/iio/accel/Makefile            |  6 ---
 8 files changed, 66 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
 rename drivers/{staging => }/iio/accel/adis16203.c (99%)
 delete mode 100644 drivers/staging/iio/accel/Kconfig
 delete mode 100644 drivers/staging/iio/accel/Makefile

-- 
2.43.0

