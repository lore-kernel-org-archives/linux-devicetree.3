Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C33D968D
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501750; cv=none; b=Ybg4yxEJAm1575WwP2egNjyFZK2pETQ36stMtH69zxFCQac7nAur3M0e7gRvu0QK1qrZRZUa0HJ0TOheNklSxPSxJxezIBc7yw2cW3DZtSCdZifRKs/6mlTCzTs5ngclLgMSlNkMzgocZop7JwaIlFDsnL9da/kXShSeL9mA/J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501750; c=relaxed/simple;
	bh=tzR6u468eiX3z652pYwVYHRR0tQSZHHfkd7L7z2RPVI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OhvEkl6oxokZ7pPm4jF4dSmHaixh5F4yvB8qrG/xQGN8dsuVltfFvLNr3N5EBLaaGaEDKRmhgQv3V8nZq4wUArbwT/Q/66uirPy/Y/CRGR1pLUxy/1/lou2nYawJBRZ6avUDfJK0MgnqDYYtB7zhGZzgZ+t6RT61yWXwORHdnxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sjfc/xO7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sjfc/xO7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b3637b90so18251735e9.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 08:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780501747; x=1781106547; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLHaVnXrOktQICnRN40yNAwYJy7xMA0u1k7xFhJSUUU=;
        b=Sjfc/xO7Hc/sT8u9aLCbr2wCovykt4o1e1omJuWazMBZGDtaQkDdkl9CGgSlVHAI4X
         qY81xuOUVljkYizu8j9RdN6yq0OncG84Lc1g4SXLb7jowRVpAFtvqh1tL6v5PSinBT8p
         O2hbSP1D8S0K+n1i6wrL/H0nSG393DVR4i3IX/JdFx+gL2hm6/4gbcuk5EQT4n2eqXXh
         6HT1iT3S2tK440b4JxmIAmIid+XRD7lAoEQSUDwPXe3yW3H//IVM42VjwFffrldZndyR
         7FFKBtXyctO30yyikRSoQ/DHLBlga1v30N64l/tlp90HjBRY6zStpbYrykdn+JL2c51C
         1NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501747; x=1781106547;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLHaVnXrOktQICnRN40yNAwYJy7xMA0u1k7xFhJSUUU=;
        b=DW5k3/rFK96JcP+8UnXw00M9XD4wS4LHSP9F+Wbe1T+O19UsqcF/Hw+6pBXumY/4bS
         /InTSSGVJZ5UL9Q8svoDeszc0I+YDiGTTzr606WZYedixvYdaIY5SLR0I8b6hNFDq7HC
         Gx0IVxrQKp5iRASTiLHPiKCE/+xilAzdAx0GnlV1pg/TdX6GH9UZejXzFqCAgyuOoZ5l
         Z/Bot+VBcUGLf7WH7VlTAsGLhg0YEmBawtU98ImQs+BFXcJIiYJjcaqj0xntkGLsrFQM
         vR7hBIbUaRRKONNKG3rBgBtwV/qg3ziDuYl7fRvJD42p16zXTHzKoPVijkQFY+IaRwRg
         fWCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/91/I0oTRcupbh7Z2YMXEyKxX2nmeJR2LvnL28CEgo3y8n7r0ApIu0G2Pvmm1EFnEw6kQWVtz9YTro@vger.kernel.org
X-Gm-Message-State: AOJu0YyfsKlKImheWl9KAp9go6ubhlzmGEqLObdllG6mB2+I8OXi4Nm3
	Cnwm531qd3udFtYAs6ApsrwcT/Fmpf69ifqxtNbDp9rAhN0x+/O6jKpC
X-Gm-Gg: Acq92OFgKD56C7VnrmJC5MNxyIWEIOoQ1KJtt14TMkwm7EhwpKL5RLcSxW4A0LvDEUQ
	I7Tub8sZIr0qf9peRxhM1RR1FhsNQS91l6AJAL1isLIJY3KtskSL9aYxdx3D0r91LgP+xuTLwdE
	BXHRjDNzd3dzI/BHZqjY8a3l8nXITigYj6pjcZxbLcyFh9tpTf+Hg15NuGsQ+3aTH8zsizH0ZTU
	SW0936IV796O7ntzPSNp51C54NZw0Gcu4wmu8BnhBIrYSqBETynLKuSpOckRqOSbTKr/5ldaaoP
	ivv56m2qTYIrEdRVg9IkniAs/cTiBb8tC9VCNX8SgHEgbjenLChmJxC6PLj7sFYrDjkm6vknvbn
	UzLY1NjPQG62Y3d9LxmE0HjLNSve/A0N2/tHAXrEQl5CfHNPfeSobeo/vD4qtaV1RQ7Bu2CwPC0
	pHpRERpqCQhdpJS1l9vjvPoTn85f4T4Of4p3X6BA==
X-Received: by 2002:a05:600c:c092:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-490b724521cmr43435605e9.33.1780501746668;
        Wed, 03 Jun 2026 08:49:06 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm8886008f8f.4.2026.06.03.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:49:06 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 0/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Date: Wed, 03 Jun 2026 18:48:20 +0300
Message-Id: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQ6CMBBFr0JmbQ3TQAFX3MOwKDDAKLSmBSIh3
 F3AuHD5kvffX8GTY/JwC1ZwNLNna3aQlwCqTpuWBNc7gwylCmOpxDI9rRGk256EitNGNilqjGr
 YFy9HDb/P2r34sp/KB1XjkTiMjv1o3XLezXh4v3LyV55RhCJLEbNaRTrBMm8Hzf21sgMU27Z9A
 GUSqRW4AAAA
X-Change-ID: 20260526-yukon-eagle-658f2f81a14d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Sony Xperia M2 is a smartphone released in 2014 based on the Qualcomm
Snapdragon 400 (MSM8926) platform.

Add initial device tree with for Sony Xperia M2 with support for:
- Framebuffer
- GPIO buttons (Volume Down and Camera)
- Regulators
- Internal storage
- SD card
- Accelerometer
- Magnetometer
- Ambient Light/Proximity sensor
- NFC
- pm8226_resin (Volume Up)
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v2:
- Dropped `regulator-always-on` for l3, l6 and l8.
- Mentioned added GPIO buttons and reset input in the commit message.
- Link to v1: https://patch.msgid.link/20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Add Sony Xperia M2
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 403 +++++++++++++++++++++
 3 files changed, 405 insertions(+)
---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260526-yukon-eagle-658f2f81a14d

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

