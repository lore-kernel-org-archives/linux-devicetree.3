Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B8D31327D
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787728808; cv=none; b=AQae8MvxFAszyTqn1m6IiP3pwFMKw8hyvbBrapt7ujSZe4hctS2XJX1FqhnhETqWjygiw8LPS6l/xR9JFLskX/NKB9rjJI2EdMj8OpgflouMbAt5uuIY5QaYt88/ZdX701Fzjl4/4lCJKTgAmgDlPt0sK2imz8Ih8ByiA7UI1zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787728808; c=relaxed/simple;
	bh=vy8Ll/AycZbpw+f2cz8tgPAK4o7hWqqt7l2npRAvbDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NGTCfr8VlDPAQ6o67s06+yS+EnQa9bc8WO0aZOXU/J38WPwdhJgvjp4H9/Vm0krVn+5GiCqgFBBnagrne12utwV6zGqpA2XehoHJ1KnXlnO/fgbxylaSdRQ4yXvAkEmStnYEnOyPoh3p7niR7oEL60XXMKOVpowJq+k4ZI4GGFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LN6NHQdV; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LN6NHQdV"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2022323c37so72947066b.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787728805; x=1788333605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=63WMvfGt0l8uKyqa59ng0l7805UdsP0VhhUF8Ue2fVE=;
        b=LN6NHQdVs/Q+8MeiPZ0cdGkoEFSosQocW4IkNRRWBbNdVKltfYN0bFiVU71E8cKnBT
         gkPbxvPlCOLJnmASCNlJ7qrSv0av96ul7T3aWE/OfUTmpisX9FJlV0AJb9ch8HHRVOCv
         DTCWZTr4m2DUaG7NLF25ByjCtMUsOPfVrA7Fy1ke9gU72daTk9dCpci0iTIwp4P7ZdpI
         HC2MaQxhvA5ks7XO9qVxP5t6BbbLv0wt/gWfiQaf2lX9j2y2+xQqn3naIj4nfauhVaYw
         EFElsM55nQE5oGKASCx+KHvIVxkeQbN7Oqa6FJPyH41A7T2ujeYcctXMcBsCkP4BoMvU
         QdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787728805; x=1788333605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63WMvfGt0l8uKyqa59ng0l7805UdsP0VhhUF8Ue2fVE=;
        b=ciUUT0cbrSMCac+YJ/0txuPxqlIuoEawHOLlPKcwfEFOUsv9Zg7daBuXxI/ju6sa28
         HaL/4DKZEwswRhNVWON6YfGo3D1GrdKgKgbKGJ97ysHJbcFE/ffYcJs4IkbN2qkkvK2e
         yzQs91AgUKYeYKpuys7FpEcFmPXM+BgTR5tOnsPYbb65Zh3whSFTJLO2xk1xEDcVbLJN
         om/DMPlOxL8/xqI9xplYO47exKSA3Vm2IbVuXEnvlz+xFNwKwxSbz4bJAkHnAXBiEA4M
         6sPVSyZ/FIYD7mI4Flk1p3Gk23TCusunQ30H4IGOvwcxOfnrzH+2tbkxQsEeGzYlI0Lg
         kjJA==
X-Forwarded-Encrypted: i=1; AHgh+RquGkDpQLhSyO4dLV5tq3oF/pG8Edd1dgE28qN2pcSCQ4ZPdZD+tV8uBZRLc8M0ojCAPrfM/5RCqtuD@vger.kernel.org
X-Gm-Message-State: AFuF++nCqpukmAlbH9L2V5nprJ4C5KVM8HR+3Q7ETxSAXmWExCRvo4cY
	8Jj2ErFeAQrCCU4IODvCTWEzL28ZUo33/HgaMIgktaZFo+4x6yjZnvna
X-Gm-Gg: AR+sD11JEM+KLmqzgdlQBcFPEFhvtlIt2GaHxvTySmn6Iq/herDldS8biCeg2WbnTHX
	iQSgdsoqGgRrPTcy7TR7werK/Uy+c2pNT3Nip1yqxDm7fZN8aP+/yggIVpaA/D+HJoyeQseYXYL
	KSye57suT/dAHfsHrnLM7iOo3AghW4h3BAKVvljiHKhTM3AJA0REwLuHD+M6lD9ntSU2RzAWvb5
	MFmjPjsl01GdTM2H5fpgVlrGUe/PtPm4MTicbm7YO8B2188/N8czs2XeazRcOMS8H+3WFpuhm8q
	azwYj6ZFluyJ//qbUB+JkbkB203O3ZcM9rifqFTC/VPBsoxY1Z93dmNoqKP5U2qm3skYHZhdra5
	rYyFmBJbH/CpPS9UkDdWHM90zdCxb3XCC4IAGtHvfa8cWteypLwRYB2+XQaE1D/muPuNPG1JFIh
	QYHWo0n0c7j10S1yrwh/C2ee1JrVaby5+zVHu077G88JY79afmhy/JJW9Os7KSdAjsglh0jkdgv
	02oeYNHs1VIHXhiof9ZfruTBEe6x83184qDTFl4xD/B5RBCACe0u9vooOB16Z+2/gKvZJijSvLi
	KYt+8RWQsqJa+yo=
X-Received: by 2002:a17:906:4fc6:b0:c21:9870:c4f7 with SMTP id a640c23a62f3a-c250c32b599mr576411466b.20.1787728805329;
        Wed, 26 Aug 2026 00:20:05 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab59sm298340066b.41.2026.08.26.00.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:20:04 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH 0/3] media: Add OmniVision OV32C4 sensor driver
Date: Wed, 26 Aug 2026 09:19:59 +0200
Message-ID: <20260826072002.14357-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this series adds a driver for the OmniVision OV32C4, a 32 megapixel RGBC
CMOS image sensor. It ships as the under-display camera in the Lenovo
Yoga Slim 9 14ILL10, where it is enumerated through ACPI (_HID
"OVTI32C4") behind an INT3472 discrete control logic node and feeds an
Intel IPU7. The last patch adds the sensor to ipu-bridge; without it the
bridge builds no fwnode graph for the sensor and the driver never binds.

The driver supports 3264x1840 at 30 fps, 10-bit Bayer, 4 CSI-2 lanes at
a 400 MHz link frequency, with exposure, analogue gain, digital gain,
vblank, hblank and flip controls, runtime PM and .get_selection.

Tested on the machine above: the sensor probes, streams continuously at
a measured 30.00 fps, and the frames arrive complete (60 frames =
720691200 bytes = 60 * 3264 * 1840 * 2, V4L2_PIX_FMT_SGRBG10 carrying
one 16-bit sample per pixel). The full path up to a processed image was
exercised with libcamera's software ISP.

There is no public datasheet for this sensor, so a note on where the
numbers come from, since that is the first thing a reviewer will want to
know:

  - The mode register table is the verbatim initialisation sequence from
    the vendor Windows driver: 1787 writes, strictly ascending, copied
    1:1 with nothing added or reordered.
  - The register meanings the controls depend on (exposure 0x3500,
    analogue gain 0x3508, digital gain 0x350a, VTS 0x380e, and the rule
    exposure_max = VTS - 32) were read out of the same binary and then
    confirmed against the values the chip reports.
  - The derived timings were checked against reality: the computed
    320000000 / (4080 * 2614) = 30.005 fps matches the measured 30.00.
  - The 6560x4928 pixel array and the 6528x4896 active area reported by
    .get_selection follow from the window registers of the mode table
    and agree with the vendor's published product brief.

The gain ranges in this series were measured on the sensor, not
inherited: the vendor driver clamps gain a layer above and carries no
limits of its own, and the obvious donor - ov13b10, same registers -
puts analogue unity at 0x80, which turned out to be wrong here. Analogue
response is exactly proportional between 0x100 and 0x7c0 (1x to 7.75x,
0x100 also being the power-up value); digital gain is proportional with
1024 as unity and clips to black one step above 16383. I mention it
because these are the kind of constants that get copied between
OmniVision drivers unchecked.

Flip handling was measured the same way. This sensor preserves the Bayer
order across mirror and flip, so the driver only toggles the bits and the
media bus code never changes. I mention it because ov13b10 compensates the
crop window by one pixel on the same registers to undo a Bayer shift; doing
that here introduces one rather than removing it, which is easy to copy
across by accident.

Two things I would like reviewers to look at, because I am not confident
they are right:

1) The sensor core rail is gated by a companion chip that ACPI lists as
   the second I2C resource of _CRS and that ipu-bridge instantiates as a
   VCM. Without a single write of 0x04 to register 0x1001 on that chip,
   the sensor does not answer on I2C at all. The driver currently does
   that write itself with a bare i2c_transfer(), deliberately not
   claiming the address so the VCM driver can still have it.

   I am aware this bypasses both the I2C device model and the regulator
   framework, and that the architecturally correct answer is probably a
   regulator provided by the VCM driver, consumed here as dvdd-supply.
   I did not want to redesign ipu-bridge's VCM handling as part of an
   initial sensor submission, so I am asking rather than assuming. If
   the bare write is not acceptable, I am happy to do it properly -
   I would just like guidance on the shape.

2) While streaming, the IPU7 receiver reports exactly one

     csi2-0 error: Received packet is too long

   per frame. It is not a lost or corrupted frame: bit 2 of the D-PHY
   error register ("unrecognised data type") never fires, the image data
   is complete, and the byte count above is exact.

   I could not make it go away from the sensor side. All of 0x4800-0x48FF
   and 0x3800-0x38FF were swept register by register - 512 measurements -
   and no value silences it while streaming continues. The vendor driver
   does not suppress it either; it exposes EnableEmbeddedData next to the
   MIPI link parameters and the Windows IPU stack has a matching
   GetEmbeddedData path, i.e. Windows receives that extra packet rather
   than turning it off.

   Receiving it on Linux would need metadata capture in the IPU7 driver,
   which is marked as a TODO there today, plus a second frame descriptor
   entry - and adding that entry alone makes the IPU7 wait for a second
   capture node that does not exist in the graph, so streaming stops.
   I therefore left the driver reporting a single stream and am
   documenting the warning here rather than papering over it.

Tooling disclosure, as asked for by Documentation/process/generated-content.rst:
this series was written with the help of an AI coding assistant (Claude,
Anthropic; claude-opus-5 for the early work, claude-fable-5 for the rest)
in an extended interactive session. The assistant drafted the driver
source, the binding and this cover letter from my descriptions of the
hardware and of the vendor driver; every register meaning, gain range and
timing in it was measured by me on the sensor as described above, I ran
all of the tests, and I have reviewed and understand all of the code and
take responsibility for it. The mode register table was copied 1:1 from
the vendor driver, not generated. Static checks used: checkpatch.pl
--strict, sparse (C=1), W=1 and dt_binding_check. The individual patches
carry Assisted-by tags.

The series applies to media_stage.git; base-commit is below.

Thanks,
Robert

Robert Bozik (3):
  dt-bindings: media: i2c: Add OmniVision OV32C4
  media: i2c: Add driver for OmniVision OV32C4
  media: ipu-bridge: Add OmniVision OV32C4

 .../bindings/media/i2c/ovti,ov32c4.yaml       |  109 +
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov32c4.c                    | 2839 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   10 +
 6 files changed, 2978 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
 create mode 100644 drivers/media/i2c/ov32c4.c


base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
-- 
2.53.0

