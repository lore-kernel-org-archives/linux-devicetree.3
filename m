Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F2C4A7C86
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581730; cv=none; b=lww9EhK4gD3Ues7qjfR0GgPWKgKOR7u+qv0Q1ngdSOBvcfLjdtegKKaBFcN4y/w0epSVOaGHi1fXTtLd9JqiH/D/ENM6PNeJ4osBFMEerxFW29gferS6ho5OHBAI48m0XVmS/4sIv/4Ve54wMeApxPXvBJ6sdBIsytcjmcxoukA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581730; c=relaxed/simple;
	bh=75SENsRN4O/nOyHqJvAuUsIuMlAumtxJtXkKijUIMlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfgMtkaEmxk9U+4OROib+/HRmfhtw0sO8gZpsxgxi+R5dFN9BxIDZMmFVjm2qdSDO2CTuzsp1jw/rVVq2WJjwhZ2gAXT97di2bM3ziSHMlXPQJKihLanOvV2A8ebo54SrdxIoTt3M4LD8MwgvNmXRrZmm+u7Hw7LugqmMhplp8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTZMEwql; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTZMEwql"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ca696d43so177887a12.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789581682; x=1790186482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zR4pKSFylW/FPLWgCmmFMf3xKUuXlJtRP0WK8xx/BHE=;
        b=iTZMEwqlzVWYqR0FajFejmfbZcQhIkQnqpVyvAw/++L+GNTfZxgglNdWPewLYxc2bw
         E7YcruYbxXzIQsunSxioPekNjAn589yI0ismkUdG17UfQwgPU/zE5bcYz8BrRkBCVyQR
         AM7OsNxa4jZX5Eh67rq6Uo083jo89kaQeL4i75GUJakewfQL3grvqQwEPbGU6jPezi5V
         WOOPxx3aOqEpJVjVjfdR4iX7PswZrVnnhOC6AlmI5ma/bAx+/TyWS6AO3aqr5tjhFMq2
         nUcDntZF3mWGB4XO3aKRfz9dqmXA8rVKXZqkQ/7psloAMpBQY2rit/Ip9WAbMiC4WujV
         PkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789581682; x=1790186482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zR4pKSFylW/FPLWgCmmFMf3xKUuXlJtRP0WK8xx/BHE=;
        b=NxPHY2PPoVWCo9UkJGCY2IAsYdhGR+FpCKH0PwhwYxjD+zaE3gRpQEiEJZkcIWtXBF
         XMJJqFilqh++MVkpAuhTBH8cu9AVtBNqIRKSwRr+HeW96dSTLBHmA2/A4uqciDPxjA6z
         NHno9OidBjcyiWEvT+RIYSDmFpQWsnzYm2eiwGFv4EMm+lmp9Jsj/OSKNvm9Xb1ekuPP
         89SvgCTteACB/ReeNY+MmdWO3L9JW9Oex6FxRe95CRwzfVO6F8Jxw1d5OURIIEcPEZfj
         mgJHCofe4qOMy5BZSAxPd8U65OQhSErQ68yrB6XOsTkfiKunULzuky2dHcX5yl37fTQg
         G2Tg==
X-Forwarded-Encrypted: i=1; AKwUvBwU4G3yyAXy782yf+w/HEhbDiTXauLJ72eRM369ZYu+YiKmc4CDj9MuU/MO2YwtlnUuoxWtK/TJO5cY@vger.kernel.org
X-Gm-Message-State: AFuF++kkHU+V5KcydLmHVsNPeqVg15rwEdRleKTOEWEEmsaST/SsgzuH
	s+lmDWvVHJr5x5OWapUfgN/JUQecWvsIa//Xnvd/MlDvCyB6ESrKFrNQ
X-Gm-Gg: AYBFou3lFvKlFyymEcgkeCV1iYgMgw7W6lFxEdimNK+wKTIlo5Lb32p/o1T2tZZlaXq
	8ugM1tWHd0IHW86FonCQ0RTlIKyv8Radbuz0RieJstsmL7BeAd68Qzwdus/kLV4HkD/h2G6XHNU
	Vbyvff89avtMhfIqiDqI6SiXN7LZQw3hyvI7VRaPK020nyoUtMKvkH8h8UpxZRvQ5FP4uDINQ/H
	WDV9xCJKJjgUcajWbG+ehrFn0RqDdZMaHpkUQ0RILs0To49vHv/K2b1qiMLus683mPktg2CWOkK
	DwGYMaGeGx3/X7WGoDrRhmTd0ojgBpg20INut2wHs7SjlMdnjIw/OU5motT815IlhIq3S4qoceJ
	AqkxOXSAsIbT08JJrnmEzQtyZayza8QhMH6NXFbljcRS7f0AtVdhbm8gvlvIGM4Td3ywDpWuN00
	+Lvbd/zTtG2hLnvQeuonaz9bvsalre9pHlCI7+anVRJ9RWm49/Cz1Hx6ZUNqLq3XCjCkrRkxk=
X-Received: by 2002:a17:903:90e:b0:2dd:7671:3101 with SMTP id d9443c01a7336-2dd8e428bd1mr50842225ad.3.1789581682196;
        Wed, 16 Sep 2026 11:01:22 -0700 (PDT)
Received: from marchy ([2402:1980:e96:7839:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ee0cc9sm16195875ad.46.2026.09.16.11.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:01:21 -0700 (PDT)
From: Adam Azuddin <azuddinadam@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: jesszhan0024@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andersson@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adam Azuddin <azuddinadam@gmail.com>
Subject: [PATCH 0/2] drm/tiny: Add RAiO RA8875 display controller driver support
Date: Thu, 17 Sep 2026 01:59:40 +0800
Message-ID: <20260916175942.3186804-1-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new drm/tiny driver and matching dt-binding for the
RAiO RA8875 SPI display controller. An fbtft driver for this chip
currently exists at drivers/staging/fbtft/fb_ra8875.c, but fbtft is a
legacy fbdev-based staging driver, and nothing in mainline DRM
currently supports this controller.

This driver does not use drm_mipi_dbi. The RA8875 SPI protocol is
structurally incompatible with both Type C options drm_mipi_dbi supports.
Type C1 encodes command/data as a 9th bit within a 9-bit SPI word. The
RA8875 uses a full prefix byte (0x80 = command write, 0x00 = data write,
0x40 = data read, 0xC0 = status read) sent as a separate 8-bit transaction.
These are not the same thing and cannot be mapped to each other.

Type C3 models two transfer types via a D/CX GPIO. The RA8875 has four
transfer cycle types and no D/CX pin. More critically, the GRAM write path
is stateful: an MRWC register-address transaction followed by a streaming
pixel pump under a single CS assertion. I thought this may be too
complicated to cater towards, but please let me know if this is the
correct approach.

My ER-TFTM050-3 board has RST tied NC, and VDD is a fixed supply
set via an on-board solder jumper (3.3V/5V) rather than software-controllable,
so reset-gpios/vcc-supply are not implemented in either the driver or the binding.
I can add both as optional properties in v2 if reviewers know of RA8875 boards
that do need this.

Tested on a Raspberry Pi 3B connected over SPI to an East Rising
ER-TFTM050-3, a 5" 800x480 panel driven by the RA8875.

Ran fbtest (https://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git) against the
resulting framebuffer:
  ./fbtest -f /dev/fb1
  Using drawops cfb16 (16 bpp packed pixels)
  Available visuals:
    Monochrome
    Grayscale 32
    Truecolor 5:6:5:0
  Using visops truecolor
  Running all tests
  test001: PASSED
  test002: PASSED
  test003: PASSED
  test004: PASSED
  test005: PASSED
  test006: PASSED
  test008: PASSED
  test009: PASSED
  test010: PASSED
  Benchmarking... 10x10 squares: 74.24 Mpixels/s
  Benchmarking... 20x20 squares: 152.49 Mpixels/s
  Benchmarking... 50x50 squares: 334.09 Mpixels/s
  Benchmarking... 100x100 squares: 591.46 Mpixels/s
  Benchmarking... 200x200 squares: 999.49 Mpixels/s
  test012: PASSED
  Benchmarking... R5 circles: 45.90 Mpixels/s
  Benchmarking... R10 circles: 98.84 Mpixels/s
  Benchmarking... R25 circles: 236.37 Mpixels/s
  Benchmarking... R50 circles: 459.98 Mpixels/s
  Benchmarking... R100 circles: 851.43 Mpixels/s
  test013: PASSED

Adam Azuddin (2):
  dt-bindings: display: panel: Add RAiO RA8875 display controller
  drm/tiny: Add RAiO RA8875 display controller driver

 .../bindings/display/panel/raio,ra8875.yaml   |  66 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ra8875.c                 | 739 ++++++++++++++++++
 6 files changed, 827 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
 create mode 100644 drivers/gpu/drm/tiny/ra8875.c

-- 
2.55.0

