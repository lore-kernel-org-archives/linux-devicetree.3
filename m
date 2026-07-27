Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032A38D3F7
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138038; cv=none; b=D9ezPx985YrVLJNFXmaQm2pwmi3lN9yiJ/TrGSijIZsqx5/nUFL+xEt+1lqP73A0vI9M2yLboU+xHTTY8XDXRoL8I3WF8WcQRngjTlwgDlFuc7DZwaCNAJ+Qa+z5/aLDaCDQf7Ba+dj7YQJed+194qo9L78oPokMdzygjeqzxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138038; c=relaxed/simple;
	bh=OygoRfGon7dYJNR2US0LH9/35f6aArMEQMwU3t4zO6Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OlA/udTxrhHKRP28OHTkxqcDz2Vf2Y1WcD+gsxeG5/sZlZT/MFp+B+36HI5Hymhs/HQgahusN/2KCngGQgijJ8TIt8PIN/SrNI3mejcwpB6p2esUxic9xrpd5cO8BpSq+toCeCrfGbcTQYevTuo3d7Oyr1aOBBG1xSyC4d0VcHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FIFDABkU; arc=none smtp.client-ip=74.125.225.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FIFDABkU"
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-4784b41f3aeso691348f8f.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785138034; x=1785742834; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ymwueSqv0BpYNpyWUdRv4xMRNQnOisJ/XLIc8X3z5E=;
        b=FIFDABkUcJTTZ8mZRUcz1VrLSa6yCwefhcA1t5zl/G//6FiLyd4eKUL5Yn08/FudU6
         B+1nFwux/+q7VMXhQ3HnenNOY0/tsgnihjedxh8JBt3I7XzsPMQ6ZxXc277Yu64/3/zC
         UxI6axm4XbJRmpMgfxl37jRlhuOJcNidC5gpIa+KlaMKZB6aEEi7n1mKKzKAIklpZaDb
         UZQJd1kL9kt4fgDh11SS7XGBH0Zb4tcamX9lZm8pVyEDGoRyjZjgb4GNLpOL7KH9UYfo
         HM5KRAyjShnfUdbgX9VavSWpdwngm1uMqoVB9wDSqx8+KCk5jIaWUyYm6gC3VeRpXBZU
         DAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138034; x=1785742834;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ymwueSqv0BpYNpyWUdRv4xMRNQnOisJ/XLIc8X3z5E=;
        b=BYrgi9AVVLsx8O6jUNaSTWyodLJUkaNRS82Sz4oOOQqPcbaHrPO/wSyI3U8U8wZRSE
         HKOwt5IZj2Pb0ZsEbrw4H0gBifRA5v8f+MgYM/MOHNpeda7b1wQcE8+Oef4nnIKMUm+o
         0sui8pbpP/CUsiWfvfLEqjLxHR3jBbHprwQ5G0hW+wJSCP8mFTjR2rhrucLycTBLkjbh
         fKtEZ8cg8Y89PaTKGfetJB+t8zPOfs12F5EON2I3+gXlA1/e4QLtDpUxX7x+s2V41Lj5
         fqlGGJ0KGqL9oJW/85Ib7QyrbL9vYAZGcf+3dphbfZpxCDBzZzdklLPlzr580LIxRq7J
         j07g==
X-Gm-Message-State: AOJu0YxEQJe408eQIM/0Gw8WiMvTjU2xKPI4DvSMEGvLzojPpKHyis9D
	Yia+/1pbTtkMV8btTohC2JSTU+OIc9dZjhxf/NzeN0Frwm75FsC5d8n/vrlPLQPqA3Q=
X-Gm-Gg: AR+sD10dsLuvuLWQl7YazTI+qwuFQbx2dWfxK0c3zh/uh8nFVOSzyu0gQrrcmBcCmIG
	TKPedR/Qgq/tgugO84h8DX1OmTIVE3Iq2TiTOAlVdS2XRQKzh2ycJsK2LMniCrmwN9fvvv8BeXO
	TBIaIsRV2s11fQXJIC15BI8O+LxuSkMdcLEQ/3jfApBNe503ARdWHSpeplVfzrj6p9H014tzdIq
	WC1TDUr4/lC9qsodsHj4yW8JzUB7zhaWn7leL/E9KPFiRIqAGMwBYXFITmS/EdfUB87o/9gOuJo
	TuvAUBvirMQ9RAMQOr3eROIgGR2MoqAaPZPy3QVWdkE+nXtZfE9bU1SU/e/eZKt7Dx1QscNBnZN
	+952NxOOAj/Yv2ASpBjs3eExR1pcisNJh2KIiAY04ftl2eLCDNkmj6n2/X+nLKyJxcVtjCBX7Xo
	I35w+jgKsDTRqs6eAI83dyNC/tfTKmnnuuGK51WG99XTh5miAdMsHWxBl5NK1KwsvkUN6aR3b92
	pKQRGHTAmcmtH0=
X-Received: by 2002:a05:6000:310e:b0:47f:9425:1a2a with SMTP id ffacd0b85a97d-47f9fe97d8bmr9625606f8f.30.1785138033659;
        Mon, 27 Jul 2026 00:40:33 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm43677682f8f.10.2026.07.27.00.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:40:33 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/2] Stabilize serial line numbers on MediaTek boards
Date: Mon, 27 Jul 2026 09:38:07 +0200
Message-Id: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7ZhSAoIr72FYtHUKY5CSFomEc
 HdbvICze8mb9zcI5JkCXLMNPC0c2I0R5CkD06uxI+RHZJBCVuIiajRGRYWwo5Edpm81oBpYBQp
 IpZVG1rq0toKYmDxZ/hz5e/vj8NZPMnNqJqPnMDu/HvtLnrw/p5YcBWor4zXUFHVx02odWHs6G
 /eCdt/3L/oS1v3dAAAA
X-Change-ID: 20260708-ccaione-genio-serial-aliases-e5f2c28b5ff6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2

On MediaTek boards typically only serial0 is aliased, so the remaining
enabled UARTs get first-free ttyS line numbers from the 8250 core at
probe time. Line numbers are handed out in probe order, and probe order
is not deterministic once a UART defers on its clocks, so the console
UART can lose ttyS0 to another port.

This was observed on the Genio 700 EVK running the Ubuntu 26.04 generic
kernel: uart0 (the debug console) deferred waiting for its clocks while
uart1 probed first and claimed ttyS0. With console=ttyS0 on the kernel
command line the console then pointed at the wrong UART, and the boot
looked like it had hung on the serial console. The failure is
intermittent and depends purely on probe timing.

Pin the line numbers explicitly instead:

- Patch 1 aliases every enabled UART on the affected Mediatek boards, so
  DT expresses the intended serial<N> -> ttyS<N> mapping.

- Patch 2 makes the 8250_mtk driver read that alias with
  of_alias_get_id() and seed uart.port.line before registering the
  port, so the 8250 core reserves the requested ttyS slot instead of
  falling back to first-free.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v2:
- Added some missing MTK boards
- Link to v1: https://patch.msgid.link/20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com

---
Carlo Caione (2):
      arm64: dts: mediatek: alias all enabled serial ports
      serial: 8250_mtk: honor DT serial aliases

 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts              | 1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts               | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi     | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi     | 1 +
 drivers/tty/serial/8250/8250_mtk.c                        | 7 ++++++-
 13 files changed, 27 insertions(+), 1 deletion(-)
---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260708-ccaione-genio-serial-aliases-e5f2c28b5ff6

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

