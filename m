Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723082;
	b=mtzC7kCw1oBoWdPlt+DZpivGrWNzfjd3hc5g3a6eRe8AKodAYQRlhv++4BprspG2NF8Y
	 NS7dfLIeCNXfY6kdxIuoHYknwmbDmOyCuQocoRQrxSxUYeDnVCGTcqKom0Y8nP81Gi73b
	 zVdQeK9+IgLiVAzmRrWOWQFy0Fj96xM8RHDmkjCOu6Z5ld35D+I7mnX8qP4xo6NybjBkE
	 qrSKzbaa10klKVUXdzfwwqArAvcUi7D3GRciLcNhugny+GVEaujdSARmYsLVcSF55Sw8W
	 6GlkTTnHB/7hjGeMm+SPn50qs9q8n5LIQjWAtx95uQJdOS+NZPdz+mf+8WKrwBsZ3Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
	b=ZzSjSxCCFAWn64GZkA9hUqzU7BkmPuaA4CihGb86DygujccBgommNlM1P20WR5nlZ3Gy
	 HeoL042OunjTn777vUoBJRclPkcKoEng7xrQmLZCdW5ZRM5g0CRPxiywRajgEWo9MkV78
	 brVmt5Pi3Fy+eLf+jSb+2IGE9g8r6cfVWaXduCXPE55E1JERQAiz41E0lY0jdX1vpctCd
	 e90VYzbFPQqZxV/Mp4HW38TXZkTkiw+/qEwHChkv5ZuuOwQWNC28TVEv6NTu1p4Bw5TSZ
	 XhPeBGJ9szbDPRcxT1N/nN8XogIAhy/AALgDbgb3fz5zxdNYpyBM+amk2csVdX869fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PfGO72hV;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E72F606A32D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E72F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PfGO72hV
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so11995415e9.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 22:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723081; x=1795327881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
        b=PfGO72hV+7K+Bg2rbbjq10rm0RIetCz0/FRxgVqU1XK8ZLsGG2X6lmqmEZoUITZaiL
         0uVePmMylD2kf/99hIEE6d3FIyF3HedVSiJ83nuwDxFq3pm0+cACun6X1eQ3LJ0Pgcs4
         jbJ7kzb+9QYKJfh/zVKkpVccIhy07LkJ2EZsB8pEOP1QP/rpxlrp4MahL/WdgH0iP3ey
         Q4TzQiWbARjL4aE8xBCdzTQ8I30mT+WNQ0dFI3dZ72aju5+vcjuO4HvY/jkxtkImKrhF
         RROvPReMcLd4HTt1r68zwPJRzOiAiTP5TGNSPwC1qU/GyGzWX3W+0S0G4moO+g+bzz25
         G1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723081; x=1795327881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
        b=qH0NeF2ud3V0E7R1s3NFFNnhXj+cDlIy674D7J4uDYEdKD6C8oep8rokoit4Wy//Hv
         uyQVMYQMEkSv1HPsOCke1w2g9I0L+wRbfh3uko+nKxmHjyKjZ9BpBgHJw5/pUwnOs/3K
         RWRyVmC6U1Ry1KdzyqZMRIJOgxWMPtmfmDwbjpkwkevH5v411ncWFIki6ymv9o4NwShZ
         N1DLyxzoVTEPfOKvnpZLIpHWHevbVWxXXoIIzer/xCn2+Cz/3k+w9RUDG6FREzPqrqMS
         fNzq+uSSWgcxyNlMYIRI0F7wJxVeN3OXoWWvuXrhUSASVk66Z1UzHl/NZAtkSLcjNM8d
         Je8w==
X-Forwarded-Encrypted: i=1; AL+hErEoX74xCa2kngL1O2ejKqfvd9u1zJEdIKSL1zCkKHTxgmOH8oHLztDhQHvUY+cd48uNFnVnpvgapqEA@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZEyk9yUUvcd91+5qMd/GafEkrdyNNC35xrL4l1EpAESLS29uN
	AiKhwrRmhwzJPtcUchBNgJhjiwRCEY7Swe9tLRdZCCRwppf8HgqhMxTl
X-Gm-Gg: AYBFou20WATlJShTgBrDB69KZf4Q4WD/4RZgZo8AlpGXNJMRf0ffIgPlxxYAl1uC59x
	PUYwW7xwIm6lwp2cBggEpE1nBVVAJxx7PDt8mboY8nrWMJjH2vSfoszMqn27Kzx9DYew/1sXs5K
	tHh2h0mRFYJJHZWrzNThBGRTa4uQK0mGOXOvWq7bnau0lr93jl3JucvW0DSsbuSXueouITskGeT
	61pwkReIuLIuFSNmA03bv/E/UmY1qZ5NzDrZk7ap2dKM1+jSqjzoBz0xfWVrGs1W7hLC8c0hZ3C
	uM8c1rlQEuLPoutZVT0RjGe3F1hbkQjy3BBa0NWQ9lUSb2cw8bpnVyi0BnLeKK8msByp/jZ5BPU
	ABWAug+UdTaND638xkcS9tGnr7D4X354gd27AsHMdugswM38l+yUUzXCrKntvniTCTc7ugW4YjO
	o39l7SVXQ0qM7GjZ3yDIJVrXBuaEe0N2tSeM6dP708NtyJwH/65eEN30VOCv4T8nnSetCxGfGiq
	Qp4dBsE3AxdKr2DbsFHikHg0gDki/Ry2rxU5EHN8pho1SDttVvhMtroRxZISTeuG84ziQ8u7mDj
	u3zKy/h0IiPr1WinzWZOjOQZ2iKgoyZXj4pTIMWGkEZBmcfyrnEMBxnxbRgAiHDg7ya81BaVeky
	XmPQJIzOQJI0nuOTMdOr3g05JPYmWhPkGHFGf2f/6RGPULspR5+tslNI9sa89/ZYtmp9vgE8aOw
	Bzi7NVTfMA4aNeHkmkogoxeOMpfA80Pn+Uwec+BGD2Z1F0Kg6ej5XqASf8u7buEU7p1wEjnpCIc
	k79i8OnQ9kY4Q==
X-Received: by 2002:a05:600c:4e56:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4bb55a48042mr148514035e9.13.1794723080596;
        Sat, 14 Nov 2026 22:11:20 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:20 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/8] drm/sun4i: update DE33 support
Date: Sun, 15 Nov 2026 07:10:54 +0100
Message-ID: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This is second series out of tree which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Issue with existing binding
is that it considers planes as resource which is hardwired to each mixer
as it was done on older Display Engine generations (DE3 and lower). That
is not the case anymore. This series introduces new driver for planes
management, which allows doing proper plane assignments.

Note that this series intentionally breaks existing H616 DE33 mixer
binding, which was released in v6.17. Old binding can't describe shared
planes, so second mixer can't be supported with it, and it never had any
user - there is no H616 Display Engine node in upstream DT, rest of H616
display pipeline is not upstream yet and no other known DT consumer
implements it. Reasons are documented in patch 7 and driver prints error
asking to update DT if old binding is detected (patch 8). See v2
discussion for more details.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

Changes since v2:
- rebased on v7.4-rc3+ (mainline sun4i fixes)
- patch 1: explain in commit message that DE33 has only one bus clock
- patch 2: don't register regmap with syscon, drop preset plane mapping
  and reword commit message
- patch 4: don't expose YCbCr color properties on planes without YUV
  formats (kept Chen-Yu's R-b)
- patch 5: collected Krzysztof's R-b
- patch 6: renamed, get mapping regmap from display clocks device and
  add device link instead of using syscon, defer probe until display
  clocks are bound, set drvdata only after mapping is initialized,
  register driver from mixer module instead of module_platform_driver()
- patch 7: explain in commit message why old binding is incompatible and
  will not be supported
- patch 8: renamed, initialize blender pipe modes for DE33, add device
  link to planes device, limit DE33 display regmap to its 128 KiB region,
  print error asking to update DT when old binding is detected

Link to v2: https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@siol.net/
Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (8):
  clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
  clk: sunxi-ng: de2: Export register regmap for DE33
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add DE33 shared plane driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: Switch DE33 to split plane bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  82 ++++++-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 215 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 ++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 193 +++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  72 ++++--
 11 files changed, 663 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h


base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.43.0

