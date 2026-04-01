Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A891C3806D4
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028417; cv=none; b=Mcu02cQImIN6Z5neAdvWexE9rIxrQPhCTQwNJ11jOJM6dJj4Ve3bgGVNRi98zjyqlqrn2AQGQ+cabQ4d9BGf2svxDTxRLGWssgPXOx+CiLFwDKx9WU3JyORFpdTyPk/ihQ+iMfc3ty/uSrZqFUYhhhivFBQVZfTkHvdRXkfdZsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028417; c=relaxed/simple;
	bh=HHcarmRqwtUT/YnQfaZxOlaXpKjrD/Y/4QHeex8uzNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JzHcHVbYRDbwoX3n5bYBRkUh41zA1uw2WbkyDeOXsUIdvfNStNAqDXaftzI966ZaYGhFlgB0japlCxTzGteItq/3sowV+FqAP2FFKcICL/KtWvdb8or0miSRz9QvsrQe0dustfSM0M1t4CfsDw0qw4lrZUrnq0G7TfaqgYDxAN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO2i+Brb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7LiSgN9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO2i+Brb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7LiSgN9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317EkoU4106675
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fp6DewLgWhkxTtOGAF8HtbyDZ+xvVZUBiujky/Sm5BA=; b=HO2i+BrbJS3aiPtj
	v4kPGZNKYHHM86EH38RuVw7cei4j+KVK6xNRer833xxTv2tlTElZSKpgU5sPejLM
	BDip6oXrnV1PlK75RYJp6ugchKetW7zmQXWq7WWw9yDBj75EFaSvcQ8nlzmicbyu
	QLwpltl59LvbAJoqGZUIQwfizh/BK+55T8sSDdHSEky4cM3TuGiOg/bnI570NV9o
	kqDnzVKejNQ+/I8cTI+CSQdBiBd0Nz/v29xbuu55PrDUqyTrXnLJLH6cAgHgUsif
	pqiAYs6MWezMRqVjscd1Mv/Ey7o4icaZjcmQeSJgy9PQIFT4E5fVE25FUCzHr8v4
	veB8QQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt901nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:26:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso86751791cf.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028413; x=1775633213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fp6DewLgWhkxTtOGAF8HtbyDZ+xvVZUBiujky/Sm5BA=;
        b=j7LiSgN9nSwJy0BMvsgoT4QLN7iXN/qhqMrjFH4EM5+s/Dx21/7OzR8SfoUrnm6gY+
         SoOU6oSubcwN2WdMJI4qgWXIuIM1XoCARvKDtNTVzOSkHvIBDfwstNklle8eCcs1TIr6
         PZhlFC00lO5IZkW8Ni3McWdxf3EHWcWMWCgMhcdiniyrEJ8YxFLm/tYg3O1mXdVjOdNP
         XJGBV/S30RbFr6ZpkQ0Yp6uaKEZ0H+ey43er0hakkFYpVKh4uCs7w7RrZPna8UzgojhD
         o/KJuOs+cvj5InkiBIpv8RvzeiXDL5WAMwPmPrmI6kQBt57Fl0QxBkFgTlqM9ZiFb+OT
         5s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028413; x=1775633213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fp6DewLgWhkxTtOGAF8HtbyDZ+xvVZUBiujky/Sm5BA=;
        b=copG7/BR99ypO0O+P9/e0ax8rg9BdGKsh7EhYbKh2LohW/T4/Kbr0ov5hRdchXHRcb
         ylRRwENyIn5pyuzS3qDl7CuyDV8LlWN2p9XQcoqZUW2CJNpetjhdhHft005Ow7PQh8Zq
         k+93gImZAVZ2psjSol0nPb4m73bRnIR8SfStwaJ9RXZcGkGBWlnZ9zVPNc0URfMwEQ5K
         e1ZOE0lN9K2XpPO5I2V8Zs3O5MLBowZJNdGMsSo949gnt+9RWAaQYgdsKKfnhte6v2PS
         KLiIylgWzv0m4GnaqhJzFSAsB4YeidIGayJKV2GYSegdu7PVCsTuGqIULC/KVPGS/iNV
         JZcw==
X-Forwarded-Encrypted: i=1; AJvYcCVIQHGS0AZq18EeLDiNlsMoMsf0n6WHLMtJZ8GPwmoScgcDnBzkDL1Zd2IPBi4+TR5MTQRzpT+zGi3l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9toMnHH/bbvcqOSGTRNnWbzC/ElpC57MW4dEvrZsxHSYx5Ufj
	SSSkLf/L86i5M7y8w6gKvOPsPTF9JNfCiipzcFnkLVKqYB9/SPMQQ7iANbjTwmEy20gpYmq1vjr
	dmEnFOIN3mSxMfP5di971hCknnPtKbvyFyo7FPxiErAGQ6inorsgopFHbSBLn+6U1
X-Gm-Gg: ATEYQzyKej+3HkyTOVk3Y74fP5B5PXHJFLsbpDvrqgdzJeFcWm/y+FBt/f7L1f3VZsZ
	PmSqKbtZK8BBsc4fPINBGXZJniBfFwIIzyxx1zdmRkAWebxl5F0b/Up6LxmZ054fqMFW2+xQCLJ
	8e/vCCQalHYwsfzR/MvcQEpl2USMHTPCWZd1LfiSGefoLJr8k0X7WfpJY56ZLUI4lo+iSlHc4Py
	HDe7GbsDXEGsg+/Fz2EUJSBtWniIAoSCQ8Vchpn+urt59g2LBx9umEja+kLPfLfZb5FeRb2Lr8O
	cBESHL0cRenjcNp3u9b0/e6UDjKGoeMTxr5yrwoTIJfV6UrIV7MOtEq/bXBq4duUOJ+jLw186rf
	FvL55UUjLoi4GexiVYp6wy/yDmzszIJiQu3ipiLgt9dcO6rB9ytD5MvzUqzBdSKx7VVBZ1coeNL
	L+CBjZIRynvduYvhPHFywJBAnWLapMJ4AgQJc=
X-Received: by 2002:a05:622a:60c:b0:50b:3a6d:db64 with SMTP id d75a77b69052e-50d3bd40f98mr34192261cf.48.1775028413503;
        Wed, 01 Apr 2026 00:26:53 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:50b:3a6d:db64 with SMTP id d75a77b69052e-50d3bd40f98mr34191931cf.48.1775028413026;
        Wed, 01 Apr 2026 00:26:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:25 +0300
Subject: [PATCH 06/19] drm/of: add helper to count data-lanes on a remote
 endpoint
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-6-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3274;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HHcarmRqwtUT/YnQfaZxOlaXpKjrD/Y/4QHeex8uzNo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMirf/D5V8Y5hyL+Zg63UnoU5G3+GGFvPWTA3
 7U5rYhghZ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1RVtB/4wGDo7gJsEJlTeeGYm6xCRzzyNAlOtSsGBTzAqQjHPPxemPBNkIIjpDpEz3WAVxdAhg9A
 z3CJpRTKg2RDGPZjsDcfkwEhklLBd+HYehWEO+wPo9AbfvKZA8sAW51n5xjPOHuoVtuc/sLzp+I
 S7V8xpBqtx+0B3QlWtjtT4wT+V3nM8h9gJ97rUPvUMnOpeutrDFhB3puaTciW2MnLmCaEHJfveV
 nuRAV3XJkr5oFj01gfqI08tlheFfBvnTt0HdEk+KLBZREem9VRaSYf+rk+ZnBa2Hdgm6yecZZ7h
 8ytRBoa6UKtwFtSYKd+y7TpqPuKaoroauh6BtknYEVstJS5Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: E-hnOUltgD0qT7WZYBoh1KczdG2eOqLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfXx6Vv66ByBPpA
 dsU33ICT6AzRdPZ1OaNIAFRCdIJ5g87ny7yogeOkmqDbbGaoZ2tC5Xa52DBo9E2SzMv87B0nlla
 W6rvZ8oi93bDJeZbQ0YOhsqB0S+Sm7wQmDaKXPFWCNL7JpmazeQolzI33OlWXU4gfS67aMpX88o
 AUzdKyQQtSZFk7O1mf65DhvnGt2TF1OKNHm76wuLLMdvO8+6eXttxfs8dbkjr8MyoSKr4yaCBt2
 vB0A0G2EvrDjrg0luefYWUPm5oBd9SZXuvSOpzrTva0BSn0VhJ3H1ntn0vNEtsuWhtFy7jibzy/
 a/48ehk0w0V0n4gWkkBEStSzvVvuNdfgDCa/2ieh1GrPqar/2F1G95Aoq2G2DQCSJKWmzI40Gmb
 hOuyzyYxqJmjHXvxumLms1jGgYfbFjKtkkjyj+XRzs0VCwdvAKTwKsr+/jLFaRoVwt3TiFTDg+j
 DkOTaATdOyJsPPRYkmA==
X-Proofpoint-ORIG-GUID: E-hnOUltgD0qT7WZYBoh1KczdG2eOqLa
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccc8bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=O3ifdCkKFGgQ8ueZnWQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064

If the DSI panel supports versatile lanes configuration, its driver
might require determining the number of DSI data lanes, which is usually
specified on the DSI host side of the OF graph. Add new helper as a
pair to drm_of_get_data_lanes_count_ep() that lets callers determine
number of data-lanes on the remote side of the OF graph.

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

