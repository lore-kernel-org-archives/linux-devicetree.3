Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C682F6920;
	Fri, 21 Aug 2026 03:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283067; cv=none; b=iOhe/3Xarb9cTsAd5wbjpg2W3bQRiyoM5KP0DjgyghRqqh/HGbmibfKLtHVW0rCsHt3TXm9aLyZD/ixG/3UfwEHE9kNPv2lNB3QtrfYs1qi2DP02LnulafTr7HNG7tqTEcCpZoCXusg+mzHsDu/JE1/NJ9PHkdsBWGAg18luHwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283067; c=relaxed/simple;
	bh=WAC8HoHNYKxMHCI8Y2HGtVY5YOrtLRnmQDfXMPbbPN4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tXsoIYKyREEV6piVtL8GpS8zIwoNa7oSgTb0V0c16pL06fqSQnKZYh2xCduaUa/saYFDWRpbzt5l1HQCF44pACbbOeWz8dOKcibc6AOo/8V3ClbzXcufb/2e+rCZTI2htnp88Qg1DQphK6BqqvIgNpgZ/tDZJGnFTk+65VumuMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGUKdtBj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGUKdtBj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35D44C2BCB3;
	Fri, 21 Aug 2026 03:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787283067;
	bh=WAC8HoHNYKxMHCI8Y2HGtVY5YOrtLRnmQDfXMPbbPN4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EGUKdtBjk1XrVE4fpV4rZIGDUj4grtG4+PeCZ/tQ3cQVKMnhZfy1xO6P54PSYovDx
	 DhI/kGTUa7aDXA73uHZ68kTOCwMXYo+aBriJb84rM7ssbBcOqhvjdKSW3gF6l8io6V
	 D+obrIldtP7Z2BWd7BT3L3Q4iHVfPKyOOKeD6LjQNLjAjBXVYZFAejRwWpIRrsxrgU
	 vBpyl3ttR4ahC1xHXsjiKCHHptWjQB4lCcHWPNGpr9F2AtaJ8ERr528/i9yxX+MKjT
	 BUVKSYZZSWH1n3YjMkdiKjzOA4rFoXrnY5wwh73rgdHK4ffmGrPaCCM47WMnVCiQn+
	 6CEcsv0pR14Gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBB4C5DF88;
	Fri, 21 Aug 2026 03:31:07 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: Support Retroid Pocket QCS8550
 Devices
Date: Thu, 20 Aug 2026 22:30:45 -0500
Message-Id: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22PzW6DMBAGXwX5XFdrG6+BU96jymH9l1gqkNgUN
 Yp49xoitZceZ6Wd0fdkJeQUChuaJ8thTSXNUwX51jB3pekSePKVmQSJ0EHH843fXem0Bt5p17U
 GIWJUrD7ccojp+5B9nF+cw/2rOpfX8U9ZC7tQCsPpMf0aBTowFpUPEoe136WWSuBuHse0DI0B0
 5OQ3mhACyZaraxuCbG1kbyO1FuB3gDb89dUljk/jmmrOPr/rVgFB06aFGpLyjt9uoyUPt9rk52
 3bfsBllmdICMBAAA=
X-Change-ID: 20260808-rp-qcs8550-85c84760f6f3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787283066; l=2423;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=WAC8HoHNYKxMHCI8Y2HGtVY5YOrtLRnmQDfXMPbbPN4=;
 b=jdvKX4bWVAKo1Hf191fcdLt3KqEBrLuygQRWG6y5a7Hl/g0dakqcORmx8iiv0bWXq0YO4c9fX
 /5av54g9FtdB9Irru+mpm5g5udQKRFvi2IgGhYzAilb9QLlaxgFwCia
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This specifically includes:
* Nova
* RP6

Retroid Pocket is effectively a sister company/brand to AYN. They are
both under Moorechip and all hardware designs are handled by Moorechip.
Thus the electrical designs are largely shared within a SoC generation.
Hence these include the AYN QCS8550 common dtsi. As such, this series
depends on the AYN QCS8550 series [0].

These two devices are almost electrically identical. The only notable
difference is the panels.

Definitions for parts of the hardware that are not yet supported by
mainline are not included. Such as:

* Panels
* All rgb leds
* The built-in uart gamepad

[0] https://lore.kernel.org/linux-arm-msm/20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com/

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v2:
- In patch 1, consolidate the new devices to the existing qcs8550 list
- In patches 2 and 3, make regulator naming consistent
- In patches 2 and 3, move the mdss_dsi1 node to the correct
  alphabetical location
- In patches 2 and 3, fix some style issues with pinctrl references
- Link to v1: https://lore.kernel.org/r/20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com

---
Aaron Kling (4):
      dt-bindings: vendor-prefixes: Add Retroid Pocket
      dt-bindings: arm: qcom: Add Retroid Pocket QCS8550 Devices
      arm64: dts: qcom: Add Retroid Pocket 6
      arm64: dts: qcom: Add Retroid Pocket Nova

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 118 ++++++++++++++++++++
 .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 122 +++++++++++++++++++++
 5 files changed, 246 insertions(+)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260808-rp-qcs8550-85c84760f6f3
prerequisite-change-id: 20260217-ayn-qcs8550-16c07b63de26:v9
prerequisite-patch-id: 17ba304f7a8a08cc78f98e198db9c51f4786a22c
prerequisite-patch-id: 21873631f5dcdb9bbbdb5c20c3f5e9816cc405f9
prerequisite-patch-id: bf7b5dea0097cbbdf04929a4246d1fc65c607ea8
prerequisite-patch-id: d7f546eddc96a4f31a1e681abddbc96bd68abb32
prerequisite-patch-id: d40d784ad8efbb1204c024408be2067725a06cf2
prerequisite-patch-id: 25bbd55199a8250a912ef542b31f43dd5ccdbc90

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


