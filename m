Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984253B7749
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778052852; cv=none; b=WiMK/iXmKhfwEKiZA2E9CZU3+EmSH4wLgpVABZsoo3Da89Wc50vEdE+q14e8buxFks+eKLRYnxILfNg9GKUqbrZlKW7pDzgwmpP5YO9K7afBPyLQWKudf7I7GG8WWzLEQcG9obQ0/fWY700kD2cLMJ2NUU0v8i6xIiRbCWDySbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778052852; c=relaxed/simple;
	bh=6hTUYuUjpwM0BpoJCUuJMIoyvSlhYDr0dzWajGdcN88=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jO6uMgs1O5nNjWKQSU9uT8rQbeL2KZqRLT9KagwfQakcfTonM1tCfKwLCCygi8kYFzODDMyhI7MvklqG6CKXF5/YAB6NVZqAa4BDQtMcQv8O2EcQsZsQ9W29ZqZvIv0e0Oj9OFnq8ymzu4PG1I9UeIC4dKoQttUhWKFiYkOJu0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X03Adwcg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X03Adwcg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso53690595e9.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 00:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778052849; x=1778657649; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tlmEqzBpv8xyIqB/D2mYRP2+7T1ZelaDB4jjNnwdiA=;
        b=X03AdwcgbekZgid4zhPnjzumx1Ftj/fq9YN2e1arn4iOqIJNiyoZBh7BPMVnsXQrQy
         PD9nKNfFq8pILrUQOV4HjPkoLobBFXicVYhvqO30yTgetfrQtLPWWBYbn+FMC8ZktGtl
         bAwxC9fz5NcxFShgTx1XDYpdzO5kY9wCuvONNfKi7MH6s8dxH3ffDJZgzbuJzy1Nn/vR
         IpC70169sENqzVvw2DSteDX4y/lKy75wK/mrSBmum871Bcc83Ih/ARRDQ4lx71cfVXaU
         aw7p8DKSowdkcNeF9nWLiAlnMVsrBwvZHRgQKZhZRKXj2FxVs29NqB1mKK9LO48VwUYn
         0+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778052849; x=1778657649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tlmEqzBpv8xyIqB/D2mYRP2+7T1ZelaDB4jjNnwdiA=;
        b=LV+C18fsmhe1ft1nH9e8796TYAVaHC1UfC4ZcnVtHMWUPzJtLi1IKzF3en9jnr+h7b
         KgWbFkmn5lx73EKy1IeYwetGiveIL9hw8WrMs6+yZ42eUTqADiZccfD2KPNEKjv2tQ83
         mzZN5TGWzdPZire7f90Lm0D/6lDqg+BNucPkJFPA3M6exmFqfbVfgInHaodLOkJ9LvE8
         +myyUes/jl9xElPuqA1h/S2uleSn7IyhL4/aUa+mZxrYj/Txj3hRYlC0/hLRbOgWFQuX
         1xZNXh739wrkvcGdilYNrNccBLRAwoB5sJW6vC3mBLsCLgigg/RDiqUDmQVZ4jirptEI
         BEbA==
X-Forwarded-Encrypted: i=1; AFNElJ/uQAKk1p0IZhUD1tMTaGTVKtj1k2sHDscMr0i/Qkw/Mxc/Y2tQb+1g9+nURRXOsFYWZiPPGXt/i5Ln@vger.kernel.org
X-Gm-Message-State: AOJu0YxcVH1Z8Ha0sPXWG3QLmjaR/+B8x2auBFVVKRmJKgvD+BZn3ZtQ
	WYoObkEXv8uO+GQKkYBaS3dIptv+qzlLoro8paM5loUbx5kW/UwM8n6M7zlmW+zIFW4=
X-Gm-Gg: AeBDievLmn1p2WwcWf20D0Zocs4hoqvlOUrvwXvHGKkdBJ8QxlYFla3D7JapIu5vMTu
	QuxG1wbg+YoeVB/+bKAisYxO4acg6DfYk1TNbwDHsPzP9DEf0pSqcXD58UOCzmxbJHJvFy3jtnc
	PIdkOcu5FRphgHEX1BlLtyJx4Ra6TbSGtW5FLP+XlfiNaeKNFsJ9d13wu8xkDHNtASYueTIiVeP
	sJctozCoGiX7OZYN8dwkVyA/B5x6Ac4zmr4W1efxhapxazvTMuR2d5SYkj7JwFFsBJN5bdZopPL
	tqvJBynTmNp7MCDxz48T/iB323/PpTnF6PwRBareuskg4pSryjZkuL3DViO2lpKXzeOn0VTMN8j
	5KpcfMGRXmBSFt4GWIRVAH7slCowfVSNBz/c5o2SL2iqrg7r7WTBcmJZEnX8bhYQyQ2Dza3Dx0/
	6Ex/pZEMvbkmGepy2BN7srLjhpWsbFz+yxKg1nPCBpDCG8YwvJ2Pl/Jlo=
X-Received: by 2002:a05:600c:c11c:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48e51f4835dmr25792585e9.26.1778052848820;
        Wed, 06 May 2026 00:34:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e52f5e668sm13644835e9.0.2026.05.06.00.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:34:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/2] regulator: add support for SGM3804 Dual Output
 driver
Date: Wed, 06 May 2026 09:34:05 +0200
Message-Id: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3u+mkC/5XOTW7CMBAF4Ksgr5lq4n9Y9R5VF7YzBNMmjuw0K
 kK5ex26gKobWD7pzffmwgrlSIXtNxeWaY4lpqEGud2wcHRDRxDbmhlHrlFyC1MaY4DSW60Q3Nk
 NlGBM4YMmKBxK1wuLEqzR8uC94eQNq9aY6RC/rztv77+5fPkThWnF18Yxlinl8/WRuVl7z27OD
 SA0rW2D0fVU6dfPOLicXlLu2Do68ztW4KMsr6zRDdqglVMa/7Hixqp68CArKhuksUJKYXfo/7D
 LsvwAksUlZZsBAAA=
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2411;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6hTUYuUjpwM0BpoJCUuJMIoyvSlhYDr0dzWajGdcN88=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+u7uHwrFibIEVj6qZzb/5OKHgmvZmUO/1wYM/oLO
 MG4SdGuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafru7gAKCRB33NvayMhJ0dB1D/
 9iTr+QVgq3wC/Ke+CNAe+MGxGZEVVJ0SfkfEtCNnm7CScYgMlYrwiqB/7mRRBQofmcdVIEFBHM5/Oa
 Fo31FwH8cBjD7oDc8kZqeqSmUbGeApt0AP1o7Eeyk2clmoswimPmfgoGEABLW1iFYPu7tP1ycml5aG
 rdCr8vndoo3qx+ILKqNLkyPHGfM5aSs+SHtNDKP2A2XOHeviE9RaogUgxIcJmBZLaTudOTAH1YLWtW
 7Lu2C/2TzhBTgQy6fZSG4tIHH3QfxMi0trm9eE7XyVziotULQ4c+YdU2ytWdgN7BRqAYwWkXDKy4a6
 e383UWGxOVMq0Xj0WTT+o6dvTGOt3JPOUYJyKhUbcyut/XHFzkD4AP0N1M2q5zyamo+/awJ1Y6TNL+
 6+LibjSi5bQ6vRrTgHEScCB/acCvy+TMErSD1E2Lg/c244Ne0IkZunHnij+G4Zk6alDC9DVCODbB7o
 /gNZ2+gdT9k9aklnWDqpa14jbsEbPPMY3lQSQ944jW8ZIiPfQM20mxN2BXgOVW4gjnhy9SWrXYT0TK
 ZR6R9P1lTpScid1uchwKEpeFs0Vpom37O7hnNn17AcHDvk4SfCVzP0L3zBSMEDHtDtedjtp+qaILJ3
 +Jlspa+YAV/ISt3vjb+HIy/zInEcdRnJXwzww8lZfmvVVxm5KkucO+7xQH4A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the SG Micro SGM3804 Single Inductor Dual Output
Buck/Boost Converter used to power LCD panels a provide positive
and negative power rails with configurable voltage and active
discharge function for each output.

The SGM3804 is powered by the enable GPIO pins inputs and only
supports I2C write messages. 
In order to add flexibility and simplify the driver, the
regmap cache is enabled and populated with default values
since we can't write registers when the 2 GPIOs are down.

This regulator is used to provide vsn and vsn power to the
Ayaneo Pocket S2 dual-DSI LCD panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Moved the enable-gpios to subnodes due to enable-gpio bindings constraint
- Added code to get enable gpios from subnodes using fwnode to avoid the of->fwnode dance
- Switch last gpio call to cansleep
- Moved the Kconfig/Makefile entry in the right place
- Link to v3: https://patch.msgid.link/20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-0-c4783443890b@linaro.org

Changes in v3:
- Change header in c++ comment block
- Switch to regcache dirty/only instead of custom handling
- Use GPIO_ASIS to avoid turning off regulator on boot
- Use gpio cansleep
- Add my MODULE_AUTHOR and reorder the signoff
- Link to v2: https://patch.msgid.link/20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-0-76108c65a560@linaro.org

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
 drivers/regulator/Kconfig                          |   7 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/sgm3804-regulator.c              | 308 +++++++++++++++++++++
 4 files changed, 393 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

