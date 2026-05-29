Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B03C0604;
	Fri, 29 May 2026 08:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044470; cv=none; b=ixp4XQ1nNT0jI4qArqazlSSlLrrmKYaOy+sr4cn10/1Q6Qie8zNatHnGqQg3ZieNlPVJspD7vCc4jdVZReYTpwuyagCnZ4WQhlCuPq9zMMZB73Dinl4Z/4Bo/smuPZ2a23bPK5qqRH7q3wF/W2stp3A4rK0P2bln1qrnUu2NF2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044470; c=relaxed/simple;
	bh=vNhPG3gt1iNAQede4sSDJktbqWiYm6dT9TVVZYkS1Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNwq3u6TGhTC0jdLJQ5ElbXV7yxP/1JUwLZCnq2ux/1Va3+sP4bWuLEYr+mspuwvHGpretKU0RUqjLH4YY9s5X57K8ivYFawRXwe3wjduz4W0wIJW9h4Q1MeNZ1wu/xlgC8VC+lq2RsqphKs8ene4drsgLD0J5QSacqad24GnxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FEJWxiuG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FEJWxiuG"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2E7C291F;
	Fri, 29 May 2026 10:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044427;
	bh=vNhPG3gt1iNAQede4sSDJktbqWiYm6dT9TVVZYkS1Jg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FEJWxiuGF6wP43Zgf6HmN+hw5/smgGyVqtB4l7IhSWldva1WPbDZuh326o1XCzM1H
	 rOQHoCr5idk+QvHidVh0SNy9IZvdXCkzWVmG5fYYGBT2gHMUdTp6sOphGbMrU6X9t6
	 UQUWmhgfDR0r2TNWls/y6yRL2+7o13NkYNln+eBY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:41 +0300
Subject: [PATCH v3 11/15] drm/tidss: oldi: Fix OLDI signal polarities
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-11-7fefdc5d1adf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4997;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=vNhPG3gt1iNAQede4sSDJktbqWiYm6dT9TVVZYkS1Jg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKPLEqXtvNtESuoXqfgthiAenLg0OEjFo3sS
 qX/TSc7QKGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjwAKCRD6PaqMvJYe
 9RJ+EACg3qKAWrMv5tLQrO5C/lIMuyM2T0knuft0pt2V9UdgGEUgrzKUuWs349rvbLJBmRX8ydg
 FWEas6wVr1d9AmMkwrd8piR3kWB4I2hBs2l3EjuyTfUgDsZbbqi1qgRmyryVa7FOhCaU7z25HMN
 i2H2XprPgWieOip1fXuPbqccc03dLFMVmSp5QiJ0LroWEaDZjiEPUh2X9mXyGQ7vTKXXOAk6wXm
 AvYhnpTj0akHifeTsJqK+P7qlU1FbWYQrEVb/Qt8ack9NDIXJWtIV+3uCW79bOco0ew6GD5nQ81
 zWyR+MnG/oKIu7lubA3agXgsioCrGIKVf+QtkbCTR9zqKh6BW+TY8RvtLMuU76kq8Us2Fyv/UeP
 TqZSpRDiONNrBaayfRvraM/nWmFqCpKKDjuFM11i/qENkf7mp2EaZOKnGjIHcUkWMmdY77v3zve
 KiEJ8NVIvo7rScfYGtMlPh/2eqNNXhT+jpkH3EvL/dhXqk3qIq/7tQENvifIzv7UCCAO0c4ISWk
 dVWcF1qhLFSThLlFrXYNcZjQc64lJP6XajSvojo+nFQRSXDL3QaDp1B/Ce482LonEOSrrRYOuWH
 2/eRHbsVZ1drjWNhr1JTap7t7dMaMiWPnLNfzgKzo44meepAIkErkNhdhzC3Su6fpOVYucZYYOo
 rCIEzAoGOAFuoeg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

OLDI has a few issues with how it handles the signal polarities:

- It always sets OLDI_DEPOL, which means DE active low
- It sets DRM_BUS_FLAG_DE_HIGH in struct drm_bridge_timings, i.e.
  reverse to the OLDI_DEPOL
- It sets DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE in struct drm_bridge_timings,
  but the TRM says "The DSS interface is clocked on the rising edge of
  OLDI_FWD_P_CLK pixel clock", which I read as "OLDI samples on rising
  edge".
- But the defined drm_bridge_timings is not actually used anywhere, even
  if it is set to bridge->timings, so the bus flags are just ignored.

However, based on my testing, OLDI_DEPOL bit or the edge on which data
and syncs are driven doesn't seem to affect the OLDI output. Possibly
it's not as robust, but I did not see any effect with an oscilloscope.

However, the code is still quite broken, so let's fix it:
- Remove drm_bridge_timings
- Set the correct input_bus_cfg.flags in tidss_oldi_atomic_check()
- Set OLDI_DEPOL based on the DE bus flag

Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 17c535bfa057..e925ddaa4fd6 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -164,7 +164,8 @@ static void tidss_oldi_tx_power(struct tidss_oldi *oldi, bool enable)
 	regmap_update_bits(oldi->io_ctrl, OLDI_PD_CTRL, mask, enable ? 0 : mask);
 }
 
-static int tidss_oldi_config(struct tidss_oldi *oldi)
+static int tidss_oldi_config(struct tidss_oldi *oldi,
+			     struct drm_bridge_state *bridge_state)
 {
 	const struct oldi_bus_format *bus_fmt = NULL;
 	u32 oldi_cfg = 0;
@@ -183,7 +184,8 @@ static int tidss_oldi_config(struct tidss_oldi *oldi)
 			 "OLDI%u: DSS port width %d not supported\n",
 			 oldi->oldi_instance, bus_fmt->data_width);
 
-	oldi_cfg |= OLDI_DEPOL;
+	if (bridge_state->input_bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
+		oldi_cfg |= OLDI_DEPOL; /* 1 = active low */
 
 	oldi_cfg = (oldi_cfg & (~OLDI_MAP)) | (bus_fmt->oldi_mode_reg_val << 1);
 
@@ -220,6 +222,22 @@ static int tidss_oldi_config(struct tidss_oldi *oldi)
 	return ret;
 }
 
+static int tidss_oldi_atomic_check(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	bridge_state->input_bus_cfg.flags &=
+		~(DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+		  DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE);
+
+	bridge_state->input_bus_cfg.flags |=
+		DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+		DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE;
+
+	return 0;
+}
+
 static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
 {
@@ -228,6 +246,7 @@ static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_display_mode *mode;
+	struct drm_bridge_state *bridge_state;
 
 	if (oldi->link_type == OLDI_MODE_SECONDARY_CLONE_SINGLE_LINK)
 		return;
@@ -245,10 +264,14 @@ static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
 	if (WARN_ON(!crtc_state))
 		return;
 
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	if (WARN_ON(!bridge_state))
+		return;
+
 	mode = &crtc_state->adjusted_mode;
 
 	/* Configure the OLDI params*/
-	tidss_oldi_config(oldi);
+	tidss_oldi_config(oldi, bridge_state);
 
 	/* Set the OLDI serial clock (7 times the pixel clock) */
 	tidss_oldi_set_serial_clk(oldi, mode->clock * 7 * 1000);
@@ -329,7 +352,8 @@ tidss_oldi_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
-	.attach	= tidss_oldi_bridge_attach,
+	.attach = tidss_oldi_bridge_attach,
+	.atomic_check = tidss_oldi_atomic_check,
 	.atomic_pre_enable = tidss_oldi_atomic_pre_enable,
 	.atomic_post_disable = tidss_oldi_atomic_post_disable,
 	.atomic_get_input_bus_fmts = tidss_oldi_atomic_get_input_bus_fmts,
@@ -440,11 +464,6 @@ static int get_parent_dss_vp(struct device_node *oldi_tx, u32 *parent_vp)
 	return -ENODEV;
 }
 
-static const struct drm_bridge_timings default_tidss_oldi_timings = {
-	.input_bus_flags = DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE
-			 | DRM_BUS_FLAG_DE_HIGH,
-};
-
 void tidss_oldi_deinit(struct tidss_device *tidss)
 {
 	for (int i = 0; i < tidss->num_oldis; i++) {
@@ -598,7 +617,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 		/* Register the bridge. */
 		oldi->bridge.of_node = child;
 		oldi->bridge.driver_private = oldi;
-		oldi->bridge.timings = &default_tidss_oldi_timings;
 
 		tidss->oldis[tidss->num_oldis++] = oldi;
 		tidss->is_ext_vp_clk[oldi->parent_vp] = true;

-- 
2.43.0

