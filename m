Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE0A3A5E81
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485797; cv=none; b=IBsEgg8KPYTlpa0kfgDvJ7s/UYBJNB6J+ntyZ7SLjRjIgvX6S8Okzt8qBKVg5Lua99xi+Uok9LvOQx1V0SSmo4CM3XQ47ConTXvThJHmNoCF9HjGaQLWsqTg6nzPxG1tyl7v3GFKE8KWfxPYJKA5ynDnDAW9VLLf7orp26Tn2tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485797; c=relaxed/simple;
	bh=o79OwXp+nB2WI8QPW9U8EHinPAtqGbntaWN2rWZ7iQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ifec6qNC59CMKDehOqFxD09nGDREx5BtJqSsnu+JBMPWjCTR5i8hLOTKLIhdUQpSbIVkCRVrT246JQGx5LrASnL7UH2bPkMgF9pPNIMwDGXV+gGraU7RFgAvcPxERlEJ6qtHL0JIhlUnBs/Y7lcCGRqJ2oSWkOGcYHvxqGecoj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kroAUAT9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kroAUAT9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a4113ab355so3676182e87.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485756; x=1779090556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rH3pd/6i05BMy2p7WNOEU7tz8bhUgdoOEFSJvfQO1lg=;
        b=kroAUAT9BVZFjhdlZ7GZO+q8WpEx3sDKYXawBVQLZI85Ixty7m7mCoVcJfyvLUIdjO
         tBbN5xQwUSO2FWBAi+9doiPFSZHTZqx02AQYzI1XtWjznnRyZXKn8nX0hvmmzoZYO+0b
         qrM6begnCAdGty9vyTBz40Ry79vAx8/k2M2j26dwIe8aEVnYYxeGncJtzm6NXqpoL/hH
         t5lTrnDZnGZPtPZXoPHq37vGe7s8X0nlKEZhQAyNlsvknj2orHsMe6Jh2aUEXQ69HV7r
         t995mjVNylnJn31KLQJHdF6GY2RMCAwjk9Z7/xJmTZwPtfBsSazQdTh/LRhDpMUqmi1j
         SDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485756; x=1779090556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rH3pd/6i05BMy2p7WNOEU7tz8bhUgdoOEFSJvfQO1lg=;
        b=LhDtv8hDu8+pg6/lbu9r6eMIH6/H/CREu9Fxnoy467HNkn9A8VJGykUzUUd4YscEfH
         AhrZeIuOnaVZhViB4PBbjjcvE+AON1h3aFxzZ0ZGDfO2dpX8mLyRGnvoy7XtgPlAVV14
         ZH8wHbf3cJsUpIp6BpelDGIb4BLBaz/C/G2gvkQ3bl8Jhq92UFmHw97Gvq6zM/8IcTgv
         iHnKdBxOPHpjqtMKTk9EGJICZDirGDqvg3wb3qsa5oeaROGbCx45K5VbJkAGDC6etWjo
         kCP+zRf81JRI8lUBBh1aiiIE0NAGSYthdYCaJpdiQ5MmyJL68yBtymJQ02YChQ59o4FD
         Pi+Q==
X-Gm-Message-State: AOJu0Yw/fPggZXniJNK2lEt6Rt6Ei20RybpcZAI0Hj7wx1fRhUKOywbr
	EfVlYHfmmVtKgomrJ086QfrnTw4sgPKj9nQeE3aUl+T31vEjNXk5716t
X-Gm-Gg: Acq92OF/iTm08ZiD6MHSDlhmk7spw/3Kvul7mJiy6hAlAxYnTJEXBTpeGbWJzSMiiRr
	jzzda+7TP0A3KXnOAMMVs0egyoQsCgRBinB3NfWPxZm+KsUjhQCAyHZD2bs8wM2TWKjzNtgtn4v
	PRoQ0+djR0tZxbeTRiJ/JhcVVTJFqpyUctY3AofzT/3E8JsWl8Xb2eSWe0Xlownj1jVUT6+VlAv
	/hnBASbJNhh/wdr3p3yA5MdkkP5c7vM1+3VKDta1wrDY4aogREgWArMFdIVZgQr3x/oTEEUqCWB
	Wcu89em6pZt3bXevm4hyuJjd4qYCTP2KvgunqcnliXOqd+Vm/juCHxuLXHQpZBKyw6YXRgQ7HnP
	UxCFCWIUauc8OpwdOHbWCT5ksnBIBiaZfYpzzso3pMeSttgF+tMHk0WPxvq4FQhICdZ715gsfR6
	qZoQQDlpsEdcTV
X-Received: by 2002:ac2:4c41:0:b0:5a8:896c:8989 with SMTP id 2adb3069b0e04-5a8a94c2079mr4159021e87.30.1778485756240;
        Mon, 11 May 2026 00:49:16 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/9 RESEND] ARM: tegra: complete a few Tegra30 device trees
Date: Mon, 11 May 2026 10:48:50 +0300
Message-ID: <20260511074859.24930-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure camera support for ASUS Transformers, Google Nexus 7 and
LG X3 devices. Fix RTC on LG X3 devices. Lower throttling temperature
for LG P880. Add panel support for TF600T.

Ion Agorria (1):
  ARM: tegra: p880: Lower CPU thermal limit

Svyatoslav Ryhel (8):
  ARM: tegra: lg-x3: Complete video device graph
  ARM: tegra: lg-x3: Set PMIC's RTC address
  ARM: tegra: grouper: Add support for front camera
  ARM: tegra: transformer: Add support for front camera
  ARM: tegra: transformers: Add connector node for common trees
  ARM: tegra: tf600t: Configure panel
  ARM: tegra: tf600t: Drop backlight regulator
  ARM: tegra: tf600t: Invert accelerometer calibration matrix

 .../tegra20-asus-transformer-common.dtsi      |  22 ++-
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 128 ++++++++++++++
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |   4 +-
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |   4 +-
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   |  71 ++++++--
 .../tegra30-asus-transformer-common.dtsi      | 159 +++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts  |  41 +++++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts  |  46 +++++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi   | 157 +++++++++++++++--
 9 files changed, 595 insertions(+), 37 deletions(-)

-- 
2.51.0

