Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4373BE154;
	Fri, 29 May 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044473; cv=none; b=FcnoxiJppre1toaIxtOgI/i+KPIBYA+7/el1uuEoNwNtlskU1SqSMplVVJtaSfqg9DsEIUvm2vpNcthhbO0IYjTcrABMAPLBCDfIx5QMEO5o5NV+yN1RaIBFi4Xon+52pC2cXsLrXLCy8mKZ3QRiIhwIjSI5Z/rTvqCbvEWngHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044473; c=relaxed/simple;
	bh=wJIwGQWQVF7nXvYZIy7GC96ascev6Pjy2rroRfLoy3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7SN1Owr6zJ6BjEriOaMogkVIRbgPuV5UFjeafHkByrTbRT18lhVzZNT4zoGp6YXTi9L4wJOvBIp6v4imkuxFUeM067rDGZkxvHg0Dj9YC2uXUhtq6cSPQ2A9yTKH3jJTaAf+L/K8kBv9vxSe4EQS0P1idTrsJyjv3DG8CjiywE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dL7Nb15I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dL7Nb15I"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A96EA06;
	Fri, 29 May 2026 10:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044430;
	bh=wJIwGQWQVF7nXvYZIy7GC96ascev6Pjy2rroRfLoy3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dL7Nb15IJNAJ+HgxmyaRH9ni0e7g2wsadmiQsPja2GhCS9CtmNgvRQeDIRRHXbVLZ
	 szJuNPYc1/I/549QuLF56lxR8iWGY9iGXVlGZlhDucGJrGzhvntPHNiBXrGpn8hnH3
	 GgqHHTom2JHARfZhd0e+mdLhB4X7JQVBHlglKbAo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:43 +0300
Subject: [PATCH v3 13/15] drm/tidss: Add support for AM62P display
 subsystem
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-13-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
In-Reply-To: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/85nzazta3ZSz2DegZrNcXTx/gK83bzKu5NpUXGKZHo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKPhfID1DWAq5CXgd5VCH82lv8yt/lkPGSJA
 7gfOwTU01eJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjwAKCRD6PaqMvJYe
 9R2JEACJGSgd+33+hWkSwInzxOXX+9sCUUuNu+t3vHBc+ivcqVF2uaoX+nnr4W/6melnJXQ59mx
 8j7XqO8RaIzBZljtuCuBPOAbAD3WHz0u6YRkLQpF7fCVQcycFN9ra5RP+/ifYuAuBpfMKmZ8LkL
 y7zGZlds8+BhcKs1WSsIwTS/1zj67X10vEPpsvHSFaO0um46LWxJOlXAmYdjojJWVoesaZ5DBdA
 5HaR4yf89HjNNpJwnN+Ckc1yEluHONUSYxTe3/st8X1smGaQmZpUiBURU87DKAr4/5WYNwgAydB
 +A1gmBruUK6OsoOMTJeFYBbS8XTGodUfu0WM4nKZJXqu/DU/i/QipZA/Vck+upQFyZ0YwawCSVq
 htTzG88u4QpRuWOqZ2rkPPx9dtOGEo801cOdyM0lLcIpZPhylUBF7YyMGW6qm2PiP7pBDkxrHyq
 5iMi+nkiwQmBtRi94jCRcGbZYKK3L3BGqXMtPRDvYjazXL65N+ZeQshCbgzLbw56RwKi+0xIELe
 Lp8ftYaGHs+aM/DHgl0G98IT8fCYLZs+kvhgCMA+QLft6njz6xhvV7e9fKpEeE2xO8Zpp64Jk99
 6MneaXvlViTgNZ45GVMNI0PLl78EO9SyOeGgVRUBzN5KLYMyzfs5l424QGFnN9bK1tr1S7nJRh+
 scot81cdzMOF4rQ==
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

