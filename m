Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E712447F2C6
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985722; cv=none; b=hO41+wHeAXDHhCVfsOtNKv1tIxcOSTdHmBMNaMa6vwPs/rPo4vaNYQI7PLfxLzM1WMQR3MwhTwIadKup8v7r52ntUHIJwE2U/gDmlNbIOqW/eQm5fNh19y1EKOJ/DEQweImCY4O9isaEUOaamqZ1M9ce/ytvfaoZr8yIt0dCANY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985722; c=relaxed/simple;
	bh=Vh1RRcTefgGlGwMM3sWSxsMTJV2LWf4YqOpbDDrXFCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DmpZWuxCKnxyHrMMCTCrXOv3Zg/xwdtEMl8Wb4+4O6Zx52IMXtuxcoXnwhS/YnUrpYbALHCxw241TrCBGbsKQX8lsF3LY3Jc1iMdZfR361xueHkM+1JpK31rwqkm9exCnA0ed/6mCaCWROzDlxBndiIn+OoHFcsG+9BqgiWPdzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1zfGfnZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1zfGfnZ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-474560436c3so1475973f8f.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985717; x=1783590517; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kN4Ek61pglGfbk7aWausofDUuCtDymbVtSXWqrPaons=;
        b=a1zfGfnZTuPiLQlom7pCPz64vW8qJGAxw/qJ5ufbQrBo8NwLORNOKdHfPclMJAD9Pf
         d3Id8peiXJZKZx4fn4oacRJSL4FaERQ/0WdaaQ00ysnZrV3tcDFRTcoTui+E1eFIgznK
         rVUgajH4UjdgFdIwhoCOVBiAPqgt7/iaapcUews2MOM6Sj6Hnm6y2O/FKOGwFnWRqoM4
         B8QPRWwnYpaZYBJo/0U/2Bllrj6mJQY1pGPNgNImUXpa+Q//GeKb6dyB4y2bnPLwAnQX
         NdXZc3cxwMxbREFhqJGI+cE2YUc/nGZZ6LfZ1Z4tKca+pGit01um365s7t0roY2EItyo
         XqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985717; x=1783590517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN4Ek61pglGfbk7aWausofDUuCtDymbVtSXWqrPaons=;
        b=lJ9KLYWXNzTZ/gbo9xqpP3ru0zxi38ugVt32iaaJel2yN1vfU5Mu+1psexcf4li9j0
         hBk7Z7Hwl3kV7iW4W7FC+MUKs+QZfi8HYakwl1NXxJ+7W2OFZHcOTSeOKWjufr6+N9md
         QlIVDRaDB6DZtllYvUYA4reJNczpciF73V0afhZbIkEN+xLgoWN/mA7rT4M7R+mg6ljV
         4Hi7Expb91XaQGd2hLUec94A/G4R8UZhXfFfVKn4COpX04WAZyuEUA63bEAroBQ3SQ+Q
         N4hTdwQmhAPgW5KrabglfRSrtAiqkM73r9W/g633AhQd5MnMK5Odg1A1h3GJjSFoYm++
         3KJw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4ptwO8IftRTn+eRdu1E+6ButcBzlPqeeHVuM6uJLrsyWZdLKHDRbCu7DTsX5T78JU9LiKYyj5jkbh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6UKuUe2O7IgiKzDqHztTBleO/SD0wHO6SP4DoPtb9OZmC9RIj
	KWXli4Z3yN3OhPXiVFxsz0OvOmERsJcSly9HxQIBYESIS6hl/Bx7vHCBz97D84Nr+jM=
X-Gm-Gg: AfdE7clLpU9yRBx3GF3wcQ77fIr5DUgzk57WTPOgxPwoH6L/KbEgOMd/+4kxOi/g7ho
	kVYZ6l1Sq0tOb1gAAwly8L0+ZrQfl2Gv9+h8qOwEvF8GrdgCYEFELXE6tgzQd+KuH4li9Y20uzg
	UIdZc5JPDea0P5evKERX9sbyxMfYINr4Y50z2BjL+vkBx6Q/M6pMUuzvjR10ruqNZGA6bab/bQh
	tIs+fwgasCQddIq5XDWgWxEikL9MfUmlgkb1BLK9VwHIEjf00BDsQZRL66xZ17ubOZ1mFE0rnUb
	qqDocM/7Pk+pr+NpJleKvXg4MH3/eELNymqipfKMaxlTAlfMbP5oxmgx8aQJ3uagBVD/GSYulyt
	rM5htPEx/uSG0eXm2XUxOBN8KDleywkLCP901cVHLZbJAuyJ9hiQTPtZ9UtO11DIeWVL0g5yKT7
	YO6dJe+Cg4HtkqqrnKKBXQzSZRxAHb1NYl3A==
X-Received: by 2002:a5d:44ca:0:b0:46f:f12b:e457 with SMTP id ffacd0b85a97d-477af7daf8dmr5284625f8f.21.1782985717092;
        Thu, 02 Jul 2026 02:48:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4a09sm7656816f8f.13.2026.07.02.02.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/5] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Thu, 02 Jul 2026 11:48:30 +0200
Message-Id: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO8zRmoC/4XRyW7DIBAG4FexOJeI1dsp71FVEcvgUNUmBWKli
 vLuxfEhqSKrx0HD98PMFSWIHhLqqyuKMPvkw1QK+VYhc1TTANjbUiNGWE0Ea3AOJ29wGtuLJFh
 ZI/EAE8dgXSectpxLjcrlUwTnL3f4/WOt01l/gsmLtnQcfcoh/tyTZ7r0/RsyU0xwqxriGt0R1
 cj9l59UDLsQB7SkzOzhSCI2HVYcaQwRtgZjFXlx+MOpqdx0eHEYrRXTRdPt63vEs7P9L1EcoVz
 HJG04dfSPc1vHF+H7XNaT15kirRJgE8bR576amx1Fzyvrq3WWfI05LDEHm7ErR4JKCcBkz4p9+
 wWKy+MvAgIAAA==
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Vh1RRcTefgGlGwMM3sWSxsMTJV2LWf4YqOpbDDrXFCc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjPxs4CLUhyHvg9sXRzfQmChrBuUUER5ETybl1mk
 db8kJsmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYz8QAKCRB33NvayMhJ0Wi1EA
 CC0H+NwbsxMupjEAm3uI+SHtejnoIaS7Ui9OAXLOHfdSAko5cWst9Qrxbj54ZY6HwLqj4hD1IocJ3o
 dqZqUTSeB6lkyG47L+dxq56KAoJCzcRhXA9tyFkdS2uHC93PhVjbZsbMi58/PmbiH0/pi9y5DFnAoB
 InjoLpueCDhUB2dVkYKsdOF2wE4sneng9Rk3Rz7TfkEWebQ5yRYBjV59m9CBj5wGL1OMyM9GkfHuew
 bXAIXFDHVJdo2tc/K7EADFZTJ3hfc3ghvAWRyljN6burorUPDBkcrHBxV1EsAYQhytOvVyMmMqGDAK
 IIgTqNsqpkxHBpD6d61IuO8wMWsHkdYddFCrVqk38wofXSz8/reMjdGeo+GsyZRMK/eZ4DrAlGFr9Y
 3jGE4aafc1V1Mbigo0XGjHR7SLgzIvCXdxAQH2S1oo0775I7faWyRICGcycCKWGKUif6DrJZzvMvTJ
 Md6xNZu7dKvk6yLpqv9h0WQu+AHbJq/TNTlKWA1SCuRAjIak2eKG9EKV0OmIg+NstMJfjbBWr1ywMD
 V8s6+0LfIUFQxNBSX5XAUVk2iEBCk1C3nRytVgO6kmrKwrV6Q/J43fpT8ikis1/ol5+ag0SsCaACTP
 rO8v02+NBz0WHUelMpS8MgG5s75WDge0C+atujCnP8jucyOBT83JfvqtKOCQ==
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

