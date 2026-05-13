Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB8131716B;
	Wed, 13 May 2026 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678298; cv=none; b=o/PGS/5LU8peHVROmLXyqdQXutMt6mWK1+WKPeW4S95HEA7rMyWzZ84PA4ins7jaBKWbCh5M96tdx8yBRC1ABM/GfaSUbFR2YPIEyl15cpcN9g8WfKhZDQDs4351VqZlj1Fc3tGfNHJtfqtNY/OVuZ2OVfaordE4bG8ohrlFqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678298; c=relaxed/simple;
	bh=wJIwGQWQVF7nXvYZIy7GC96ascev6Pjy2rroRfLoy3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ks29GdzKYs+X01wsHmkMyCuJrTHe0X/Hkaqrs1m0j2NxPKeGdoCc2P/xZ6EsrnHYIXSoxhswfRPKWGCXnTo/mBIxrpV+MP3qEW0xqjrjj/ZZRbb+MvkK4HSJ1YOmENCRO5gU5S10WxYpunR+eWxcjwT3m9IGfC78fWZJBQN3LAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z5GVtc6s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z5GVtc6s"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B81E2F8A;
	Wed, 13 May 2026 15:18:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678282;
	bh=wJIwGQWQVF7nXvYZIy7GC96ascev6Pjy2rroRfLoy3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z5GVtc6sPp4nMSPPOceSEn1fHcYG0tUlRDZUOPYrPhs+sO9IGoxtrCuhr2zFxAcva
	 V1ATauJlJ4WOGUbT2vw1ZayUQOIwsmmpnAFmJh59aIwYiZ3bi96NDyW0lguysRb+Pt
	 eDbzaEt8Qbdq+y3a52bfDyuUELX62qch42DjR7pg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:35 +0300
Subject: [PATCH v2 13/16] drm/tidss: Add support for AM62P display
 subsystem
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-13-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
In-Reply-To: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/85nzazta3ZSz2DegZrNcXTx/gK83bzKu5NpUXGKZHo=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGoEegDI1iz7h/jLtCo1kpGKDATo8OONswRA7dotGmDoL4LJy
 4kCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJqBHoAAAoJEPo9qoy8lh71HGAP/jAX
 ACMP1m5RFBSzxnk9ZpgOoTGUyyNKTfPp1XSTBcqyIiu6hBh5jbDQuqqa2YfNUkBJIJxQMeuUMo/
 XBnlcUDY431qrEIorbOwizNQ4oatFBmQCQI6XjlmtpIg7VccLNg7QbuWUakoTse7qfNUgp9vp/i
 B8bj54PAx7o4qYzdb4xI6bOyVVQfucJbNGnQ5kd1rg8La2ndgjCtx4k6K7xel3TYJ5SfvT9amTM
 iwLQLZHLh2D55mlrTLzIytynrm9Q8SMsAyhuijcLl7PDvMrpAg0hSztVy+l85AVAGHT2HMF90rG
 H1Kj+84rOvVtIw9DpIYaAx8eDFjxXkDnctlwDLJSqC2zZJH3EEQEXQvb/VCnYQi9FEOIpoqvPUu
 twUl8yoHLpo2l+U6IltX0jOe+W/JgsANRzh+HsLLX3/Jo5Aklgj+I4QHm7MMrm0dVEiFQBYu+Cb
 0YJRvcpHIrgztJMmvjqm8cxR2vgH+IHd27oKaOIJGk+ZSjKV56tLIh5sYBoB+6wxSMsgfn3WgbA
 GDWMG9lcjOE1Zkr4GTuyYdS7mFZDerbyJKY+0OJQfhXsOGPvcBovRWNgMbAf8lY+WRA7JEPTT3v
 0AR0IJr7tVGWMqEevXMz2wJHQNPwG1L9NTpbHDDa9f9Gtk/0m199N4LQvSn6a8jUIyhOlbF8q+k
 6c6hq
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Swamil Jain <s-jain1@ti.com>

The DSS controller on TI's AM62P SoC features two instances of the TI
DSS. Each DSS instance supports two video ports, similar to the DSS
controller found on the TI AM62X SoC. This allows three independent
video streams to be supported: OLDI, DPI, and DSI.

Since the DSS instances on AM62P are architecturally similar to those
on the AM62X DSS controller, the existing dispc_am625_feats
configuration can be reused for the AM62P DSS support.

This commit adds the necessary device tree compatibility entry for
"ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
thereby enabling DSS support on AM62P devices.

Signed-off-by: Swamil Jain <s-jain1@ti.com>
Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index aef945101be4..2d056dc1c5ff 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -246,6 +246,7 @@ static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
 	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
+	{ .compatible = "ti,am62p-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
 	{ }

-- 
2.43.0

