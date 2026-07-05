Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CB537AA74
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 14:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783260068; cv=none; b=UhodK/Rr/IPwI2kX4orkeqgTkZuhFnErPhTlz+RTLdvZ8UXcAWR/3YQqSlhMK5QaA9GmgpBDecyvdu1M+y9e7KxtFGZKPiaZ1LRI0jT59Al9jnOX2TFSB6eLz2PZ433g6sQq0zjhYTWlGByM2y6YKjwXiWEXwjBXVXW1l4y6+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783260068; c=relaxed/simple;
	bh=y91yCTn5OqFNj2gv1AniQU1l6RNsFXdk6j7Az5+Zq40=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gvtwJaTdLwzMrH06FuFOy/xXzw78eHD5V903mNoi1YABPVhKrnwWgC3b1DxEMluoHd7ONTxm7Il7t41Eo4vxOKyvQQr8fwmtfy80lg5WL8z8xPGd7syZOruIlWlUjEUtbijDV6OyuF4aF30rjiIbhHoPC6odNwBl0KGHhXiN08I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7dr1RPB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7dr1RPB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso12770945e9.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260065; x=1783864865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Xmqz/oZ7aMrIDGMWhF1UArCU3La3CqQcUQWUOpBKws=;
        b=j7dr1RPBDX5afDhT32SujoNH8bgZDn35LPq3ZJRpVlTfYvEZ52YSpCSv7PtS0l47dW
         dfrEdbfeISf6mGXzkrsPibauoxelujD+dQXAav2VPZusjtpST/B9fyhCfL8fW7HK5KRX
         nIbvejtY87K5zLenCxTXXdQLmAsGbqYsC+UDG+pAOiya89vrJG1T47INVR+klj4Nwdrt
         cPF5xAlT6U3yuaWaTYwzPgekCumui6aNaBRZc2MRiiO1ZA7rpLgSSCfRuCsnMUsQm+zU
         DrK2jy9OKMFbUYqiSvDDB5BIgE9DIv0UnIPn0tE0x2tqLBXxQOYrICpvFoxCFQCpCOh7
         OgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260065; x=1783864865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Xmqz/oZ7aMrIDGMWhF1UArCU3La3CqQcUQWUOpBKws=;
        b=bc1voppGlGUw0IqR4hvVD+XdRQT59PmJGDHoPtEskQdkrCj+c52b2Auv1fRCOTdzr9
         pLxAee04eDSrPT+T9KUaK/McnX9EbwkuxXtTgmhnwuuOmwvCntBlcip9hDIjjmTTQixf
         ZHPY8/AURiUdwCOwrwPFzoI9XuDQmS98Yl9L9ijM9zfiAxS2RnZMOFZHHxCG3WJK6UYd
         Amz9D9+XBwhGZO9uCIxwWXa5lp5pEUcqBKKv3+7RS6wvQyXsxLTiaBhT5Az7W07Z0K3T
         9ZhxDuhtFsij/p9DaE8yDSG6e0/c/D8lrvMi++dRU3ihPBsdHx2Bmaz/FqPFo27EeRHO
         EayA==
X-Forwarded-Encrypted: i=1; AFNElJ+1QXiyxe+Axp2nttVr0ykMyBJdPR0Wyz9sHgreQ5ci6QC+Zy1QIfYYN1Ata9kWOl3dPIvangwh4zMt@vger.kernel.org
X-Gm-Message-State: AOJu0YyE9BoG2MjW+op3baIL/JOS01EGtdRuaWG/8TUoMmHCCsDNlbdL
	HqTSeEqqzGT9Rq5Khnfm8nHob6Lqfz8H4IM3LsZZd0GAbqQNsh9r5xjr
X-Gm-Gg: AfdE7cmlmf0iDlIN6OQjpCeVQXigqougJPO5rmRY8F6/YxP6wDPZgKeh0KejEQNXtGC
	X/eyEqymN4/juh07bkdc8AtfPV4zqYXp7iOaKg5naq75k/8q7ujJ5hLK/k+bvW9SD0eYWhiLtfM
	M4WWgV+s1YzhFdiSy/pvRxqwbLc6+q/J1bBSNYcS2UvKoUVlYTILSa7jpWHh6SPqYsRrD4b5ZGp
	/Ao3P4n6YYrq/NqAWvtO79IO4kffdOvdTQSYS357V7x11NMcc0qNDOLlTul7cApjkKJIcodrkmL
	IP+29NALginFjc+LsCplccnK8g6I5uUGE9OsXjZOkfaIcnn3eIMnlNOrXlLvSAjVr5FMXO6aXHS
	Ehuy3BQNXmpMyuPNZRRcRoGW2KejY+4kIhnPDF9rDHaJnblIO/SxO6o5wj7doRGtId7K6nX4k52
	wtaXe02CeigIpAJy8VGDm5JTw=
X-Received: by 2002:a05:600c:524b:b0:492:40e2:358d with SMTP id 5b1f17b1804b1-493d11de9bcmr79035685e9.16.1783260065332;
        Sun, 05 Jul 2026 07:01:05 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm275911115e9.10.2026.07.05.07.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 07:01:04 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v3 0/3] watchdog: npcm: Add reset status detection support
Date: Sun,  5 Jul 2026 17:00:57 +0300
Message-Id: <20260705140100.1543486-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series documents and implements reset indication reporting for the=0D
NPCM watchdog driver on NPCM7xx and NPCM8xx systems, and documents the=0D
optional GCR syscon property used by that support.=0D
=0D
Patch 1 updates the watchdog binding to allow the optional=0D
``nuvoton,sysgcr`` property used for reset-cause reporting.=0D
Patch 2 adds watchdog documentation that describes the bootstatus=0D
mapping.=0D
Patch 3 reads the SoC reset indication bits and maps them into the=0D
existing watchdog bootstatus flags for NPCM750 and NPCM845, while=0D
leaving WPCM450 unchanged.=0D
=0D
Addressed comments from:=0D
- Krzysztof Kozlowski: https://patchwork.ozlabs.org/project/openbmc/patch/2=
0260622083046.3189603-2-tmaimon77@gmail.com/=0D
=0D
Changes since version 2:=0D
- reword patch 1 to explain the hardware reason for the GCR phandle and=0D
  why it is needed for the reset-status support, per Krzysztof's review=0D
- cache NPCM750 reset status in SCRPAD2 so later watchdog probes can=0D
  report the same boot-time state=0D
=0D
Changes since version 1:=0D
- Modify reset detection handle in the watchodg.=0D
- reword patch 1 to use the GCR syscon-property wording from the=0D
  applied NPCM reset binding update and drop the optional property from=0D
  the binding example.=0D
- reword the patch subjects and commit message bodies to match current=0D
  kernel dt-bindings, docs, and watchdog style.=0D

Tomer Maimon (3):
  dt-bindings: watchdog: npcm: add GCR syscon property
  docs: watchdog: npcm: Add reset status description
  watchdog: npcm: add bootstatus support

 .../watchdog/nuvoton,npcm750-wdt.yaml         |   6 +
 Documentation/watchdog/index.rst              |   1 +
 Documentation/watchdog/npcm_wdt.rst           |  71 ++++++
 drivers/watchdog/npcm_wdt.c                   | 217 +++++++++++++++++-
 4 files changed, 293 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

--=20
2.34.1

