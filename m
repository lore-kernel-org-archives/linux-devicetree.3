Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C8363C73
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912490; cv=none; b=gOlg0mH4FmQgIdV4wfy3WzkyPcmAto0wiJq2Y3ARxpQjFuU2TB5buHaumzJUzOKfWe2116+p9TDTR03ggTGMuz2ug1VqW7EgBTidTC7Xv3lQYcT8PHOoNIlt8UCKs0TVjmzh5OjOwCfBdZvxPEebT2LmUTcuXGphYoWhRThr6R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912490; c=relaxed/simple;
	bh=kTpBUkX0rt0xbSv0yoLPWHk+BTyd3gSxlTejaHQkxZA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V2mFj6afTGlGestvOEbwYeSAkLeop2tcCYH8QHzYH+iPb5ftk6r2H+78X4zMYlOjPXkXe8QKO9JbwLMS2kdr3dRrX9gTllfZRZbxXna2aToP29+pupfqCgiR0rY/YK3MW1+/kN81eAYpGlH6vCACK5msUJ2rE50NbRE/gOSVXN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHU9eUVE; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHU9eUVE"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7b4ee3a88e1so116626907b3.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779912488; x=1780517288; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7uoGG35zfSYVF4g6jttWnLIJujz61rH2XH/8UbJJQI=;
        b=VHU9eUVEdIg2NokaADiwijJJykp+GQcvIF4/NLF9mvPHPBTTvfGo3Yq8rO1ZeB/SOO
         YrBAIpB68z3Hp7ocdNBb02YA6QocUSSK8LDPvIXoX4LIzpwQX1ToWlpy+dJEIqwvtTAe
         GIzYNoq6oHAoKrE9N5OnlRD7lsAtopbIqiPRDGzusX4/APNYDu5I72ASVVlPEH6piDSl
         7o6eM5dsz+W3+1miFSjWmjn6Nthzc/YTStH6T1vNwOViSGx9xhugro2wR0GSavkF9B7w
         seNVuhj5x58Mq29cFS8UkLk7sJU6i3eBPGf++8tsJ/cy34yPs3GeYaOKSfEYag9orfAd
         9tUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912488; x=1780517288;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7uoGG35zfSYVF4g6jttWnLIJujz61rH2XH/8UbJJQI=;
        b=ktw9dZcCNoqws5fwL6svMpQn3QyHyA+mHIf0Y0WAXE994Zii1rIWbl8UINRX+wFjO4
         IYGBMRjxnYDz/aBrlRPV0WR5OyIYAw3WkXXhleyT4Xxz0Rlo+VhswsusGll1JTMHDY0D
         76RTXiwhbM41GAmBI1NEDmsxlkhfjyTAbHCDpJUPX+5xingkPCH7bzvk+6Q1sEqOqb+h
         4/gvfG54oRd9Ca3nO0GTabxuy839Jo23Y9tPq5pmhJEY7cn2XmYVSrjQ/ABuGfADXwtJ
         VMkq6J2mHnogaFEOl5yi1XFhZq4AXv910dCqtkChjBKy2onDXuZzKGTNrWCqwbpXBPHQ
         E0uA==
X-Forwarded-Encrypted: i=1; AFNElJ/TaKrsSnuVS+ZOMmXKJ8OrzW/MVKeN3ka+U2+j/dHoXt2Jcfs5Fh6so+12n4vCO4oaTX7QzJdj7tS8@vger.kernel.org
X-Gm-Message-State: AOJu0YwGuDCxYOyqWZfqEH8mWY5mGw5E1wWtp5cs24xjCaamWvgjVbo2
	tfbzC4x5DftyoPQQSM+vuGhRFIhvI1IdxmgWFPmbFw6oKbA7Ah+QCtSj
X-Gm-Gg: Acq92OHITJO9mwEKUNzAim8H/ba/yRSJvtmx2VSxy7Lg4nbm5G2ffpcj8uxef+5kUs/
	gscbzDGt4vrNsJOPyTXvBrgzcN0kgo790ac1bKnk+zcnAn1MARrqNSaa2LZg2o1PCO25c/YFVHj
	whj0n6euMXOb+7CL2JuIUJP00P3/pAlpNvACI7+pagwdmegP9bxOUNk3hC4d+T+R6BT7+tCgids
	ogfAbwPH54wDbuKw6LFxZ3UT4XPIwmzlP2Zma3IbeLCOsDqugCL9WDpTxe2M8JzHj9M8XeQMMWP
	ASPHBPaa289gXB3cREaOsU/MkHjcyW0oUgyFk2UlCHvckJDvR1G7dJTDEcScHJ6mUD4iSwYDfAd
	xObEiftYqRYhTSGhjzfvHfDkOsZGqFq31Jz7zgVOGTi2FmJrnvxQDv0AcgD9jXYDpfVcoi0p5iy
	Z8kewIIdbuysq86piVJ9ePG+2tmbMYNWewIJ+l
X-Received: by 2002:a05:690c:48c7:b0:7d0:1583:4cd2 with SMTP id 00721157ae682-7d3339e48acmr245510687b3.9.1779912488525;
        Wed, 27 May 2026 13:08:08 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be36898sm79065497b3.27.2026.05.27.13.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:08:08 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add
 initial device tree
Date: Wed, 27 May 2026 23:08:00 +0300
Message-Id: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDXRhkZcRSyKaQ1S0iJEenfF8
 i3+v8GjI/RQJTc4PMjTYiN4mkA3KGuQUR8NIhMyK4Rk1z4tlqEyMzJZlFrokiue9xCL1aGm87v
 VzW+/tyN227uAEB7MUA1dbwAAAA==
X-Change-ID: 20260526-yukon-eagle-658f2f81a14d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Sony Xperia M2 is a smartphone released in 2014 based on the Qualcomm
Snapdragon 400 (MSM8926) platform.

Add initial device tree with for Sony Xperia M2 with support for:
- Framebuffer
- Regulators
- Internal storage
- SD card
- Accelerometer
- Magnetometer
- Ambient Light/Proximity sensor
- NFC
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Add Sony Xperia M2
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 406 +++++++++++++++++++++
 3 files changed, 408 insertions(+)
---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260526-yukon-eagle-658f2f81a14d

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

