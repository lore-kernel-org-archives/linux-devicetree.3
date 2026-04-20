Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B1B39D6CF;
	Mon, 20 Apr 2026 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776686313; cv=none; b=ZfXEnOjWRhqlGPC5VdkD+hDFrMHaOGmeoh5xhbr1t+YPWglfafh2vTt0NVUaAqcGbUm1lMrLuAEzP6OM6fdTPYsR54CN2422iAV7dpphW2uk5SQg0DBfZ0i/7iSgTVDmgeLLWpg6nCUVBNpahWOHmgKmedRhkQiNgLchprVmSRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776686313; c=relaxed/simple;
	bh=YtSJSMn/IVKEwUmUG4/Nu1r030hOOMaWchctzjmW4vw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Otg4TjAZON0ahY6e2NYPaBLvoVPKdST4Nh93jxsjtfwaXlLtgp85aY74mXSCSpIcrz5wcUEBe2P3HIXZeiJ/woHMkYKO83gTJHqYR5LhGCETiAZS/t/kjyJtRtHASJ2eulhlvGDibgitYvdMzNO0VhJearRCEvYTRThQou91+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=hxhLqbZG; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="hxhLqbZG"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776686307;
	bh=YtSJSMn/IVKEwUmUG4/Nu1r030hOOMaWchctzjmW4vw=;
	h=From:Subject:Date:To:Cc;
	b=hxhLqbZGw4d6dABN6qxYWcIr3qosAEMECxozQ233TNyYNx1vYB8FGe5KBEDVQOt6o
	 0bmxQKWXFbcNjC4PW6ULjof9aUUPeBnGF2c3JgbKvai4olyd7f7KPICsgoT34FC17O
	 zyCN9O6hnEeUSKSQGOdg7Ogex7tt0fjYc1yQF0vQ=
Subject: [PATCH v3 0/4] arm64: dts: amlogic: t7: Add UART support and
 enable Bluetooth on VIM4
Date: Mon, 20 Apr 2026 13:58:08 +0200
Message-Id: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOQY7CMAwF0KtUWY+Rk6btwGruMWKRJi611DaQh
 AiEevfJFBZsWH5b/9kPESkwRXGoHiJQ5sh+KaH+qoQdzXIiYFeyUKha1FKDcQ766UrJ+zRC6iD
 zrGFASVhbTVYZUbrnQAPfNvf3+MyBLtfCp+dQ9CYSWD/PnA7VQrcErxO1+C+MHJMP9+2vLLfGa
 998eCFLQMDeYKdba6Vrf8zENO2GsIFZvSPtJ0QVZG+aDvffg8OmeUPWdf0D+67dBC8BAAA=
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776686305; l=2335;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=YtSJSMn/IVKEwUmUG4/Nu1r030hOOMaWchctzjmW4vw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMVITgx/HfScbL1Srfe5GskALW2NMprSDwVR2qsijtxvzfCVq5EmFrj9ncYljRcCnFx4mhhj3B0
 21h1LTwIScgA=
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

  - Patch 3 removes redundant clocks and clock-names for UART A on
    Khadas VIM4 DT. It then uses those defined from DTSI.

  - Patch 4 enables UART C on the Khadas VIM4 board and attaches the
    on-board BCM43438 Bluetooth controller to it, with hardware flow
    control, wakeup GPIOs, LPO clock and power supplies.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v3:
- Patches 3-4: split into two separate patches:
               3. remove redundant clocks from UART A
               4. add UART C node according to Neil's feedback.
- Link to v2: https://lore.kernel.org/r/20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr

Changes in v2:
- PATCH 1: change underscore to dash in pin node name,
           according to Xianwei's feedback.
- PATCH 3: remove clocks and clock-names as already defined in DTSI,
           according to Xianwei's feedback.
- Link to v1: https://lore.kernel.org/r/20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr

---
Ronald Claveau (4):
      arm64: dts: amlogic: t7: Add uart_c pinctrl pins group
      arm64: dts: amlogic: t7: Add UART controllers nodes
      arm64: dts: amlogic: t7: khadas-vim4: Remove redundant clocks from UART A
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

