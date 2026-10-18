Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30373476059
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326768; cv=none; b=p3n9hg5oJL1qrzYy3d247q0oJMz4B3pZGYi79ikV0MufGymfHnDvlVJzxw2XRoj0j0nCN0unbGbJd99Zq+7YrIgoGgz/scoPk+P7hZxCntfr9ysXUVivRfsla37PvhZt+5dqXHUXMIeRSGtwTmng5wmuwNrstcZWVkrN4zi0+mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326768; c=relaxed/simple;
	bh=jK42QSJLlFCZiNAkrZ4uWt8pBppxkc2bz1zJLNGahFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXEstSY8PL+iJmmQrFrk+bn2eMDR1uV4MFEIcMEU+ge49g/9Noc0+SNZ8lu8SqJIgsGlG32sCexBHAD37pZnbaj2U0DeV/Bsi8GAZ+DqJIWrrQlojF0qys46NOVa0cLeYiAwkXOjz7qxzW8N+JGmGdv+C82oT87mEEMj1kLTtQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/+CjGDQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/+CjGDQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso14182215e9.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326765; x=1792931565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpPqZvPlIP3fXy4tW9d7V+mx955z5cVsFSY/eblWfwA=;
        b=h/+CjGDQ/y2NFYO2Aij72eXlfWMe9D9aufSjskF3XRqm01WCnH1rBmpbC5m4PVt9Zc
         88u2/27jOc2w7k2+LP4oWwoqe4Ov3ydAshEX4Krw7Bn359146sTgQC5c0nexlyTCXUPW
         qAAX8Ol05owQQ6B+1t89XDb+pnSds7/mhM0x1nJUQN8EwNDijixN5ENC9U8wnR7OKbXU
         yt7TNUp9WneQlJzibpPC3Nk5UbhYqH0nc2fEpSIqZkXPx0PSuLf4iEWKdgrZ74pBLdXD
         8RpRJ1rFDZDCaJkuZMVF46PJ53nlQ38Zp/YkJIpVb64zzYJ2jWzbta2bRFnKDqyl2tQv
         3q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326765; x=1792931565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpPqZvPlIP3fXy4tW9d7V+mx955z5cVsFSY/eblWfwA=;
        b=gddDsd2w5ng13cxHRAIn0SlP/WPPDrckzHmnI8AjC2sVlwNfa/HTxWGHhso8vN+yVI
         QyHmKDyBIpKEfAZPD0LYk51VKUlRRbI+Hz80+pedlGPFzHPqhL0Zk92C6sGxw6kxsXad
         6lGG16eEgr/z/nWBGJNLvvmPPYcYHp24BT6GNV2CV+cZ/QHFvmgha9s98sTgko2dd78W
         dIaPsMHVozsPwpK1kIPwSLgpLCTWR3iJxUbcqd4g413Vyvn1XENhEd30o65nMj6ftXdj
         eRpE0iDSw70KsoOSmvc50tWHzKhylnbVcKcUrHWJEECsRCkAzB1sqdwylhke6DSSFiym
         FZwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmOvbPofNVGYTQMo4MUC9XvNZ9WsOMQx4BXe0j6RUDzNRoneDnpJtZG7nsQeUOVK0iQ6u8EhtLNLjU@vger.kernel.org
X-Gm-Message-State: AFq9FYIMOe+ukmISvqQe3PgmuhvDwDwdQSj60YQMhpGtOFGnXnd9sfx1
	R0gSbe9hhVAdKN6EkGZaNsoWjDt77r5PpeQn3MwFnV0xRljRyjjY3MSk
X-Gm-Gg: AYBFou2ty1xxy44FJbmzFTbGhKvNgDy1yeY7+fZxmMfVds9ClB5LpMvHlX+j+J0n4+t
	DKgMC6Ip3HvBaD1Ykg6fzZZCkUkbucL4P0VCaCi4dco8FbtbQKvd6FoJs48VY8MiHtkwRhj6cGI
	Q7RkywwegWLbz44C9EanwMPfrKTtPMng19Q7lwr2Q25c3+KxAO20ihnCrS7ueOH51iCVdbpQOot
	Ew8CFfpqcUIdr5L4bVTwHFMnR4I2o8WVXrUbYlf7VRqf3a65M/ELhSM2MmUgCEAcEJjA6X7ECCa
	98c8RZcl6q3nVEpLGtY6QhS09T9kxT3HzyRH5lFAQGcdNhEiGFfSPqzhQwiKiTgo0MFumuSIuRH
	r/VdHkHPyxkun+Rc8pCG1/eMKskjm3bVkosDB9XV0CPi216DHbLb7OfH75tuu5JPHVSyGH6Rxcb
	bl+b6t29PPzMtm0Ks1GTAtZTASBTMVWPB2i08CzhQdD01kVB8p391TpdII6eV2J3GN3fpi9pnVY
	xmxEPBxHId2MZe9j+d5jP7oB1oMNf5/lrGey6LLnLNPW81k6hI1LgDNKGajnfAaLvIPzTM0WyRt
	deVV7X+H/VfzNivXZg6org==
X-Received: by 2002:a05:600c:6992:b0:4a1:d7c3:d3d with SMTP id 5b1f17b1804b1-4a1d7c30dd2mr96288465e9.10.1792326765173;
        Sun, 18 Oct 2026 05:32:45 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:44 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/4] arm64: dts: Mark Variscite i.MX9 I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:23 +0200
Message-ID: <cover.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C recovery GPIOs on VAR-SOM-MX91 and VAR-SOM-MX93, including their
Symphony carrier boards, are missing the open-drain flag.

This series adds GPIO_OPEN_DRAIN to the SCL and SDA GPIO specifiers to
match the I2C bus requirements and avoid the warning emitted when the
I2C core enforces open-drain operation on SCL.

Stefano Radaelli (4):
  arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
  arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open
    drain
  arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
  arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open
    drain

 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi         | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi         | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)


base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
-- 
2.47.3

