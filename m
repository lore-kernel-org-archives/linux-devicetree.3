Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110884;
	b=nkupLZZ8CSJFxzxWN+IS8XHU7tWW41a08wpTZX449oQLr8W6PWUHXaO/YiVnwn8MTnAu
	 QDe96/HQzCvQdwgPMq2lzSgGTDgTHVDuJqMCd3YpNqckP5CtzQGZfd4+4UvHc4cFRdqsi
	 6ujt4NWqwVkaHBicoi15uzR4W5l9B2ClPGWnZiQJhcTiw+VPAPTfYKoY9Sk5zm/PLYXAX
	 HBK/fSS8MAIQFLqNL4pMjGd1444HJRCGw5T+V8mnK/daPBiiVx8isNzLKrGe5GKrEH98J
	 MUys9gMvXO12KdvPwVzsiMBtP604VESW5v1Hpe0kljdy5Lol667/2JkJVbd63bLQaGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
	b=en6bswaFbhHnx5vL19TatyJC1unrmC2/y19c1gCOHgb2AcW56lmuyUR9HKU4JnFE9czJ
	 kegNI7SjMPNi3f/CjwtBASYo+crmWDbKU9h75ethOoDox0R8eNuMlFOIFwCPZ4XZj0CQ/
	 FKWocIw1w7zW2Hj01eIEYWpSTfrDt7VsoCska0Wzorwkkjjtnob1ukkD3Y876sg1k5po4
	 RYOWFsZd2drvh8c6BklZloYugLnXQdH81VlPd5CZWJY6qkEkQZ2gpN3fjj69wqxDRV16F
	 zlUxq935OjmzZmnnB33qG4vm+hfSq49F4rxLX0pg+2x0rfYVTp0ZhJGzKrQ1tNtwOEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpIGG3ec;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2B606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF2B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpIGG3ec
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so25141475e9.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110882; x=1795715682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
        b=rpIGG3ecMQpmdMIQsUTxbxV66zUNK/f/19dIVWVwU3/oJ4PaOoC9+KJemj7x2k4djL
         zxeMC2V9asmii9hBL6NFC2BcFwV6NxrXUaZGj6tat8F917Xj3iQtISvnXM9aKpVUloqw
         IcTphOGaqGWGMyljARozybHAw1f3gYNAb69LNsEVHUPMJtQHhO3jCZkDCpdQHKdGyuqG
         6rwkX87bBw5XvbnbD5CCAOQ1371+AZuNpHp7YGk9iTEBt72lPSRRxNDofCoALHxOWFms
         WiX/7FYWjL8g2pD247dwZzYQJFHrNBDrtwzSc8YJd3E+y4vbFwM5q3L6A47paHJrbBPz
         uIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110882; x=1795715682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
        b=Ux40IAh92uStzzUmPSYr5Y1dJt6yXCT2G+3xGYKsOZglIQOW9MZTYiwGtGkaRifgJz
         lCGgxekMXdS0uI9nQckEtAlkBxNi2IwX/ow1Vy+qMnAbhnmCSV9m1q+b0bCS56Ng77tN
         xIpLVoioiyLDo3mGZz6iky4Q1431hzTcOeT2KunL9XVEoB1jqD3fTFs2d0xj56zcRe3O
         keaxi2+ek0FVD/Ds15JWaEmHfDu3kRCEhk7PlExVqeJ/NETI2wE+2y741QFzdYvHlE4v
         ylAtUTUfUqPYQrRhtLw3AfBVwTGSmUU2+GLPIVtmZowxCb4PIwbyw+dnyd3XWdh+4ERH
         vmmQ==
X-Forwarded-Encrypted: i=1; AL+hErE5cuvMqm0MfadXev+l5GRCNu1YWKlxbHE47piia0X/Ety//Jn8moGfFWOgRDlNH3kN/oL9W0HB7BDl@vger.kernel.org
X-Gm-Message-State: APuU4Z+pMQ2dmyl9foJkaA2wdLJesAg2J7iIG8FGhTb7THRlK+hfwlr8
	EI/7bHGyUdKfzwdQaTN63+jWMrV6Eam7fZMSEiDFZ7M182hfrEIdHiYM
X-Gm-Gg: AYBFou2d2sPS2ycTrvf+V6H/fENzAmkpdJ1zflmEkoJuslZhj2/eQPGag1Glc4tSgZ3
	uF3dTpEvRMJjt+5AtlBHxQyeW5KQQQsqNzga/BnzqHORORJetJ+ZZfdkoGVlvKaMZJp1X4Wf2mE
	xAXi21+1/lQp2ezaBnzOSMvp5B37GmW0XhY1nedghmkMizLewbHW7ATE2qMF3Vc+Jmzy5/rPYEa
	1Pt1aKCSiBhXz53csYoP4OkqFDYPXHMr7cz0ZDmF84Llt6ijhW65PZ2GrxpdHEjB5pP9LCZ65mB
	QVQq8OLKQ6Lq42NomOfyCBBAUfQ4btDAMlEIlMnYbekUYpdXRWZUlVBw4wlcp7bQpEvVynIvnlp
	r7uo/dFqxtVtm+QO+ImU1MnrhiJ9pvCI7aKx3vNQmTYsNNVNCSm0uTS8+rtIfCC2a9X7VElERTi
	XjbdySeTd1d8yLuHo/j/98rOCvH5TysuzXExy8WeTgRjduGMO1Shwy/ishKFbCNJtEnrnPY20MJ
	qwMUfmfqH2dYOINbEVbiHSRDwjJLMR8fhnTvAE/TPPn6EiW6R+5BhVnOkLvmvOkFiKQ7GCjLLNg
	qVdOSWUiHjNmznjav0/qx+2iaJB2yJST+1899SpuryPR7nmVGMEzmpR8V/wE9QyZUpHgUfuqffL
	h8UcqNfthwMKhNfL2HkGAVAoPp7pihRZwPFMbZ0rJ5bmfnSOgll6HnZDVkNipIUALhjtMw9Uxhe
	UEWtZM9DjGyjVMOe2CUHayquAAt7+qxPpaGNr1JUjXoRA3uufkt7UfbpBiRLSn+gBjdr7TdaWHU
	Z1R3Lyz/HIE7nssNDiuBEXyU/HIyowem7b17DANKfKb0aEsI/UuKnIS
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr6842365e9.13.1795110881961;
        Thu, 19 Nov 2026 09:54:41 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:40 -0800 (PST)
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
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] drm/sun4i: update DE33 support
Date: Thu, 19 Nov 2026 18:54:32 +0100
Message-ID: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
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

This is second series out of three which aims at properly introducing
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
implements it. Reasons are documented in patch 4 and driver prints error
asking to update DT if old binding is detected (patch 5).

Patches 1-4 from v3 were already applied (clk patches to sunxi
clk-for-7.5, CSC and VI format patches to drm-misc-next). Plane driver
depends at runtime on commit 63a29fbb4ecd ("clk: sunxi-ng: de2: Export
register regmap for DE33") from sunxi tree, otherwise it defers probe.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

Changes since v3:
- dropped already applied patches 1-4
- new patch 1: reject fractional source coordinates on channels
  without scaler (suggested by Chen-Yu)
- patch 3: mention in commit message that driver is hooked up only in
  last patch, update copyright year, drop unused of_graph.h include,
  use dev_err_probe() and MAX_DISP bound, collected Chen-Yu's R-b
- patch 4: collected Chen-Yu's and Rob's R-b
- patch 5: fix include order, use device_is_bound() under device lock,
  guard put_device() in error path, drop stale @map kernel-doc, rename
  planes platform device variable, mention missing scaling in commit
  message, collected Chen-Yu's R-b

Link to v3: https://lore.kernel.org/linux-sunxi/20261115061102.229680-1-jernej.skrabec@gmail.com/
Link to v2: https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@siol.net/
Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (5):
  drm/sun4i: Reject fractional source coordinates without scaler
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add DE33 shared plane driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: Switch DE33 to split plane bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 209 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 191 +++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  11 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  24 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  24 +-
 9 files changed, 486 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h


base-commit: 8e2afcd2b57990465f132367fd8fdc2e55c1adad
-- 
2.43.0

