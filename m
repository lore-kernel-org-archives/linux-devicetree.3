Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A821038C2B4;
	Thu, 16 Apr 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776329715; cv=none; b=ot7dEDPTaDxf/U670ld5/OTgex/vTay6PK3ZVd9JaRUY5whG8ZyKZXbV/4Iot12cUwJ40bCUrM+JEVXtImm6TIDCcxlLkxRZ0mlnBV4ZmZ/QY8KuSlt/3/B67nGvz9ODg/g6O5pCoXPIzV4unQuBmH+pP9Ov+uUAw1sEAt+l1DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776329715; c=relaxed/simple;
	bh=0AnzjODYKSvj6YY8pPamvrp8pomTzD/WgVtAmSE50Aw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B4sqieRG1iki8nJ3SqDiABKQJw8vKhPv7mEcoRDAlH6FLHQG/FTcqi/erfXfEAUQhBwCYOyalDQVTJ85HjZZMZCfpadayWyuITOVa7nuyMpeO4EuDgvA5OCWTL5vAaa3I1CSzdoxl991hVEF5ipug87hBCT/jqAZXeuPL001n8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=kClKD4jh; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="kClKD4jh"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776329703;
	bh=0AnzjODYKSvj6YY8pPamvrp8pomTzD/WgVtAmSE50Aw=;
	h=From:Subject:Date:To:Cc;
	b=kClKD4jh624GykVfDnywccZMKG1f9OaQF9hoanGAJqYXv5w/Qs985aEl6y3vJ8+u5
	 Typ4PhPxeUEB/h3jH5PkbBmtr1xfctmduEYshklW6bGzH09uYI++0Rsxu3uAdl3sUc
	 vtA8Pb3wU48kXE67WZdIdKy1eOPX33SyUKcBc88w=
Subject: [PATCH v2 0/3] arm64: dts: amlogic: t7: Add UART support and
 enable Bluetooth on VIM4
Date: Thu, 16 Apr 2026 10:54:39 +0200
Message-Id: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0Jm7Zi2VEhYeQ/DopRBJgGqbSEYw
 t1FYOvy/cn78xcI5JkCFMkCniYO7IYN1CUB25rhScj1xqCEyoSWGk1dY9WNFJ2LLcYcJ+41NkK
 SSK0mqwxs7stTw/Pe+ygP9vQet/p4hFCZQGhd33MskoHmiOeLFH5CyyE6/9l3TXI3zvvtz4RJo
 kBRGZHrzFpZZ3fTMXXXxkO5rusXTM/sWOoAAAA=
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776329701; l=1839;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=0AnzjODYKSvj6YY8pPamvrp8pomTzD/WgVtAmSE50Aw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QK7L8feog0r9OwoBubcH0DzrRCO4DZaT/fDtCUbOaRPTMmWvFr0YxYvpnesLJq48MZUcmSp5ecr
 6aOXtgU6mYQ0=
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
Changes in v2:
- PATCH 1: change underscore to dash in pin node name,
           according to Xianwei's feedback.
- PATCH 3: remove clocks and clock-names as already defined in DTSI,
           according to Xianwei's feedback.
- Link to v1: https://lore.kernel.org/r/20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr

---
Ronald Claveau (3):
      arm64: dts: amlogic: t7: Add uart_c pinctrl pins group
      arm64: dts: amlogic: t7: Add UART controllers nodes
      arm64: dts: amlogic: t7: khadas-vim4: Enable Bluetooth

 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 21 ++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 73 +++++++++++++++++++---
 2 files changed, 85 insertions(+), 9 deletions(-)
---
base-commit: 6aa9edb4f8266cfb913ee74f5e55116550b5574d
change-id: 20260414-add-bluetooth-t7-vim4-f01e03c4ec2a

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>

