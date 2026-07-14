Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3122638D3F9;
	Tue, 14 Jul 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029478; cv=none; b=gQrAXo3/LbtjXRM8mQrCy5J88Vot3gj83/+8+C0QkfATYvePS164ey9MIu8IRUoQhvBxzzV8QdGHh12OOVY1Jfl4hsYp+HtUCsV7eq/Ecir9anoSKATB2boejWZEs/rUjZi+Nx+nb4hRWXAVswmH8rbcJxSWh43VWOYh7mltc/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029478; c=relaxed/simple;
	bh=jmaYUP/r44wCR72Nc3+9Fb6W8Pm4khTfRCLiVTVhzcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKBBMnX6SQ22u/kslKw9gSkBcdLNaFpZ1MmeAlioljR1TJrdNA6Ij/QyYqH/BP+usqPdqf5wbIdhxbdejl6qPgPrTsdMs4Hzk588bEqnOi3qH8u5wB77LkWUkM7aPxzhLt7G6LEMydOXDn7QeoMHe88nTJqlyO0BgM/X+srXIpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E/4uA4pX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E/4uA4pX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029475;
	bh=jmaYUP/r44wCR72Nc3+9Fb6W8Pm4khTfRCLiVTVhzcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/4uA4pX4Pd1vdKPSwy4CtrXiEBl9OuzlvrP0tf+Sab14gHIg5Z5k2Z4cAcsRP1eS
	 SURPXcqvNx/o0ywZlBkRMeJ+gGj4rGQSOr1fZah5YylX6gg/MTfhlFWAifife70Uz1
	 M4ChdBQttEtm5aYE6UpfWSFtQgSDBFU5ZOTZiA8OD8uE55qbBMMkwKKT4+lAgYEiFo
	 8xatjtfwfYcT/5XyDlKAJX9X55sehN/k5HdVLe+Ttn/2Av/4KwY8l6FU4qMGToBfWC
	 asXM+yrTAWwKNbzZis0UFjswJLomPnLMsZvLxQhJUTgh5LAtwgUmJFDC88Fytnc/Fy
	 8DPbvcN56xs4g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD1A017E0E1C;
	Tue, 14 Jul 2026 13:44:34 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 05/46] drm/mediatek: Add missing component types in mtk_ddp_comp_type
Date: Tue, 14 Jul 2026 13:43:33 +0200
Message-ID: <20260714114414.184512-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation to remove the mtk_ddp_comp_id enumeration, add the
missing component types ETHDR_MIXER, PADDING and MDP_RDMA in the
mtk_ddp_comp_type enumeration.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/linux/soc/mediatek/mtk-mmsys.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index fb88202d100a..3ddfdeac658d 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -92,6 +92,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_COLOR,
 	MTK_DISP_DITHER,
 	MTK_DISP_DSC,
+	MTK_DISP_ETHDR_MIXER,
 	MTK_DISP_GAMMA,
 	MTK_DISP_MERGE,
 	MTK_DISP_MUTEX,
@@ -99,12 +100,16 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_OVL,
 	MTK_DISP_OVL_2L,
 	MTK_DISP_OVL_ADAPTOR,
+	MTK_DISP_PADDING,
 	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_RDMA,
 	MTK_DISP_UFOE,
 	MTK_DISP_WDMA,
 
+	/* MDP Components */
+	MTK_DISP_MDP_RDMA,
+
 	/* Keep Display outputs at the end for readability */
 	MTK_DPI,
 	MTK_DP_INTF,
-- 
2.54.0

