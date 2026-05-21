Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D123BCEE
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375691; cv=none; b=OdQCpXcZz/jSFDDicCh0L2vuLX5Z5eAHunpFSSwrYYLUL1KLrKif1yEPvgkMIzMDRl53HyjqX3XmnG1Uvj4Bo4RyZBz+JvCVamh9CoUO/e8TvKYylo/oNYpIFOXS0fxpM7ZcNjwI7yppZPfTIXh4zYKpAmsq0AHzBOd+Xia0ZIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375691; c=relaxed/simple;
	bh=6aTeEyZuP4r4rTjjPok2pNvjwF1xq/20SI9Q6YwxmWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmJSGyxfWFaR4g+XpJgNLfFN5fGNWpvMIwd20hDY5YEyRKU40zWqu+kdwntxbTF0EvVQFdQnEHS/N1+IQTDNQ3u19RBfESVIebNNDkIqbXI+lyLNYbRdYTJl8u8NjO4khRz+4XCz2lQxB5nx8Agc+dN6cWPSRSuIiRePdu7eRVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AevR27X1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AevR27X1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso65470535e9.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375688; x=1779980488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFf1Uwc1wFfrjp8DZawjtw8U6DafQ9Z9e4+vgFSrgIo=;
        b=AevR27X1wmXKcqW4hZey9Kttlxt7zp56zCiehqXDQFi68wMy84tMpvVlI4nSnxGET1
         EHjZiSUta++qva+LCMk0dYKqtT+QQbdqxkVqP7SCotGCMY8mDJUBYUaaSxffum6nFYab
         0PGIthm+rdHWmMvY4KLTYHe2j88a/wahstYu+FQUuXRcYE1Svbn/gBHsUflFfU+K64Kn
         zPSTq2tTiWb/1YhFmLmAD/ZMnjpYcBl2+Yu7283YrYPIRa23tMa1m+6VYdNuxVN1eSaT
         Ioc8dL8Fvj7LhRbI25FXd7kn2bBK2IGXDXXa8UqoYLjhuH0JDKWaVXmjkmzpbeLB9Yi4
         oT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375688; x=1779980488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cFf1Uwc1wFfrjp8DZawjtw8U6DafQ9Z9e4+vgFSrgIo=;
        b=JYRvc4gfAyBqepQfC9bqR439XJSPOIfTbctQpb4GjvEILQ5o5pgirPb+K4WVML81Jx
         sDRo8bppHxp8H08z2AfHRX1vKHkpY8Srs5ixs6hHhVTIx3b11vJ5BOQkLr3hfkVl20+w
         MX5I4SC1u1UUVOhBs1hIUKp0iM0GGOrb8uAOW0a6nJ4CTFBwI8ZOFKUpefcIA8LrMwem
         04ViZlcman9Ecpu0meu7AyUEpYn/6tfQXHxhbZ5ildfFroubdywsukrBgGdq2YFkBs0e
         U+e5oD9rHHn2RHwxT5mPjxl5K4onntP9E0YFMyBOHYFvY+cX7dghFJOBTRLyLIz+MnUd
         ZJNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lUL/+Jv9AySHGDmdapF7nVQelEzKAwZPJAjoOeuoluR1wvytA8+JLr0EhRFV14jVkzhbnKVG3Uesk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9fHZ/dGY+kMbabA1Mj4EqSHT95hms4/vJnKmPfuI7OnXS2Iwn
	boANp0OVeGHocTNd+uJKjPqDGK1p0hU5S1y36WIWU21rvghgbV7Ze/gQ
X-Gm-Gg: Acq92OEZ0Zv9LcspkWzKlSb+Tr+vqFuphcRS6J7HN0Fp4k/5Of9Ga/pTQLz24hwFLl0
	q+x98++Rm9G4JAoUn5fJZPtnN0DGqrOwMyguWnKwiFUDKpfeXnt/41wH4QdheQt1+KH57g71QU2
	YrFBGMCrCpZv8/KQpD22Wc+vzTaQGM5rfm0e/+xZ+41D2kb6sja8R+6e++NNROJxW6GhIxA6Ak5
	apvnyffjxwaPlpV1CoOQa+12bua3ASG58Vt0pg+qQsGo5eo3qVUxY2bjVrVo/L7SYBRVprykpDW
	0qc+7JTHN/+BbAFlZACkw6C6hEfWxjsipclIagkktbjHk4m3lLwOsmKCRfl3wEU9RuqeP7/9mA8
	G7jYfpesiLRB6tNZU2lB9T1NVsvF6xHRK+R+iPfpsCOOWVp2LKrEnjcxUiMVH88WPwzz+d4wLzM
	DjbXr5ZprdPI0ZA7bvVZzj0mfGs1a6qhO7UO53MtjfSw==
X-Received: by 2002:a05:600c:1796:b0:48a:563c:c8c5 with SMTP id 5b1f17b1804b1-4903605ada2mr28491725e9.8.1779375687960;
        Thu, 21 May 2026 08:01:27 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:27 -0700 (PDT)
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
Subject: [PATCH v1 13/15] dt-bindings: display: panel-lvds: Add dual-channel LVDS support
Date: Thu, 21 May 2026 16:00:49 +0100
Message-ID: <20260521150038.103538-30-ivitro@gmail.com>
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

The panel-lvds binding only supports single-channel panels.
Extend it to support dual-channel LVDS panels by referencing the
lvds-dual-ports schema when a ports container is present.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../bindings/display/panel/panel-lvds.yaml          | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 7ed0c486870b..45183a1439ce 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -82,6 +82,17 @@ required:
   - width-mm
   - height-mm
   - panel-timing
-  - port
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
+
+if:
+  required:
+    - ports
+then:
+  $ref: /schemas/display/lvds-dual-ports.yaml#
 
 ...
-- 
2.54.0

