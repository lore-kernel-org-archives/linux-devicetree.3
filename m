Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795680856;
	b=ivWKIrDJCxiuY0ABgMYqpeyqm7Me52hbq02eqUYsBTkUi4+JK/PKgi7fK9NvMwfEkQsO
	 Kyg4LLZwXaBFoqa/tztLhc8dj5/6ztxbfkQwUKxucBXvPptZ/ySnLD7KESXO4VRAxyTt0
	 M9MSfp6z9edN1OSunuZNYNmFNyagLl+3PIZjbtBiycqsu9z6S84ZXcbmrHjnFGehKq9dx
	 PFvfr7Z20lktae67SbonbbIYg655zhoDX6vAPXCUG2zO9Nbi/vghirrI9W4gZchxXEkLT
	 YkSdCzbJS2jKoeyDf0eKFqYXgVUOPgMP1JRnKEfd3qdAWJk9sfkSKN7qHCWv2eNP1Tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680856;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=sF2Sr35kHcjf+oLCfGmpIAXY2nvqUCh/oT8OJgrj4oY=;
	b=ZvDP7fsxPqmiiBm4+raAUDCMNVAhdr0QKr86opQzPj36RDm+YS7M8sFRbzaffJlpbhSX
	 nemu6sgEHyHuI1Dc6kR9dDjcDpEzu0UkLk8klp7nTgNNi0t5yjmAbdrcTlVtZ65XtwhPJ
	 dHA5nrtZcdfgtYbNX6EKZTIPwQkZK2chAXB/viiwpIBvyqijjnY5gWhp0DjPDUpUdnAf7
	 aKils5HxBsZl0rV8WGAYQScMOCV7xkMSGtIVhvoO+9kj5Hoxy0N9ndrsW/CN7fNgOrEvg
	 WcN/UjaEbGTj9s+AHpL5HICKefgDx/Clb1JcSOMzJW2e2rHpYUEimmXaY+P9fOEvPBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TU+4xLAB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7C606A326;
	Thu, 26 Nov 2026 08:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TU+4xLAB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795680855;
	b=pY1e3AwcObI90BJXQkyotoHPfNRoMvrmkC5pcEk9cxQa0Xb3AW0+YN8sWd0gb6DQkZ9H
	 lEhdfBtJ78v0K1xlQ01H1tGSr52DGeCKy6Jomna+PaQLCYC7yEnOAMzgGys5ugiLZPO8R
	 FgafL1NvuFLEQNjLp8UW+NBz17pEBRIllrGRtaXWS+qtZ/avLj4MM4LOE0Ap/PSRFzOuD
	 quZ6wHDCEfOo+1XoL0WgGtNP3CImmFk4gR7G6JcxIcPAU0BZLqL2sNvKRAZflKquJyucC
	 owd+NlpoRKmW/PmV8cwh0HO+7/yzX58LZKf7Hl3NyUgsInEMmjzdUu6i3e85ZbZ8bLA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795680855;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sF2Sr35kHcjf+oLCfGmpIAXY2nvqUCh/oT8OJgrj4oY=;
	b=icD1Njh5ndc40+OnBa1212yVYTl2EYRm6wX/WlwlolL3eExkj4PCxhuILc46xG9TkCAy
	 5ZiV6WCpEl6qF1c4Yrm2DaQfWu97p/yC0oaVp81gVH2urQ/8B0SOnZl6vG/M/JU0ERWkp
	 mS7jgG4PKNCIxOPUVlFbpCR8M5HJgjyQoqD2OCDfbAUNlbHqtbd2r+EB+BWQoecT4XFHF
	 r8coW1h5xM1THTd+qnbSH5RYI8Kcipqk3X0chQdfoR1OTn4iqinCU92mC+FfQ4mmjD+sF
	 a48N/uFpMtXg8KyeXfXAS+s6pRZxM7bDI86i2I/G07McFVAmTaQIVzCT8rsxeU0AcuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 965141F000C0;
	Thu, 26 Nov 2026 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795680855;
	bh=sF2Sr35kHcjf+oLCfGmpIAXY2nvqUCh/oT8OJgrj4oY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=TU+4xLABcSmlSq57mKKf+dsx0fGRAuiBLsQKf/fxupcrMBPwjiQ9JtmgM8GXQklwL
	 3O0PcuUBLS5+62pXo8eUyhJOn1Do8XtZa95vH7rW8fFKlJWpMoiiLv+P/CxGm2Ugb4
	 R1NzqbphWWieAGiuJz+7zry54MXwi5HEOZHUSAFjcSgSOBn6uO0Dt10e44imuubEBm
	 KCFQmxrDwrTm5bRLAB0/fLs2CCnbIig+Vlar/m9wrQG883gEzYsYOb1yMdnIrBTOS9
	 DFGR30Uj4kIpBPdrMa9PLDgBIccIISYl0G7XeEK6O6hRbpuxMGPo7n24qRO0N+2oD4
	 eWwX4vsettY9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 133544D2D9;
	Thu, 26 Nov 2026 08:14:05 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Subject: [PATCH net-next v2 0/3] net: ipa: add Qualcomm SC8180X (IPA v4.1)
 support
Date: Thu, 26 Nov 2026 09:14:04 +0100
Message-Id: <20261126-qcom-ipa-sc8180x-v2-0-89eba621da95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzqB2sC/2WNQQ6CMBREr0L+2m9oU7G48h6GRVs+UCMF20owh
 Ltb0J3Lycybt0AgbynAJVvA02SDHVwK/JCB6ZRrCW2dMvCcF4xxgU8z9GhHhcFIJvMZTdkIflb
 ERa0hYaOnxs775Q0cRXQ0R6i+TXjpO5m4PW7bzoY4+Pdun9hO/ESnf9HEMEchlZSlMpoKfW17Z
 R/HtINqXdcPpzxlH8wAAAA=
X-Change-ID: 20261124-qcom-ipa-sc8180x-c9f427ae24db
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795680844; l=2392;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=LPIY74EAuDUdSq0niHRQBOSjkztNa0/vNTUuA9b4jAY=;
 b=YMDZoZv3e8AeOJYNd4X9E3+cFgaEXfscnjeODtRGQ/nuWEheGaJFkGvn9u2PRcEYNzsDgb8TC
 8LZyBg0MSBuAMoeRnlF1GoVk3QIlxqRRQgawIVMouFd52M8hbTt4t62
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com

Add Devicetree binding documentation, IPA v4.1 register definitions, and
SC8180X configuration data for the Qualcomm IP Accelerator v4.1 present
on the SC8180X SoC.

Register layouts, resource group limits, and shared/IMEM regions were
cross-referenced against the downstream Qualcomm msm-4.14 poipu/sm8150
IPA v4.1 driver and SC8180X devicetree definitions. The corresponding
sc8180x.dtsi node will be submitted separately via the Qualcomm SoC
tree.

Tested end-to-end on Microsoft Surface Pro X SQ2 (SC8180X) with the
integrated Snapdragon X24 LTE modem over rmnet_ipa0 (QMAP / MAPv4).

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
Changes in v2:
- Drop deprecated imem_addr/imem_size from SC8180X ipa_mem_data so the
  IPA IMEM slice is obtained from devicetree (Konrad Dybcio).
- Omit v4.2+ SSPND_PA_NO_START_STATE and v4.2-only SSPND_PA_NO_BQ_STATE
  from ipa_regs_v4_1 IPA_TX_CFG field masks.
- Set IPA_ENDPOINT_AP_COMMAND_TX .tre_count = 256 to match .event_count,
  omit unreferenced modem endpoints (MODEM_COMMAND_TX and MODEM_LAN_RX),
  index ipa_resource_src/dst using IPA_RESOURCE_TYPE_* and
  IPA_RSRC_GROUP_* enums, and express .backward_compat with BIT(BCR_*)
  flags.
- Pick up Krzysztof Kozlowski's Reviewed-by on patch 1/3.
- Link to v1: https://patch.msgid.link/20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com

---
Robert Ijtsma (3):
      dt-bindings: net: qcom,ipa: add qcom,sc8180x-ipa compatible
      net: ipa: add IPA v4.1 register definitions
      net: ipa: add SC8180X (IPA v4.1) configuration data

 .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
 drivers/net/ipa/Makefile                           |   4 +-
 drivers/net/ipa/data/ipa_data-v4.1.c               | 354 ++++++++++++++++
 drivers/net/ipa/gsi_reg.c                          |   1 +
 drivers/net/ipa/ipa_data.h                         |   1 +
 drivers/net/ipa/ipa_main.c                         |   4 +
 drivers/net/ipa/ipa_reg.c                          |   2 +
 drivers/net/ipa/ipa_reg.h                          |   1 +
 drivers/net/ipa/reg/ipa_reg-v4.1.c                 | 472 +++++++++++++++++++++
 9 files changed, 838 insertions(+), 2 deletions(-)
---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261124-qcom-ipa-sc8180x-c9f427ae24db

Best regards,
-- 
Robert Ijtsma <robertijtsma@gmail.com>


