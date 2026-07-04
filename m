Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C66984039
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153462; cv=none; b=d7IYIUhFGMSdfzIKDJhsHgxRd1sB0MEtaBHDsN3fI7Zcd7HrBz97Y7l61FyoNThBmX7fPnKXA6OfsGhhD+wqPnJv3CDHsxF9lmIszLgw56dXczjBSP5IjdmZZMyFRbcoY8P/xzdJthZxrW6mkTtaf0F9lhxv8jMS/6z6Z5DxyTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153462; c=relaxed/simple;
	bh=75enBni6180jE52fFYAcMn7PT3KAwMukVOPFUzlqpnE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WuuF7B5ekj/RigpJ3a1Yxggmyh+gA6z0dWYFQdYGzfV5MuhP3fY6Ms6Nra2AJMvEgQRVKDH/QQou0xNy2kMdAGbewditaEHfneCOqN9X2Ig9qe+2qGeIJ3aUFzND9Eetd4wXLfPHp6TWK1t1wuFBgoCZgATcj114C6SQNt7LybM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=YqTnYboj; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="YqTnYboj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1783153453; x=1783412653;
	bh=Vfly9BhoMoxPtNDV8ENnNxHUTH5x5gOcIHfDtAnf5A8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YqTnYbojhozr7ufKqb32+QaX/6RBiNmYrdx852HVWRm2wCo/dtYdEV0+OmgVL8s3S
	 EGnu+kXtVRlXrtPpAt42TzZWxQ0FtD+wrGRAiM7XVLACyPzr4Pyf7i3/g31edSpPEk
	 VXYmM2jy8H/iN66TPNnFYk+hJ982pta0kb4QckOS/5GeUnmB0iLpFgbsvGXhzxpmuF
	 oAV69uPpkZMY423MMLULJS83rT7ZQXeWZ/iQWvnNihbwY/zX5M+9cr/25HIw43aApy
	 cMu5pPGaOcOGKY72YshsUWtNztwg04rAsGqEI+ThSNfUehKXYzBmnj63shEfiZD/Ih
	 puzvOhUc3UueA==
Date: Sat, 04 Jul 2026 08:24:05 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add support for the BOE BF068MWM-TD0
Message-ID: <20260704-asteroids-panel-support-v3-0-38dc92570579@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 1fb07fc1485a7d52098ac3203db8fda76e6124cd
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add the bindings and driver for the BOE BF068MWM-TD0 panel used in the Noth=
ing
Phone (3a).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v3:
- Rebase onto next-20260701
- Keep 'required:' list in same order as properties (Krzysztof)
- Switch to devm_drm_panel_add, devm_mipi_dsi_attach and drop remove callba=
ck (Neil)
- Link to v2: https://lore.kernel.org/r/20260605-asteroids-panel-support-v2=
-0-44b96c6eca91@pm.me

Changes in v2:
- Rename binding & driver to DDIC instead of panel assembly (Neil)
- Clean up hardware resources in prepare() on errors (Sashiko AI review)
- Link to v1: https://lore.kernel.org/r/20260603-asteroids-panel-support-v1=
-0-109c6ac81c8f@pm.me

---
Alexander Koskovich (2):
      dt-bindings: display: panel: Document Raydium RM69220 DDIC
      drm/panel: Add driver for Raydium RM69220 DDIC

 .../bindings/display/panel/raydium,rm69220.yaml    |  74 ++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |  15 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm69220.c      | 417 +++++++++++++++++=
++++
 5 files changed, 513 insertions(+)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260603-asteroids-panel-support-d55c929a89a8

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


