Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBF346AEEA
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942655; cv=none; b=ScWzOAzAYGoQjpTqPazyuFAwqsyJ1C74r0GjPdMYb8nKbZsQ2sLSIppxGqXNS0b3V2yOZZoB7O6c4tHEuIUYQv3lVQ7YNejNha8bZR1PGYdi2vsWrgWOvDcLWTuHLV1eOFeuqdAb+0qFa6L30sAMfk1m2kHyUa76L+yaetZ8td0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942655; c=relaxed/simple;
	bh=lEHwJMINO94gvWByftwvP2znQr+mzWJHZAWNnNtvHz0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uSMOoFBrr/4MqIER/7j34Rlr89HDm5JL/tWebQAGfDOD+odNaMXAfGcPp3O/aJ+pBOMZ8OXAweG+E8dQTF1dnx/Jugg5XyTTiW7+0SjGwf2v4HxHOCqbqiimMdZuXM8f5a3irjFrG9osX0DVUgb7HBvB5YbeC0TrBlRBITo3S04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPk8rH9N; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPk8rH9N"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b1b3d7f10eso3835003eaf.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942651; x=1789547451; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XwBZV48nMQMCwCRnzKzAzP0Phs409coXoQQ73JPxJAo=;
        b=gPk8rH9N3yc6PDecQ8/CXrMIqPDJ/Y8cwWgeTHZgiGeCRpzG8pdtT3/GlQbeLIIDp/
         TDtm/0dPNysO1StFwwHajrAAGc3S2SPQvr6w3KjbUv/np62t5CD/vZOApzgCe5LYK86H
         PrajvKWdP4KdZcihG8YtB3HPxxlT2byAOln7e2Fcyyq+spXTwIkRwmK2mGT1cLM3sksK
         /Vjj9G07zZb2Ae6K4IAGUmWq33GI9W1q7rdcu+RGLlTC6qaI8KiYNAqUAzWU9uaMjChf
         c9zNtX2WGFnbSxQ5Rq6/yVbu9PU6+ncDriQq2kAvfR46o/7U5rC2o/I9c2+tyKKImZEk
         X6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942651; x=1789547451;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XwBZV48nMQMCwCRnzKzAzP0Phs409coXoQQ73JPxJAo=;
        b=OJRpwbWDkxPcNu2wP4QVT99yGJQMRGfTnleAKBK1MggSRf/NblyYATcw4XACMmyr7R
         3eEQ1Ez4bSB6pyMe8f6enwtr/5meAP1N72wuPCHqdwhUtJWXoXPlaLffXEKldCcaj8kT
         D+uyr0RKDH/PORxa62FHtrppcc1TDwzkpkIwKEp27yXNP/VRAQj4QhD40dfaV2J4QOyz
         VA6v1f4Mw3lN7+M2zEcVSCFNT0Yo7b7/qenNE6Brv6IKrg5h9sut3XhUbMIusAT6wmaS
         wLPZJOLPl+65DFkv9qhXyGOmviSUpm5cZJ6J5E/agRVZ5c7VamKAXWs8e7ahlW4wOHxA
         2Z2g==
X-Forwarded-Encrypted: i=1; AKwUvBxbnKrqwceV/XRJOf2bmb6kXD5WBihraB//6kdQgTIz4O7iR55TrFJQ7BAKt44FByan99Z7H9488PtH@vger.kernel.org
X-Gm-Message-State: AFuF++kh/+SGLIPZHKY1T1RGlK6Px2kKOCgef26h7IwkFExFYppB970x
	SFWFUHw5/8bDDeDEPrg/UhBurOs1+9D1+5hGlIrCUBEOhCk16OFhMkAF
X-Gm-Gg: AYBFou3EGKJOMu1zUyTDB7LMTIZd1h/JQFC+U6UrvgqYd47ux4lB1FVkVLqMZ8kvjUD
	keQOEv7Xhkjta7W90tQqppUoiXQg8HYfRhfhTEYixv6oqzvfBbSeBc2jmqLO1a7p2bBeT53R7jQ
	mJ8WIf5KgZqW4m1KpiTwXtMr2vFVWJVIi+jkfJPvWnlj/F2lA1CuuwRXcJ5YJk2CE53bUM8L9n4
	Z75g6dbwzspog6aC+cFq54j5LNzl6X0v7mu88OrAoDLFqn6aFScyFNgNXrMz2gyf+Cwdj/UUCyf
	AwO8au1bH191MdfzDXzfg+ePr8bRArNDhMwWyItKRpcJRiLdQuI9SuwD2ncOtdjulI1fRu+IMGQ
	cBGeEJkTB2tMAMoyGUTNRx79z88Q8pATy3NtJLcNAViNn/rwBND1AstP5JJrbwqXoEXQb/lIT0J
	pe4is6WB6ff2oiqdgPAQtcYxoawUpMECPB8HvxU1xsYeqz+K3DwY/aVDAtoyTewiADuhZJiWzMV
	Zmr37+AjDjhxOK9TE2VsEiqq2/An/4phbJnrHfIh+kwTBt2HkDoeP3tTPqoJ+Y1QBzGdgiAs0yy
	RJTjFEaLCJFadfgztX1fI3ghxnZR+grqPJfPoDXys/awvjut5tXBQ99uE7Z52tlP1zYrIbTmcJL
	R0/aBi0Z3HDx3wf1sbT86AnwrlByY
X-Received: by 2002:a05:6820:1893:b0:6b7:8415:d785 with SMTP id 006d021491bc7-6b78415d897mr16470897eaf.48.1788942651425;
        Wed, 09 Sep 2026 01:30:51 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 00/15] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
Date: Wed, 09 Sep 2026 02:30:33 -0600
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOQQrCMBAF0KtI1o4kaaytK+8hLtIkrSNtIkkMl
 tK7m9aFLhUGhg/D+zORYDyaQI6biXiTMKCzORTbDVFXaTsDqHMmnPKSVoxCeDQDxrzsE8FKqyE
 Zq50H5xro5egeERIDUzAmNKNK1Ypk7O5Ni8+16Hx55yzdjIqLvlxcMUTnx/WTxJa7v0vzUBBlU
 e0LyYTU9akbJPY75QaylCb+YWsqfmZ5ZhvG6UG0Qip5+GbneX4BQC0u1kUBAAA=
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware leaves the bad-block marker in the randomizer
data stream. On H6/H616 it also places all protected user data before the
first ECC step. These choices differ from the mainline format, which
keeps the physical marker plain and maximizes the H6/H616 user-data area.

Add allwinner,randomized-oob to select the firmware format for the
configured hardware-ECC geometry. Older controllers keep their fixed
four-byte-per-step user-data layout; H6/H616 use four bytes per 1 KiB
step, capped at 16 bytes, packed before the first ECC step. Without the
property, retain the existing marker handling and OOB layout.

Normal hardware-ECC accesses use the controller randomizer. MTD_OPS_RAW
continues to bypass both ECC and randomization and expose physical data
and OOB, including randomized markers stored by firmware.

Address the ECC-error paths as well. In randomized-OOB mode, use the
controller-specific vendor spare-byte erased-page heuristic on the
protected user data from the original hardware read. Older controllers
use exact erased-spare checks, including their first-page and page-127
signatures; H616 requires byte zero and at least nine of ten spare bytes
to be 0xff. Accepted erased pages return all-0xff data and OOB without a
raw reread. An all-zero physical page instead returns a bad marker and
an ECC failure.

Other ECC failures retain the original decoded data and protected OOB for
bad-block and flash-BBT pattern scans. PIO and DMA share this page-wide
classification, including randomized-format subpage reads. Plain-marker
mode keeps its existing physical erased-chunk check.

Prepend independent fixes for PIO OOB lengths, per-step pattern IDs,
read/write error handling and duplicate OOB program confirms, followed by
OOB-helper cleanups.
These fixes also apply when randomized-OOB mode is disabled.

Also combine contiguous unprotected OOB reads and reduce repeated chip
setup and register accesses without changing the page format.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- add a prerequisite fix for the logical OOB length used by PIO transfers
- clarify logical ECC steps versus hardware slots and share protected-OOB
  register indexing
- select the controller-specific vendor spare-byte erased-page check from
  the SoC capabilities, only in randomized-OOB mode and without rereading
  the main data
- retain hardware-decoded data and protected OOB on other ECC failures
  for bad-block and BBT pattern scans (reported by Miquel Raynal)
- retain a bad marker and ECC failure for all-zero physical pages, and
  disable the ECC exception for the vendor format
- share page classification between PIO and DMA, reading complete pages
  for randomized-format subpage requests
- propagate OOB read errors and defer randomized-format ECC accounting
  until those reads have succeeded
- propagate read/program setup, column-change and buffer-transfer errors,
  including extra OOB; stop failed writes and disable ECC and randomization
- discard partial DMA ECC statistics before retrying in PIO, and keep
  correction counts separate from successful OOB-transfer status
- select the current hardware step's pattern ID instead of slot zero
- avoid a second program confirm after an OOB-only write
- avoid redundant column changes before writing extra OOB bytes
- reject oversized ECC steps in randomized-OOB mode before the core can
  fall back to software ECC
- combine adjacent parity and trailing OOB reads in randomized-OOB mode
- remove duplicate chip setup immediately before core page commands
- program each packed DMA user-data length register once per operation,
  and write PIO slot zero directly without read-modify-write
- reuse pattern IDs and packed error counters within a DMA read, while
  refreshing the snapshot after every PIO ECC operation
- Link to v2: https://patch.msgid.link/20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com

Changes in v2:
- rebase on the current MTD nand/next branch
- retain the merged protected-OOB allocation, BBM reservation and
  stack-buffer fixes
- clarify that randomization is part of the normal hardware-ECC page
  format while MTD_OPS_RAW continues to expose physical bytes
- explain why a BSP-compatible BBM remains randomized in physical raw data
- document the decoded bad-block and flash-BBT access paths
- reject the firmware OOB format with software or disabled ECC
- document the BSP page-format compatibility contract and the
  older-controller format audit
- Link to v1: https://patch.msgid.link/20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Richard Genoud <richard.genoud@bootlin.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Boris Brezillon <bbrezillon@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Hilliard (15):
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
      mtd: rawnand: sunxi: clarify OOB register and step handling
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout
      mtd: rawnand: sunxi: combine contiguous unprotected OOB reads
      mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
      mtd: rawnand: sunxi: reduce user-data length register accesses
      mtd: rawnand: sunxi: reuse ECC status within each DMA read

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |  10 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 948 +++++++++++++++------
 2 files changed, 689 insertions(+), 269 deletions(-)
---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

