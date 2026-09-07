Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071CE1A9F91
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781300; cv=none; b=nG2y1Qh8tjTFjWP9C23W+ERfEVMBegei5B1GvIhiCkwWZsHTt9wyyUfjolGjkaA6y+hPI9w8oiubj2oWlWqBsCWPwtmuWFKinaTFp8SNR/sYyovhsKmo+Njq341Ml5kNIhrzmH+yx7+8Kc7U3sZ9uDGSLrWxxcNPwC2bzrd6aB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781300; c=relaxed/simple;
	bh=zZDECq2bmY7+ZdpePaPahcwPBF0z8nZz5LFse5CLo8k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hw4TRaXktRrjCmpyT75Sfwt0YpoM4NGan9hWDF3xlY67bv8VepFgvt/AQSPvIrTzrY8bggq8QvV0+9YnRhcEqUnqSf/84/QvQaSBZORGbFyfWjR/Hy3EXaMiqoWrY8yRuEEFvOcQ40f3ssVOR5AgEUn6Hjz4a2ZvFhX9DabTPas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLilZNHk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLilZNHk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso30695635e9.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781297; x=1789386097; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FL1mL1XVE71/okiZ+ZMIYLV77/ov3lC/JuTKkmsqmjo=;
        b=hLilZNHkQZNQ2GEXHI4KAzkw1psOQhzBNcbcKuEM0/ZJ2ue6RBTFrYNlrPN8SWpk1R
         mA/Ww7k6IYSB0YeAlYsNAEjWI40uuZ/OptpJ8v3a4ahHULbjzkppNd0TvY85BsygAOX2
         z3761k1G+Uo0iTo0GMlgX6t4Ha5FI8pjnSg9K4NxWOcO2tjng1ybU3QEPB2NOsEgxN3+
         JdBoFmGLST6BFhDE7U5Ad0Bfx1I7lulmEZgrpryrx6Kv3GHkbpIK2iFkPo9bfp7dfgDR
         LMK+CINexc0GY+jXI9SYb275x6HjSS61y/XcWK02JbAm6ZIM/U/2xBXWyInR9HJBpWja
         ZY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781297; x=1789386097;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FL1mL1XVE71/okiZ+ZMIYLV77/ov3lC/JuTKkmsqmjo=;
        b=U2/ccBU4v03moA7RXg9JlR/7xy5y2RylZXisR+vWv02kO98su6XbgzPfjYApTxwHTE
         WNZPovIDmYPPjiulHM6MwN37CG02oZUjTXo9CehXWx031AeiXLp3Do5iFWhJiHyPrJ6K
         1oqtRMGS5U2Q07/eJPA0s+gqI4LF03fmZ9pjVtiMaJh/uz6U1lNgZd2Q2M3NygjVOv4q
         jRiSwrCHnGT3uaRcVQHlkHQqjgTqsQMrn/ByubJ82xklJHPL/MVb+kO1dmVUijQzt8A9
         64zQ34hoNAXsj2gmfZtYVqrWXSXCfmcxND9WDR8MiTPKrFahhuXHJg/rwcRbeKzExidl
         IEWw==
X-Forwarded-Encrypted: i=1; AKwUvBxiob32vAzr1ERN9dC/ne7o+XLlYseT9rwlBKAewFStze/EimFsYwRnBC51QRaI77Y053xVXa8TFrne@vger.kernel.org
X-Gm-Message-State: AFuF++mDuwo4cfiUIiTEW9VQchBaD42Bi3N8SBQPIpNtfLjgQO6CMUI6
	NmnQ+dDE1pz5HneQR4IhpE/KpJQzUb8HPIl2oYErdU9mJgV5vVzHiYOTPmlwDGsX
X-Gm-Gg: AYBFou1dU9iK0t8RDqPID3v7gMH5mAgm6qjUsehKSL1VMOoZP1uo9fGNemAlTEBYXbL
	/lDw9Dqo/UU9cGQvoa9PxfJAIBOQYjxW8FEI9AYB6CcJzTYlkEU+S40J0wDGHCP2Pl/p3Oixi0X
	81ryHJ5FmTY/eM+baUAUyB8k42Yzu+yMhIbza+6OBvtvwQssk/a4Tx3fh14Flj5bz3MkoF7CqzL
	wAu9UEChWHGWvo32aqR2RjDy7bHtmB2nremeeja3ErYrSFukahzmvdCwKoM7efsAsl6lVopf+Bc
	vTNJgxQXPd1TjJUvfmSqv1r41TNmugjyjf7niqBKDvO78JOjyl0l6T9pto5RaY6YWt7hA+SY2sv
	wQsNiXCiE7AXfe99lRI2Zp4MOce0NYGzpTFmIpkpdmHLzqRNU7lykxJgK/PnRuG15vX0BB8aC98
	XHZ5A4cAjmlNPkXisf3h6ouUTnkGaZ/UvG/Fge5BoM6xmrd9wRhCAWYlPYBD/FMT91ybf64SkpO
	I/leO4ujgGSPQB2wLdfQozSnJIFTbw2DqFRrGAovOSMyGfjFB2gG8cIKFRicXA=
X-Received: by 2002:a05:600c:474a:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf825d722mr202658655e9.10.1788781296694;
        Mon, 07 Sep 2026 04:41:36 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:36 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/4] arm64: dts: freescale: Add Verdin iMX8M Plus overlays
Date: Mon, 07 Sep 2026 13:41:29 +0200
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOminmoC/x2NQQqEMAwAvyI5G6h1EfUr4iG0cTewTSUFUcS/b
 9njMDBzQ2ETLjA3NxgfUiRrha5tIHxI34wSK4N3fnCT6/Fgi6Io6RzTjpoVAyU2wlzNl66CxhQ
 vDNPwclsMvht7qLXdeJPzf1rW5/kBxWHdJXkAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for the Toradex Verdin iMX8M Plus
SoM. The overlays cover audio configuration, a display adapter, and DSI
displays.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for selected carrier board and accessory
combinations.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (4):
      arm64: dts: freescale: imx8mp-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mp-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 7" DSI

 arch/arm64/boot/dts/freescale/Makefile             |  28 +++++
 .../freescale/imx8mp-verdin-dev-nau8822-btl.dtso   |  14 +++
 .../dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso   | 102 ++++++++++++++++
 .../imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso  | 132 ++++++++++++++++++++
 .../imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso   | 133 +++++++++++++++++++++
 5 files changed, 409 insertions(+)
---
base-commit: 26835cf70bbb6207214af55495ea8bed9ea96775
change-id: 20260903-verdin-imx8mp-non-camera-overlays-ready-c9640fdc2183

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

