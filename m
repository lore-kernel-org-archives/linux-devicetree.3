Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020DD3C1F46
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923273; cv=none; b=WbiDDHrG+Y6ThcJONQWkSnTDZoF8TofikX3R1bFh6q+dNk9yS9O0dMVcXLagIykX1FsDCvLkwuSB6xdAisvcgjEh/T+flR7dkJ9yJ8wH8JLotpjsG/RY342f7C1Uwy75wU2O5AmgS8BVrmNupdbn3/DqkH/WcurSOazOE4toe+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923273; c=relaxed/simple;
	bh=itqN/gwS/i687N48L05stuHt671wjDtOCAZ7Zu9GEPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fiekdsnn7mDZsVGsX07kO2JE6rQqGKrqNRwd0l6DKPCcmCXTRW0fzposEbtPs69MtIkrUNDuN/I6KWMoRFdflpx9zpNTk0sRNzuVG3YDknAeCnFJaiGrFqgLZvcoXNqiTwLXns7w+bLzBjHxSNjNZVwR2yafKe8Q5Du8UkCrCgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdZoHXxx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdZoHXxx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f84023916so860846f8f.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923268; x=1788528068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iKhErXnLCnts7fqquSWjOHgXXWcaxFgUdUyVBMAuuDc=;
        b=cdZoHXxxJSpQUyZfZAqvJR4L+Ws+GR9zlanVJgx3RTOX71pCPx/ngEqa1ZQpF/xM8j
         RS8GcL6pLLFmAn0kzZuZ4rs/HOMuQGEmwwGvyQg9Guho6o12SXhqcYgxOfQzn88b1O2o
         paIdAtiy4idfRIqY/rEeaHeB68Mm47gNkbDuU3VR0cNdOmo6f17Thu5DMOE6rOoB9G+A
         nGKW5rrQeEC0PySEQgfJhOxCuFE85Z+KcAD2tnBAIJ68/GKAeymGTmqS2iytS5qjSddI
         u0Xq6tHy/2KFoTZCiMqFrTMqFhZAdYJEAwhZBO48RG5cozBkLHjhrRLffT9H+kpPHH1r
         o03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923268; x=1788528068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKhErXnLCnts7fqquSWjOHgXXWcaxFgUdUyVBMAuuDc=;
        b=AaXvEzjOGBgpzZb5yBuvTuUvILPtGUnuAhfhqOGOod/pJL4hSQTb2OHJoYF59mxxMk
         6X9M5SY9/JWdjYvBqiP7C/ZCA6vkMnfNlUhJ+glSWwIYIUBUova1Ih9jmWCQKW0a0lVP
         wD8CHpKSnak8MKKM5v8PzbWeto5gb4K5IRvK5ia0LSiH4Ox/5ChuU7jx8CBwY8RPfWnp
         QY/89ja3cfd17ZJld4e8PKW1kfS0xnoS7/lmMCu4nd+FFPSce+SqBKorfNwGnUHYpmQE
         /c5tkPPsqPmh/oUyE3iaZpSd/AFMvDJVZnIQJn1Ckx6nJDy74CSGV9/dIyNx43vN6EG5
         6WHg==
X-Forwarded-Encrypted: i=1; AHgh+RoHiDqqPVq3u50gWPTnjiJzxNUmAncrWfu5r4q6v5XxB0BCzdOUhSmEGj/4K3vtZgmPRwl30DgJ7Q5Z@vger.kernel.org
X-Gm-Message-State: AFuF++mTOyCnoxSYVHSK1FTX1ZQ70ZIfyH+6lSD7Rt0AE2mc42Ir0Pd5
	Mvnn1CDgQiSYhAiZLP7d/rKg+elVO4TitOaIxWMcgoG87qt733sT/o4d
X-Gm-Gg: AR+sD10g337ij+Mnmmn8F3g8cTP5Tb8XfMFEVP6frrwhSSmXGU8jPvMClZJz6qbdYIR
	51x0WamRCDZ63xm0HiPLx3kCDbjwCRfBayjeYTUVVACxXL62lk3aRySbtEwSE+W2T1flDvkIVeO
	cmO5Y2OHAVPv6dLXH60K3kFoyESib3yWbY1moCtNKV6/6M4Rbb+D6Nl88jgnNJP8rJEWWfx+ExB
	2OHEhESxaoYL/SSZkehuId/mhh0KITxwoeNgYQ+AQXazC6ZFNkV0r/NUnDaAnUSP3RjyDnaLDCX
	FeH8Daa2qDume988GYh/KTHhBeMMk6eWataMrWSk7vQgXTx++MZJ8sl9W9a/C3Q8WW/a9vsgb8o
	EpanTPX9fhjHi/GDggnqfNYKxJESNerCOxE5jmXTf3QQnBxWN8eLJxjBEtLhCncuvzlnZiYzXAU
	by8a1eOIHTHLZTwIIW7iafwStS+TAuJmeewa4IM5D8smKi/mpVXyqv+oiqXbl4IHuOzwEEom8wt
	mZvTuIfF2ldToGtHrPT+zCWidMT9TwN9OlVqajeBMmRZg8EV61v1nmtWTqBfJ/pTXLA2X1L5ZkC
	j7xWYFfY6Ackznc=
X-Received: by 2002:a05:6000:2003:b0:482:eabd:642c with SMTP id ffacd0b85a97d-482f797606bmr9126690f8f.1.1787923267828;
        Fri, 28 Aug 2026 06:21:07 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac526dsm3997335f8f.12.2026.08.28.06.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:21:06 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v2 0/3] media: Add OmniVision OV32C4 sensor driver
Date: Fri, 28 Aug 2026 15:21:01 +0200
Message-ID: <20260828132104.21473-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

v2 of the OV32C4 sensor driver. v1 is at
https://lore.kernel.org/linux-media/20260826072002.14357-1-robertbozik@gmail.com/

Changes in v2:

 - dt-bindings: drop the frequency from the xvclk description - 19.2 MHz
   is a constraint of the platform and of this driver, not of the sensor
   - drop the sentence about the modes the driver supports, and make the
   supplies plain "true" without descriptions (Conor Dooley).
 - driver: use pm_ptr() rather than pm_sleep_ptr() for dev_pm_ops, and
   free the embedded control handler on the probe error path (both
   found by the Sashiko review bot; details in the per-patch changelogs).
 - all three patches: Signed-off-by placed last in the trailer block
   (Krzysztof Kozlowski).

No functional change on the hardware: the pm_ptr() difference is only
visible with CONFIG_PM=y and CONFIG_PM_SLEEP=n, and the other fix is on
an error path. The driver was rebuilt and the camera re-tested after the
change.

The series adds a driver for the OmniVision OV32C4, a 32 megapixel RGBC
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

 .../bindings/media/i2c/ovti,ov32c4.yaml       |  105 +
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov32c4.c                    | 2839 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   10 +
 6 files changed, 2974 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
 create mode 100644 drivers/media/i2c/ov32c4.c


base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
-- 
2.53.0

