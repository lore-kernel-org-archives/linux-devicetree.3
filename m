Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073B3AAF71
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 21:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815000; cv=none; b=NzABNmzHtG+UfevAxNaRpIHmm+qcWJaa8xxWAhIlvYPWb/Yty2G3CI0PFKXMk6RJ1L+NNQJbQk/qcjl2N9nEc80xHoOa4/nd5BiLk/1+pWc/R3v0mROqqpNfEtXJ4Qz9wyGwgpJB27bUsoPCR5otlVWGpmZT7BBMC75zQDAsVfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815000; c=relaxed/simple;
	bh=/1RHVGzVNTgjUr8PjNpOmFphkAaZ4GaE7T5O9Vq2giI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZBIhJ5pS5DoLN/J6VBg38BtRyg6tUi0441BerYvqqERbY5ZKOVI+wb7i6xtLqXwUshfZgLaRnB07bpKmUHwte9wXQdEoLqDU2sbzXygRmSN35CmghxYFJfrRFA8A6J7uEGOPn3qNizTXLo2KZm7MmnQghnQ8smw6Lwc9pwKSpH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh487zOV; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh487zOV"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f4ea388ba6so3711339a34.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 14:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788814998; x=1789419798; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tpw9Qu/qg2Vc6uWyZCIa2wBsFTsdsQiRWzmo291uKVI=;
        b=Kh487zOVdJ8ZgypwqakXzsj7vC4FC6YY+hbJKK59r3bPWoMU5njv5b6VuSb8DXNvgA
         S/aNUFY1wmlgSwOOlI9x9pledh0wy6rRkKD6lWEs4ZRGA3Oc0ALOmWSzuCbJHM+OScbV
         gueAYMBpw+SkggPu+OKk4srOdF/dX4JoELXt9X41TSbjc6VwEG2wVkHuNTOxDKv0vUS9
         lTbA4Vzvx3OlNjdBf7UyAQdir9VNCk3nCWwU1h0AZw4UDqbeR0A+fqNnAFGg6yUsYlSb
         Uyy6Idu7luR3bCiDx17j/mlLTlJIpprZoXeHjy4gDMvgpHjQYs2JhaDQXZL560or8796
         y4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814998; x=1789419798;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tpw9Qu/qg2Vc6uWyZCIa2wBsFTsdsQiRWzmo291uKVI=;
        b=eYkw4OeqwIVKJPA6U8Vb1DHiArW86cx5TJ8lGWdg5jNo7Mx1GBGkzR63F+cpBlYzdO
         88IsDDMaVKMTerGYQhrZrXSDK9/LTXMHQtZB9jLLG+sQDqpBRZb6DVw55OsTOmQAQgCv
         wpnOJv8Nh2GQBdBWmwdf0yiqnMWXvt50sBr2SX8s5PU0rAUHShxNNm+V8XmrF8J00x3I
         +6CkiM3Ka3EoW14n/6B30P3AMIjOdwKQ6XJWg3UplFzF7YjZAnJBMg/QCCttuaMlzw/t
         oF75IamnBUE8RiN+nVOlvfV32rw9XS/m71+chRhYnaIB62AJtBxOHk8rEV/vU4LDDGMg
         Pbpw==
X-Forwarded-Encrypted: i=1; AKwUvBwsqz+98cm12buGvR7QfyYd7IMy2J1kZQH+/uSbb7QvMjzKLmCJlLsW10lFzqxCsnfP9Q44t4O1qX6g@vger.kernel.org
X-Gm-Message-State: AFuF++k9TWcJZt1wtmR4tJThEej0VNzeU9VZWnnrAv1h4zsV6B/+z+GX
	PEGlkYnQw2RpgPOS8xuUNye6lCz/PHoP5yAwAYtxTkgGwORSg/++w/sA
X-Gm-Gg: AYBFou0iIyEU6z//DPC/8uj/addm920PxNZiRgk8nVpYsHsn0zeLkrmjCe2OUQCE90S
	op94fA+CI9r73/+DJZcR0UvNc6PTsijjuH+UzlFqdWz6gnbMTPeMu55/fAMEYipKClqkikq84/F
	fHtL5Me9zqoRMoHUwZ56dAF/KErr0fIdgJDuutvfXe1SdRSLIRs+s3Q+Uv381thUHEaKa6gfAZn
	Nil7Pe6oh15iriStBZcD9TifoWrprCLqYIr/RBJF5FnrplGDBdbpxHCcJjop+kofsa+I7VHbteD
	dcBWb3UulvCBFqfPk4cnrjadLWq4joRRSEjoyxcWh4rw8l3aY5/OkQilH3maIjKJM1pBjaYCX7u
	gPxymzddGO2qWp5T7Fm3Sii1ELCJzTXXqEX0Srr633bS3u0Bz8ZsEwAyFud3A/mDlEN87Qkm/4E
	uBl1hO5mlAtxR8D3CSu23IfBeHDTUAUla4yzUxxbSW8KB1gY6o/I4spfW+jdcPzTCQyrhK/PBKv
	qu1F4YVuykeABQPEE41uj4bYLRpg5C8x/uZgKJIrsmBCFa/DYFV1Ups9LkBu1oUIGhsYLkBW9bu
	azxbx9nqthbL/rmgw+2Ph4xFHeVzeI+dI+HbuD0hSObkYISHspkhLl8LDpuvsu5gh1uf2Ah5uaC
	DpEUHkye7tlIeCc3HLqwPvPC7dfMYWw==
X-Received: by 2002:a05:6830:6736:b0:7fa:5c49:5237 with SMTP id 46e09a7af769-7fa5c49544cmr14692047a34.16.1788814997753;
        Mon, 07 Sep 2026 14:03:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fc68d5ae2bsm6640077a34.3.2026.09.07.14.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:03:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v11 0/2] mfd: add X-Powers AC200 support
Date: Mon, 07 Sep 2026 15:03:13 -0600
Message-Id: <20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTU7DMBAF4KtUXmM0HmJ73BX3QCz82xqRBCXBa
 lXl7jgFqVEbieUbzXxvLmyMQ44j2+8ubIglj7nvahDiacf80XaHyHOoA4aACkgIPn67Nk/cegT
 gbQqcnA0qgIlIktWzryGmfLqab++/ud58RD8tzrJxzOPUD+draZHL3h8P5safKt8nHs6dbbPnR
 fAiOXCXrEgkBTmk10Nr8+ez71u2FBW1orY+LaoCXjqBBj015gHQ/wG6AuRAJSnRNkHfA3QDDOA
 GQBVAa0FpBEfW3wNmDbxsAKYCyukYUJMh8wAIWAtqQxBQiSQRIwWPLjRrYp7nHzpQVWAUAgAA
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with a
paged register map shared by its audio, video, RTC and Fast Ethernet PHY
functions.

Add a complete binding and an MFD provider with audio codec and TV encoder
cells. Describe the audio DAI, analog supply inputs, TV encoder display
graph and optional bandgap calibration in the parent node, without
separate function nodes.

INTB is optional. When connected, pass the physical IRQ to the TV encoder
cell for shared, threaded interrupt handling. There is no DT interrupt
controller or private IRQ domain. The ASoC codec and DRM bridge drivers
remain separate subsystem work.

The PHY remains enumerated on MDIO. Its separately submitted driver uses
the x-powers,ac200 phandle, a managed device link and dev_get_regmap() for
ancillary I2C register access:

  https://patch.msgid.link/20260906-submit-acx00-of-dynamic-v1-v10-0-dd272e03b547@gmail.com

The two series can be merged independently; AC200 Ethernet requires both.
This series is based on the MFD for-mfd-next branch.

The binding and MFD implementation adapt earlier work by Jernej Skrabec
and Andre Przywara, retaining their sign-off chain:

  https://github.com/jernejsk/linux-1/commits/opi3-eth/

Public documentation is linked from https://linux-sunxi.org/AC200.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v11:
- fold the codec and TV encoder properties into the AC200 parent node
  while retaining separate Linux MFD cells (requested by Conor Dooley)
- describe only the optional physical INTB connection; remove the DT
  interrupt-controller properties and internal interrupt-number header
- replace the regmap IRQ controller with a shared physical IRQ resource
  for the TV encoder, omitted when INTB is not connected
- mask all sources before enabling INTB and leave per-source interrupt
  handling to the function drivers
- pass static const MFD cell arrays directly to the core, without copying
  or filtering them by DT child nodes; share the cell initializers between
  the IRQ and no-IRQ arrays
- map the function supplies to the parent using MFD supply aliases and
  clarify that the distinct AC_LDOIN and TV_VCC inputs may share a regulator
- remove the DMA-mask workaround now that the cells have no OF nodes
- drop the binding Reviewed-by tag, which covered the earlier parent-only
  binding (requested by Conor Dooley)
- Link to v10: https://patch.msgid.link/20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com

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
  regmap, and clarify its origin in the vendor resume path
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
- rebase on the MFD for-mfd-next branch
- Link to v5: https://patch.msgid.link/20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com

---
James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 168 +++++++++++++++
 MAINTAINERS                                        |   8 +
 drivers/mfd/Kconfig                                |  14 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 231 +++++++++++++++++++++
 5 files changed, 422 insertions(+)
---
base-commit: b07adc1a304c7ca9ac25a01051561538757363c9
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

