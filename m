Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF86C415F12
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376426; cv=none; b=KIEZDpwN+bw6K8thg4N9Xv39JAXv7LYYIQjjDP0QanhKTGNW1gP6Z6ioNbD3bYKaspXUgLSGq9/SaxW5TIaWgHoZLSTXLCiqX9HjFdqDxYi5jRANO1fKrg7Xbyfm6QexgR+S9O3fQv4rCtBB9+P22t8uyzZZAzQlI+K9hDV2KqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376426; c=relaxed/simple;
	bh=2Rugtt/7JDpy9RGV9bzJMcXV+H97+e4rQsPhr7kG+Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X1JGdCzGVKtvqn06ml3l2wNXNcuIjq1YcVldqG3+Pg0V2/iu4YV4X1Opv3po2Sl2fZOoDJw8DqoCTGCl3xhAaO955xoFh+7Ev0TtVi0C7wjUci/vh9qlkLt40KT8NYw/jekrERYyttIA/Ksqwj7bvDK+QkaE1YctcyxqjuEBkqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJXYV9r9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJXYV9r9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so14391035e9.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376417; x=1789981217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6dLCC4SP39QTvmzDlgaQNGqLw7x2HJIM7l5Mx7gUsk=;
        b=HJXYV9r9hXsuToVBPJd/y5kOMb7pC23MLkhc9LHQaeZqjGYyAwOWAzQEX1B7lo+KCI
         p81gN9p6Fje6O9XqcwyZocOhQ/07549uXa6YKVlGzS96g9kBkjvuzvuPuDd7N9UJV7wT
         jqHW1aI7Y2/LfmBTpbwNPL4FwuqSFIGQtZwOzgpaAmaOMUyqkcR/T/hio5kBhoNvIyf9
         A8JBkZ8uQvsIsuIDxACwK74//7iQ4M8LLp9DLWr6k3POvVygwNZvNkSZZ+ZHCazibnSw
         SDfDd471keSfq/F9RdUyca6mzP95cR9ond5QsabcV/yDqbGDscNdpeKIlDHZLdlSDGUn
         P9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376417; x=1789981217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6dLCC4SP39QTvmzDlgaQNGqLw7x2HJIM7l5Mx7gUsk=;
        b=qO0zkzRWEflKgXozlUQ4KiQGrl0LpqVzqacPqVGGP2N3J6HRNmrv6LHx9V7H/s9ovJ
         zgtCSWRaWsVgwTh74+B0WzUlUIl3+b/YxUrFndE3tTE+Pp4GIJ+B26XfG32lxA3XiZen
         pmpWz0BEkdgwcWf0B7YrlKAhsq8ST6StX+RLBe0ZD7JZC54ktB9hMNnUIxyFTYGYPvyS
         sRYdG+XSdQnM/+clcJjE5AtQ7j5FrWhERB0bV9zFQzyM71N1ZNnC4SC3vJWQ1YiT9mbs
         GPLTaVmh1zfWCfjNjeArmdbPHMVb78c8tzcvaerw63Fh23GaSRFOT7HY6SOYqiiI0IeZ
         +vaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy93YdOvI3b7kCVtXJKy1/LzQqlZTeUqGwRUzLKPqhD3zBIefQP8r9eZ4UxBzLbRQhh5SxZhloC8DGd@vger.kernel.org
X-Gm-Message-State: AFuF++mKTqpeNtHmQy7J6ERLyU10rerrSTYWfELk+Wi0uXyYjLqxSsr9
	ytbt0XfKh1df9GqL6XouVVN+oIzWwNPCYKWTGKCcgFB2OWd2cGyaSjD4
X-Gm-Gg: AYBFou22RBIUERKn7OnmqREVSicsyMvLNp8aVPMmRdlVlv0PKTICd2caaS2QewpftIu
	XhLm/9KlGXnIm93LZkOnRxYUgax43ckp3Ww3RlteUcnyFjxPduO1+9k+v2rGrpJAVAGSNThnVPe
	/sYal7Kr8t2tktDYZsEL43rhQJD/2ggiD2O81LxY7oEA6pazLbxBvuBktZ6FW7paWvFeWJUS7VT
	A3wQkqgCuOiY106Y0+m49ncYJkBNYqqZKjKB3q+e1qLzodisNrsuvSgR05IKwcV0GDjWDJBJgd7
	TKj0B41AuUdDuaZaVDIQBA+OB+UBHncdvMngvOcgTCM/z/R60DImff8AcvQ0ZsmDsKgOvuyUPV2
	K3T1MzCRqUwLYGtw9YBWLJcS4Hv+O4/cSVFcofm+7kpLxvDqsazxYjSIiBBCPTDFTy/UdcQKaMg
	GPzqXvaKPgJdHjft0ycyrfnF8eCsr+gHg91MFiFyoeKnTPfpfO3vKm7wNpGQZWOyoIQKe0WIMKe
	ou4CuD7htgnhw==
X-Received: by 2002:a05:600c:6090:b0:49c:fa21:1c7e with SMTP id 5b1f17b1804b1-49e7a68c9bamr14829435e9.19.1789376416688;
        Mon, 14 Sep 2026 02:00:16 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm25245851f8f.9.2026.09.14.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:00:16 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com,
	holofermes@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amit.barzilai22@gmail.com
Subject: [PATCH v6 0/6] drm/ssd130x: Add support for the Solomon SSD1351 OLED controller
Date: Mon, 14 Sep 2026 11:59:25 +0300
Message-ID: <20260914085931.66857-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Solomon SSD1351, a 128x128 65k-color
RGB OLED controller, to the ssd130x DRM driver:

  - Patch 1 adds the device tree binding.

  - Patch 2 switches the SSD133X family from RGB332 to RGB565, bringing
    65k color to the SSD1331.

  - Patches 3 to 5 are preparatory cleanups requested on v3: constify
    the ssd130x_write_data() 'values' parameter, convert
    ssd130x_spi_id[] to C99 initializers, and reimplement
    ssd130x_write_cmd() as a variadic wrapper around
    ssd130x_write_cmds() so a single loop remains.

  - Patch 6 adds the SSD1351 as a new SSD135X_FAMILY. It gets its own
    primary plane update/disable, encoder enable and backlight
    callbacks; only the callbacks with no family-specific logic
    (ssd133x_primary_plane_atomic_check(), ssd133x_crtc_atomic_check()
    and ssd130x_encoder_atomic_disable()) are reused as is. It also
    sends command parameters on the data path, handled in
    ssd130x_write_cmds() via a new cmd_params_are_data flag; see [2]
    for why the split lives there rather than in the SPI transport.

Testing:

  - Patches 1, 3, 4, 5 and 6 are tested on an SSD1351.
  - The SSD1331 RGB565 change (patch 2) was kindly tested by Javier on
    his SSD1331.

Thanks to Javier, Andy, Krzysztof and Fabio for the reviews.

[1] v5 of this series:
    https://lore.kernel.org/dri-devel/20260823111959.17029-1-amit.barzilai22@gmail.com
[2] Command parameter path discussion:
    https://lore.kernel.org/dri-devel/20260811122603.30773-1-amit.barzilai22@gmail.com

---

Changes since v5 [1]:
- Patch 6: move the zero length check to the top of
  ssd130x_write_cmds() so it guards both command paths, and comment
  the len == 1 early return.
- Use the "Assisted-by: LLM" attribution form.
- Rebased on drm-misc-next.
- Collect Andy's Reviewed-by on patch 2 and Javier's on patches 4, 5
  and 6.

Amit Barzilai (6):
  dt-bindings: display: Add Solomon SSD1351 OLED controller
  drm/ssd130x: Change SSD133X color format to RGB565 from RGB332
  drm/ssd130x: Constify ssd130x_write_data() 'values' parameter
  drm/ssd130x: Replace positional ssd130x_spi_id[] initialization with
    C99
  drm/ssd130x: Implement ssd130x_write_cmd() on top of
    ssd130x_write_cmds()
  drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support

 .../bindings/display/solomon,ssd1351.yaml     |  42 ++
 drivers/gpu/drm/solomon/ssd130x-spi.c         |  25 +-
 drivers/gpu/drm/solomon/ssd130x.c             | 421 +++++++++++++++---
 drivers/gpu/drm/solomon/ssd130x.h             |  10 +-
 4 files changed, 433 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml

base-commit: 766bfba0f3bae329f99b42dcabc3ef11fa368f0b
-- 
2.55.0
