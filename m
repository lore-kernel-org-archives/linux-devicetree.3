Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585040;
	b=KAjQsHQpW6nZMWiUdoWjlL+gEsw6iOQIr/c3F5AZ+TkapOLOsVeHpeKZklq5JZQHjWlv
	 1YiMcjboEefjuDXuqe8ixVWMXC53B1eWmUXCJPkHW81KYF8EiHEjvql5PeqsklWe5LHwK
	 8n7UNbPC1iaghX+8i7aGLq3LVdlkdgtCXFeH+MWspsA87QVuMBIDfbT+Byg8gGbqUS7pU
	 FbbO9tsO8HJyryDRydCf2ZoN77zhGydCpPnd3RrrXxDdk9gltma9zDCyJY7DA4RVxTNQ9
	 gi50TbCa0+K17t5FjMVsJvFMbY2/tP0MAFvGZXPWqwnr3QRzZOluP4nDvkKDxhe+aYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
	b=d6HuOK+nn8tKxfUjvkUo+E6Qr6AMoAuIW0aw72cTXkGSf3WX6d9zq4TecgHrJ3cjS0+V
	 DawuDvplvMeEPDNytzjpRJtg1Mg0RgPdQr40PReleNrWfIcsFm1diva413X7qSjiWNtHv
	 US3/Qowt9khckZ85EpPV/nTaYtx4PZd/fqAnXJ1ztdiuEssS1uO+JcMMHnIjGBpNwnoZ3
	 skYBHcZpD0XcNapZEfOFtGGKiWk+m0kPW5iCsgrR9bJlv+51DzjOgDAXFtztC0wdZxODU
	 rj3wQpNTbQXm4+kZ5k81L2Rpp85MESMY2HPAx9V04zZPdTGtVRuDDpnfPkhgIfmHqTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsG3too2;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0D0606A32E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C0D0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsG3too2
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so16224635e9.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585038; x=1795189838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
        b=rsG3too2KgoFZzoonq5v4A4bv6Mik5fbIf8ZGGba2IIuVzhugyGmL+2fCvOWYzuFXQ
         M8f6za2K65AQLfYlduTWD7GzpH549e1AlH+wKoNL5R3C2OrH86ldby5aa0766Rqvk77K
         8rRmXkWDlmcjAGonf0q0hS59yV0uppOtXtJAteYAm13HmuagwsilNVwU4tsYOfHi9oNF
         3a3JiWx/WxrdbDfSFKi3SMXk+AYHGm1AmFTDCd8hOb+LBsFrfNvtmkT5Wz7+3mkos1lw
         HqF3NDBa62+Z5HbdE5GqxY4cfna+hlCuapFxq2yM+sqhzFq0F7tkjxp8eVxoic2O2sLu
         407Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585038; x=1795189838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
        b=1SZCPo4OHGwYOTel3te6kBQmRdzLsXeVieJRvJ2IyosQlzciFE+RptYLWwDJk9ZZxM
         0S/HRnOC4LcXqEfWmIEZT9gtReecLbJd8MtNpnEdaw66ujGhFPuupoX5P6HBfFN81ME3
         xI9wOBTQRcjbFrFoR8v6VUfC87MO6caMez4uLwtASd4cHBqz6rAdawjt8VsqgYbG+UPt
         kf7lVqlFKxt6LXlQ/h6CfghgrL/JjAYg7iVpVOa7GR2ZB1MvYN7tduvk+T52nB5fYPcS
         BWQSsrLSVNWkcZO14vheZw1c0/oVIYyA52aQDnGpLavownUAoJSlu8vkqzOwlpoS3gkY
         cG9A==
X-Forwarded-Encrypted: i=1; AL+hErEO1w+dQDKtjVXBM0Irmc/jAY1Yans36RvYXr76lhZRT4UEEODFfgGP1FJv6asDsEvig2hUq5vhAui8@vger.kernel.org
X-Gm-Message-State: APuU4Z//FBiEcW02Qge+uBJjEwh8ZlVV1Kt0EY9bJDjwsdNeDxZO6dYm
	H5hIqrhbpoLIsvrYRr6S3Os+6zZ65+s6+dMfh6CrGurKK2W7wYfRlqJ2
X-Gm-Gg: AYBFou0vF13y/Svt1uftkzZIA9cv0vqtaQgvXcdAubY9nzIX7N+3FzlchAGaJsiBP29
	nNBHsadcFM5XIu7Tc+eQYPhTkNX2l98A3Y3yFnTAS0PqkNWoM/Ph4eiYQDsTUgQdBkDENL9n8fW
	VJpd0KD2GioTTslCTQ7uzJMWq7tnefHV/SB44A77vVXd539A2I04AgQTITCtBKaiKPc7/Gfp059
	UcWyj3puV53g6ORzU+L5pw0k7+i2iNryUtz1Du/dt2ZoXMvUm4+mPsm3Opfv4mHINMN1KY85kTn
	jMztL6LgCUdxHxbCtrZfrWzEp07pUfveNcDkilgnH1QR+PtHJQCz07ADnNmv2eja9XXLgZx8T3H
	SfyelOdoG1AnSfKSNGziQ/GFmAblkJGC1ifeYIZWAbrXGMsnZ8B9+/Ql8Wkiqz4ilc6wY2k+DxH
	3lkPUdQaw+7FY1W3BZ+L05hpDZOZgK+kCLHE7d5FIjlxu8ND7UZqcrc6TKnme73I3JWjMI4tg95
	BL7+Fea0iivuPQoVcyjpBvdIXCTa7CD0FdjKjpHPbvSGKd5mWrPI0uZUt8ux4s4tDs4Vgz4cOt8
	kFk1zTNArHPcYBfv6Fv/UHk41nrH34G9w7/NTmHZ943xUbCObAezsWDU8EFMyqc=
X-Received: by 2002:a05:600c:8b47:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4bb55a7b9damr65527035e9.22.1794585038370;
        Fri, 13 Nov 2026 07:50:38 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm5518477f8f.34.2026.11.13.07.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:50:36 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 0/2] clk: sunxi-ng: add the Allwinner B288 CCU
Date: Fri, 13 Nov 2026 15:49:58 +0000
Message-ID: <20261113155000.84703-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This adds its CCU.

These are the CCU patches of the B288 series v4, sent on their own so
they don't wait for the pin controller. The rest of the series follows
later.

The B288 is closest to the A64: most of its PLLs are bit-identical. The
clock descriptions come from Allwinner's BSP, cross-checked against
ccu-sun50i-a64.c. Tested on a PocketBook Verse (PB629).

Changes since v4:
- rename some clocks and resets to the names the other sunxi-ng
  bindings use
- build the module as sun8i-b288-ccu, like the other CCUs
- add the CPU PLL and mux notifiers

Pablo Mazzini (2):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 775 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 ++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 +
 7 files changed, 920 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

