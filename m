Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3788E477990
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491800; cv=none; b=hFouj64ZXqsUkv/rrP6GMmiV3JJZzqNwbMj5iG+lNWAV2bMtgdNbJYP5H/zv7eBDgP5g4d6YEUrZs7Kxde8ArLAuf85e9osAIcecaT3CqQmi19EJVOJsTV6DOg+iW8GKCTNx04Q3jqYvbSyAVdSA2O4aMaI28H+nxfNLPMnL/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491800; c=relaxed/simple;
	bh=6UMsobXCw/eeeiTcDryt7GWsTtPXkHVN9I9JSawDq/s=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xjf5a96Xy5d1Yg6Rdl8463DRb2Z3N0CtYwoV0j5hAlvPbIhnVu2U/YvYxiOKYlyHFDZxDPdvbDZ69NVNpVNiEpBnmuddf/+M9DU/LZbnec8UZcW2mslh/OX1f3XLt3u3I/g2hZpZmLoG9OzX17h14V1FBgePRYk0pV0C8s6AMOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ajtZWuca; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ajtZWuca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780491791; x=1780750991;
	bh=ozjq0z6xun0KKQNe4TBrfS/xRvkX1S9573CAfKsaYgM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ajtZWucabQ3/6F76/L5cGADu+qNYhPSzgJ6r2oXLN5U1xLhPzWNmRPG//SaGxpt6J
	 DDuMn5VhTZqeQ06b0aMHqozbqfnuFJvp8bcSgiZvbHnh9ctOIl8gXgvoLFq2HkbKLw
	 8QwxfnZZKNFQp4G3AMCX6wBEXOYixLzXiGvwrUo81rH0h0U7IUoPVbrelZX6VaPyLf
	 HzPnrXoetgjWwzRDcEPXxz3Z1uuodn2jFc5GaUfn6iyE5ASKJmJXwLIlzE8++BI6QG
	 aRC7cRoHssxb7ZoifxKHCOHk7PA/E3heuDGzU4oSMcvjl5PKdAEfTKsQ5Pneh1ka1O
	 jvUokaTZkXZ5Q==
Date: Wed, 03 Jun 2026 13:03:03 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/2] Add support for the BOE BF068MWM-TD0
Message-ID: <20260603-asteroids-panel-support-v1-0-109c6ac81c8f@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 79248a0368e3d671c92455c05a409bb24fe6e20b
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

This series depends on support for DSC configurations with slice_per_pkt > =
1,
technically it boots up and displays stuff without it but you see artifacti=
ng
without it:
https://lore.kernel.org/linux-arm-msm/20260318-dsi-dsc-slice-per-pkt-v2-0-0=
a1b316f8250@pm.me

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      dt-bindings: display: panel: Document BOE BF068MWM-TD0
      drm/panel: Add BOE BF068MWM-TD0 panel driver

 .../bindings/display/panel/boe,bf068mwm-td0.yaml   |  77 ++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-boe-bf068mwm-td0.c     | 432 +++++++++++++++++=
++++
 5 files changed, 527 insertions(+)
---
base-commit: 15a038bc8d93f92c80d9ba6844d4f16333234f39
change-id: 20260603-asteroids-panel-support-d55c929a89a8

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


