Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E72BE7AB;
	Sat,  8 Aug 2026 19:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786215683; cv=none; b=GPptQovJe/Rs3uVB/CsQR9IhxixdlDdY2+vkR8/sVdBOlZ9bs6lK1NgYVEms77aQSFHZ6SBZyLdQBn/a0a9w9QK/qP1k7T1w0gDCnJYMPH40Mm+EFnWjbDw9NsaI8XSfqWJRyNRcrOR799T0MDR9rIUnZr5PPttiMRE/j/hHpH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786215683; c=relaxed/simple;
	bh=FDxMDFsLHbpa8Q63KVAJ0yLENCmhUxJqcXcW9Yh0WwY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D1glASohQpPuyASblYZWxw/h76jqLiya5Ffc5TNjNtqAFVahGomxv/E4XlEEQOjI+JqbzTB/XktZxKaEGSlTuSMpGH0q9ljLZzldi9H9+ujTN2Yxxg25BF1FYfQ2U24f89hw3/T3Pc/eesyakJztAuorN+nBSRWXt9h7PzQ34j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5QwnEhY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5QwnEhY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C1CCC2BCC7;
	Sat,  8 Aug 2026 19:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786215682;
	bh=FDxMDFsLHbpa8Q63KVAJ0yLENCmhUxJqcXcW9Yh0WwY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=C5QwnEhYXWE/TWMJNEpkUdvb24TNpS69bGDYH0xvIK7/PKv2JJpojr1Wv0QeL7HlI
	 eUsJfVhy3nqW0zi3i2J3zABLTKH7/FQcEN5yaJ+bGgqbfMlEgIESv8JJEppUf6Blwc
	 bgounFO/+Y0xp/Nrd3oCU7LId4CdYi2vXRvAAVh5zme3XlK3pwhiFkl/Ro0Xm8UcYB
	 3Xuj1F8fA6vTF3xuEvvGjlnoHMFTm+8lNKBzQ9RIlR8b0qdi2CBj50bX/yDxE2IBe+
	 Fa1+7aSbVTURjlzEabDUsn+Lz8gNzMEICQDKJD9tsQ6cS8IN9EFOfuwzQuvJkLf2/8
	 zvIqQzXqScXZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72370C5AD4E;
	Sat,  8 Aug 2026 19:01:22 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] drm/panel: add Ilitek ILI7836A panel driver
Date: Sat, 08 Aug 2026 14:01:13 -0500
Message-Id: <20260808-ili7836a-v1-0-07a7becc5636@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oy4oCMRBFf6WptYE8upLq/Iq4yKMyE9BWE20U8
 d/tURhmMctzufdyHtC5Ve7ghwc0Xmqvx3kFtRkgfYf5i0XNK4OW2kqSJOq+OjI2CGPLOE5KxVQ
 yrPVT41Jv76vt7sONz9f18fIJIYbOIh0Ph3rxg42UKBRUY3ZmytIYLIhuikjIUscQmYLTDv6a+
 OHtoZUT4T6Lc+qEKIWySbpoTWZt/TL9N/lRb6ffBWGi0VlZbDF+UbB7Pl/IFMIWCwEAAA==
X-Change-ID: 20260808-ili7836a-36f44911bcfd
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786215681; l=2202;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=FDxMDFsLHbpa8Q63KVAJ0yLENCmhUxJqcXcW9Yh0WwY=;
 b=t3aCgpjv5x5gaUL3MNuOUfj69WxndC2uwICW75n4t9ulzTj88k6L/D/qrUE2MTvR/dcXdpirU
 ijrhb85Q2lMBojNB1HHOBpOS14Z7TJ8Mmuuyz0JYZV6wQQd3P+aM+f9
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

Add support for the Ilitek ILI7836A DDIC.

This depends on the Retroid Pocket dt series [0] for the vendor prefix
patch. That series depends on the AYN dt series [1] to apply cleanly.

[0] https://lore.kernel.org/linux-arm-msm/20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com/
[1] https://lore.kernel.org/linux-arm-msm/20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com/

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (2):
      dt-bindings: display: panel: add Ilitek ILI7836A OLED driver
      drm/panel: add Ilitek ILI7836A panel driver

 .../bindings/display/panel/ilitek,ili7836a.yaml    |  58 ++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili7836a.c      | 297 +++++++++++++++++++++
 4 files changed, 367 insertions(+)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260808-ili7836a-36f44911bcfd
prerequisite-change-id: 20260217-ayn-qcs8550-16c07b63de26:v9
prerequisite-patch-id: 17ba304f7a8a08cc78f98e198db9c51f4786a22c
prerequisite-patch-id: 21873631f5dcdb9bbbdb5c20c3f5e9816cc405f9
prerequisite-patch-id: bf7b5dea0097cbbdf04929a4246d1fc65c607ea8
prerequisite-patch-id: d7f546eddc96a4f31a1e681abddbc96bd68abb32
prerequisite-patch-id: d40d784ad8efbb1204c024408be2067725a06cf2
prerequisite-patch-id: 25bbd55199a8250a912ef542b31f43dd5ccdbc90
prerequisite-change-id: 20260808-rp-qcs8550-85c84760f6f3:v1
prerequisite-patch-id: 17ba304f7a8a08cc78f98e198db9c51f4786a22c
prerequisite-patch-id: 21873631f5dcdb9bbbdb5c20c3f5e9816cc405f9
prerequisite-patch-id: bf7b5dea0097cbbdf04929a4246d1fc65c607ea8
prerequisite-patch-id: d7f546eddc96a4f31a1e681abddbc96bd68abb32
prerequisite-patch-id: d40d784ad8efbb1204c024408be2067725a06cf2
prerequisite-patch-id: 25bbd55199a8250a912ef542b31f43dd5ccdbc90
prerequisite-patch-id: c79dacb2a8ca1298387bc9bc4a543de97c670a50
prerequisite-patch-id: 9c058fb9b13442f5434b8aaa2f1907eff1b43684
prerequisite-patch-id: c13130099b60aa7c412181e99070718eb2c68ecd
prerequisite-patch-id: d0dad3c4fa9c4b98e6cc53bbd0874df9113ab5f6

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


