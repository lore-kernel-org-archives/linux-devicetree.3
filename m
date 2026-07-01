Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD4B224FA
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924395; cv=none; b=Dp8/OAR3cxT6yAROKgp11EpqnBtd01bfqECmYJA7qvudqZsiMXRR3ceiJTUIYUhqaNgdLpHTk3c4K4dvyqhjh62appj5Glemwo6bH4cvyflEKUkcWrzTEzD/lXDOTh4X7pAh+UtXeuD/hnLlIFYf7qAu0CLCf6veofhI/2xgsVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924395; c=relaxed/simple;
	bh=Y2ot24RtOf+fR+WFuDosKmSoacrMFzUEexqbkUEE4v8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pwf1LGQYTUOH0BOirZm7OusSzocM2dPqT2la3D2+mKat3PdbEGtk832amaDKZzfWfAXxpTn3Oip58qMe9hJl5V4SkP/zjFZYdHUczEn3uXm2s5PGo8ZaGqjJ37M04PX6eupMSpfyuKlDth2CPsmCcUmMpJLYcTaatQ0beCw4D0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn+AURP0; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn+AURP0"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2c92ee66a21so2560855ad.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782924394; x=1783529194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BH3aXRPDtZZz9bN5AoHSMjbqzIj/NyvWxAh/Zcap9hc=;
        b=dn+AURP0cYtm1Aw0A9W6A3aD2nY5IQ3dTekUXEJTfcS9x+hPsup9fEHf4w4QNQYx+C
         bX621ivgz/Va7za752p0HYsTLVAI15BBPKRbGJ0dmau3PRTAHj2uyLj9P7spt6Msmdud
         HKRspKfz/QGiJBpa/Daj1ExGeJ81kDAdEBvIB07rt70yNYmi/knA1qgPCaK+5ZGM+iG+
         f2ItP5ve0WPC9stQTB8iX1zMw1YAPpvFhG+a5sCM+C+KHKdOGNQArQOtRiaE/A1iWN0Q
         dL6Us+hG7ZCbmaTUoFtFbU0kIwmr9HYoRYulyYJe2z70Bj0M0RZV0TgBCAH4xaY+LwQE
         xWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924394; x=1783529194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BH3aXRPDtZZz9bN5AoHSMjbqzIj/NyvWxAh/Zcap9hc=;
        b=QdMK7meba/iPzNBCeu6T6YPp/ArDTAFI8PRU31x1tL3h/MOLDs5CzW3dW9FaLh//dV
         +Cu3ZRP/foO18YMuFu60KKuZkNBjDVf+qnYXyHnpJEddUluCZMHfwTgtXtdrxv4nmvgh
         NOZ4872eB7kVq3ItMgFhnuyKblF5bxH6b1NjlfLGtNgWZq9IjPbf/S2+eYZPhwhB17mw
         XjgUUuBQu8szi8QO+M4yKPjk5dvtS/++07Tej5FBT4oKobZFp+Lnz4S7uYQrBKqU3Zty
         LTZ41OysqAP4yxfardkgkq214XNOWSgr54sYZVKJEUVtuIXukVFQHwncJ/ZvTdTLwX+Y
         gHjg==
X-Gm-Message-State: AOJu0Yy7SM62hwxUcW3MTcHJl9sG3WaEZBLUMnGNaIvrUSem4tyxTKER
	Ax1D9TtVy9WIdQ4lXp/F/5HzvHv8tsAu85YFiKr39m3mpJ8Eip9Q6Ri9
X-Gm-Gg: AfdE7clrKzDpCAa+B6M4mrFAin8fpEwOr5cTTj7+UJ7R0JGnZ7PtDgFFgZRfPPx0RPy
	ePrc45Lt9dKrLrXToWy4dT/+O8nQxIGLYdYoi5ngUvYGLvzP4/D9ztqzILU9qiLyeG3UTksV5hP
	BI06lq9/RNFYMIiPX8H01dn7getz46zlkyuq2Rp8fF6Qp/9C7xtEs8i6dROF5y8VmUYRK0eTZWb
	/5dY6+Pf5/502xuJmuVW0TKQsCdEBGlob9jCyWIrFRttPgscR3qkIBtnyh+FaSZKFIgE/QX9Hnu
	tla4Xbt7VTmv3pcgTjG6IJd3iV1HNqoI9YoYScGdItCYas3DgAZtfV3Rix/kmaDUyONoUUxtAJF
	/gtxRw64JnGla6a5/MOnC7ueIJsHj+T3FIyYkCCYC2gg1RtCuZuPfJZHzyEyyjodu0W/+u0e1UU
	WnNzFfIDTg4Pc=
X-Received: by 2002:a17:903:19ed:b0:2ca:594f:feb8 with SMTP id d9443c01a7336-2ca7e942459mr25214065ad.47.1782924393632;
        Wed, 01 Jul 2026 09:46:33 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a911f4csm985015ad.29.2026.07.01.09.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:46:33 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 0/3] Add devicetree for the Graperain G3568 v2
Date: Thu,  2 Jul 2026 00:45:41 +0800
Message-ID: <20260701164543.3967388-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
- Fix trailing whitespaces and other formatting issues.

Changes in v3:
- Picked up Acked-by tag for patch 1.
- Fixed text wrapping in the commit message of patch 2.
- Replace the legacy 'gpio' label with 'gpios'.
- Add the Bluetooth UART child node.

Notes/Unchanged from v1:
- ADC keys have been verified with evtest and works fine; kept unchanged.
- The 'regulator-off-in-suspend' property for vqmmc-supply is retained.
  This is a known issue shared by most similar boards and should be
   addressed globally later.
---
Coia Prant (3):
  dt-bindings: vendor-prefixes: Add graperain
  dt-bindings: arm: rockchip: Add Graperain G3568 series
  arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3568-graperain-g3568-v2.dts    | 931 ++++++++++++++++++
 4 files changed, 940 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts

-- 
2.47.3

