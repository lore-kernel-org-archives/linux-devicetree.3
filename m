Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864A63F1670
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703141; cv=none; b=jWBnRsQYBaxhEgCxuDVgC+JTYdhmdIrpuVv06Z9me7IhUXdyTwnPvXq87LIqZ4G1OX8sypFGF4Ei4DzSFpH4PYpPmCIZn2TB4cfYbRQ0LloGjjIocXgnws6Zq7C7Vg8NfcTvoSbyfhyTEGtxcp8cQghboIcoUIO1UvwWmnQtYPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703141; c=relaxed/simple;
	bh=Q/U2yDFLyWZwU8XHHIHioLhnMV9QliHA7sS1beu8q/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cOg4AAv7RO2pKiGN12ES69F2Z3vZi219cyvpQnBnXMIZESGrRcYwiqSIB+vsTnRu8vMyOghxOeT7JMQPM/zjy+vtDeTQfQq/kUyPkxH71gYwP1tt0HiTcBd0nGpwhYaDiYXQHdaUS03iOYk/7/ApC+2wY0WwEQ6OCXPtFXNE4qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2YZ+a+h; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2YZ+a+h"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49222b6e871so42356555e9.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781703139; x=1782307939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFTX+AiRaMQbMH9lj/OuYWyjAe3WfpdoaTeBbXZUDPU=;
        b=G2YZ+a+h47oH9btEmux/BcqI4PxQFFjLnUMHol6jqveJmk4Y2z3WmzN6ajRFnXmb/R
         3Ml9Qida+NIPreDxXF5OJfa4xAoCRZ1MJnbkmL9qv99Nz2bvLt5KRVzAbkmJNtr6YuYi
         7SZAd39Wn6oYkdRrv2FchG4VNEWMLfeZ1s3GVlP40kZzvriW9WsYs1YPHbVahqbt1ZvE
         N6Qpk1cKgKc5VldMn2cQlfjrPPrhMz0cZLcCdRZx43QHCcrz4/OaRw00HdI4tpZDXIY1
         LhIrTioauIZjxH7FnAZSRIfflfnSObi2LaDKcyiZCeghqFqPSdiG2bwU2gqS7HWO8iEh
         1WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781703139; x=1782307939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFTX+AiRaMQbMH9lj/OuYWyjAe3WfpdoaTeBbXZUDPU=;
        b=XZa1HK7SdHHz/LinCDbxFq2TbUR5UgmD3mtMccZX8/klhcmlbBvCJKTKl3bQuhoi2K
         Ph81Idafng2bxWffCT44I3h/DJ2Z89tdNZq3pAU17zPCxykgKlWdGAtsS+Y0CEY7GO/P
         hQVSU7USfoIO/I+guLJRASA4tqSQr6af+d54pp6Y6yJLgOpJ3SJz/vInQSsehNlj3uDm
         waZvhHWMoZRHlHqtmK/e8+8SeEVrqVoJq/gS2Lti9jDWPqKiKkmzf0GzDIezPGzZVQcp
         UXFAyWkBHcBxKBaPxylTxUhcY/YOl86q9wr2JkmEegdOma1iJ3k37GKQhDWY0xAwxJiV
         LekQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GskVrvLZ5/nkzS6ylw1jmZlVJZfS83e7KL0q+bsXwH8dA0g2wbX0h9wORF144xlVOtDu2y87Hrs2m@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqoXVJJyGoeWhhea+dauHKyplxZM/QC/q/OCgtccyse3I3u9K
	NPKyFdWDTeZRCHGdiICGiKiYA24eBZRQaYFtNO/wr09C9Ko/+LtBY80V6KuJLA==
X-Gm-Gg: Acq92OGpqAKlGGSKd1w1CGBEZvETeB4IX/N9nBq+k97W0Zlfeh211jEB9g78pNUZM5a
	0pkmFoBYEZ0s+tR6xWs4M8QH6NnRT5jkxbVcsRPEq6q4l3Nw5VT9f0FWQWaZKis1zgabplU/h7f
	0ZB5jqFpXCRcAwz8r4j7aPRT5bUlU9SvbTMukCxE9akokPfdd0GK7bFcM/agKyjo7biAv46Ml/C
	LfJ6nbYFU02dfzfAeKNq9WGm8vOMzLCVNYUixtctgsq4S2eedc5RgTSg/7B9qWZpGuhYS8khMRr
	8iJwIdGYVAZ9qjYCoxsXRGQKruV4bKkJo5zIUyMsyL+ztXR1Yozyaj4nl4jhbkqIAQd35mzXzWe
	yKFyUUZjX0WZn6PqoP12znHwhp0QVmMrlxxoy6CNX7EEGOWBKVvfyoEmD3VC+At5Ux8sJhch9Qy
	X2wK7buH1yp50G57rtICp90oU=
X-Received: by 2002:a05:600c:8a1b:20b0:490:601f:d776 with SMTP id 5b1f17b1804b1-4923410091dmr42265145e9.3.1781703138441;
        Wed, 17 Jun 2026 06:32:18 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a0e9e4sm147795145e9.0.2026.06.17.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:32:17 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v6 0/4] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Wed, 17 Jun 2026 16:32:08 +0300
Message-Id: <20260617133212.287768-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series fixes the remaining timer binding issue and adds device tree
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation
Board (EVB).

The first patch drops the undocumented timer0 clock-names property.
The second patch reorders timer0 and PECI so the APB child nodes stay in
ascending unit-address order.
The third patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device
tree.
The fourth patch enables these peripherals for the NPCM845-EVB, adding
MDIO nodes, reserved memory, aliases, and board-specific configurations
such as PHY modes and SPI flash partitions.

The NPCM8XX device tree was tested on NPCM845 evaluation board.

This series depends on:
https://lore.kernel.org/all/20260610121822.2524634-2-tmaimon77@gmail.com/
https://lore.kernel.org/all/20260610121822.2524634-3-tmaimon77@gmail.com/
https://lore.kernel.org/all/20260610121822.2524634-4-tmaimon77@gmail.com/

Addressed comments from:
        - sashiko-bot

Changes since version 5:
        - Add no-map to the tip_reserved firmware memory region.
        - Drop the unsupported snps,eee-force-disable property from gmac1.
        - Rework the FIU0 boot flash layout into nested fixed-partitions
          under the bmc container.
        - Keep patches 1-3 unchanged.=0D
=0D
Changes since version 4:=0D
        - Split the timer0 clock-names cleanup into a separate first patch.=
=0D
        - Remove nuvoton,sysgcr from udc8 and udc9.=0D
        - Rename apb: bus@f0000000 back to apb.=0D
        - Rename spix-mode to nuvoton,spix-mode.=0D
        - Keep cooling-levels as 32-bit cells while encoding fan-tach-ch=0D
          as /bits/ 8.=0D
=0D
Changes since version 3:=0D
        - reomve tmp100.=0D
=0D
Changes since version 2:=0D
        - Fix dts warning=0D
        - Arrange node order by ascending unit address.=0D
=0D
Changes since version 1:=0D
        - Fix commit message=0D
        - Fix dtbs_check warnings.=0D

Tomer Maimon (4):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 721 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 417 ++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  11 +-
 3 files changed, 1130 insertions(+), 19 deletions(-)

--=20
2.34.1
