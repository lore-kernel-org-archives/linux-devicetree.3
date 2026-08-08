Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADFF306B3D;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786210676; cv=none; b=ZJuYnaINx7+r40Ank2gtQBYdERjHgYIRmU3IrAam1KQrkSpT5yTEoynn6pAXyLvmOasOYUPjmpQYVfKSgnFGoCK7xQbryV3odXJz3ZIQnqIocNGs3g/+n6wdQrkalzlQqoXXoZE+ZiKAe4f28jFOfCKsQhu1+mlOfw/4rDteyIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786210676; c=relaxed/simple;
	bh=27tysQzmhqKS8l8YSeWyCV+TkFM43ioVx0RKLrpV9fY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VBVEY24ByJOULPF5JPnU6fiGkgEkHiv8Ss9cQo+0vBzZGRCo14AYJuENyGQ2gk9JSEq8taApvh7+7c7E/Rr4v0M0/cuJkzYkSW6djb+4IqON/gFsCd2zfxE6SZ1NyDAscKcK6spnsMJT3VM9jVaTklbptzviqwCl/RSUHChqQAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIUJi8vW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIUJi8vW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F735C2BCC7;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786210676;
	bh=27tysQzmhqKS8l8YSeWyCV+TkFM43ioVx0RKLrpV9fY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RIUJi8vWw9w5pIQr/Q6/ClIv1/PhcCo38djl5SszA2Apg/syEUuX++fyMqXZOoLSt
	 MY+0ScMKRvUgZVsHAuTZmNdrJjFVxML74c59ppdVkvFHB+g6bFhRfVwoGjEKtyvavw
	 FeHZRrFhEHISxf2hDdk9WUsuoFzcpp0MkMmeUbeepLapkYentbV/DcbJ9XJebVhQel
	 XcO4Unrr1fAU4lBvNO9xW9jcyrh+0KaaAc2SSUQt6vpti12OLwelOJ93GWX8vz3amO
	 Yx8o6JDbwKLOQd7lnmSO4HFnSvkL1UTTILNPG3TaVu7K06nFCNxefEOH1wYMSREqFT
	 WUe6HYjpjZN6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB1CC5AD2C;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/4] arm64: dts: qcom: Support Retroid Pocket QCS8550
 Devices
Date: Sat, 08 Aug 2026 12:37:54 -0500
Message-Id: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0XMSw6DIBSF4a0YxiVB8MLVrTQOAC8tAx8Fa9oY9
 16rSTv8T3K+lWVKkTJripUlWmKO47BHeSmYv9vhRjx2ezMppBYokKeJP3xGAMERPFZGi6CDYvt
 hShTi68Cu7dmJHs/dnM/xTzbFAcrScPsefmKpvTBOq46kbpb6izqbifux7+PcFNqhRxugrDqj6
 k4oBQHA1A4QSEhnHaE10rB22z5UHri32wAAAA==
X-Change-ID: 20260808-rp-qcs8550-85c84760f6f3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786210675; l=2028;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=27tysQzmhqKS8l8YSeWyCV+TkFM43ioVx0RKLrpV9fY=;
 b=752qTLjiSPU8kLMk7N6NT+WSY/iPYw/X22NJAhTA3xcKKYTvzHIE1BoG5GRxKtElhA8lFbLXC
 EmeSIyXk7c/Afn/RF9Lb6Bx33KtHQEIj4V6AhYvVTczZiKKmCT6rEUL
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
Aaron Kling (4):
      dt-bindings: vendor-prefixes: Add Retroid Pocket
      dt-bindings: arm: qcom: Add Retroid Pocket QCS8550 Devices
      arm64: dts: qcom: Add Retroid Pocket 6
      arm64: dts: qcom: Add Retroid Pocket Nova

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 118 ++++++++++++++++++++
 .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 122 +++++++++++++++++++++
 5 files changed, 251 insertions(+)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
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


