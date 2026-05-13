Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794603E95A8;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669066; cv=none; b=l+yYwzS6JPuscto+G4WQ/CU58B/FmrofbBQ2Z6Muputj7bthjrD1goBlRnM8KHUnjcWXrMVlSMw6o5Z7bWqLBwBgwkS+iGQMpCTdPqAIA8lv03g59vOIXSA6XOznJ7XJMKMhTUqNs4jWcGjlQHHFAZWjMti2go2WLzMQIgOmU0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669066; c=relaxed/simple;
	bh=EftnxsZQyEGBjcaWoej2Qgq8pVFT9h/4EhbAduCDQPA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vx8eu/C9RRJSsAKRkDchLS88+DX1d0bZ7vx7KUIESO4ey8EQhY+tpNVibGu8WEigvzwhvXpuC+hcVwJFrrtI2ChSvH7ecU2w0OMviwOGfmvsFQMNtEE8C6K6KqrNaCwzIk2JxYqfshysbXobjznNcZkyUTU5yJugbWc2+fytxjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BF+vaZGY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF+vaZGY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A701C2BCB7;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778669066;
	bh=EftnxsZQyEGBjcaWoej2Qgq8pVFT9h/4EhbAduCDQPA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BF+vaZGYadI2fPGJPtYMlf209EsaXq6w5mcIw1WGQU/BvyoaDtOiee7IPm8VvaqU1
	 VvlBHOQIrZj/mXcsRASxPtl1CWncE19kzdr0Y34BlJdX90WcAePp8TUVxrv9hLPcAA
	 rtbnMudpsbLzLFuMGBofMF6x4B7cK8uaHJbFYMueYP590CX51HZlUVy0t81OWsuVxT
	 g2Ew+HIZrhxriKrzfmoucSkLxfqdELkSgADy0pqMnwGHfEReVYBmC1qX5m0BPOPU1a
	 viuM/OeqNC3cwPworG0/niTY/GxoghI2RRuzANQ20tp6UbAcVis+gXyB2lrPI4O6S+
	 beNiO5mbJKU7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC87CD4851;
	Wed, 13 May 2026 10:44:25 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v2 0/3] Khadas VIM4 PWM status LED support
Date: Wed, 13 May 2026 12:43:52 +0200
Message-Id: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOyw6CMBBFf4XM2jG0lufK/zAsahlkIg9tawMh/
 LsIa5dnknPuLODIMjkoowUsBXY8DhvIUwSm1cODkOuNQcYyjRMhUdc1PgP3Ct3sOqoxN0YkRSJ
 VkgrYtJelhqc9easOtvT+bGV/HOGuHaEZ+559GQ00edzrSir4CS07P9p5fymI3fi/HgTGmIksz
 0Sh1YWyq+6YunNjoVrX9QvcaMf24AAAAA==
X-Change-ID: 20260512-add-kvim4-sysled-8cc159524561
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=EftnxsZQyEGBjcaWoej2Qgq8pVFT9h/4EhbAduCDQPA=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZL6E+Dmm8zlZKebY8/e8GTM21JA3vlTlZPRlXWWr5v5
 +tCFLM7SlkYxLgYZMUUWfrnWp54d/noma971FNg5rAygQxh4OIUgIm8MmJkOMXlvmlW2mKd7Z0v
 f8wz3P5e/LXY3C+rtn60nrN99pLjD9YzMvQuX+H+e2K514Oo+ley2y7ysJjHqkrFHdIt3ztJ4MO
 FA4wA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

This series adds support for the PWM-driven status LED on the Khadas
VIM4 board (Amlogic T7).

The VIM4 exposes a heartbeat LED wired to the PWM_AO_C output, routed
through pin group pwm_ao_c_d. Before wiring it up in the board DTS,
the SoC pinmux definitions had to be corrected: the original
pwm_ao_c node was conflating two distinct pin groups (pwm_ao_c_d and
pwm_ao_c_e) into a single ambiguous entry.

Patch 1 fixes the pwm_ao_c pinmux entries in the T7 DTSI by splitting
them into two properly named nodes. Neither alternate is in use yet,
so there is no functional impact on existing boards.

Patch 2 moves the xtal-clk node to restore alphabetical ordering among
root node children.

Patch 3 enables the pwm_ao_cd controller on the VIM4 and adds a
pwm-leds node with a heartbeat trigger.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v2:
- PATCH 2-3: Create a new patch specific to the reordering action.
             According to Neil's review.
- Link to v1: https://lore.kernel.org/r/20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr

---
Ronald Claveau (3):
      arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux definitions
      arm64: dts: amlogic: t7: khadas-vim4: reorder root node
      arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED

 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 30 +++++++++++++++++-----
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 12 +++++++--
 2 files changed, 33 insertions(+), 9 deletions(-)
---
base-commit: 31f32e8cdf59291e467250dfc57d1a8c718f63d2
change-id: 20260512-add-kvim4-sysled-8cc159524561

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>


