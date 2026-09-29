Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01802EA15C
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647743; cv=none; b=QlkGUB8GObTogK5ap9nrLPu/5cXhj+YnXbirKY2002NMoPDcKu0ZyEEDiLzLjX0wxPzZN+YbT8NglaznyfsqiP5eJBlmE5clhT/n78/win37FuhTpHB1/NwLlDpEV6FL/rjyoatskNZEDCdkBL0XiU+bo0iKykI3lEwZ5LLXu8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647743; c=relaxed/simple;
	bh=1jWnqDpKjpH+RAsb9b6dffOISc/Qp590FeLfeOae30M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HE3yXi7CXsA/gdTMObJe/N/GtcUXXPk+nb8QpJTojnG5hL/SnHItUxxi/H9KZ6Gf97ZIJbu7JlKxDfOXr7g+obxEaM9InaRfpaahvL1KHhyT+m6Z0js+qgFLu+OfRAkSnSCTuraOsuoDI3jqShtcdS2xEuFV0ylOmFii51C3s2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjO/JwcU; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjO/JwcU"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc7979d1dadso1786493a12.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790647741; x=1791252541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFE9LdtdYAs5eAg39qz6yH1XbrxOARGWKf2glnJZAQo=;
        b=pjO/JwcU8b8mJhh4+8/ONUnYt6gAL7o7JKAM2q3IEXAxkbhV+LMhSHyiE1F2g9gJ8g
         IvdcqxwaXS4tNlCneEVssViV56qnDMjuNsX+raElqxP50ZZ3iwWXwvl3pppZ6SKTfufy
         i0duuwPt29XYDS05KDBdUP088l3OKfqRO6qbF0ZV4lH3BTmj06myj9gcIykBfEkAJHhB
         b8tIxjSgcz5wssuSQVISbmVoP0Gw2RPRw5+j+eXc7cSqw7SKP7ZSTKCF8gcfeCEFs0qs
         FWYDaPLo10+q+oWcMDqNRqQMazN0TFRJ/u6Y3JeQu9XmQ/aKwRWsqFfktVY0i7SBB2OD
         ilvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647741; x=1791252541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFE9LdtdYAs5eAg39qz6yH1XbrxOARGWKf2glnJZAQo=;
        b=f871nvKAU2oONGYRO9FT1e6u9XCXM+I3yTjqJx1d8c6KMsEvVFvTNvABeQ2qxaMq4m
         JD3fMk/3Yrt8A5hFGjncY14KO4+h00bzbxa78I8G/PM7FrFs9J0WuQimGhHcsla4WGrK
         0CFW252XoZDquWEK37P/W5MVSkGSJWR8+y8yCbir+9JqxranAqz+jHXUj/B/s1iQTq37
         L/pbHI1RbY6dq+T9QexQSN9m0BG7BHd8nzYUra0uQdc0v2Rb7uLGzuirfAOcIR8wXY1V
         4t7gEM+mJzFpI+b6w9Wnk5roH7Dhk0/v8OgZhIsm5ItxTQ6veFw+LrlKYJYu6FeqVpCz
         ilbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuHDIPjH2fYPCDDwKpjpVVRpsGThsImW5mrWgAyPN/kZLYWE2QV1XV9wEtMgsQAY1P8180QZhHaGDO@vger.kernel.org
X-Gm-Message-State: AFuF++mNy5uv/3X6uvk3lXxovOvP46eje3ZDWfCQoWMQMR28LeMr+l3w
	TwKqYHMAgNEMEqCiUGrjDYX4sa8xPsADFjtQztDs6eMno35rSWfUBUko
X-Gm-Gg: AYBFou13Z46UqAautD+k9sPjJQ2x5JUkhySuMTQuzQZnsD6JroGi3QjXwOR1wNjGIXp
	5AtrjXmZPosDO4HDvlbAQvEw9EK4PmTWhZslH06kRFMfEgdgvyRTuLTDMcmRz38FI4BkPuOKdbr
	i+4LbBRTBgNuaP5xP+nJWFvPC9jujYuKZvawvThlHHitZaCW+HNyRAIeNlVT5H76hKyZwUuynmy
	H8pML4V68ljyTczqKz5dNxOoZiXQRsKYaIE0MIm5q2LV3GCde0d5Jw11qAJmkSGyNjf2KXi0Z/F
	ee/XFfW/4akxgaU03Pq/c7yJM7vWvNkchatkt0FqCltG7dLDdOBaxhvj7LMelwWEuYv0uRyUlgr
	69jLqe7gB2lIJNb7WrklXTGxyCm5XNLnMkDZwn8eC9GKBXwTaLtvCVJacW6e9Uhhwz3ST9MINnI
	FLdfLXG2C9S35+AJn0Kcltt82tN7FJeMcPC+NvvAQUUmP0urtVQy/Xr4WlqdSvOIj/pV3arvaOO
	bIstKkqgUJ2pHIwlABchAh0WFvzMYoQF9SKdW/GEfHLnUUTMfv1skiZcst4DUpd
X-Received: by 2002:a05:6a20:6f03:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3de0e6f42a6mr15736585637.1.1790647741047;
        Mon, 28 Sep 2026 19:09:01 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796cf39sm5448596a12.32.2026.09.28.19.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:09:00 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Tue, 29 Sep 2026 10:08:51 +0800
Message-ID: <20260929020854.1282339-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v5:

  - dts: rename the hsusb pinctrl group node to hsusb-grp.

  - phy: keep the clock-stability polling when SUSPEND is already set,
    per review comment:

      > +       if (val & USBPMISCR_PHY_SUSPEND(n))
      > +               return 0;

      Please keep the clock-stability polling when SUSPEND is already set.

      If the initial polling times out, SUSPEND remains set. A subsequent
      phy_init() call will then return success here without checking
      whether the PHY clocks have become stable.

      Skipping the reset sequence for an already-enabled PHY makes sense,
      but both paths should still check the ready bits.

  - phy: clear MISCFCR0_UHOVRCURH when nuvoton,oc-active-high is absent,
    per review comment:

      > +       if (of_property_read_bool(pdev->dev.of_node,
      > +                                 "nuvoton,oc-active-high"))

      The binding defines active-low as the default when this property is
      absent. Please also clear MISCFCR0_UHOVRCURH in that case, so the
      configured polarity does not depend on the state left by the
      bootloader.

  These are pre-merge fixups to patches 2 and 3, which are net-new code
  in this series, so the commit messages are otherwise unchanged.

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 286 +++++++++++++-----
 5 files changed, 390 insertions(+), 77 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

