Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C953B7B91;
	Thu, 14 May 2026 21:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778794181; cv=none; b=KfVlXauzy9wT8Bwe71+hSHTgE/rxQ5414Ffpyoo31cQQrNr8ACgE8CKCttjQJOBllXVahCNr3v3/fu6SDAKD1cS2I8CCkLDmIQrQd7kP60p9Q4npnPt5j0wZDQZW9zMPpRp2DuXG83e4A8wQOmcogp25j3I5ZuADEV9t/7HCWo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778794181; c=relaxed/simple;
	bh=SbsBVDltEsAEw0XMf+/R1l5EehsrIDBu3yBrZiL89Zg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G8lu5y/8VU68419qF4fQ618cnZYpcS+PZogCMJ8iCYo+bgBm4iKo/J+bA9I0+F03Qw50/6wH4fJ1XHadsP683lOzCrC/yUHc3vavnPs+eWuVkwx4va6wPkHDAaZlKDaGL/B7aSzoF2Rcs3Y2dvXFvWsq4/m+eRz/OKUy3wgZqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9FE9svj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9FE9svj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55F67C2BCB3;
	Thu, 14 May 2026 21:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778794181;
	bh=SbsBVDltEsAEw0XMf+/R1l5EehsrIDBu3yBrZiL89Zg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=h9FE9svj4V0O/ARXr2cuTLbE0h3F3Ifw7NZHquLSQuUz2d55ZX5FFWdMpFLMiXdkD
	 nOKC4H+xb25ppSYkIzAoK9nNupH+qH+IV2vZod0IDjxHGZEmXsAPaqCbjDl+DAY4PL
	 dfyoiC8g/w9eNdThugWMotwTELLasxuIvovG7n6RY3Z2MYiivugXGs9uMHxj41oFuL
	 xu89nAcxU9Qnyn1wFBa9cb3MJN5UW5/jtNav7xuTwLImKJSHUPjHp2dnnDIZPCJlcp
	 sNkAcMRDG/XFYPqNX9ijdAn+lPkicpHWYjBBAFZdbXTJWU5oP2xLecG2me+FVH1n0h
	 c/j23GCzYBkSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C649CD4F25;
	Thu, 14 May 2026 21:29:41 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] drm/panel: Add panel driver for Chipone ICNA35XX
 based panels
Date: Thu, 14 May 2026 16:29:15 -0500
Message-Id: <20260514-icna35xx-v3-0-c304f04c32c4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02PTW6DMBCFr4K8riuPjY1h1XtUWYztcWKpQIIJI
 oq4e11YlOUbzfd+3izTlCizrnqziZaU0zgUoT4q5m84XImnUDSTQhohpeDJD6j0unLyLUYERYD
 Iyvt9opjW3er7cuiJHs/iOB9H5jAT92Pfp7mrqLVBgodGOAEhUFTGRCGVc9FH4xRo0Ua0ip2bd
 NXRAxqOr4E/fLZaCw7Gi8YZFUiabrHsL/6W8jxOr33YAnv+zhbb/w0LcMGNtUGFmkDE9uvaY/r
 5LCV3k0WeQKhPoCxgrdEHCBG1MWdw27ZfEJCflFgBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778794180; l=2148;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=SbsBVDltEsAEw0XMf+/R1l5EehsrIDBu3yBrZiL89Zg=;
 b=eRgWM/GviVsKIIMDZ42FpgkiCbQMwLJ+9I+tXq38amhmUz/86ZpxrRJyoDbrzOrZQuybHEWFx
 P8KPlqiXipeDfq0JVg0/gdcpwp+9XtdJpq/4N9sanKd1yf3dWImW+xI
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
Changes in v3:
- Rename binding in patch 1 to icna3512 to match a compatible being used
- Edit commit messages in both patches 1 and 2 to better clarify the
  supported hardware and differences
- Link to v2: https://lore.kernel.org/r/20260514-icna35xx-v2-0-45acd1dfa566@gmail.com

Changes in v2:
- Fix lint warning in patch 1
- Add ayaneo,pocketds-panel-top compatible to patches 1 and 2, it uses the
  same init sequence as the odin 2 portal panel.
- Link to v1: https://lore.kernel.org/r/20260509-icna35xx-v1-0-688d3d4e10f9@gmail.com

---
Aaron Kling (1):
      dt-bindings: display: panel: Add Chipone ICNA3512 OLED driver bindings

Teguh Sobirin (1):
      drm/panel: Add panel driver for Chipone ICNA35XX based panels

 .../bindings/display/panel/chipone,icna3512.yaml   |  79 +++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-chipone-icna35xx.c     | 619 +++++++++++++++++++++
 4 files changed, 710 insertions(+)
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


