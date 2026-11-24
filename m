Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507004;
	b=04C6AT4612hrNplDiD7F2K1uQWtEr1vZGiuYPq0uTsitiupFHmB98givIAwlVxWUogTq
	 ut0QpS6NI9ne7qVnaFlFOts+IbOVQf7bD5GJkpBlfxI0pV4BFhAfoQTAK/K2XD8xuVqTP
	 O0Nou7D+Xjxq1kZkW9dIOntvVIWI9Ja7LsKYflP2S29NEaTZvdVg5B5iD/dBw7Gf3zwar
	 RU+qGpJ62Dl+ZS9B6JheA4F5Ajpce01fqvIVKkwEOVhRR1wsIhdpJ3FFtFMttDGsEnCDl
	 fIRryl0wwsz2S22/r+hn4D+XV30YZoxoIOO0faAXsm85YhsPAVtNcmFRP3axqkck+gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507004;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=oKOwDJTj343bGkC/S0KkQlWHOXWdBRA/eeZF6IM24kU=;
	b=mfWgyi5iIBpvZU5bg5UNc3ImYkYrPkpRYR44rGGb6gdmEFaVgftIY5bEWoDx/3vnxW+K
	 eXanW/88nae6hYiQtXfz2ul5lb11UeqK0fqA13LmCRHW8N34NfFY+C2BPBGJKrKm8JRlC
	 9WOG/qDQmuiqh7vx2OujZIpNAT966oxPMrbbEfvIVGeYgUozlIotHLlwhbWPJEkGGm6ZT
	 W9ngXos2UiQvKux8FnkrYd3EEicHS34uNSlJWgWMFfhosaUzJe7SWPjTMOQm3hMv0HGfN
	 xbGbwbeA8AIc5yGt4QxKy6u5GoEYTCfcqgqfy8EmXGE8cPvYkdJ8Iiz19BuGE2s0UuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93268606A321;
	Tue, 24 Nov 2026 07:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93268606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.97.139])
	by APP-01 (Coremail) with SMTP id qwCowABHbfcVQwVrAUaUAQ--.8758S2;
	Tue, 24 Nov 2026 15:56:06 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 0/2] drm/bridge: add glue driver for T-Head TH1520 DW
 MIPI DSI
Date: Tue, 24 Nov 2026 15:56:01 +0800
Message-Id: <20261124-th1520-dw-mipi-dsi-v3-0-ffcf2d87971b@iscas.ac.cn>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NywrCMBQFf0WyNiWPxiau/A9xkeZhr2BbkhqV0
 n83qQsRxOXAOTMzii6Ai2i/mVFwCSIMfQa+3SDT6f7sMNjMiBG2o4QTPHVUMILtHV9hBGwjYCG
 JFS1rFPMK5eMYnIfHKj2e3hxv7cWZqZjKooM4DeG5VhMtu7+BRDHBjeCe195yUvsDRKNjpU1le
 lQSiX0klKqfEpYlSrfCK0mkl823ZFmWF34qUGENAQAA
X-Change-ID: 20261030-th1520-dw-mipi-dsi-580d5b2792f9
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Icneowy Zheng <uwu@icenowy.me>, Han Gao <gaohan@iscas.ac.cn>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID:qwCowABHbfcVQwVrAUaUAQ--.8758S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryfKw1fKr4rAFW7Gw4rKrg_yoW8trWrpa
	17Gry3JFyDJrZ29F9ayr18XFWfG3Z5JF98KFW5Kw1vvan8u3W8Xr9FkFs5WF1UXrn3uF42
	vF4jg348WrsFvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjTRM6wCDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

T-Head TH1520 contains a DesignWare MIPI DSI host controller paired with
an internal DesignWare PHY, as a similar design (but with a different
PHY) with the Rockchip DW MIPI DSI.

The functionality to write to the PHY is shared between these two
implementations of DW MIPI DSI, so it's extracted from the Rockchip
driver to the common code. (The same sequence could be seen in the
HiSilicon Kirin DRM driver, but that one hasn't been converted to common
DW MIPI DSI.)

Tested on a Lichee Console 4A (with a Mingjun MJ070BI30IA2 panel) with
further pending DT patches.

One question remains: I have to copy the extra lane bandwidth headroom
from the Rockchip driver, otherwise the Mingjun panel cannot keep sync
to the display signal; from my testing, changing the hardcoded
PHY_STOP_WAIT_TIME from 0x20 to 0x2 (which is written by the vendor
driver) can also make this panel to work w/o the extra headroom. I want
some advice on whether to keep the extra headroom or changing the common
code to make the PHY_STOP_WAIT_TIME parameter adjustable.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v3:
- Fixed a remaining `syscon` in the DT binding.
- Link to v2: https://patch.msgid.link/20261119-th1520-dw-mipi-dsi-v2-0-9ab5f9808f87@iscas.ac.cn

Changes in v2:
- Changed `syscon` to `thead,vo-syscon` in the DT binding.
- Dropped the patch moving common PHY write routine to dw-mipi-dsi
  common code.
- Fixed a few problems pointed out by Sashiko in v1.
- Link to v1: https://patch.msgid.link/20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn

---
Icenowy Zheng (2):
      dt-bindings: display: bridge: document TH1520 MIPI DSI controller
      drm/bridge: add TH1520 DesignWare MIPI DSI host controller

 .../display/bridge/thead,th1520-dw-mipi-dsi.yaml   | 103 ++++
 drivers/gpu/drm/bridge/Kconfig                     |  12 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c        | 570 +++++++++++++++++++++
 4 files changed, 686 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261030-th1520-dw-mipi-dsi-580d5b2792f9

Best regards,
--  
Icenowy Zheng <zhengxingda@iscas.ac.cn>

