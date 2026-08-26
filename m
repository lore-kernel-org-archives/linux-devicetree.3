Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146A53D9DAA
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747800; cv=none; b=AWNqLdlX1a0K1lgEIE4olHZweXCsf1EgwgqiKk9FREVmr7/F7hBCb/mEZj1gOgXTWWWbrgWW2+xyTt9dPyUXP0wo3pwaqmD9+FpO7QzlgDGD0Xgo4lV7EfD35HAxJbLHKL+HscpqpYfLjJI6x7FWe/cylJdxSIimsqvKYKSYVpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747800; c=relaxed/simple;
	bh=bZCTslaMfY2yHuls00yoeNHJSejBPMWhnKOx5GZU7Pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ky2D9jrkx9bq+2QfiJinjiB4RZFQxpb1eV0KH6sWtLIza8hql7uk49XMOZ+P47FKl8s5pC2325wN5s25UwcFnDQuosuN7MnrCR8isrrTr3G2EuzMNKHWSe24n85VfcZDaSEhgj+i/qboVUPOenkQ0IVnVAFUs0NCMWAtqTnJzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmL3a5Jy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmL3a5Jy"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so8293055e9.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747797; x=1788352597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W53+ozmmytCKTsz87hYJRPt8O2Llloot50egnShiA6I=;
        b=cmL3a5JyS0AuNTJC+EGHhBr3h6STNiq7p4P9sUmz+8w2lRxrncrBLIOgwXOy/FjLMR
         fx4qyQSjXyN/Z9a6ibP4nPB9z5luJqgfykhGKAe0uUxKCqNjKus7HicRG3t8SXNNREDv
         IgHgv7gUX6pctWhhg9sWS+A4iUmFyzsood+GLy3TbWZ6pcqVmtB6ZfUwkexzjETmPXiW
         u2i+a64sxb8SdVU1rF7eHYlYd14ycYw49fHWTBwU56F55qDwnDKkvdygpLL1n0ykHL6M
         Jh7RFlcxG+9UwOEQVMqmEK0mwiNLre8YreLl6qZCxgUOltmxhMsysZ6a7r0gyMe847Ej
         zbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747797; x=1788352597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W53+ozmmytCKTsz87hYJRPt8O2Llloot50egnShiA6I=;
        b=iD3BTRFcRwLwoxO7iFgrwdViUWVx32cfnU7HxIQT59XW3M6nNJyk1gEv2My7uXzrdE
         Gu1N6Blz1lvpdzYdZ1y7P5ehIxzmSAzBOZlhYY5EYta/fMaBJ9jvI5+xqd1Wp1tq0Cce
         tWKQJZbNbPvlFVrQth4Fj/tAq3r369fOx6Lan/jIPwvDiKF9pS77K3WZA41k3UrgoRJ1
         R8WFLtdHJwj2EaVjb6qSxsq2IJw+XsKCG9PncLjkqBanMjmgvXFRIy8KCdGK3lFKn0uH
         9/KQcKf1QggfUH/2A8lzMMjGJA64CZj08v7wN2oAOZy5qCee2PaT1YtoSnJ8Gg8mlqZX
         6Iog==
X-Forwarded-Encrypted: i=1; AHgh+Rq7XDDJoKEd6JXsowN0WhcxCd8JyXn95eG5d95JkMqynWHnMY0MW6WDi5+Z7xHJTwDQ2JgAtDPlUA0E@vger.kernel.org
X-Gm-Message-State: AFuF++lngqF+DFuqekGM946zaicrvWcbnvL7/6z9awOh/NW+UhsVxkgh
	m4HbnzuoPLja1EmHIutWIZcNyDME8aQ4SyJXr0Yr2dysv+JLbTAsxLMl
X-Gm-Gg: AR+sD11Z0sgVqIc62AIChPYtrZ4T9+7EPBc8UF+soIU+udnvAcqhBShQ3Q56pbb/ley
	B8QS55UXAxhxVJKjeZ5Cy63JHjUwOBRxxflB5XGxWV7v6p3jHZf9YcVEOWRl5ITvGkG7F9JVo2V
	p7JA4jJbdrPpAfQXvSIfXPWT73PSOZzD0/dxHz4LzrpyD/ni5vFZLUtu8R2p3yh84J3d/M2yedw
	kUxwoE3tRk0rTVYx4ItH2PX7W2PGgrY06HvzkdwP7pG4HukQQTOO5VODOkTHIQ7ApvQAPvEozfB
	pQ/G9mFpvcElmk5GaV5iadBWyf6OLQNrXbEzfn/obH1rq4ccqY7i1/fze1Pcor9Wb/tv5PPEZhr
	CTpvVzAgPQhqzsdZlI/31sUx31ln/gIsH4xVqq4JqVHRcDRjPKJ08KdTdjRwDqKlFhk2TISGEKs
	5OmvcKcehEhWy9vNXc0nSXBTkBNUguJvm+wIje0kOtdUWw6fp3hDWxDr+cc/zmSrNUM//GcJ+iR
	+K9ruQAgIgYPwr9ArKS72+sheQL06LkbN2VaCKcNsS+NOU=
X-Received: by 2002:a05:600c:4503:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-499dc6f6856mr63320205e9.4.1787747796976;
        Wed, 26 Aug 2026 05:36:36 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc977692sm26009465e9.6.2026.08.26.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:36:36 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH 0/2] Add MIPI CSI-2 receiver support for RK3576
Date: Wed, 26 Aug 2026 14:33:48 +0200
Message-Id: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACzdjmoC/0WNQQ7CIBBFr9KwdpIyMAV7FeOiwKBo1Aq10RjvL
 loTly/5/72nKJwTF9E3T5F5TiVdzhXkqhF+P5x3DClUFthi11ok8CUBQvYzhKmAMRJdsEoH7kT
 9jJljun99m+3C5eYO7KeP5LfIfL3V0LTM/p2+WSpyDfmoyHQQxv0DULU6Wm1Rkutn+ZG4oTD4y
 +mUpr5xgaK2FFWsb0RytiOjmGg9xNYZJM1RS6vF9vV6A70FmTnwAAAA
X-Change-ID: 20260825-csi-2-rcv-dts-7712bd834de6
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787747795; l=1518;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=bZCTslaMfY2yHuls00yoeNHJSejBPMWhnKOx5GZU7Pk=;
 b=D5SZuHOEZFLq4kV/bI0disa6qhctUgipBPOTdKl3tjbmw47te+DHUq8yqwhgqFIQKWdbWjzoB
 vOdGow0S2mZD2zoH8t894Bq5c5ei5wyPao485qKRl2S+x7izKKzRIWf
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

This series adds the device tree binding and the SoC nodes for the
MIPI CSI-2 receiver units of the Rockchip RK3576. The receiver is the
same Synopsys DesignWare IP as in the RK3568 and the register map is
identical, so the existing driver is used unchanged via a fallback
compatible.

Only the two receivers fed by the Innosilicon D-PHYs in full mode
(MIPI1 and MIPI3) are added; see patch 2 for the details.

This series depends on the RK3576 CSI D-PHY series [1], which provides
the csi_dphy0/csi_dphy1 nodes referenced here.

[1] https://lore.kernel.org/r/20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
Amin Gattout (2):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3576 compatible
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260825-csi-2-rcv-dts-7712bd834de6
prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v1
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: aca697161c21e19fe3a7f62f208da0f6c3b666e1
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

