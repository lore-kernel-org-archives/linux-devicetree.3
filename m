Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297F35B650
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604377; cv=none; b=obgJZ39xLL6pwsmZ50Lx+IegQ1e6Mr0aIWbkFsLGWDDT3x33t7mHNDFLlvlFiouMSpdYnYxG0UmXXX7LnQbqqhGs/HNhOeW82hHCEdgTE2MO8Lp2gfCnGa3TtGII8cUCtT0MV3XodDPR+cru+FzsK6+W965N8r4zu26livy4alA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604377; c=relaxed/simple;
	bh=45KdNmv+Drab9Z/X5tJfZfZLATdmtXAQ0rISrsmLpag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gynkaEM6DJaEP2Ms2AEkcYxWm9lxZ41NYU47kbMHJiNyR3xoS+ymxYEODNFXcMtVs/PcxZcCFZNcpAQTafBrwcR0s3zwBD3B3Empt5h0gIKK8lFXRAGNUBFAH/hYzhocfB5bxnh8HZEs1j6cXGtbc+EsJ34O3kudaBJpu3b5vAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+YCQcHH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+YCQcHH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so12814635e9.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780604373; x=1781209173; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrQNCOwYef0/rUPI4L9x7Ym+o1MWvmOU9IU4X/FxWJo=;
        b=k+YCQcHHFm1T+/x4siejTgf2GshzdI/qc0/40ZzSYQt+sG0EjwTrnR1qGecYyMzHsw
         V4gZ2cEpw2afU31q/7HJoKX+WkUgnovhJBqfvQrY87OObPwKmLvrqNzHQADiYsluQz5G
         n8BKexrMhuhjZkeWiFK4vjZloaqRDzyj6rK3HUWECc4Ky1+LyCnjX60rpK7wjTJR8iuC
         7LXWSsOFv57VhX9KVoJ1GG51vHoOwyquYHbyPllD7TN/taAsQ3aFUrjeO1OEYdrLkSto
         9fQJ5SMHvgCo9sVNd6wnCg68Edj3sTe8oG5DPhfn7BjH8fwRC2Mhl5ZQlxs9jd50P9vc
         KrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604373; x=1781209173;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrQNCOwYef0/rUPI4L9x7Ym+o1MWvmOU9IU4X/FxWJo=;
        b=SQXaNBeugRduYu9vQ+R0o9Si3PKySmsCMBZN1bF4sETTdFN/dvPtPh+3vC/hb+bBS5
         orwK6UOIV7hVYj0FamEjdu2kayrTThmqhj10u9/9JDkvRJVY/a0U+CVvl7CXcx8YELtp
         Us2W7nUxrf9nQ7EcJJlSFpajy8PtcYUPS/YKyTCHJlg2+wA7bFBIU/u86m+kG6IH2Lvd
         rTCyDwrarUcWUX4689Ly8FoFLGjWFta6xOVdG4rFE6jSsVmuSkXJMlqrLQ6wbT8QTUMR
         36yxV4wWFPunp8r+bPcNvWPXuYgB1+CBuAL5SnJkZPn6nl+8lY9X6FS0shjMKKyYFZT6
         mUxA==
X-Forwarded-Encrypted: i=1; AFNElJ/vdVc6EWvZF6ekYkhEhl2lc3Hntwi/5j0PW6tG9wLema4h2AylUnTDJ99Hylp5A9I6tHE8LxE40I/f@vger.kernel.org
X-Gm-Message-State: AOJu0YxDhi5ssQjZR4QJqotl7PaSpMXtYGuuW9YlV77eflum1nJmXWHa
	bCPZTzcNbFoiuIg1bNHiCBwBySyNZLIQ/+/pEcA5F7Sq7/UlxvwA+1Kd
X-Gm-Gg: Acq92OFGsgxZC4AWi0meKKgh6WLl9pwU2n8QgUEAE2hrwyPnQFLht2VNe3M1Up/ZiIs
	Oqh7hajl2sbv5DFauEVwqNI890UBgwjYJJ8UXje5ZkdrCMlKGlqgnyBxYRvQlk1jNGwD04F9g7N
	I8Xx12+qoG4bKwXXUALFdYWudZiObDS66WSq7IDWD0OlEnxNQgBI7QiWz4WQO43rWViiwanNeQj
	vyRfVEoE3JPwJ+/W53DAc7uf+xM4HaZn0PIqQqx7Z+iAut7K9MvHgKNapxaTHFJsexPyOr2NbSG
	PMF6Q/GA3nZ2CPnC5ZihVfzPwvpQCj3TNj6K+j6UZeTusRqaAYDaOwq5OX2Sc6+gS6EaWENFaCq
	Kvu+U3rlYQJ5A11TTsw74h9oAw4D2B+D5JWoE+mt8ALXRW7W2sKt/oAXIwuX3GJWOfZ2+IZZbTV
	uT1UWkTH2rmwwEIjE0hRNypRm9HbAmYbvpf+bzgA==
X-Received: by 2002:a05:600c:3153:b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-490c2604790mr1881625e9.22.1780604372996;
        Thu, 04 Jun 2026 13:19:32 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm18999748f8f.18.2026.06.04.13.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:19:32 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v3 0/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Date: Thu, 04 Jun 2026 23:19:26 +0300
Message-Id: <20260604-yukon-eagle-v3-0-9e3b57d306a8@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WN0Q6CIABFf8XxHA0QEHvqP1oPqKCUSgNlOee/B
 7ZWPZ7tnnNX4JUzyoNTtgKngvHGjhHyQwbqTo6tgqaJDAgiHDHC4TLf7QiVbHsFOROaaIElpg2
 IxsMpbZ577XJ9s5+rm6qnlEiLzvjJumW/CzjtPuXirxwwRLAUGJcNp7LA1bkdpOmPtR1AKgfyd
 TnK/10SXS14RSliItfs19227QVMkaBT9AAAAA==
X-Change-ID: 20260526-yukon-eagle-658f2f81a14d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Sony Xperia M2 is a smartphone released in 2014 based on the Qualcomm
Snapdragon 400 (MSM8926) platform.

Add initial device tree for Sony Xperia M2 with support for:
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
- Vibrator
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v3:
- Changed incorrect "chassis" to "chassis-type" in the device tree.
- Mentioned added vibrator in the commit message.
- Link to v2: https://patch.msgid.link/20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com

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

