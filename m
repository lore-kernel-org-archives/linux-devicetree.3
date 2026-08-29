Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4AF79CD
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788004719; cv=none; b=jz76eVMcWgPslB5zjUgLXP+QyOrqivAGu+vKimD0ww8jPAA7/mO1bFab1S9ST2G0S42h6sAKcwSaGqI6g4PzEBRSUGTur0j4YTP2z3rv14gwXTNQiFu9WBCY/MV/xkwfNARwYrYml53QU3SvXtdRPQsgcSSvBIxEXBLeKRH6M1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788004719; c=relaxed/simple;
	bh=64fgtteg1cZk0gOTMMLMas7bXF3JXBFyUuyuUYCvsMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=utLC/vWHZwGDyZQWjpyUnVOrPVFLDAw4nK168uM8rABCojJrtfFhk4NWwA4ShMPt95HV9TQCfqcjaGdWzhm16Ojawf+FtCI4aSeUICLh+cNJ4RvK+HCyxaa+T1AgeczTIgVW/1ik3e11h3zHAUo8BJwIAXeQjYB1HyaZqS5bBGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kfne41aB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kfne41aB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso10055185e9.0
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788004715; x=1788609515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvSqeQ/1saL9ntwHRJxFIiksGf6JxZDR0MTpOR8APGw=;
        b=Kfne41aBfvjE0D7AH6gWM0yNjDy444xvd+6QOIL2B/TaOYlve+qbuMyyHpCqGi/PXB
         7plYuaJQqcI1vUVRoFR1M6teYJN6L0RZKXpS3+/mI7l2sbjm+26awJEL/WAQJYb8sMjE
         lv0Di2ZmrTHGi5mTN10oaiPFGrI1kv0FJs/wWdIjlvJgFltNlBJl69xsxuZdT81W9Bx1
         Mp8yuwFg3stcHjgX1xYvaHo1ROesVcOdwg1/4naQZvy2+Bg7Bf8xc57hnR0aoDqbIJYd
         fxiNyrHBySZjcPD6mNnU7ieLrtnyAFqrcQyFLr0u6b9hztfvs0/6owCRkPW+R5P0SeZI
         UeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788004715; x=1788609515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvSqeQ/1saL9ntwHRJxFIiksGf6JxZDR0MTpOR8APGw=;
        b=HsF0NchNV4Ob8bOCXGryR669/4QFzrLD8zXC92IdL26ekAsMUFjKFz88Dj3NSDtmQa
         ALOK4bF1+n0Wtqk2Y1SdvZxDNRDPXWAIiaH1IYh9t7HXGYZFJ/HhbqgYRmGR8vE6PSqn
         gFCUK4I9u1VX8pSVXBqYbgvBnBDojLxljOMS5inHjU54fjkIUwq+Kr8a0z90SxbG5NWd
         2ib/bH5x7V1G4Wy0jnZssnqk8SENgLYvDf1i/wwdWKraxY+NZZCy2t8VRiKgRXWSzRp8
         DWanIFfTPGfvoyto/p1OIaN5OGXidMEJYQr8fiQk5Hn4dug0PbDp1DjNhS3RtOjg0bJe
         NZ6A==
X-Forwarded-Encrypted: i=1; AHgh+RpO6Oo9H3/eOtU33+MgebEwGzcqyOzX5NDT3P4MaJ7S46MHqGpFENLdo70UdCpOAi3akr3+DVw053i/@vger.kernel.org
X-Gm-Message-State: AFuF++kzYyN05/qo6C1HhmHgRHWqVdoQLjaRfHlj0FuxniFOJ7egknTK
	iDGB95CtBSuHC3xwGs0158kKD7iK64TY3GXUc6S+5i0hkB5JkG2IxN2J
X-Gm-Gg: AR+sD11ecwrtVnrlPKTkmUNhPC5XTicG4pulG2b+FmVte4i9yAc9OFB4ajLMB62xezT
	8SnyeZdpk+jiPPFjrSfgltYQyJhzyM6INK7UjPKTrQzhXk7Uxu4wRPpXBc6ZsIhVMcrK7HVKucf
	deWHEQO9gaWOMGmPx5OIzMxtAAyE5K3Na2IMOfC+HhHNDW/g4Crsga+426iSkbI83a58bdQ0/Dt
	7+faYgGB/pNQ7IpzdyFcAgylKmGMLbmxtlics7YzIWdLmYdyVUMa9UzVVJeyFE1sO6QaMQmP2oZ
	d2MeSsijJzsn8tBLvXYl86iMMge8y+F16fR2TnM5h5F3q+lOsiV1HTDqLgGT9cEzFopS/VxxFfG
	MuD66OgkONBFvw8+mGpN5Bs6W+cCPLWwegkpJSbI9uhbklXBmYii08LRPWczAWeZi8vvlgb4tWe
	Qg0QjAy6b/wAQKYyZ2jA1E0eHCQ3PJ3m63Ujs4ajVi0863Q+5DoX2doUIhphtR4X1g91krHIjo3
	Fv7NuyWl5X39z60dPWRSKnmCBkVFYVEr14WB2UaqaH26R3B8CytRkylcALpUgelM+teuHVGKFPJ
	pb2zAauTE2vmbAA=
X-Received: by 2002:a05:600d:6445:10b0:499:5f7a:7ea2 with SMTP id 5b1f17b1804b1-49b91c4643emr157264655e9.12.1788004715329;
        Sat, 29 Aug 2026 04:58:35 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm111107945e9.0.2026.08.29.04.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:58:34 -0700 (PDT)
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
Subject: [PATCH v3 0/3] media: Add OmniVision OV32C4 sensor driver
Date: Sat, 29 Aug 2026 13:58:29 +0200
Message-ID: <20260829115832.8749-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

v3 of the OV32C4 sensor driver. v2 is at
https://lore.kernel.org/linux-media/20260828132104.21473-1-robertbozik@gmail.com/

Changes in v3 are Sakari's review of v1, carried out in full; the
per-patch changelogs have the detail. The three that are more than
mechanical:

 - The line length. OV32C4_SCLK and the scaling function are gone; the
   mode carries .ppl directly, in pixels in the units of PIXEL_RATE, as
   you said it should be. The numbers come out identical, checked
   against the controls before and after: hblank 816, vblank 774,
   exposure max 2582, pixel rate 320000000.

 - The chip id retries are dropped. Measured over 31 power-ups of the
   sensor - one cold boot and 30 unbind/bind cycles - the first read
   answered every time, so the power-up sequence is sufficient on its
   own.

 - .get_frame_desc() is dropped, and the argument I made for it in v1
   does not hold. I re-measured it properly this time: the same scene,
   60 frames, with the op and without it. Both give 10 "Received packet
   is too long" errors and an identical picture. The receiver reports
   that extra long packet either way; the op never suppressed it, and I
   had attributed to it something it does not do.

One measurement I would rather report than sit on, on dropping the
endpoint check. On the 7.0 kernel this machine runs,
v4l2_fwnode_endpoint_alloc_parse() returns -EINVAL rather than
-EPROBE_DEFER when the endpoint is not there yet, and the probe is then
not retried, so the sensor does not bind at boot when it loses the race
with ipu-bridge - which it does on roughly half the boots here. The
deferring path with the comment naming the IPU bridge is in
media_stage. So the check is redundant against the tree this is merged
into, which is why it is gone, and I mention the older behaviour only as
data.

The companion chip, which was the first of the two questions in v2: it
is not a VCM, and my guess that it might be one with an integrated LDO
was wrong. Measured, with the sensor powered and the VCM driver unbound:

    w2@0x3e 0x10 0x01  r1@0x3e   ->  0x04     (what we write, read back)
    w2@0x3e 0x10 0x00  r8@0x3e   ->  00 04 00 00 00 00 00 00
    w2@0x3e 0x10 0x00 r32@0x3e   ->  a sparse block at 0x1010-0x1018
    w2@0x3e 0x00 0x00 r32@0x3e   ->  all zeroes

It has a 16-bit addressed register file and it remembers writes, so it
is not a dw9714, which is a write-only DAC with no register addressing
at all. Where the name comes from is ipu-bridge: it takes vcmtype
straight out of the ACPI SSDB and indexes ipu_vcm_types[] with it
without checking anything, and dw9714 has no id register, so its driver
binds unconditionally. The chip has no ACPI device of its own - the
subdev ends up with 0 pads and 0 links - and I found no id register in
it, so I cannot name it. The vendor Windows driver issues the same write
from its sensor driver and has no separate driver for it either.

So the position is unchanged but better founded: the write has to happen
or the sensor does not answer on I2C, and there is no handle for the
chip in the device model other than that mis-named VCM client. I still
agree it does not belong in a sensor driver. What I do not know is the
shape you want, since a regulator would mean a driver for a chip nobody
can name, and something would first have to stop ipu-bridge from
claiming the address as a VCM. Guidance welcome; I am happy to do the
work.

Still open from your review: the power-up timings. "These are 0 and 5
ms, respectively" - I did not follow, and the question stands. The
values in the patch are 5 ms after the supply and 20 ms after reset,
arrived at during bring-up; there is no datasheet.

The rest of the series is as before. It adds a driver for the OmniVision
OV32C4, a 32 megapixel RGBC CMOS image sensor. It ships as the
under-display camera in the Lenovo Yoga Slim 9 14ILL10, where it is
enumerated through ACPI (_HID "OVTI32C4") and feeds an Intel IPU7. The
last patch adds the sensor to ipu-bridge; without it the bridge builds
no fwnode graph for the sensor and the driver never binds.

The driver supports 3264x1840 at 30 fps, 10-bit Bayer, 4 CSI-2 lanes at
a 400 MHz link frequency, with exposure, analogue gain, digital gain,
vblank, hblank and flip controls, runtime PM and .get_selection.

Tested on the machine above: the sensor probes, streams continuously at
a measured 30.00 fps, and the frames arrive complete (60 frames =
720691200 bytes = 60 * 3264 * 1840 * 2). The full path up to a processed
image was exercised with libcamera's software ISP.

There is no public datasheet for this sensor, so a note on where the
numbers come from. The comments that carried this in v2 are gone from
the code, as you asked, so it is here:

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
  - The gain ranges were measured on the sensor, not inherited. The
    vendor driver clamps gain a layer above and carries no limits of its
    own, and the obvious donor - ov13b10, same registers - puts analogue
    unity at 0x80, which is wrong here. Analogue response is exactly
    proportional between 0x100 and 0x7c0 (1x to 7.75x, 0x100 also being
    the power-up value); digital gain is proportional with 1024 as unity
    and clips to black one step above 16383.
  - Flip handling was measured the same way. This sensor preserves the
    Bayer order across mirror and flip, so the driver only toggles the
    bits and the media bus code never changes. ov13b10 compensates the
    crop window by one pixel on the same registers to undo a Bayer
    shift; doing that here introduces one rather than removing it.

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
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov32c4.c                    | 2664 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |    2 +
 6 files changed, 2790 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
 create mode 100644 drivers/media/i2c/ov32c4.c


base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
-- 
2.53.0

