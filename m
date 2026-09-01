Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE96E267B89
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266387; cv=none; b=B0oR5y5Aq1+xuAiZ3bFL1U3FPdqT9M+2X0dbwbO5PHdUEitKgkqnuVlOSFoVLd1IBXx9jzuEdkP6NEpYRiIVGMrNmAT66ke29Wck2b0oKOxw4aUIZZPYq5TkI/CwiwLq39GnoxzoENPhU+MTHpVRNM4hqnyInoMwt7sfsdwfrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266387; c=relaxed/simple;
	bh=Oom8w0dRGJ1TFhpbrk2DqZ3kmut1w3sk1zV/g82JgEI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=VGlO/Y96sKvdzST7uINMCY0MsDf6oeyuGcs9AquF1L5gPH098Jvj3eUT84NK3SCQjvkyPnqdHWv4teWJup8bIHhTIA9iXo1b6IJWKfm0ZVjSi6le7+Rb5fvfUAFQgMGWCjDFs7/+aKc+qKjYmjUmgWm/KiFLzcFQ2bp20wm3Ju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjwY12ah; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjwY12ah"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso2260982f8f.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266384; x=1788871184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yw3C8sMhiKvex40ZPlaCVKHi3bzP8PDS+ma+yPeTqLs=;
        b=WjwY12ahrcDjPordL7fxi93WDeTrwLH3GWnLyMma1x+x7rEfH1b1p7KLgmufPOaW0D
         Gi/NxeXz/TQsQvbLmuisbmagoypd6ptCMjyLsuL4uTYBDKKvWTBavb/A1hm2NSlVLZ6X
         73EK6LJ9aPha/HQ1hrUz0h63JVWGjCIsQF1SNVErTSQ4Fws8UoJLVLVSIvh72mqLQXFs
         52iSi329Bo2VCdeen7GOl3cRuCdlQa3qNDWDZPoCtI09qVX0MDfV05uPmRbcawljaMg6
         PDrDnHZ48lxDRTyEZquXegaBhBkAlUxpe0wFWZvR+L/syPgYhRuT1zJW5WfehPx0DvQy
         wSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266384; x=1788871184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yw3C8sMhiKvex40ZPlaCVKHi3bzP8PDS+ma+yPeTqLs=;
        b=QIy4gDc7LM1LJJ0HQatDM4+LzlExDW7rbmgev9xVS/NtvaOE6WZNbM9U8FLSb8zYmX
         AF/0DWLHQpjHNt//jSObajl7ldR79ZZLq/TlO8nbXHCqhBZmpDvVAAbt4Apzk6sBE0LD
         qSBAaMBALd/5fI8JbwLrysnJiF6Uf48qXV3tYpWGgVrNx4zX6unUV0qu5weLaeT9ho9t
         W2fqb9ivLef5QyGAcuoOrlI6O4CI/1Y/nmfUXBAd1xm4GmFTQngSSlPqvVE9HWgRn65P
         pVJDd5xHcLIRXj4RIOVNEZWtXy8WfB1CFOjwt5LvwNrxM8MjHkXFbhlQS7oPR2bYibKU
         t1dA==
X-Forwarded-Encrypted: i=1; AKwUvBzrzXpcoC9ZVjbrD3PXyWbKdir/ASA9fjW/ld+hH87IcnLldEnyHS4MBtjMjgEC4cA/2AitB4j8cGHS@vger.kernel.org
X-Gm-Message-State: AFuF++lDTOC82H6nJhmc01lQKr9PknSDLAbRxL/OpxgQ5YolhhYkRcFi
	SfXUuOslRsH4PIkafVWCDtCwZWejVwv1N6F1FrfkuLAsCqgdRUYAnkAz
X-Gm-Gg: AYBFou2kNjuZw/dIkmmJ9l34RajYkzZjUfMHvpshJ1T39WcVYk+xF31Ud5I9qhU+fUI
	j+zkTthOA5ImNo7ctYetX2I2XB1wf7As9YfVAD0+QWQOk9a4fYK/GIOo8VnzV2pu8a8oV9HhL8/
	aM5o12Md1yykiF63G9r7k09Dq25Qrjm6YYtQ4ObHIq/w5FqlrxnN0Ev8RsK3m9hOX/uIJKGMzxY
	WjnQNaXQ32RDvMluyXOYecCmBBV2BVFjPGesVsyVm9ln7NkkQ4ZJy67edS2xFfI9fmkiHNtQbju
	AO9EObC5864mexPSa3wMBfdTOfpWkYrA8G2zPs5HEKjIYwXeLCGeqzbBKGECTScr+FzVG3Iv6Za
	iqKT2S9Ih1kleq0vsghkIJBfcLIZhAiWty5JmEYCRW7XT1CKg+mkYxV4osulCaUn8Ha13V3oYdE
	QnRDAL215JVoY5uJwbuqt5vvpa7uJfjyv3pLrA7Yjpz7lPdDYSB2wZ6k2vNybp24vJdsF0Ow0+P
	B7mku0GAP4cGHDIx3Scwyl3awJyzD8SIn4HIPB8K4B4ahJ4ML9FMtI=
X-Received: by 2002:a05:6000:604:b0:484:3a11:c431 with SMTP id ffacd0b85a97d-4843a11c4f6mr27280442f8f.5.1788266383674;
        Tue, 01 Sep 2026 05:39:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm4644130f8f.15.2026.09.01.05.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:39:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] phy: Add support for Airoha AN7583 USB PHY
Date: Tue,  1 Sep 2026 14:39:30 +0200
Message-ID: <20260901123933.15388-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series add support for Airoha USB PHY and Gen2 PCIe
PHY.

Changes v4:
- Fix typo for Documentation patch
- Fix wrong regex for usb subnode for Documentation patch
- Improve register example for Documentation patch
- Address bugs reported by bot (off-by one and xlate function)

Changes v3:
- Fix broken patch for YAML patch
- Split the YAML for USB and PCIe
- Rework driver to direct node for PCIe PHY
  Link: https://lore.kernel.org/all/20260827131551.26725-1-ansuelsmth@gmail.com/

Changes v2:
- Add Documentation
- Out of RFC
- Rework to Serdes PHY instead of SCU (following
  for consistency AN7581 implementation)
  Link: https://lore.kernel.org/all/20260811124724.702467-1-ansuelsmth@gmail.com/

Christian Marangi (3):
  dt-bindings: phy: airoha: Document support for AN7583 USB PHY
  dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
  phy: airoha: Add support for Airoha AN7583 USB PHY

 .../phy/airoha,an7583-pcie-gen2-phy.yaml      |   63 +
 .../bindings/phy/airoha,an7583-usb-phy.yaml   |  133 ++
 drivers/phy/Kconfig                           |    1 +
 drivers/phy/Makefile                          |    3 +-
 drivers/phy/airoha/Kconfig                    |   11 +
 drivers/phy/airoha/Makefile                   |    3 +
 drivers/phy/airoha/phy-an7583-usb.c           | 2023 +++++++++++++++++
 7 files changed, 2236 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-usb.c

-- 
2.53.0

