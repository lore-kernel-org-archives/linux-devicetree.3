Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083D21DB551;
	Mon, 27 Apr 2026 04:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777264784; cv=none; b=nvoO5BGVe9c+BBvG+BV+YhB+U406y2Mymg/Ogw2WK9q/57p2S6Yqpr/x9BcOp0IpDes56vvO1WkN4NOC/VdR1sACaQRJG687KucRZCnFEkLAyZZLE4fp2wO/+TPdv7Gqg/14mfM4DTqajoExVTArauI2KRQzdWNCqnHBHSqVIpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777264784; c=relaxed/simple;
	bh=h66IYY6ltdWW82uv6ZEGFRb8Lc+1/b/cWqAH+0NPf+0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bml9cq1GWzf2nmLkbdSeXZwzDiPZrpt94dJsboPB9cx3B177kBvGlCLGVQQX51ti+s6s+F6EyB0KP8w1oEo96vHS/RGQW3Zu1nY5iJ315aHwUzHrWXrrYmLm5Pb5T3kBjuBibhQxqxh0CYaOJ6SUwaMzu3SpsCABvWRo6ARxh54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9+2sgK0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9+2sgK0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 959CCC19425;
	Mon, 27 Apr 2026 04:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777264783;
	bh=h66IYY6ltdWW82uv6ZEGFRb8Lc+1/b/cWqAH+0NPf+0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=W9+2sgK0BxBoCcSBIF8ZodM2DRnpdqE+SQ1mS8sO+1BJlpJS6NoXDsdVn4n0/aO71
	 FrJGQg6Nho09RJWpZOScBDN6KaXeOU3Vuj4wzf08dM8WcOu5LqdsL+NsqtBFlx8z+H
	 1IDa4LMJr6sSvo29sb0UDf4/VwSsWNVzdGb/DjOKhMiN655kg5BK1sfiQsM6vVvdXW
	 NDvxypSd2iR2yylrX2vXdjT4XyOLB2Ntb4pqoySyLbETsomDIvCuGr9siPen2w+e4t
	 H6/4c1ev5FbNjkzM+apXOUu91s8hEGeyArD83MmtAK4Sem1e5699NHKLmExwmdpmPn
	 eO0PS3XyW4rFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8477AFF8861;
	Mon, 27 Apr 2026 04:39:43 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v7 0/2] drm/panel: Add panel driver for ChipWealth CH13726A
 based panels
Date: Sun, 26 Apr 2026 23:39:36 -0500
Message-Id: <20260426-ch13726a-v7-0-554247c569e5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XRzW7CMAwH8FdBOS+T4zSOy2nvMe2QT4g06GhZN
 YR494UyqRE7OsrPfzu5iimNJU1iu7mKMc1lKsOxFvZlI8LeHXdJllhrgYAEiCDDXmmL5KTpA5H
 laHRkUa9/jSmXn6XV+8ejHtPpu3Y8Pw6Fd1OSYTgcyrkmAEPSGHWGPjIxh86xjax8DMGqbDMBe
 UWinWS7ecyhrHSXozyFiY0BqSiA9aRjQtrORtzj92U6D+NlWWxWS/7fDrjuMCsJMhlQ0XJSYNz
 b7uDK52sdcmky4wp1DV0hVojsXEc+RIrwDHUDUTdQ3xORPeXe5sT/YLfCDriBXYW998r1nrPG/
 hmaBqJqoKnw/py5yxoSmGdILWwfhyoETQyxfrTOuYW32+0Xv4W8eTwCAAA=
X-Change-ID: 20260220-ch13726a-59c6678d53d8
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777264782; l=2886;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=h66IYY6ltdWW82uv6ZEGFRb8Lc+1/b/cWqAH+0NPf+0=;
 b=xm9Z/XMRY1yj+o4BtkFQ/WlfNpF/zM+aWQXjzOT9pyXmOE2q+AOh+GHRWG8kowT834DDlFTUh
 wVPVgCwL/eyBdk7UQjfh9lqAOk/7ll50mqA9TT8ORiuBqei8VnV6z7G
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This driver is based on the one by Teguh Sobirin [0], cut down to only
support the AYN Thor bottom panel.

Due to [1], the AYN vendor description patch has been folded into the
AYN QCS8550 dt series. Which means this series now depends on said
series and it must be picked up before this.

[0] https://github.com/AYNTechnologies/linux/commit/d0ff75b09e66023c5f88992706dee4601aa7a437
[1] https://lore.kernel.org/linux-arm-msm/c7fb3f89-6574-4761-9ef2-2fdf6d4801b5@kernel.org

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v7:
- Invert reset gpio logic and instead expect the correct active high or
  low setting in kernel dt.
- Link to v6: https://lore.kernel.org/r/20260422-ch13726a-v6-0-03680d6673ff@gmail.com

Changes in v6:
- Add trailers from v4
- Link to v5: https://lore.kernel.org/r/20260421-ch13726a-v5-0-f7f6f4f30e05@gmail.com

Changes in v5:
- Don't duplicate prepared tracking
- Use devm_regulator_bulk_get_const() instead of setting names in probe
- Use devm_drm_panel_alloc() instead of drm_panel_init()
- Link to v4: https://lore.kernel.org/r/20260408-ch13726a-v4-0-9bb1a9b8f329@gmail.com

Changes in v4:
- Add fallback compatible to bindings doc in patch 1
- Link to v3: https://lore.kernel.org/r/20260323-ch13726a-v3-0-e28b6f97fe80@gmail.com

Changes in v3:
- Reword patch 1 commit message for clarity
- Order properties properly in patch 1
- Track vendor description dependency series change
- Link to v2: https://lore.kernel.org/r/20260317-ch13726a-v2-0-28aa46bcd6d0@gmail.com

Changes in v2:
- Add Neil Armstrong to binding maintainer list
- Add 120hz mode, which required a minor restructure of the driver
- Link to v1: https://lore.kernel.org/r/20260222-ch13726a-v1-0-e501d78e105a@gmail.com

---
Aaron Kling (1):
      dt-bindings: display: panel: Add ChipWealth CH13726A AMOLED driver

Teguh Sobirin (1):
      drm/panel: Add panel driver for ChipWealth CH13726A based panels

 .../display/panel/chipwealth,ch13726a.yaml         |  67 +++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c  | 333 +++++++++++++++++++++
 4 files changed, 412 insertions(+)
---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260220-ch13726a-59c6678d53d8
prerequisite-change-id: 20260217-ayn-qcs8550-16c07b63de26:v5
prerequisite-patch-id: 2b010637c46f5ea0e19a2fa87cc5ccb19bfd9204
prerequisite-patch-id: d0c633dc17f0aba726a8e8d21fee52b944bf67ff
prerequisite-patch-id: 76ac126273870a96f05e1bd87f4f31bdc3746440
prerequisite-patch-id: 76b61799dba520fc7fa3ff39b044e24103337af3
prerequisite-patch-id: 3844bef2eda3cf59031b1d131eb6ba9295629bb4
prerequisite-patch-id: 3331648bc6f4ac3bb156f0525aa1ede92bfc57f1

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


