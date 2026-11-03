Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703927;
	b=L3t2wcykiHVkzu/XuL5Qr0oXg+JAC5CpEp9TQV7nOpb7cTDYA3Iw0CUDoP4i39DP3D3T
	 f0SZPDyfNn1yg/QNctPoDgGR52TlCTfYe8uyfUefIzFyjCEoP0bmNgCvZhujDpVkUagFY
	 X//YhEK6m+WaCth6MX2ts8ExCxh0r/GwMKLNFo8MqY9ew+zrE8EVZGtgYzfkXllZfWIco
	 g1cqdSnKLDDtOq5tHB61m+L60BGlmg3N/Eyzve9VwGzNFavPinuKqT8Lu1+ooawBt41Rp
	 sIPYPwdiaoLop2eSD3Rniw1+Dli2V34NnCOfX7OPw2p0wrylP+lqYK0ql0vFTYuPj7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LFiGU0wVYYFRIuNAq63PC6SLhwVIgqIMMPvA4Bls3qE=;
	b=5ViHI9xHx5yN//iwxt2daNgjnwHVx435lyE1TZB2CNGztEH+1XUUX2f1ufy7lwUoA0aP
	 q+qIO8UnoIBl/nAvei8NFz0Ny5GfO4SXKKMVA+sHn01P+0mUqTHvWfEltlWKcBn2waTab
	 DkgIK9B/ZxnvCFsTru6n6+4vdd4xiR2TvCTch1JGvkVROo9c96W1lZteHiW7stX+4le7u
	 KxRfMiTPthmfGNzrOL22L+gw0DjBn0G0jr9AvOiokTrjhPJaRFFNA/EJ+lldFlCKf44DG
	 8Yo43pHyQtbPTs4PI0LX5uJGg7Bsv0KilWmNtEODEehRyZw7nrtafzPNkJMMYE6zFZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y62S+JmB;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8577A606D81F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8577A606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y62S+JmB
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso26791875e9.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 03:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703926; x=1794308726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFiGU0wVYYFRIuNAq63PC6SLhwVIgqIMMPvA4Bls3qE=;
        b=Y62S+JmB4ApRXS1aUJzO88O3fK322dR6cG9xNZLkfEmndK7DM1pE9II5exNLD0g4NI
         d/DjpZsvo6NfN4Z+13mMxbFaoEdQrBcedKsbruLRwamwo1ohvcWYRc6PoOjCJa6SNqLu
         bkqu+AgsXs5C4Y6LuAmRzdO2p2NNqEDZarOH+GUJMXeB6e7s39GHNtl8B4R6cZiVdObF
         lzDaovFg1h64NzCkK4UCkNA9PKFzMjNI9JyN2zEfXXkBDtoEct9MuZuU5OXJSP6tGMRa
         kwar3gz3Yl6Z6ATPC8yfNCGq/UozgAgWv3mnRzFUvIRgScCHVdZZp/tDIRhO8jwLkAn3
         T7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703926; x=1794308726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFiGU0wVYYFRIuNAq63PC6SLhwVIgqIMMPvA4Bls3qE=;
        b=mixFLgydzeOumy3taEzQ0SAb51w3h85aCTlfvIuhdioJv5oc3Hbr3nORKbRYyEZzj5
         p9GyGzPQc+lHdKFWw4l36e+I//rCLEUTtbF3XOFEBJz2bnuoREDSnmv6giCrcnf0Hk9Z
         tqQYv7/s0uEFmXBb7HcQ8nhHM9QoM9i8CdvEzfbaIrZDEo0WTYZUf9snTyYrfmkjRgj/
         oJqeGbs98/CN+ETOD3ai1VwKxcGhQuEr5H0Hy+1TKIIPo+HPVuZ8PEHjSq/SRPImVg1v
         09HyjhLVJESEv3Pnlmvs03vSvRN+wQiraK3g0Py2DhcgU9cU60iwcfKRJCN2sSx12lch
         wzgg==
X-Forwarded-Encrypted: i=1; AKwUvByYhAsXRydPwhc2iDW5SE+YmGEmp/+VHKqkuQFz6SFcTqqHGcV/d5hOrdotw8cozzhtycSLyjpUdVi4@vger.kernel.org
X-Gm-Message-State: APuU4Z8HHCT2FRl3Hk3Gkxw/4T2tOabfLEGg3sGtOCkrFlWnxQciWAQB
	fPpZP6V+DfW5ZrqB9WxDc8kUrmztMtTaB57wqi0Pcgoy/pR2cZzDVaRARpsSrkmcqhU=
X-Gm-Gg: AYBFou1aPy1KlRE3udgYfIB5viSiIctTAYALAa37joKQ+FS5kJlt0oXlW3upA6osbfr
	jDmOPKoSTKZ35xf4wx0R5pcKoeMGMMDmsjqp+ZTBNR0mJrQ1mylR1FvrJM58HID7QOsTMakX5G7
	kyIZPcBvn+NVGvoqPQTmkz2kVj4o3zlrJjafN9xHzL7Fg70An66ERpwoWB4mApXh2tnT4gku8Lh
	kbYYSbAJh1FafTOa8K3LMxRLgimld0qe8ftHJ/kLLvwC8KMRvqBS5vg02RTWbAH/Ji9O9xmJQwk
	hxPG5HKUirJKDnteVVkEiTfRc5VA6KqKFlK0FiGNWhAiw8Vm+l5X6bNWE9H75X+xN4I6AUENijS
	FcgASgt65DxYtHBI4xqiCvPecqBFkk2YmN95EzQp+wO2ZzV6+E+P71fbgFCC+9v6rz8MQFW+cyd
	p8BKcu8YgCG2rG6th7oBRAGRFtSS2JXAwW3wYn8ScfpBTBcEbLdk4WZdualOT8pY7uRxLz5ZI06
	hCK5rK4pe70QFUpo/FF8J0lMpf7NfPTobWw3+m61OuTl9aYkRviU/Gih90Z1MQ0S7yKxPAtF7v1
	8MO2kCt5pqA1J4HBC7DUB30kv6JXKgferOPWzx4WWpAKPQQgPxeZW5crHWA04LBA5bwTa+ss9R8
	vIpp/Z3o/2pyveYe2IpxcYuQvwZPcvXuoiw5L1i/fU3Yo8g==
X-Received: by 2002:a05:600c:3f14:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ac14ec873emr282656675e9.4.1793703925515;
        Tue, 03 Nov 2026 03:05:25 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:25 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 0/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Tue,  3 Nov 2026 12:05:20 +0100
Message-ID: <20261103110524.2812831-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The PocketGo S30 is an Allwinner A33 handheld with a 320x480 1-lane
MIPI-DSI panel built around an Ilitek ILI9488. The panel uses the
existing ILI9488 DSI driver with its own init sequence (from the stock
kernel), timings and DSI mode; the sequence is close to the
E35GH-I-MW800CB one.

Patch 1 adds the vendor prefix. Patch 2 makes the binding's port
optional: the Allwinner sun6i DSI host links its panel as a child node
and has no output port, and the driver does not use one. Patch 3 adds
the compatible, patch 4 the panel. The board devicetree will be sent to
the sunxi tree separately.

Testing: each patch built with W=1 for arm (multi_v7_defconfig,
DRM_PANEL_ILITEK_ILI9488=y and =m) and arm64 (defconfig, =m), no
warnings; dt_binding_check clean for ilitek,ili9488.yaml and
vendor-prefixes.yaml. Tested on a PocketGo S30 on 7.3.1 with the final
version of this series (A33 sun6i DSI, one lane): the panel probes and
attaches to the DSI host, and the picture shows the right colors, size
and position.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session: it
extracted the stock init table and timings, wrote the code, the
bindings and the messages. I reviewed and understand it, and tested it
as described.

Romain TISSERAND (4):
  dt-bindings: vendor-prefixes: add PocketGo
  dt-bindings: display: panel: ilitek,ili9488: make the port optional
  dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30
    panel
  drm/panel: ilitek-ili9488: add the PocketGo S30 panel

 .../display/panel/ilitek,ili9488.yaml         |  2 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c  | 55 +++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)


base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.43.0

