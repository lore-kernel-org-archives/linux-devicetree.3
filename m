Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843189;
	b=QEvY5l0KePiUfzSEDxEaHWWqfSSO2rCQQlOmxO5rMXCLoHNE4lhF8xO3fwtJ0Xxe5vRr
	 ix83JjE/MKsfD1309RX1xrB/Dq6Yn3xnw/iB+42Rd4F+AdLY/vp2DD1wbRard45btVcrx
	 kg3aAw3aIzOq804Zr6v7C2GPi9GRiMbE+pMqKASGcxBETd7zwV6YK0Pz6HgVRBQU4pGYC
	 E7EcbxfeqBq1KA+lqZcgaBgzLfZiAVxCgIvoTbtINWTiw9RAaCiMF0QhmSVQdErvTv0kv
	 ArNO8pYHzSJLNxVtpwoLU3ZpFWNIhpt3AHvEGFt6N+szJxy59RW4sssdxzDDhofAMjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=StVqFurT/wQrRDKjt1hr+U29vy1fhAKDYGXtf7ZTQNQ=;
	b=nyh4iZc4OIUOi9UuN+409d6cZPy9VzDouLPu1g++MTckqhFZ4UuaexIZsW+EKSwfplN6
	 6Qwo0FYd4n+JdEMknOfMPmoEUsEk1NP6jMa61Y7N/vuleRW9XPS7b28bZvcwZuJmfGAYX
	 LHCa16xDIpcWnTJHKkAXmVN7qvNoV28ykKj+GGnsjGgq0Pw1jdV/X3e5U0pFNMk4C+WO1
	 0yWvVcJ/+NHJO7v/Ckb+hT1STx8LEsTlrrQ1uHkiRPinVoNpF45XbVVM3Dzwh3aMPW6HL
	 vuyDh0VehjBgO3b/C7Wdyno987M1VrBZzZ9mknfklTr1802SIrom8TM/sJqlUhADUDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=joM6uKyo;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D285606A339
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D285606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=joM6uKyo
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4910b863b84so2585212f8f.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843187; x=1795447987; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=StVqFurT/wQrRDKjt1hr+U29vy1fhAKDYGXtf7ZTQNQ=;
        b=joM6uKyouT8sPrX51vhCW9/0H0T//6PvlGhtPq11U+ncfMyXfcPZRyS9D842iZpDqu
         puYYGhCu+LjC1pJxdlYrnh5hD6JMJanBaL+ErfSsnqbUktBgNlmDokWPw9KR0bu4w4sY
         Wd28TjVzQeF+QM37PPAkiSE0NdfV9A0V92eIxhEPJ0MehBei/UCQXVgfT1GmTaD6cAVr
         Gt5fEEmOsVNVG9k/osNDJjKh2k1M8WmF559w1YA/OeJpcf6IDv03uA+SxPoE7zTdC/ed
         bFAG4x0LaK0KkJ6be7x710jwrzNJLoVCzdjIuSCmWdxweFfxmS6Z0JcOAsSlf1E1U4Hs
         kWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843187; x=1795447987;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=StVqFurT/wQrRDKjt1hr+U29vy1fhAKDYGXtf7ZTQNQ=;
        b=b1U6cZlHVqRs1uUvDZVPZfFysge1tIz+Nv1C6lapcYPIud6+uM2BlAYo31t9yW/rKH
         el/yM6lvG5MOCwARmbHudTXjyi6PkHU3sqNl3WdKkpAhTXqtkGe4AyeQTFfRaJkHALHt
         C8TCfqB6eUwd+tbPW78VcieM5Hmm2uZ6drFOXxrOAPRaBjywjwl3LGC6fFBALNjtqhwN
         OOFz+8Wz1ittW3EBQI6j36OvB3A2kVzOtAxhp4WoIBMHtz+Ape3tXCVLAQbyBCj6nbOf
         VCWDpewMvsR6vXUyBU2YzuW1I4F3IeOPIQEv4gopjkH9RzREtSDApIafFPEXqf7v6tDP
         fEwg==
X-Forwarded-Encrypted: i=1; AL+hErGK1eptA7GOmgHHnebO94Ti3PkfFBcXQ9ZYk8uUvtQ4t5Y98OzpER9kqdWiOsgBHheOBLtbhhpypv0h@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sx16d6VjrMfgrQ+31yeceMU+9DrierwVMGD8vQRMd5uJ2KdA/
	L67VpHwbVZMk2sLXhkPE3G1ELp4CzGWo8k5vet0NmlBqg5opSqyCYdH/cd3e+Q==
X-Gm-Gg: AYBFou1QnoF/2bj/0Kbn6HRT5RLEep7V/tmRNFQtRDKRp1qI7maJ9DpqmJUZJgN+1fl
	QrfDQD7vAUdFzkOAdBwtpbztyMBoMQ65DPkXoD6h4nzES4IYOFxM+4OQcdQw/3HLv0VvbqlHPkS
	Y12Lu4FWpJznc8i8sTrRN0L9k1TCA/a/O7Cmw7lvgbipFrUZWoQewcWoLEPr/pGmkQT4F5bEa5M
	ZOIp0tody4a8535i9Vu3/Xe4HFfDIv7l9G8husSlFoyLlYl55osiZcXhTfKUIUHUmpQWBfYrVNQ
	0ynC8wSOpMlafg5/SQ9st8YbtDISGpZMJfcAVT3Ttj5iKU8YiqyCpTpREs0WVCzMB+NdJxscPBS
	3U4cU60MZ5nWFzYE01qTcOnnbpllRrzjLmaKqqppDf+tl3Xf2CFfKOlh/H6VC/OuzUlHVq9E9+h
	fbjQV21PVGXt7lwUoxvOQXeS1KJfSB7Iv5QZhyQy+9J4V2s8f+4v4TtR8sU9jQXyC5HvsO6hxeT
	DnFGpy2XnoxTyFeRoMXKBg+GvbqsXh8uD6gkb6YAj/x7PvEJajPoVy8Rjixelvdq8ut79Ij7rWF
	aupEbLKY5yysjRoWytrlxoJU23A6vdpt5/wQzosXM5uhrpCeDmxQ5OtRgEpObT2e2A==
X-Received: by 2002:a05:600c:4691:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb5e8c13e4mr203665575e9.7.1794843187061;
        Mon, 16 Nov 2026 07:33:07 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm315407665e9.11.2026.11.16.07.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:33:06 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Enable Renesas RZ/G3L CANFD
Date: Mon, 16 Nov 2026 15:33:04 +0000
Message-Id: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIADAi+2oC/23MSwrCMBSF4a2UOzYliZqiI/chRfK4aQOalFwJa
 snejR07/A+cbwXCHJDg3K2QsQQKKbaQuw7srOOELLjWILlUQgjFrI7e3fJn2t+Z515ZrQ5aOw/
 tsWT04bVp17H1HOiZ8nvDi/yt/50iGWd8MEc04sQH7y5m6TNGJE29TQ8Ya61f0ETkUqsAAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794843186; l=1116;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=1E9jtcPKoXKYQWT8BUmqPghEaqnxjRl4UbnqpWuP5OQ=;
 b=rCN7b4yqOJoXWhXuPRSc93S6eqjMojRN6j1QL7sMvLhQtRLpIOzJGCU9jJnyzGmS2UMqPTJV0
 sK1sIeFfukYAI6m0hjVG6qMxoxNfdWeFi8wuaVhjmvWsAPBCOKCmiaB
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enables CANFD channels{0,1} on RZ/G3L SMARC EVK.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped fallback compatible based on bindings.
 * Retained the tag as the change is trivial.
 * Reverted the order of the SW_DPI_EN and SW_SD2_EN, to match the
   signal flow order.
 * Added missing check for !SW_DPI_EN in standby-gpios.
- Link v1: https://lore.kernel.org/all/20260921131951.187981-1-biju.das.jz@bp.renesas.com

---
Biju Das (2):
      arm64: dts: renesas: r9a08g046: Add CANFD node
      arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 43 +++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 46 ++++++++++++++++++++++
 2 files changed, 88 insertions(+), 1 deletion(-)
---
base-commit: 52f785639824bf2386d20ad8735f9792b81d818f
change-id: 20261116-canfd_rzg3l-f0f6ca64aadf

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

