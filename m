Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A22C3AD539
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485157; cv=none; b=i7j/qIdRm6JG5mdPkHSMK0/wN4Cnn0Usvi/1ib4qAAMxJYs3DxdgULzWV2EIdAiQfoK4tvxC5OZb8rzsvS9VVXNdYr+DeNOpeyhW0t0GMxtmNKfbddLQxdk3dj+KeeUQD+L5oxw60s69wymA4zf/KWRsZ8ibbjZaecWI3PIHc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485157; c=relaxed/simple;
	bh=WAcHU/qRwRLrH5rKuY3LudFtEXUDRG+BuozA8+vOgtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GOGR3cR/Ger7n1sorrlQeLOMMBx0TkmP5WKk2gcc1gSV23gtTWksA8cJ8x0kDW9OqZYYUTmPmRiBYhOIXFmHj6R3Tg1GxgF9GcHgkD5q/RbCtTym/biqc5IkdULNyZYjPlvlyWBo6/fwbXw2Fl8bUb1shU1Mh/MI/NPzFfRNxyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6JWUuRS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6JWUuRS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f703a9d05so405962f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785485155; x=1786089955; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0r+tq7k63WA6Od6PhYxu6O2aCZ4qlcR6MZ68uJcSLS8=;
        b=U6JWUuRS/MkbORlXaitjJHU2Zn+1lua4j61RsUXuzjwPNth4FBwtr31hxF7niRXnye
         u282K3bRKaqF5f4TK4M2GeeBe1PA9VzxI8WAcADrdUxVo9F77MVGtfeZBHJpT0TtImYs
         Ev62WVKzHgdx8mzq8i80Gbna5cS2Qd0Iqv1HVwVB18+eW4wnGzKhX2zZuY3qAWtJA9uE
         aqT+9sAM07GN+ISq0rYjDqMDjeN+xFOTKaEoXmwkKyvGiKgIJrZ7An+crpKtwRuipZ5O
         PCuAzT11j4q1q6HC9h7mRRho7JQd8Us/4msAqbNxJQ7mcylcma0Sybz73DHfTmeYeqmN
         DtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485155; x=1786089955;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0r+tq7k63WA6Od6PhYxu6O2aCZ4qlcR6MZ68uJcSLS8=;
        b=RTOc6UfuQFkhSVOEi5aEwx2hLeiTmZmnR/jDo4LNJVbVHY9jwDDfsQIpYMEKSAndDK
         bjCCAxMnXiUWzbPmSqO9bxM3/t9fDDyf8qRfINVw+Z03RBywMFyJUn4RxIp3+93NErKO
         CvkWXcOug+s6QL4doudpJzOaU7fVk//qh1WpUvmHoFHfmPxyFdXIJxf2CarEeif+P+EW
         79Cqfxge+PltpR7az6cSCZUtcQTLcIhScWENA8ZW8l8NUEO1TljETs0lJJ2BkUjJLy+7
         60CEV+ZgJyfLwU1uOskzlVqkg3YokczaPlXflNQttL1mp92H5J9nGMXg7sgMN90FmcNL
         Ig4A==
X-Forwarded-Encrypted: i=1; AHgh+Rrlgl3fAp4ESQU/ZmgwGCGQzxyIfL93F5hZE/pjjiwbV+c+oeoaiYiu3Ur3C9ax+zAQlOTzEF3VxJyd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzktv4y6K1K+pbF57ZunMkb4pr4wLYxfI4qp7PIk6wa4QEOa8U9
	z0dwtuQ6jkibrGYRa8GG1e7l5ZiTC44MEOP9pohK+gRpQ3ZL56a8g5YCCYE2BfVabTPfbGF98Fz
	JiF0L
X-Gm-Gg: AR+sD10c0Q9LJR66x4AolLURCQqscn04kpQnJyG3H8f1gHSBLw354X+Rvc/7XWgrCo9
	RmqJ5kEvGK7evMXtjo5RTlJgkpCYPvWU3J92PyS1fbyfwDJ5GuhUI7O9B+EWr0L0R2E/PVr9iea
	/4HkrF175m098zB22VQg7QUuATxIvCJDjRqx18jw75fEdPRuydE7abAPDZkL47hJMeRSUAuQxVw
	fISWE5ZAaUWWowyyif0urf7yrHwla588a9LF9uKrBePW3uPqjJrTKM62mDjn2afXCauwqbwqUda
	r7ZgOyzsB3pbOOGyfuDjPXmRiODsw1d5MgOCO/zPDRfUqGeWQ28Ntku32S8zLTtj2+Z+QkJsawN
	5PyiAxQG1ObT6/2FYLUUB0DmO5ik/IJBDoxncVi4tHJE02k7+nr5lJa1Ew1t5uhX3S9HwTattAW
	qw7PrmSO4fG2HDc3DSuikhBQ/y10r84nmHYgrlONMnwfcjvzZ7OAiiWTsAHvpL7Lndi8yw56Ad+
	tJp2Jiuyg==
X-Received: by 2002:a05:6000:41c9:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-47fd2abad19mr2575196f8f.3.1785485154641;
        Fri, 31 Jul 2026 01:05:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm1689589f8f.37.2026.07.31.01.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:05:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] ASoC: qcom: allow SM[456]50 HDK board to play audio
 via I2S
Date: Fri, 31 Jul 2026 10:05:49 +0200
Message-Id: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1XbGoC/42NTQ6CMBBGr2Jm7ZhSBMGV9zAsahlg/GlJpxIM4
 e4CXsDlS973vgmEApPAeTdBoIGFvVtA73dgO+NaQq4XBq10rk66wOh7tiivYswUOhojdvUDWQv
 mdZ5anZElY2HZ94EaHrf2tfqxvG93snENrkbHEn34bOdDsnr//AwJKtRpmRrV0NGY8vJkZ4I/+
 NBCNc/zF6Kw1BPVAAAA
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=WAcHU/qRwRLrH5rKuY3LudFtEXUDRG+BuozA8+vOgtU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqbFdgUSKw36xqavluNnP+OrP74eGkOf0waCuxEGHb
 y77+TMeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamxXYAAKCRB33NvayMhJ0Q3qD/
 9Dw+3izY98yf7jVeit0cnXXn5KhNfcOk3+bbpAtgzln/kfHxVU5hLIikD8bqHrKhnnEdn1VBkiNi3c
 LH2eFDhnSi85yJn5ZfsWuELYG47Bk8gkjTbHxfmu0weGi8U/rmwf47IrYdvFdlTGKEgRE6I8KdjZMb
 lWV3+OXP0puMPu16Qgrzhj9IUuT76vVHa7CZaJkz/8k5AM4WKX/NyochgCTbmJd7JX2O6m8d+eZeLp
 2pKnfHHGsdCsGKm3BjRXOJMupRl8xqbC68ecER7IBM5F9QaYQbLYP55qGbaXOhyqTLQE0CJPQyBLFv
 pWYDRnoy4DmfDaC6EUPIOOBWPZf8keBUlDQuPIyMKGBrUcgCqNIY8Cwbbicq5jrThDZeEuK2vVXTbW
 X6mqWPRQ6OLzyCEj+BleFPoE90e8ld94/17A3AHDbLs0oBHysR6B8sljbwp+0pXEqMltyj7KOHaOrN
 cakLQ7b6MLVQVDJmd1FwtznHWusRI0QLEOPA279SRqhMBrD6YPT9unhJGpqNDZ7M4ElhffnycnlKtH
 2mbaSnLpeFIjkNIwilB7LL4YJxpL577bcbO2BuUDg8TRzFM+/uewOdZvNwBN8blir/IYI2/gbb6bwZ
 GAxA6vpz4YH5xf51uQEN6UYlm3fFkpYePWVBRF8tLCbZs6AqooK6/w7gUshw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

All dependencies are merges into sound.git for-7.3

[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Dropped applied patch 1
- Fixed node unit number
- Reversed clock names order to respect bindings
- Link to v1: https://patch.msgid.link/20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 73 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 ++++++++++++++++++
 6 files changed, 257 insertions(+), 3 deletions(-)
---
base-commit: c50ed4627e333934aaf0473a822169786c83dce5
change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

