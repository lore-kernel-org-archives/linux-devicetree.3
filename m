Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFDB33F595
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477499; cv=none; b=CgPjkyq2waLiakVbXe8I3biFDHIrwXXsKAgKVhEI1mMTOWfBCSN6WHqMdRZFRKHJ+G+9Eipz5YtIfbuhemRqQkayvtWgkzIznR4wqyxvS1yeduFl3IfemFz9fISjBwSAOmhroPMob9h6byeOJVT7ht6x86wzLxvzWjq9roHIXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477499; c=relaxed/simple;
	bh=Qi7xIA2TqpAwS/9xKDClt8v6/ovXWQCPOu7xJnS7geY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/kR9X9tGGi0xxngdBvA18EaQgLJ3FzPKSQOp4QK0f4kgbNwRoKz3oo0Ld2XrY+GJyu064coSSzWrNm0hGyC/cuLHD3bxFN0BX3uSOog91Bg5V73hBIaw0v8orE7FLKXxsRV79lMt0/f5bafcTPfJhqCJ7sDkttdieEP6TbCG6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hir4SGuP; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hir4SGuP"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12dbd0f8063so3017875c88.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777477497; x=1778082297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2pGMTg5AYRgxoacmWH4RFQzjjbAiPYYFD1LTfaMwfdw=;
        b=hir4SGuPxjyE0AhLJuNLldN6X7o5RVOp8tX0xp7k6ZgdwWVY/yKTmKrHiUqZYfhcYZ
         ECe2zC2haDJEEg3Hw9iHJx2HtLpi3N31vaUlamusrJLT8Y0cVfjd8AJumZwFXL5rjwBh
         B9G5iYNj6kaZ7fJPmpS7nM8ZUc8JAMD4iUn5MdA2aZ2AW4YkbsSjR6Yr5hebXwIBJRTL
         h/i3ooElcghGjkk556Y3RO5kbm9FgWsZbQ2rSnntlH92S5DEyn8sE/7lF4Un58rymi8T
         zeCkvXNigpFdJnB1nMp4AccIT8c3IDRdXbUje+alF5EwbQJMvdZAwY5HhyQL+baOy70R
         dOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477497; x=1778082297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pGMTg5AYRgxoacmWH4RFQzjjbAiPYYFD1LTfaMwfdw=;
        b=fBxIrqmCkY/aQ680/7rqHB0EO/g9fhwx/qdbC/jvlzRaF+m/7Uxu6kyhKsjr3G6Aw9
         SqSio1yGuY5uRXQWDRYTMOwtJWsjL/225M82V8kDtF7+ApfDiqJlFHV5P/40wmW0Sxc4
         Aekiv0xAMOISfnCcs3EbvqxquFBS5FxemXJplNJG1knjRHR9xLrUxGAXGz1cXj4SPi/Y
         nEH1yELc4Tu102Fb2P4EQxkt/52czdibbvcP7VDQfqlaCBMk1oWXiOyzXQvMeXIq6vLP
         u4+YRB2DiVS386Ym9L9Dr31Q4WiUoXhp3OZYWp4dmPgxyllxD80YA2y1a5KN1ujAYWBg
         Hckw==
X-Forwarded-Encrypted: i=1; AFNElJ+yZqFoPqx7WxxBEhK2PYFjei0JVDUqZ5+o68qcJwXfs4Ozoiy92oJS8SgGGig6/V47i7ZbmBaAsmHp@vger.kernel.org
X-Gm-Message-State: AOJu0YwBpXqG+/4sWdkZMtZXSLpHcq56g6AREcuR/rmtij4IzlaBIsoF
	UAEZjDKyIJSw3LxsISJcBE+9Dbxn1/fzdjH1/KCcLrPnJ7VulmiOhwppnB83lIpl
X-Gm-Gg: AeBDietVB49tFH4wnYNJoTzbhzeN7bvz5VohzYoPzbIjWZ56s85mCmkk+9+iNMy/QBg
	digHrOgDIABNge40umUHtQxHi+rXdtcL/V1L2Q0hoECL1aVKcDvf4JGlqYN5/yO/lMkJNRlV9G7
	p4PHLlZKUfGDX9+mRL7Wq4iivS5UQp+xqPABPo0b65A+WhOVhus9ViPAF6kRSGDC9oHycuW9cvP
	MTL8EaEXjVzZBLObD73cc2nEutrL7DoJ8U9LRzJj8pGxhH22hajsN0tPYF6HyxOA8PYBMrLyZlO
	p3bTW1b8RXKe9XphCWr+dZP5TfLNvjUMGsIlgau2j/q1Akl4oQeSDI1MrQ/DDKYm2sdR2Us4MTg
	H4oKyDcLqgrFObMauk6fp1FvgVDBx87j+Qy3/8/OoLQRgGc+Y+3JIwXW/4oaRwPGHgOGWj2tX/P
	UBTMRC7zaOo1E6hr8VDENZ5fDpHqOXT3Q=
X-Received: by 2002:a05:7022:f513:b0:12d:de3e:52c8 with SMTP id a92af1059eb24-12dde3e5333mr1963969c88.44.1777477496912;
        Wed, 29 Apr 2026 08:44:56 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm3610166c88.2.2026.04.29.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:44:56 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v3 0/5] leds: Add powerdown gpio for is31fl32xx
Date: Wed, 29 Apr 2026 23:44:44 +0800
Message-ID: <20260429154449.730880-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series primarily adds the powerdown-gpios support
for the IS31FL32xx controller.It also includes a fix and
dt-bindings updates derived from previous attempts [1].

Patch 1 and patch 2 are based on a previous attempt [1].
The driver-related updates in patch 2 have already been merged.

Patch 3 and Patch 4 add support for the powerdown-gpios property,
which corresponds to the SDB pin of the IS31FL32xx series chips.
This pin is used to enter and exit the hardware powerdown mode.

Patch 5 fixes errors introduced by previous changes. It impacts
the brightness control function of the IS31FL3236.

[1] https://lore.kernel.org/all/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v3:
- Replace shutdown-gpios with powerdown-gpios, follow gpio-consumer-common binding.
- Link to v2: https://lore.kernel.org/all/20260428023401.330308-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/all/20260428003412.322032-1-jerrysteve1101@gmail.com/

Jun Yan (5):
  dt-bindings: leds: is31fl32xx: convert the binding to yaml
  dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: leds-is31fl32xx: Add powerdown-gpios property
  leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
  leds: is31f132xx: Fix missing brightness_steps for is31f13236

 .../bindings/leds/issl,is31fl32xx.yaml        | 200 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |   7 +
 3 files changed, 207 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.53.0

