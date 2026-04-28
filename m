Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4537DE9C
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777389471; cv=none; b=AKgG/VUSA06YfBleAPeF/3Wqak3+Z/PcQoEwnoGEaoiuy+R+3JmUJMP2JGrge2GNCnzY5h8k9ZkDhHETeOwGU/bp/2KtrSrXaOi6jGIWq0aMwUPpIGWjkAZyHtjHtCSnuruY4JxutK1IOpG+whufdA2gF/YZc+RLJyt9cZxgm/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777389471; c=relaxed/simple;
	bh=0MYbAaN+UBw5aL/CYJJbSZ5+VtbKOGI1/ywR6bSRNy4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R6lSBmTTIyE341nVnnzKP7/hVK4W2QB4UEymdv8ju002Zt5Sv90Iin9ywN3nVu6oB/exMmnXp14CWo+8HVXbnRhhTzddma073R5cK2fy1ebSlm59tXl0vO+7oR9WmxIGyGGdar4fBb9YyCAYHjeA4efKJk2leQXVGLvFT6iKyMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=JkyNiIfx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="JkyNiIfx"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba7fd666666so1075131266b.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777389465; x=1777994265; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tfcGL+vcMS+UjBvp0G25Bttx2znw1uqS/N2RTCBWA44=;
        b=JkyNiIfxmYZRY9boXMGiYjElkqxgrZ62rk4lvupcZCZOt9SnZTs1oilsFgQNVPAkTT
         QJyW5546G6qfotDFj+A9SKOqAexpMzyEuv6SvEgm6aCJfMTiPMla9hCO7zn28UrDKYWq
         Ht/hOho2zid0UvphYBxEIeRLg1Ev32KYC2YuQZS9oN9rMsWYKiwQQ+2kEKEhI4QC/euJ
         P9CThD4C0VfDh71T4Re+WvID/xNGpStU5NAUIyWYG3McwIgQI+xhiZKSnrOxfPBdj0P4
         7dymUdS0a2tWIJ4Q2DC/KDANpQrulOgpzGPwijeS1KKwpOFgGC59roPd95z8NsM6mfF/
         uMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777389465; x=1777994265;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfcGL+vcMS+UjBvp0G25Bttx2znw1uqS/N2RTCBWA44=;
        b=L7V/bjr2EcFdPaDY0W5fN+iDpjYVcrw2UkQRlfox8mWK0HDd0GN72iwYwbWIi9VcFQ
         C8cL9TG6AIH+tuUw5Fjld8r/SJUzdYZwFxk3C2bcoWNjs3Bh1jHJnA8YMTRXH2yFNBAV
         aqgVzQPyOSUAFS9fHoKca60hNSmX9u0gly0OuN8fCK5RDn1gMwoJYC9wqCZ5I5RCFkY6
         ahxmOOJlcRMHz5cMpBHl9WGGE3wBv91fmBMnSmL/h0cXRGBpSQiLDvvRmNGeLgqpUJl0
         R+cs+b4B1HH++VtRWCommsOyNBTyT4082M0b1L4llfr2Fx7uU7X8sATrp3DJmheHJ29n
         LYvA==
X-Forwarded-Encrypted: i=1; AFNElJ/FzyIsLNaqaQdkdivpb7zRhuJRVXJYkZFMo2196JfMzUl0vUbSJGCMB3jynR0aKveQaaY3QjPtw86s@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTu1Fng4GHnNfsJJZ2HLXbG0jm/dAWAqwAmRbaAbn5RpEaXgu
	CDVw4onErv7paX0sgWMXEj8lYoHeU22jLQiGD3CcTLZpB2RgurfPynWcDmtPx66zlIU=
X-Gm-Gg: AeBDievVl4uE02WwXpDCHOSxZNcA9TMYWDFd1oRh/TCi7Aw6jrINeOFoqNBWZLEk+1g
	bXz80Ehy5ROTOe2gYllZDaY1OpCG069tT0belqtsu3OLis3yel8WHm4kBSdAjc+NWXDeiuCowfB
	gDheMkj/ltM1e5N120EZVj4iu6eZQQWDXm3MBu0+r9M7WsV+lQI4gLBVCQouhE3z7X2uetbYL8O
	rlOrAr/a0qISLVDgvlTVjxC0UhUJuva/QQ4QqFQwbYuN3kl6EqwAbpY93a9pSWfxYaYB1QgEc2p
	TwYLx2KNcvOWnS71Pg2wBfx3LdG/XdBSs1hJsI7mkS6D1F0L6FFjswCN8aFMMQDpqdKE7SGf/L0
	7PkPCRt2XF8XUc7xJBR+UODjgl+gzNzAwXfTUoRTsTG/BIOxH6uu00Zcd1tvLzlt13+/p3E1G6r
	NNONfxEWgR8wWA0cQi+ym7dG/LvJMXJgEJueZZIYbgJHs2Du3DLkdlITj02aSf0A58SlUin5E5N
	15XlZkL/RQN+v/V7lrFdW3x+BLzYw==
X-Received: by 2002:a17:907:789:b0:ba5:20b1:c13b with SMTP id a640c23a62f3a-bb80443cbedmr221886666b.28.1777389465261;
        Tue, 28 Apr 2026 08:17:45 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c0828d0sm115205366b.56.2026.04.28.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:17:44 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v2 0/2] drm/panel: Add support for TSD TST070WSBE-196C 8"
 MIPI-DSI panel
Date: Tue, 28 Apr 2026 16:17:23 +0100
Message-Id: <20260428-imdt-dsi-display-v2-0-cf7294b5d7d6@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIPP8GkC/2WNyw6CMBBFf4V07Zh2NKVx5X8YFn2MMkaEtJVIC
 P9uwbhyeZJzz51FosiUxKmaRaSRE/fPArirhG/t80bAobBAiVoe8QDchQwhMQROw8NOgMY5bdF
 qZYwosyHSld9b8tJ8Ob3cnXxeO6vRcsp9nLbPUa3eL1//50cFEpzDWptACqU7FwUy+b3vO9Esy
 /IBaiEJdMQAAAA=
X-Change-ID: 20260423-imdt-dsi-display-28bb6a2a6188
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

This series adds support for the TSD TST070WSBE-196C, a 7" 1024x600                                                                   
MIPI-DSI TFT LCD panel module based on the Fitipower EK79007AD                                                                        
controller. The panel is connected over a 4-lane MIPI-DSI video-mode                                                                  
interface and uses the RGB888 pixel format.                                                                                           
                                                                                                                                        
The driver is a simple non-configurable panel: the EK79007AD comes up                                                                 
with usable defaults after the power/reset sequence, so no                                                                 
DCS init sequence is required. It supports a single power supply, a                                                                   
reset GPIO and the standard backlight framework.

Note that in patch 2, link [2] has the incorrect DTSI name 
(TST070WSBE-165C.dtsi instead of TST070WSBE-196C.dtsi) even though 
its for the same panel as this patchset.
   
Patch 1 adds the dt-binding for the panel.                                                                                            
Patch 2 adds the panel driver, Kconfig/Makefile entries and a                                                                       
MAINTAINERS entry.                                                                                                                    
                                                                                                                                      

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
Changes in v2:
- As suggested by Dmitry, rework patch 1 and 2 so that the 
  panel-simple driver is modified instead of creating a new custom 
  driver for the panel since the panel doesn't require programming 
  via DSI.
- The panel controller (EK79007AD) supports 
  MIPI_DSI_MODE_VIDEO_BURST and
  MIPI_DSI_MODE_VIDEO_SYNC_PULSE. These have been added to the
  panel-desc flags.
- Rework patch 1 and 2 to rename the panel vendor as 
  Team Source Display instead of using the shortened version (TSD).
- Within the timing table, the pixel clock is now given 
  as an explict value instead of a calculated value
  to be similar to the other panels defined in simple-panel.
- Link to v1: https://patch.msgid.link/20260427-imdt-dsi-display-v1-0-bb2768de120b@imd-tec.com

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
William Bright (2):
      dt-bindings: panel-simple-dsi: Add Team Source Display TST070WSNE-196C
      drm/panel: simple: Add Team Source Display TST070WSBE-196C panel

 .../bindings/display/panel/panel-simple-dsi.yaml   |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 36 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
---
base-commit: f6c73e7156b54d8b9ddf1a27f4e93d3a1e49a73e
change-id: 20260423-imdt-dsi-display-28bb6a2a6188

Best regards,
--  
William Bright <william.bright@imd-tec.com>

