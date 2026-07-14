Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B48E363087
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023956; cv=none; b=Y75tUPwcrzT8XKz5qfW9HzBZku807Ram9eJ8IThFjd4fymX4ejFRVz+yYa02Yk1TtqH+Y3x4XbtvqH56Cdx/XkxPmeHMpcThOIoTs8KXuHNtDK1x+nrPsydqX2JrJ+mOkhWGs3zp7hXMIS9MKxfBcifd4cSuHLd6EIau+zHMI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023956; c=relaxed/simple;
	bh=GLTo5n1mk8sfrBu4tliF6CXIVTOxqFnCr56IT8MLyz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+q1TMXQ2JYDkm0zEgQyX5UnIrsGoozeU9z8sbFnCkjhb0xyqkzyBk7FVdiL9/NkuTtasGUOCDjjV6RdZxkA9PQt+XiqNfWA841mQ6E0H5aj+x0GBlHpmdmMxu9azDRaKIG7Xlxw26d8KIoNlxwGJ89kYziKybvwHWzeH6Dzuxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bD/BR/PB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bD/BR/PB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47db714766aso449912f8f.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784023952; x=1784628752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ggmizQ4gyc8HTtT89PKufZdvYWbkRhkgN1DcShr0XQ=;
        b=bD/BR/PBmpsAdV+61mKzgxmDnAZMOLPQEfmf2uSGzHuxjIErr9ivFKhu+YaL1F+dLi
         cP7sdTkTkS2X70rrSYwTdIxMVFVX/M9EEMy8XLjKpXjXd5C06LS6ELV7tuAttgahZuuf
         IUupORdMhglw/qJ2nZb9ljgdDkhqR4sC8jj3Vqy6LT6EEvwyeELDmQ4GrxDqaIcEhDYH
         DJ23z6eh2+1Bxjj75WtjVCaaeH1jdPsC4bUwQh6dKezee0Gtn5x60X7DD2Y8Gw7qjuUY
         9t1ZaS5pojqchBqhxq6Z6roQJBn8NVhIFdqClJhf/tup7qJ716No69AOM3d4gPmw6h4i
         dQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023952; x=1784628752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ggmizQ4gyc8HTtT89PKufZdvYWbkRhkgN1DcShr0XQ=;
        b=sgLnRekbtWWqPwn6rzCJvlhj/h9/RpfZnvUSzX76dV10IIB9IIMFf4EPN02nNh0L71
         GImQ25eCxOdphwLLsWzLA1eXJqscMGYPgjoAY/z45IeheU2WSE4H2vthJ4sTLHyF6l2Y
         viaMNkJV+C9tPckHlDqmBT667cpLfIS2G2CNDJHD2OSB8/XkrJjQoVJO/tnI+L9igIA0
         94ud59WN/QbG0M1XvluBcfGt8Bm7xbSgH5mxkgT5J/TQH1XHZ+XR/tG0UT4Xap7f0BBE
         0YbyOK+20x7SgyulU+5c/WLOTRVwO5gZnLeXH4yf2zwmBn3vB/sL0fbfA7FJN3dfRjPw
         fVAw==
X-Forwarded-Encrypted: i=1; AHgh+RqgaU6JJHO/j8j9MCPb7MJ3RQFrn7/YsIU26UQuk0reX10SsulVkPilmuP7efAFTMTNWTsDbLUdSlXB@vger.kernel.org
X-Gm-Message-State: AOJu0YxTqCfieC8hm7++4KsFVlDdBkGyGxEna2BOkdke/Jmz1DK/qYWv
	CMBT2gmPXodKl0mp3gFcIs8KYbpcnmA5+qPQPC11e28GuEO4T7DQcy5J
X-Gm-Gg: AfdE7cnfeDe9yaPiUYhw94oB4BzgYXSZ8K/KFqeX2P/2nFp5+IibDS6uTYfBYLGQk9U
	0xFmjM8TMmpxvBCuAIXzPUHH7oati8QzsAJD/qjjjD2oUiqxB1NfCN4paxqghzNamNUgSup3UQb
	jBLn2qKNK7hfiAX/CU1WJEgfU+qn5gz8Ne9IrV/atKUvL44Zojwz0N0u/H+8QDxf7jHf4wSZ4Nq
	4yz/KzMO8aQJbxM+VH2FIsMm7JfD+Z3tik35FORlSE8S/AXHJPIAEmihizst+lwLJCpChMWfKLb
	tm63/2M3F2noZGN62wezagcmQyEexM7ID6Q0WTNxjFnBsGoz8XT9bOY373XTAVx9AUDcAYG7Nh4
	zHxbQ1oC9sjojTonAdhSgNeytg8WIt4Rooe/uLV8jJoxjtvrRJspZYZXjYmTHXVw+wD+IcISL7J
	40AI49OkxtpVDQk4RcSE57ZG4YEOEkz0WfQ01swOx3R7RHPhTDRvVBv2Nhjnuf0tuihOJOgug8V
	GHgdrQm15dUnNG1CzxkEX2IwJz92wTKiQ2w3ag2CodJLJbdagMC+JE=
X-Received: by 2002:a05:6000:604:b0:473:66e2:37d4 with SMTP id ffacd0b85a97d-47ef6990c98mr20693974f8f.27.1784023952269;
        Tue, 14 Jul 2026 03:12:32 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm7788927f8f.22.2026.07.14.03.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:12:31 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leander Kieweg <kieweg.leander@gmail.com>
Subject: [RFC PATCH 0/3] drm: Add DRM driver for GlandaGPU (VHDL soft-IP GPU)
Date: Tue, 14 Jul 2026 12:11:42 +0200
Message-ID: <20260714101146.200416-1-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This series adds a DRM driver for GlandaGPU, a custom open-source 2D
graphics core I designed in VHDL. It currently runs on a Cyclone V
SoC (Terasic DE10-Standard), with VGA output at 640x480@60Hz. I also
built a QEMU fork that emulates the same MMIO/VRAM interface as a
digital twin, so I can develop and test without needing the FPGA
board.

  Hardware/VHDL:    https://github.com/stiangglanda/GlandaGPU
  QEMU fork:        https://github.com/stiangglanda/qemu-glandagpu
  Userspace tests:  https://github.com/stiangglanda/GlandaGPU-userspace-tests

I'm sending this as an RFC because I'd like feedback on the
following points before cleaning up the series further:

1) Mainline viability of custom FPGA hardware

   GlandaGPU isn't a commercial chip, it's an open-source soft GPU
   core. The DE10-Standard itself is a regular purchasable dev
   board, and the RTL is public, so anyone can reproduce the exact
   hardware. Testing doesn't require the FPGA either, since the
   QEMU twin models the same interface. I know this is unusual
   compared to typical mainline DRM hardware. I'd like to know
   whether this is workable, or whether it's a dealbreaker for
   mainline.

2) UAPI / ioctls / userspace

   The driver currently exposes three fixed ioctls (CLEAR,
   DRAW_RECT, DRAW_LINE), mapping directly onto the current
   hardware command set. I have two related questions here:

   a) I plan to keep developing the hardware further, which will
      likely mean more ioctls over time (for example, polygon/3D
      rendering is one direction I'm considering). Is it acceptable
      to keep adding a new, separate ioctl for each drawing
      primitive like this, or should I move to a generic
      command-buffer submission model instead, similar to
      DRM_IOCTL_VIRTGPU_EXECBUFFER in virtio_gpu, before this is
      treated as stable?

   b) If I do end up with an ioctl-based acceleration UAPI, is
      writing a Mesa/Gallium3D driver the expected way to make it
      usable from userspace, or is there a lighter-weight option
      that makes more sense for a project this size?

3) x86 QEMU platform test device

   To let reviewers try the driver against the QEMU twin without
   cross-compiling an ARM kernel and rootfs, I registered a
   platform device at a fixed address on x86. I'm aware this
   doesn't belong in the driver itself, so I isolated it into patch
   3/3 and marked it "NOT FOR MERGE". Let me know if you'd rather
   see it dropped entirely, relying only on documentation of the
   QEMU-on-ARM testing path instead.

4) Pixel format conversion

   glanda_pipe_update() currently does a per-pixel software
   conversion from XRGB8888 into the hardware's native packed
   format on every flip. I'm aware this is a known bottleneck. I'm
   planning to extend the VHDL to accept XRGB8888 natively so I can
   drop this conversion entirely. I'm flagging it here as a known
   limitation rather than blocking on it, since it's a hardware-side
   change and doesn't affect the UAPI.

5) drm_simple_display_pipe vs. manual plane/CRTC/encoder

   Since the driver only has a single plane, CRTC, and encoder, I
   tried converting it to use drm_simple_display_pipe instead of the
   manual setup. It compiled cleanly, but my userspace tests didn't
   behave the way I expected. I haven't figured out why yet, so I
   kept the manual setup for this RFC. I'm open to revisiting this
   if that's the preferred direction.

Testing Status:

The driver has been tested and verified on both the QEMU fork (x86)
and physical FPGA hardware (ARM) using:
  - A custom static userspace test: https://github.com/stiangglanda/GlandaGPU-userspace-tests
  - `modetest -M glandagpu -s 36:640x480 -v` (which successfully
    displays the test pattern)

Thanks for any feedback,
Leander Kieweg

Leander Kieweg (3):
  dt-bindings: display: Add GlandaGPU binding
  drm/glanda: Add initial DRM driver for GlandaGPU
  NOT FOR MERGE: drm/glanda: Add x86 platform test device

 .../bindings/display/glanda,gpu.yaml          |  49 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/tiny/Kconfig                  |  25 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/glandagpu.c              | 808 ++++++++++++++++++
 include/uapi/drm/glanda_drm.h                 |  40 +
 7 files changed, 932 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/glanda,gpu.yaml
 create mode 100644 drivers/gpu/drm/tiny/glandagpu.c
 create mode 100644 include/uapi/drm/glanda_drm.h

-- 
2.43.0

