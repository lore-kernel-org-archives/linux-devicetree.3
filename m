Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584688;
	b=pdfiLhYHyOWe229HJHG3R3ilFM0Wlz9V5dr1SOTK8NeBRnmIZgY58YPXzRvPe9GBrHb/
	 tXJRxIi/jolXP+5gSlsWwn4GqdqhRpli71Qk0IQVUx0CUOjg7hsGrhXaoSNmyKo2muI05
	 XZwB1i76TQmzkm4yX14cozm0oeOZLY3zAI7ICfoea6TiFHrgQzxRSWzjhr+pRqcXp1sBz
	 0+0ZPtXv7RQEJVZDUKtQKklMyUEUWLcrSs2Z+lXnOMkrpmbDSwoG7aaXjYqV8e5F/Lhk5
	 ylterBOgeFdqgBsAYQYnyQM4fVTSj5A99X3DWIH4McpkM/iBbvTDysDq8BNQ2g4G4sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
	b=2ez/7SUwL+9SR1S22GEj/vlJRQdDXC4bQg7rI21SzZDXTxZE580qg75Scm4ZdyTXNbpp
	 iZZziAT/IF9DEgot7iYUlFThZuNlNK8SeMLxBiHpZwsnf7lj9lADx25ZAWSfM0ooLGV8i
	 LWk/xs0PpNlBPJmK9fMGwYJU20f5tsmwVfKPgOS/LC6Q46X+JfTGns/ffpKPVQ/VQasBC
	 D7gl72bE3p1OXP7JwUBNGmJeW3pAb1+8gbJ9p5d8vdPSZCETG0OXD7k2NmTbAfHnKi4KT
	 41f+1/9+jMu/OPW3uE9O4AuKCyz3hNezxBRNjTgipaeu/kMpmIpg7pdhgU45sFi4/wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znB3ZRuP;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED25606A33D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED25606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znB3ZRuP
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b308fca7c3so10255127b3.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584686; x=1795189486; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
        b=znB3ZRuPIx2tFbkT7O/WHNPN88Vd+sg3TNsc+4pfmFlIvztY892FPGMt4HZ9ScuB7y
         PXhMTlVGprbzBtOqIfFv8bF09nn5nx8LBN6JFcHJhLwKuga1oiFYwEqIGNiHp3GKbjCf
         2OfMJr20PZD5T+pciXGbBYw0CspnkWMGJGURb+V26cTFeuv3JsLzTJY1E0I+ODix29x4
         aghGpKPSqk/X/0q52mIsTY/Jwt1O+VL6ck38s+b7pHMeFEo2WEhkNlVsL0kEvcDFdFST
         P+Zxy0ZOj8kTf3t4LUoMkct+hxVpu9FYdWxQt0NNCdJ+kvR881scD7++pmRnXT5ygWBT
         cIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584686; x=1795189486;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
        b=PhCgmJcrecKPT766wnHON6iVgl9eykBGaiS9J2S8Fk5HqDN7H8MBZTTsqyRkq+D52f
         9KUdicNHOkxhOAfBwHgTHKJ/MmOZ2ygIgOv72Fh7keiC0gKOgNF1cWdViK4K9lAfwIug
         CCQrrv4lY6S8CrPMoC+at/0P/pjLTt7KoSGXvbiArrlV2nWYOSG/K+66lLVbHxyJeyKW
         vNy8bwfIW2C6SKYQDOR89uSj/lTJLpk0jRItwzgHd15+CNFGdzeBg1TAy+ipkJM0o8VF
         S18/g6BVaPJxDzPNcZF1meINRT9uX107SRmFi++HIV9oOop6GG8qRauuYQHUmSLRe/iY
         sWCA==
X-Forwarded-Encrypted: i=1; AL+hErEyT5QLjhmr4ZwM8/RITfxlC1iI/6vLHpiEwqKetHQoypI2yo8btUC1syUcLKctGUUGUZVLNXDcGs7v@vger.kernel.org
X-Gm-Message-State: APuU4Z+iJX5namzHLdxDr1ZIfNe+7cpN1nPA+LNtCpaPK9eAa13B22Zi
	adE2k/q7DnA5xGzv2QWBOXjrUq6S1ljTEVp3li8leu1ClaylewYZ+eOtnpzo++Th
X-Gm-Gg: AYBFou2FQmNHveQag6sUNPqBNrqM7wx2dqmAptAiWveeFMDV6a5/E3SUxKUIKSZ4Ndr
	PuBpoH+w1xferaw/yb9wwg1/mKxAdMGAB4DwA2CDMXazY5I23Kg1UZHHHngm+utu7Em6kCdsP62
	vWeVYDi4+ZNcovOJXKFyAqcl/rl4XJpocTcEN5BgL+qgvidd4BZzq2XqprnCWqUgi4tWP26b+o3
	WC6T5WDDAxFMyfz8FJzXYibhr2X4x3bYFCsKyUAfEFL9Tkn2XoiiXRg33FBk/QECj71MYsxmHdA
	kNAFJJPCHVyLNLPPVLVrhbooesRwrQb8eCcaqoB0Jg4tXOmrNa+s0XYBq4H6Em3PohFJGEi7mrz
	rKnDOm6XPxHsnXRUziw7jRab3OPnyf4DlpW/2w/o1RHj+IbbOkz8B/nFWLemrCcPXGoBxSRZcut
	03MG02/B3bBbIwxmmKdDAwvxiRweGdMxzLgQvfgumhBnuCkJp9u2vvKfSStVEUne45+tzCotF6T
	nbLTEC3OrWC0s1bQXGI+xx6G/nCXOEKHCdTWSvwl7T/Irpq24DzE6Kfgs0fxy8T4IesWYaKbuSC
	rjCjP/d4LgVOu7zZM+AWRLKyQj7KsWLH
X-Received: by 2002:a05:690c:c:b0:8b0:acc6:8e5c with SMTP id 00721157ae682-8b4aa0d010bmr18869707b3.9.1794584686400;
        Fri, 13 Nov 2026 07:44:46 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:45 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS V1 and V2
Date: Fri, 13 Nov 2026 12:44:06 -0300
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEYw92oC/x2N0QqDMAxFf0XyvECtTmS/MvZQmrgF2irJKA7x3
 1d8u4d74BxgrMIGj+4A5Soma2ngbx3ETyhvRqHG4J2feufuWD0GzUhfw0WZLYbUnLzPecPKSlI
 wEGGqZEhiWwo/w7U913DDGAfH89hPBK2xKS+yX/3n6zz/kx2AHY8AAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=2077;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Q2mTJ7efr148vCErD5HWpVyB0Hsq6rr3sJWLD+6PnOo=;
 b=vwPliPd0FIeZAo0T7lJ0fzGLYLA2vrxZUR15hNJE5V8Dv3HtNT1J36I0IQnXVen2qdujDfggD
 A7g9G3o0h54BRVOY8/FFs151oqWBfQUf+LD4RD6K2r/B8BQ0hV/Z0AQ
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds device tree overlays for the Toradex Capacitive Touch
Display 10.1" LVDS V1 and V2 with the Verdin iMX8M Plus SoM.

The display addition covers two interface types:

- Native LCDIF (LVDS)
- DSI-to-LVDS adapter based on the SN65DSI84

Changes from v1:
  - Include 'tdx' in the display panel overlay names, to make it clear
    that these are Toradex products, and add 'v1' in the Toradex
    Capacitive Touch Display 10.1" LVDS overlay, similarly to how it's
    done with the V2 display.
  - Link to v1: https://lore.kernel.org/linux-devicetree/20260813133335.1941580-1-leoreis.costa@gmail.com/T/#t

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (6):
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2
      arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
      arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile             |  30 +++++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  71 ++++++++++++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 107 +++++++++++++++++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso |  94 +++++++++++++++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 129 +++++++++++++++++++++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  95 +++++++++++++++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 118 +++++++++++++++++++
 7 files changed, 644 insertions(+)
---
base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
change-id: 20261005-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-034c30e8416d

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

