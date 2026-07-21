Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B4046AA69
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647896; cv=none; b=Wg9NeahwNZge8Yq/uhq7L0rNgcwroLA2iLF5t5iTKnSQksD3ZqNwKaxq4HcrzY4P3f5W13yS4mN8FlsLNBGVmkCGOk2UDkWGgANRoNyOtxl5C433/MKAvWvR/o5SXiOyV01T2C06kvOFOC3ptvP8nPGRzdn3+mqkZ+yOOzEDekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647896; c=relaxed/simple;
	bh=tAR8PZXzIvGQ2SHoukOz/OQ/t5sJk1ndSd3hK/i9rMY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KVNyJESpGrYEaL9Yjk1CDA5+Ead3yPBPpru+PL7alSahb2u6RJ7I10qsYopII9w0WOfx5/AxmKZX76HS4uuXKbd/wBwnZhkAo2RkahdoSCC1Ah/VdS/gJu+cXf8IbwqYtM3PLoxf1cXutMqFCVUR448UAkNd5CUssGj+QzTNrwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUdvq3+2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUdvq3+2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954d383e64so23737345e9.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784647892; x=1785252692; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwxPnRiZlwZJyRQBxH7rt3QHwoCcI1jUR/T2TvGsAX0=;
        b=sUdvq3+23rsRng4IqNrGYtoZKWNzVS05oAV5tq2zthKAWWLeVLZz0gZ8q1KPjsMJJY
         jTFDjnGLTNWb9vdkVZDBKheoDaRWD6NEaVm20DDTVr549mlKwt/Uxmc2s4nMSIHf1Ymd
         zSkbGsX6gLarL9SczTvzRBkD1Q/MLlw+BbVmApmvXbvMZSMi5+2cA0uMrPar8z5ooHGb
         C5pjkrfkiciit8La9XI8SgHe25tEJq7vDEM4wdNtfOhvJq5fTZWLF5/F7mnJ13gNg1EZ
         m4Gmg+fIIv/Ul2Ma7wlWF3eQeXe6bTWaJWRDWTbNF0z+YYqleMOITxx05FcXUknjUbJe
         Uqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647892; x=1785252692;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwxPnRiZlwZJyRQBxH7rt3QHwoCcI1jUR/T2TvGsAX0=;
        b=WKs36THnCvCArDGjdiz30UnwpH0R13Sv+6e7VtlROnpljNkS95Y58y4Cake0dS+77u
         XfHwGeaSJOctsaIeNeB5zyPqK0qxK+z7ZXuJstu4j0ji3OJvDhl8INggtsmaDyUaKND2
         0l081vx3qz7MLCz/56G6JEE0FUVkc89TWxFu2t+6rebs1hP+Ct0IU30nGFlEqvLwhrbP
         jPVf2E8bvFCfrF7ZXy1RTgqYqksNwxmHqk3oLkqQI/RyQYqc1a96DK58D5mUsRdpTot5
         rAJmDXUcZF3xZ28eoIDAnX6s7vNj3xA1MSB4r5vZ3tSZGhuONRDGc0GuL72HIvGNIDsb
         a16Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr9uh7fiCRxXpVp3ceU0E5IC/FE4DaB63Is/sf6XKjzr/BRFDKOhyARxb0+dcyKCb05HaKxgw7TTOQ7@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZ6HsE801ThsyCkNBSlHqS6bMkwyEIv8obOOw+OY8EMQEowyg
	Jr3fWhQUfwhkK2oJkEcl0628YfPZP96tBiE7hqks2B3oh5Alu9xQ5XthNiM9sFlP8ujSHhTRNuB
	V218P
X-Gm-Gg: AfdE7cmi0id8U/xsNCkAyR+j67frkC2yJ2GIz6urUzg3MpMGKB++SaYn3EDZT07poim
	G07QDEIShG06ua7jHUM1nor7xshtbDAn9JTX5tumPvOxhqHbPsEORmp+I9HHhbVeCGzNEWGHYCZ
	eCgL62edJFM9tYDx2xaGHzSt5ZuFIr2BAhv0yUi2WbVA3B79YwzS/dnYO2p2FucnQ3rOj3ERl0j
	RIukBcwU6dthIpt3dgrEJk9zEY37/2Ss+eo/m5uSeH4TDfBAccTpjFZB6uiiQdDODzWw0dmfopK
	ZQIzY3PCeyOU2RW9YOHRcYl4b/T0mvdW352cmT/AcFhZZIafYs8tCJ6o2WxCkJ+OngA2DP4VeLh
	QBXYUKVrjflKNTpO8bEpgIwDM7QpVafGIfndWyDUdPM7Xzw2P5+SU5Zp+sRuW8R3fswDh7JTEcD
	kmxpShbblqJgIhm/lm5l1LafM=
X-Received: by 2002:a05:600c:4ed1:b0:495:6485:226b with SMTP id 5b1f17b1804b1-49566a820aamr34177685e9.22.1784647892177;
        Tue, 21 Jul 2026 08:31:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a63e3a8sm1043495e9.12.2026.07.21.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:31:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/5] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Tue, 21 Jul 2026 17:31:23 +0200
Message-Id: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMyQX2oC/4XRy27DIBAF0F+xWJeI10DsVf+jqiIeQ0rV2Ck4V
 qoo/14cL5IqsrocBOcC90IK5oSFdM2FZJxSSUNfB/3SEP9h+z3SFOpMBBOaKWHoOByTp+WwPQO
 jNnige+wlxRBbFV2QEhyph48ZYzrf4Lf3ZS4n94l+nLV5x0cq45B/bskTn/f9GzJxyujWGhaNa
 5k18PqVepuHzZD3ZE6ZxN0BplYdUR3wnqmg0QfLnhx5dzSHVUdWR3Bthaua2z7fRz066+9S1VE
 2tgK4kTzyJwfujmFi1YH5f7huW5BaKhv+ONelhozfp1rzuHRDnC1I/XA4pLFrJrPh5LH6rlk6k
 UvMbo7ZhZHGuqQ4AKKATlT7+guo7g79SgIAAA==
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2766;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=tAR8PZXzIvGQ2SHoukOz/OQ/t5sJk1ndSd3hK/i9rMY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqX5DQpimYyHVWVwgSkquZOn6MTs8DvrT+ImN51dZA
 R4kmDtSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCal+Q0AAKCRB33NvayMhJ0fDMEA
 CvVEqrCIoLBCo2AfmbTwdgIuNjJZXqh9JgFdpwEqjEXCayvJSI+ujgdMuxxbCnZBgi/7c5GjLMzto+
 g00ET1WesczZnPYiKMze1pmWV+JVVcW0fSvW5XcNff2e0nPozIek753KZu07zbeCQnBtEbGkGKNGui
 R5+RS7YM2pNLXQxGz7Zpnc+C97T8kQzLGqe/Nwx9WaveAPbhLO9Ovdg+n8xhJs8/u/k0jILhDMSZkf
 tkFwI7MXRdRByAqPb9k/TaP4ADdZRbxkdiwFak1XGrdzPzZ3b8AFT7hgpRsCTmfUXHPfPU3eKCWcS1
 3F51u2FZsrvzpGsUfJjyQNerMLCQfr23fMjFpOup4IQ+O52aKJZJg837y8bCmVmkmBCL4lZ99KudTG
 0DOkp2NrVXPE+zCHemXtoF+K+mgzJ4JyEUeJDxJgDrpO2HnH85eE63qnOz+Zv9PDGX5bYVm50uAmEv
 8qwtNr+AyoMw0zZnmDal44g8CPbf3GhQjJ+DNUQPYLolA/5dDQbBrnK5wmNAJ/37HTxZ99TKIKutws
 x+IPFMr00tu2YBH5UVJtToU0o5hB66CFnaP2Hq+i2+nBmDUqKTc6fCRAaHNl2GXzqRh3FMRB8zm2p9
 xafr8xiq4XtSF9eMDAOmzOrY6YBMrLGzSJjWXEmyOobi5ZTyCrdncTup+T/g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
found on the PMK8550 which allow reading ADC data on the PMK8550
and other PMICs on the system.

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Depends on:
- https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v6:
- Added default settle time instead of implying it
- Link to v5: https://patch.msgid.link/20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org

Changes in v5:
- Reorder adc node, move interrupts and use -extended
- rename active-config0 to trip-point0
- Link to v4: https://patch.msgid.link/20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org

Changes in v4:
- Rebase on https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com/
- Change all defines
- Reorder nodes
- Link to v3: https://patch.msgid.link/20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org

Changes in v3:
- Added note about nodes ordering in commit message
- Rebased on next
- Link to v2: https://patch.msgid.link/20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org

Changes in v2:
- Removed stray line from patch 2, added review tag
- Added missing header file
- Link to v1: https://patch.msgid.link/20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org

---
Neil Armstrong (5):
      arm64: dts: qcom: pmk8550: add VADC node
      arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes

 arch/arm64/boot/dts/qcom/pmk8550.dtsi   |  30 ++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 277 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 277 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 277 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 277 ++++++++++++++++++++++++++++++++
 5 files changed, 1138 insertions(+)
---
base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
change-id: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
prerequisite-change-id: 20260430-adc5_gen3_dt-f0434155ee25:2
prerequisite-patch-id: 42a8f026b28f4f1edf4932ce99a86ced84c4cc41
prerequisite-patch-id: b370a1d9b3c61a0031e10db2aa9c7779e0a26e14
prerequisite-patch-id: 179d8932fff0aef7eb84bb7e731597f8333f4427
prerequisite-patch-id: 2a2e07499d57f0497c7ce757b2d74077ae4a843a

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

