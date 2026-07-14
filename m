Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA88360ECF;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783996430; cv=none; b=SB55W043RE2Pft5cdxC0ePZjMU+6dNTxbvGrd4tC72E19AJn8PLb7iGtjOPxtD+k5SuQcvj4fRoji9qBanPsLHEL3VphwWsHJgdU1HrrD9G4I2t+Zit2sHvvM3fSFlUavdRvGU47A+VhVn2P+AYNhtQXPyhWoESfMJxEEw8zVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783996430; c=relaxed/simple;
	bh=W2d5QqQKBqxvLWMEJ0hRfu/NSeHdDzwS5lPAkyQg7Fo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GCS+P6bmaBtsmwo3Yx5F/2xDC6r5wxw62YytWx5KRSh/49vd/dsQS08sQdn6j4KtD4GHR7ylaGUDWOJK+18qrGgkJjsTWRM5ezngUM88s2naFGfuE/gTyYuLu/xt6Zah+IouHSBmU3+GB3YtWyZK8B3hyQ5nZO8Rp3SqU+dFKqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBlj2Ss4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBlj2Ss4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD879C2BCC7;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783996429;
	bh=W2d5QqQKBqxvLWMEJ0hRfu/NSeHdDzwS5lPAkyQg7Fo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OBlj2Ss4s1EEfrCDQ7YMfQdgcJUHk1pdQYeYa4XZg8V5xpBaitnR2pFSdKz6cVcNJ
	 jOfGSYvtyHbZDZnCOMC6jTLW1u1gQgfyNE7pmCyok5STdrZkpEF/L0Uapp4/me6zmP
	 QTqu0eBERkSbLFQMT9OsvpPLNSJtlGJGXUyiFjzqyb6Psx/zvlQIu6QIq1/JkGWeyP
	 pxKEMZaxgQ2sRXXN8mwjdv6dUaOtZ3AnZle9hQvra+q8yKZ08CiamEkky0145JWEow
	 i32/XwbpuXC1srDXtQWz0f3j7qoLCvJ4IA5l47L5dFXdFTq+nGmrIonnHH2DrTLAzv
	 8yeJm8E7j7ThQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923F0C43458;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] reset: support reset for Amlogic A9 SoC
Date: Tue, 14 Jul 2026 02:33:36 +0000
Message-Id: <20260714-a9-reset-v2-0-8df09b2f437c@amlogic.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAACgVWoC/0XMQQrDIBCF4auEWddilJrYVe9RsjA6JgNNLBqkJ
 Xj32kDp8n88vh0SRsIE12aHiJkShbWGODVgZ7NOyMjVBsGF4h1XzGgWMeHGtJUae+9GrhzU+zO
 ip9dB3YfaM6UtxPch5/a7/hD9R3LLOPOus55LPfYXeTPLI0xkzzYsMJRSPji0kEeiAAAA
X-Change-ID: 20260706-a9-reset-9c39e8fdb06d
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783996426; l=1089;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=W2d5QqQKBqxvLWMEJ0hRfu/NSeHdDzwS5lPAkyQg7Fo=;
 b=vmB7Ld+u4rGK8fGznR+ORfIF7/ETmJgoEKJcC42b6lZpNEmrcerdce4ToUseFpWx35+nXD8kF
 FKlm8kGfiIHAtxvzQq+ZEIcd7vrMWrC+ojyyDkzc/wDkwMRsE5Rtos8
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Document the reset controller compatibles used by the Amlogic A9 SoC, and
add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller, and add reset node for Amlogic A9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Use standard node name reset-controller.
- Link to v1: https://lore.kernel.org/r/20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: reset: amlogic: Add A9 reset compatibles
      reset: amlogic: Add A9 AO reset controller support
      arm64: dts: amlogic: a9: Add reset controller support

 .../bindings/reset/amlogic,meson-reset.yaml        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h     | 247 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |  14 ++
 drivers/reset/amlogic/reset-meson.c                |   9 +
 4 files changed, 275 insertions(+)
---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-a9-reset-9c39e8fdb06d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


