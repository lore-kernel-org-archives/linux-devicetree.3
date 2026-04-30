Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D91B346AC3
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538932; cv=none; b=NCW9MdAsti4Mw50CRVdAWvD/qE6vDnUNqMaFuLL12RYJpNT6gLOpumX5a/JV/wjOS2c+u9Z37m2YaGcVv7AcXFSapu7iu7fR2z41ZpQRY5VOykFs3gI2ZwKql3xP+NU/nVVyn/Mw1esgsYzlAnoIa7tpk/56bY/s0yTe+FhwYjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538932; c=relaxed/simple;
	bh=TcQ/j+r69m1uXY5lOTlT2/Qq53VbMsQqKZsrar4PrKI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HIL8rnhdP2l8YWdfEK4TFwlilupT3H9w0Pd6wcP+xBcGKX4kqQ6EWizssyn4fmxgh/+f0KHCs4etDMVugGWYDdDLOmvRcg1UPZUXGln8OPzK4xrvp8pIg9YQWyx5tBG8MXJ6jgRpdmcJbaUPtFp1S8JwjmVk0HPk6uk9MqrBQ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2YuWSbg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2YuWSbg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48909558b3aso7298505e9.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777538930; x=1778143730; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wy7lYp0/gKnVW4uDlyRSZGPsO6+aLs3ICz86jFL5oTA=;
        b=i2YuWSbgn2valcUV3ukewED/eYGhjpSldG7BVDSxWsZ57ksij2IiJZYVGilYbnbmST
         KsblYAFaY8zb04iJrebWg/GxnRkaZwvAo3Rmt+ndsK0Q3BZRjARcekFMpR6jSLqilteV
         0tk89sYhllsz85hJ3ZzsWVwBozbrI7NpXG5L1EDd3BNmJJ5ubkxnN3lfS6IUv8d/j0yE
         J4mfHqkP9A9es1L82K9Bo//5ZwzSV+1sxoQ1aHz1/AhmJjS12tD4XNOtaa7IJqrMKOP7
         9pEvVi5ftjGzApNjVoa6F+NJdTtU2VYYnghv7t9rRHu1eLmKAag+NxHch26gJyZ5Njrh
         XPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538930; x=1778143730;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wy7lYp0/gKnVW4uDlyRSZGPsO6+aLs3ICz86jFL5oTA=;
        b=ZDChFThJMCLbqV1rh3z/kPsHbNNTD2cVg/CQ3QKywh9dueDzkIpC2EKlYPYYaJbXzE
         MDH40t0xA+s5w5DG9O8WCwxCMf8HnqCMINRhzHZER9fDb8iICrlO/BJNKkVNi7ZiaXL0
         0gmXlCTgOYVWjmqKXh10wqaDtZL2HnRm5ZYojUO16hAivqaDt98yKb1yucZ6GQ85sahS
         VKEy5nemZhewV/SA71Mh05LNE+zFp32hoMn3qS5pBJiIv0DOHJjfdWIs4A3sRERkL30M
         vQcJLV2XvMc6wz6LfiGqWOFSHebQyrM13iztMNbdZTC/Xmq2cM9ukvcDXvVHMnvE3Jvm
         Hw9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+YL1XFOHWComZ40c2m+6O4pwG11LV4O/dPKPcuh/jyevW/sCVdC7jXzVplCrLsbnHZvLmzGQzq2YWS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+fFPr253iU1h+QS5CdQtTvdoVHT+Qgi0qu3BCZrzeUFRpuWQ
	QTzdwnsXrDWQMdnsq9xgpgy1Z0u0+jKXWlYA0xi6oAyVvTyJudvjdWC7o+qoLP/JTMY=
X-Gm-Gg: AeBDiev++d/eWKoOMILcpdv/HfjB1V15JNxG6Gvm16txK9hXGCcv1Qu0TKxxyTA/QMK
	i5Z+m4MEVhYnf9POXKue0Yj8aqKz+/4y20LBJhn9wEVd6i3uLTfpCBvHNMglIthHTqcUxZOnXqQ
	3iA4XMM3fMAPWFUzY8K6QXMhB1G1J83ynxCL+zCaapHrx9RQ61+9Vlbg+e+jz33HJSubOaG/V9x
	352Qx/socfXj8XjukegFC9pD8gi9keIU1qK7JUHVeiQUQR91Gd1BvSf2hdXYgSB23LcvbnZVeZk
	4qD5gzCR9EfjFQFnh9+CwVDWOc2YSUNOl7U57PeEOYQ07AdYqESVywuXL8WpPQYrlqkipC2mZJb
	kDIRnPc6yp5/449PIepnwdV+SRDcDtJqlz2RqcE9n8OHLnujUF+lSkhzXxA9B6JKZvI8CXhQCvW
	SzYDG5t/yfRoDJaox0qJ9iU9lsanlmV/A/mR8d4thHvBjIlq4Mc0NzPFI=
X-Received: by 2002:a05:600c:1f82:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-48a84255f86mr33390405e9.3.1777538929566;
        Thu, 30 Apr 2026 01:48:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c1d0228sm137328025e9.2.2026.04.30.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:48:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] regulator: add support for SGM3804 Dual Output
 driver
Date: Thu, 30 Apr 2026 10:48:45 +0200
Message-Id: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-0-76108c65a560@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0X82kC/5WOQQ6DIBREr2JY9zdIFUhXvUfjAvCrtBUMUFNjv
 HvRnqDLl8y8mZVEDBYjuRYrCTjbaL3LwE4FMYNyPYJtMxNGGacVk5D8ZA3EUfKaglqUQw+TN09
 MEBnEfrxIWoEUvOq0Fgy1INk1Bezs59i5Nz+Ob/1Ak3b5nhhsTD4sx5G53HP/bs4lUChb2RrBc
 7Xmt5d1KvizDz1ptm37AvRqamTtAAAA
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TcQ/j+r69m1uXY5lOTlT2/Qq53VbMsQqKZsrar4PrKI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8xdvq1hJKz9mu99VkBiNHH4RsJwEOP8ro+u7bCLX
 m3zj08mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafMXbwAKCRB33NvayMhJ0d9TD/
 9wDG8UHs5G7LmjQ1J5YqveHlm6fRs8V27Kr/cnUxSC9mjA62yyeCdnsHR7vZ5djnWzoiHdg+yJEK78
 AEBlasxUWEq61BoElovAamu2LAV4MUgoQyr91fSRlfKk8myJ5F1crUkZFglW7N0s8FZaZ5M4NV+p9y
 aVIzN7aErdM6aJpEMsv0Vq2C9FdvKFPEIBT9cXBLsfaiXzk2omoiVNmbxyzrfarmVTIvpLRz+dfwSx
 zz2gkj+WRI03Fw7bq03sWTnT/Tdwvg9lRCOUpVfNMh1+wKGb/gDAXS2cZXJiqzS5NkNfed4wcFLGMv
 rqVDN2YW/WneHoVTh9DfxHz6NSy+mSXzqqPLE8gj4sdQ9zwiy6Gh+QsJIczKZJnk7g74erLo28yRPu
 +qRzSSKGembgETEG87Zw/PyD7BbP0WxGsy8cH/lVq/ZgMQVkgQdNPmIkIG2n8P3bp6+BfDhVmIKdBR
 8PqnNXXXPoCc5JLxtg4mJNWfeuz7gLw7kYOc8i5lpQU2f/EgVunFWDfSqCUC4uYJ+pCU0gyBAkebx1
 vrb0mD8x2qGu0qfU8BZrCDGmiYzEbBQyCAMfiBZyNMr4cuIi0214OL0vp+kt54PF5haoggRaeJKacU
 ALXPPXSLkk9kwh0bcVlH+UoceeZPOvb0rC8okelGJfML7GMePTwAjXiUJLLA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the SG Micro SGM3804 Single Inductor Dual Output
Buck/Boost Converter used to power LCD panels a provide positive
and negative power rails with configurable voltage and active
discharge function for each output.

The SGM3804 is powered by the enable GPIO pins inputs and only
supports I2C write messages. Thus we can't use the regmap
helpers directly and we need to cache the selector and
rail discharge state then setup the rails once the gpio
is enabled.
In order to add flexibility and simplify the driver, the
regmap cache is enabled and populated with default values.

This regulator is used to provide vsn and vsn power to the
Ayaneo Pocket S2 dual-DSI LCD panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Fixed bindings subject and gpios minItems
- Fixed regulator signed-off order
- Added second MODULE_AUTHOR entry
- Added more comments on how regmap cache is configured to work
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org

---
KancyJoe (1):
      regulator: add SGM3804 Dual Output driver

Neil Armstrong (1):
      regulator: dt-bindings: document the SGM3804 Dual Output regulator

 .../bindings/regulator/sgmicro,sgm3804.yaml        |  77 ++++++
 drivers/regulator/Kconfig                          |   6 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/sgm3804-regulator.c              | 290 +++++++++++++++++++++
 4 files changed, 374 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

