Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EEA221F2F;
	Wed, 20 May 2026 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=l6Qp+ERA6Q3FkNi5dxpIDLVvzw1mQRJa3WmvCAzUTMD5Ucf8RcVkMv0L2ajd4ct2Y1m6GEv9R08EugxAVBZWlg+shQlN5hoxXGHfoV8xBxThJBA3gwIH/6943lUDU0FZ07Xa/buitxjUiqJ6VBNxT2nFv9ZLMcaI1Za//PU1GPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=C+bAsxrO7Hwqd7h3A17Hh+Wk9te7bvjVSu4G652FOSE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ft2D4Ze/CRIwovc3hxRrWSIO4xeSuEHpp0Mammf2coCSTMt6wQBp4YPsUcJbwFWp5otqy/9ZUL35OfUrA78ELXsKklcultP4TO5q4veO0q3K+yFeL2t1Qsui3d17EQrIObExpgs2IsiEkW0izfdElxtQKbqCR27KcgASGC4tz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bM2vWTiB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bM2vWTiB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3C15C2BCB0;
	Wed, 20 May 2026 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295241;
	bh=C+bAsxrO7Hwqd7h3A17Hh+Wk9te7bvjVSu4G652FOSE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bM2vWTiB3uWVR0vB6KYNd9Ft82YThNYWg+mwz5z6zUdP6SltRenR20T2V/wUx9APL
	 DdTSYki+5OMp46KbFrx6w06L2eMbD7hZQmOWk5omXPnoej+wLtGfTSCoYbWjmC2e77
	 iGkd6gL7g+tcSS+lloy8ckbvdOSqj1V9fVyjmhoIQWUOyv0NK0PIjFqT0j1jadHuGa
	 z1H4k17qaQTKvi4HIte71E/JID6isEidTVy/pMcchBMRVFIqCiQKhO1KArKkwRbDjo
	 9GcIoykYJsSDIoR7Rg8OnOcbt8EgseFMfG36QMq9S09niQX3HSvI2isVrMZshdfuAz
	 r91eRTjqQermg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F73CD5BA4;
	Wed, 20 May 2026 16:40:41 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Subject: [PATCH 00/11] Microsoft Surface Pro 9 5G update
Date: Wed, 20 May 2026 18:40:04 +0200
Message-Id: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOTjDWoC/x3MwQ6CMAyA4VchPVtTF2HiqxgP2+igl0FaJCSEd
 3d6/A7/f4CxChs8mwOUNzGZS8Xt0kCaQhkZZagGR66j1hHaR3NIjLb02I6YZ8XC+4r+0fsUI+W
 7S1DrRTnL/j+/3tUxGGPUUNL0+23+SnCeX4YdOrKAAAAA
X-Change-ID: 20260520-surface-sp9-5g-for-next-7897cbb0f42c
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Bartosz Golaszewski <brgl@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=1578;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=C+bAsxrO7Hwqd7h3A17Hh+Wk9te7bvjVSu4G652FOSE=;
 b=TxYunP+RMjqX6ztukqcbFSA9ok7XwP4bO3nlR9H9+xVWj1Xay+n9Ee8UnjAKgLVtfFf5+ndDL
 lfsAqQJ15CeBEwbFacPNIhbr5cf+0/QkZR0U+O/1CQ1wqrd3TNeUcLZ
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com

This series updates the support for the Microsoft Surface 9 5G
(Arcata), bringing it more up-to-date and aligned with the other
sc8280xp models such as the Lenovo ThinkPad X13s.

As highlights, it finally enables the built-in screen, it fixes
Display Port alt mode on the top left-side USB-C port, it enables
the volume up/down keys and the lid switch.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
Jérôme de Bretagne (11):
      drm/panel: edp: Add LG LP129WT232166 panel
      arm64: dts: qcom: sc8280xp-arcata: Enable backlight
      arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display
      arm64: dts: qcom: sc8280xp-arcata: add USB-C orientation GPIOs
      arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
      arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP support
      arm64: dts: qcom: sc8280xp-arcata: Add volume up/down GPIO keys
      arm64: dts: qcom: sc8280xp-arcata: Add lid switch
      arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board wcn6855
      arm64: dts: qcom: sc8280xp-arcata: Switch to uefi rtc offset
      arm64: dts: qcom: sc8280xp-arcata: Drop duplicate DMIC supplies

 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 301 ++++++++++++++++++---
 drivers/gpu/drm/panel/panel-edp.c                  |   1 +
 2 files changed, 266 insertions(+), 36 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260520-surface-sp9-5g-for-next-7897cbb0f42c

Best regards,
-- 
Jérôme de Bretagne <jerome.debretagne@gmail.com>


