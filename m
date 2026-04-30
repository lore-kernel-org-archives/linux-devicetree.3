Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69672402454
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542445; cv=none; b=mUhjILx2d8ahDITd0zZdLtCsKSHvKhvPpU0EA+0TbT/+A7WdXKQJT3ifa/ACHOk/l29F1HSr6vsVVFm2kLr0rbLLIvVYA/49RydGdjeIQnZ2bbjDtlCVYNVwqS4WocjuyDuQOqAKsxEUCdqCdaUrF111nPGL2Z6gtNm5e4QzsOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542445; c=relaxed/simple;
	bh=sTmt6cdg1kP2+eYTeEKKnHTzDGESqLOto0bqSvNzmv4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cbVHSVB3Nbzoyu9sirucFHWRktlJMZ1eoWlDLaUamz6mvVwjJ9Nw6WAPbs1KID8GZMaRBnwPQKUIb2IDnMioNknKUa5cW3WQkWDW5EJJArZ6b+PSitgJ+T0AoUlLx4fGk3HkyyCuIsURjbNAK8mFjuK6qKcUryxVrLkApwtBqDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qloev3DS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qloev3DS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ba840146so5317975e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777542442; x=1778147242; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRjYmZEKAOcTK8eSw3z2UVlFOUwJtPih74xVLDcM6go=;
        b=Qloev3DS5tHBdsybmK/z0AIhQARlY1xsZLmzpOu/fAjvVfrjKvCL8zmVqqfsTL3DUL
         L32j0m6BNHRj/xC7xTYAWeikHaAMwBaO6vFKYEXosivLpMEVsp3tgkUeQUQVimKB/sWE
         M5kWjWlfaQHGBApN/xRJU8fmoQIr4w2rRCdieSAQ3MY84rw5aIQ04lKV4WAPgXPSM4pz
         E4ufEyt91fz/BADWcYqAG9K3hQO4yERjD8zqPgeT1FR+ICy/EXQbIbX9p+EWsAJk2qmN
         Q5DKy7sRkYaMjieRD10lHablDA4KITo01c6fwRzRnIK5B0U/OWHrFXxEkGMo1IRR/vQI
         dS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542442; x=1778147242;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRjYmZEKAOcTK8eSw3z2UVlFOUwJtPih74xVLDcM6go=;
        b=QUL8Umvpb+Exl/omOpPmqBY/Uxdx1zmWcgMX1yZdLup/bajR3aJ9xWahR05D+wluFT
         hAMORVGtPk3Ije6MUS7ByuEyIxZr4wMuZyA6koU1Mejeow+lxZrXmD1RUx4e+56C9NyB
         iQ8G2QcSjO0lcRCoeLeVPA+JQ54yi5LUi2k58PL757F5IHdrUmXFSMJq7YTWruFBCsUr
         fNweh0zrJ4xqft8L3WujHz6OUj63zP6Dg0E1ygeiJJ1l8qCi079hTE0gQI/ehFpS/MtS
         Fapejfx2tAN0pIW/k1C7f6Tm1R6dFIesi9qQxzFFxen9Db42EkIDJRXAA6ypCX4+JJpN
         1Y9g==
X-Forwarded-Encrypted: i=1; AFNElJ8VaDCWtU0S8SkdiUjkM413C/s+CX43+ox5hRnB4U37Bx+qs+XOcSRwEpS9wcpczNJdUigQ2wvAqBXK@vger.kernel.org
X-Gm-Message-State: AOJu0YzGQvAC3XqmEDMy3JFP7qtlxNcjI5Oh9FNcDD9xQIU+kvm1iqTG
	is+oE6Vb9m6oAbrWBB5SSIXmAPaIqeeWX+ooZfQqB2+gL+CP6XAsL3bBN2PcMJx7E1s=
X-Gm-Gg: AeBDiev3p+YGDRO6Qgb514dRVcHKao+8zw45KzFupTtLX1ZhhxbqzFdKWSW+gGEBtnv
	x4Eul5EcRz9bINHDtrgEPv0EsV2Yos9Dng7UZ9Z3Z0tg01DrtmvgmhIeAEGliO1bEDqHGL/hL/s
	pbCfhn0pB4ly0Z+ccKgOqI+LQl+3gRBqKhugUWT6xBkjKH0YlxJxPxc6OSgAMDzI93gcBihmLb2
	ymTzBGIQieIZ+x2pA0/heZWQjBTmJOH5Ch1CK2GcsDTdWFcEofy+NJgM9x/mCXeRs5y0dM1+ZBu
	fa7UH1Xag6ZyZPQE98ixpVzzXFvd/ZecadS7QaDSnF7Z+l5+4wlydN7Xgh83yIqJ3rj4jXPY2Qd
	lGC22gD9IrTsh99me8ZZkFBI4+TS1rUgI21RPrznOzGXAv2QPZU8ze0/2qPxYK8XvMQbgfCYkBJ
	Omw+6hWlT5ZS0KUXTuK5FsMrovj/0zyT2OwF6Hrkej6DxDzW77lSDZfBc=
X-Received: by 2002:a05:600c:a312:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-48a83d119a7mr27313465e9.0.1777542441736;
        Thu, 30 Apr 2026 02:47:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b9493bsm48984745e9.0.2026.04.30.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:47:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Date: Thu, 30 Apr 2026 11:47:14 +0200
Message-Id: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIl82kC/5WOTQ6CMBBGr2K6dkwpFhpX3sOwKGWA8aclnUokh
 LsLeAKXL3n53jcLxkjI4nKYRcSRmIJfQR0PwvXWdwjUrCyUVIU8KwMpDOSAX6bQEuxkPQYYgnt
 gAlbAU1lqA7k0GWLZZqi0WKeGiC199syt+jG/6zu6tG1vRk+cQpz2H2O2eX8mxwwkSGdtg7pt6
 lxdn+RtDKcQO1Ety/IFCKGgpOsAAAA=
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sTmt6cdg1kP2+eYTeEKKnHTzDGESqLOto0bqSvNzmv4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8yUmoqUJMN6KNXMYggn4lvttmBXtPuV5E+4QafFy
 alS9YaSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafMlJgAKCRB33NvayMhJ0USJEA
 DLLfrV+XmHVTW0+P0QA9uwsYnnl//UlTxUS+XiiMlrgttbffXtd9m2HIhP7aWnLwK3BcGSNyvm8z3Q
 nbl4+8HkGfS/jsDRnCrHRT+cSvpBl0gLyaF7yarxlI4U2FlS8dcDyWEOD6306AXPrFcSnzxXYwNO2z
 J6HOROZkbBe2rsbTC7kTI9BsJq/vwizGsHzOnLEczfJp1bks34RE8PrAr/U/25d+09/jkXoU1DGXeZ
 8+i3NE4tV5P0+TXCWCHsBdPrvtJlGXFYG/4/nk9J1zNTISz/XXOwy8MIziBkv+wX4s6d5S6+M9aK9V
 oXFOBSScGN7N2/y54VcDJ/k6jI5z2KBkvoSFfwvLkQ8pbRBCCyLFnimrT+bLgT6RZyImrVrJi70MNI
 IEiCN1hGnAYbcsldxgw0oFbUr3swseraQKWequ5W0vGwVWJGC6ORpy7XdOyETiiqt9D1rrvrnPdEZq
 cTK/RAPZcoJbCtDuJw88xOXVxaa/2/xkDJFH5VBxAmVlALPZTKjXFFNjkXObuZqgfiO5bBHezjkFHm
 H6tN/NVPOfFIE8iXMOgMCHOIzbrdBlN2czkQ6FHmhRK++TAlvsr3HWr7s6v1+GnWABOzsQ16wYQ+u/
 A3a3Z7suvh4S3r8aqe3gaWm5HVEHtPNvPQ6IxtLBvVuR3WaASL2HSIbfJ5YQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Implement support for the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control in the Ayaneo Pocket S2 dual-DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Fixed bindings subject and removed "|"
- Added review tag
- Added higher delay before reading ID from HW (100us was too short)
- Removed probe defer if i2c read fails
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org

---
KancyJoe (1):
      backlight: Add SY7758 6-channel High Efficiency LED Driver support

Neil Armstrong (1):
      dt-bindings: leds: backlight: document the SY7758 6-channel High Efficiency LED Driver

 .../bindings/leds/backlight/silergy,sy7758.yaml    |  53 ++++
 drivers/video/backlight/Kconfig                    |   8 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/sy7758.c                   | 311 +++++++++++++++++++++
 4 files changed, 373 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

