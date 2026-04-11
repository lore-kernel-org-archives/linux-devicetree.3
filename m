Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E073559F5
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909463; cv=none; b=CfF39yaJ2XkcLCfzyecRtPSw5fuBGINT14v3ObPxwqDnQF53WQ3Ls1ThJ9G1EXqLP3scTd3KjHniJ6KGbswsWyKnHjhbv9fqxBoFfIaZVX/Xi4pG5lokunaNfD5k4fCECD+YX1uZDecjnPBxeWWyFdtCptHhXgOWqVf4MgRtjcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909463; c=relaxed/simple;
	bh=bq/ApaAu9Cba0NC2uhfLECwnb5KKZEMKi1G7RCOyYOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPpdmOlzjWEvsdvSuZrumLRdTj750C87pHpN9BFC85q88LLl1NbhIZo8Dxce8FmPUpS++MbHpgUP9QzVqN/mYT6oPHbP1eWzblaY8Hq9MFkLHA7Mlbz7nmwsqDICDTFwkOcpcitJdtwkhp1ms1/mpdNy8i/Cdqbj8Z3JEtgMGRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDdlQJeL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7gG/LAl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDdlQJeL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7gG/LAl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B9uffm1911004
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=; b=fDdlQJeLfUJ/6fnP
	4WuAE2oNwfNKdLsfhcknpaOxkpm3LKFlX0RdRq+b/p9mvmH162VbFuE42hNkC8Xf
	zFDZ5JE96e9JEP52tWvDkVwygdNZBSaFYvVFpwwpQWC2lIgYlKdPBNVXkYbZsbl/
	b3eRNKm9G2dTEINWcaEVKLZB4MKrsv3KtATazQoGlHfoavMFvIlAI/BVatMs5zuy
	Sj7oQmoL3iu11im5gbL/KwPpUl6Cb7vTyl5GP8MSZTNXfTNVdw1SW0i60qppqhca
	X7oEYk7VS/maaYuX+QlJbe2ky65PBl9O2M4G05LOUcm5GVYBOBvqBiRdzhB8TfxJ
	x17s4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrn8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3544bc7bso36864681cf.2
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909461; x=1776514261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=;
        b=U7gG/LAlIoQCnv/poYYeOnFFOktuKy3aNbyk+GwBmc2Vo6qqcISofsuqhea0HYXobn
         Ids0ZTUSAuK7xdtVadz8TJoj7LbjdXaC6jN/e+224DtPbLKRwAJhcqWC8y1IWjGFN9rN
         TggAsEmdS1WEwZpyvQKimIpkmCwKvFBseQwUL8FGnETA4e7lNIz1wDxcdVqYCHG3DL+A
         wJRPgnIqyvli5ZIKI07lmof+oclozliC4vxUoCW61KHuKw4lnPXwRXfJUdkhyf++CxFY
         zXAglvmZ7hky9wdwdffCvEeebMoZiFL/EtuqxEYSrp5CVuG57pfCoTMNkBf7pPcqsuV0
         CuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909461; x=1776514261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=;
        b=UyMvDeezfNfvXkA8yMhjXFHWYJsoYAgSM7SsPhmRApXmT4vqEypeH3oz3tjcP9VhJw
         KDeGdQkEkAUOMnt0voPxXGvNbzcCSY3KXS+yTbu1p7Ndoqjn5ii9hEmjGMmn+8h9gR1r
         e9pmU5hlKVLYCvoO3eYXCpMBv+7QE8tMaDkTbNm1HjI1sebt4kcMrrIJBhaTRfchr+sf
         n6VT960AthulmQGaszygcXKHQ2OHDvJqq7wVREzSdgw02BneGWeKBWt75gkFLQROadwf
         EMb9pSHJkvNxTTMY5oEeFAJyo8KpK3teewLtvrZt02unhQa9LGCjnE1TAFdJAnrtCDhP
         n/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCU/S5vqOqwL1gtQMbxYNUeV1rdIKyNtElzbH7kYl5juACkf83qKkSuJuTILo29Sa9hdQg7C/5e7fSEJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwHxsj1Am9TAJqm1sS5ImR+nOfIM4wZ5ZQycXmb1Qs+bX8lcm3U
	SJdOR4xf5yxG1UPht+DlByr7/PyI+mh8yTqguGk0YqeSQLEsnfBVMVS9AYdTkT6WlKrJAKrnIb3
	6r8lpBSyb2zKGLbg4EG3+xvOc4hmQScj1NEH3aaD0IOZTf8KvVSEth7rYk9u4b3Dj
X-Gm-Gg: AeBDievjVFysb8Q4m9O4NqQIOdft53g/AhnowuFmrBzeuVLL4gXHd9zvy4L9ud2z9Ow
	qK1cPhEzeC0sn9qcXSwnhTiByHyULDicH0IYkuqRD3oRO99xQj7zrDKPRZIOmpn6GMuxWd2cSAW
	H/NWtjxGjBwhs5A5DQwbfDZGUcHC3oMHClmFm+Q7trFTHtXuVtYjjeWa1n0S+gUpWvZggpohLsD
	q/zwhVI3X7ZfXQnXaqEYCG9z/Aoz9RMcXFJlLzD3qjgdbS9FVVs2YmG9BcnyvrAhsXAi91bqXpk
	MkWNwkLaOlG7HOg4QO0UTguUo53ZdQ7NdrvUhrGGSfLb9Vsl+qcpmNPlnXNCvir/byNj8shwrvD
	hFqb2pHYeFGjISljdh+C8aJB/xP1Y/wfDlMCBmeTR/Y1hi60MfGa1PJUYDBcHqozpnp6P/XAQTj
	L209s1PEE57PurNv+yFNQvcwQvupAdXfk6djw=
X-Received: by 2002:a05:622a:2299:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50dd5a91f78mr97758931cf.8.1775909460533;
        Sat, 11 Apr 2026 05:11:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2299:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50dd5a91f78mr97758351cf.8.1775909460029;
        Sat, 11 Apr 2026 05:11:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:26 +0300
Subject: [PATCH v2 06/21] drm/of: add helper to count data-lanes on a
 remote endpoint
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-6-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3334;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bq/ApaAu9Cba0NC2uhfLECwnb5KKZEMKi1G7RCOyYOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpFtEH514oS6B6o1FC9Zcdoql1nj2N8uYHyI
 nbiRNU5PjWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RQAKCRCLPIo+Aiko
 1dahB/4yloTJ264Ag99K7uwm46uttgOjgWsKsCsqkXWtdhcPQTj/ynjNAQbI/sT1vhT2ZFtKP0i
 W9MEvdMEc2M8TpRXyAbCbtwMywfr8+wJv4RHWN3JHrppa3vT7SxKm8pr3N+N/3xLSx+fRoHbI+s
 MaEesitUe/TgtHA29UVd8bt4wgtaFBUBfF4l2ZxqnMre8maSj92zGmDcvWR8qsxqs8fGUeOaUsH
 u1oNNz2CEEYuqsT/xUuCeZtfapi6f4ARW41ivzbNMD3ycuwkhoAEzG6kUefGoaG1NWEcYwEIpPk
 fWXiJ5mOlkl8M4VIpMrbzD/Hj1Ii9EP9nDi8RwI/JMREJSsg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX19FrlOGEx0ms
 58pGiRc1u9KTuD+SRIasy/1BW8tPA+TI+MQJj6YBKbux+EPDeAUidUDsP1hRz0tHw9XGO+Amk+0
 d02hb1aSnipBb2i1lfUia2iEE3jtFWIOpk6ySXM+0TUT6fTI5w2nxNs1BdIRXU7tUR8GdEY7WuH
 R7B+gosQWGuytJFOp8Akh4CqAzjRsJr0C1vMkYtg1JR7Lydhs8igyRIoKUItT7l0Fyv4NOx4U6C
 RAZUDPcQxMEgZI3eqaY3kSG9d7eu/FbZelDLcnAS/ikNbV5dwfn1Urd1SjIO9a7rjad32yxjYzp
 1Tz8FjRq0qFYZtrKKYyE9DKDviOWlRroOBN+bgGDGKYjH28TspFwY2dKloUs0dtGf6qj0ip97RU
 cLmQhT1Gy+a9fcHkt32qfS/gSvkgOLmHWXgKHI4W85Ds/UgrvcBDNtnVJG4wvrbCwu6fpNV+Vjx
 UzgLlM/BWqeO9AseFCw==
X-Proofpoint-ORIG-GUID: ZYK2pF3Di848nC2TVLWTn3yC-EyuxEtx
X-Proofpoint-GUID: ZYK2pF3Di848nC2TVLWTn3yC-EyuxEtx
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da3a55 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=20KFwNOVAAAA:8
 a=EUspDBNiAAAA:8 a=O3ifdCkKFGgQ8ueZnWQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

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

