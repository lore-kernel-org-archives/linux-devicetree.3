Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864394;
	b=O26PzH2ttiKwcdunAu9xMseFAL4BvDhqYWehYPLj+IVdgiNeLN/hS6gWOu/1kSguGv5C
	 tGnq/lSb3auXausyVJU2Bfqyg4jqvOy27k4HByYkLZ0YbZ0aZBiJouCJxsSaGCYO9+8xh
	 ZznvNgm16JGyamJR0Zd/mDwQuVMY6pttc7G2dN0nIr3oIia91B9OlnTDFqTQcAaG4ae9+
	 H1yzwUxRPSaR8KFjJk4yxJhVJZvpPiSPDNoE9lxvqpEUgEzwMX7YFqdFVVENUaqMXOq7U
	 l7cfSd4d6gmWL5ywTMAs7y0YNbl2gL/HMA8V3juihau4Sl0xzdfyr2O7xwE3rAfeB7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=geDMUZgvfuVvDJzC8y87j2/OgPMLvLdV6dtKH2mcnHM=;
	b=l4k92iNKv8LYhtT9ysLnD716nm3xGlinhUpwh598bo7GqR5ib0q6hw2rzERphBxO5i2y
	 zT2xY8lnf1DYwY4GgwUhInGO5aWTKWs93OwCrt/TZIDb5BQIDlgrUZ7ynoZYufhc4H7Nz
	 Hb10MhtdYvzHX8i8YNFGLXGkbNi25ndW+Rg/qK2pN6yXXroyBYcrw7U8SPd4iwFjcYpyP
	 9nPxYE8CVC7DpFMQFFPl1qDQ7FIeWmD7CtxAU/jhgnCxdvjC+70E/L7q0aIZRMbMLkO1f
	 OYlWxeJkofRIj3MmPFyfpsBOtK4J6YN3dhJO9r+/RqhsVqchEj6V0A+824bieKPyBnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NtiVH4AG;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0264606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0264606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NtiVH4AG
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so292442f8f.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864392; x=1795469192; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geDMUZgvfuVvDJzC8y87j2/OgPMLvLdV6dtKH2mcnHM=;
        b=NtiVH4AGWeDGTKwoGg+6YspaBzCDpEVApJhk3vTSYYhvTnIvB5ud6zbYGvTT5yBfkh
         GkMqfAofo9GioaxaZridDO165zAN91VsD9abSxzRtlmchmf4sMAHIbRfHzJr9pCak65V
         bUIM/vtUB+h8HUO22SasOQV6n709mv+JCcCSyALTvmNYuooCSStMoZzi+aYd5SM+QMmv
         fn5aLlh0ZOQ2SwL+j77FO/qNLZ/v1dYrRhHcdww4PXcPP2Md0zM48qmzDk0ocA35Up6d
         BMxyLWHMqORZx2Uzmss1RjUQES1txmvBApKcErnpdVRICH16FcVZk3FC+qsJagkZwi98
         d7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864392; x=1795469192;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=geDMUZgvfuVvDJzC8y87j2/OgPMLvLdV6dtKH2mcnHM=;
        b=DM6YivWq6CueRyMQmUa3oTdrTDcpRIN0BoLyazOcu7mQSKi4jrrQQD3PzvHZBYuNk7
         qXQoj5NseGRm2loarTh/fNtos6K96CLUkKHJeZSSfRn4o6CiQ3OefrxdKoFs/Atdxu9P
         UEyCHGKWop3Kmo9WhQ6yHiNY/V85KWOAigO0txz1MBJsKUtqkr/TyC+mADFCtoEYMdDd
         RJO7S2EO/qjkTd53+nQ96TBbsfD5qoIKZ7GetCnDdzr7z8xBYojKXJmPqv3QCx/zGtLX
         XNkLe0KndZiV/PrqtR1qE4wttTjymvTcH3sUI6cEX63p6DAiQX6tyf4XbFM5GVgU1RdG
         4cKQ==
X-Forwarded-Encrypted: i=1; AL+hErFAOl/uyr0yuF0NyTaeypds5FxNcs7TJ//8v8AzjpOdv2txG5U93CLqweXHUI3AiAa3DoKAbE/l26FX@vger.kernel.org
X-Gm-Message-State: APuU4Z9hm4d+p4WEH/+rJP6H/l79cnau1hmnU9vAuI/0v7stlAKIKa2C
	k1H2rvm/5r9iqSzimU+VN6ayhNZ9dENACvmH2Ss3MJEiWS+3JZMJyskn
X-Gm-Gg: AZFdTZcbqN8UHYOB4iXCt4TQVtQtEsL76YJABgwmlGt8EcvVgVxF73j0TssnYidOr7Z
	Uf6Bz7j1sXFlBJDKVZtVPFtuFJ/3HnJFuO1Cq3QWiZyeMfJ87g42ZUusX4ytK73H8yQLutYaYBS
	p3lgdDR3cn8nKNVoANnpD4FiS2g40Pizea4d4QFRQtO/Z5nyVsNa6ZxQcrdnWftNpaQrVZMETxk
	6GPzdFA+Scpvz+ZYG4F2YRHN8KxKHYyhN0zZDng+HvptfWSKVif+s2Slgxd+glcIVhf5xM3d+7W
	5zLu80AM+ErkFf9pdjP3umOiEjUFqFIPsoKB4A6CSYu0XCqZWxJeJUKIsxbce6CsVI4N3BiOMuC
	NT4us+sODdeUALjkEPDkyZgMRyGM1pm5ypTzR2EMu1kn6HvmpAYB/4E92rZ4qGMoRGiqAJyNjSb
	p5bidZsbOURiK11pO04ViWmmGS640Fr9Rmf2m/KQyFa6o7TG6vL3SNUKEsEvxkdnhVnpVzB7F6b
	dTfpH3qVnDs2pXQWU+RF/RtOQ/5I9G1lbQq6v6GGlT+ibkGZy2UPDjh93vdjOwX/GMYc0NHFmbf
	oKspiTDDjXOKf45Qfe2uGX02+oj1RgpTw+So+9at
X-Received: by 2002:a05:6000:2010:b0:48c:4f6f:62e3 with SMTP id ffacd0b85a97d-4a324348cc8mr2541077f8f.18.1794864392095;
        Mon, 16 Nov 2026 13:26:32 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 00/16] Add initial support for Qualcomm Halliday and
 Samsung Galaxy XR
Date: Mon, 16 Nov 2026 21:26:16 +0000
Message-Id: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPh0+2oC/42RTW6DMBCFr4K8rit7sA1m1XtUWfhnHNxCSDGgR
 hF3r0OQ2qpdZPk08+abeXMlCceIiTTFlYy4xBSHUxbwVBDXmtMRafRZE2CgOGc1bU3XRW8u1E+
 JokJfGrDSeUay5TxiiJ/buNfDXafZvqGbbjP2jhE/5syZ7m3fmEz9A5m6vqcBJCsrkSvImgXIz
 93+M7nunZYKuGZBBOn9I57oHFXSSCHAYi31Q5zzHPIxlKN2paw5ghW7z5qE1A19H6emQOPqwPL
 +oABN5blUglXeCGsCKAaaOxuwBHKLrI1pGsbL9pCFbwntZP07+4VTRqHWnAtja66rl2NvYvecq
 eSwrusXJrbDqNsBAAA=
X-Change-ID: 20261108-halliday-dts-e6ed3a2b5cd0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=5564;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=D6pHxmjbT0YQnXObxaMbhJXnWglUC8bGXbRILU/YSwI=;
 b=kLkUaY9RvMn2SFKfEWKUHPt6napWByTdqsO3PWDWJfyn5BbOP9cFbM5QSqDucjMqA+sKciod9
 131P6WbXtcaABhTsVArttw14ogeyJI2M4IyfytTwUN7qU6QUoEuUPxW
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series introduces initial Devicetree support for the Qualcomm Halliday
(SXR2250P / Snapdragon XR2+ Gen 2) and the Samsung Galaxy XR headset
(board compatible "samsung,xrvst2").

With this DT and the driver series, the headset boots to an initramfs
with a shell over USB NCM.

UFS, cpufreq and the thermal zones work too. PCIe with Wi-Fi and more
will follow.

Dependencies:
- The dts patches need v2 of the Halliday TLMM, clock, interconnect and
  cpufreq series:
  https://lore.kernel.org/r/20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com
  https://lore.kernel.org/r/20261116-halliday-clk-v2-0-28208928da36@gmail.com
  https://lore.kernel.org/r/20261116-halliday-icc-v2-0-6df8fc0e0620@gmail.com
  https://lore.kernel.org/r/20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- Order the patches by subsystem, with the SoC ones last (Krzysztof)
- Squash the "halliday" codename patch into the board binding
  (Krzysztof)
- Add the SoC ID patches, which were a separate series in v1
  (Krzysztof):
  https://patch.msgid.link/20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com
- Move the OSM L3 binding to the interconnect series (Krzysztof) and
  the cpufreq-hw binding to the cpufreq series, so that each subsystem
  gets its patches in one series
- dtsi: Keep the Linaro copyright of sm8550.dtsi, which the layout
  comes from (Krzysztof)
- dtsi: Drop the empty chosen node (Krzysztof)
- dtsi: Sort the thermal trips by temperature (Krzysztof)
- dtsi: Put idle-states before domain-idle-states and
  arm,psci-suspend-param before the latencies, like glymur.dtsi
  (Konrad)
- dtsi: Use 0x0 for zeroes in reg, ranges, dma-ranges and
  redistributor-stride (Konrad)
- dtsi: Break the reg-names, interrupt-names, clocks and clock-names
  lists into one entry per line (Konrad)
- Cc Ulf Hansson for the rpmpd binding
- Link to v1: https://patch.msgid.link/20261109-halliday-dts-v1-0-289114ab8197@gmail.com

---
Stanislav Aleksandrov (16):
      dt-bindings: interrupt-controller: qcom,pdc: Document Halliday PDC
      dt-bindings: power: qcom,rpmpd: document the Halliday RPMh Power Domains
      dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
      dt-bindings: arm-smmu: Add Halliday SMMU
      dt-bindings: usb: qcom,snps-dwc3: Add Halliday
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add Halliday HS PHY
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Halliday
      dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday UFS
      dt-bindings: crypto: qcom,inline-crypto-engine: Add Halliday
      dt-bindings: thermal: qcom-tsens: Document the Halliday Temperature Sensor
      dt-bindings: firmware: qcom,scm: Document Halliday SCM
      dt-bindings: arm: qcom: Add Samsung Galaxy XR
      dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
      soc: qcom: socinfo: Add SXR2250P SoC ID
      arm64: dts: qcom: Add initial Halliday dtsi
      arm64: dts: qcom: Add Samsung Galaxy XR

 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/crypto/qcom,inline-crypto-engine.yaml |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    2 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    2 +
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |    1 +
 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |    4 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |    1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    4 +
 .../devicetree/bindings/thermal/qcom-tsens.yaml    |    1 +
 .../devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml |    2 +
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |    3 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/halliday-samsung-xrvst2.dts      |  218 +++
 arch/arm64/boot/dts/qcom/halliday.dtsi             | 1871 ++++++++++++++++++++
 drivers/soc/qcom/socinfo.c                         |    1 +
 include/dt-bindings/arm/qcom,ids.h                 |    1 +
 18 files changed, 2121 insertions(+), 2 deletions(-)
---
base-commit: eac8f0411262ea7d156407da4baf260291cbfe32
change-id: 20261108-halliday-dts-e6ed3a2b5cd0
prerequisite-change-id: 20261108-halliday-tlmm-f250374110e0:v2
prerequisite-patch-id: 0f6c7c801393ba2d1ed5fc82a65be6b05f0f6cbe
prerequisite-patch-id: 36f2dcc3de10d5ccba9eee25b73736189559162a
prerequisite-change-id: 20261108-halliday-clk-362190f4f5dd:v2
prerequisite-patch-id: 765d40b7543dba6580852939a5c3d177f12d0a1e
prerequisite-patch-id: f12c958fceb125bcefd8dc9de139f30a371f85a4
prerequisite-patch-id: a6559b14fa1badec8e7752940362d68306523557
prerequisite-patch-id: ef47e531053032f65d3d600e2213c8a78e50f20b
prerequisite-patch-id: c4b2cbea76a00aeb699d706e09a899aa18e510d9
prerequisite-change-id: 20261108-halliday-icc-65a5442be859:v2
prerequisite-patch-id: 94cd5dee75e96876c6a42852cf6d1b52df1c7ace
prerequisite-patch-id: 9ad58176d603ffd84e7f1239c3b646cede4c8a3f
prerequisite-patch-id: a5df517be2541ab439d324dfe23ceb4c71a0e655
prerequisite-change-id: 20261108-halliday-cpufreq-1e9c3581e2b4:v2
prerequisite-patch-id: 95b1ae328d8049ecbe450b0f18df15465619f2af
prerequisite-patch-id: f67013633e74af33f78e3ee4d9de38bb2842fe87

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

