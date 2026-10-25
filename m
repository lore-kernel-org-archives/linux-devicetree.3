Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918700;
	b=UGE6Hw7CAMU/CSmglnksqNeBSmXdM46ww2IfXIvVQUQn1vE5ZYwuDiqnVAYp+OxV5H12
	 Ikws/uH4aAM+FQv1k9JB/RjoF7+/v5njLX4NOgij7hwoTDDuy14hXecQmteX/H+STk1Lz
	 mbllpr9KKmFpmRcJUMr7y0KlHPnKQ3lgelTIXGtBvtdPYQM5CEyQOIex0aTSqE+Z42bfK
	 lXfkBXfej5jQw7NhJmEWg1rf8iifjOkd94Q0Rt99CU6QED2Pp45eU0i6HITBYE8AnuEf0
	 7/zupaJjEXCckh8lE6FI+Awd4fL1bggSyHbBJ61VEhzUaTCFqgPkgs1E5XAH/XCFCqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/BvMQkzk3cbMAzfEoRy8m31ymEv5Jtrkq2HGUm904Yk=;
	b=PZmG4ketKfurzSH/KL3Y2ru38T683lvudMwnMk9O9IwKS4ksHmuSr7Wmtmdt8ddjMCfK
	 xJqmZaO80NVUPaf0je20740sURopCgS/tLFDjCz1IXtoCyG+kAlnoqq40DZYh3e6xwzOh
	 JM9DeeBj0fTiMyDH0c4UXCtOaQV947VHGOb0LJuGJIrl/y3ZNFsKs7MEbtlynq4gaKHSP
	 7kVO4GQeEsGvHsx+BMu+48581cYYOzspPkcmwrdoEVlphFhDg0mrVXSSOYMv3CizjBrzL
	 Z3tjApWnQBjvw5st2i22wE8GwZQxhyJADxf0PBpHdpXlH8FwcDfPdGo1beQI1BufYWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="dLVy/XcJ";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911AB606A31D
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 911AB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dLVy/XcJ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1605074f8f.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918698; x=1793523498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BvMQkzk3cbMAzfEoRy8m31ymEv5Jtrkq2HGUm904Yk=;
        b=dLVy/XcJWb0thYquOmIcYdfzl0P1c2YSLpBRkjuSdyRJ+UUKKFPZPFsfNvJxNRvqCR
         AkSMLKuPjy58EjPt16lzhKSpXMwtLC+q7OKkH1OflLVqZz8hwzBln8NnOpuRlCyF8ezu
         sU487CxMyU6k/qahPzygle3JA9vcUmCNXZJ/6VdEm2P+99g1EpsncYOq8pA1ZYGXMfdo
         n5RmHN0LVnp1Xca/VlP7Jr8a+HWVMN+m8j0n6Ts3W/W4lrIlq0//d0dbtCzLkMctAz+9
         y8KR9BiNFoODPZ827pzXptfhmYnDV3TzjpGnE7TrsWC6nu003Ka3vLNnKkqv1kMpB1Fi
         u3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918698; x=1793523498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BvMQkzk3cbMAzfEoRy8m31ymEv5Jtrkq2HGUm904Yk=;
        b=uP1+iydnyxJJy6JzOvISAq8+wqOe8Zz5HIcP0/N7lbf7gsM+/XgH8R1NOK1L0yypXz
         JpKcrCT1jnYOPmxQp/HDKR6oNo63sZ5Ed0O97RRegUji6/of/JNOrjc5E0as870ZqImZ
         lQB4Ra4gY7RTYWZ0/G0h+12Sm7JHvEZL2niwPnNgbaI5Vuc5XXIKJQNvsraDgSRp+qx1
         10JEjggDzaR9uMg8uepI3KvfmiMSqAuDNN2Ypic0xaYoWoYfWDN+18/HGt8C4beiOSk8
         diEPj4aXgQKliffgkQg2Fs2FdCCOR+FFVzpn1p5E73/dzW+AwFsfhoCH5mb3bHNt7v9X
         b/vA==
X-Forwarded-Encrypted: i=1; AKwUvBzRWYAmOyZpvY4KaaAkvGn0kkH23oYXQ4yz2t9l3FIwyLpSAIMiDowqdxrvnA9PMLpWbMe3Jf2XNyQL@vger.kernel.org
X-Gm-Message-State: AFq9FYIniD6u6CLajpvBuYoVpXwIIwKnCASXozNvGq62FPzMQROqBGU/
	8b7uD3LHtVkV39TMMbM2ebdMR+vOHRigkc7wC1z9PCJO9phAiJMdMWk9CKFZ56fYGM4=
X-Gm-Gg: AYBFou1TnWr8Xo1WJhgOO9H4HNSUhjEUx8eUr7IzqkM+80indlpa15i3lXlS6HTH2u4
	RoBfmoF2ClOLkphznzDlgwLS7eL5caFbwsackL2lkMnNsNXpxH9TX0/4qUeqeOaYUDupVanSB2t
	XJVf8qjTh/Obs/tYmmz7rj7itakgV8hquw6DAOx4EfOOHKjDX6BU3zixMOxPRdsZMpR4fC4MjfJ
	w+zpjbSC5MVd6iqwGUyFrtR2R2MeeCBhrcFNPzEcNcxgdJo4D1OEwjwIB2iZ1gHQdR53WC0uDyw
	64OhGZEtdU1mNRSzVwAonAkjgIxrqRsScL81Q9NCcrHQPrbDz+gzPEE8D14hhyJaGV1Ru/5O0el
	wgd/nLSZ3imc/spwIod/SR9PO9rl3mFDuFiieNp4dnA5IOFYzSQqtRKW7wq48lsrg7AZLNu1FdA
	BmRdy0CtCxPOcHogwwOAtstsPRRWBw+Qil5lX9jAuEaLpowf+Q4si3/KZV8eq7ZxsxYIU4iocZ9
	lOQgJ2phnfOREcdPxK/DVX0WeEm89DpZYqYIt+Rx+j8pypoIpExMeY5kK3wL1jnBs0nVSiOsXN2
	0TGNj//3DSEkk914h8AE10DsIKLdNzCLbrMCuRueIE2aQsYtEaDF8d3Mi1dzEuKl5BVkSJgS+ae
	iOUSzSNiccaJzDeh/R0U=
X-Received: by 2002:a05:6000:1626:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-48e4ad232f4mr1415110f8f.29.1792918697894;
        Sun, 25 Oct 2026 01:58:17 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:17 -0700 (PDT)
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
Subject: [PATCH 0/5] drm/ingenic: Add the X1600 LCD controller and the HiBy R1 panel
Date: Sun, 25 Oct 2026 09:58:11 +0100
Message-ID: <20261025085816.60405-1-olivier@mgcrea.io>
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

Tested on a HiBy R1: the fbdev console and a player drawing through
fbdev, blanking and unblanking, 60 page flips in 0.97 s at about 61 Hz,
and the colour order (RGB order swaps red and blue on this panel).

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time. The R1's backlight uses the X1600 PWM driver
posted separately:
https://lore.kernel.org/r/20261025084643.93167-1-olivier@mgcrea.io

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
 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c   | 694 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-hiby-lg35583.c    | 342 +++++++++
 11 files changed, 1226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c
 create mode 100644 drivers/gpu/drm/panel/panel-hiby-lg35583.c


base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a
-- 
2.39.5

