Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0947DFBA
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628073; cv=none; b=MYFnx40KIe/CfrKoXVbaqiH6MYED+HZiEKMeJ2zzA9XmUgVsyeZIwrwbdaQWMEaMVQewdMBJYKHRMNJ2MoRkmgRmX4ULefT85k5kwuTulxnlXmuPufG1JLNI0X4sG31J9WbEljZN5ZBTf0V7Yxtsw5Ou981CbQY65Fu1+Bv7Bes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628073; c=relaxed/simple;
	bh=kggwUX68CJFb3FdGVJM1Y4h2BTu9PfteTxG1M7dY3kI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VDFLoQHU0ThIhk6GJI5SbJwT73R7YRoKMx+/AoP2nIdO9DRm5yZKno78dg9iFG1I8w10AP1P6xkTVwx6emmYhIOlWl39oebOIXUjnq+YrZv/eRzotTlQsqVgsu3zRAY/+39IW9rB3MNbPZMgaGhj7HQvqDS0o3dhTu00rDHjSB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFEAU/ND; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFEAU/ND"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce98cb8165so11687235ad.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628071; x=1787232871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOTlHuZ+ZwQpxacg2zaGuuKn6PBZaDI340LCQ90ZSUc=;
        b=IFEAU/NDK3XX00mZd0LRLIrywDkqupWI+a6rIW5VF8l6V/A5/Oo5uGT1djkVMCMCVg
         7CTLVgKK4FjbvJ53IF1f2B5l+8765quFB4cWEyJORl2SfPvacD7eBsKc2I4Yu2+q/VNT
         G2YdI4z7ppL0TcGwphrwRl5HlZKHmVGxbSp/e+H7WarmKDHcOVZr/5VcyNcwxtv4Anzo
         /RdpX351oTxIshP2BD/dwA1T+a+P7s91dgeiqlnEW43zOLHZNFbXCIYy+Y1nno5qYUXQ
         wmiDJbDqz+mOZ+/E2+3+mPD+9ZznBJ4xFbdQOSsOzo0kZdHLvTgw6gRDUh7mKu5yUQ97
         GT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628071; x=1787232871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOTlHuZ+ZwQpxacg2zaGuuKn6PBZaDI340LCQ90ZSUc=;
        b=jtyDnkYDkfD/aAY1PRlGIJsnfkAaqa4vJa1nS5N1W0oizppVfPheIasmJpZTYjqAxN
         gBuT0byhg17bt5xzGgjviP9WHRCJGA1OQ8jVpRuv8Lbf6s9A20rQLFActPOAGYUhAUcc
         w5Dk6zhSX1Ca+pD8WfomRmKL8xmIaym5YMkZjl5/uPOxOVGrVTHc66fjfqHOWUa7zz2t
         pGzJE4KbQLjA9a14Y4s7pjvv2VcYDUAkUj1jzW2erRAQ6f2jFpYenKWrgjXHZomm+KSf
         Lklh9lxNrWIiGJHJM9wFmnESgkljJCHIrjj2hWexXgx3kMcm3ORDbuhbr1OC8bv8VPXN
         J+bA==
X-Forwarded-Encrypted: i=1; AHgh+RoCnuPe9UklTg2oNAMb/B7GD71ZhMn9uLml7oVJXf5hzs+JmKIWZulAluhN/CBkGwI//o3hHG8L9B3c@vger.kernel.org
X-Gm-Message-State: AOJu0YzxAFN+/WRovMdBnKwTLc3fIgDHHnlWzU/eNQpC4HC8s0qWOWTu
	mCG0eRtmzgKIma0kA7LWr844BsAboPVF+Wc9u5IOX3rRHujyzvgcnbTl
X-Gm-Gg: AR+sD12vVq0ktSBKdoFrpAKMnUd70Q+mWmAyGKYLnfWqN+Uj5ZW4nmXY5f4DY0JUg70
	0a9YF50dvCVpoaNUcX74sWCbJb/6yS+iGlcYB79STtZUgLzN/GrQQyCxdOr8j+THI5o/AIphB80
	TBbcnlFDxARudBrUZFScVo9836jbD5E9wADuX3waKDvlAFEJpBKUBSBpmflywlnQFNKzlkKxgEy
	jcRfzjBXprVTa96rM1r/6wCX3J1T9CVDuuRMedt3c7yB78DJdXqknDcyolfsW5juln0nmT7CJT2
	w9OgjBXCriMFB3pPk1n0z6Q47J9J52hiSIzb9fXcn+H8FmAVuX5k5x6f45b8JVC0zFhKdOyujeu
	VAEE2viK1CIT5EllN6h55zc4Nw0rVY2M4dGWhhZVT1B6s96q8D+iIV3+ax4LE0PgbRLNTLMvuVn
	hjA1n7KeSu9Bc0I6Wzq/tQViG+YIc8d2D6WR2Iatuc0Kddxaa5zOydg3Xy4dZgxgKt5hU=
X-Received: by 2002:a17:902:f64e:b0:2cf:70d2:da7c with SMTP id d9443c01a7336-2d37f77fdfemr72669655ad.12.1786628071272;
        Thu, 13 Aug 2026 06:34:31 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:30 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 0/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V1 and V2
Date: Thu, 13 Aug 2026 10:33:29 -0300
Message-ID: <20260813133335.1941580-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

This series adds device tree overlays for the Toradex Capacitive Touch
Display 10.1" LVDS V1 and V2 with the Verdin iMX8M Plus SoM.

The display addition covers two interface types:

- Native LCDIF (LVDS)
- DSI-to-LVDS adapter based on the SN65DSI84

This change depends on other patch series, and should be applied after
it:

- https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#t

  Adds the Toradex Capacitive Touch Display 10.1" LVDS V2 overlays for
  the Verdin AM62. This series is required because it adds the panel
  bindings for the display. It is currently in linux-next.

Leonardo Costa (6):
  arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch
    Display 10.1" LVDS
  arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter
    with 10.1" display
  arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex
    Display 10.1" LVDS
  arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch
    Display 10.1" LVDS V2
  arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter
    with the 10.1" V2 display
  arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex
    Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile        |  31 +++++
 ...zanine-panel-cap-touch-10inch-lvds-v2.dtso | 107 +++++++++++++++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso |  71 ++++++++++
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso |  94 +++++++++++++
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 129 ++++++++++++++++++
 ...verdin-panel-cap-touch-10inch-lvds-v2.dtso | 118 ++++++++++++++++
 ...mp-verdin-panel-cap-touch-10inch-lvds.dtso |  95 +++++++++++++
 7 files changed, 645 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso

