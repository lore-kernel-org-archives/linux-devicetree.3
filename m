Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8C73264DA
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303352; cv=none; b=s9nROY16KrRpMORgmLKPC4xKyHwa1VHeUeD4Myf+JMnFTo3uApt277nxehBErZF0Xztu/Hc0kWr7x0/h54k9PwJR/EC78/GSF4AG9KnFUFvu1soKan0V4F2buu1JMSiLZdcmkNiNCGEb8czVTiVBbRDJi2/+6eXDfHUJVttd4fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303352; c=relaxed/simple;
	bh=Xh79u2I3b2hu2peNDOXXVhLaQglsCAryN12wXb6nPgI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PV3KIbNiUyeXYismdvTJ1L+H8Gfn/hpKjq17UtVpX6quttZJZKVJbJAvkyq5TCcE3vjBVyJ2jvGTbU/zfsATRj8T+c6r0g/fVPH+N7xPH5cZhLCJtc6e3jIuNgMehPFe08lUdpS/SmdBjfcw/HrmT+d5MoiDCsugWmE/mA7jxv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Opk/KaUe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Opk/KaUe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so135415405e9.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777303349; x=1777908149; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wUtrIXRTfOr+O6nQ8tmIzbVyTOQXWqkfNhpm00D0Vo=;
        b=Opk/KaUeWXunB+CcMhVCcav8BSRT6jasN8uZlCI5YkPEUn4uYNq8s3f57TTxe8mCNP
         9LAvOs/aX7gcDoWHi+mvmUUYY/E18qP0X2X/Ay68TrKsZzgH7prbbUlqTkT3Mb+EsTOs
         kL8MlSsfb1H9V8tUJIjIBaAisuKBDPzQq825Ht1/0W6aGDV6CnqfvIaTk+tecooeLx5w
         lLgm4tvjSK/ETDGPZk8BZb/bPbuXnvKPTUWg0RxuqwwoGC6OTfQaouzQe3zBaV5kghuS
         8Rs7VAlGpb+qAjIBlhgXtkLqydzNtStgVgq9BUKPCJMWoGm54F0xdKyP9OQtoyk18tRq
         QWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303349; x=1777908149;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wUtrIXRTfOr+O6nQ8tmIzbVyTOQXWqkfNhpm00D0Vo=;
        b=cfUNWd9k5AurzQ82cGSxvSC1nCTnbUAcQPtVBri1h8F2whTkjqWlGks8VtfrO35WbA
         bc1lE7m8tgmUAov2YAC2zZUWLnGn8f0U1hXRLAQJoRPuiAxRfgQFExx+B6/+1YGuf16t
         vXu1403T4nE4AMDSvbkMWRIWNMchs1IKW+TEH47w3NAE1aoFf7492vHdgLJtEL7G/KTM
         Glqe+y88snrq30K/qqbG260C0z6g8x9eRrM0diR1rbrRR6h1ZyPaNJvJ3r6ycEDWZCgI
         tH19YPhxsGvVRGgmV93TvavtPwVzm1K9HaWwUKdJwxlF2PwhS6fwKQWrnZQ/ta7QXuJZ
         ZgUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xajJ4wozasdF/6k6EElx40tths2fz2YGVQLL9uLZtKkIcmpvzPb4FQpsp3PcE0fRQWMAlwicgAy8G@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn5L6+Hbb7AI4sZhbkOiQWBZzYfPkJy46kbimr75YMlqXxO7ne
	J7q6FZcWTmy3y4KoksieTolKxHcmZKmNonBv7FpHkLHw+9Nv6BeD3idzBvmhnvS+xAI=
X-Gm-Gg: AeBDies08ZlFQAkyHozxst+TMpDM524Msfsvwdi44sKi0sEUMHjJsxvGYahNPi49mJC
	dyg9+naA6wrI5K2nvfLbwwxjaA9a9mEksDtp17sO7zbazna5bQstqgpKKzvp6kUg56Zl9RgvhGi
	pXcFpoxCvJT3hrfX2MbutXu+d8t/xMWZGk6BOUamuCiYDUzs+gWM1r+anPH+n1EfP4lsa3f23eR
	sPmBKlflNe2YPMXQpxjdYm9VKefelJ7atUR0F6G8udqgRIPtpBaV4sDU6XZlnb/iNloPRjwAMNJ
	BAvxZo7PWyrlpopFIMj7CQO0www6NpoZDsEVgGpnn85+LC5Hw8PNRoeKqSnZHv1X5swZAEIvqy4
	VHUfxig9U83CDMzhObZzQzdIR2lgCgx6TXS1FHpNn4ESBNrhkLmoB4kX3nzdSZk2ODksGRr45hc
	g5eTAF6+sW/BKmRDdpZE7jS3lLWC5ePIIye5wEUMdDmGEsVPiJz49Ab64Hc5OqTJ2cFIq1GmemZ
	alDI7h5tlSWohKdmsX+wJH2lmz/CZPgz8pM0eeJ
X-Received: by 2002:a05:600d:8408:b0:486:ff92:63e5 with SMTP id 5b1f17b1804b1-488fb73dc6fmr483448635e9.6.1777303348718;
        Mon, 27 Apr 2026 08:22:28 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm861247695e9.2.2026.04.27.08.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:22:28 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH 0/2] drm/panel: Add support for TSD TST070WSBE-196C 8"
 MIPI-DSI panel
Date: Mon, 27 Apr 2026 16:21:08 +0100
Message-Id: <20260427-imdt-dsi-display-v1-0-bb2768de120b@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOR+72kC/yXMQQqDMBBA0avIrDugUwnBq0gXiZnqiFXJqFjEu
 5vW5Vv8f4ByFFaosgMib6IyjQnFI4Omc2PLKCEZKCeTl/RE+YQFgwoG0XlwXyTrvXHkTGEtpGy
 O/Jb9v6xft3X1PTfL7wPneQGibHNmdAAAAA==
X-Change-ID: 20260423-imdt-dsi-display-28bb6a2a6188
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
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
William Bright (2):
      dt-bindings: display: panel: Add TSD TST070WSBE-196C panel
      drm/panel: Add TSD TST070WSBE-196C 7" DSI panel driver

 .../display/panel/tsd,tst070wsbe-196c.yaml         |  64 ++++++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |   9 ++
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-tsd-tst070wsbe-196c.c  | 168 +++++++++++++++++++++
 5 files changed, 248 insertions(+)
---
base-commit: f6c73e7156b54d8b9ddf1a27f4e93d3a1e49a73e
change-id: 20260423-imdt-dsi-display-28bb6a2a6188

Best regards,
--  
William Bright <william.bright@imd-tec.com>

