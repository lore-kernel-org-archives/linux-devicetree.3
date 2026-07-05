Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28D360EF3
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238319; cv=none; b=hTDlXgJDwJlgr9hQuXUsJWVIgWAfpG+3ZL3oeHTo2NBex4SxR01D9e3p7CUiSRtq2RVeBynW+Ni00IAaq8idE78uFHKGeRTcwk8VUekqZSm64nHCNGzb7zZb0gKdNCGvUErop0F2t1tqok/l3UwcbF4XJkAyceGzHA9XOGuJBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238319; c=relaxed/simple;
	bh=Gd6MlDdTQsHXKAXfnYEwmqafYU5uT6MkwvCo5cd4Z9M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r8xol0yjYs7wA+NMF/qkVTUc5TWdYLm6nysAbr2yLPN0EouuAo7ux0BFMv9ixNY5NSr2TaXHESnWGqQyqBC5gg/wCF/zcYpzDHuXzzohIc5AnSHFBTchEEhwv81LEw3QznO1Mj+z/fjvALTunDkcjOKOQXnn4vJuYlHbs+AVvUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrHF7ezA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrHF7ezA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so13234725e9.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 00:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783238316; x=1783843116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHxxISw9/eUoh0glcJjvTPDJ3DTP4w24ytxN3iIm2gE=;
        b=QrHF7ezA6qaAE+sQV9O+OXZe2PHBsV8mFHQxxSYejLdc2j9ic+aqC2En84lWgmSmiL
         GpWHx1kNUTfTIU1ZHvmUkfRsH3jih36bSBwDaqES+R9bvkHKp1bcQy6uHjs2jDWIqCJJ
         BHQZuOOVXV14oGCr4hec+7efU5JbrOTKJgSvIwZ5JkKfGbld9k6c4PqcRQ7O5T94C7TU
         IVH/bT/+/AvjZLQHZMvIP3hEPO3r7tVLkw5we659eD6joGBNiqpkYPkuo0vIEX8VU7Qj
         ZEv6Klk9FVbwboCw4EJckoUGTB3lB94Q0LYvrDbrdlfYEgIzcvVvoxJ55+zxZCVDTsK1
         EdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238316; x=1783843116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHxxISw9/eUoh0glcJjvTPDJ3DTP4w24ytxN3iIm2gE=;
        b=Ik8x6DwZQH7jtw7d3rk59RYhWuDAoTVh3FrlZ6pQWkzCk4xAF8tLAvjbLnxBoTfx8S
         MiZYHSXCQKAWaYYdpQFYsbG7UeEtsS2l5aeOOUKZDDcvB6niPxoNGiGVyqd4g1Tom3ar
         0n/5MqqsIW/BxYfAn6OQNEyTj9wtSzyorbH2140Z+hjVi/BepsSH7TAA9qGcxbUdvAwV
         55Dd5UtJK8/1QBihzufcUPeIcgk2bbKqX7xKBg7f4L0i7RGERF2m5bkO7mLoIoNSGNrl
         n1BRKLW5s7z+qr/MeZnI+QyVc6iSO8WfcjxuUfSZGTayLT1S50c9B9M03YDW6eHMDnqP
         0ZIA==
X-Forwarded-Encrypted: i=1; AFNElJ/mjjRaeWaxr5su50OoBHwYj9LQV5ggMSi7ADrbxmOFyPlRCA48V3xP9V6ax6KiAtzC5N9fkP7LdvxI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+JQps0q32aGdHLCE+PpmrWRMYvT5JS10V4dZ7ic9ceFRssVJB
	15d5REwopwkcD0OFNie9OltKHiHhVash5eDOrW4ctTanB4cnKoC/MfCX
X-Gm-Gg: AfdE7cnNQBFMDPOuMiLROA//gsHfPqlinYvmGAnIxOUZo1hhMXVM8zK5/DPpAid3irT
	sC39+i93dVvnji8NcTZYi7LFdN+lsIpC7iBCuaVmX8pigFfvkeBF2SRoyYqaezjGCvJs6MpKJ4M
	ie5aeorUB8BuWKIVTKr6x9jEgyEdMDtWoKhMVs0S7+exwo1xk6puBVBTH5Y4yCHin9a9CBG25au
	i7sDkN6FBJcu6S8iV6k9Z0rWWNFkIU09WrUJp6UHxSm1DZvIgwYE126nruduMdAAmXu0CUZ/ABy
	iN8M1IV80JDuXdeT/4sFKTdNlQN8RSu/jBad6CCpYfLe5KOpvikYAjXg4jifTrCnxEs/t0k3NyP
	pKfQwg76TyUBKCsiA+N9X3dPNZU9bVCFG9sgPTcHHWGA9nmFcIi19zMfwlk5m0XgN23Vfa6xy8V
	DFvfZc4vhwkDcv884WgoxgJSZhT9npX7sx4A==
X-Received: by 2002:a05:600c:3551:b0:492:4714:2d7e with SMTP id 5b1f17b1804b1-493d11fe2f2mr68174165e9.36.1783238315894;
        Sun, 05 Jul 2026 00:58:35 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm305769765e9.15.2026.07.05.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:58:35 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2 0/5] phy: cpcap-usb: improve charger detection and export cable state
Date: Sun,  5 Jul 2026 10:58:04 +0300
Message-Id: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Motorola CPCAP USB PHY contains the hardware state machine used for
USB cable detection. Besides distinguishing USB peripheral and host
connections, it can also detect dedicated charging ports (DCP).

This series starts with a fix to prevent spurious SysRq events when
switching between USB and UART modes. It then adds DCP detection support
to the CPCAP USB PHY, updates the Device Tree binding and corresponding
mapphone Device Tree to use the charger detection interrupt, and finally
exports the detected cable state through the Extcon framework.

The existing driver already interprets the CPCAP USB detection state
machine to determine the attached cable type. This series extends that
logic to distinguish DCP connections and exposes the detected cable state
through Extcon using a standard kernel interface. It also makes the idle
UART mode optional, allowing the PHY to remain in its default USB
detection configuration unless UART support is explicitly requested.

The series has been tested on Motorola Droid 4 hardware.

Changes in v2:
- add chrg_det interrupt instead of replacing se1
- Fix remove() race by cancelling detect_work before hardware teardown
- Restore SysRq state on all error paths
- Introduce CPCAP_UNKNOWN initial mode
- Snapshot enable_uart module parameter

Ivaylo Dimitrov (5):
  phy: cpcap-usb: Prevent line glitches from triggering sysrq
  dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
  ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for
    CPCAP USB PHY
  phy: cpcap-usb: add DCP detection and make UART idle mode optional
  phy: cpcap-usb: add extcon support

 .../bindings/phy/motorola,cpcap-usb-phy.yaml  |   6 +-
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |   6 +-
 drivers/phy/motorola/phy-cpcap-usb.c          | 334 +++++++++++++++---
 3 files changed, 290 insertions(+), 56 deletions(-)

-- 
2.39.5

