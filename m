Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCAE3ACF06
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776713218; cv=none; b=n0niS3yXfh6tRCJ2/X/BRxT+vkBZcJjKM56g1R9R3yCA8OW2RoqLc3VEl8yaXOIL0jL0+0iwPtisMeqXeX/Lw3ehmQESBMxWspLoz+wNJcWG3w5/4yAXd3FtCkGbqr2O+g5rich77T+Sq5S1CIMkRPhUMqOon8/V6nf+pT4L0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776713218; c=relaxed/simple;
	bh=m+1L9WvbVI0f7eJLVLu5EcNLfHi94bMZgmhpN93ipnA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bBB1FzQYq0dK1W/Z9y/FgmLzIK1rLkSEDIcZ/8HOejzA3VR86cZU2yKbwZv0d1qOZvZQWo0jtCYbr/zXZM0XMagi4IGD6cpyUKvOYnyJPVL0sPWZtyfS9FMWdPPBWT2GmqDe0ZtlGtjcjmjDmQn2Vhl1NHgI7aPilLcrY926soQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TIuoh2UF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TIuoh2UF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so23946045e9.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776713215; x=1777318015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SMn7mAHyyiq49KgZjxkjkve6OprxewE2dL11FH9InyM=;
        b=TIuoh2UF/0BqfAZGEvsbqPYPpMVUeX4+CaeHUcAVYLpuqeSX7AY5JKqsTINTzQW+jf
         koxoR5+cYBw0IY3HB0IZJusrJBU6yeUgVirMNoeXkLrjkG8DDNyD5LY4Iuo2CivNXBBY
         9r2UvcbQQOHQ4uC1RhiGbLYF4cuzCfr+lSkcPKvBCi+Ezzxs5E1YdNCTaqs1qLupkhsZ
         VpZXBcabIsZoYj/ODFwfr0ddhLZoUWRB2wi7qEte5KliwPwYaGq4Dsw6ICqsDjSCLU8W
         A6oGcEyEGPJ3roFRkDWzr+kgP0yvrweiI4JDhzShSr9zeY4Nw2AYU+6bV8YeyfGGQxjU
         9/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776713215; x=1777318015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMn7mAHyyiq49KgZjxkjkve6OprxewE2dL11FH9InyM=;
        b=KyhIUt5d0ro279h7Tx55nMgPfL35t7kfb0QV9p+/1uaC4rIJ1YBxdnWw/aFykY4jgs
         wCROK1iXmMsNL7vMOgFq8QyfdAuyLGog9WlpzAJuOvLQfkcvgq5CV1aujjliVSr0VRsy
         pZLoXUlCPNn4HKCnwucheUtLEufZNNWjMFQ8DMBwbdb+5YR0Tvsgm4iuuI3z1rPEi9dg
         WkeTe/iOyLNUqof1SHfOe3/YczMhqDX5islfGfVL6n+RXjxzBCaBrDRvnTHaiq0T61Q1
         mSXcUUBZpRIEwCC6123WS4833OztIZUnBfl7HWvV18bRWiyKxWxkxMitGqyy5agr31YI
         KmmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JPSwZB56c9rOqapIZoovoB8gJTk9yosnWoIO+O7rit/Z8DdjjIOYeF1o7aX2qDdjqD0KuM9UHWKXh@vger.kernel.org
X-Gm-Message-State: AOJu0YyTFVuYux4ZX/SFqqA4lEn1ePWBRnTtqqEj4fUORdWBw4odrzAU
	dr3AeyFxv9ZuTU3y4HVL3gp/wEL9GPSrd08m4obBhn0tL7fcbeqFMGnCbGv3aq8LDG0=
X-Gm-Gg: AeBDievv2ydZzcTzLrFxILFDU4xNXg55ZHe+M6QsMwn4H2Ii6Dv73A8p9O2QvJvERmU
	6DABEQGoqq7CDGLlGp8YEZX6cTuYlP28rwsBBe1W3Xh6To8Xx4lREjY+1MceOVV9WkYJJtOktd1
	Umh0JdfY+1nKJ3P7l5BjnORhop68kXy2llpzSbssjtE53UT71+dGxJGhpM6yZCz+jkTpaYetL/M
	llFEy2lmalolMAVEqHmYV1Z2Lo+xyNmPv9H34nnzGbqeJOzc5j6rsogWlMN9dhoK6NmHotTrGbF
	Xk21735N2hQuDTc1Xz1I30PJVgtvvxlbaKTj8OZjP/UyzQM3tSBGqmGkqUdB/tNhuxZQSCNuWu1
	ZzXF6e6UbnPueSNx/TWfa6yO1PW7fNqDiUmv8P7dwBiAPCU4IVNW9fONRh/BlEklOgrGCzoqupc
	dtxocqGj800hhBfRmNNVWhmf2NPHmk8uskajaTPbVX89kQeSwYGXL1Bos=
X-Received: by 2002:a05:600c:a309:b0:488:a882:b7 with SMTP id 5b1f17b1804b1-488fb788b82mr134088445e9.29.1776713214831;
        Mon, 20 Apr 2026 12:26:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78d1bcsm133524515e9.5.2026.04.20.12.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 12:26:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] arm64: qcom: sm8650: misc enhancements
Date: Mon, 20 Apr 2026 21:26:50 +0200
Message-Id: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPp95mkC/42NSw6CMBBAr0Jm7Zi2ykdW3sOwgDqFSYQ2UyAaw
 t2tnMDle4v3NogkTBHqbAOhlSP7KYE5ZWCHduoJ+ZkYjDKF0qbC2Qe2GMeqyBUuIc5C7Yg2LBj
 Eh4iqzK/WkruQ0pAqQcjx+zg8msQDx9nL5xiu+mf/b68aFd5c1+XkqHSqvL94asWfvfTQ7Pv+B
 a8EKYvPAAAA
X-Change-ID: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=m+1L9WvbVI0f7eJLVLu5EcNLfHi94bMZgmhpN93ipnA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp5n38b5Vhf1lil+1n9JTb1UImZ0C/0VJZpBGUYs/T
 rjbPXOqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeZ9/AAKCRB33NvayMhJ0WF6D/
 9egk3oRCFHBJWE5vNagEYDvaN2lNX8e7ffdUk0HFep9G5ZGTFtEhXaJPCIwYTOvfA9/kt+iXORGUoK
 zezwwfz+2kgFCWcByw/31nutU8hknc5JSIfT5n0tg+xJMV8kWE0df/b5BIrLgL9SFxpHveVPZ92A3x
 nSbDg/SRdNQMP7aOTpgDXG+vCPlbWxG6DVKw/+Ys07Ozyz4Fw5u8mMCNsp8gpPJBvEEtYpaVrcchdG
 FslGqvlhZ+3OQYBmC2jlvQr8KJm0YwyCsJGvby9mM1z9U8aANlcWHjtVvucLEV4kbUbZjmbb8yRAHt
 jCOREflssCI0QAZ3JKGUde4+xUbYYjKUGzCcEhQa3uYXhQ5+orFkYi00N44oGJRhYg0sV8bokNLnl8
 bxEaqKSf3RgvJvt5XIaEuaWNSYjIiqIXhji3noDnNroMUirNEsSePMoPAUWKUwhHJi/oVA4cSS9QsM
 VwG3a66Ij2QrqA3ypDXRG/E5ILv8sfPCUQ2ArgzT2kEhpfIqQPbOollVtTUxd1hDDoDH2PtIfK0yg5
 t/TbRkb0vgFF6KCu9NnMZJklFm7NQu6il/glrFVJ5mEHi5yHh/w9VqbH2bU82GyDo3DRoDaTzeMke7
 hypcIOgr7AaHPDPGIumT88PYyO2jA7DkACZ2MXI1WLdPBHnR/c6CPh/YTtHg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Misc enhancements for the SM8650 platform:
- update the cpus capacity-dmips-mhz
- add the CPU cache sizes
- correct the soundwire ports

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add review tag
- Fix l2 cache size to 512KiB
- Link to v1: https://patch.msgid.link/20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
      arm64: dts: qcom: sm8650: add CPU cache size properties
      arm64: dts: qcom: sm8650: fix soundwire ports properties

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 110 ++++++++++++++++++++++++++---------
 1 file changed, 83 insertions(+), 27 deletions(-)
---
base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
change-id: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

