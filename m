Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BCAEEA8
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700834; cv=none; b=URmrS6+nA2Nbvsjtt7Nt94ctuC+XPQx3iZnnK4MR1MBnsmxkITrF9z3FCtRuKXYT0FsmPuiojJmuE2oPoxF3CvxwfMgJWCqVcofza0wlueZ1aWpUkFb2faXJAxOgr3UVlApVvVP2Oc8SRtmMNZq/i47AYhgAVeUDCXsCBGOS368=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700834; c=relaxed/simple;
	bh=cWBkvZeiRKEJCaz+cZFQiB4EkEoMdRQvxH1u+mCb8tM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qAePWav4xp58vwIN9D0n3gr6g5CTIZD7VMT8FfC71mpYiMDUwzuLZ7dPM3Y9CqOPluaWQEvRhp9BcD4YSGJR6TMxfO8mKMitikaEF9h/pG16+hxr80A6gAAMBjf4qSzN5tLeikpBeDbwDnp3xJZRqW8n/ukt2+vCvN9UzPqE+AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6ewIPAD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6ewIPAD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4923139e940so11096685e9.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781700830; x=1782305630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUOFRibVcM8aA9c2a3V9XQAESUorPpdInVtdjMb3cCE=;
        b=M6ewIPADAModFcEfYpXTAM+HF/fQHEOWqSwhmbYr/+FQfxvb28k3b8mQ+z5cArjnIW
         /KYul0lOkvae6EsrEUZWsDnqNx5WzzgVj9eKkqJk+3PUncCfSP/op53k7rWTdpUxGNC5
         H8CrUz70tUv9P2TScq1Uaco8wm1fVjPuElifGJZEWB2UAJzWNhaAaLfhsyT2Fjx4W9TK
         bm7NZFfHuEJPl7s/b/IuFGDVXM1wmrrdOkJIQReyoiWkU9e49xpgroGkWIUBRN486bgF
         1lmLQhs6qaLoCNWko7urqt4TUwYN0butn0/De1yftPGa49gUVszovXOgPwXwWLTpbhow
         ElgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700830; x=1782305630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUOFRibVcM8aA9c2a3V9XQAESUorPpdInVtdjMb3cCE=;
        b=AV01Ij++JixcSzxiTeqznHVqBZiZFmmE3zHwZHC8fT4LK9vT50pzUBb5wslvBuX3gx
         3yzoUpWzTqHuMKMgXzMtnipd8lZeqkIMz5j0Ar83ZWJT+0dg8cNgSBgzZSiAndtRW2yz
         ZSClUZWg3vrVOpa9d37rBCpjlJcIWWp+eLwnbX6xXbGyY/U01jlz0SGztdPgbenMhrOH
         pI7i3ARRwMycPPBw+7a+7jyXyBQwjixTMqW9wtf0WIEutQQWxKOWFUIybphJB2pvUow9
         w8XvQ/+7cD9k3xXvMqRiz1st7KOMBfpBKwhkmQ7fFeo0F/Gg0dgum9/O9TG5K5DGBUnx
         dJqA==
X-Forwarded-Encrypted: i=1; AFNElJ/XkoZBmzWgv/gC3MV5dskdXU64MaNiRDDIkBFmchVMFVls9cVcDeNHvrTq6szPImN6UQIH4aGeV5no@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj6CrDnLRhZyESMtt57kdotMSVX6DAn4XuIyVDQL4TCuI/NF+i
	+GhYfwNKZjnUu/ft8E3nRP/sE7HY4vcKa2LtfuZaq4za1LjEumNO1XcEY2gjr7tatzLPVmxeUbR
	PZx6x
X-Gm-Gg: Acq92OEi4Efk2dVhqJXhmhZtUz790FlgBOpcgbUa2D6r1ACYA3pu9UIw9EkCd9x8BD4
	nGwU7dLtElfUdJ8uDKQ7Z/qX1K/2+G32QwkcIsJr7K2qq7Owj6jg/Yo3/udvJIIYbh0qLhxdf0v
	SkLBHEsE60Jls0qIerIo0qaCCkYga/qMtnikVDx7t0DmX/hnSARQItTwgEWpRaWVfy7cvRqs5yt
	951chQYjA4ecUxV7UlfBLncpAAYqTf4o3Akegx8OvcVzyNQ8uiTjXpT3qZxgtB9kKaaplGamfgr
	jRyOM6uPxMb19p2w8sQpdIev6WwBEwx4eaKmhIJU1EQBrzRvBAWcPdsLGB7a/0eUhJjfQuGrBnZ
	ZZvveIx39oJu5P9uUDkJYwtRT1DdfvBCiXGmsB9j7r6cmC8GZKt0pyaPfXBR0d/w+sX35XJ8t2+
	zhBBhBeaFRDplQVbHHmhYATFoTMwDd/WGOBg==
X-Received: by 2002:a05:600c:314a:b0:490:6e11:c303 with SMTP id 5b1f17b1804b1-492341046c4mr48542565e9.13.1781700830349;
        Wed, 17 Jun 2026 05:53:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm9130562f8f.10.2026.06.17.05.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:53:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/5] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Wed, 17 Jun 2026 14:53:44 +0200
Message-Id: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANiYMmoC/4XQy27DIBAF0F+xWJeIp+14lf+ooojH2KGqTQoEJ
 Yry74V4kVZV1OWg4Vy4NxQhOIhoaG4oQHbR+aUM4q1B5qiWCbCzZUaMsJYI1uHkT87gOPcXSbC
 yRuIJFo7Bjlsxasu51KhcPgUY3eUBv+/XOZ71B5hUtbpxdDH5cH0kZ1r3/g3JFBPcq46Mnd4S1
 cndp1tU8BsfJlRTMns6koiXDiuONIYI24Kxivxx+NNpqXzp8OIw2iqmi6b73++5r98O8HUutaa
 1C6RVBGz8PLs0NLnbUPSz6qFZO+BrzKHGHGzCYzkSVEoAJgdW7Ps3+aFWDLoBAAA=
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cWBkvZeiRKEJCaz+cZFQiB4EkEoMdRQvxH1u+mCb8tM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMpjaTZ2PSk28S+Lq6jvx5m90GW5KFTZhHHMMjm9S
 4bLVP4SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajKY2gAKCRB33NvayMhJ0Zd6D/
 9NuYdSQnGVBHUWG4MeXucESSg0Zc8Vjzr0AVCa7YYZcjLIT3oLDNNPhZz8ytcnMpeogjtRJXZexsJP
 SnCwmG/ILIiwk9gbVM7JUWIPm3w88Nwczf5x0db0X7xle5YyL4uJyjrHXIhnKwE+6FhWm0nrSVj0JK
 rvgwek6WvThaEWYkfN0RIpP/dMsa2zl8hYGFMjGJrEwgiIoDUPA0vnV5dgDpvrUR2QmfW9Bq3TA/ks
 kww15Nzb/MeM+5aXUag5/kzVbxzP/V+rQh1AIkXsDmhhZAwmD0FcuReDw9puQnZ/ZueEkzaYvd3pCq
 /XWPxYzqRC9IIYfe2IK8ilMbAYhzYgsGrnG+Sa/Ug2PPlEdVF86iK1iryfDsJepjlZoXs5YhG/Evj8
 SVpGYT/ulifk0fZWRW9lk54JG6SrwDduW/kybpwsmtpLn1peUfc9rxaCiAaXoxRRdLUT2HR0cx+zXN
 TdXcZKYKRKU6T3PmRCeEkn9fTxqZ0Z94zwV9TyrAcTAyvPc/ZfVmLN8ThKX1ZVZtqg5lSkrEQFvbpv
 QKclve6IQV5zBhLKAwGHv7EhQEIGnFRuFam1L4rnEMNWYfAVYvW4MRnjHJJ+t2Ju+Wtgn6/Psc6BRb
 NLtrfabs7dwC3HkGPgLWhSfb84AR5Xouefd0SAjiWb1thINs35YwlqrfHgkg==
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

