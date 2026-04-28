Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD261A9F91
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336489; cv=none; b=A3yvZPKDgfF83iRwC+UuOITc4Jdl96/yqkwJBSOkoEvvKyoZL72z2UXgQg//V59dHHfGAmdSyoVtMtszEPOSQdjyISzNtYjmkw/zFoZfIyllVtZRIk4p3kFYWZkX5hUovMiCU4Rod+oNFQmPRTQ1SC1w43CJxbDeOj72p3059Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336489; c=relaxed/simple;
	bh=Km22mwMXYXlDRybVxMfI3OhoMB8ev9WSoq/jpg4uxys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFNzXcRSMKJQBjVwqZ4uZld26MWZBJ+n1txy7KvGNYU24v/5LkNQ4nBTz+bUSfmmf7j1GQYuoUXmP6dtZ3G5IbYJOmlZVNYB6tYqa1pktxmownx5BfMRAQa8n6iSo5vopVfUwP5mMVCSLaGsM3TJxRIZZaxKtR/XX0k8DnSPw1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmxLK7DS; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmxLK7DS"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c7212836bso765466c88.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336488; x=1777941288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khvD6LA49QvJDWglizbk1eKiZMgbOeJmUSdTokzGJAw=;
        b=EmxLK7DSXzUJp2p2eDhDQe8QCl7jjum9EW1JZsPclsmiMgbFQOHuJTSClcW57v5KJ/
         MENEUq0fLIrqPCMHuYTxpJKWhGex+M9KWy9HBUjj5TzYQbDLINUnOPRb4VnwdjaoHiwR
         kfDigiNdbO5U2/lQpMI+zAI/JQknTVW4jAPp08PosdehI/yQsLS1OT6mIpZSclPp/+31
         UdRLwsVncx3GAVyjsC5Vz4J5ZK7GGesja5N42td9zK0ladKRNNUhWakeeEP/7RScoVJY
         cdfS0Uq8Bx0XgYFOO4Ehek6E3atd0B5pDIwUF/JWM1KB0l9/pLyHkuKzpfmsKVNrjsei
         56vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336488; x=1777941288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khvD6LA49QvJDWglizbk1eKiZMgbOeJmUSdTokzGJAw=;
        b=N8d/rUT5Eq59FbZKRSXG8OWtK38e8NJ7cXNFyKKX8JrJKp04P/ai3xwvZ35v6YrXqP
         dZQ1Ofp+1XukqtjpSTB3Yud683m/g2paApHFWcg+RT/eL3sXY6GTOv5ndmduAwZ8Ouiy
         GZvh/Wd7QNjUkl6OaZQpm+0v199oO+2c+wyZjbVUkN5JBvNQyoY0y7UxNLOsT7UTa0a7
         6iOXWVZs1BZLrCxarByH1zgkbF43CesqIR8wB/rQb/c1gS5btD9ZfpAeG3XEGEF8C7aE
         VmKtNtyyxeKsmgPvIVm65nZUyTd12szCJL5tP5YwGM7IPoj691eZS0E32B7x3RJ5LNh2
         RnWA==
X-Forwarded-Encrypted: i=1; AFNElJ9EFIKb8bFeTZDf7OyZe62BdPYvB0CybPdB4oxZVW2DH3StWVukSLHN0c04M2bnKFlUx6TwRSXvVYzb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy09WGPzGiwM6cPXm0/IzMjhp0QMBnx/c+G1a1yG/XJNpqwGpo
	3ggPGzsYivvNd5C8bijwWE9xmHO/daG358u/7ch8vsCfAnTluvSaZ0ym
X-Gm-Gg: AeBDieve/ppec1lA6AFNssy1cfbV0xMWKsjWqN8+iZPzYe5cLqFQZTG/PWXbTyzLlLs
	7XieHlWrNLvniOjq9yIFkM4MRh7br/RLF5TN8VzdjyYIr95L7HkCywpA7lBVAqZmWCnV5xHdWMn
	b6EQwDkPrRM1Xjydb4VxfSuqDpUjTqu0P7yFsrYK3oPh/jd/fSt6pPzFx/G75UlaPqQ9kk2yrIY
	O1XW+2imGqOQyjjcaiXAheKaVcx1nuGXhlycmgLYM6vPDMiF3P7cvIXt7sJeubpVUrNRYao34/c
	dVX+hFGoDYsISn0826i6nDKm/xibFKlAMYOPk3QRNzdt7LKCkI398XGlPu5A3PIdtOpPZRuTgS9
	4SUFDrxjl3ScNpNBttI0LQknVtFD/Jd9m6AVz127S0OQUA78ZIgTyAkLnt+0JHaRMLYqdpzkhdi
	eynVGDo9k7otx/8TX/EwRtQFqPXmA3pAo=
X-Received: by 2002:a05:701b:2415:b0:12d:de3e:86ac with SMTP id a92af1059eb24-12dde3e88camr62174c88.42.1777336487616;
        Mon, 27 Apr 2026 17:34:47 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:34:46 -0700 (PDT)
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
Subject: [PATCH v1 RESEND 0/5] leds: Add shutdown gpio for is31fl32xx
Date: Tue, 28 Apr 2026 08:34:07 +0800
Message-ID: <20260428003412.322032-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series primarily adds the shutdown-gpios support
for the IS31FL32xx controller.It also includes a fix and
dt-bindings updates derived from previous attempts [1].

Patch 1 and patch 2 are based on a previous attempt [1].
The driver-related updates in patch 2 have already been merged.

Patch 3 and Patch 4 add support for the shutdown-gpios property,
which corresponds to the SDB pin of the IS31FL32xx series chips.
This pin is used to enter and exit the hardware shutdown mode.

Patch 5 fixes errors introduced by previous changes. It impacts
the brightness control function of the IS31FL3236.

[1] https://lore.kernel.org/linux-leds/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Jun Yan (5):
  dt-bindings: leds: is31fl32xx: convert the binding to yaml
  dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: leds-is31fl32xx: Add shutdown-gpios property
  leds: is31fl32xx: Add shutdown pin to exit hardware shutdown mode
  leds: is31f132xx: Fix missing brightness_steps for is31f13236

 .../bindings/leds/issl,is31fl32xx.yaml        | 200 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |   7 +
 3 files changed, 207 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.53.0

