Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792917580;
	b=jGhBvthZpoi0ixv3Hq1i/tjulcydpg16BGbvgrqJvGI/Si3dIAHVfqld1dr9YbAoApo6
	 coA6xISvko/CtaSWzzKH0r19dlWYkSDIlB2BVmb6w0GPJ5zqCW7jxeGlcVPIxyQgUUMy8
	 GZMyapSFFBmGkVmBxq4j9hOHGgFCVs98CfPbqmNGvMqbOJgDfc8TxmWLOmKZ+4r8exxrO
	 Yqkse2/XaQzDV09Yt1VB29Z3Z+ClqqJ+psfux1TPBdG76PdSNy492bD8KoqN5c10gQN4B
	 iASuXsXJtOO6g9YcG6XTPzAkqpX8+I4/lB5qf6szy7XokasUf1FGYuHQunqqWOvBLcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792917580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
	b=ObGEsStN55X2JvUAnhunsv1rE5EPlE5Sw496jyf5vbqoiOonXaK52EIZPs3Er1HwVATc
	 RjsLTuJyqDBTwh/HkjG51lJZLtS/2lYRqsozw1xdQVqzZxyIQ20MedpY83+QruZSi6NJN
	 nBXq5BbcATIBOV/vJjQWWsmP02tbKK/Ir1NPZn/6Kj9p8/bKdT0KLvmuInft7aFrhPwQn
	 jLsLQd43WipS4IEb58Gq0f4pUJWA3sH43IQy228bvp2sWdlAfj0vIHjZXhSvwB30fTQ3y
	 68GuQUxKhOKdAXMzci+qMpaeZ02y+ZAHo0l26wPJ+7jnTuM5Krng/U5Aa1L4vIzau0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nVowlhw5;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEBA606A31B
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DEBA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nVowlhw5
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1066826a91.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792917579; x=1793522379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=nVowlhw5w3749vHvseTxbox5D9wvDbWlmIxnJfFFAvn/eVTcQfk8k3Fxue/AN/xh6R
         h4EU2FwFyNUZW1U8wWQKfiZERuGQujIelOXPRLIw4v4ee9vXMcrvvxEPyb5hHfa3l6T5
         2L88KJ2NYZ4d739vkxgLtOki+EGyrjkqyza0rASP3m/WN83DnL0vK4Yxrfj55gUjav28
         wMP/1dm0vTncLzEKWO7JVdT+YwrMcPSBy6E27Vi/eDDbLEmMoeQKJ3v+g2H3Ngq1qqqZ
         qLr33BSEZgauVZ7CfdKsF13/JHZGlqd/AxHhV88Io5XOHMx7SSLbv9r3iOCO+oRk7ffN
         Ce+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792917579; x=1793522379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=Rsxnmq0K56vWwvNbcCEIDBqdUoBVr1keXfy492L8LLQqJ9Zy0xEs5zMJEzy4m7nngz
         pOgLg91pGiPiM8EGRmzSkVMy6hs/9omGsF5qz+/yd2Oyt4av8sDZc21s12oL/8Lp11c6
         Wsah27U//InHa4U7ijnCzHl+K/xL7UmZ28aCzjDRisIlYvKUiTndNaxVCpT1/jEfWN8Z
         1UoKIsEMgi8qPFQmMjxGwQ5D7LNTbjXwmztQkf8ePrNT5xae6Lsmxtss0WHI/GS+cbNm
         MFaln50jsmpMtXmDcCR9aKaYGewnxzF7zNftyDDj0kLSqjUApQ2FVjaRBjCOoikV+0/r
         8TeA==
X-Forwarded-Encrypted: i=1; AKwUvBxxKfUinizreCx0wcqlJXQd2f1GWAmhqu2cJt/72UT/2csUH2xDyFusEYqCopvbzwWtPvmdSxx5VGfq@vger.kernel.org
X-Gm-Message-State: AFq9FYKo9PzECRL3TAjibiakDiF2UkcMdtIL6tFOfFDT/LSyxCs3QIq+
	Cw29SEECPUMMteKJCpvpU88pzKaK2g6J+Y0BxtIuBp4zHHEivz0L0aJr
X-Gm-Gg: AYBFou3H2ZhA8g5XQ+8Re2UToD5gN/YMYLhCOvWgn2xSA4XreevNoyIwikJ7uz484AO
	7DGSm5InbsQy+jOJCTdN/5Dspc16vEgkhtnvxmr2R9zXL/uhTsM3eTgZBn2tx1N5fg4XS6KYk8/
	Mndl7A9rYAKxOvqxd/FjupMPVx5qMn5R8OZVkuEFfpmaUyjY5ZXPfyjKqIvuYw4rD5ywcN8Fbo8
	3DC0E5FwIoYJfNou+CZ9MAFYrdvbYVCQbYGBSuv7IQPU+anM5hWJNZbgU9VVWr8wK77qR3GoD4i
	4hBhae/8bnWGOV9Hfto4HrJKLepEaS5jElvr/n8TdNFFnEX3unDphnh7ghuTsqPnJm5C4XxT1x8
	sJMQUXFb0jjquzFXoa7jeJdhoxsi1BMOil+HnKJv/VlWZ5ZCC6oYwNYR7g99zIChcYcFNZfHjOz
	xPqIDpLN4uQTRO4GK8M8Hb6ieYhScIpHJalSaZrDeTOfAX14UOCbWIM/0nJDD4MfjKnQOFDsSYc
	lRViIVogmaXDjyLN7nfRt6chvFcoZ4+rJOasigQYiTL/M52HcSBA27kejzaJcx2AdebNNRDSzeH
	Xnaoz5dGNJrFzpQDXTYSNIPSAHp3oIUyiTtjTSiLrBpWW3qDM8bKZ7xLggf5+XOdVgfYpmxQF6z
	azIjkGM6cb2MhEDDKiA4VRINVzIO9u2Zl7P4=
X-Received: by 2002:a17:90b:5906:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3adead0bdc7mr3144482a91.37.1792917578985;
        Sun, 25 Oct 2026 01:39:38 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe69478sm4585051a91.3.2026.10.25.01.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:39:38 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sun, 25 Oct 2026 16:39:31 +0800
Message-ID: <20261025083933.26066-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
that stage sets up DRAM. This series marks the nodes it needs for that
bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
the PMIC rails and the SPI NOR in the board files.

The vendor confirmed that the BootROM itself does not access the
EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
sets up SDRAM, and DRAM cannot be trained without it.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series.

I used Claude to help read the U-Boot SPL and the device trees. I
checked the changes and ran dtbs_check myself.

Changes in v3:
- Reword both commit messages to describe the hardware instead of what
  an SPL does, and drop the U-Boot paragraph from patch 1 (E)
- Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
- Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
- Drop the Assisted-by tags, see commit 1e035297ffda
- Keep E's Reviewed-by on both patches, as the changes are the ones
  discussed on v2
- Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
 7 files changed, 47 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0

