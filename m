Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A332F7EE8
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779645834; cv=none; b=kKojSd/j9dkTkwm0EguXDU5QH3iFBHAj5ziv4sVR8klXNsh9/dOVIQBkLU19CcLdojmNvGjWWxIJfB3sON4eYl8leM9EVd8famIcmCYwXeQXjPjG1sYOr+9HqDK6RJwb/N7hPQ2TJtjObbTMO/UnZdu9n4ypTyrvJGai4amaAOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779645834; c=relaxed/simple;
	bh=z69l8drcA4M56Gf1zLixXLJj1ip1Y7pboQfzhQCxh5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JB+zfWNWXHaB3hsgJCNHdoknknLtvgn89H5LeJHKPo8w6kbzhhd4sicP3SgIbsl36rR4SrL55nom5KQRHgNJgDrz7hxw8W5iAPpgDeoVD3nftEMWLO6RCKTF/b29cenmxt76PnDlRhUXewgLH4gvSkps7W5pVMhgYtVIOMrU5Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmFHrJqb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMu+g4xF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmFHrJqb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMu+g4xF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O5Ltwq2782054
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 18:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCrdaOfRAGHcT8CmjZ8/GuKkLdsPMB3TN1gi/Yl7+QQ=; b=AmFHrJqbHPX+yIvW
	IDjcmpbrg3zikfQHMI4RPfSnKkArB6WRwcA0swXJuj5a+170fdAHSW0Xwe8yoWE1
	xTMrs5ReGWEeOBVnh2sNMO/cIdN7+bjngIsrbsOuT0/5k9VNlr3/go6YVJ2Hp4ay
	n07hOjoGrGww43XRCBaaIoUCY3Z8GoUteqXFthB92FrzuNEwkCIZD2wPcQ/fq2Ry
	ag4uX401rueVH+qasglSEXltgYgd34gkXZAYKO4YnVT4SXGSllHbKTxIrHXEFotB
	AFFglg8C3cd8R88GWQpk5VnObe1z7qQOuDEPKOPRHRRkdpEHs2MDORYrf1S/We3j
	DTKonA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9kk2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 18:03:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so8655241a91.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779645830; x=1780250630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCrdaOfRAGHcT8CmjZ8/GuKkLdsPMB3TN1gi/Yl7+QQ=;
        b=JMu+g4xFds0bw1Xzjwx5VCGWbVbi9A4uUHXyESxSjKRdJeGvaV/mxOpACI7Nivxjq6
         KAslNC25LwNBCC36lazM/W/PNRZ6LyeejAH5/W3FXaPMmFC+g3ukb5KOr9TfnNhKX7Sh
         wPw/Ki3PG0yyCqwkYHDlGtZyIw1gdzL5mKEOpPlA+mv5Z0wE9dKt0Q5Ix4HEtPuCFMRJ
         aUI0Yqk4PRx9C/mQZsxhM2hNxabRe1Whl3GbzxyCbFampvKvQaIFknP0SyZ6x2v1hlA5
         Sgc4AHO+NArzvB4P6AsouxWSTNvvfeJIHP2f+4YgDgXtojtNikd8UD8xc4VOUHff3V6N
         eExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779645830; x=1780250630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WCrdaOfRAGHcT8CmjZ8/GuKkLdsPMB3TN1gi/Yl7+QQ=;
        b=SAh8qaAGhmfEvi8+B/1vdUW4XjjssUc6IdXshyMc0a+R/yYmTGiO8ap8Vr51h9l+lG
         Y9X4PTSLqa6SYvhTSP3LQcVfUlNt5QNUloYJPO5+cXYFQbJsEM6iy++4QppKpFtFmB5U
         YqG6JNlS8z+8or+Pnc+A+7ZAsCYiWal/auS+9oJ3O2vy3MWxnUlgLmrT4q3gacV1R/xr
         GTnoYABjqh6AJMsUnJv3a+YreW4CSfB8Y8otaFd+fuMbLZrfKApTnYSwZ9/VOW9Oi+Kb
         gIvN0y30/g3/qt4wNGTflc/5s/e9vprqN/VaMyVSHzDS7xDMcTFuhp+8Ikx9j8XL9zY3
         tRCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GKK5nozgtHd119wfzcJ7/GmxbgIxav/P8kVMmpklaAfMHZkgChq3taR+MxqgdkvetQWdfHfD5rrmt@vger.kernel.org
X-Gm-Message-State: AOJu0YyPR6kzJBJZx1X2cF8s5ITQ2VGiK/ZA2eZvET0JD8K5FKeKeQzh
	m0kOUUv1LfXIZJx4D1DmsDGLH4J8HhL3ImZVMygGTC3Ad2+0L7MwoO4BafzbmaiBSicHIp++t3P
	OiJY+/JmiNo7c2YGk01w8Gm9glGFKfLahse5KaU4KJYo4wRcmgjfFL9jsk7NOw2Hc3UpGKeTh
X-Gm-Gg: Acq92OHLUmQUhAzeEP4SuYxyy971j5QR2eoGhd/fPMfIir3+6pj+nrC2G5tD8kSA4ra
	ZLDkck9/SCd2L9TN0582se1M3Cao/3U/VA/G0GoGO87z4zR+jcWgMXRe2EpLfg+yIsnV7sb+cvx
	y4sYAS7Cu7BQLcjGbaNAinJlxbLDeuzJUMJk6Sd+uZcglO2uHgpm+lfAVqk/el/BsVowK3deSvL
	Fj9sXpBOKwSMHsIFgRF6ETwOlAM5uU8Qq4pl58SNG77ZxMU8Bcz7y6gdOQ/LTLMJjAeWBbNMyPX
	d7+HDY2jqM7MF+ACOLEE5EII6c0h5fECnofsdm8Vfk1V6Sju55iTVZdYyEPvz3pvnouq2sdoMV5
	ArgQFKRnRkiXb3EJUC28CNerePiUK0TUkoV6F1kjI9Mzm
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr2431949a91.9.1779645829597;
        Sun, 24 May 2026 11:03:49 -0700 (PDT)
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr2431922a91.9.1779645829116;
        Sun, 24 May 2026 11:03:49 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a726348e2sm7252659a91.2.2026.05.24.11.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 11:03:48 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Sun, 24 May 2026 18:03:36 +0000
Subject: [PATCH 2/2] interconnect: qcom: Add EPSS L3 scaling support for
 Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-shikra_epss_l3-v1-2-b1528a436134@oss.qualcomm.com>
References: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
In-Reply-To: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: DmH6qZDNFy25Agqmbtgj6ii6qFbgJMrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE4MSBTYWx0ZWRfX37eyPSHrReqI
 irpFIoPl8qPp0lDpJv1eWNT2ONW8mctycQVTvpWivCnh8IDIwOtXaWDiWMHEXpbfu4c4Z3Xr+FJ
 N/hwBhdFAgNS6Zja3rLXIHSamIiXqZsfhK7+ZC9/5CCFnfrLlSHIOZh59+CzGamBZX9Jl92q3z9
 Y4DC5hic3PyEBewP7gqlby4yog1xDL2RiQPZFvFeuUei9IVL369ERWKm+0/mXHs16mXswVbfkZM
 zbgv8tUkW14dXLz1Hvz5S/HQlpOvWBWrwr0Eb1b9KuHi70Z2iMvUrUl5ZlhVDpEIDUGjHd1piIS
 mViZWEtHgqsTAKoCfjr5DQ83pGl5peNh5xKBlPOArX+XyeT/aUfDYXsScsFe5wO5ABi6FC0e41i
 HtkNasu1Q3DnbWmeroaHYrP3c5myKBSn1OoAWEn1FyITtrq35IHHAvEGcR2+EmIOZbivD8tWpJY
 gT/uwH6bhmXQ+/x9yeg==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a133d86 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Fbz4Wi_67QZ2LtXvWa0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DmH6qZDNFy25Agqmbtgj6ii6qFbgJMrE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240181

Add Epoch Subsystem (EPSS) L3 interconnect provider support on
Qualcomm Shikra SoC.

The EPSS L3 block on Shikra SoC is similar to existing Qualcomm EPSS/OSM
L3 providers, but supports only up to 12 frequency lookup table entries.
Reading beyond the supported LUT entries can expose incorrect frequencies.
Add shikra-specific EPSS descriptor shikra_epss_l3_perf_state that reuses
existing EPSS configuration with appropriate LUT entries limit.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/osm-l3.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
index b33f00da1880..ecad636b53e0 100644
--- a/drivers/interconnect/qcom/osm-l3.c
+++ b/drivers/interconnect/qcom/osm-l3.c
@@ -60,6 +60,7 @@ struct qcom_osm_l3_desc {
 	unsigned int lut_row_size;
 	unsigned int reg_freq_lut;
 	unsigned int reg_perf_state;
+	unsigned int lut_max_entries;
 };
 
 #define DEFINE_QNODE(_name, _buswidth)					\
@@ -90,6 +91,7 @@ static const struct qcom_osm_l3_desc osm_l3 = {
 	.lut_row_size = OSM_LUT_ROW_SIZE,
 	.reg_freq_lut = OSM_REG_FREQ_LUT,
 	.reg_perf_state = OSM_REG_PERF_STATE,
+	.lut_max_entries = LUT_MAX_ENTRIES,
 };
 
 static const struct qcom_osm_l3_desc epss_l3_perf_state = {
@@ -98,6 +100,16 @@ static const struct qcom_osm_l3_desc epss_l3_perf_state = {
 	.lut_row_size = EPSS_LUT_ROW_SIZE,
 	.reg_freq_lut = EPSS_REG_FREQ_LUT,
 	.reg_perf_state = EPSS_REG_PERF_STATE,
+	.lut_max_entries = LUT_MAX_ENTRIES,
+};
+
+static const struct qcom_osm_l3_desc shikra_epss_l3_perf_state = {
+	.nodes = epss_l3_nodes,
+	.num_nodes = ARRAY_SIZE(epss_l3_nodes),
+	.lut_row_size = EPSS_LUT_ROW_SIZE,
+	.reg_freq_lut = EPSS_REG_FREQ_LUT,
+	.reg_perf_state = EPSS_REG_PERF_STATE,
+	.lut_max_entries = 12,
 };
 
 static const struct qcom_osm_l3_desc epss_l3_l3_vote = {
@@ -106,6 +118,7 @@ static const struct qcom_osm_l3_desc epss_l3_l3_vote = {
 	.lut_row_size = EPSS_LUT_ROW_SIZE,
 	.reg_freq_lut = EPSS_REG_FREQ_LUT,
 	.reg_perf_state = EPSS_REG_L3_VOTE,
+	.lut_max_entries = LUT_MAX_ENTRIES,
 };
 
 static int qcom_osm_l3_set(struct icc_node *src, struct icc_node *dst)
@@ -189,7 +202,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 
 	qp->reg_perf_state = desc->reg_perf_state;
 
-	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
+	for (i = 0; i < desc->lut_max_entries; i++) {
 		info = readl_relaxed(qp->base + desc->reg_freq_lut +
 				     i * desc->lut_row_size);
 		src = FIELD_GET(LUT_SRC, info);
@@ -272,6 +285,7 @@ static const struct of_device_id osm_l3_of_match[] = {
 	{ .compatible = "qcom,sc7180-osm-l3", .data = &osm_l3 },
 	{ .compatible = "qcom,sc7280-epss-l3", .data = &epss_l3_perf_state },
 	{ .compatible = "qcom,sdm845-osm-l3", .data = &osm_l3 },
+	{ .compatible = "qcom,shikra-epss-l3", .data = &shikra_epss_l3_perf_state },
 	{ .compatible = "qcom,sm8150-osm-l3", .data = &osm_l3 },
 	{ .compatible = "qcom,sc8180x-osm-l3", .data = &osm_l3 },
 	{ .compatible = "qcom,sm8250-epss-l3", .data = &epss_l3_perf_state },

-- 
2.43.0

