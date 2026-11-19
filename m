Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103491;
	b=nnB9uPm+n+xvUD/DK/XTbOXlhq8iQPEDjgoCdvO5SpqG021ZaJzkmF42/T2d8LP8yOal
	 B37BnacdupXN/zwYEhcqJh+65auvUTG30WHUA1AB6jIlhu9Qu6XkxlU9RHXgjyA11QKpY
	 ON58nSdc3MtyJRA/Cqt8NdN3uWAxh2jB6GZ+AN90wITXroOztHX5VGmCXaXo0mZJIYYGl
	 CBLOgsWZ0VLL8Y2ibDu/xuBaMrelDTpFNwJSdYfbFoZLXl3SaiopKileqhvPzNuhUKwYy
	 zqCwl2OFQRAFjN/DZb+1xvV8wDeWW2Fck19wUJz0r1a2HApig6GHdOjaO756nBMDwEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103491;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=gduDqUss5BxD1WmC6OXCBDqFuP/HgkT6t4jiNPlIPR0=;
	b=xw5d7+Q8TM/5fEoO49lVGyx/kV+/zfGhm9JNbcEPDrCx3K3roMStQkp/tyDog4S70oNM
	 OhSQlbAwm8HuJdir8wIXVLOtN09uCcWW9Oj/YsoceBbesVZHFqzI386fk1SgFodyVs8Ds
	 ZHj7UW9uQK9zSUjciKGmid72ETUBatDeHPv7RhhxrIyJZQnYM8jeSBPD0rz4/1V8gPlmW
	 0Y03nUMcvlOfPFnTccQ/61fhqxG38ntVFaSUouGP7X74bdU5o1sx9GZ+8bB8Tyte7DLG/
	 6Dl0WFJ2Y1Q1lzW44nmjcN/rfuJJ/I3cwJziJGDAWNjke9WdOzcZPvC8OfL066zjryA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF71606A324;
	Thu, 19 Nov 2026 15:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF71606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.23])
	by APP-03 (Coremail) with SMTP id rQCowAD3yZrbGv9qvGJbAQ--.6169S2;
	Thu, 19 Nov 2026 23:50:52 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 0/2] drm/bridge: add glue driver for T-Head TH1520 DW
 MIPI DSI
Date: Thu, 19 Nov 2026 23:50:43 +0800
Message-Id: <20261119-th1520-dw-mipi-dsi-v2-0-9ab5f9808f87@iscas.ac.cn>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NSw6CQBAFr0J6bZP5MCKuvIdhAfORNhHINKKGz
 N0F3LuspF69BdhH8gznbIHoZ2Ia+hXUIQPbNf3NI7mVQQl1lEILnDpplED3wgeNhI4JzUk406q
 yUqGCdThGH+i9R6/1j/nZ3r2dttJmdMTTED/76yw37+/BLFFgaXTQRXBaFOFCbBvOG5vbHuqU0
 hdj/fKIyAAAAA==
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
X-CM-TRANSID:rQCowAD3yZrbGv9qvGJbAQ--.6169S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryfKw1fKr4rAFW7Gw4rKrg_yoW8Zw4Upa
	17Gry3AFyDJrZ29F9ayr18XFW3G3Z5JFZ0gFW7Kw1vvan8u3WrXr9FkFs5WF1UJr1fuF42
	vF40g34xWrsFyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUUbAw7UUUUU==
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

 .../display/bridge/thead,th1520-dw-mipi-dsi.yaml   | 102 ++++
 drivers/gpu/drm/bridge/Kconfig                     |  12 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c        | 570 +++++++++++++++++++++
 4 files changed, 685 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261030-th1520-dw-mipi-dsi-580d5b2792f9

Best regards,
--  
Icenowy Zheng <zhengxingda@iscas.ac.cn>

