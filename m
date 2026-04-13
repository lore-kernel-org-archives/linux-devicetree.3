Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2AF3D9DBC
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089166; cv=none; b=FiOBRNhsY01fpHGO/ZMAuFf7Pm73nynzJtpywJUvgn4BksoKw8F7uZ47rhEwHLzIL+1BQKlz/ASRAby99p3fygzgf1II1LtoBDxvXzmt3Zc2zQmrA5nYFaC2ZbulcBLdW3JZ7GZzCx+M8tE0Hl7wzmK0PImvrhqAe0oLYmY9arU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089166; c=relaxed/simple;
	bh=FkFZggJQ4487S25zzpLFnL1lJQsN5zZZyfnh6wkem6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDxIo0bcD8a0luiqDiwhKBSAMOXKS/BLD+J3j1N59t9/T6kqNfX6XXHtm2HvscZSyNjx6j+w5F9lXLL0toS+LezRxFpocF5K5okMc5UpWXLfxxviTaUVpy60wUxOkQED3E42l0Ck1vbxZ9wcgXb429D9O3osiVKS8xSGc7jzrDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vs0pyw6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCuAZ6I9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vs0pyw6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCuAZ6I9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCX0Sq297430
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	soWGaZBES8tfQvM623FQdy4oD0NG4+O2a7JZZa/XJ4o=; b=Vs0pyw6Im6wAPJ4E
	jbtfa40XFGRGis9oQnahi489qW0/Eeoc+1vjFhjsq7M77woyyoAOcpHikjNREySG
	DvDoYBifhgSTX93MQaUg/TXzgeMEG99KNt7UAeVmaVWItkLBFFpVpVHGe9q6eo14
	sA91zcaWmPdGayvWsHW62EnwyDyDbQwcK1fnocWu65hSi+Heu6pENK6n4fOMNAb1
	GZ68lPEEGXATisCiSjxEum3g8yAvel4EBCCZKRUIBsWhDQxOqRrMGbfY3semyCuK
	KOWZtf6fXyaHJxNysAa7+Rs7Ni3cPihjMgyZOondPagQRsgmYClSIvSO7zQgmlix
	yjpChA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0kd0bxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:01 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-467e8aaa943so2390176b6e.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089161; x=1776693961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soWGaZBES8tfQvM623FQdy4oD0NG4+O2a7JZZa/XJ4o=;
        b=WCuAZ6I9HUh6zpqFV6gfwM7hOEtwJ+P7j6H1KxE1FL1/ET4TWo0YFI2C3x9kTlshC9
         dKKLl9wgi+YO5s0/sOo9a5PyHUZ5hi1HBhxh4mmeIT+PLosBY6oQwWPAUZT8wlpPTNR5
         5BwKjqefFucI+5GIhbTD3r3+uNBoj8kv6TtnIlZTtiVD92ip6mlYmjVpf6Ry/dFhp41+
         Rqq/xICZ1blzjmuPIjNrcHPcc0S32YlSSvfOiAeL3cTb58GMf0AI617yfc0VtFhLsNQ+
         6r0RTNA6ZboVl9gJAo4OqqShMaqgn+v0mjrLQwUfB1XC0ei9BTLkeXhgGl4D84Vrx3Wc
         XqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089161; x=1776693961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=soWGaZBES8tfQvM623FQdy4oD0NG4+O2a7JZZa/XJ4o=;
        b=C9/kiNZNYHg9lmyvBAUTXgH9OD8ufxKkW92VGjmeArQq24ChTtawONA7mgb4g9f3JK
         hDLdxjvCmj12AaDCES+FvWendW9hxW4pODMmeukz3BtzcIiTTwdCW04CMRPffissaUEQ
         SyRkleb3NkLDpLTH8tvVpu92WbXeH5/iUhdkrbemMSUQp65o6Xc4D8CsEHPrZFTi20Y0
         ix1QVhzQco6eMKCfvPbhH+T83W+65QZ2t08LEHmJ0R6ZGtD8+IILD4SpHdJtvbxXIj0I
         bXLPf2i+oXCPzF/Qd6GoyIDqJkj2ZPe2uMrP0wUUaxb7h0bUCFEn1JF7PBQnUvFr5ZWf
         Vq6A==
X-Forwarded-Encrypted: i=1; AFNElJ8fbPifCfmDq0c5abxyVx/Qp5iObmtAyaxzrN35QJSndJjH6Toidr0AMx4W7oNRP/N6eT8A+Oeha6yI@vger.kernel.org
X-Gm-Message-State: AOJu0YzCHtuJDAgRdtgo/N/VABVXjawWk81zkW0j/yDxvXG+2KHFSdFp
	WJG4+iqBx7n4+bO15x7uv3bbJ5glkJ/79VvqvKv1WT2luNPviv1VCgpdF1+xUCGvhnub4NRn5rD
	PRICvouQYZwxnCapa6p9TobrI3+A8EyB8fLs2PeYf46/FGqCJrjOXUMJ8iS9KxLoj
X-Gm-Gg: AeBDieuk1IdSyFab2M/Eq3GD8Km3qQoHTYYlciPk7gB7zpStEX+udA+zDm9KeDue9D3
	2QlhMdHQ+DFlBjqKs/o7knbv8lEGNwxAEdhSPBfJK5GfxQm6yJSZ6CkzHA4CG65gKsxkJ+QDzXl
	1q8AhaPJH5oMWUFGlIhulpBnrfeB+kb/XHpttfLC/u2ix3ly+/Z/X1+oJjH6hGjlq6E0mTSbZlw
	3VbkBxKV2RBK/9DVmBZEHNjUQba6w//FcIBAOVN5w70zmmId2T72GrNnVW+dwq9WETqZMUdcfdb
	yK7d72EiqVd78C+VfBv0DXpRwZFYmaTJKPX0U3VTmdK5ir8QWdmBarY2qkuVNeh+jzMQeQCe5CZ
	yuymCoq1DnBJxF15DiSKMNrKxF+JdLIclWylYQfiA4/1uQFyGl63yx/8IOimONfsiTKPs50Juiv
	Wn350dHl2fWxm7dzWHGJyaQFcHatrmS3oepNg=
X-Received: by 2002:a54:4e83:0:b0:467:143c:7733 with SMTP id 5614622812f47-4789f50b735mr5120154b6e.46.1776089160764;
        Mon, 13 Apr 2026 07:06:00 -0700 (PDT)
X-Received: by 2002:a54:4e83:0:b0:467:143c:7733 with SMTP id 5614622812f47-4789f50b735mr5120104b6e.46.1776089160147;
        Mon, 13 Apr 2026 07:06:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:35 +0300
Subject: [PATCH v3 12/21] drm/panel: jadard-jd9365da-h3: support variable
 DSI configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-12-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5137;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FkFZggJQ4487S25zzpLFnL1lJQsN5zZZyfnh6wkem6I=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+adHxq2eeveiwqWcClanL2hcLHQrfJyBEPZ7hxZ4yPMC
 TWMQZc6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARAx72v0JxNX9C2ouXmS7p
 80/WWq84y5Y3+fIxjuePXiVM/1uwPPzRvoTPCq/OXJ3m9D2JX+t+4EalHXZuK0I1KnJOTD0U0zt
 n86IkwRijIjeHlhzbnzfUjJxTTS/NPMG525fPb+an7RNmdLk0hvGdyF0WYFJg6f7sh3fACvWWfw
 37zDbO0XLeUFOxoa3083Qp5XnMc3gr+3Y1XJPtdor+VWukev2D8SFvT+sVcw7KORcX71db/kt/q
 lbf1YywI84OsYVaKtm5HrqbszmP+HNofWD/prBr3pc/9UmvOwu6j6fsyD2WtObBSTEJ7Uf8bsza
 V29PPnZlQgGjwm3LW/eztCavCngv1NYvkZ++Yab/7V3FAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX+UkrdnRU3aXE
 24TGgFaQ5vS8Zj3y/CVCT0sXZq2BLHYFmJ5wWz1MS2OjpX4SXRxKYv3J/D/nXBF8/7pV4YFH71v
 faywdwy+OFaPRlNpvlqeKtN87eE6ndxAqc9WjchTykJiORCvFXktxh24eQ1aFFylFhje4JCKZx5
 ucYvVR/DXoV/mLv6n8+S4308kz9xgHCWQaIeMSyNA4+dS/W+alQ12e6zfOw1oNWZnz7g2BpXu5T
 +jG4XxqWIkI/1NpxftQIsX/S3sIO/A8qsa5DfKvtPf1u10m74Sx9WgWz8mY2VJ0R/4V0cqW4QKY
 B7m2ipif9X954QxdkPtAtBO/i+O2a+OJMvWdlMfpcXa9r9wjINYcZ+eBBtyWC3wM7dm2R4/eqXN
 DeD7YdaKbW/F9ySO44hf336l+Wk843K5UcZ+AIPz+FJD29YZBehE6eOwzA/Ct5uJ+of8oz+ipHO
 4Aqa+vyLVSxagHu+9kg==
X-Proofpoint-GUID: LJsQdoJrQ-s8k7gXPh1OL7pfj3-K1xHQ
X-Authority-Analysis: v=2.4 cv=D7x37PRj c=1 sm=1 tr=0 ts=69dcf849 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yD_1ZbJdsTQQo2FcdCwA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: LJsQdoJrQ-s8k7gXPh1OL7pfj3-K1xHQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

Several panels support attachment either using 4 DSI lanes or just 2. In
some cases, this requires a different panel mode to fulfill clock
requirements. Extend the driver to handle such cases by letting the
panel description to omit lanes specification and parsing number of
lanes from the DT.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 46 +++++++++++++++++++-----
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 1884ad2404cd..796cc2368477 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -23,7 +24,8 @@
 struct jadard;
 
 struct jadard_panel_desc {
-	const struct drm_display_mode mode;
+	const struct drm_display_mode *mode_4ln;
+	const struct drm_display_mode *mode_2ln;
 	unsigned int lanes;
 	enum mipi_dsi_pixel_format format;
 	int (*init)(struct jadard *jadard);
@@ -57,7 +59,10 @@ static void jadard_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x93);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2, 0x65);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe3, 0xf8);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);
+	if (dsi_ctx->dsi->lanes == 2)
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x01);
+	else
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);
 }
 
 static inline struct jadard *panel_to_jadard(struct drm_panel *panel)
@@ -151,7 +156,10 @@ static int jadard_get_modes(struct drm_panel *panel,
 {
 	struct jadard *jadard = panel_to_jadard(panel);
 
-	return drm_connector_helper_get_modes_fixed(connector, &jadard->desc->mode);
+	if (jadard->dsi->lanes == 2)
+		return drm_connector_helper_get_modes_fixed(connector, jadard->desc->mode_2ln);
+	else
+		return drm_connector_helper_get_modes_fixed(connector, jadard->desc->mode_4ln);
 }
 
 static enum drm_panel_orientation jadard_panel_get_orientation(struct drm_panel *panel)
@@ -354,7 +362,7 @@ static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc radxa_display_8hd_ad002_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= 70000,
 
 		.hdisplay	= 800,
@@ -586,7 +594,7 @@ static int cz101b4001_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc cz101b4001_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= 70000,
 
 		.hdisplay	= 800,
@@ -819,7 +827,7 @@ static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
 
 		.hdisplay	= 800,
@@ -1070,7 +1078,7 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
 
 		.hdisplay	= 800,
@@ -1326,7 +1334,7 @@ static int anbernic_rgds_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc anbernic_rgds_display_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (640 + 260 + 220 + 260) * (480 + 10 + 2 + 16) * 60 / 1000,
 
 		.hdisplay	= 640,
@@ -1562,7 +1570,7 @@ static int taiguan_xti05101_01a_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
 
 		.hdisplay	= 800,
@@ -1614,6 +1622,26 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
+	if (!dsi->lanes) {
+		dsi->lanes = drm_of_get_data_lanes_count_remote(dsi->dev.of_node, 0, -1, 2, 4);
+		if (dsi->lanes < 0)
+			return dsi->lanes;
+		if (dsi->lanes == 4) {
+			if (!desc->mode_4ln) {
+				dev_err(&dsi->dev, "4-lane config is not supported\n");
+				return -EINVAL;
+			}
+		} else if (dsi->lanes == 2) {
+			if (!desc->mode_2ln) {
+				dev_err(&dsi->dev, "2-lane config is not supported\n");
+				return -EINVAL;
+			}
+		} else {
+			dev_err(&dsi->dev, "Unsupported number of lanes, %d\n", dsi->lanes);
+			return -ENODEV;
+		}
+	}
+	dev_dbg(&dsi->dev, "lanes: %d\n", dsi->lanes);
 
 	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(jadard->reset))

-- 
2.47.3

