Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305D23BB4A
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776628770; cv=none; b=gfl0IQh8AeocGG8wnwc6K0HyziJe0AI2XoiPYPTiQf/oo/Z+Cnokmn2XlzKOf8z84XjlrhZa7Ch681PYolWcYhlkiDrPsMbtNXkknyJEDWE8VvwE7yavUugPziTLGUJyir0HHOoTS+q0daNGFT5uxX0UublKe43fEmi/kx3gi14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776628770; c=relaxed/simple;
	bh=yYJIIth611iq11YOjRUmN/jW4oJDgxU8uYIkrO7H0k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BF8f9xSO54rd3iFCrVpCoC9SFrp+6FtIECkditjSdmBn84Pvjj/HQZej7zN+CXlYkGCuypPTpuuXSxH9RtozuJmIKUTVJqZRfRa0LmRzVpJaL8qYOLu0mQ4QTxlPyWUcsMFuiA1ddglzqnSF2L4HwW9BoG9MHMrv2oTR/F+NL/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qz8f6nLh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qz8f6nLh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso31647215e9.3
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776628768; x=1777233568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kmFIan17mu/w8oo/YbLoeCX4Y+0PS0/zX66M8FcpkFo=;
        b=qz8f6nLhaUA7YsFEkLJYkm0czyiJLFNfn6eYfezcZuw/MTn6r5wsLbslJa6Y7MG+Wx
         J2xwdNjBjRa2IKM5yFa/rgWpCq6asDM8hrwK/JeblrU1fa25tdG7KAGvnxNWeuAF2tOX
         6eOboACK56tFK5tb+MTmtHisi2hiq7DjIlzBhPbxKIckydWyQm6vI7biMRin4blO3D+C
         xNt5T5Bib19VRfem5m7j1Ex7I8W3trNC9vf8SAVNvh2yKzCJEa+/Ajpg0ux6Z1JLhj0I
         LJa+LJofTIWdJGlQZOE1HNR7pINh1axpceed9vwRi0gtKx4QwXEPszEqMBqgvRXG8TpK
         JBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776628768; x=1777233568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmFIan17mu/w8oo/YbLoeCX4Y+0PS0/zX66M8FcpkFo=;
        b=eIhPNAxEr0hrchhsrhhle3VdvSrlW2nI5xpajZz1h9VnHlclbQ8nRysGHmGMXLxLn7
         Yvabm6J14byS8qrJgrx42ExSMDNSYq3bwiX80jr6kBHeZotyER8TU4DddjHdUJxkDy2c
         wwW4nuZqU45/v6jnGDstEEMoL5tTjA9UAJDeeyimuRo34fJQtqbDc4rv2D0Pcy235MYg
         b0Rp4fcKTUoZPyzI08Vv7qFlWLeBvlpO1ywaOEoOH2+yU1VpqKLk+qcKW60KmhOvpXYR
         INBT9jlR0AuFOE19LtUGdSV/i8KvlPze+1q2kGlucJJNH50ZWJ+M84aLMkWH7oQE5brx
         uwHw==
X-Forwarded-Encrypted: i=1; AFNElJ8AWZ2O+GTV5/bAGRJD0BhbJy847NHreWQu1uEbc8CM8rRoxzOuzaocUTRtx+M8EdVS2N9B6Csz5NWZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwhN3p2AfndrhvY0SHZPVDtHBj3E+J4Ozf+LxXqppCZLA54LbhI
	kh2nBZbUfuI30p3wPthHeV2uMl3UbWeom8XhmHY07asfPq9NWoStYQAg
X-Gm-Gg: AeBDiespTNIQuXKPUgd8iOnz1Pm5wd6ObKTL5FTWNSSb4ePjFzpLIrSw0SRozyNT72J
	/Oulu1e8j8mkOnLQOM2wihjM0r3zCij/gWmu79DwA8AntDi3MvZ/S/iFPFEfMap/E8QPYS9SIGH
	KAC5XArDNOp66tk+M7n73M1EkDiNEaYvuOqS49/f3QWndt9EoE2o02DEqJNoYKk99vRaj4Cn/Xc
	8t51iLovV1vtz4xyvg/gNvGNXRvUJhTBqnEkwrpfE9QAvTYF0ULhyKdyWoNk/1DtkYzSz6otBw6
	t0j417dBVgSzrqRy5aNXw4KJrF/jBFztlb1ZrfUskdFJ7Ef6lpWPkLOBoHaAtts004XUHIK+5S2
	KYXHrhTHMyWoVy8lEDV32zx/y0e4/z5V9phQwE3mo0Oh9kYyUWHLxUzfKEx4rXZwMARk5CejbgN
	8kkt+5uVdBa+5y49oKRI0=
X-Received: by 2002:a05:6000:2081:b0:43d:30b4:1859 with SMTP id ffacd0b85a97d-43fe3db2edfmr15961422f8f.7.1776628767526;
        Sun, 19 Apr 2026 12:59:27 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::d908])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46471sm22482179f8f.28.2026.04.19.12.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 12:59:27 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: wbg@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH v2 0/3] counter: add GPIO-based quadrature encoder driver
Date: Sun, 19 Apr 2026 21:59:05 +0200
Message-ID: <20260419195908.12202-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new counter subsystem driver that implements
quadrature encoder position tracking using plain GPIO pins with
edge-triggered interrupts.

The driver is intended for low to medium speed rotary encoders where
hardware counter peripherals (eQEP, FTM, etc.) are unavailable or
already in use. It targets the same use-cases as interrupt-cnt.c but
provides full quadrature decoding instead of simple pulse counting.

Features:
  - X1, X2, X4 quadrature decoding and pulse-direction mode
  - Optional index signal for zero-reset
  - Configurable ceiling (position clamping)
  - Standard counter subsystem sysfs + chrdev interface
  - Enable/disable via sysfs with IRQ gating

Tested on TI AM64x (Cortex-A53) with a motor-driven rotary encoder
at up to 2 kHz quadrature edge rate.

Changes in v2:
  - DT binding: rephrase description to describe hardware, not
    driver/sysfs behaviour (Conor Dooley)
  - DT binding: drop redundant example without index GPIO (Conor Dooley)

Wadim Mueller (3):
  dt-bindings: counter: add gpio-quadrature-encoder binding
  counter: add GPIO-based quadrature encoder driver
  MAINTAINERS: add entry for GPIO quadrature encoder counter driver

 .../counter/gpio-quadrature-encoder.yaml      |  60 ++
 MAINTAINERS                                   |   7 +
 drivers/counter/Kconfig                       |  15 +
 drivers/counter/Makefile                      |   1 +
 drivers/counter/gpio-quadrature-encoder.c     | 710 ++++++++++++++++++
 5 files changed, 793 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
 create mode 100644 drivers/counter/gpio-quadrature-encoder.c

-- 
2.52.0

