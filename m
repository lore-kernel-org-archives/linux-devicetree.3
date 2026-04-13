Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611FC3D525A
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089150; cv=none; b=UsLrkhv/kKPlHCbomNoDo7REyIWgiMspBPChYZEvv0LLfeSMfGqncX714/kD3blkEZKMcbAQClV08uJJ4eLCyEVUeZxgiThQcdfZ/9/OFc7SlThMeNODSsWV2poluJ3ZNjz51pxyoYqUCVZxBTLnOgWi12MHY43COpkg5Pjql1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089150; c=relaxed/simple;
	bh=bq/ApaAu9Cba0NC2uhfLECwnb5KKZEMKi1G7RCOyYOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTCHghkgXdFZCgWqYAghagTkke4JHCkR8l8lBIh9UL3lTH5DnXqV3sFpwvPbEGjepUy61OPWaQeo/qUX2R0frj1tmEXg/3HY2Ju7zI5xraAYuXUnUAeZMYuzCAHEr9db6m8+976l1keIzhjy6ACog01SXpLhYUphXwPzQIFeHzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQQ/bH3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBpyB5zY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQQ/bH3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBpyB5zY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDm3ji1496786
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=; b=fQQ/bH3ye3psNQw1
	4KQ13lxs8CCzZjFxE8jYCe82EMLhjFHpyBbnNwEjV/vo0+tu5JzzQWKG+R+3PGdk
	XkZZs7P00lK3iKj9I4AJRsZnMXN1wFTh2qarn7BgFXDZ+sSC5JZZk57BghnkBWJB
	mVSqKxnPZxBg2VHqGa9vUfep+A3n+pxJcQ3xOXaBi3JmbmaalkCVPZ45sRz4aP7K
	c5QA3M6btcGe1U94s8jymR6Pyitr4J8ZH6zidpruCkuUMLWM8q9jPZfn7F3NJTzS
	niWmPLGL1JS6TdJFD0yMqmlW/SQ5Ng69r/5hWAhsF5Eyoga1Y3dBk98rsvtl68oK
	skuiSw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh1pk82v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:45 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-40f09403c56so8155331fac.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089145; x=1776693945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=;
        b=QBpyB5zYwi42P78v0DekpnCtfF3mKyZcTmEa/5WrbedXFSzOl/mfioJFkR/GYY53Tf
         qe6Qe0+J/woSUt2rxYWB2EyXvWYzw4UyaeaAb6opkF4JmwNCJg5Q5bZuauW2Wxy750wl
         hrUp85FdmPfE5WxOD6PupRfufFcrMBynTcTnfnjED60pSVJXiDn2Dwgoo9uIpUnOsMfQ
         zwM3Gnb52H5vZfz0kblVg8vY7edU1rCfUkorStZ2bJ0SHUrwdv9ll/MLdHKB05/jUjdV
         Z//ZJvHpvp+U/2nrfSJZLWYInZlwSv4EANa0O29I3zkYNUFUeWTgP0N1LD5UgYOFmBoS
         K7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089145; x=1776693945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=;
        b=XGACLWMLlVDoNRE/bhD4miDXUDZ9RU+jBpW/PHv2RXTKU7N6QpiqfQ9R5zHNbUIG0E
         8NeI7XacGJLbU1jDyIFc2lqaqIfuZ6kNEmHBtyqdbhpK2f2Q23SSFJLTYMOqpj0G0wnb
         CsPt3o0AzozJIw9eyrvUCZTxZeGyVc+qvVTnd9hrgxdSVhyS4hIQ1Z3/gfwNL2WjHub1
         LMaWmUvDmXTr4sDNE1GRhWb1PsRyyQ+mEIjr7Pp/qs3T3pprMKLCsUFCezMMv78XubYM
         T0bj9SRgBMw65jgdHsFRtXhkQu6O9vaddYUeaBp6QlxiP+AmqRnRqbmPMiBEn/cNVCz7
         sxvA==
X-Forwarded-Encrypted: i=1; AFNElJ8I76ob7ztsMhVLog4VVrvkhnHBd7ALAFVW0wMl1BoBVKo4CCFBgld5/Sx7IHkqOATqzXs9l5DMpyeD@vger.kernel.org
X-Gm-Message-State: AOJu0YzuXIDtpEnR6Jz2HEKoNcdvCcbOF+HM3KMyjm7qjFFtJvzN/Rhd
	53NLt8KBAss0jBwOoMmOmd0j2lk+h80YV1YUvVuKCuuDTylZu+D3ui3GRThqvU0XtCsDT+MsLnd
	cQgGpREmAZGTpqVZ/OsD3DOK+X97MPoKx4w0/Ng0QMKoc94kBr6DB8FGu+e7RUZR6
X-Gm-Gg: AeBDietnpTpQPr85eTRl2ShbvxPnB46YnlNqO64abq20uxlsUAN4ZDAKUFs6AV62kzE
	OyA/KPa59edyqUBQPPI5Xw/WMnJHsGTamdu9Zx6rsrKa/gR6/ls0v41MRJDypZMAqjX8y+sGfsZ
	w/3RnczYgDCXTRjFS0WsrFo1KJomtT9RH+Y2XeS0IVctn92/iohVWU5hSt4qJyBEugFHLnXA0MN
	kxda/XWx5rqbwviA6t1byuUlIqtmYTBo6WSxO9L25A71rvieE62aJAba/9aJClDXAlZ1SdZWCc5
	o1GD6px6WZGYJVW8otGZtAM2dfTb/lH+i4rdmllvB2DsxOi8jiyPIqrp4Q+OqczAF8YsuaeJwkw
	ZowpcHlyldygJWXTDTVCICNWtJ7uU7AMx6Y/xSvEx/QDP6gmEE8Etgl0vwg0sXh+3X0bbFh55AW
	zrrtarbIFZAKN3PHW94MdsCLWP5dPyc3WOKHE=
X-Received: by 2002:a4a:e75a:0:b0:683:121c:5aa with SMTP id 006d021491bc7-68a68c658b4mr5989936eaf.10.1776089144779;
        Mon, 13 Apr 2026 07:05:44 -0700 (PDT)
X-Received: by 2002:a4a:e75a:0:b0:683:121c:5aa with SMTP id 006d021491bc7-68a68c658b4mr5989901eaf.10.1776089143843;
        Mon, 13 Apr 2026 07:05:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:29 +0300
Subject: [PATCH v3 06/21] drm/of: add helper to count data-lanes on a
 remote endpoint
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-6-3aeb53022c32@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3334;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bq/ApaAu9Cba0NC2uhfLECwnb5KKZEMKi1G7RCOyYOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3Pgn/KFfGhQShasaHa6RZpRh36xAil8iwYTaF
 PURzX5YSwSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JwAKCRCLPIo+Aiko
 1fDFB/9EesztfHAvYdUmud1fJO8CCtfNhvEOQ3kNwUvIqdraNNcQIOwG+H7kHh0yg20MWC6Jn+8
 FqoQJDs5Co3bpIo8ZwJ4IDnYK/kCqqtZjzlYd9zRgILKvL3icL64LlBLD9gDewH4sYKkwFTtWQc
 fSbO8HHfaTxY8VdvALi5Fzn+OGQvs/mSJnTyTiNVMNpPghzRBG27oiM8IHtiZ6aEHzU49y2X/kH
 s7UlKDnMqPAnxmpYfHnOIpArkvJua6TULsf9kClMopHCdaET8FSNnwmMQoXT7Mzh8WndcaFk/gi
 YO+8mpPk9sCX+978OKLV0XocfLnJh9Q4fsX0TakkWLQe4jXS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _DeV5VVPFjWpEC8h0vlxph2NTF5NGYb-
X-Proofpoint-GUID: _DeV5VVPFjWpEC8h0vlxph2NTF5NGYb-
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=69dcf839 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=20KFwNOVAAAA:8
 a=EUspDBNiAAAA:8 a=O3ifdCkKFGgQ8ueZnWQA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX3774yd0hCu+Y
 +QPiKOHs62oaT6jF8COM8V2SDx4/2yvX2K3/XMOgEUom/VxZ3xWk7Z57zhLT0zqqZryKXxVrIR7
 9CX1YLML58gcOiMkZ06Hz2AdBT5yTIzaSrIMttKnp718O//LiVe8r/d/Ou1LjB9evKmWSWZ3xWn
 sSf4YtJeN7ebHLaa42WZuAjhEvy9KsEnwuudLeZ02kgw+IGPSaDFUvhreh3XMFeTsLrhalJoL25
 tXoO8vylVvq0m5Pqnutr/6KTGXQBfZDjbZ/G0Ud8LqG9M2JtTpSTT59SZOVGamxghW7W6L86Z4X
 WharTN63JXJdWU0D20ipC/YXy+sxxsPA2uSwmdj2FAjbWyKNQ1AWnVFejFGsdhhQAEDLNCnHwP2
 PNrX4mdbGpxeuFmmATA5AVIWTM3lvSm88h5/Kv+5adOW0YVtPRIx9sAI8auXsrtvRma8OruNCcr
 2RRa1w8Yqnf2wpuX4/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

If the DSI panel supports versatile lanes configuration, its driver
might require determining the number of DSI data lanes, which is usually
specified on the DSI host side of the OF graph. Add new helper as a
pair to drm_of_get_data_lanes_count_ep() that lets callers determine
number of data-lanes on the remote side of the OF graph.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_of.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_of.h     | 13 +++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 4f65ce729a47..ef6b09316963 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -558,6 +558,40 @@ int drm_of_get_data_lanes_count_ep(const struct device_node *port,
 }
 EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
 
+/**
+ * drm_of_get_data_lanes_count_remote - Get DSI/(e)DP data lane count by endpoint
+ * @port: DT port node of the DSI/(e)DP source or sink
+ * @port_reg: identifier (value of reg property) of the parent port node
+ * @reg: identifier (value of reg property) of the endpoint node
+ * @min: minimum supported number of data lanes
+ * @max: maximum supported number of data lanes
+ *
+ * Count DT "data-lanes" property elements in the remote endpoint and check for
+ * validity.  This variant uses endpoint specifier.
+ *
+ * Return:
+ * * min..max - positive integer count of "data-lanes" elements
+ * * -EINVAL - the "data-lanes" property is unsupported
+ * * -ENODEV - the "data-lanes" property is missing
+ */
+int drm_of_get_data_lanes_count_remote(const struct device_node *port,
+				       int port_reg, int reg,
+				       const unsigned int min,
+				       const unsigned int max)
+{
+	struct device_node *endpoint, *remote;
+	int ret;
+
+	endpoint = of_graph_get_endpoint_by_regs(port, port_reg, reg);
+	remote = of_graph_get_remote_endpoint(endpoint);
+	of_node_put(endpoint);
+	ret = drm_of_get_data_lanes_count(remote, min, max);
+	of_node_put(remote);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_remote);
+
 #if IS_ENABLED(CONFIG_DRM_MIPI_DSI)
 
 /**
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index f2f2bf82eff9..7bcc0ccfe0f4 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -62,6 +62,10 @@ int drm_of_get_data_lanes_count_ep(const struct device_node *port,
 				   int port_reg, int reg,
 				   const unsigned int min,
 				   const unsigned int max);
+int drm_of_get_data_lanes_count_remote(const struct device_node *port,
+				       int port_reg, int reg,
+				       const unsigned int min,
+				       const unsigned int max);
 #else
 static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 					  struct device_node *port)
@@ -140,6 +144,15 @@ drm_of_get_data_lanes_count_ep(const struct device_node *port,
 {
 	return -EINVAL;
 }
+
+static inline int
+drm_of_get_data_lanes_count_remote(const struct device_node *port,
+				   int port_reg, int reg,
+				   const unsigned int min,
+				   const unsigned int max)
+{
+	return -EINVAL;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_MIPI_DSI)

-- 
2.47.3

