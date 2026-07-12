Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64C83A3E60
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 11:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857117; cv=none; b=Hn8PbrpRt3YNJUsOQkM166xgsnNaYG6SrUXXqcZJqqm/UrfRXt0rzZoec+DMocGcApNj4hal7VvR/1Ko9korrgyHmO2pDJZjyJb9Hp14oty2ClRCYEZCghwj+NEKEU7MBFNQw3uCSWJd/IsM9w2C+8GQ1BIZBd9KjKF5qILXE90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857117; c=relaxed/simple;
	bh=6+TZszz08ANN8+9ofoYjUJ5lkEzumu4XH0cVK7Cerfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXRRpHVOQxHw30zvHjsmf5Pyc/sk2d+mIa7jcgNXnvadr/L7NY+m4Jzl2t+ukRmy5OEjMRUA2lC1u05nosOqm/h84kT9dU1OSixTX58lzvGuEKsnFzVcIaEHW1jdgMeAXojU7ZO4940mqgqlVNCNzqNQNSGA7EcFnN3kDY3+Gbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahZzkFIb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahZzkFIb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so24350075ad.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857115; x=1784461915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Utm4P1WbP2lIpaXwLG1JxwvoUEmp6e9qMX5dfGldD8=;
        b=ahZzkFIb7RNV6bXWLHbMYcxAxsTw2U/LC8/4hN/7qTqLtsZODyq6/Q0pTtYeWnJU1c
         YxVgwzGfdX87fJxUclz9MEme2ze1ICFkC0I1xZFsYz+leeiKtkuCW05TTTDef5YaIJ5c
         WMqi23LIXsU7BQ+xDc4KbUExhQOdj0eMt4r3tIiC3hcGbvvfGHhEMsbPQpV3sl4csPxR
         MK5ibDnrPqXJQUtzKV3tOxdu5juTPJh9H0NQSm/CP7dSX+N/Een+OwfRriQRw9NvTNMi
         lXHsYkSaAEWzuAnueJIUDiHkNWt0Zi2z4c6IS6aHwRQk9ttN1iSOHjTl3O5lPKxgo0kh
         LsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857115; x=1784461915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Utm4P1WbP2lIpaXwLG1JxwvoUEmp6e9qMX5dfGldD8=;
        b=KmnnepnC1/XxXA7jawcwu1NSwZhEEOAiuwHwZBjbGQVD5FiTv7MXvQ8Dtf4SNsfgXq
         oEbsbgCjzv8m4l8P3i2w+w+Tqp6MqBYAMBZ4BsiWcdg2lYWavrW5jMQ7om5PMsbAEbpo
         ynAdt6+mFcRd5Q9OrTOAyyNMbsjY9ltWZ1h1AqpiS+uA1bKhvJVFVAeBtk+gcvrxrb9s
         rt+bMgFWm6ymPlhfGUQiJrWTcJ2vtEx8hZhAZn/PEZTpFAUgW94KNa918lx3qpEaIkJM
         RN9jl1LCS1n3DAwHNhpqlEjycCi8ttUa9MWI9LFcJwq2sXwKC9DHut72PkrrNt8WXB4N
         /HCQ==
X-Gm-Message-State: AOJu0YwwqlnfAPuPKLnC+M5s2aGe09auxYgSTDn1dIMEksVGXPFPK1dd
	4WYQwPaMctk2gM6lEz3w/rm3TK/pAo24W149YZbmOYimOPKOcJaucURj
X-Gm-Gg: AfdE7cnBn5OAZw7/hQLcyf7YK3lhuWfHkIooskZ1AM0oLxeN1/yexkFrGJ5n3Q73vl9
	OlqFr+ztPj5JIoy5eLIWYFiO+u7E3l8SCdT9Vou4fTHc31JygYavovr1XD7TGMhWZATXzNZ2SUH
	kTF18oAXhAkLm+EHr0jG4n32eHEfOny2C0O73hFrDSaBPHd4EBlSmZ1bH60PfbFT9TSCLFQ0Lt2
	+4Pk8uQ7sud08uGfCoedNVf/+5TWwQ6YSSS5Y1rI8Yk41Y/PVHeRBhsiJu4ka8/5i6vkaDEfA7t
	Q9qm6ZjpzdEFIcbqAD8k07uDgEJAVukJh1x6nFieDZD4r5dnNDSay9rT30umuR3mLHiBjaLUuQy
	yMk/QJvKx3fLyviXuxmAL8UAN8/SJUGYGJSRaVZnmkug4tUHtPGRA6OrNkC26jeZPs8aAQJj2ES
	lnwQWGtYI6ikU/IjYjbBfYz5MPsTzjlPlFzyj9hFIGCy57YZnyLg==
X-Received: by 2002:a17:903:4b47:b0:2c9:ff83:41fa with SMTP id d9443c01a7336-2ce9ee1890amr53777765ad.24.1783857115288;
        Sun, 12 Jul 2026 04:51:55 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:51:54 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v5 0/5] fix and improve for Hi846
Date: Sun, 12 Jul 2026 19:50:07 +0800
Message-ID: <20260712115012.91600-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
- Drop line break (Sakari)
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
- Link to v4: https://lore.kernel.org/linux-media/20260511103927.279550-1-mitltlatltl@gmail.com

Changes in v4:
- Correct default lane cfg in commit for 'fix link frequency handling'
- Fix messed header (the Media CI robot)
- Move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- Fix modes handling for different lane cases (Sebastian)
- Fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- Remove uncessary `else` (Sakari)
- Fix link frequency (Sakari)
- Correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com


Pengyu Luo (5):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: Fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 296 +++++++++++++-----
 2 files changed, 227 insertions(+), 71 deletions(-)

-- 
2.54.0

