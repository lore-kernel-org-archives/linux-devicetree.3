Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1773A3818;
	Mon, 20 Apr 2026 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689691; cv=none; b=btT+iDh/U0cflyol2xKzqLBJkj0vGfnLNEVi9bfmjcuM90EeDO60XI7xfvi+wmn/7DctPJBLen+9A1rmf5DXAIx4Udh7gtu9ZCxuR4ETgsgkPcTShI/PSOiLTMwoWuGOzuT47hRE3I5WgcT60pRzpyocEYg4Yr6mtm3Ap1r+vIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689691; c=relaxed/simple;
	bh=Og00WFj4OSyuhCTIsPmNlOJpuOxWVUShYLBe9vNBgZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Umt1IPlqaVQg0hEJPH22mTDLz60QMQJZ+10LuB7JDzHWwe/va8ncbkEQ5mehPJ6JFxYY5HL62gXOzuVdKCvkSzTiGV9TEsiLgjT3HhtSgmzuOhKL3cbUxSySLzg9AlE3ZEVFOYvx7cVws2sVg/E3GnGo98njCtelkOEZ/t52WbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I5zzBfav; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I5zzBfav"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1CF1265D;
	Mon, 20 Apr 2026 14:53:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776689588;
	bh=Og00WFj4OSyuhCTIsPmNlOJpuOxWVUShYLBe9vNBgZY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I5zzBfavt/tVvsu3ljmY1RpIzwLvyb0Bci4E+6uP6IBvvRf3nJnMA3tY0cPU4OWD4
	 onf9YVzcxJ+R7cPyf7DTbVkBIHJeG4/y/mbBke/jePxCdYAaprJyBCLlutwBOOu0/R
	 urdTVEa3w+MJcI/q6lqbsFo1PulHRYBdoww5lL1k=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 20 Apr 2026 15:54:17 +0300
Subject: [PATCH 10/15] drm/tidss: Add support for DPIENABLE bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-beagley-ai-display-v1-10-f628543dfd14@ideasonboard.com>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
In-Reply-To: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4194;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Og00WFj4OSyuhCTIsPmNlOJpuOxWVUShYLBe9vNBgZY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp5iIGQIBd1DXxWqEhnfiFvNkdKsUSWcCMYLMi7
 ulyibyDn7qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeYiBgAKCRD6PaqMvJYe
 9Y09EACECe4+AKZOh/HTUxOnaZPyWBsHpgXp+wdfsr6f/2F5mQqmQkHOzhMdc4J3zd2HvhQ6ue/
 QYFET7547inKeCIZ2F0ZkO0YuRACPHUe0WNSAvGoSy4U0RGz+IEhDGnkNKzSf0DsC+3D2TIX3sU
 96GpnsqGmZHVnecZdGWzEnwlwrDj3DTdQ8qbqXmM9MHGPiFg/V6AnoHOa+I60BwLEPuvmXsKXa2
 dFq/v3IFMPM+WWUt3/D24bL8+LNd5C8Zz6pnFfROtLapjlf2eNb8bD/bE4sEzLpNOXAVJR0jJ2i
 v1W/ncLzoDD/jGav+fp7Dyv3iJXEr2j7okvsUdGztDFov2KaEgc6+md+FyvOEFm7M3GsYDvCMsJ
 5kjemYQoTOVeOSMUDyKOCEgw9S3wrNlHlKH/IzyFvdtKLFgWUuLf+gp9Q9obwEFr+5moNGDk2rx
 JelqS5SwJTfZs6MaL5HeNCwu36cg74Xr1Byw+vxNKp0fQspPeSDIqBX0NKx6viQ4uHwAiwNjmSb
 KTQZlO/lhkBRBQh6RJp4TVMu8Ctr6u/+qa/yxSj3gYneDv9YNA5M52M93ZPSx9MTaU2PYOjUaMx
 JmVh+GHtcl2kQbby3u/MPp3JQQ4kSKThtIDEjZIbv1ncue7WJquUNcTNY0GhadRp96+k5Ps+uTY
 Sn7nqMfUwqDVx6w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Many (or even all?) K3 SoCs have DSS VP_CONTROL.DPIENABLE bit described
in their documentation. This bit controls whether the DPI block is
enabled, and is set to 1 by default (i.e. DPI is enabled at HW reset).

However, in almost all SoCs the setting does not actually do anything,
and at the moment the bit is not managed by the driver.

The exception is AM62L, which does have DPIENABLE connected, and
disabling the DPI block when it is not in use provides power savings.

Let's add a new feature flag for this, 'has_vp_control_dpienable', and
implement the support.  Disable DPIENABLE for all videoports at resume
time, so that it is 0 by default. Specifically enable and disable it in
dispc_vp_enable() and dispc_vp_disable() for DPI output.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c      | 23 +++++++++++++++++++++--
 drivers/gpu/drm/tidss/tidss_dispc.h      |  2 ++
 drivers/gpu/drm/tidss/tidss_dispc_regs.h |  1 +
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 0f68e60b902b..9edce4a4873a 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -442,6 +442,8 @@ const struct dispc_features dispc_am62l_feats = {
 	},
 
 	.vid_order = {0},
+
+	.has_vp_control_dpienable = true,
 };
 
 static const u16 *dispc_common_regmap;
@@ -1212,6 +1214,11 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
 
 void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport)
 {
+	if (dispc->feat->has_vp_control_dpienable &&
+	    dispc->vp_data[hw_videoport].dpi_output)
+		VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1,
+			       DISPC_VP_CONTROL_DPIENABLE_MASK);
+
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1,
 		       DISPC_VP_CONTROL_ENABLE_MASK);
 }
@@ -1220,6 +1227,11 @@ void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
 {
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 0,
 		       DISPC_VP_CONTROL_ENABLE_MASK);
+
+	if (dispc->feat->has_vp_control_dpienable &&
+	    dispc->vp_data[hw_videoport].dpi_output)
+		VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 0,
+			       DISPC_VP_CONTROL_DPIENABLE_MASK);
 }
 
 void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)
@@ -2443,10 +2455,17 @@ static void dispc_vp_init(struct dispc_device *dispc)
 
 	dev_dbg(dispc->dev, "%s()\n", __func__);
 
-	/* Enable the gamma Shadow bit-field for all VPs*/
-	for (i = 0; i < dispc->feat->num_vps; i++)
+	for (i = 0; i < dispc->feat->num_vps; i++) {
+		/* Enable the gamma Shadow bit-field for all VPs*/
 		VP_REG_FLD_MOD(dispc, i, DISPC_VP_CONFIG, 1,
 			       DISPC_VP_CONFIG_GAMMAENABLE_MASK);
+
+		if (dispc->feat->has_vp_control_dpienable) {
+			/* Disable DPIENABLE for all VPs */
+			VP_REG_FLD_MOD(dispc, i, DISPC_VP_CONTROL, 0,
+				       DISPC_VP_CONTROL_DPIENABLE_MASK);
+		}
+	}
 }
 
 static void dispc_initial_config(struct dispc_device *dispc)
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 6f53d554259c..0fbfb86adfbf 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -92,6 +92,8 @@ struct dispc_features {
 	u32 num_vids;
 	struct dispc_vid_info vid_info[TIDSS_MAX_PLANES];
 	u32 vid_order[TIDSS_MAX_PLANES];
+	/* The DSS has VP_CONTROL.DPIENABLE bit */
+	bool has_vp_control_dpienable;
 };
 
 extern const struct dispc_features dispc_k2g_feats;
diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
index 4cdde24d8372..4246c72efdd5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
@@ -230,6 +230,7 @@ enum dispc_common_regs {
 
 #define DISPC_VP_CONTROL			0x4
 #define DISPC_VP_CONTROL_DATALINES_MASK			GENMASK(10, 8)
+#define DISPC_VP_CONTROL_DPIENABLE_MASK			GENMASK(6, 6)
 #define DISPC_VP_CONTROL_GOBIT_MASK			GENMASK(5, 5)
 #define DISPC_VP_CONTROL_ENABLE_MASK			GENMASK(0, 0)
 

-- 
2.43.0

