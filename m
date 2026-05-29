Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF23A1A2D
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036122; cv=none; b=S/FzrLmXB111tTQb+RkdOv8nP6TyJrrGzyT9nAOLqczTUbP2FZFX2Oue9KWdNbyJSt7YKk5Zkm8sU0ZtRHAOt1/TqIPxZW9owu+kZv18c/Hfe1ApYlf7cGiEVLlkzOIVLrDwfx1rkPk3XkKz2YgtfL+elW520sGZUQrYvhWCKT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036122; c=relaxed/simple;
	bh=WVuQPTnVhD5jn2xm00tdMOhJaDEmdVs2QaC0YCOfudI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XUW/Zzim/uJnusk26xe8WQJVM6hUTw6AXT0i8y7/ddMCPZjf7DefsQkP4PPR8ggzzpXvuEVe6nvAe/9/RNU7c5/ZG9oIUGlpH6JCu5YykQiq+WNUQVSUgpJKeBpj6EdakIW/iRFwYO3Kot70IuOyppdv7mTgZHneUHcXmBYKcZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=dpfE71UN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="dpfE71UN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso482880a91.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 23:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1780036119; x=1780640919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd2LNsjvev8hJ0X5803HfD2HDCwhY1MQFBDDV02YzaI=;
        b=dpfE71UN0Qk/kBFJQsjXmR898HPyCbSHuRfm3X/CTlBEjgFYLvHAyf6ZJ5N3/CpQtl
         2+HsZRq3E4doIlMdFffkf3yFfp6pUsiVH3YVWE6CVSsdQS89Zy+pa4JVYEexm5YulnLg
         btNG3PmxIKBtCqn1SKm/bbHtFv/8hP7Juo5/PLGnFM1ouN9BHCHEt+ekAejNQhRtCTYd
         L/Fx23FHu/iTglhVNsBbdFax0NmgnuWxuDkmbrbE/tqD1Pl8ZoPjLNepfmrXInZif0Or
         6t1MA/fI9bqK1w+KaR/8mJB001vca4z1JCwRBX4RGDEps22awu8u23SZrB8ciwH5PZ+n
         Bkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036119; x=1780640919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd2LNsjvev8hJ0X5803HfD2HDCwhY1MQFBDDV02YzaI=;
        b=nf4Gz6Uh8G6EEDcC4dV0wAmlAqq7Ble5Xj0uS7l5wglix885Yh+Oj4QrJWZp5/N90V
         WvU7JrTDjjzQIYqcIr1lA+/BOypvzjrAo1hwz4Dh5ygMUdWyyZAq2rl+pMPrXDtpv5eV
         mOVwuaARI3Q/lksFumFVVSCyyRLKwP0TlTRd05KZ2occ9ryxxXH5pAr5LbKk/4bpUG6n
         aCM2rAR+r2KP04mbDJrC9A6EKtmVohZNSrRcGgVHZjNodnQ3t29lx6qzKqXNVg16Y3aI
         gKvLa9ROyUKAFTl1hkfCM/pHG+IqdRIF5k746Es7orIZN3erlBfhaed2Q/FDotLS6DDB
         XeXw==
X-Forwarded-Encrypted: i=1; AFNElJ8UmwYAaAESjoWEfmKxwBWZtpZ4WQuGGjW+2X6ZM1z3UoZLnVzwWWYaOvzMxVW8++SdgEtK9sI93wJC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbd0ZVax4r9i93gjWPIK18SVV3gnZpfGnYyirKbKo8kguUyTRE
	thq/LtC+NCjbrcWABf1aFGzPvnWiUJR8Hnw2JWx9hFJv0Xuk4iHe9jwPf9bHZVhOXjw=
X-Gm-Gg: Acq92OEYTkT1G2ZMBKDhzvPFajnvnBYdXrAYXqt9+HigugHLFFmTwT8zJIou3447mRX
	obCBEmZdnDPAuNQ1rNHvZyuInV5q2ayeJ7Mx5GRUWceLXlea4+6QE0s6CQu87k505rnwkfQDbRt
	NFtMnwW2w3Kv8vzRBDrtaXUMDvAcyDa6yZoRc8Odn9mFMiybvrVO1MEvqFdcM9tzoJq5mIHXYho
	7ntDcxvLmo9zZl/NBiuCsxGMvLRfLFTME4X4kiLtt03ozYVAoBZxA5BApQLrBtxCLrTxiczGiAg
	6HgJYN4s4+/0qwY/c4egE/jUNx9HXJtfhF9UDyaNpjdPPQbzQmMS4clo8TtPbDfJqQjP48QTI1Y
	+YSwXS1EAJHl2NHpLXWqsMHUNEdNdh2wkK3nCM1IEzV5NTe6/GKeVivYa6vPOmjChSyDsbO9gij
	VMCNbWrAYWFJ+xCHVa546Xs4tE0g==
X-Received: by 2002:a17:90a:d88e:b0:36a:d419:9940 with SMTP id 98e67ed59e1d1-36bbd120f4bmr1912283a91.27.1780036118855;
        Thu, 28 May 2026 23:28:38 -0700 (PDT)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6a340b7sm717087a91.11.2026.05.28.23.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:28:38 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Kever Yang <kever.yang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] drm/panel: Add support for the FocusLCDs E35GH-I-MW800CB
Date: Thu, 28 May 2026 23:28:34 -0700
Message-ID: <20260529062836.203990-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for E35GH-I-MW800CB 320x480 MIPI DSI panel by FocusLCDs.
The panel uses Ilitek ILI9488 driver IC in DSI mode specifically.
ILI9488 also appears in DBI/SPI panels, but those require different bus drivers.

This is a resend of v3. Since v3, this panel driver has been tested on 
STM32MP157D-DK1 in addition to TI AM62P EVK. The panel works in video mode on 
both platforms. Additional panels using ILI9488 DSI can be added later 
with their own timings.

v5: Switched to devm_drm_panel_add() and devm_mipi_dsi_attach()
    Dropped not required anymore .remove callback
    Added display_info.bpc=6 initialization
    Changed 0x21 DCS command to send 0 arguments as per spec

v4: Rebased
    Tested 7.1-rc5 on STM32MP157D-DK1
    Adjusted E35GH-I-MW800CB mode timing to a 14.4 MHz pixel clock with
    slightly increased blanking to make it more synthesizable across DSI hosts 
	
v3: Fixed missing Reviewed-by tag
    https://lore.kernel.org/all/20260204060114.345219-1-igor@reznichenko.net/
    
v2: Added comment explaining the "focuslcds" vendor prefix
    https://lore.kernel.org/all/20260203054121.335441-1-igor@reznichenko.net/
	
v1:
    https://lore.kernel.org/all/20260131034101.307486-1-igor@reznichenko.net/

Igor Reznichenko (2):
  dt-bindings: display: panel: Add Ilitek ILI9488 panel controller
  drm/panel: Add Ilitek ILI9488 controller driver

 .../display/panel/ilitek,ili9488.yaml         |  63 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c  | 289 ++++++++++++++++++
 6 files changed, 370 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9488.c

-- 
2.43.0

