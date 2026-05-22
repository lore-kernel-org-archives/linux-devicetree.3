Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CA93AA4E8
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456045; cv=none; b=gr+ewlVxbQy9X4/cStp1KuIyh2ukAjBgZSqgKbQICXvCwd4wOXrY2UxgZLxnM4Gox/BGPSQe6E+5pguSnP6VRQGT8jtOMsXvDmSWut46enKlKtTbWJBCj53/HEdic6NE9/7Q3cURI7DrRGGnpFiKQ26VRQTVbb7uq4mXAzrLyIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456045; c=relaxed/simple;
	bh=D8IzJFBxjZiG4i7QLwbbQkoxdOK1FD1TAP5qqw1TXDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1hYQMCWuQQEklaUsokFt1Gxzx8keKEik0vIyP/QvP5brEyz3MKbB7ydpyg1v0wHJCWUnbGJiya+IilP2NC8DqQjbqstSoG8y586vkM+Pp10KqJfx8kf7jGTGRbEbU6K2LXOMvhNeC3BacymCki5y7Y2ptMG8t70ntUwzKLNu7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nk8kAtES; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nk8kAtES"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so11671315e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456042; x=1780060842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og4Ss48qjWaYlmsfdFxPi0Imv8+Y+Dj/6CNrwGbe4NU=;
        b=Nk8kAtESGYnAlXID3MqbxyUbbPbwfAOuAW/RFbrZ+u0l6typTqcyHooRuIkJJg8XmC
         RhwVymDmgYCwe6ryZwZrU+q0+nDsMyNrzjkkmD0GuqgzyYFyKvLX6Xt50QiDvfunKjTM
         yT1ZR+dmZjVycckAbbS/awjajZrYO0ECoPTF/XvMM/n9FJmi0g2L21LtLayMbpRDd2oS
         zeH3LPw8q9hWBiNJ3I+hiIJ7fP4boyQ9NaNym3/udom1kix3AEy/wUM+KXccc2v26FCe
         G0SIr9mgk169TCJo5lM2Vr4BaGKAthGhcPX4iSgiK6UXUmIsYB132cjSgVr27oMcVyIa
         xgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456042; x=1780060842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=og4Ss48qjWaYlmsfdFxPi0Imv8+Y+Dj/6CNrwGbe4NU=;
        b=p4eSt99WVCFVogl6HmV2RpVoIsazUxELpnkL1fJvGSGd0yqKoPnGZD4iVN2dYYrA/t
         za3w9KM0kFDWL8Id7r18GvI6N85YLaBHQODwomnUfZf8CsIZUmU46MSLm5/4uZw/LKdk
         8Q0x8LLhkhSkoEEAEvgGBu27kLi83bm71nb4RdYPumO4lCVra4x7XomxguWc20cHFjSu
         rpBMWO2CMchUolQLeBRSzS+Z7WRPlZtxyZheDaZogdUhw7Puj5SNobScU4sYueGX2y+3
         yZx0ay1R4x2yeuDNBr/z1cuqGFbGAEqLSyz8+mvgLegRXJwTnt3qE/kbplZ1vJ2xC+A0
         wAPg==
X-Forwarded-Encrypted: i=1; AFNElJ/TwXbecD8ZbfqXPskt8PXro1Y2aXWyaKyDMmCatsJA8NKJvymmgyXjWpa33O7V0s1739u26wi55xmx@vger.kernel.org
X-Gm-Message-State: AOJu0YzoPEsEUnlrakiN8kEf8v/hUqqNOfrl2s8uUGsOu7k8LwCZDfzB
	f5jgWH7C5VfcmGe/oyLp0IkKjfHnuiyQWEYdjvHYG3htqfg1DXZXfNZy
X-Gm-Gg: Acq92OFUlWaHjVrtkJ/JQ2wOhipmqCpGMpz1/EEDSLUL/hQ+INpvbmQJlcIRumpPliQ
	SCAwA4jcgj5Ms8C/ycb9x5HmxNdn6f8NFjJKI/QdcKSh/lWi9+7n7hDRhnELlNrWymAaN3TJOct
	g1kK2SXHUynpTBePB5Ig95/G0BHofBp8uBMnQCsmJkCBNXSwpNYoOyB13OkpIfaODxD3ueoq55z
	ecHxejCXqTsp7gxsKwANitVvKhJIMHsuJGcmadljcPyIEDt/hHQvIJKoE9HMqsHntfyCfleZrfX
	HvTd5gzG1F20+z+Yp31Z0IW5UUALHM9BcIJt+W4YUDBQ+cnx1m/qw+1L2cGKr7/DuDUVErHagpX
	u2VQ4iUQuLbZRii7q9enoADZBMHaayUWZOXBTLj3YckE5Nh1U8ocl3fC+Ufwp4JGorclt+/vev7
	9m3aWyrvQ7VnZmnlfjgvLTalQcB/lVEVPkSnh/kiWyUw==
X-Received: by 2002:a05:600d:8445:20b0:48a:89d9:a419 with SMTP id 5b1f17b1804b1-490424ad4c3mr37503325e9.11.1779456042100;
        Fri, 22 May 2026 06:20:42 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:41 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 04/11] dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and RVT101HVLNWC00
Date: Fri, 22 May 2026 14:20:17 +0100
Message-ID: <20260522132014.226721-17-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

The Riverdi RVT70HSLNWCA0 is a 7.0" WSVGA (1024x600) IPS TFT LCD LVDS
panel used in the Riverdi RVT70HSDNWCA0 display module.

The Riverdi RVT101HVLNWC00 is a 10.1" WXGA (1280x800) IPS TFT LCD LVDS
panel used in the Riverdi RVT101HVDNWC00 display module.

Link: https://download.riverdi.com/RVT70HSLNWCA0/DS_RVT70HSLNWCA0_Rev.1.4.pdf
Link: https://download.riverdi.com/RVT101HVLNWC00/DS_RVT101HVLNWC00_Rev.1.4.pdf
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../devicetree/bindings/display/panel/panel-lvds.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index b31c67babaa8..b89f86bc0683 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,10 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Riverdi RVT101HVLNWC00 10.1" WXGA (1280x800) TFT LCD LVDS panel
+          - riverdi,rvt101hvlnwc00
+          # Riverdi RVT70HSLNWCA0 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - riverdi,rvt70hslnwca0
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
           # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
-- 
2.54.0

