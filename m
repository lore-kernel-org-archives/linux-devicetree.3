Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794944017;
	b=aekqZQ9d0kNrjdTYtWI918KcS6/5Kr+1Y+Ko2ney3x/DzIG9GxCeMg4ikGbvMgOHiZev
	 0lk5gh0vHk8MVJinM05xeIf0rT51k60EtjRvNuZblLYkwrPA/xh/WwObFMmo3Eh+bv6v+
	 HS4/TSAvRdlGBTWGpXJNNtoRE919NOWdYJwef+edZ5XMXx5AVM2e4g9tcifvehFTS+j9J
	 s4mLpDRdihFptTIHbB4b55xIhopXEbe5ho1SfyASn7IZhvs/7Z0u+eTVcV0Ha9/jKUj7S
	 DJ0rkugrBocnEtKElfY+TZXSxHY1wDT4sa0cCAMPdJ5OFFJ1VbGbI6CDq5WaMYd2Qcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944017;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KUlAREIsaDpRd9AokYp9Tz4cZ6wB53FKL7N7FlReAuE=;
	b=DZmDiMYOFonJ6F9FX6q4U+kVntjHruYxL8htbtgThQAdiUAAPKdxLMsgWa12vFJBUQZl
	 iwU8J4Qb2sxra+U4IVkhOgNTGBpuy/EIfTGovV8UCmBUcD7I1apE9Ip9BMFjFO8WiieGP
	 ZXSrB0Zjm3yBdQPWtcQ8MdOEpRuMlfMsF7iqrRBHM8wPv2ZHimroxePhIdfp6I0Y+uuSH
	 OknCSXydQ9pO6+T5VHx7qdVgzPJ8U0RhGjUTy6bJ3tPL5W39Y6w5BQsEKX91T3vDU1ChL
	 xS70nZAq90bmArBRLZsx63I2ZnaNRNwpmj033iUzK+teZCVpswiiZtAMHzO0XJuwDVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lN4JKX8N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5189760A380E;
	Tue, 17 Nov 2026 19:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lN4JKX8N
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794944017;
	b=vyQW0jrwTYpfk9/Ex0ftMHi5u6AuWcANpqQkCksfEmgkZFbRvlYooQn+C7ObWcLsyeMJ
	 ZQtcUyBQmYONtyTZ/qRES0/Iq8Icesuprs77C5bRf9UqbLciVkuSweCmTE7NwOrelPfBL
	 oJy7Yv4oi48sAXwgwUaVHyKL6dg+i2jxaQp5EQySK8NB3zYfg8O03O3oG3EXB+o4sakiX
	 jPhreMVO/FkGFnSoxIP18mXci7dSlViHLH5jMqwogdd8ERKe0V5ZCL4jPmqSKwY62+j+A
	 31vBYwV0h26WfzAnDnje1JAAvlERGcO8IQqbSMbJk0SpLXInVY/asp9OF58IpIcTXrA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794944017;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KUlAREIsaDpRd9AokYp9Tz4cZ6wB53FKL7N7FlReAuE=;
	b=Gf6wOaq3R6mslOzZfaECePvT72dhZaqWNtf525dBaHY34AqCiZV3y8D4wLoEBHGgd2Kc
	 5tlmP6lv8dlCX3nDzyzMQVh4VJt2Jp2iYSgN7vkP2+GJNOnw9Bwngm7zqo5f7JMK+eeBn
	 3Uu2qizcpIzkdkD3eGCCoULph07NzlcruXfib/zVwNM8SuhEVBmkluOT4MA9Q9iw8ovkH
	 diIXIpu8K5/yfYUSKDMTxLhkQ8G5U7lKHKECMOpMATd7zVcl0ePv9ClU3wyO+VasUv1qW
	 s9wuALbMhIgzBsKaJpqXM9xucXUNevqVjh6dcFManTnzVQZ0PJ4bqUHoZvUWmKYLvxg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75BDD1F000CC;
	Tue, 17 Nov 2026 19:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944017;
	bh=KUlAREIsaDpRd9AokYp9Tz4cZ6wB53FKL7N7FlReAuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lN4JKX8NFAbKV0ESp7t6poQvvDk0h74OYg4lsqpNGAHrE/YnmMkmXXR/kRmI3BSYs
	 ybdE9p3t7qN0msVVoLW2NAy1JQwNEYlV1lIrtb/ktj13L/3rkBj9b3Q9OVwrD+nAG1
	 AGUYnX1PUM7vJxgm/gBGj62wGsfn5US2NMPLu3npXqoFYoeKdVfNjO/8LX7de0fpps
	 pM4sK9DG2saiiERJB87E70e60xLxPOTDKewP1Bksyzcsf1xLq29apjLz+V75IKfD8p
	 IXwGr0JpobqoY2Uv9W5n9O92LLT3kUoddSOfxe1s2/im5F47/jQ8vnaRMCno002qK2
	 Cy36Csj9a3pUQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 545174AA8A;
	Tue, 17 Nov 2026 19:33:34 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 17 Nov 2026 20:33:11 +0100
Subject: [PATCH 06/10] drm/meson: dw-hdmi: Drop manual HHI clock and memory
 PD setup
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
Message-Id: <20261117-meson-drm-create-hdmitx-phy-v1-6-9e0ac931381c@aliel.fr>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2969;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=ztajGisJP2ywVUrLgoTSbxwE6I6bJ9vcioLG/C+HU6E=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9afNSxTGyZey5N+skvjVchLhoclS78EvG0Js9d8/evP3
 95XujdYOkpZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJZN1hZDjqanJid/Yh/sef
 //UvdXZv/vnThO1NygElzpwWC2vmiXUM/7Re9ZuWhJyXSo9vq768UMxaNXoWw6cJExPPavx5dqT
 oIScA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr
Content-Transfer-Encoding: 7bit

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

meson_dw_hdmi_init() programs two HHI registers by hand: the HDMI clock
mux/divider/gate (HHI_HDMI_CLK_CNTL) and the HDMITX memory power-down
bits (HHI_MEM_PD_REG0). Both are already covered by resources described
in the DT:

 - the HDMI clock is selected and rated through assigned-clocks
   (CLKID_HDMI_SEL parented to xtal, CLKID_HDMI at 24 MHz), and gated
   through the "isfr" clock, which the driver already enables at bind
   time;
 - the memory power-down bits are handled by the VPU power domain
   referenced by "power-domains".

Remove the open-coded register writes. Take an explicit runtime PM
reference in probe and release it on removal, so that the domain is
guaranteed to be on for the lifetime of the device.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index eb33c70f29c3..20a821936b3a 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
@@ -102,8 +103,6 @@
 #define HDMITX_DWC_CTRL_REG	0x18
 
 /* HHI Registers */
-#define HHI_MEM_PD_REG0		0x100 /* 0x40 */
-#define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
 #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
 #define  PHY_CNTL1_INIT		0x03900000
@@ -599,12 +598,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 {
 	struct meson_drm *priv = meson_dw_hdmi->priv;
 
-	/* Enable clocks */
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
-
-	/* Bring HDMITX MEM output of power down */
-	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
-
 	/* Reset HDMITX APB & TX & PHY */
 	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
 	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
@@ -829,9 +822,29 @@ static int __maybe_unused meson_dw_hdmi_pm_resume(struct device *dev)
 	return 0;
 }
 
+static void meson_dw_hdmi_pm_put(void *dev)
+{
+	pm_runtime_put_sync(dev);
+}
+
 static int meson_dw_hdmi_probe(struct platform_device *pdev)
 {
-	return component_add(&pdev->dev, &meson_dw_hdmi_ops);
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to power on HDMI TX\n");
+
+	ret = devm_add_action_or_reset(dev, meson_dw_hdmi_pm_put, dev);
+	if (ret)
+		return ret;
+
+	return component_add(dev, &meson_dw_hdmi_ops);
 }
 
 static void meson_dw_hdmi_remove(struct platform_device *pdev)

-- 
2.43.0


