Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68E40F8F4;
	Thu, 14 May 2026 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770636; cv=none; b=j3oxUnPIBr/VpovSae3CTfii5tHZZLHtr71OVtDhSnIbia2fZ+Chal6Y+61+K/sSwh2JRdXnJLZC+TSEGYH2NkNL4e52kv9ux6xsmNpFYP+HTjB9T3ljNXkMg4GKjp5rYkVg4WUG6Vbs5nLebAY+qOY8cTwBRa+6yAXeHG6RPEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770636; c=relaxed/simple;
	bh=jf0R18WespItFzG7ULJQW6zPsWauxoz3heCTUJvRNI0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I6XTyKF6x8NtBZ4YYpLIu+VokjW85deEx5qDh3w5Gcl4ItMBcR3g2Pg762gJIQQ3yQrHfU78OOZa8EZIM/k8z2XNA4lg/V9RuaZtc3OtjZZRpTSUYWdFwJy5Dtc5OmykFufk5DdVoSdf7/zGnl86Dk/g3+xZ5LsT6n6Bc4mWMRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A4c+OwLB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A4c+OwLB"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 048D156D;
	Thu, 14 May 2026 16:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778770616;
	bh=jf0R18WespItFzG7ULJQW6zPsWauxoz3heCTUJvRNI0=;
	h=From:Subject:Date:To:Cc:From;
	b=A4c+OwLBiKuD5/Ckxxh+/cq5XKI9Qsd1wK+F1MR32yca/maexmXtm7/VGzHpvIIU9
	 MZDvmPmzkg/es7CeDea/80X9X6J3EtJxN787Vl1BmqGoA6sO6+cNTg7JCNAjT+h4gD
	 OF4QI3F7bXv6f7b4jazJA/JSw9J0sM7Ngjz20OwU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/4] arm64: dts: ti: BeagleY-AI camera overlays
Date: Thu, 14 May 2026 20:26:26 +0530
Message-Id: <20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMBAF0atIrw2YoHG4irho41cbnEhAFPHuB
 pdvUfVQgBcEapKHPE4Jsm8ROk3IzbxNUDJEk8mMzQqdqx48LbiV4xWegzLawXJdcTlqitXhMcr
 1H9vufT+AMx70YQAAAA==
X-Change-ID: 20260514-beagley-cameras-21ce6a98a7f1
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=jf0R18WespItFzG7ULJQW6zPsWauxoz3heCTUJvRNI0=;
 b=kA0DAAoBQ96R+SSacUUByyZiAGoF4q6g2UlOdI+V6i/UR/BKlMTnnU6lCwZf5/vUmdcnXyJDm
 4kCMwQAAQoAHRYhBE3g2Bjl1XXo1FqvxUPekfkkmnFFBQJqBeKuAAoJEEPekfkkmnFFg7gP/Asy
 l3HUOHGfxTu+T9Lh0u/IhJt4/Fk3/cK4DlJifXorUTFn9+5ceRrH777f5M/ZB5r/uXtuPkKxBqI
 NDBNwInjr0WZepQuJlRBlignVPp4iwfqGg5NRzdP4UI1AI0N3u5tw9ukF4Kux667lDgCkd85IuX
 jLK+5IxqZUtXCiclOREpOyft1/Z0qsJDMVwNhHpKwAQpGdZwUqcz2L1WhlWZ6hYdNm15TAcA1C4
 9oTdjd1AKkphIMROuszq6NJpQImmE2SKzCws0VgDqazZLX782xdchNzYLQn+fhPfprVbZ0CCyn7
 T92Q1lavdggBWumzQJrTYk19gJxX5Z0URDrBsy0WHjAZrrZymn6OcZfbLyyeNWVDG//h+L1Q+sg
 7vR1zd2gBk6/7Jo7nOd5hRf6A6+3/zPNtSLhXtqTXmkSMUh7Ksw10sRwNLahRHVGcXFmQP5ZVZa
 mSXjvSfYTpIJW9Veigp2HDRFF8IHWjDgdfjAzYe2km47Rs8m0qULHIXEBTVBFnzv2rMjhkk1VST
 VImUt5C/6TJQix2U32pvlaTKgtINg7nGFVKcNKI5I+FwgYJ2wl+soMDOycyuO5S7l+M1l2uJJk1
 JasDSzn3SK+6IJfXNdN1Hqspnck/zkv0tvWzNviu4Pfp6qU51l4Z8H0A3HkdFSs5OEyBAaZi8Zc
 yN1QX
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series adds support for using RPi V2.1 camera module on any of the
two 22-pin CSI ports of BeagleY-AI.

The first two patches fix the base DTB to support I2C-2 (used by CSI0)
and setup the DSI0/CSI1 mux (used by CSI1).

Next two patches add the two DT overlays for CSI0 and CSI1.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (4):
      arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2 pinctrl
      arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1 mux
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI1

 arch/arm64/boot/dts/ti/Makefile                    |   8 ++
 .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 121 +++++++++++++++++++++
 .../dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso    | 121 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     |  27 +++++
 4 files changed, 277 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260514-beagley-cameras-21ce6a98a7f1

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>

