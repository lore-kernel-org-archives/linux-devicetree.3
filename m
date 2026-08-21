Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42644330D25
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315230; cv=none; b=oBudmGuKYWdVk/JgIzhbJJ+z3D+wVfgYueQlrggUCLwglSXsEiW6IMSCeQ7gCd11F86PwGUxS6H185Y6ysBiqBprs1sHVrob0fECETg3kic9EKgVpMvd7Vl2TeBWyBAYYakYANcl7ioi0utcSUUk4s+0gUxL3luWfW4zDDDlOic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315230; c=relaxed/simple;
	bh=MSZmz3ogoTTbq2SvL9a0p+hrLN13bkrV1NENG+7L1QI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jk9SKXW+kT+tzTqUD3JKc/jlAI0+Cw3yrysru9dk6err4FkZY+ge2woEQG75kMNm28IYdXEQv4DpFBi+1HVzuSsXMTPqZWeYDFzXghHvna1MJjpTKnD7KInaC2DKg84PkVkfK+beZUOHPhPJimkKb66P39mJUNun8asGqil6WtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Flr+c4Ma; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Flr+c4Ma"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so2007274a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315226; x=1787920026; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7J4KlWaMeDIJAUzjbu/18icyGppSzee+FADTJNXVjCs=;
        b=Flr+c4Mar1SIbQQRL4h1b2LCLffbx3X5wQLLVs4WRmbqQENXYDtCX7NwVHR+lqXGP/
         6jxXCE8XZqOeD8+gvbcdb3fg7IOFhAKT8avIToBacFAuv8AugFXiYswSTK8NTHHMJ48O
         yawiotd6Vq+34z/bxVlm1m6e5DJQ0H3+ZvZKBDhFHE5brqGt3+oBJhZGC0plueL2+TeE
         UvBXdkUOO4GpwF2hN6qMMZS6SP3UmybA7rSn429jOFr2ErxE/MOH6/+IryQobR4GXIZ6
         fzq5sefT0+l9K11kmwzRQQMw+b/N1434SD7mevHBIuA3oKp4c4pQ6a8mwY/QMpmaU+KL
         nGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315226; x=1787920026;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7J4KlWaMeDIJAUzjbu/18icyGppSzee+FADTJNXVjCs=;
        b=a7+2AAJ/biF7ZELRMB9ZJvxIuj58QW9mEixWTHJMHpXhgNtU/V/J02LUcO77OpcEhN
         4Rf1+d9fFWb7rzIF6WEc2TRpSC4th5d2hZ+Nh2a57WOw33eYQgEA6mDE2Ui1l2WKcUfo
         3jo9efcaB2li5c9kb6/7vnJ0SqxBi78GEpJyLrqsd1rWEIsF/uCg0GcCW0Z9Qn035Tk4
         bP+oUvKesGA+QeSZg7D5nmiIK0krLQiM18n8V1gv/4z1/aRqvLlBCO0iw+PJEdVLa+2n
         T0c13gHpAQf6c56bYQtREReg537qduWUxJcnbeI2Lbtkst0lzDV/xIm6FCwQqSf7Krsf
         drCw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5pOZRthYKPZ68hS/zCpUUiGIOS/UtqNxTRLDc0Y46yLqWPQAe7HaTjbeXf6Eeyph29XBhsdDr+VJp@vger.kernel.org
X-Gm-Message-State: AFuF++maoSU07Ga5VYKF2czjsq38o4x3qnhygtKNfDxDDD78aeTtpOSP
	7nyQeonBa3AGhAQhOAWKAU3veHgKwkHUtOntHI+f4NR0ovr5Iw5rvLNK
X-Gm-Gg: AR+sD10tyYRjT5HYc6O9NTTVJKakHzoSjP7aDwTx/pZklUyLQw/4nBEi0RmZYmMbIGD
	b2W6/yzmXqpSRCt4SYeXLNjqS5U41eLLTjmMoP33UJu8a0+GfBLMgXYmjE9ixE9QbPHf1lurvOi
	6vQFkLXp1iuFxsvtT19V6cMr+U+YtgmWTppX05DCokD75a8sxy+O8mlshdVTWa0E2FW36pQDpMw
	EK6Fz0QevWeofAN917ETo3tweJ8s56zTa4h6NdyIa9BYewXwfAEhQZ7Cf4EhLT9Jw2c4AtdaPNr
	K+VtUAYy7cCHRCCJesl1P5NZtlKxeWN33Wiki5k4Dbdh8JDDkq3qo0nYCVRvN3QGTM8Nc5damNp
	7faXEiIFcEe13jHEHRNBVO0zieD4S4Ei6lYF08/i72U/8jym6kLKE/WeBtIhf6DAT0TrkW3gOCV
	NTM0T1c4KAB+OUzCqO0kHCWVXlxj6qI5EFCogufVOX7DcXDtsqnNDZoQne4Bj54tL8PZzQPK6lp
	B/D+jn4wOEOdPsVego7je/Z5do=
X-Received: by 2002:a05:6402:2b91:b0:6a1:fd13:48a2 with SMTP id 4fb4d7f45d1cf-6a42f238138mr6885248a12.15.1787315226416;
        Fri, 21 Aug 2026 05:27:06 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c315dsm6220262a12.9.2026.08.21.05.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:27:06 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Subject: [PATCH v5 0/7] arm64: dts: qcom: Add 3 new devices
Date: Fri, 21 Aug 2026 14:26:59 +0200
Message-Id: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ6CMBAE4FchPVuz22ILnnwP46G0C9TITygSj
 eHdpXpREj1OMt/MgwUaPAW2Tx5soMkH37VL2G0SZmvTVsS9WzITIBRkCLyl28h7M9qaAlfGKYc
 AWhtgC+kHKv3tNXc8vXO4FmeyY9yIjdqHsRvur78JY+/H9IQcuM6N1rnTCrU8VI3xl63tGhanJ
 /GBxRqLiFGCUxlm0uVrLD8xrrBcsHUqLSyVigSucfoPp/HZFCAsuJSKr+d5np+nNz+WcQEAAA=
 =
X-Change-ID: 20260810-next-patches-6ad6d10077a0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Introduce support for 3 new devices:
- Motorola Moto One based on MSM8953
- LeEco Le2 based on MSM8976
- Xiaomi Redmi 9T based on SM6115

Device trees besides enabling most of supported hardware also wires power to
subsystems like MDSS even if those are not enabled to lower maintenance burden
on out of tree forks.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
Changes in v5:
- Leeco Le2 fixed lacking -supply on map added previously

- Link to v4: https://patch.msgid.link/20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com

Changes in v4:
- Leeco Le 2 and Motorola One fixed-regulators aligned to schema
- Motorola One commit msg reworded to drop touchscreen
- Leeco Le 2 added lacking parent supply for rpm regulators
- Redmi 9T makefile placement fixed to be after other sm6115 device

- Link to v3: https://patch.msgid.link/20260821-next-patches-v3-0-cd64bcef6e21@gmail.com

Changes in v3:
- Motorola One Touchscreen was removed as it doesn't work
- Leeco Le 2 gpio-keys node name was fixed
- Leeco Le 2 volume down key via pm8950 resin was added
- Redmi 9T Reviewed-by tag was added
- Adressed more Sashiko-bot warnings

- Link to v2: https://patch.msgid.link/20260820-next-patches-v2-0-7130d68183d9@gmail.com

Changes in v2:
- Adressed Sashiko-bot warnings
- Added Krzysztof's Acks
- Dropped confusing link from first vendor-prefix patch
- Removed ramoops nodes from Motorola and Leeco patches(now handled via lk2nd)
- Motorola One USB-C connector and FUSB302 is now fully wired and enabled
- Motorola One Touchscreen has been disabled due to panel power dependency
- Motorola One debug memory regions were removed
- Motorola One regulator setup values were ajusted
- Motorola One NFC now have more specific compatible
- All devices now have described reserved GPIOs and trimmed unused ones
- Leeco Le2 added missing pinctrls for peripheral IRQs
- Leeco Le2 OTG is no longer enabled as phy dependency is not enabled(need rework)
- Redmi 9T USB-C connector now is fully wired including pmi632 setup
- Redmi 9T nodes are sorted now
- Various changes to styling to keep nodes within single dts consistent

- Link to v1: https://patch.msgid.link/20260810-next-patches-v1-0-79a779d76173@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Adam Skladowski (7):
      dt-bindings: vendor-prefixes: Add LeEco
      dt-bindings: arm: qcom: Document Motorola Moto One
      arm64: dts: qcom: Add Motorola One
      dt-bindings: arm: qcom: Document LeEco Le2
      arm64: dts: qcom: Add LeEco Le2
      dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
      arm64: dts: qcom: Add Xiaomi Redmi 9T

 Documentation/devicetree/bindings/arm/qcom.yaml    |   3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts | 440 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts      | 442 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts   | 497 +++++++++++++++++++++
 6 files changed, 1387 insertions(+)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260810-next-patches-6ad6d10077a0

Best regards,
--  
Adam Skladowski <a39.skl@gmail.com>

