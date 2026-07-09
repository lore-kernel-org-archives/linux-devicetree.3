Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85713E6DE0;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585613; cv=none; b=AtZW+CF5hU78uiS/rEUeB4cwzmTyzOV7hEAjpAI3xrf0pLZQqWAkx4PwPlyjs7IMG/IQuXoRd0lXTpGFS2MHaQgRz1RRUA0oNHcdn+HUya6Rvmlhgmqajmx5adjM6dOxoeCR67I1/PYrv+VCm3yWrXIIuinv9g7HbQ0+DonDzwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585613; c=relaxed/simple;
	bh=H3w0l7hrjjW6pdWG0bib0lwIpaQgQQxF1dBATULlBpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FT7qBM6sGVhoOllqpdZjtI2eqLhu2uHgLw8gjSUFsfa5/B0KkY7JsQWz4nt4WkZtKVS6iD/3ByCpQStf2rnFpO8JtOAVixIEXYCiA8xi1MjHBX0MMEw68Mbdd5FUYu19E+CI0UHhBDKKB+TFnZx0gRjY6nj9C87qK2jMiwMN1ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmmhD2Zq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmmhD2Zq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CC88C2BCC7;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783585612;
	bh=H3w0l7hrjjW6pdWG0bib0lwIpaQgQQxF1dBATULlBpk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mmmhD2ZqmLsQssTB6R9fn+yETQFaJ4/weHKnnXgWXewI6nAF7nvGgKSL/ko3rh0EU
	 EmVlPAPpnPnxt8TA7ltnWMsI6FiNI9h/MKL4FpmqDPheIBMi8gDaZvhRYRhKcpMmkK
	 Dz0wki97eGPxp9FuaVdoCploB/+qCPJAQm3kMJF2XVNxyxkETI3aDwAF2Gm6sYz2/7
	 Tnn39xAKAWFzciZEd4wWxSExiISVoCFIndKsCzGlUENB/tQQM1BJne7B4tbTNAXdAB
	 hEZrru9qPOUDzILMrPpy3PV72cLAKMSc9P/pFP0dNvjF41dxMQ01iY1913mwNZG0kD
	 3Mi4MLqAUAz/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E98C44503;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] reset: support reset for Amlogic A9 SoC
Date: Thu, 09 Jul 2026 08:26:47 +0000
Message-Id: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdbT2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwMz3URL3aLU4tQSXctkY8tUi7SUJAOzFCWg8oKi1LTMCrBR0bG1tQC
 MfgGxWgAAAA==
X-Change-ID: 20260706-a9-reset-9c39e8fdb06d
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783585609; l=933;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=H3w0l7hrjjW6pdWG0bib0lwIpaQgQQxF1dBATULlBpk=;
 b=dKYqDjYW0xtchgfDyokC7WrSeQ1iXnOt2qN3/i3l28AB/hNGg8tUAE9McgzMVqe7fT5ApDir8
 Xa/ZDc6NLucCYu4hq/u+kBIe30tg+1iQR3B2nYbX1OLRUkhAN1qrt7W
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Document the reset controller compatibles used by the Amlogic A9 SoC, and
add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller, and add reset node for Amlogic A9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: reset: amlogic: Add A9 reset compatibles
      reset: amlogic: Add A9 AO reset controller support
      arm64: dts: amlogic: a9: Add reset controller support

 .../bindings/reset/amlogic,meson-reset.yaml        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h     | 247 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |  14 ++
 drivers/reset/amlogic/reset-meson.c                |   9 +
 4 files changed, 275 insertions(+)
---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-a9-reset-9c39e8fdb06d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


