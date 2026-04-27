Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC6E34FF76
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306515; cv=none; b=fDsryqpUZPaEoWfvKNoo+XKnkW7tuKrhAMMi4UV+cZihy5TOSZlflVtx7dNk/NLpYxZ3eAF/3N5fuVa8Vtd15tMZ0yNu4PZXBzUuni6UKc3ozkXfi28+pCZyK2o97bsfyWP/QDbFmIc5U8xL5g/RtYuDWnJNVhX7HFwgJwGiCss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306515; c=relaxed/simple;
	bh=ix+qwnkesc5HtvM9vTfh/ENd+p1buRItGrZr1N6XTTs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T5aD7goozlxPWLVknbw3W2bcpVyFEH+rTrJwMZhfmNCwhHrplcLBmncu0KG015V2f0Tb/r7aqJTzqFqO7E0wyKdBSzFLPMbRLTwM9ys7sS35U9QpjDpKsDD6lrajDk4QOutl+YDxMzisXiEprS4Fq4D5oQXotX4serBpfkcvAcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zb3wPGGs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zb3wPGGs"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so129662385e9.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306512; x=1777911312; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v0TvH58Q6/Kcl0Q7VUseoTrwWfHbchIaxmWiW0daToU=;
        b=Zb3wPGGsONVVL5NN0OK34RuJn6JQViNVUOgf/a+jn99xdOi1GICn8Y6bP5GgetT7Il
         AR+f/aMc8uqivTY2ypSnKPqpEpMC3fwtrSqpdq4kCahPdyTFnraEtwTpfNikt39I9Bw9
         /aIDaoyC/t/QA3lHauJEuxKc/IYcwGY3sHMFM2TiAquoy7up334QoGYsxJM5rl2TLrDR
         gQdSC+c/AY/wXMI683IlNRdtPjK2m8P5gGUrOiPjvOntzfuKGCFbpM3JccGq708sjHrD
         fA9mLzMQgR5Ehkq5gbLigjhlp/aNjpWCyZJQ3UMlKxgouOOG6WaaZiu52MKmc8ug7Kqa
         uCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306512; x=1777911312;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0TvH58Q6/Kcl0Q7VUseoTrwWfHbchIaxmWiW0daToU=;
        b=ISRK0iIBDuw1gwIQRhsJD2WSwPrmNwjM2ftQrDfG1RpLCaj5/wQWQ3GaxCrvq5qBUW
         fnRDiLKe7ESNvfWoGKUVIQns/1N9b8ShEU+ZdB1Xff6JqrA9Zj4EFft5tm8w8qEn/1I8
         xI/RZFXRx3AoNvcUeO/7z09ZyFg+QtJeV53/Fki+S55JnzmsdbFtYV3ltlz7FcN7W/vg
         vZUg1Nm2mN/vCzc1V4VVBOahxAmGbDn6k0V8UrwQCFqZYeZWmAitcqEtEAzCQs8vLVYc
         wI3O/TQKtVcxXPENv/rEXYOdBmiYqbRs/JyjJ4IG6FbYZOg1Eat1mg9PJt49uImuE7U7
         eGmg==
X-Forwarded-Encrypted: i=1; AFNElJ+4xWAItUCoq7H0PBSonCVXwu863atFGQgFcSmSMGBy/GBAm55w6htLB7I63r3No6mtpeeW2q6hRKxq@vger.kernel.org
X-Gm-Message-State: AOJu0YwQAHv+eZ+ogq6bD5OAOijDKRvIT0pGcCjhe1EF7J2tRzg56NA7
	sMdRd4+CU9f3JmlYqEWOvT/Lt5BiSAaY4SE0O8QIuXRi2wIhpswzfcZSmTOMmaQguqo=
X-Gm-Gg: AeBDievQmTX1x17DreE4CxtJlgAL1JuCrMuJnHPVYiuFsO6yJ+XfRinMLyM89j6WA+G
	fQ8217eBiMJrE8xauOXrOzpSI+AnBXTjoj9f8iVFw71+Xq00PwXPRXHkarRc+R/us6Cj5Q+nnvz
	4uDZZ5cEg2TzRUhMoBs9g0EJHtQFFaTGBO46eNwzRREF38arriiuQY5QPd1LOI3yqiuY2JKsnKx
	fJY44u/RGCH+ztPuPXSjVv2I4lRJuU9RsS2Uiu0nes/7IqDlrIBHDCUmzaki1gKU6ZojDRn/OqC
	1kJlXCBKgwiST995i1Ppj6eKVEthTlsp6GHSm8POjWOktUWmz2Q/vvRGmv2i0fuoOBQT6UX0il3
	5aTPk4Q3/T+ySp9gprqWUUiFd3WM0ubqFRB32o5NjJPkXefF4pX9gAoOuEdj5TVnojDTB08FoxE
	H0DwaG3DQEvaWME954AGey2tm1oDXEp/UenymZsojrN/gdwa42eMhKL0M=
X-Received: by 2002:a05:600c:3223:b0:48a:568f:ae82 with SMTP id 5b1f17b1804b1-48a76f53ba4mr517035e9.10.1777306511519;
        Mon, 27 Apr 2026 09:15:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm831407275e9.12.2026.04.27.09.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:15:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 0/6] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Mon, 27 Apr 2026 18:15:04 +0200
Message-Id: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIiL72kC/yWMywrCMBAAf6Xs2YWYNL6uBT/Aq3hokk1dwbRkq
 xRK/72pHmdgZgahzCRwqWbI9GXhPhXY7yrwzzZ1hBwKg1b6oGp9xLEf2KO8T5NV2AZvsaNkkEI
 819EFY6yDEg+ZIk+/8R1u1wYefykf9yI/bktYlhXbB9mLfwAAAA==
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ix+qwnkesc5HtvM9vTfh/ENd+p1buRItGrZr1N6XTTs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp74uKb2ozdry+gtK9PpVtoUyV16uM8YDEtdIU9+QC
 Y8qPy8SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCae+LigAKCRB33NvayMhJ0cNjD/
 4jT4nniphO6I938ifEeSXzOLnGrXSZAVZRm4gHek4HnnXWvFUiofn70t5efVO0tTr0sL83JZxlVuhn
 LQ4fVZJ7r7ehNhZApGd8lptQeg4+Py6WimCr83G4Op/MdGMGW0QR8Yc3qXA1EsMzY3RzCt7KG9NCiJ
 aiA5KXuckKJU9ds64cWdo7GjSx1xa4ecsss287itDetOr4oFOLKYO0ZbmYIIqMnnVgUiJX6BBCaZyZ
 whfFWkIhVdGz9iDfOeSJdWBBPUkl1IjVhrHAg5cM/WKl9erVe+fZJ9j3HPiijl5VKneuwc5FTw53EA
 RMa+GXcZKGxUic+mqoGGdt5FYbmN0KwD+bwhGkX8UsmriYj+S7wRKx5qRmuQurVU5z1JoSLKNVGOsV
 L2p/0t6fox/dyV4WDU8EuTxmZ+zn7Cgbb4ZxQDV/Z9nrQ3SoWTR1S7YeXvhpJvOUESyEe+CEIEweh4
 /wPsVqeOpxt0Jo4LzOdUMNyZ5YQzZM/zj+ccpmmwleAgoM322St8CCIsU3BOB4Z3xfjLr+LrvuTCDY
 cxI+fI4Et4vDEIjYwTHu+9ryRXDEXerBrfwy9TS1TYaUJ98WsZW+NJ6g5ibXYoQFC2ecV7dAWiAVMa
 5+ofvY+re/hue4OAe4X5YRp4aoi7CXetnVLXrVQTr5/PkXOKNYt+WBj/drpA==
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
Neil Armstrong (6):
      arm64: dts: qcom: add PMIC5 Gen3 macros for channel numbers
      arm64: dts: qcom: pmk8550: add VADC node
      arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes

 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |  31 +++
 arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   |  46 ++++
 arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  |  85 +++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h |  22 ++
 arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  |  52 ++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            | 279 +++++++++++++++++++++
 9 files changed, 1352 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

