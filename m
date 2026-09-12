Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B591478E36
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216107; cv=none; b=oFO/KelsClvBNMxWd9MW01obhrpHvechTRW0QNYmS3Oi4Y4tkIo8IjrxalXhWutTSt135HR5DAHstBm9FhWV2Y4iYp6neZvYri/5PcSoQF7NS/W+MTLfPqN27FOLpTs5FKOe0eNs+hgDevXZU90kkXi62bFeT16B2eMAZC8Yp6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216107; c=relaxed/simple;
	bh=06OCCRLJZiWFmko6yn+El7auSYo4iw4lQ+pGHqY4J3s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ieu3JqG5ihHwtVzmeN5SfkRcK7wNJMjlfPHpSrpPW2HKtFNmpKJbmik+RSO6wZRPm378eOy7+xPjc0QdHp4RoPbnb6cxWQuISQuBeRx05x0tdq7WIsP+kG6Zk9rYMDWg1M39Q1EDlc9+AyyesJwRFFYySY4HxpPhy6jGJ+aDYFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhYPyA9I; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhYPyA9I"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4d64bcea5so755235a12.1
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 05:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789216104; x=1789820904; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oe7EXYlzw5spJ4MGmK2TXNFq8D9C+6xPH4nivENYcuY=;
        b=BhYPyA9IrNZBzadE/xwuZhtWgRAC8lgeIBzDTaC2GcEnwP4TqINJO4sPJcir14Ucl8
         HokL2QWEvU8n8kHYaRc2MSM83FSTSzMGyHKyXt5V9avbymkSBjzU0IBseZHfOhbRENuV
         id4CiDzkufYLl3vnIiQnErwICdxzjExoh3sF1EoXaOS8+4rlqfzqHIDcysa3fDnzd3X7
         W16OcGrgE6kwustxrpONo5mufCKfCYMI+dbkou2cE5Wz0i8bP9pYi2R6TY0y5pX/H6RV
         1RAX++MPxplV2yNaxIr39O3kDcer+vFlbk0M+Dyet50no03kDxYOWumQFPswqZVFOIzK
         yKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216104; x=1789820904;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oe7EXYlzw5spJ4MGmK2TXNFq8D9C+6xPH4nivENYcuY=;
        b=GqQoekA4O+3x3L0ULPDdoA2TdRdwDtMRkIBY3W3WFm3ahfBntgioXP5+Y8ixSnaHSX
         zS82+FEI/tCdL/rzvzXtbWtuMycYBToC0j73sNVQymrTlS9c/nPRZLiCzslwanYUDpU/
         WM/w/VMUDbrLomgQTnTOSda4dCykYPqA8bjC3f7fBGh8zA/t9sBpNQCP0UlZSyWmlQF8
         pk7S060WBPLfdWjUnvPAX6SlaMmBvieA+VqlTjAETuH7hrvBfeCSB0IPm+xxoDG9LYxj
         eje98tLnvun/VjmG4f+0m/x5XDokyDhkJofOUL8+rzmGb+XDz3qOeHqnbEXsqA1AADvl
         yH8w==
X-Forwarded-Encrypted: i=1; AKwUvBygsgW2uPEEzHkoMGlAvgOdBUyj2D6ahjJwsdbjqIwDXbMfSNAjqjHUsOjaVsCJLI8LAXrnr4dNM1bO@vger.kernel.org
X-Gm-Message-State: AFuF++mqOOjh7LAoXYpAlZLxSDGm4o5C3fImIMZZlwac1Wobu4Z7V4Ow
	BK6onZlrIc2DVXafaYQBc0W8W6ZLiTxMSSybgmbdOgy2fcCwTbfEDSPy
X-Gm-Gg: AYBFou3dziDQ8uUWWAvGbHy6mJXngEVX3Vj5Cuzjp9JpD2FBkCmlAc4SLYhNBmWUwr6
	Fo9lbzj8WXRGhSeOCAm85F3k21kfPw/9T/sdBuQieM2x5OtPqVA+LniU1PgBR2PRdg1lshrlSYD
	qE+D9ASZYCRn2lmKAKnhm1uOhBe9xJMpnRTl7v8obUS3VTSW5dckpTkk+QCwPa4DSe1Sc0RPq62
	atuXuEpO4pyVwtx7IrhNDnVgtxFxY8LXLUTobMgoACb3/m7VFV/Ei8qyea8/+L6XY2IjrRdBVk5
	XgPyXmzWudNKh7Zcm3Fj6nQkHXDe6fzeZfh20IrX4PKM8vXR0yE50APFL6kIAT3jnd/I7sVNmAm
	35ggx7Q96qCY5LCbUcb1IbWl0ntpaSR4Njd8ux1aPuxxHwoHSrQOHoEuAMqsgx5L0IG4i3nvB8j
	PnkQ8NCj19GgfXq7CuRihoE59Z3zh8+BC2rB4F2pTG1V6Vi/bjcMoDnGgMNE9lmwM=
X-Received: by 2002:a05:6a20:b08d:b0:3da:6bdd:2308 with SMTP id adf61e73a8af0-3daed5d1814mr17126253637.18.1789216104145;
        Sat, 12 Sep 2026 05:28:24 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701d:4e35:aab7:8c01:68f1:4912])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65b1a63sm2512427a12.31.2026.09.12.05.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:28:23 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH 0/2] Enable USB support (peripheral mode) for Xiaomi Redmi
 5A (riva)
Date: Sat, 12 Sep 2026 12:27:32 +0000
Message-Id: <20260912-riva-usb-v1-0-0acd5cf8c62a@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDWpJhVcRSwYg7Eo6SCSpndXL
 L/kfy+AkGcSaLIAni4W3lxCkWeAS+9mUjwmg9Gm1HVhlOerV6cMirCmyVisKouQ8t3TxPd31Xa
 /5RxWwuPdQ4wP6sV+cGwAAAA=
X-Change-ID: 20260912-riva-usb-ec9ef25c885c
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

The purpose of this series is to enable the device to act as a USB peripheral.
It enables USB-related DT nodes (controller and PHY) and modifies the
charger driver (BQ256XX) to expose its VBUS state through extcon.

Driver change is required since the device has its VBUS connected to the
charger IC, which means cable connection/disconnection events must be fed
from the charger IC, to the controller driver to dynamically enable/disable
the USB gadget functionality.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
Reza Kurniawan (2):
      power: supply: bq256xx: Expose VBUS state through extcon
      arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB support (peripheral mode)

 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 17 ++++-
 drivers/power/supply/bq256xx_charger.c           | 88 +++++++++++++++++++++---
 2 files changed, 96 insertions(+), 9 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260912-riva-usb-ec9ef25c885c

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>

