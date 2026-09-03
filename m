Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A702C4F475A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455288; cv=none; b=u7jNqcveWZNgwrDQvQQ5XO/zN1TaZkwWr8lL2qWVjqEDBxznZLtYlNOTpxJptp8uQTGX1lEndm0odq/GxNF2e44YentSUogWhZORPGFX/7sJE5rS6lAJZmzkYFwl16DPyL+uXijHxq9tccTUVS3jjG0YduPJewwwYFwCoy2BRGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455288; c=relaxed/simple;
	bh=8lvDWbK+uMGm7vhd8Ln53UrwdC+utMFwdIt6V9HHNHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VH8Nl5+RDwh9GJ3tBCdkdspOa10T4Y18ALzcJyhOMnK197Gm3jbLhfASeRWHIXkLXjgv9GfsMpvhHdtVDdDoMm1OlHwYazRR4FdIBWp+mG1SXyYom9+BztV/q0ZLlhtt49hxUpMRMnYiyp57LJJPahLutQZsEJDBOPbhBg4f/CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1PPcJaD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1PPcJaD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8687630fso893185e9.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455285; x=1789060085; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ldFa7oMAa77O6P3elMvA8a20lvnsyT7s/QBQvG18bbc=;
        b=g1PPcJaDEBREL+qGdYQ8DUYK8wafsjVgqpimYaJ4gdAqEcl7PSHPq5gW7vfIEC+jj/
         t244kWJjpq5gLBe/IWo9EAVKI5KEehp5UOknr3ynNK8RpeotUGOePtJdUeOcOhUd2IuF
         76UKHcebPNlQv8ZyUieX2JPD7Av4ISGeNiHRpq0A7P+XmcKNo5LmX93wcrNdA7UpB75M
         An48gFPOZrWt5aVZf+r0+0qjDystuNpW+6ZNAgiW7tvOYzcO59JcMsFAels31hY/JxWo
         BLDnSA8OPS0tiqklwEWgFNjmba2YpNvVeCueD2+G0HeHPerCHQ+NHbjxTXTRTP0H5oCT
         PW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455285; x=1789060085;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ldFa7oMAa77O6P3elMvA8a20lvnsyT7s/QBQvG18bbc=;
        b=OWJ5QlQ/mgmSyBQg8OMtSwFhmXmR9wAw9s6wYl4ROqkA6BHFpabBqZifPrKPOAJWQX
         AavecVt8ofu9trizmaNeO71SIv/i4jT/iWsKdKO489eWfo8OEwooqlw4rvRRuqQkhv3J
         +40IdPhndUoHySUWDgmlQCZlpZWsHo0505Z/Ry6KT+op4o8F4N0he2JP67zgdNvGeleC
         zQ48mYGW706Jqh/X+m5BAfkFJnbtZW7iWV34psfvPA4ftjdsI6Xw9hag5rs42pqfeWss
         oYTAL73JR57h7upZiimywsi+T0fsfnPgo1dbopylDj9vHPa/0mS2+3LRtCQ7geoTh0+P
         TrJQ==
X-Gm-Message-State: AFuF++megsknedc1m0erRPKXa/v0IZ/JdVeBaqMhUP5653hSGPax2Fiz
	XHndQykhV+PhidP3UIDHT2+c3eMslfNBX6ejY5yVct/nInulG3a122Nc
X-Gm-Gg: AYBFou3z25RV9ytUM2ZPGx5wmC5KJ7Eq8CQqyaSZJkaCJvIXoFQkpaa3R/NgWHxf7Ma
	ZbXBPlVeGviucfQpv3Hwd/FJ0rmys9tzjb0abUEJ86ZbEpPtzMFMl9kEEsEsQm9597l3sIvGLWi
	F3OXnuXl88ZeI3CAbH6URjZ2v5Kwvm4Ywz/RyUUIvfFcgmJwaIFboWID7s01kv8c/ByPRRA5WIB
	gLDBvxIZ5LfYc4Hmg1SPzXVjKnMyzbuf8wbhMdzLurY2eQReGJXV1ix4wqGBdiz+s76DgIwgcCu
	/4IaY7Wrb7V/qA6QZ6yAyjWit8geNwV7tKfPZYODH5FSEut/l/KlQLHR4GvrWD5A431p+0yQ/Gy
	I0vrnLX6Q4QCPy6LPNksHzfKs21a/WSCFnzzJqJC4wlEDpi/guMs1MSL7F0wvopt4Zqfpds/Vzl
	JDudiIUjro5r7MHysP8DNq4lj5TaGESQL0XijcKvYkkStVH8mZKMPgs1NFt6CUPkZL/5DsK7nUY
	4MMqZVLDqZuqdNwgirRCImZZe6itKCwzmSds8kAbRHMVQad885m8vS7uF01u0SYs95e4aK31NAc
	DMCvQ7uzmV0FudTVSXnY87RfHBfZ8ugSl6NHvfCngnFZfCpWiA==
X-Received: by 2002:a05:600c:698d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49cf4e14cb9mr86335745e9.16.1788455284516;
        Thu, 03 Sep 2026 10:08:04 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:04 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in
 SGMII mode on Toradex boards
Date: Thu, 03 Sep 2026 19:08:00 +0200
Message-Id: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCpmWoC/yXMQQqDMBBG4avIrB2IU7ToVcRFmvy24yJKkpaCe
 PdGu/wW7+2UEBWJhmqniI8mXUNBU1fkXjY8weqLSYx0pjfC1ntGQHa8rTEL329tK53tMYujUm0
 Rs36v4zj9nd6PBS6fGzqOHxKkxIZzAAAA
X-Change-ID: 20260902-add-enetc-port2-735526a9ef2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
is connected as an SGMII Ethernet interface.

Enable the reference clock on the modules and enable the PHY connections
on the supported carrier boards.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (2):
      arm64: dts: freescale: imx95-toradex-smarc: Add ENETC port 2 in SGMII mode
      arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode

 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts  | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts     | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi        |  7 +++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts     |  8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi |  7 +++++++
 5 files changed, 58 insertions(+)
---
base-commit: ff1bb9ccce43cd06c766c3ddef796a7e40e623fe
change-id: 20260902-add-enetc-port2-735526a9ef2c

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

