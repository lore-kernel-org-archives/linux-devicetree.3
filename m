Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8090734251B
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756083; cv=none; b=IsaQAQ5Q3hjQhdNcQxT3qZJOeNW1BAGH6m3y9j6A5DdEuIuQbOYPFjzCPQDKuLJpVF7hqb6QGiL3y2fHlBY28sVoyJQswMA2650F7Cb7XVKj4/u9pnJDcAxvgJ/6jL+T2m5E8+hVmZ1iSYoeBfUAEAOe1jCLmLdbRn7TWFuWbFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756083; c=relaxed/simple;
	bh=Zt1TyE8+pN0nTA60PquXXjjCy8hDKoV7fYuk7bAiblU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VIVaFGUW2mXu7SmY6/98rXCwdL7EyK9ST+Q7hCTX31IUT/ysmj/RHWlIyLZxuLzGUBw9kjLJFpi+tUxHuvZqTgpjOJa6NAeLqraHmOeR9IDDrb0bZqrfbjKV1Ox5VEPRjgkC1vNF5M1JQRRP4C3EF2VoOquZzHLQrPhXax7NH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ap0fPt/1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ap0fPt/1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3483896f8f.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756080; x=1786360880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE3uND4Z2avCBL2hS5rIJ6Hp23ST+cHbCiiTEUWZqK4=;
        b=ap0fPt/1QoIzPwcBpwtEj2x2simI4nEEQDH1gCYHEraVcXH2ZMNQXPXm+Hnf2VZozu
         t9tDm9xGexBIAhwVf7erBZGtXxkfsiAyUD2EuXtyZHKaa9N9GhwQ7QBZyxtyVFdJd6Ok
         axHL1GlLotaDK3k4tT52L+OSQdbVM+EdDvLClKV9J5mNBK2+TuJK+2IjxOhbMKRhHaCV
         yEo0HHZqAzLxYtNbUEqeCPYaPRg56RdMd7GJSAaUuWy85URxNhANgOkp7zZ2okCeHBnQ
         6kqW3NGKPEQqVTL5j81aApsYHyAY3Rn9zP8uieCSObrsqxXo1413phOsmUujfr9oQ9RV
         ONrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756080; x=1786360880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE3uND4Z2avCBL2hS5rIJ6Hp23ST+cHbCiiTEUWZqK4=;
        b=b0aDE70th607jsa5PtTZo9R9zpmrpksJ12lcZmCmwLBwF2ce4tqdX+8zBXfvIvkPsg
         qLhcwVdDng9MPGsu1wEp4G+C2RsOUMy6+hvyq5tyR2NX2jX2zmEy+xCyR9jRavYKOCik
         jxkxFCAuSeaZG6C+SdR/4ySL7KnCHPCxa7VrxHJWa895IegtOV+b82xaELgdo4UoGSqg
         belFOYg3Xty5zioX0bNR2aaNVtZ6/wJHl036bSHzVCjuVyE5Ny3A8lQp6pySOU8HdY7o
         mub/+51HvrahwhKRL7b2oudV8afSHQJmr5pSyLrKcYoEbyQaa6C9oPtSbpqyTPa1JEAD
         Zgvw==
X-Forwarded-Encrypted: i=1; AHgh+RobjLNS3qv5QlFKD7ixfcj/GvjkJxmqpyeviiW6MyCS/IQkZpa086GHciM0DDvFvyyBSio0+zc2VuTC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8DkXBhTnRHzcW+XgcwBNvZXfoh+lQBk4hK5whhK+B5LcxxRu
	fi4m/C2uRDM/3BsfH9USVdkKNKlxlP6xJ33Tf9CDuPez3SgQc/Tl/YKc
X-Gm-Gg: AR+sD12xwj3tB8il9KFLnENL/NGWFAlzY6IOrSFQvPti14rwMu+LC8mat0wRzsFp6d7
	jsF3pSJvugQ2XGYgvpLFyMn/GepcmtElYoMyqwLJPJ2QwFsvIUj+BD5fwtVSqXSAmsbtYbfzyox
	o6i2SmE5+OX03y56VaCFBU66J4fHvfJ2xkvMtLWEB3XO3CpQ+v+E48vy3xCaLAsPebM4Ta0t1bq
	+ks5qvgdxNo4pPeVEWgVncgb0VBjW25PnCNSd5/GZvc6P88aje7OBClu2AsdWP52JBYxBD6ncEu
	eTeyPlWN0C4h5Gg4qV08uGVk4k0b8oKWQmGqg85PdTeYj9A8UaE3mVweO7ePbza4uVAm0yu1h/q
	Ix7XMl25NwP1eUJHgMTRgyI2tQD4vppOoVwHXIkzaBa2PMllwrgb217LQsB4fcNWRY9yzzknzpY
	6fAyyyzfZmNWXcBaoQQx4f/ldfuk2a9kmEp4n2mz94qOBXqUSZssYMlMXbcim2qOGfFRWHIlQ=
X-Received: by 2002:a05:6000:2483:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47fd72c353emr23278471f8f.24.1785756079458;
        Mon, 03 Aug 2026 04:21:19 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm34154913f8f.27.2026.08.03.04.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:18 -0700 (PDT)
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
Subject: [PATCH v9 0/5] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Mon,  3 Aug 2026 14:19:01 +0300
Message-Id: <20260803111906.1931384-1-tmaimon77@gmail.com>
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
The second patch reorders timer0 and PECI so the APB child nodes stay in
ascending unit-address order.
The third patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device
tree.
The fourth patch cleans up the pre-existing NPCM845 EVB DTS property
ordering to match strict dt-check-style expectations.
The fifth patch enables the NPCM845-EVB peripherals, adding MDIO nodes,
reserved memory, aliases, and board-specific configurations such as PHY
modes and SPI flash partitions.

The NPCM8XX device tree was tested on NPCM845 evaluation board.

Addressed comments from:
        - Andrew Jeffery: https://lore.kernel.org/all/22ecb2fc6f4a4ca3c3018fffba8a56bcf5ca89fc.camel@codeconstruct.com.au/

Changes since version 9:
        - Modify dts code style.

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
        - Drop the unsupported snps,eee-force-disable property from gmac1.
        - Rework the FIU0 boot flash layout into nested fixed-partitions
          under the bmc container.
        - Keep patches 1-3 unchanged.

Changes since version 4:
        - Split the timer0 clock-names cleanup into a separate first patch.
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

Tomer Maimon (5):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 721 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 441 ++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
 3 files changed, 1149 insertions(+), 20 deletions(-)

-- 
2.34.1
