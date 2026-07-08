Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9873CCFC0;
	Wed,  8 Jul 2026 21:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547050; cv=none; b=Bs8hz+aWyGBGYmBq/5ZngLrkg124CqTJP8UDrEPVn0HWyYDDDedqKxYe7nysyiH5NQQngW4uSOj2l4HeyWbLOJjubeqxF6HSwU4cG8119IEEfR0ZROJCFjU86BqZ10XizPYp8HoaXFfsMW5HPDFlqWS7q0mrwCKxLbd5vVfnlc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547050; c=relaxed/simple;
	bh=/XZFEyjJdle07tMadZRlPw1WWxP4+iws2aegDfBRD4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kdi8AeECPrU3QtdsFQh/1GIP2BvEXhIXSZaPvysuh7b4ahnc9VVnQ1liVDiz1uH0k2skNVvU3X5bBR4B8vpG0hVhuqsLoRoedz7u5e544qyOkuvPQMYNzgsZNCEXU9ym3YDiXegqiJ2juZj6OxOZg/hzGCpS7/ZsDqbjLtoEE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=L7dvL8Ta; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="L7dvL8Ta"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 44AD33D81902;
	Wed,  8 Jul 2026 17:35:02 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 498aQrijUzYB; Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3A0E23D818D6;
	Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3A0E23D818D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1783546501; bh=Er0KKoFtW0S0Xh0OGKnwvigIgq5VaT6QTg+x1kMiIOU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=L7dvL8TaGIJbDI878MA4kd2J5HGydZ6T9IYOEhqt6Qsh9EuNMTnnlSfF/ZmS0ExSu
	 Wk3PCK7+q0n7LJ/aSx4dKq3RJ6CJkhiumRonGcn3up11oWP5Nplu42L/vGpubN5Flh
	 6Awg9mWkXxTYvjpvSuzJIeYLy6IL37o1BjiUlCqot/7B6QAb6zE+rPkKdz/2UJ7lkL
	 Wn3d7el/Et4uZHztzfNNAw2ekVqY4RNaV/kEHIOrOQ8kpeGhVe3IZ1NJbjh5+Xbl04
	 Qn54+Nlh3GqsbSzgTRW+3RR/JVEBi4Iwk5xu7Z7BzUOD37P4WSKMRPAKpYIZEstiV6
	 gLaeTxm3tbfIA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id yry0LCDVC--a; Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id EAFA73D8171F;
	Wed,  8 Jul 2026 17:35:00 -0400 (EDT)
From: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
To: Jagan Teki <jagan@edgeble.ai>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: [PATCH 0/5] drm/panel: jd9365da: add support for DCLTek DT300250
Date: Wed,  8 Jul 2026 17:34:55 -0400
Message-Id: <20260708213500.1867092-1-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series adds support for the DCLTek DT300250 9.35-inch MIPI DSI
panel based on the Jadard JD9365DA-H3 controller.

The series includes the prerequisites needed by this panel support:
enable LPM mode for the jd9365da path and add the prepare_prev_first
flag to drm_panel. It then adds the dcltek vendor prefix, documents
the new compatible string in the binding, and finally adds the panel
descriptor and initialization sequence to the driver.

Marc-Olivier Champagne (5):
  drm: panel: jd9365da: Enable LPM mode
  drm: panel: jd9365da: Add prepare_prev_first flag to drm_panel
  dt-bindings: vendor-prefixes: Add DCLTEK
  dt-bindings: display: panel: add compatible for DCLTek 300250 9.35in
    panel
  drm: panel: jd9365da: Add DCLTek 300250 9.35in display

 .../display/panel/jadard,jd9365da-h3.yaml     |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 251 +++++++++++++++++-
 3 files changed, 253 insertions(+), 1 deletion(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
--=20
2.34.1

