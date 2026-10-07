Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44088391E6D
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358015; cv=none; b=XTwBDiwOpFNJgC1927eezllt9Wab5/+OLz4/VUpwh6D2Zy+mNqSjOP9IfuWhrN4U5Xx0FeP3c0Z11OkPDbMwxVtU5GcwPBK7OC/eikAkg3H9QIidXHdJaAYE1AT0yARNMhIrPmVXIfVEWpiwmuCgqKHjVYLqskAIbdX9RSFi5BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358015; c=relaxed/simple;
	bh=1JFQJnNJb8HOzAJcaEyU8N13syfiBe5jP0AHNIkfpdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fqropDWNJLOXkuB5lkF7a80Q+KCrXRXB4LWNNWpnoJR3NJSr8uT9w/4mRYdtkYQeBHptUuOgEgiUtVvArSzeCGGt1qullbmdlBqFGxNS6rpC36PlMkdYf8UpQZR8h7PWxQpM0c5agAEOKk2Cscn08Onp6Cuow4xwwMaoVEF4ER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRfQftHD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRfQftHD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so14097405e9.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358012; x=1791962812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xc/cMb4XXA+asGhPB5InH/DIUsg9LCc2YMy7yfxc9os=;
        b=hRfQftHDw5QhSEGI1CpgzG8h7nJX08b4SlC58sO/aXkNfUVpHBtNgmY+TIfZUdp1ti
         qgM1UN+eh1dSYQCnCimBB3cO/hyKfJmkU56QsGwUKrOIsWprhTPEN9dV9ABxMzM1iYtO
         X1tb31+RKY0ktwm/fTX43QGISly+us/ZMVZzGaouUb3QGoAcZrm1tFBxBogbaIIPboE6
         05zOqbzy4PjPeQ3ZH8ZdEDO6v/RSU8fohh/H5oUxLvFWwufLy62/4ubYyfFUwXtOXd5s
         CUrXNFWs1G82FoqSBiOIeVwGojN40xxLDZI0fdb4ToFrLFj17tw0JA7UoGtrZB0YPNpf
         /NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358012; x=1791962812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xc/cMb4XXA+asGhPB5InH/DIUsg9LCc2YMy7yfxc9os=;
        b=kTKnPXXZhGxvBpm70DenBv8hXaweRglBd8eWTN7CIN0eMqXlfcdLPHzwdzwUghTUIe
         KaR76HQ5mxJwWeQWYVV7NCbiwgs4ycNey89bIBx73ZiS+1oTtJ87BzeCnsUMsR4/Io/I
         5hH8ydZt9wgS3A9PiNaRrTMACP9KcQk0J3zmYr8+jWWWWBJK8Tn5JkaUj/mmU2uhK/FH
         b4Zcs0q8fMe1DMbGmtVEwgzBmafCB5amnAn53gvnzGGu1qfHScQkZFzVwACQWSsfwUbw
         BkrmNr8Y3AlxMzQBoO1cP+YgRLMLbwrx51AH3Jc8YWvMK52jFTR2hSBLt2o216UWy2Oa
         kTLA==
X-Forwarded-Encrypted: i=1; AKwUvByOULiPSqqGHulXlUwhLFEbOEbsFQTw7GDURIHuM4IOGhL4qrYprgxHvsIWvVKq/vQeKdhjAMNIHtBi@vger.kernel.org
X-Gm-Message-State: AFuF++mbEJF7AO2SvnyUxYHAcjbhQO4H0x7tCYOzGPxoUwQRKhjTbnDK
	00WXLa4f0s9B7p7SanfIG06sa4w8gIkaSCTC5Vts/HEDeukxGuK38DHB
X-Gm-Gg: AYBFou2b3yiq132dw7+H01sUbLm5OOiM2ay1TCBM6g1aflb5fPKjbEFjIDaOfnBhnho
	GcQqs3LhW5id8fVGE0RhSni0dPAYaqhwWVM4QVQyqDXQxO8+qwbkk7cZmJClseP0vQm9ds465hj
	jPfb8g1+r+89a40sQw0S363CFODFPkcluTLVxSku7iNtjOaMb6v+lz6Dl/IHvNdWKdpY0gdyPkx
	iqyGkt9uETejDEKiE6R8ZEczs6h3alBzovF92ruWgXgeJGxsi8X1WcJk1aq1JN4PJHMrealFcHC
	MIR40iceLwd1dGaGWz1Q9k/RUSVmopaUBOeUuwpu0wSKIdLmedTA/+A+hOOv2McMq+6OXO2KveD
	500KrrfUZ6hLSkqj/RNoqt6I2L0BhLYpGOcDAG8C00a5i4EazhbEUiUe+BxMTaQ1uFc3VMQQfXf
	9RJz/iSrnbGco/2aivZsZIqJUYxRbS58nvLb4PxOOZS71jLpS29DxBX7vX77bP5jV/nyCbRNErD
	NFwW23Cq9YJarIIV6s=
X-Received: by 2002:a05:600c:524f:b0:4a1:6d35:779a with SMTP id 5b1f17b1804b1-4a1800d1ca4mr18145295e9.3.1791358012318;
        Wed, 07 Oct 2026 00:26:52 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:51 -0700 (PDT)
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
Subject: [PATCH RESEND v10 0/6] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Wed,  7 Oct 2026 10:26:39 +0300
Message-Id: <20261007072645.1618147-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the remaining timer binding issue and adds device tree
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation
Board (EVB).

The first patch drops the undocumented timer0 clock-names property.
The second patch splits the two APB address windows into separate bus
nodes before any peripheral nodes are added.
The third patch reorders timer0 and PECI so the APB child nodes stay in
ascending unit-address order.
The fourth patch introduces peripheral nodes for Ethernet, MMC, SPI,
USB, RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC
device tree.
The fifth patch cleans up the pre-existing NPCM845 EVB DTS property
ordering to match strict dt-check-style expectations.
The sixth patch enables the NPCM845-EVB peripherals, adding MDIO nodes,
reserved memory, aliases, and board-specific configurations such as PHY
modes and SPI flash partitions.

The NPCM8XX device tree was tested on the NPCM845 evaluation board.

Changes since version 9:
        - Split the F0000000 and FFF00000 APB address windows in a
          separate patch before adding any peripheral nodes.
        - Add peripheral nodes directly under their final APB bus.
        - Renumber the timer/PECI ordering and peripheral patches.
        - Renumber the EVB coding-style and peripheral patches.

Changes since version 8:
        - Split the EVB changes into a DTS coding-style cleanup patch
          for the pre-existing board file and a separate peripheral
          enablement patch.
        - Fix strict dt-check-style issues in the EVB DTS by reordering
          properties and nodes, normalizing blank lines and continuation
          alignment, and lowercasing hex literals.
        - Drop the unused tip_reserved label.
        - Keep patches 1-3 unchanged.
        - The remaining refclk unused-label report is a false positive
          because the label is referenced from the included common DTSI.

Changes since version 7:
        - Move timer0 to keep APB child nodes in unit-address order.
        - Add PSPI to the commit message.

Changes since version 6:
        - Remove IPMI I2C device.
        - Add FIX enable property.
        - Keep patches 1-3 unchanged.

Changes since version 5:
        - Add no-map to the tip_reserved firmware memory region.
        - Drop the unsupported snps,eee-force-disable property from
          gmac1.
        - Rework the FIU0 boot flash layout into nested fixed-partitions
          under the bmc container.
        - Keep patches 1-3 unchanged.

Changes since version 4:
        - Split the timer0 clock-names cleanup into a separate first
          patch.
        - Remove nuvoton,sysgcr from udc8 and udc9.
        - Rename apb: bus@f0000000 back to apb.
        - Rename spix-mode to nuvoton,spix-mode.
        - Keep cooling-levels as 32-bit cells while encoding fan-tach-ch
          as /bits/ 8.

Changes since version 3:
        - Remove tmp100.

Changes since version 2:
        - Fix DTS warning.
        - Arrange node order by ascending unit address.

Changes since version 1:
        - Fix commit message.
        - Fix dtbs_check warnings.

Tomer Maimon (6):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Split APB address ranges
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 731 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 441 ++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   6 +
 3 files changed, 1155 insertions(+), 23 deletions(-)

-- 
2.34.1

