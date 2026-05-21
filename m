Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4788236AB54
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375695; cv=none; b=GpMX6fb6HyZpdc48rzrjM164RRsHWCwffl+kfsXShvX0qtI+Wm3jUqDzYuc+jI9o81xim6Sq9Q7bNZiDY5HpSMK6sev8nCMNy3PqGpthLRzVvfi4nYUa/msVP8N7imZfWaXvnVfrTBe4w5G8riUvWh9LLNXYZLTFp7zNqp/jCZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375695; c=relaxed/simple;
	bh=I9o16dUUZaqFYkEAKSOL1C5EFI/HEYqJLSrI3P9b3Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFVXDEt4+anz+NL8fX2O7X074Ro4lkajOpbxUm0vhY09DY4cP6UpwYG43xuPnjyYCou0v+QnoxXqjOi4umCflzgrNSp/KQhoY81cxal+FuL0I6vj/daKbeR1gw2KF97S8HEFYEfiQ2120oPHcrq21pp8AFBcN4Wwvoao6/VnVXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtD5lsaL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtD5lsaL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso7444745e9.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375693; x=1779980493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJdvze/3qUGSdeaywOgRH9jPh9c2UmVUF7voWWqWYm0=;
        b=CtD5lsaL8nFzxMVfq8AJsxT1qa/Bzutn1+M+Q/1s9laCkc6p5QkXH0SHQUoF06HRLd
         6sQWDgvSntxgyVOOk/ieTUBzAvAxteGWu4KMEeZxLM1R0gwaS98K+Z1yNIkxer100+Tq
         AvsRpReKrv4e/mrtzPCCSDPCbDxlc1kuqDHGvLIXfavR2F9Ou5hp9MYQN21GZ4fYf/Nu
         na1N1n8XuWkXL/kPpghhk7RFL7L32WsTcvGJx+4dE4sCfaoukl4WcUuOdUWRYBwzfsAr
         U2aNwoenqzVf+5JUuEwE42PGXbPaEQg2J6UgsrQn/VmKL8jlgQiIVLdpwZNNRnvFAYMN
         HE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375693; x=1779980493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kJdvze/3qUGSdeaywOgRH9jPh9c2UmVUF7voWWqWYm0=;
        b=ruzPluPzEU4K2vhgitD7Bp+snzw+HL3sQp5UKPN2yY3H2aW7jqfM94MoZPorLUWRuT
         1VXboVXAO+g1gzjBucEzaF08XbH+uGL5MCHyaE92DOJYSWCbdeSCfbMRfsMtsR9XG8uO
         J0Vj3n5hVqOWsx57ED8O0siF0GihmxDC4TwF8pZki1hSDVfX/+J973eAPxeN0rgOubE6
         soz+IgxhYnhh5HBE6c+gL3IKow6XEP9ZIF7ppOv59wZz3SrbmugYEulUz1KLcEHwZi0d
         5e9Uy7YyoMlkNDJOJWilJDgP6XupSnD17k6EaLseySZanFcD+waCgMZgJEZRwkDsbt7q
         UfKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/U5pwGEJH4RZ98sMQ3Di0XC3pl1QEmcsxSl6AcMYJtzAJczkOZoWh6NlBXDM3VLhG60HjtjUUny024@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8O0F7aQuULH3YFGK3t3kS/BxPTIh/PKIcNg3BxyYUokpJY76R
	+f6/a+Kl4ZJvIJtdQ/oixHdeDkxm1KlKnar20bq+QetfKw5jP5bOJkVC
X-Gm-Gg: Acq92OGVLhIiCRHuxoP2OuRXbovkjRNkXWjSr/YWeqHbdqbrA3Wk9oSKuEp5ELaAA5v
	7idJEmwZKLacf0+NqT740Cg3jgNTf1bRx8tz2hjerZx4gOug3c9m6/0ExBIisejA0cqYObQLVMp
	wQFWTRv4RyV4Goh6H/odJYf2baBH9D3o1ybU2yzlfXA9T6x20n7yggcmIbpAGNycrDSmjfW6Sjr
	cLFS6GSP94hJaS1c1AZteNx+5S3sWOVZr5Sg/vKI4fOL5C/aIRzs9ODyCNl2p8vCnop6eeuIbRF
	HtQ7CT/czyQO/dGyhPQIgrPKUEEnUjxSlO2B28DJ9IVV9POkhEmikGTh+9YOeJ7q6E4CA2g1SNq
	OD5hTxnNPF5nTu88BDxMpe6Aky72Pt6vQvh+39g4esdlOr+Xz6Sl07jc3kTiGYdjxgtS+FIu/zB
	PBWWlXpPRTcbSMNXtC0iDRMeIdVaaDpzuET8HT6DXbMA==
X-Received: by 2002:a05:600c:17d2:b0:490:b07:5fd1 with SMTP id 5b1f17b1804b1-49036052603mr29364105e9.11.1779375689908;
        Thu, 21 May 2026 08:01:29 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:29 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 14/15] dt-bindings: display: panel-lvds: Add LG LP156WF1
Date: Thu, 21 May 2026 16:00:50 +0100
Message-ID: <20260521150038.103538-31-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add the compatible string for the LG LP156WF1 15.6" FHD (1920x1080)
dual-channel TFT LCD LVDS panel.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 45183a1439ce..a6af2b9cc2f9 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # LG LP156WF1 15.6" FHD (1920x1080) dual-channel TFT LCD LVDS panel
+          - lg,lp156wf1
           # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
           - logictechno,lt170410-2whc
           # Riverdi RVT101HVLNWC00 10.1" WXGA (1280x800) TFT LCD LVDS panel
-- 
2.54.0

