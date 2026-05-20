Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC613FB7EE
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779317101; cv=none; b=Ay5mYF1oQLplLqCF3jOKZI3WMqdXzQ2aqfE6V3SkCqJaSAbp5wQkwheUVPz2YiCKKmbApQOFRye1+MYXGD2mvutVAox4kHkWvNQ43NHlk7otEQ0bi2WXmdEOF9qvigXgTccu9jc0pP1rSNnXHxaamdR+tE4LETemI/3jPuLyo14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779317101; c=relaxed/simple;
	bh=4UALNyh3zvQReRdoyc6YBeCLRcgHWvzWyrXqKVXno8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLPTvp6j4tGmi8lW1Tmj6BLakpnh5eANHlIhEbnZTbEiAraPszkyTMSrJsij8nxvL+3YIA6iA+AHYhg8D16vS6fGjA0cdNKDxF+w8WDOLHjA+Z+3V2ShkEgbI/Sr5hbFWjF3nNmfvO/OeMMvBhxvzxRLzzwUUiUzZH9MavSGINQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wPpeW-0005vy-M2; Thu, 21 May 2026 00:44:36 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Thu, 21 May 2026 00:44:13 +0200
Subject: [PATCH v7 08/28] media: rockchip: rga: use stride for offset
 calculation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-spu-rga3-v7-8-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
In-Reply-To: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Use the stride instead of the width for the offset calculation. This
ensures that the bytesperline value doesn't need to match the width
value of the image.

Furthermore this patch removes the dependency on the uv_factor property
and instead reuses the v4l2_format_info to determine the correct
division factor.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 14 +++++++++-----
 drivers/media/platform/rockchip/rga/rga.c     | 16 ----------------
 drivers/media/platform/rockchip/rga/rga.h     |  1 -
 3 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index bb575873f2b24..65fc0d5b4aa10 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -14,7 +14,6 @@
 #include <media/videobuf2-dma-sg.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "rga-hw.h"
 #include "rga.h"
 
 static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t max_desc,
@@ -95,14 +94,19 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	return 0;
 }
 
-static int get_plane_offset(struct rga_frame *f, int plane)
+static int get_plane_offset(struct rga_frame *f,
+			    const struct v4l2_format_info *info,
+			    int plane)
 {
+	u32 stride = f->pix.plane_fmt[0].bytesperline;
+
 	if (plane == 0)
 		return 0;
 	if (plane == 1)
-		return f->width * f->height;
+		return stride * f->height;
 	if (plane == 2)
-		return f->width * f->height + (f->width * f->height / f->fmt->uv_factor);
+		return stride * f->height +
+		       (stride * f->height / info->hdiv / info->vdiv);
 
 	return -EINVAL;
 }
@@ -148,7 +152,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	/* Fill the remaining planes */
 	info = v4l2_format_info(f->fmt->fourcc);
 	for (i = info->mem_planes; i < info->comp_planes; i++)
-		offsets[i] = get_plane_offset(f, i);
+		offsets[i] = get_plane_offset(f, info, i);
 
 	rbuf->offset.y_off = offsets[0];
 	rbuf->offset.u_off = offsets[1];
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 4e710a050cb7c..c07207edffdb6 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -190,7 +190,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_ALPHA_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
 		.depth = 32,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -199,7 +198,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
 		.depth = 32,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -208,7 +206,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_XBGR8888,
 		.depth = 32,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -217,7 +214,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
 		.depth = 24,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -226,7 +222,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
 		.depth = 24,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -235,7 +230,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR4444,
 		.depth = 16,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -244,7 +238,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR1555,
 		.depth = 16,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -253,7 +246,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_BGR565,
 		.depth = 16,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -262,7 +254,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 1,
 	},
@@ -271,7 +262,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
 		.depth = 16,
-		.uv_factor = 2,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -280,7 +270,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 1,
 	},
@@ -289,7 +278,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 1,
 	},
@@ -298,7 +286,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
 		.depth = 16,
-		.uv_factor = 2,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -307,7 +294,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 2,
 	},
@@ -316,7 +302,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422P,
 		.depth = 16,
-		.uv_factor = 2,
 		.y_div = 1,
 		.x_div = 2,
 	},
@@ -325,7 +310,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 2,
 	},
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 2db10acecb405..477cf5b62bbb2 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -17,7 +17,6 @@
 struct rga_fmt {
 	u32 fourcc;
 	int depth;
-	u8 uv_factor;
 	u8 y_div;
 	u8 x_div;
 	u8 color_swap;

-- 
2.54.0

