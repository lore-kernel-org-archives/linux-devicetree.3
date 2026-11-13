Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585129;
	b=p/UQ5YGdAhsdeLxx5rluqOUAYNbHQ8gnZ5iqeIdfMUAj+wo2ZzAHsRpn+4mn/wK6qWKy
	 WiDV51BvTbYN7U7A2JLzxoxtiEQT4m9VxNET7WbjfMMMJibz56XaNUO+9pQvL8RboRSm7
	 wo3dgFPvcVdp9pH8Fk5zHcOOWaNXoYOQJ7R7qvD3imZfkqO+m16ldsOyzeFHoHW96KY95
	 r+GfthPVtW17iJk1H6PpmbowWXhy9zU5vA44JsBUXCYaSv57VUMHNLVn0X8qYQvwR6uxp
	 TyIkTQR1WOIWjRoA7ujyk2gKRt4I6/X0AuRi0935s6IudBSGfGqeNEQ3DseDHDLBvIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
	b=DkWjKhKdGNvu246nQsldGgXtVivqFINmTOKSBysNx9u5xr9+dkbVSCQ9fvqu89lNLP1c
	 2/J6IUiCJfIU7K3CqVdjBkTqUNgFji1bWFaas9SqEP9yXfVYI2vlAUa2hZKg/qSAtonHx
	 Nh4a7fzCSdNYSKhUhEfvqvHZMB0Ba2OyJaflKxHCl9iyqilJ6vn5DetiVp8YMYCWN8rd2
	 C9bn5h8wf5CkRtSPsi8rtrj7yr7EvC/5x0sU2zCUhzLcbHYP2M/+U8hKvoiqgvCa80qFl
	 IEFnstTt7otbHj6yI1njL1HdLwMAyHXJZaZFOZOXQ3u8TkvFKs17M/KuVS9HPlsZzTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0AtE+52;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69D2606A32E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A69D2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0AtE+52
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-992f6d8cb51so278020241.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585127; x=1795189927; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
        b=r0AtE+52dDi/AaQ4VHXqjwEYXeO3lJ73BeoWweqbUwUqYYu2BVn5yF5lVpGr5JZOXb
         pItzJA6REojHaUjA2ZXInd1BZ+DmOdC3Pg00wVpbcq6Y/NrlLNNWQd4Qw6uwFIqIhk9e
         vlqKDvvFQPgMeMbNdr1kHDB9piBCFrwbG/bvI8usuwvriqrMc2Oc5Pk3XM89t3fzBLqe
         SD361FvW9ZkmNCjT71/jubr7xEelGFmxdfpnP/hD0VEMYAHpj/E4cQvBrQMLVi5kPVr9
         qNot7Qjs9dKMlryOOq9KDcXQRm0Uwx9WVtqgSQ92vTSPKBqYeWdavLKqldUK6/iQOHzq
         xqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585127; x=1795189927;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
        b=XWh2HVJsiPiReZaso3Xg0IObPCNoI7Cf33/UXs/ByLi1oVHBwD0PywyVyr6k/PPnOf
         fo0V9stB+awzApZvJ4Kc/5uHYjy0obZ3zhWqtcKNPAiTNdg/XHDhoyep2EbMHCVZ3SIA
         EaWlJkSXX6rPvk56YX93FQv5gVwJyZCvcKW8OYRP8gGa7JOa+h8NaXi+JAkUYFj2cQ4j
         UGQRIFq50FFhVqdBffg0Qjs5MF7IcLtgmeXwW79FuwpcWDa6sZ61fl4ysuvz+4U+XcZ4
         uUXQKGlhnozG32IKKTSEJ6lDX4Xk2OkzoLqU7Q1xljjcPoRQrw4Gp3Vn4wQWW8p57O1G
         RCHQ==
X-Gm-Message-State: APuU4Z9sDqbZ/m1JNi0d+XzS/wyTtcSitItAiX+J77kC0fsBPj0KFBQu
	6SdgUyKX+wVy3OkIEBynlgfSP+pC0p5X3FS+vik6gy0oIth9JujSJIkvlWk44SpL
X-Gm-Gg: AYBFou3/uAlMgkyP+UELLcfiJaZRD2TVYVi0AWwZlx9LMNBTi/4KIe19bXQWTbV6N+g
	kd09/T59bx0NB0d3+yE8Wjz1CkdUsSH8JS0ut6IHBE4xgoTZ/RXejvwHEJ/HYlbMP5LOSdjVoRh
	oUsGrVGdfje1A2iAIj224TrH2z9kJPRGAaPVQPbPE8Pc0BGdiwiT3JU/Aq9JGQGaDo8WXW/uLVQ
	rT5t4aM6oY3oY1QV3Nd57/um8nmxQgpj/ucF8kJYql1G7LC5dyV5pyDVQpp7HT2ST74rvfWPtMo
	BpjjxAB8Fe426l93j0mrx0rdHo7O4hKPS9cKQFWkFICIRJyUjnO96vjrcrdSCKwohBD99OVDbS7
	F03K11050FA09egMfCEucIDxUcAgtOXV7LED7GHx25lBpDhU2gbY4Ig34ULZK4+XcL9hJrSd+5s
	YORjY2IxHJPossjVUn27RhnyU0NuzHwvW2zHfXriolay6EQnD/9/pYrl2Og/eqjDVlA6pJ8cXb7
	gNIHaa9OwQEaI0ipAocYcRoKuu+SP0tfVT4AKolszr9K+zh0pdRwaO4dW3MsjY/zxx5SK0PaNOf
	gMaAhUgCQHuIHGKeHNaoGnFZVUuksFMj
X-Received: by 2002:a05:6102:f12:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d64d84030cmr745103137.27.1794585127400;
        Fri, 13 Nov 2026 07:52:07 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:07 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: Add SMARC iMX8MP display
 overlays
Date: Fri, 13 Nov 2026 12:51:11 -0300
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIAO8x92oC/y2OQQ7CIBBFr2JYOwZopOrKe5gukBmUpEjDVFJje
 nexYTdv8vP/+wqmHIjFZfcVmUrgkF4V9H4n3NO+HgQBKwsttVFSKygKbI6AM4PPROzsWDNxOcU
 J5pQt0gIcbXZgEWEsyICBp9F+GFKhvB1W9x2dJXmHKOrUlMmHZdO4DZWfgWvXZ7Mq6v9tAlK38
 rbYqoHf9xjmv5wEf+xPznT+bnpzbUoHl6IY1nX9AQyXlRHxAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=2798;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=1WzCApbm/N+lfLdjiZlJyPKQ+4AjAxmeXLq+NVpvXao=;
 b=yf3UBTTx8wHqJx9v3Stw00xASfc5loBUIuwai4kXTRF28vEGBey+xUGDbjXMB+7XoaGW8WThW
 ZmnAr1ndRq4Di9YRUlBeIFYVWcS6SaUNovwo2EBPH2mYxweV+v4/Vz1
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds device tree overlays for display accessories on the
Toradex SMARC iMX8MP with the Toradex SMARC Development Board.

This brings SMARC iMX8MP display support in line with the corresponding
Verdin overlays and makes the same Toradex accessories available with
the mainline kernel.

The series adds support for:
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive Touch Display 10.1" LVDS V2

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for the SMARC Development Board.

The DSI-to-HDMI adapter, 10.1" DSI and 10.1" LVDS V1 and V2 overlays
were run-tested on SMARC iMX8MP with the SMARC Development Board.

This is the v2 for a series previously sent by Ernest Van Hoecke, and I
am taking it over on his behalf.

Changes in v2:
- Rename display overlays to use the "tdx-" prefix, and add the "-v1"
  suffix for the Toradex Capacitive Touch Display 10.1" LVDS overlay.
- Add the Toradex Capacitive Touch Display 10.1" LVDS V2 overlay
- Link to v1: https://lore.kernel.org/all/20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com/T/#u

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 7" DSI

Leonardo Costa (1):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile             |  20 ++++
 ...arc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso | 123 ++++++++++++++++++++
 ...marc-adapter-tdx-panel-cap-touch-7inch-dsi.dtso | 124 +++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |   7 ++
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  80 +++++++++++++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso |  98 ++++++++++++++++
 7 files changed, 555 insertions(+)
---
base-commit: 45327d3207619a05bfbd7e6f2e116285ef726933
change-id: 20261021-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-a273e90efcdd

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

