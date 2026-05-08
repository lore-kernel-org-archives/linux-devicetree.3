Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17962372EE9;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225818; cv=none; b=WtHMQ014RXcI6Yg63nEMTalLsYqvKOOUAkcnCfhWeLioQIZfOz6nnnnmPnzCHJ4V7lmraSRMkfOcOSqYK30FDp/bdJAexE/MR3BKoqkmnYqW6VnbYirJbnN3NgaeYW8HEGzg+6cQSEO/Mm4xcGNYC5Juhs/H72XSdrPwo/Q08I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225818; c=relaxed/simple;
	bh=A1soFdD0r4US6yDMTZRbjriVCP7JZmrk16cvvRa11AQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vGCPDLsxjNrB5XKhWSp6IsehIEsQ9qifpww2Hg2N/MJuaf4RGO3dTK3bm456Kth+OfvnTESl4I0eYRxzX7aG0/PaVjf60x3sRzsooiysDtBsM3Jph9XLPZhgyDqWw7oluWIV9sDJvTdDYpyZ3GSAHsNSl5sUUoXph4XRJSnYXIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLFgS0Hp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLFgS0Hp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6436C2BCB0;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778225817;
	bh=A1soFdD0r4US6yDMTZRbjriVCP7JZmrk16cvvRa11AQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PLFgS0HpeE73xaapfPE9ZIZstV7g1gJbLXd/5wWn037YpvP7EbvHJZfNbhrUodb92
	 SVCtEXcg0qEASex8bNDV7ztUhwyF/Xp1MLGpA5NmTB4CmBhbcs9AokSo7ESHn/xeix
	 fgM+QdkMWl6F/Ehr65c4dPXqhhKA28ayabPG2HrSoRmuRkt6V5CMnupER/aq+8W18t
	 yjBGYkb/o4/Ejp/CAkJHsCZ63+MvTaNRbuCthyh7ZuoeFT3PoQtHgO6HN2VrupLHO8
	 0J6BdxEKNDgEQTHc9GQZUaOPX5Hl7m8OXmAzuCrbp+eldo/cm+r52s0UNZ+lxJKLJA
	 3fwd/1LNb9+bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E74CD3447;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] irqchip: Add GPIO interrupt support for Amlogic A9
Date: Fri, 08 May 2026 07:36:53 +0000
Message-Id: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWS/WkC/x3MQQqAIBBA0avIrBswKcuuEi1Ep5pNmkIE4t2Tl
 m/xf4FMiSnDIgokejhzuBr6ToA77XUQsm8GJZWWo5zRGjwiB+R0u5Mj+kmrfiBnnPbQqpho5/c
 /rlutHzYDPXxhAAAA
X-Change-ID: 20260508-a9-gpio-irqchip-d76214ec9c6d
To: Thomas Gleixner <tglx@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778225816; l=772;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=A1soFdD0r4US6yDMTZRbjriVCP7JZmrk16cvvRa11AQ=;
 b=PUTdu/0oehvaqyiIMJg5q4YOtOBv59FaV+RpC//iZQ+5aZeSr4vf6dcdVuwfqIsiVqReLzPDw
 OKi3Ww8/M0fBXQg4RCaMvXhk4co7hps3vShnklLRi4S2usQtF9OByqP
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Fix one error about reg address when set irq type for S4.

Add string of bindings and driver to support A9 GPIO interrupt.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      irqchip/meson-gpio: fix incorrect register address
      dt-bindings: interrupt-controller: Add support for Amlogic A9 SoCs
      irqchip/meson-gpio: Add support for Amlogic A9 SoCs

 .../amlogic,meson-gpio-intc.yaml                   | 21 ++++--
 drivers/irqchip/irq-meson-gpio.c                   | 78 +++++++++++++++++++++-
 2 files changed, 93 insertions(+), 6 deletions(-)
---
base-commit: 8b379d5e9eb7933c73e77e768d95f11ef2833c26
change-id: 20260508-a9-gpio-irqchip-d76214ec9c6d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


