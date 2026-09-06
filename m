Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765538237B
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 22:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733861; cv=none; b=E9z/tgD/gBjLD3UTCko1XzEYh0IDj+nDvi8Gz1MqpMLdhk55ynNrocjJjPtWH5QCj8fKcoDz6j8CLpUZRMdmk/JqrH82nCC0YefPAqEplSw//x5a36uewkJ4QyLFwGHkoSvHhG7Tdw+sU4Wt4e/CYYI2pI0kEc89+beJYtPlWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733861; c=relaxed/simple;
	bh=9Do43tfnOOMH9vnpFRKJQymMYEW5k1BPXVMpqO6ODHw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W+K8snNSLPmZHjYcxU3sMLOMyH/rvDaV99lo9Bycrh3DubkMiTaZ4Q6314YDnx8StNFagUvvxSe8rcRWdR245tsBSdJWG30by6tZIvMtViJBUZpVYjM4/OMpwewuBPSEOSZ0Lu9/TrCdkGE+ib2aJLIeMEwrH9ZuTypQOHnweNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbxjoS4I; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbxjoS4I"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-497e6956acfso2778883b6e.1
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 15:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788733857; x=1789338657; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R7ofSnDmL0DwZUtbw6mO19Jd2QrlddgbYKJFA0cGE/w=;
        b=bbxjoS4Ig0HI9Cyn37ehdwrVjScEJLjUmxJY3rr/aZ89tiETtyBiae8NSdbjIPbDFw
         3bwXUaEHMCnr8rUj/Wr0OKdAoimhi6mwRqVMu5Pe7pOAIKXQlHAFp8B2Q5Wgo8WmY+qU
         b99ZIj0a+MjppLEtPensqteMEY4t4/1LHssZt5zFLpNy0XdfNmCxk3fluotVQUqp0Bir
         w5bKQnGky59kARroWGuZCv6eJbu9Xluh+OnjloLceSdoc2YwCnBZVdvdJom9Yg1MpYjA
         hrosM4ih4TLTBs8j51wZJL5voEa94zib9sbDVWb5va0Hn1ECs/fxIKZAbdD0OI79L60P
         IPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733857; x=1789338657;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R7ofSnDmL0DwZUtbw6mO19Jd2QrlddgbYKJFA0cGE/w=;
        b=Mv0hRSaIogFFaJUtZfem/m6koZXuE+f47EOesxlla2HKvwXN8JIXGC75sr0d8ah5ts
         lQroUq3W0Pk0w6GH5qK/yDPRvKPW4rxkzezKzr9G8KaaOcgik6PRIxZsoOm0PCciK28J
         DFlY3sDzAeWONnX+bMJXRx8aLZpTvMUfpb5/jS3vJsY4IeRjcJF2o9B0t8qQkM5lBZ1k
         Fjm4Oja8YWylTF6nB7kR4uDRw/gmLShlnMIVA8gvLYgskEonmBC8pbldCJieWYYlv8tA
         /5BGTldPgbfhwGQDwPDbR2WGrm5uUu89fkkWWlw0MEiG97wD9d0v1TAsRqVMex8yG7lD
         YHLg==
X-Forwarded-Encrypted: i=1; AKwUvBxJn0GByvYdqFd1f8ku+2yJ5bnZzEDUv8XTLwUSZjp4785LWQtQW8hNyGTXNDkDdWtDfLyr2MY1ocJj@vger.kernel.org
X-Gm-Message-State: AFuF++lknQrfhqCilI+0BvujekfOFRf5ho72fogCWjcVP5fRilMnUnLo
	xTDI8j9acjUfBYdJBAERehy92jNNLkmegmUkFk+yWLJT58xZac1g/ALi
X-Gm-Gg: AYBFou0MlJYPMyJLIwWjymPNDZUzMQfjQocBWiCvAJpqsqFGKHWThVsQltAfe/HBMJ0
	Iu1nCJd4rShFYj3WzOehVO2WGUxlZyIyTEUNt0Uvnls88nTHWU+qBMWd8LhiBVmOSKPsGzsr8Hq
	fLlPd+cRsEZKZPzW35AeQPEb+Ke4EolzvdkrbnGdMRM92KiiNrt5RMHV+R8Qjf++NnoSS5LBiev
	z2ME972zr4wwjbp86Mr5OGEkwC5r06TnaYcl5zgO0jdmn7IKDn6rZIFr+pp+1IJShTbhkTujD1Q
	mL46wHN8NKooP7oM1svxpke/XhFa2qpJ0b1Liy0GT3C2aHK8Yc+KCXT919j9UdNSf7+az4mLZoG
	YIygdDG+Y0yBXFJ132nnbiPmgilFjcEKku6mP+m1TH3/6YQSvdPv8iJYlNDVLhwclXYbRvcwqN2
	e4clHElLQNdDFwSJfWF8TPKG6H2d62OQCtKiJ5Xs4p9Vhs4xPu3uS4zxQnf0viLcYEf6fnWe7+I
	LSmxqIqHR1khVviY4a31P77Xq3J0t0RQfpwOBLwMHzMy5j/m7CHMrCb4qPJOGVUSstjvcBnNzJN
	zkq5K1Xhvfgq2n81WrEQv72KICz+/7UhYpLg/EsKMkqmV9KMTR51qTFQhckJCe5YKk6XMTkQACP
	1lIxl9orUXO4OER6gkiw=
X-Received: by 2002:a05:6808:30aa:b0:4b8:46e3:e21f with SMTP id 5614622812f47-4b97b4878demr9083760b6e.11.1788733857471;
        Sun, 06 Sep 2026 15:30:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d200fesm8701910b6e.3.2026.09.06.15.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:30:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v10 0/2] mfd: add X-Powers AC200 support
Date: Sun, 06 Sep 2026 16:30:45 -0600
Message-Id: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTU7DMBAF4KtUXmM0Hmp73BX3QCz82xqRBMXBa
 lXl7jgFqaVEYvlGM9+bMytxzLGw3ebMxlhzyUPfgoCHDfMH2+8jz6ENGAIqICF4+XRdnrj1CMC
 7FDg5G1QAE5Eka2cfY0z5eDFfXr9zu3mLflqcZeOQyzSMp0tplcveDw/myh8bPyQeTr3tsudV8
 Co5cJesSCQFOaTnfWfz+6MfOrYUVXVDrX1aVQO8dAINetqaP4D+D9ANIAcqSYl2G/Q9QFfAAK4
 A1AC0FpRGcGT9PWBugacVwDRAOR0DajJkfgHzPH8BShmUpNEBAAA=
X-Change-ID: 20260811-submit-ac200-mfd-8bad6d09e285
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 James Hilliard <james.hilliard1@gmail.com>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with
a paged register map shared by its audio, video, RTC and Fast Ethernet
PHY functions.

Add the parent binding and an I2C provider which enables and rate-locks
the shared input clock and initializes the paged regmap. Before creating
the regmap, retain the 40 ms wait used by the BSP resume path after
enabling the input clock. No minimum delay is documented.

Deassert the common reset without first asserting it, and leave it
deasserted during removal and shutdown. This avoids a provider-initiated
chip-wide reset of unrelated function registers. Supplier unbind still
tears down linked consumers and releases the provider's clock references;
it does not guarantee uninterrupted operation or wake-state retention.

Describe and instantiate the audio codec and TV encoder as MFD children,
and provide a shared regmap interrupt controller for boards with INTB
connected. Only enabled, DT-described function devices are instantiated;
PHY-only systems therefore acquire no unused platform devices.

The INTB connection and TV encoder cable-detection interrupt are optional.
Enabled codec and TV encoder nodes are valid without INTB connected, and
cable detection status remains readable over I2C. A declared TV encoder
interrupt requires a complete parent interrupt domain and upstream path.
The ASoC codec and DRM bridge drivers are separate subsystem work and are
not part of this MFD-only series.

The current regmap consumer is the separately submitted AC200/AC300
Ethernet PHY series:

  https://patch.msgid.link/20260818-submit-acx00-of-dynamic-v1-v9-0-b8c8d9ad0d83@gmail.com

The PHY remains enumerated on MDIO, its primary management bus. Its AC200
package node follows the x-powers,ac200 phandle for ancillary I2C register
access, adds a managed device link and obtains the regmap with
dev_get_regmap(). This series and the PHY series can be merged in either
order; AC200 Ethernet support requires both.

The child descriptions and MFD implementation are adapted from earlier
work by Jernej Skrabec and Andre Przywara, retaining their sign-off chain:

  https://github.com/jernejsk/linux-1/commits/opi3-eth/

Public AC200 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation included dt_binding_check with dtschema 2026.6, W=1 x86_64
object builds, strict checkpatch checks and a clean diff check. A 38-case
host-side harness checked the actual IRQ initialization and cleanup
functions with stubbed regmap and IRQ APIs, covering trigger selection,
firmware register states and failure unwinding under ASan and UBSan.
A 30-case DT validation matrix covered wired and unwired configurations,
enabled and disabled functions, both interrupt-specifier forms and
incomplete IRQ paths.

In earlier AC200 hardware checks, a writable common-register marker
survived supplier unbind and rebind. The provider and PHY completed 100
deliberately overlapping bind cycles while both device links remained
valid and the 100 Mbps full-duplex link recovered.

With temporary codec and TV encoder DT child nodes, a second 100-cycle
run verified that both automatically numbered platform devices were
removed and recreated on every supplier rebind while the PHY continued
to recover. After restoring the production DT, no child devices were
instantiated. One hundred pings in each direction completed without loss
and 8 MiB transfers in both directions compared correctly.

The latest revision was also booted with both MFD children enabled and no
IRQ connection. Twenty supplier rebinds completed without DMA-mask warnings.
All 42 child probes verified DMA-mask inheritance, read the parent common
control register as 0x1 and obtained the expected absent optional IRQ.
The PHY recovered at 100 Mbps full duplex; 20 pings in each direction had
no loss and an 8 MiB upload/download round trip compared correctly. These
child runtime checks cover enumeration, removal/recreation and shared
resource access.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v9 -> v10:
- combine the parent and function bindings into one complete binding patch
  (requested by Conor Dooley)
- introduce the complete MFD provider, IRQ controller and function cells in
  one driver patch, reducing the series from four patches to two
- retain the existing sign-off chains for the adapted binding and MFD work
- allow enabled codec and TV encoder nodes when INTB is not connected;
  require the parent IRQ path only when a TV encoder interrupt is declared
  or the parent advertises an interrupt controller
- add an unwired TV encoder example
- move the existing 40 ms wait before constructing and publishing the
  regmap, and clarify its origin in the BSP resume path
- use automatic platform-device IDs so MFD children from multiple AC200
  instances cannot collide
- initialize the parent's DMA mask for its non-DMA children, avoiding
  "DMA mask not set" warnings during child enumeration
- explicitly request level-low when no upstream IRQ trigger is configured
- keep INTB disabled until source masking and handler setup are complete,
  and disable it before releasing the IRQ chip on failure or removal
- narrow reset-preservation claims to avoiding a provider-initiated global
  reset; supplier unbind still tears down consumers and releases clocks
- Link to v9: https://patch.msgid.link/20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com

Changes v8 -> v9:
- deassert common reset without first resetting the entire chip
- leave common reset deasserted during removal and shutdown, avoiding a
  provider-initiated chip-wide reset
  (reported by Sashiko and queried by Lee Jones)
- stop storing the regmap as unused driver data after dropping teardown
  callbacks
- describe the audio codec and TV encoder MFD children
- add the AC200 interrupt definitions and shared regmap IRQ controller
- register only enabled, DT-described codec and TV encoder function devices
- retain Jernej Skrabec and Andre Przywara's authorship and sign-off chain
  for the adapted child and MFD work
- make the base provider depend on COMMON_CLK before child support is added
- require an upstream interrupt when the parent is an interrupt controller
- credit Jernej Skrabec in the module metadata
- exercise child enumeration and parent-regmap access with temporary probes
- rebase on the current MFD for-mfd-next branch
- verify register-state preservation across supplier unbind and rebind
- Link to v8: https://patch.msgid.link/20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com

Changes v7 -> v8:
- identify the PHY series as the current regmap consumer
- describe future MFD children and the MDIO/I2C split
- store the regmap directly as driver data  (suggested by Lee Jones)
- reset the chip from the remove callback  (suggested by Lee Jones)
- drop the revision log and inherited-driver attribution  (suggested by Lee Jones)
- add Krzysztof's Reviewed-by tag to the binding
- rebase on the current MFD for-mfd-next branch
- Link to v7: https://patch.msgid.link/20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com

Changes v6 -> v7:
- drop the managed external-syscon helper and AC200 syscon registration
- leave the regmap attached to the I2C provider for direct device lookup
- reduce the MFD series from three patches to two
- Link to v6: https://patch.msgid.link/20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com

Changes v5 -> v6:
- split the MFD work from the independently mergeable networking series
- put the merge routing and shared DT design at the start of the cover letter
- rebase on the MFD for-mfd-next branch
- Link to v5: https://patch.msgid.link/20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com

To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 231 +++++++++++++++++++
 MAINTAINERS                                        |   9 +
 drivers/mfd/Kconfig                                |  15 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 255 +++++++++++++++++++++
 include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
 6 files changed, 524 insertions(+)
---
base-commit: b07adc1a304c7ca9ac25a01051561538757363c9
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

