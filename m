Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2D93FD132
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089824; cv=none; b=PUyghMNskpySObUlNSqn/TOU7FRVrrraKYfXJb/TQO3f59EvOKifMWluyqiQl/k8C8PeAlOr/5rr0pw+Gf3g0w7TeL2AhbkIWHGgzDqsNflZ21yasEb1rEUm1WFgi3CfeFC7DYc8pZ0nQNxmdPUJxJqAVxtrFKTbI3zNrwmn6vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089824; c=relaxed/simple;
	bh=AeMf5Wr6Pe7z04trz/jF9RfVqQlRMCsK6v0jvJ8gVWI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i+gY8Z/DxShb8mQTiZmOeTKXm/aItfbjJOKanPItZedCw0PEPqJB6Ck/0iKDWWm+X5mJD1pArYgRsxCwXITh2+k4uN/M3Ug1ZaSBcLKID0ViNJYSTPUPUGU5PF2S1eVzsj0JimLwh2lmpe6Uk3zKja/C9b8t4/YznKjyuITAUHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhoVTNSX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhoVTNSX"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c35980fdso66403345ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089819; x=1781694619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ONdaAz3lAyvZtpSLEpD0avPz3gy5OYFvenkxhDXGSww=;
        b=fhoVTNSX6pMa9cZQ0lVHJDYBt7GzzofA9HeZ9YGJxJMVxetbCx0qWsndAFLNDp3g88
         ILYlzLHkXr36UG+MzsC1Pon7F883xZ64PWKMyNN53sJqbql31806NnsH+oWo+bZAglji
         /nhP3Wj2/ivAq+uwd2HVlEGhITf7hrV1Y8cu98KXdavePFybdn/dGTo+5kpgfrbp6Gpw
         TiI2QvLFs8gyLa3aL+Z7jk1sS3Uocau7dhxyeI2xBoOQHGFuCT9nPyuyDcHue0cc2z11
         luoy0mzmv0HDsc9VBKsM4tkzHbXze+EQAziBBkZ+S8TbVcGdACmYdzdtGo/q3YjrlsK5
         5cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089819; x=1781694619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONdaAz3lAyvZtpSLEpD0avPz3gy5OYFvenkxhDXGSww=;
        b=CYKv3BIcKlx2wwMDHi+JZPwW4zLAqYMt2QdoUjwVAx2csvT7Q2R9zPOsDNBifFqoe+
         rq/26idhYXz43p+GsSwVq0c0H0xeh8dt5ew1GgI4FwM5AWvWARf8XgGDoiga4iMriYhm
         hR2Ah7oajUfe6IOfXT/rjE2wBp7Ydwr9FlW5u3wYE2oBCwDk3tCf40Qp3czxY2pps/T1
         rqeHbMfyDeyhC4xA/esz1/dfPrN7/8eFcp2XMyZ+e6+Pja5pa8cyqU36W1AzggdHtbbo
         Qf0lGTHmBBgf/qtZR6oCVMvourCmD5ctLwu86iikaZcjSv6gwt5qATmqJGEUGS6HTrur
         X6Fw==
X-Forwarded-Encrypted: i=1; AFNElJ/LUO7bE/b0o5rJRapdorAZWN2FgFgExeDkSUR7wS605a+n+dJY/Mf3xCZHrnSF9EgT8z5pwh+Gdk1d@vger.kernel.org
X-Gm-Message-State: AOJu0Yztjgq7tqbCwVXYz3tU6Z5TWtDCudNm2U8caiNx3ew10IbFyl4M
	j4lKkd/K9aPaOPwSYNCLp641sqQLDZAIJVcbPseyTFsoh7/KJwEn4jVX
X-Gm-Gg: Acq92OFymEeuS5AzuCzXF7vYCDydWWN+MrdVdCAuKOdrD+nWnXx1CT+91AXePKwcwWO
	2zV4l5Nb2TVFqAHqnGW8c3GB/q5gjzX7RomMo5fw/dxmULIRbYCaKB2O90jeFvWcxRDn/wsO6UP
	Mji2NqoO5MwtNsw1TnLxD5bZpn6YdyZR7ibg2JEXfqBgJybOP5JJc19X3hzH6VLDUjTZ8YkZ23u
	TKeN7A+6K3M7ITg/m2p8/4cppXYTh9yUwC3qVFq26SSqrP3yMm2OmJ0gneqRR7xZXUIRip6shW6
	GgzFh7dDkZyVPy28E+QVTwWm3Okj7HbNwdWAx6NHOtFCajmsPYK7syLRG/TAJ9jmJrZmO+iaY+f
	sYBJhUuSJNHhLePSDdlYP3hUqdZNDXaxR6bkSnStry1p3WACjnMfWgSRLWpqeX93VM4Y2vIUvop
	YAuTdra5W3eERa2EZna2RpPO9iPMiC8drAKWLXOQ==
X-Received: by 2002:a17:903:94b:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2c1e85c736bmr283708325ad.33.1781089818833;
        Wed, 10 Jun 2026 04:10:18 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:10:18 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Subject: [PATCH 0/9] media/arm64: HM1092 IR camera and ASUS Zenbook A14
 (X1P42100) camera support
Date: Wed, 10 Jun 2026 16:39:25 +0530
Message-Id: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WS3W6kMAyFX2XE9WYU549ktFr1Papq5SSmpCowJ
 TBlVfXd19De7E9vkAz2Od+xeWsqzYVqczm9NTPdSi3TyAV8OzWpx/GRRMlcN0oqJ50MAsGIvgy
 4iX4AGZSIMUWSSgXsqOGx60xd2Q7J+4ePuq7xidKy63x2zPSystfy0dYMVCseXpfT98NKKyvyt
 f8lrjjjUAVtC407nLiBkCK53FkbgvIG757LiPN0nubHH4c8Lqk/pJQxyoAPEQATkZLGMWdog/T
 ZW5TUxais1PvUvwhWabEBiVSLEjvKzbMzeuucNzZYBX87/y+GE9EI7ls3MXIIwbmkFqBFXmrZ9
 b0EyYE4ZOVsezgbgzZgI7mcvw4X096nIIEyGHNwgAQdHwlkTsa1EnLyEtOfUy5r1xGiRsW2OnS
 +JTQtYsu70shjTN1F98VKmO+6zq/485NXMa7iDx5jAOXS3VTr+WXF5zQNw5kfB3TEymvkN2W5n
 Ezgv8V7SUmiT7r15AFiCnyRjOB9bpPjS6Xm4f39N7otzSKfAgAA
X-Change-ID: 20260609-a14-himax-hm1092-bbcbe0229afe
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5829; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=AeMf5Wr6Pe7z04trz/jF9RfVqQlRMCsK6v0jvJ8gVWI=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYM2l5gT0Awhq5dKGACM7kdseuFqcEgj2gyc
 pzwu1jPtKiJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDAAKCRAVlYpeERwF
 3oYxEAC5nHpEAyEA4fCAKgzeJ3lXKotkjbpCfMKRL1zBudNQMlIs/HN/H6t1AeZEM4KAJlukbyr
 Cf0bp+Clcv3fFxIMECzY0r7qGBa8BPsCFskwq5uUaTWeWSWwAbEXnIlhIE5xWZOy92UDR9rNICf
 Ozf87E/nTvTNcbyiX0/7cD03kS+Sxgg1uILpWdg4OP0QrM/sq/smE0utdPrII6qScg/ZofQPGIr
 vkasL+LeylBhPRUlIBKSsh+XKHtA95aKpGSEEH4WhBOXmFIA+W5KWofEFd6HFwez+XLa90Q3hhX
 fhD+NHC0QlnKCORmN16z3I09Ojb2ycpUuxMmJKxF4jRAckFsFbFFyxkZsVKoDnt73Xjo3xHlqKW
 lyArs1KCQQl7QxyQjB0zmiV+7TcpS/o8bZtqLIT7LcOGKkP7vh0qs2rosXKazXSmhjmjyamUYMK
 tonVC+6ztjPNK9zs28u18evTXJg799+tw7cL70XFcZfSUiSR9CeT4o9m11F26bNurs2ZMxVV+fn
 xWREw3eebSBnDuGAUIob+hIhzQ4f81vt+hAFxDJSG9WeMCO5eyDwj99fivDCDuc0rwzfoVxi2cN
 lI6LDH+LK2XP26lYxq/zgBTwA+/MfYcNNKmACnMcfIiE0AugLWSvInWnQLN+Km8aVGNnp+0LDcw
 8qC2h4Fbj7ir0hQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

The ASUS Zenbook A14 (Qualcomm X1P42100, "Purwa") has two front cameras
behind the SoC CAMSS: an OV02C10 RGB sensor and a Himax HM1092 mono NIR
sensor used for face unlock. This series adds a driver for the HM1092 and
the device tree to wire both sensors up on the A14.

The HM1092 binding, driver and MAINTAINERS entry do not depend on the
rest of the series and can go through the media tree on their own.

The remaining DTS and PHY patches are the A14 camera enablement. They sit
on top of several series that are not in mainline yet, listed below. With
those applied the series builds on next-20260609: the A14 dtb and every
module it touches (hm1092, qcom-camss including csiphy, and the
qcom-mipi-csi2 phy) compile and work: both sensors probe and stream
frames on the A14.

Prerequisites, in the order they apply:

  1. phy: dphy: Extend phy_configure_opts_mipi_dphy to support position
     and polarity (Bryan O'Donoghue, v1)
     https://lore.kernel.org/all/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org/
  2. clk: qcom: videocc and camcc for X1P42100 (Jagadeesh Kona, v5)
     https://lore.kernel.org/all/20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com/
  3. phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver (Bryan O'Donoghue, v8)
     https://lore.kernel.org/all/20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org/
  4. media: dt-bindings and PHY updates for CAMSS on x1e80100 (Bryan O'Donoghue, v11)
     https://lore.kernel.org/all/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org/
  5. arm64: dts: qcom: x1e/Hamoa camera DTSI (Bryan O'Donoghue, v3)
     https://lore.kernel.org/all/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org/
  6. media: qcom: camss: Add support for X1P42100 camss (Wenmeng Liu, v2)
     https://lore.kernel.org/all/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com/

From the videocc/camcc series only the CAMCC block (patch 6/6) is still
needed; its clock drivers and bindings are already in linux-next. That
patch adds the camcc node and sets the Purwa camcc and videocc compatibles.

From the x1e/Hamoa camera DTSI series only the CCI and CAMSS-block patches
are needed; its CAMCC block duplicates the videocc/camcc series, and the
x1e80100 board patches do not apply to the A14.

Patch 1 adds the OV02C10 node. It is Aleksandrs Vinarskis' work, carried
here with his Signed-off-by so the A14 camera support stays one chain.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
Aleksandrs Vinarskis (1):
      arm64: dts: qcom: x1-asus-zenbook-a14: Add on OV02C10 RGB sensor on CSIPHY4

Ramshouriesh (8):
      media: dt-bindings: Add Himax HM1092 NIR sensor
      media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver
      MAINTAINERS: add entry for the Himax HM1092 sensor driver
      arm64: dts: qcom: x1-asus-zenbook-a14: add HM1092 IR camera and wire cameras to camss
      arm64: dts/media: qcom: keep PLL8 out of Purwa camss hot path
      arm64: dts: qcom: hamoa: reorder csiphy power-domains for v8 CSI2-PHY
      dt-bindings: phy: qcom: add MIPI CSI2 mode constants
      phy: qcom-mipi-csi2: accept PHY_QCOM_CSI2_MODE_DPHY phy-cell

 .../bindings/media/i2c/himax,hm1092.yaml           | 118 ++++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  32 +-
 arch/arm64/boot/dts/qcom/purwa.dtsi                |  12 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  | 227 ++++++-
 drivers/media/i2c/Kconfig                          |  14 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/hm1092.c                         | 685 +++++++++++++++++++++
 drivers/media/i2c/hm1092_regs.h                    | 223 +++++++
 drivers/media/platform/qcom/camss/camss.c          |  16 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   3 +-
 include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +
 12 files changed, 1326 insertions(+), 29 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260609-a14-himax-hm1092-bbcbe0229afe
prerequisite-message-id: <20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org>
prerequisite-patch-id: 471e9403130bb3e65cea1d2365d75ef664662306
prerequisite-patch-id: 075fa72fba3c4f51138b88972e6a5e240038d90c
prerequisite-patch-id: 4edca361ad7d370a338641d1ebb5ca65b114a244
prerequisite-patch-id: 32dd1b55ba678d00088b376e33e12d9da6241aca
prerequisite-patch-id: 24424189b11acee204622997908d85a0efbb2503
prerequisite-message-id: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
prerequisite-patch-id: dc660c63d4382e84af51241381727954bd5ed013
prerequisite-patch-id: 237410e8df475d80bede4590288b6b053b1483e5
prerequisite-message-id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
prerequisite-patch-id: 6e8e67cd3ab96a602971bbeeb7dfdeaf3f1426a2
prerequisite-patch-id: bbf431fcabc17c30fa5e804eb4accb8275198b37
prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
prerequisite-patch-id: b6b6c4e7a5818e1b93fe2758902bd32d2be48509
prerequisite-patch-id: 4f11e3d079a484008a03ce750952d6e2933c0253
prerequisite-patch-id: 5f5504fd7b5eee72c3fb8c045fa57219fd2f0456
prerequisite-patch-id: 570b65b326f4c684d813f6ebeda152378dc2a47f
prerequisite-patch-id: bc5b9321c124abd961ae1f60610dc46701dc80ac
prerequisite-patch-id: 6d36feaa3a210039f87ea47aa74423a670260fb6
prerequisite-message-id: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
prerequisite-patch-id: 9430f9db2ca3486da39606aa806db3c1973ad2d1
prerequisite-patch-id: d90c86fbd38851530f9480562647703c32a86a91
prerequisite-patch-id: baa498638bf0da1bdc25a3c5e827c351d3b78e79

Best regards,
--  
Ramshouriesh <rshouriesh@gmail.com>

