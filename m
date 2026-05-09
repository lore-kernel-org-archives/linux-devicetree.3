Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5319A128816;
	Sat,  9 May 2026 20:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778357954; cv=none; b=tkjeDfthirRox5Jv1tc+d0OrAWLBj+fyFzkHudr3Nx4ahKPew5m0p5Rlz+9OG3kox7OE0QIJGwqklNTkG0Y33P47lQbRWdVasncLb2jO0ToJ1vb3ugRXzPT4lLCel9H0VG/sCatmSujABaPuAXkN8inv9aVC5QiJZcvoItIkGcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778357954; c=relaxed/simple;
	bh=aAuuip6jS0fKuG58+qmMYaxBKre4x4rRCnB9dSliLlQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ED3EVvc92xfUVOVJav5HVaXGQsaVHE9wnwftGRlNdz7LVDT3dyTqmn5DvPpz7j1uhDynAYSWd8T5tjHYPs2Ll8kVyUO+ll7YkM6ePXSE4TKCS25h/mqIzaWLPH2V9EFQQRFiQpBugs+tw3f4lMYgqzy7yKGzo2SrK5RSwmqMVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFWcQF9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFWcQF9p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F0DEC2BCB2;
	Sat,  9 May 2026 20:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778357954;
	bh=aAuuip6jS0fKuG58+qmMYaxBKre4x4rRCnB9dSliLlQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XFWcQF9pAiMEID6GPheqRG9ZYwaZyvDhEPhMs2H9DE5qV/PoQGWlD/jkdb5i3cDX+
	 TMkqD48k2VHTG7Ni56pZruYgbYiN1I5V7R8YDjH7yj7rD9M/ai+/dJSmZTB+PO/c69
	 Z80hl6u24Md3athGlhBbY1Csa/GSrSsQzBa15ocGbRGtwlOfVVz1HLYSQ/Ij4J0NOU
	 joqVpxplI4y1OuzUoqASjiwcTRK3kTKWqYiXn76LDI3wMFhxP9a8E9KW/UYMVWBrUw
	 VqinzjVaKRpVqruc8VFSd1UMu1m0vNqnfp94q8PWO36ASzliQbJPpf1jvTiXu8S8QU
	 rC+Ob5o0daoOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B9ACD342F;
	Sat,  9 May 2026 20:19:13 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] drm/panel: Add panel driver for Chipone ICNA35XX based
 panels
Date: Sat, 09 May 2026 15:18:56 -0500
Message-Id: <20260509-icna35xx-v1-0-688d3d4e10f9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02OywqDMBBFf0Vm3cBMgvHxK8XFJJm0WajVWLGI/
 16pmy7P5XI4O2SZk2Roix1mWVNO43AC3QrwTx4eolI4GTRqi1qjSn5gU26bEt9wZDJCzHDeX7P
 EtP1U9+7iWab3aVyuERxnUX7s+7S0hTR10OSpQocUgkRjbURtnIs+WmeoxCZybeC/pC2uDqoUf
 wY1+VyXJSqyHitnTRBt27WG7ji+bO+btdkAAAA=
X-Change-ID: 20260220-icna35xx-ec9afa13e1aa
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778357952; l=1595;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=aAuuip6jS0fKuG58+qmMYaxBKre4x4rRCnB9dSliLlQ=;
 b=W7yzeZSuAG+gNcWHDCymdVfQpoQHfwZMr+LHYNxrWwRcnGUx5J14Lwt2j8439cTAlRcDEM0wR
 tbNtrRtqJaXDI9O7MjUmsS6rpxfUfIjPkJK4Yn4v3HrjfzLHlXX2UU8
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This driver is based on the one by Teguh Sobirin [0].
    
Due to [1], the AYN vendor description patch has been folded into the
AYN QCS8550 dt series. Which means this series depends on said series
and it must be picked up before this.

[0] https://github.com/AYNTechnologies/linux/commit/4c5e76e974db7cca853619ca138eecd8f004622f
[1] https://lore.kernel.org/linux-arm-msm/c7fb3f89-6574-4761-9ef2-2fdf6d4801b5@kernel.org

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (1):
      dt-bindings: display: panel: Add Chipone ICNA 35xx OLED driver bindings

Teguh Sobirin (1):
      drm/panel: Add panel driver for Chipone ICNA35XX based panels

 .../bindings/display/panel/chipone,icna35xx.yaml   |  77 +++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-chipone-icna35xx.c     | 618 +++++++++++++++++++++
 4 files changed, 707 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260220-icna35xx-ec9afa13e1aa
prerequisite-change-id: 20260217-ayn-qcs8550-16c07b63de26:v8
prerequisite-patch-id: 2b010637c46f5ea0e19a2fa87cc5ccb19bfd9204
prerequisite-patch-id: d0c633dc17f0aba726a8e8d21fee52b944bf67ff
prerequisite-patch-id: 11f4208bd788df984cec7404088c7d071ec49dfc
prerequisite-patch-id: 76b61799dba520fc7fa3ff39b044e24103337af3
prerequisite-patch-id: 3844bef2eda3cf59031b1d131eb6ba9295629bb4
prerequisite-patch-id: 3331648bc6f4ac3bb156f0525aa1ede92bfc57f1

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


