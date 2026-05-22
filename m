Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1040394464
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455359; cv=none; b=Goyzi2ohpgJfmrQ0gJLPMcjT4pPZ85EBv4mIH5vPAHnC1Qoo2d8413sld5yTYFyd7ruCx8TBiEGB2XzKmC/iieK4GH5Jt441ILHIXfIdClR52ACn0gmk8whg+UvRES3TiNS4KYh3EQHXQro1EEMQr/P6aTHvSrnlmnuQSo4NQC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455359; c=relaxed/simple;
	bh=LtTpgGcpgPzqlzqQe4SsOV1m4Lxz45qMFFeKP4Prwnc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kRTNdS42ongzl9AmMaTU7duOtZRB3XUXxIZCANH4sSydYsqasN8prmQVRPJCq300L1Hzc9Rv94i+Tyb03Ypcifr4oOhaafiibd7q1w9BNnHgRV5VkFOpEVpOWzhNr91TWiMi8Je+ivnCHyXXyqEtg8QKR75FEOlekJL9RTk42LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JrGkqI61; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JrGkqI61"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso46562355e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779455355; x=1780060155; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCjNO80m5P6W/2r92SstgFa0tnAthws9clevMsWOPw8=;
        b=JrGkqI61GADWTk/Di5gryGczgLSQd++TMpm9Sbvfe8rPFr4WbJdpi+tR80SHhDMmYu
         M0bzw2v0m4ymMldJnQmNJyL6NDxmLE4X4Hh5DH7ay07NvapkGAbfXd6+xeZaJT+VIUi8
         Ae7hU4NHj4lP1qIjQKp4cyN3AkxssocXTx3MQ4bzmoHRGJ5SL9sVMFM0dTMvG0L1JaW+
         fTCmYkcxljlXugmI2xjw9FYGEVVmboWTfg1fdlr+yHaqh0SCjTI5GNz1w+FGAQv0efaI
         AAb8R7WhLOLMNOCyc0xrjEmJwfJyy4tvuor69aCoULWKG/kzCY5hFv8RcwTKE9+Sx9cN
         P9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455355; x=1780060155;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCjNO80m5P6W/2r92SstgFa0tnAthws9clevMsWOPw8=;
        b=nOB9WDJ9YeR0odLTC6iXtTxFntfmW5U7NQZZU/m7SdoAOHR2Ja5kYz6AkpJNOPYifO
         ALdl3xJSkJaYYMy0HFHh1tbTN8Of/rnd1NDCv0bsHgYFcWN4LI1wepOMeod6sytwbdPD
         vSW19F7GTFrmSaUkGt+h9rYjZrpQG/7HADVHhmj7gof0i8nGrBOapWU0CM6xcVYuVJYF
         MGDwK2knv3IqU8i7UihFQhT0xnCq5UoA8gULj8dyrRfYkLvzdYlvMCuq1r8WnxNYP9aD
         3sunaamz9f7yB16UZ1eGjqg6WTmVMcXL5rg2KLN3xmh5Ap2h9fORgzGv67dHg1TrMgFv
         OeQA==
X-Forwarded-Encrypted: i=1; AFNElJ8vAsY6wHSCL9Rm5sf2VUsA7cj3GMxSWm9AoCsn9azMhhf2GbjLNmXfu1AaQw47p4aLuiPzlznqhQF6@vger.kernel.org
X-Gm-Message-State: AOJu0YzHUdu/2nPt1XyOt7OVBcWXErH/0BEn3nAnyNUKE5LLkkiKWRti
	Y6uOy6aTHgQY6tkz33djuwlEV+hLD5vj9ucXPXRmrjXBTYRLW6shkXEX8vb3F6Cmgx8=
X-Gm-Gg: Acq92OEA8hh8EfDo7SBGnNe0/smUYHVhRao3Y/7Yr22CKxbAGL8GCariMVUC9eLhxkW
	SnkvFFagplknJ1u0nCKpIoWHZC64TD9/9a39TS48rW+Pk1iVLx+EMRdGRukfmcoE5zTUiMSEQHi
	NGFZKtyeG6d1kccCBuR6MVz/I1MH1URYfwxDjjfShamEeWlYDz61ELycwS3jc2kNuqwt3/uK2Hq
	8yWAas+2cIQkWAsZVekRjiedlAv8mTEHeeLD4iDoE9WWfHzlnqT5hilre6DELvWRJ2x+a6ISZ7y
	KTc43ZSUah9m5fWZKXsXT1XAcjT7nGIpO1FCprNheRaFa5c1xuJ/287TotEuSztz3HFzdsWtfMv
	pfIc52sSRBPOczRxy5wv5N/YYhnhmfxZZaYZ5P9Xv4XjbFM7wE8hW4lhN9fn9flITToP8lQUHhJ
	R+Up76YD5yWZYpouZGOaXbS/kQLBWLuRwwmH78nhxGbzqHn6BSjr+DF6I=
X-Received: by 2002:a05:600c:4fc4:b0:490:41b4:a1 with SMTP id 5b1f17b1804b1-490426aa4b0mr44171055e9.11.1779455354871;
        Fri, 22 May 2026 06:09:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm45413615e9.9.2026.05.22.06.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:09:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/2] regulator: add support for SGM3804 Dual Output
 driver
Date: Fri, 22 May 2026 15:09:11 +0200
Message-Id: <20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-0-bd6b1c300ecc@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdVEGoC/5XOTU7DMBAF4KtUXjPI8c/YYcU9UBeOM00NNI7sE
 LWqcnfssqCom7B80pvvzZVlSoEye9ldWaIl5BDHEvTTjvmjGweC0JfMBBfIlbAwxyl4yCeLmoO
 7uJEiTNF/0AxZQB5O0nIF1qA6dJ0R1BlWrCnRIZxvO2/7n5y/unfyc8Vr4xjyHNPl9sjS1N5/N
 5cGODS97b3Bcqrx9TOMLsXnmAZWRxdxx0q+lRWFNdhw61E7jfyBlb+sLgcbWVlYr4yVSknb8u6
 BVfcsbmVV/Va1mkzLNbbyD7uu6zcJgKvj8gEAAA==
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2656;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LtTpgGcpgPzqlzqQe4SsOV1m4Lxz45qMFFeKP4Prwnc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqEFV4Dc1eLiMssjlM1bfIJzOo2pRV3MvUFzWXcII4
 PoDUTZiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahBVeAAKCRB33NvayMhJ0bxbEA
 CIeZ1wXQt6z4SCDkAo2+gCK/M2V5c5E7mpKsQYo2siiWY6Tq+6+LGb2DM4mV4drsoH1KIFJJEH3Rhj
 n1PbNINlSmQe8d2GUlpzG5PIpvHjlJ02Ij7BF9A+nmb8AB9pJhthKrUnmOcRa8cBW0A0sBwshTOydI
 2VTiifprVvfOHDPOHMVF2nlOzNmr2Ev46cLuqneW2XaMGqBw5s+pi8Q99H7TwEhawPXkeJJjhQdWjO
 IrUEyU4IAisbzSV1LVLM7j2d9MR/hz4XrHnkhML2od5vWH2MURO/PcjdikVmIqH7TBkURtKSyuaYI7
 JUc4O3rp0FP4eJCM6ws/OcFs3S6ETBfgCgaiIm665dlzVFoWpBms7kfVbVUG9f7y2ZwoHmPrr5EOye
 zhs2LPqFTeW2w5Ro/DcZBbqsWw8o6Z8zj3DQvlDqkQqoEnLQWSbmA9fzdRws9eVaNW/Iocg4FmK5h0
 Ql38DEF+7LpgykItMTbyx8qlj8Y+WxMjeZR1qrdnn3BvBwqhtxxYZwYGqGaolazu/Fjm2aubcVulCU
 8EeGNQSBSAE91HbeclVQdtv74lb5olo1s5HbyjtPbYuCoU859gP8W5RHsRAk0Jdf2h+kYbRVIVftW/
 iXsPnS7bhp5+85cl7u2wqij6AuzyB+zJwqceWZG5su/Oy684Jl9riKNsDZKQ==
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
Changes in v5:
- Add dependencies on GPIOLIB
- Mark as cache only if sync fails
- Use proper selector number for n_voltages
- Link to v4: https://patch.msgid.link/20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org

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

 .../bindings/regulator/sgmicro,sgm3804.yaml        |  77 +++++
 drivers/regulator/Kconfig                          |   8 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/sgm3804-regulator.c              | 314 +++++++++++++++++++++
 4 files changed, 400 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

