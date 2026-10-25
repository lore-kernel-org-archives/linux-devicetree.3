Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955803;
	b=y/xqQw1tHijzSV0/dOGGIewXWo4UfMZ3pJjRWGvFfdbrCzY5eJM+X8VG6mH/s/bqj2yr
	 dN2/9IWRvtMfkusnBoDa1ZMmUNYnHmWCeX4+tRjWUbQfaZ/fpZM9xIoAWgU7hC1VExH08
	 pq1BTGyG9Pplc9CYj4Y/lK0v32BVheyhRJBx1MdnSFfR3sRMKH+xB+8L67r4dDI/NJpcF
	 /hV9XPVmvGsbH6gJcz+skhHuSje18jrNpcsArKpyFDmLILvfrhW9ocsM4F5H3zEGsgmMf
	 FAtfi1XsmPc6ZAeIDt9WwmASpcI4mqaGPc+uWtkNCPNN3RVuqG/LEO/nKJMVleRfzNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4nx2+DECqgeu/AGfuDB9I8gflqDb1c6vzu+N1VHtydM=;
	b=aLFb3eXZm6ssueMrdByjYB3KJtJ80KxzG5d6zIa2+qrCE/YEu4qc5vy3RW8Sl7B3njCA
	 OzvGC5CDRvdWwk/Co6kMJsV1Gv/Fe9j82ICjHVhWDLKuMpC+Flu4hJ9uplChMmQsXlCg/
	 /2zvzkDUaC//eN7LCxCwEq3q5bda7biEwFJD/h5BFUV/DZpG3Th0/nNRyS7jep0xI5jhc
	 dS35EMHWgrVSgtz4HOv6lsZr0WGjMmL5rmEDjmHv9obfMjvqLnu3fY53mFSfIuC9ccsQs
	 v3BVgisD0tWu6VAgKK4t0RxJa71ZWUxXsEVdWXOdr4Km/7kCcHvT4zGfU3XSMxTRyqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=T6ddVQ7N;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B396B606A322
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 19:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B396B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=T6ddVQ7N
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso18758605e9.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955801; x=1793560601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4nx2+DECqgeu/AGfuDB9I8gflqDb1c6vzu+N1VHtydM=;
        b=T6ddVQ7N41HrejcDkSqEKiLdWbytoiYFAaZQwJEhlWF+3UF5FgRjNSqseXWi8cw/Et
         gT3TvWWwZqpgjKUlSI1ljMYSZ7gJK42IKYkn9RFzN5/mJ6hpQL5/5knbAwngdHKQo+rn
         hDmOwP4IweQNApCHVexkl4AW/vLbkiw7rjgffY9VSSQLgmRLM6Mhki6FHGzJZ6T9jvpk
         smOUxq/cvdGfmd8Ejo9l0K0NzOvqXjnFscI5Ml2HsYXWb2k0WgMMPGeAD1ReesA5TlHO
         C41r4yifaN50gxYH0X2n+MQVy1XPhaoq7DqhHBOEp/WP/uNxJCtMUQWoklpiSQd+bE1u
         XxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955801; x=1793560601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nx2+DECqgeu/AGfuDB9I8gflqDb1c6vzu+N1VHtydM=;
        b=AyoXk75RQmsVzs8kjRNESOqChLdpn0j/tR6oA6R6TypBOAB+VebAXUa3nLeBhfiVGQ
         QhB+6sQrPpzbM6LkcsJIwWQp1g3R5s1KUui/Tt1v+a/pR6yZ72DhUnAxJI++2Q/Orkpu
         3uhRiDbftImnK5Qx8uPbOcCrLXxirb92IeMeWnshRHszMP7q1KehG5V2AYQb6Z2CVfsu
         8vFp8ceAcALwDUT2sOty/iYBPVKvq1bg/x9mXZg++yDRULhOwd0x+PkpBeMEtV432y6B
         MvRUs5u5D4oGXPp2SKi01VWHZFqdmzKUfbhalpVAC3tKQyFX/NFezl8r8mc4HJkeFPGq
         f3xA==
X-Forwarded-Encrypted: i=1; AKwUvBwcHY80Eh1RPwXP24Z8Aw3+b6o5O2TfFJRNWhLW2KmP2MzvzM6LlxvaOXNxtcZeGKzKhlKnzDOEPhqm@vger.kernel.org
X-Gm-Message-State: AFq9FYIfWauRyU8SR3oiYZLe1WnF6IptBFv3G51E08jERz9bMJJH84ci
	TqiVut9YnJSIURnSwYO7cn9rFI6SGx7wmqZPJsLQwDwqjTtyJmMZUTEAEgpuKeHfUg0=
X-Gm-Gg: AYBFou0FHTWaDIdVWYtiIZ9NTYyBHBQ7/Ti27ioJn3TOPuHdGYHT1N0uNQ3NR+S+4T+
	gS9itSiVt3LXUH4ouUyrA6PJaQ/CTpVstTQWdYWjgQ9uaWUYzzrMrsY7AvACdCQ35JVXvsWgBP1
	uGMtFPlBhAmeqnuW8kJUyDVuUDybEjT3tmZH+wMx0o7UD+/aj8+Iu7vJsP1OJJLH8OKPf8VHwuY
	6WxFFxYyUVRNuD/J7rFpIW30Ox3JYgu3NSFzglC5Mbk96jpfocrdCSzC3fE1SmiUSKXtbePZjmq
	Au8Tps0N3LVJPQTBgqpMoZannjE/ggkwwoIliSmJC4H2uc4KCQUq/KouGqeBXz8H+dg0Xt6Elga
	j5nK3LOvIIcEx2S20BJFFosdqJ1oC6atQxb5IVQQit7zCApmE156NaikgmloL5J8IVoLeG15n8S
	66khKe9GgDIdKXLMA8KwWM9uDqHyTF4DWP4eirwKbyDUJ8L5s87x3NO7D700FSb9Zaocm7aiL09
	bmAdzjon8o4eRjqVEr1AgHp/AOU17t4Omkq+n675Yw21ZnL0djC07EeZ8DVWcugjsOMwvh8PVHq
	lVdizR5u0DAzig==
X-Received: by 2002:a05:600c:4e87:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a35aca7643mr101451135e9.25.1792955801092;
        Sun, 25 Oct 2026 12:16:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:40 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 0/5] drm/ingenic: Add the X1600 LCD controller and the HiBy R1 panel
Date: Sun, 25 Oct 2026 20:16:35 +0100
Message-ID: <20261025191640.13592-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display controller of the Ingenic X1600 is not the one ingenic-drm
drives: it fetches frames through descriptors and keeps its interface and
timings in register blocks of their own. It is the X2000's controller
without the composer. This series adds a binding and a driver for it,
then the panel of the HiBy R1, an X1600 audio player: 480x800 parallel
RGB, set up over a 3-wire SPI bus.

The driver covers what the R1 uses and what could be tested: parallel RGB
panels on a 24-bit bus and one full-screen RGB565 plane. The composer,
smart panels and other pixel formats are left out.

Two things come from the vendor kernel rather than the manual. A flip
also writes SRD_CHAIN_START, which the manual doesn't describe for a
running controller; flips without it were not tried. The panel's set-up
sequence is the vendor's too: HiBy calls the panel LG35583, its maker and
controller are unknown, hence the hiby prefix.

Changes in v2, all in 3/5 and all found by the Sashiko review of v1:
- Commits wait for flip_done instead of a vblank before the planes are
  cleaned up. A flip's event waits until the controller reports reading
  the new descriptor, which can be a frame after the vblank that v1's
  default commit_tail waited for, so the old framebuffer could be freed
  while still scanned out.
- A CRTC being enabled sends its event from atomic_enable(), once the
  controller runs; v1 sent it from atomic_flush(), which runs first.
- A plane that is not visible is rejected: the controller always scans
  out a whole frame, so v1 would have read past the end of a small
  framebuffer placed off-screen.
- atomic_disable() returns early when atomic_enable() failed to start
  the pixel clock, instead of touching an unclocked controller.

Tested on a HiBy R1: the fbdev console and a player drawing through
fbdev, blanking and unblanking, 60 page flips in 0.97 s at about 61 Hz,
and the colour order (RGB order swaps red and blue on this panel). For
v2 also: 120 fbdev pans in 1.95 s (one flip per frame, none timing out),
three blank/unblank cycles, and a 64x64 framebuffer set on the primary
plane just past the right edge through SETPLANE, which v1 accepted and
v2 refuses with -EINVAL, while a full-screen one is still accepted.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time. The R1's backlight uses the X1600 PWM driver
posted separately, now at v2:
https://lore.kernel.org/r/20261025191624.9219-1-olivier@mgcrea.io

v1: https://lore.kernel.org/r/20261025085816.60405-1-olivier@mgcrea.io

Olivier Louvignes (5):
  dt-bindings: vendor-prefixes: Add HiBy
  dt-bindings: display: Add the Ingenic X1600 LCD controller
  drm/ingenic: Add a driver for the X1600 LCD controller
  dt-bindings: display: panel: Add the HiBy LG35583
  drm/panel: Add the HiBy LG35583

 .../bindings/display/ingenic,x1600-lcd.yaml   |  70 ++
 .../bindings/display/panel/hiby,lg35583.yaml  |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  12 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/ingenic/Kconfig               |  22 +
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c   | 744 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-hiby-lg35583.c    | 342 ++++++++
 11 files changed, 1276 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c
 create mode 100644 drivers/gpu/drm/panel/panel-hiby-lg35583.c


base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a
-- 
2.39.5

