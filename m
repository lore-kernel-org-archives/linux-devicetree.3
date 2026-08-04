Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B024C41BA75
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876986; cv=none; b=OsV+6fP0RMh3XYYEsPxgxYCXwffThHzeZtVou4tqN8JnyM9qcHVIfboLOD6/70fLBB8Ff9dNbhPZIE/XO/y65XsqjpBqFR3i2miiKE0ZoIoFK1j9ez51E5AqGeYnI/hazL7KHdEzmMCFbpV8KIMUaaXFkGzabjzjcuCzzrKCtmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876986; c=relaxed/simple;
	bh=hrEO6aVeppevIRZrm8GWvi2+SqEdgkXuow7wj9f+qKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=huVhy1j7V5bHjF6sltMvvIP4K6xJSyFBWN8mB1rqqmRvuwvgFXmSOHyMN/9pyEAEzaXOXb2111/6eaYVJ3vsT42EHh//dicLQ6Ghc2+9eLlUa3/aYDJRv0RdZyw5qSVPFNGUNV5MFQpJ6bGon1+UxGFPWgEVb/YLedvtw2YxVU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akzSVNFs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akzSVNFs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so2519565e9.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785876982; x=1786481782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hay/eMDbf3VXXM+6XzN2pJCbmyh5c1JHPJBtoOoDqDg=;
        b=akzSVNFs7fC6yVNtNfpT03EFKGUvWuv/fmjo3w/4f7WAaOr0KbbrZVlhf3YMvLBqbh
         ZCuBB11/v+omRCxqBziAPD6OXRUSUXgzfz+09nNaP4h2KfEsA1tUG89P5bYOkAvY/db7
         6mNQySt8s89UHI5R7WWYw8V/KabM70FtqL2zUpPwL7HQN/Yfw9J0PA6t1r2HEe5K2+I2
         bXoUN8v+8oZhwfyUzbKxVeYLuQyxSJntcDmbkO5E69USRd0S4VQiqGG09oY7kwfs4dPP
         3N9eFGh5ryWzW15eO1DRwLxyNsv9stuvYIQlHEdS3tYaCcyB3LlCICzbCZr0kmn7CUes
         rnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785876982; x=1786481782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hay/eMDbf3VXXM+6XzN2pJCbmyh5c1JHPJBtoOoDqDg=;
        b=sydjAc0rfEpOhGVYCmQR2OXsNVAPoJuEnYErHBQn5t2pefbpFKSL2KMV6iJW11pHCB
         ej3GGXG8K+LjrVq2OVQK6RUNuPpcc0e08H6fn29sVAPLbiTM0+YnwFHDaRwLMUohNkpw
         sfjttYExc8BOxARseAeJKdNiQ3pMpLdSx+s2ZNvck4UV/EaXa/SuwP4FFnok795SZ3s4
         oA/JSTsHi2Ip/q8lEZ3dedzARtxxcwWPM0RUJgxHqMqxvSDdfZxJR+bCNsLaG05tbVTR
         HvMVAE2CTYfzGl+oi64ddmmMaFA8GqffL6PkOBqaXfV1rA5Y9vrSg82jcoCYIsbfjvA1
         exoA==
X-Forwarded-Encrypted: i=1; AHgh+RpU2XgLmMNebNxupCU1BywOKSH6CRDLD1bCof9ugtGfNzxII/DYJS4kFM6Kh5fmLituTCgeDlFzK8F1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyao7EKPOakBH2LY4oqbaZkWUWlwY+0E3qfc+3QPEQD4CYgIpAq
	zEdiN7UnfReCz5+samK2cns8AKTFbgLR5qIYyagET9u/tF6x8xdsFU1T
X-Gm-Gg: AR+sD13/YGl3U/ezRdvuxfvjSTYP1sm24q0a73iG+c4NW4orjxF3I5KvOJxU+4H0lmz
	Oz/Uzk7vB1Upa0QFBGZmII9lHSk79lCLT5nsfsPKy3lKfU+rsX594DHJ5hLilCkeksrTO7G5X49
	tKY2MkjKUuI4N8+11iKV1TrKxZTxc+dWnCKCkDlipeygDmFSDXdE6X5R9EPeAXF8eQlFvQn72XY
	GqYlixvIBWewCJEaAQXFtQxvjmJ6Uzv79pgq/HJs790q8M+nnchXQTn7oHrv+xzUtA3voO3cJPJ
	8SQ0zvvwVatUlGD2LjSCx8uZJ3en9zfnvlVud0DahsYIUunK9UM7RqJ+XptHpdDZ2MRPH8hFktR
	zO6ZhL64tzBFfzI8GBalzEGp7fZhHZkCAQzYXEYzjHcLSrNkB2bt9w575M2IPcF8WowJI+uYY1C
	7odqNc8ADhokaIIfDTdFwQhlSz9HwiqA4W2HxEuQOug6ThqCh93ueF3WgWNcjqUMKqSCp5hlodm
	Q+96QyNlGLYQIX8UcGG8EwVwPM=
X-Received: by 2002:a05:600c:3b18:b0:498:273:3271 with SMTP id 5b1f17b1804b1-4994e72f648mr14489415e9.1.1785876981674;
        Tue, 04 Aug 2026 13:56:21 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.116.176.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4bf820sm12070645e9.0.2026.08.04.13.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:56:21 -0700 (PDT)
From: Max Pedraza <maximpedraza@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Max Pedraza <maximpedraza@gmail.com>
Subject: [PATCH v2 0/6] Boot logo supplied by the device tree
Date: Wed,  5 Aug 2026 00:56:11 +0200
Message-Id: <20260804225617.264861-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series lets the logo be described by the device tree instead: a node
compatible with "linux,boot-logo-clut224" under /chosen supplies the image in
the same paletted format the built-in CLUT224 logos already use, and the kernel
prefers it over the built-in ones when it is present and enabled. If the
node is absent or disabled, nothing changes.

The image can come from the node itself (patches 1-2) or from a reserved
memory region the bootloader filled in (patches 4-5), because the image and
its placement are independent axes of variation. One board sold to several
customers wants several device trees differing in the logo. One customer
with several products built on that board, with different panels, wants the
same logo placed differently on each: there the image belongs in a shared
binary and only the placement belongs in the device tree. Patch 3 adds that
placement.

We have been carrying a cruder version of this downstream on an AM335x
product since 2020, across a handful of board revisions, and it has removed
a real maintenance burden for us. This is an attempt to find out whether
something along these lines is wanted upstream, and if so in what shape --
hence RFC.

The v1 discussion turned on the obvious objection, that a bitmap is not
hardware and the device tree is not where it belongs. Geert pointed out that
configuration which is not hardware description goes under /chosen, and that
Open Firmware, which the device tree descends from, already carried a boot
logo in that spirit as the oem-logo variable under /options. The node has
moved to /chosen accordingly, which is also where simple-framebuffer nodes
live, for the same reason: they describe what firmware handed over rather
than what the hardware is.

Patches 4 and 5 are separable; the series is useful without them if the
reserved memory path is thought to be one mechanism too many.

Not included, though it exists in our downstream version: a hook in
drm_fb_helper so the logo is drawn when CONFIG_FRAMEBUFFER_CONSOLE is
disabled, which is the common case for a product that only wants a splash
screen. Today fb_show_logo() is reached from fbcon alone. That is a DRM
question rather than an fbdev one and deserves a separate posting.

Notes on the binding:

  - The palette size is derived from the length of the "clut" property
    instead of being a separate property, so it cannot disagree with the
    palette actually supplied.
  - "data" holds plain palette indices. The 32 entry offset the frame
    buffer layer reserves for the console is an implementation detail and
    is applied by the kernel.
  - "logo-position" and "logo-offset" are spelled with the prefix because
    plain "position" and "offset" are already used elsewhere in the tree
    with an incompatible type, which dtschema rejects.
  - "logo-centered" overlaps with the existing fb_center_logo, but it is
    per device tree rather than per fbcon command line, and it composes
    with "logo-offset". That combination is what panels with a partially
    visible area need, where the usable region is not the centre of the
    mode; the hardware this came from is an 800x480 panel of which only the
    bottom 320 rows are visible.
  - The reserved memory path takes a "memory-region" phandle rather than a
    bare address. The reservation is what makes the memory safe to read at
    all, and it is what gives the kernel a size to bounds check against.

The byte arrays are not written by hand: patch 6 adds ppmtodtlogo, a host
tool along the lines of the existing pnmtologo -- plain C, no dependencies,
no quantization of its own -- that turns a PPM image into the node or into
the memory region blob. It is what produced everything tested below.

Testing: build tested for arm with CONFIG_LOGO_DT_CLUT224 both enabled and
disabled, W=1 clean, checkpatch --strict clean, dt_binding_check clean. The
schema was also checked against deliberately malformed nodes, including
supplying both image sources at once and neither.

Boot tested under qemu-system-arm -M versatilepb with PL111 and fbcon, at
16bpp, both ways round. A 160x120 logo placed with "logo-centered" plus a
"logo-offset" of <0 120> lands at exactly the expected coordinates, and every
pixel matches the source image once the source is truncated to RGB565.
Supplying the same image through a reserved region instead produces a screen
whose logo area is identical. Blobs with a bad magic, a geometry larger than
the reservation and an out of range pixel are each rejected with a warning
and fall back to the built-in logo, with no crash.

That boot test earned its keep: the first version of patch 3 drew the logo
correctly and then had it erased, because fb_prepare_logo() still reserved
only the logo's own height while the logo itself had been moved further
down. Nothing in the build or the static checks catches that.

Also boot tested on real hardware with this exact tree: an AM335x board
(tilcdc) with an 800x480 panel, running the master this series is based on.
The product logo comes up where expected both ways, carried in the device
tree and taken from a bootloader-loaded reserved memory region, with the node
under /chosen and nothing reported in either case. That system
builds without CONFIG_FRAMEBUFFER_CONSOLE, so the drawing there goes through
the separate drm_fb_helper hook mentioned above as not included; the parsing,
validation and placement exercised are those of this series.

Changes since v1:
  - Rebased onto Linus' master; v1 was based on the v6.19.14 stable release
    and did not apply anywhere useful. Sorry for the noise.
  - The node moved under /chosen, per Geert's observation that this is where
    non-hardware configuration belongs. The binding and the tool follow.
  - The binding notes that a product logo is normally covered by trademark or
    copyright of its owner and that such a device tree is expected to be kept
    with the product, after Ulrich raised the licensing angle.
  - Dropped the second binding example: with the node under /chosen both
    examples define /chosen/logo and dtc merges them, which then fails the
    oneOf. The reserved memory form is documented on the property itself.

Max Pedraza (6):
  dt-bindings: display: add a device tree supplied boot logo
  video: logo: allow the boot logo to come from the device tree
  fbdev: honour the device tree boot logo placement properties
  dt-bindings: display: allow the boot logo in a reserved memory region
  video: logo: allow the boot logo to come from a reserved memory region
  video: logo: add ppmtodtlogo host tool

 .../display/linux,boot-logo-clut224.yaml      | 152 +++++++
 MAINTAINERS                                   |   1 +
 drivers/video/fbdev/core/fb_logo.c            | 174 ++++++++
 drivers/video/logo/Kconfig                    |  13 +
 drivers/video/logo/Makefile                   |   6 +-
 drivers/video/logo/logo.c                     | 256 +++++++++++
 drivers/video/logo/ppmtodtlogo.c              | 402 ++++++++++++++++++
 7 files changed, 1003 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/linux,boot-logo-clut224.yaml
 create mode 100644 drivers/video/logo/ppmtodtlogo.c

-- 
2.39.5

