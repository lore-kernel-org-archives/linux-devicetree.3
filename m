Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B19A466B63
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466309; cv=none; b=VMwL81O1n+gDtMMgUgSLIXMcD3xUkGHL2pbikMYUMcFZ/R6YDJp8jU4xgvMQNBeJ1FR2wb5ybwt7ICi4x194S6R49IQYJ00ZU59Tshvco2z1EyIGyXTQGseoqm1tYKdyo0nKQaEQlg3zX7MMyh/sHAGcmADzVlEmz5TWL8amrIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466309; c=relaxed/simple;
	bh=D8IzJFBxjZiG4i7QLwbbQkoxdOK1FD1TAP5qqw1TXDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+Ww0KFa7T+Jp9hEa77yrPRMyCg1l3+eBIqZa21+3tzebjC5HK+eDkdGf1hnePEIwjbFYJ2bEheNrNR9UJ2+MXe87Lu6ta/hWa9v2AjhYyLNaMxPC9h6NUaCDye3pDg6beDDonCpwtQXPlH7t3I8Q0RPumi4fRhzfEkauLoWSb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=suIccIWK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="suIccIWK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so2028535e9.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466306; x=1780071106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og4Ss48qjWaYlmsfdFxPi0Imv8+Y+Dj/6CNrwGbe4NU=;
        b=suIccIWKNptHtKQw5Mg/r054oS5aMDN44u+TYmHR0u1eDDoUFnPChYoQ3JLHsMA3hh
         vJoYgUDjmqjySFNNHre44krXCEE5KxmSjlqySGX/6xnKML/WE/yRYYBfGI0WJEQ1jBdB
         SdwiqWBZvIrAq/usv6LvoATkGLObmpvdho8m0J24T8VjQ9Qd0P7e3x33ykNRl1NBtR3P
         Ii3UpwDWfD85hslc5YX+XXUU+rcjMuHBmK7sde33NfR9OEJue8SrDPoNPKRq6xPNoBYF
         0ZLt7yOLHI7LmtbKcWVZ3uACZuHEPQsY2o6UpxwJ/g+upjHmc309lcsWjYKTxETUejTi
         BE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466307; x=1780071107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=og4Ss48qjWaYlmsfdFxPi0Imv8+Y+Dj/6CNrwGbe4NU=;
        b=GOOGoHA+uau0s7jwRRi8ND1ttUrOEI1sQCaREN2Vd9c8dRMjjehg4q89WAaEerqv+X
         ZoF12VBPqdJkZK97c5BRNr3TuJl+yjxtd9LjLnLX5b4RZVD8xo6gPq1g6TYZxyeqE1yb
         EutO7//tiU3YcXfRJRPRFpzC397sHZL4oU9jhRF2GPdWLdELuLLEp10KVEhIR1swAcJO
         XywP62XwTeWRI4+xDk7XO8lFSCBKotV08vVWc+URrMEbNTq9hcQ8kc5GV+hQhJG/qs0c
         yQkrzMFj3TQO1u3KXS4HHqbzDyYFFHQ6yqBF/qAJSgFusiphWaUUTnvga+h022KICy4Z
         hllA==
X-Forwarded-Encrypted: i=1; AFNElJ/QX/nA+Y2HKv+g2zq3npdE8tnzOI2NtW1cPtorfUIekUUjrf0v2qo8oVoa6Jc52e0okfV4r3dexfBx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ARqMbCbWIv8q8ZXIosfTGp4BNzDxuOmiR+kyIMM5o3DttjP1
	GVsS4E+sUBoq4wkyZpNBebKCKscmTwhNk3/gh3+AnIah255SBb8cWUZt
X-Gm-Gg: Acq92OEErZm32uSgBWnEnzyZTnoLp58hs3vfKm0HODreHO/2fbpn85rB4dUl8JoB4tV
	VAAvv+VRNupvAr9mx9mHYVls7D/L+6hWDvcaOEXxvQwmqkex2Lx+hHy8oFcJPdtJDe0Wnc3a4g2
	KRU1dTWO520OSO3tI9UVffio0PGlbyEe1PZxrSvSdtSp346N2OGV30NM/MdzRhvnWeyf3ex7EJE
	ZMvRpD1qaX2mSIMDrqbDb3NE53Cksk4o/bl+Ljy8EmboKFl2fvmqHmUW+zh/WNiGWhjrdohZ4Ym
	DyE3wPO37dHFq33f0nSpIITw60eM2HueD6yhqU/gvf8OZGRMwS8L3F1r4hnZieItGin2KxQzMi1
	/6eJ9DO2QSa7UarUUpvkw+oaElrsC741gy8jrAeiDk9BX62oqsKu81n2mGJ15eP6eHWpGLHx7Xv
	5Z6eG5p0o7p6N/6Iz9ei4PXv8jDtmaGvXzFbJMtq9pcw==
X-Received: by 2002:a05:600c:c83:b0:48f:d612:3c4a with SMTP id 5b1f17b1804b1-49042488b81mr59056955e9.1.1779466306479;
        Fri, 22 May 2026 09:11:46 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:46 -0700 (PDT)
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
Subject: [PATCH v3 04/11] dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and RVT101HVLNWC00
Date: Fri, 22 May 2026 17:11:08 +0100
Message-ID: <20260522161105.277519-17-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
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

