Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CD04AA1E2
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 22:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683963; cv=none; b=jrg0CxIUyuEQT2dbgxYETRoTRuSyc3YfxTmOlZx32+NK6KKUMeflljBrBE8QUVF5KDaFd7FPZ2nlfKNrMh2SW9vNByAuYpsZvFp1TIBKUqC/ktOFPvIk9A34TTkn1T3GVpBycWzhsL+yiX/CkLekSvzHQKGTOcp7oUOJ0t66wbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683963; c=relaxed/simple;
	bh=l9/NyfXKy1WrGYxW/ylBLHr+m63MzpB0UkpPW7lkV6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbkE0uNq9fzWKax7u8A0Bkhy5z5IL7bVHGozcQ3gq0rCaTYco6EC//tkZtRO8ZZIVxlLZFgu0hg1Q1PJFujmd2g3I2TJu8UqXKNNlnshJEfLb+9NzxbsP8BX+lnZcE+NXrHzwHTPTthZD0MMcfbib44OKeRiLUZGVWNPYFOyDJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hz69Ixa/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hz69Ixa/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so776555e9.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683959; x=1790288759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrlZYOE4Tb+zUOHoD48b//tG3mcCRvsKdsWOXCdCJnk=;
        b=hz69Ixa/cGbfn71itYZOrfQZOMPGdnB1BZSeuPuSOlLeWGXaMg/awb/Wh/BrBqS2gK
         g1cQPFIste/CC3P8bbZAffZR9PVncVTtxQYVEOMQmF0MTGiZsFZVBZzGzG6VAk3GxsIp
         7aI+WEWzzT6nb9I2pjeHtvjyQ4xG4uXwppp/g9NgSuxncL1krzY5yZF9TY6FwlJ25dW8
         B+AJGRUwh9BXp7ju9EII30mtDs2IaagPMnP2qtubi6gAQWm8JdTWh9JBxLkB8uNC5MGH
         Y7k8jzRVKquK1MymytDQ8d/vcimjeC439d0K4GkyqepbepuIRCgLoykwXzzXURwccAn5
         aS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683959; x=1790288759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrlZYOE4Tb+zUOHoD48b//tG3mcCRvsKdsWOXCdCJnk=;
        b=vR6SlVwRc74ZGz0hsotyqQ9onjgmYCUykrsVfAmc56UMsO0MZBQxXQJtc+orHuQWe1
         4/BsYdrk1wqEYV2ANOaofXZNz5KDopufuxcSeBHmP1Rlbr6qPs24DF5XQSr5aX8HsmXA
         9fxx59zM4w31qyDYklBOyIaPaKMk/eKq9H7a059nknX1UMll0wfvyfvzYI2LwKeyEiN6
         54wAebitWUlGkvMpF4uNX4YaqFpsn+uBEnBy/rjz7TE7TSO2W7A1bWi//zPibmt3SHQi
         mLo9yl6gnqtxjgCnI6XEWXAvGmFykSjaAZATTZD4Xd6CsPgyAyftTOuTjGpaZI0IiH39
         20ag==
X-Forwarded-Encrypted: i=1; AKwUvBxEWI4ADB36ZuI8eyNUYjNLFSiMXqudxp3hOzhyj5WFi26EVlq2u3xRsbn+hvU3VbvVXW2MYn0CnS6n@vger.kernel.org
X-Gm-Message-State: AFuF++mscRQFZIJt2t6vAQ+uFHlgHsRbbPpccHfnO+omKE9VMhr3unCh
	cVUTOUFRIE8iQ+oP5kv/BlGrveqxELQEO3FOWDor2FUk4jOQ3LhmlZzT
X-Gm-Gg: AYBFou1ZGStJJyyeZAnFlv7aJTMwX9bW1VZNabJPdyD+6xcLmRZJD4/ctSZanBvybXU
	VXsmHnSj5JVa2AuTs1Q7gVffYVqtlA+uKDuVW9cjxWdDE7Pc1vh3JzkqYRPWWTqfOMCfOE/CFmL
	JKBKxHMskltfJ0cRoVNQpPGWCer3KAYP0gjLKFMMN7Tx/s7zm9yhMSbmu8ptJlwnb4psPflsLw+
	HFZUl0dgS0HRTdkgFjnW1VRSVg8G2j7beHbZRj2TmnE/iUHeDU3vjUqaXVjf8BzxrNqJIcL12cH
	WzugEo1EUMuXSBj2rIjzXKhDb39mQrnBzeFRjzQTWVX79Sm+T7LLMdles9oYg/I8xy6f8IHEQxO
	f7hK4DlglSSaLpYxpwz34xLcSqCtJaM6l6Ur6YeVkP9oJjULH2RcNs5NYGPD4IlzO8kp47ugVwb
	FDyRlC0YVoLiUD4BVnxi4rIltRavRWU7HoOe1wxx0hzfOEAiSzYYXxSVgQKf+wB6Xq5VaT8YKiI
	7yRmvDPIXtjwiZcGqsik7EjF4XLk8z6ShYyYxKZu3X++g3eeDQQ6h6NhqSU9oxFLOjpxGJ26ajx
	wgA32hibs9iisxfoMXONcw==
X-Received: by 2002:a05:600c:3b17:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49fc5737b80mr3154795e9.18.1789683958822;
        Thu, 17 Sep 2026 15:25:58 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:25:57 -0700 (PDT)
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
Subject: [PATCH v3 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Fri, 18 Sep 2026 00:25:42 +0200
Message-ID: <cover.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the Variscite DART-MX8M-MINI SoM device tree to
better reflect the currently supported hardware configuration.

The changes configure SAI3 in synchronous RX mode, add TPM support,
and increase the Ethernet PHY reset deassert delay to improve PHY
detection reliability.

v2->v3:
 - Fixed reset-gpio polarity

v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3

