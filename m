Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F8314B76;
	Wed, 15 Apr 2026 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776251828; cv=none; b=stwHI53IeSOa73TKKs0/6ldlP0WiIDMfwTd7tOp7GGthoIfAyGhEkKJZdZLZs/xqGOfecPdk8I/1pG0S93qEEIgfWp/Cza+hXmxSUunntWR0bFdbntV4YHpmU44VfEDzrKiCqSvzdrWxkFxQEQakkly08ZuadtupgjQlLPwdZ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776251828; c=relaxed/simple;
	bh=QZzNdEfcIrynyi5Gz/PNV6yy84jWoGk8vSGZr4vkPQk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WCuW0zgwuidUjTFYxYC/vZ0zi7NN7idO5J/UDy+A6bKCVvzvKn3Ec6JwBWqsDYvA6QWnqJscU0Ko5GHC+3lgPJbWldBnsweVAGPdk5dGYL9IRe2OpW8HrE6aBw5KsSXpOkfXMGDcncDRpfFUcOL6PyuZGfnjLjZHJcv0oqFVB9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=umQSsiTB; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="umQSsiTB"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776251822;
	bh=QZzNdEfcIrynyi5Gz/PNV6yy84jWoGk8vSGZr4vkPQk=;
	h=From:Subject:Date:To:Cc;
	b=umQSsiTBI6T52/AgpmhZeyrR2Lt5cz9JorbekwHyrrg5vXzhUkjUn5yxrQedKX+P1
	 DktcwC1pqXcWxWIHOc7WtBvHSDF2ZORjpGiOl6sSNF4a6uLXS1uTMfGCbQ5C5cIrWq
	 hbaUdbt5JFfxrL5SyLNqBMrLz1r6ZYVJ90vipo2o=
Subject: [PATCH 0/3] arm64: dts: amlogic: t7: Add UART support and enable
 Bluetooth on VIM4
Date: Wed, 15 Apr 2026 13:16:12 +0200
Message-Id: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrDIBBFryKz7oAaaSFXKVkYnTQDVVs1IRBy9
 0jT5Xvw39+hUGYq0IsdMq1cOMUG6ibAzTa+CNk3Bi31XRpl0HqP43uhmlKdsT5w5WBwkopk5ww
 5baFtP5km3n7d53Bxpu/S8vWSMNpC6FIIXHsRaav4v+hgOI4ThDkWfpgAAAA=
X-Change-ID: 20260414-add-bluetooth-t7-vim4-f01e03c4ec2a
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776251820; l=1500;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=QZzNdEfcIrynyi5Gz/PNV6yy84jWoGk8vSGZr4vkPQk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDAMs/E70REmDue+8UqHgoZ5kt+XUuMVmChc2pxpgCZKh2Y44H8OKwb7msGtpJJybnohHBNwSsU
 w9TsT3a6k3Ac=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs

This series adds all UART controllers for the Amlogic T7 SoC and enables
the Bluetooth controller on the Khadas VIM4 board.

The T7 SoC ships with six UART controllers (A through F), but only
uart_a was previously described in the device tree.

  - Patch 1 adds the pinctrl group for UART C, which is needed to route
    its four signals (TX, RX, CTS, RTS) through the correct pads.

  - Patch 2 completes the uart_a node (peripheral clock) and
    repositions it to respect the ascending reg address order required
    by the DT specification. It then adds nodes for UART B through F,
    each with their respective peripheral clock.

  - Patch 3 enables UART C on the Khadas VIM4 board and attaches the
    on-board BCM43438 Bluetooth controller to it, with hardware flow
    control, wakeup GPIOs, LPO clock and power supplies.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Ronald Claveau (3):
      arm64: dts: amlogic: t7: Add uart_c pinctrl pins group
      arm64: dts: amlogic: t7: Add UART controllers nodes
      arm64: dts: amlogic: t7: khadas-vim4: Enable Bluetooth

 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 19 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 73 +++++++++++++++++++---
 2 files changed, 85 insertions(+), 7 deletions(-)
---
base-commit: 6aa9edb4f8266cfb913ee74f5e55116550b5574d
change-id: 20260414-add-bluetooth-t7-vim4-f01e03c4ec2a

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>

