Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37267360ED6
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931332; cv=none; b=AdsSAVwIIJePYBqDikBr+5MgYHDmMQlTw7t9XpA7w40WzFTOUUWx9e0/JCkT91p5U7G5L2L5wZhruawR1oh2jXaj2rkpNFbxE2gHPBeUpERrJSqqU7cmC00ZFCKL0aPjHNwQkLkxlkWOZRXfPNX3bYIfBm7WuRtI4isucEpisMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931332; c=relaxed/simple;
	bh=csZZhW2kTQDC7OmCQK09jSOUeljVKRXJMg7XkzOcdAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lzoxvwn2YVg7/hHQKB07a7VeNRR1l4PAy2E2xa6eUMQAdcrNuidiXd7RjEnSA4ppM1ByUo/UcaXQ4kjDCgraoAowoa09v24JUOu7t6S/PNZaBp+Hn9LwnaRFAYlLiJz2d4Epy7rO8o6CCL68evAyou9onGhGVmo//2Q1+M2Pjwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9IITnGG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9IITnGG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d58efc7356so11236115ad.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931331; x=1788536131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQup+UUtgEL0yAVMr8c4LZuaauGy5rlbpwT/5caEB14=;
        b=s9IITnGGGbMH83F3qNM3dRZ18d3Ovxh/siPs3/e7XeUC46rzDZnoOJy2o6518HMAgd
         IocSsgJgW24jRFtjfsDpeywkR8yEYWa6fkP8ii7HF5o3mIiKByxiU6Q5HdjstoyaEYn/
         6K+dgPyDSdsJfMokeUFDaFJG0T7OuyOZF6UqgNmt3qRgERIkX15xItEpjwQfJiaYhkVy
         0ZTSi5KuI0ySH5sot6IZGLSG3MTRyzT9qY4dWx9PFyWKgemFsE2KrxRUE1aVUgan8lnY
         CFkil7nHGVasUyhKkT19vgbVv9BnnuA6cPnL/ZKqSMinHAIfjK+i01Cf9jNZf1IX8Yrz
         SILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931331; x=1788536131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQup+UUtgEL0yAVMr8c4LZuaauGy5rlbpwT/5caEB14=;
        b=V8G4Kr5UgavF9XA7xqxuGqPdc4hCvE4625iqqrpYekArjBkn7evc2FcJLHxRZzJOlJ
         qgoryxKWz+2oLVFOIDe8qAqdtxFo6bbnTx844aMUG4DaXeo8PdmIyNE39XV0vkpF5KJB
         H9ZLF1bqz/tIA4e2F4EnkNNspEqxgnkDFLdZzXG2BorqLknLlGWOckkRFvoQpv1DRNE5
         WhSFglJJCOl0LWaatL2S8vPhJAEThizSnbwzyMjSeCJo71JxSULSmFccpQ0lSU6B34/T
         /JqYpWdIJzeYJlEqzfKF891snE+2LsNyfiw7Vh2yGENhZIOiSkGVlx4KFHVG67uejzME
         O5+w==
X-Forwarded-Encrypted: i=1; AHgh+Rqrg6RdkALCyWkZwIp2iVXhJt1AGKSViJ2Eg06xL1JJ/dBB/LeoGmUbPZoL7wunBH1QsiZKBxphk8S0@vger.kernel.org
X-Gm-Message-State: AFuF++nUsPB/jtem/LHPuXUrDqS+iACZ39EIC3lZ62fIvnX4EwwD17rd
	+Dgg/Cr6GjMJqP99b6WisHWozoALH48ams8rw0NElbEkZ3TmUepBi+XH
X-Gm-Gg: AR+sD13pW34XcnMpfZRRIEsLMqrqUKvO0Bst2yQ35FklWoArjTK0T1/Neqk/XBtijin
	o6cOFEjWmvjYZe4cL8aLmKTIbk/tSVHOLQZHNZ/1owIRsZvTa7cb1uBEI0yMdOt+h6jcZrCffc7
	r2s+AscBCkWs1qUd2wv7rl5S+Des/5diko8GWOp1zKp0CpzR6j8ddCxA/333UP7OCRg3QMmhF5W
	HzZVIUN9AdvscKtYRnOH8Q4OiXrlAxMOp1c/iYhEx5OJWxdkGhtZmHM6Y1OMPBJDErgXsGnj1r4
	Yv01elv84oklxGDFfObL2eRKMAnOaQYa5ma4mctawSrjwUxIVzu68BKhIdqg9/1vwngD1QEd5PR
	y/9zJ4HxTPliQLWqwykxrCc/VfKtpAmEighocBWOwdlZHVG5XZ60dnQ/CaSt6CH4HZ69JxoSdoo
	EZQY2YInjp39Fh/uX6e8xuI9NYKLEljMGHuxLqoMC0EMR/aoZ+xfqDWV6RpG8KE9xAzYinQDp/9
	dhMETWeY+8=
X-Received: by 2002:a17:903:286:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d74dcbe867mr167466245ad.7.1787931330475;
        Fri, 28 Aug 2026 08:35:30 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([157.51.224.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm6256824eec.23.2026.08.28.08.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:29 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
Date: Fri, 28 Aug 2026 19:35:12 +0400
Message-Id: <cover.1787931313.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EcoNet EN7528 is a MIPS SoC that uses the same pin controller and GPIO
IP as the Airoha SoCs, so it reuses the shared driver code introduced by
the split into per-SoC drivers. Its register layout differs from every
existing variant though: all IOMUX mode bits live in a single CHIP SCU
register plus a few spill-over bits in IOMUX Control 3, EJTAG has its own
enable register, and every pin configuration register is at a different
offset than on EN7523.

It also differs in a way the shared code did not model: only GPIO0-GPIO15
are wired to the interrupt controller, while the driver assumed all
AIROHA_NUM_PINS GPIOs could raise an interrupt. Patch 1 adds a
num_irq_pins field to the per-SoC match data to describe that, bounds the
interrupt callbacks and handler with it, and feeds it to gpiolib through
gpio_irq_chip::init_valid_mask so gpiod_to_irq() fails up front for a pin
that can never be an interrupt source. All existing SoCs pass
AIROHA_NUM_PINS and are unaffected.

Patch 2 documents the binding, patch 3 adds the driver.

The series is based on linux-pinctrl/for-next, as it depends on the
per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
phandle that landed there.

Tested on a DASAN H660GM-A (EN7528, Airtel), booting OpenWrt.

Changes in v2:
- 2/3: move patternProperties after properties, and allOf to the end before
  additionalProperties (Krzysztof Kozlowski).
- Rebased on linux-pinctrl/for-next.
- Link to v1:
  https://lore.kernel.org/linux-gpio/cover.1786262697.git.naseefkm@gmail.com/

Ahmed Naseef (2):
  pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
  dt-bindings: pinctrl: Add EcoNet EN7528 pin controller

Benjamin Larsson (1):
  pinctrl: airoha: add support of en7528 SoC

 .../pinctrl/econet,en7528-pinctrl.yaml        |  190 +++
 drivers/pinctrl/airoha/Kconfig                |   15 +-
 drivers/pinctrl/airoha/Makefile               |    1 +
 drivers/pinctrl/airoha/airoha-common.h        |    3 +
 drivers/pinctrl/airoha/pinctrl-airoha.c       |   33 +-
 drivers/pinctrl/airoha/pinctrl-an7563.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c       | 1204 +++++++++++++++++
 10 files changed, 1443 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7528.c

Range-diff against v1:
1:  5a7f97adbca7 ! 1:  420a5e385cf7 pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
    @@ Commit message
         instead of deferring the failure to request_irq().
     
         Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
    +    Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
     
      ## drivers/pinctrl/airoha/airoha-common.h ##
     @@ drivers/pinctrl/airoha/airoha-common.h: struct airoha_pinctrl {
2:  7e6150b186c2 ! 2:  c20005a81b40 dt-bindings: pinctrl: Add EcoNet EN7528 pin controller
    @@ Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml (new)
     +  '#interrupt-cells':
     +    const: 2
     +
    -+allOf:
    -+  - $ref: pinctrl.yaml#
    -+
    -+required:
    -+  - compatible
    -+  - airoha,chip-scu
    -+  - interrupts
    -+  - gpio-controller
    -+  - gpio-ranges
    -+  - "#gpio-cells"
    -+  - interrupt-controller
    -+  - "#interrupt-cells"
    -+
     +patternProperties:
     +  '-pins$':
     +    type: object
    @@ Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml (new)
     +
     +    additionalProperties: false
     +
    ++required:
    ++  - compatible
    ++  - airoha,chip-scu
    ++  - interrupts
    ++  - gpio-controller
    ++  - gpio-ranges
    ++  - "#gpio-cells"
    ++  - interrupt-controller
    ++  - "#interrupt-cells"
    ++
    ++allOf:
    ++  - $ref: pinctrl.yaml#
    ++
     +additionalProperties: false
     +
     +examples:
3:  c3b785d8463e = 3:  ea5b2ce92136 pinctrl: airoha: add support of en7528 SoC

base-commit: d067f0f4c96cb5402a111cf649b7bf9c5771ec74
-- 
2.34.1

