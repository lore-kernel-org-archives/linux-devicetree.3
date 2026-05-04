Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10873E3150
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912201; cv=none; b=TskCzzNZArYChWMiwnxdTJjPoG2gFFXBHIGWW8Dcvvv1EXlHyhIWt83jTwuayV3hexvBVCnXqcuyV/H4+HZbdVy6+9zalT5IEt/wqhnZe+cVAKzl+DbugldvI9G5BK2UjNK4zVuHSOF7dNqendNpg7Iof3lNKl/ABwEXZm3Tt0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912201; c=relaxed/simple;
	bh=N/w1uFHYZt1PLkaWQZseHCertmTa8aPXuLRhAgnU2M4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pL7Nweod3TE9h8Z/mmwTKPTmb2yztaHv5FqCHELy0qrcLGDmm+esCQoSeRq5f0fJYfvGpU8vt742tlybMpMNWB7C+KE8rVf0dpfkXFlWAy8ygCqxSlwKWqNCD7hlVcua7o+vLrl+ZwzNIy6BxZRoXsRa469l3mIQJiP2uAQ1k1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tVx5DkmF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVx5DkmF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891f625344so45611455e9.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777912196; x=1778516996; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k5pF50GtcmXJGYs4kvpe2nAmtHNKe2SntljuXTtOF6A=;
        b=tVx5DkmFzJKHMc22eB41ap3FzmkBiD0TtQYHVfV3pMh2g2Y1UKt0CgaH94yWt+aT6A
         oIPHz5RF+PTrCWYFe6Kiwv5P63SfFXxWIY+pDTF5ZJIQC4BgSENMDZAYofccyGJf0Nfl
         Dfggnn1D9gF4FAmbT4dJ0D9IdLWLr4VOkXxA6aWIacLBXltS5Dr/7BJ6fWpsK3xqbAnD
         d1fsgOYuTgXcvdF1w9yca4zaVQ7uxxVVOG2aZku01UWG2zoDkBnmX8IX6JkvO1nSQQVp
         52O6IBncT/RbdWjknvnvjbubcEA+/5a82jCaN8Eu398yKVuAntTPI0x0jrzkWkUkSeZW
         XBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912196; x=1778516996;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5pF50GtcmXJGYs4kvpe2nAmtHNKe2SntljuXTtOF6A=;
        b=qnB93mb/TNyIDbYr7Q5WgaG7WhboNW1Eyn9aolC2gJ9MtsQUr5X+630c9247F4EYn+
         Ax6l62iaGKeBEI2A1n0mPxvpbRB/Fa9lTLsvG8enV2sM8NOaPl7OlhYZrXHIyfmaAEce
         2MSe6sVEJdmbJHgreZBuzFD8XhFv5mImo1kAPs+I7k5sDWc+gQdRuqZPXLuJuUO8n7vH
         nlLaDGngM85M67kis60gPpK/66GQbTsSX5g3lUooiVlk3bkYkf0erc9tys2aH5tT+Grw
         CWTH6PmyC1rp2OYNt9YjBtjpsYvb8WzMujhIpOCEIHOqxsLBQtshld/jGw+p0Bj9U+Ak
         yvsg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ydh+vDK/PoBPHS4x2yjUlAJWoCmJjm+uJMSQvGr3xXVENHwzbzsVnaej4nqLNjH+QIY4QRp3BGx19@vger.kernel.org
X-Gm-Message-State: AOJu0YxhCTMQ2YIo1av6UONTB/3CaR4fqADIpWUcE6GbdWxX/U38Ow5I
	a9iy34VxXluLHgodC9yrulN/aRnfM3F4LPrY6orgr7zTBx96PecPmueABOznVjlZVuM=
X-Gm-Gg: AeBDievYk0deMLNdVe2fBIhTMO+KY74neTtIFAredBprJQfn5dji4F9izmIrnhDiFey
	a0U94VKwOUnIw2BPl0IRSGxArfxffSMrgAJRYv2luK3UHluZQOBuNd1konR0Arn6lbLaJ79bWU/
	k/C2AiN1MUW2/cfzLmBnLX+bSxe+lsrt/OPHf9N2/D19xNETiF0ugiPp0IljqD2Myhm9BA5IKzD
	Totx+FVlDDknz8pzPO6/3gnibvM3ZwLvZawUUi70lhE0Zy/6isDlEcn0D7cG9tAz4AiSy123mu1
	iMjxnM8iniUFPPHlBeBRo7Wo2+BDmdPxFsESkwVLNdeUfth77y9+x3zjDTZs8jRbSvHXvj6KYAq
	mLiO8MYNU8uf+XT/lApgi9EKXJxLSJCQ1OwbaB2iXClKZJ/Wiog4odTC4YY41bdd+gvajXehzzC
	YOwLhAb2QYzzWu2mz9XVzM4L7cXCIL3D6avPbb0oojQD0xRd3Y5J0fYBI=
X-Received: by 2002:a05:600c:528f:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48d14243e52mr4131275e9.7.1777912196063;
        Mon, 04 May 2026 09:29:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm405071055e9.11.2026.05.04.09.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:29:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC v2 0/6] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Mon, 04 May 2026 18:29:48 +0200
Message-Id: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzJ+GkC/4WNTQ6CMBSEr0Le2ppaqAVXJiYewK1h0Z9XqNGWt
 EgwhLsLeACXM/nmmwkSRocJTtkEEQeXXPBLYLsMdCt9g8SZJQOj7EgLJkgfOqdJepUjp0QazUm
 DPidobFVYZfKcK1jGXUTrxk18h9v1AvWvTG/1QN2vyhVrXepD/Gz3w2GD/z0NB0JJKQW1QlVUC
 n5+Oi9j2IfYQD3P8xe6/gHR1AAAAA==
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2432;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=N/w1uFHYZt1PLkaWQZseHCertmTa8aPXuLRhAgnU2M4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+Ml/cvc12e3FmhugnVJJohzy/hmwUGIapXCMXNMT
 UoJE4B+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafjJfwAKCRB33NvayMhJ0X4lD/
 9BcK2Aicq6aiYN9fbVcG+64PtFkYfUzduvnyhVHvESo7K/oHXL77CS1eWUlQKEVJ6aw0aZIo2/U7xk
 9zdfDYVuvc2Ir1C/cxuqJ7luakaBSsTWzn/mP5NJNUYngaddp7IW6SlUbriLt5QHDrfnt4MAT/kMdq
 khMSHj6PMf6IyQRHXOojW5TZ0wLSJx3MPTvXPF/+M9O+GqHtqsO7a1A3E6WXrHeEwQoduTQVh+qHlx
 bynddkg2jYeNT8RzqmXWRV3+A8EwcZJPkMRMM0SuNNhAypdU7Z+wmA75rrMuL+5Ti0INGkJtIIsOVN
 QcZK8T8FWeBU4h21SVKb67iNjtxy2BSAD+KCF+I/qJMWLJVjvpyLVx6DqrGT9uqIF0XsUrtu5PHV8q
 aEtQyDtTxdFlO8lYcjdBY2dNtkSB2qtWgogIv7LNFdpyTWKhs4c5iwjRB4Ag/h0Wfi80Wxu0vZQcL+
 iknyhhrAROrqHi2SmU8n2G6ikTGqw1qNtt20utovKOaHrddXn87hUlkpYhqCSOKSL9mLxhbr3qohhF
 O3n8Ouk1loKLIZXIhTHAXzNOl9IeDwV01+GQwi++NouJZweVAvjaaa/geNPgTjuvGp7JM9HIcuyDRX
 6YrzYnzS3vKvNSEJpBHiMa/0UtqT5+H0WxlA3gzw0f4mKoeYLLDB+jR9rUvQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
found on the PMK8550 which allow reading ADC data on the PMK8550
and other PMICs on the system.

First, add the PMIC5 Gen3 macros to calculate the channel numbers which
is a combination of SPMI bus number and a constant for the sensor
type and configuration.

The macros definitions were taken out of [1] where it was initially
in the dt-bindings include directory but since those are not hardware
bindings but logical numbers, they can be moved to local includes
instead to make the DT source more readable.

[1] https://lore.kernel.org/all/20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com/

Finally add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Removed stray line from patch 2, added review tag
- Added missing header file
- Link to v1: https://patch.msgid.link/20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org

---
Neil Armstrong (6):
      arm64: dts: qcom: add PMIC5 Gen3 macros for channel numbers
      arm64: dts: qcom: pmk8550: add VADC node
      arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes

 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |  30 +++
 arch/arm64/boot/dts/qcom/qcom,adc5-gen3-channels.h |  88 +++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   |  46 ++++
 arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  |  85 +++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h |  22 ++
 arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  |  52 ++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            | 279 +++++++++++++++++++++
 10 files changed, 1439 insertions(+)
---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

