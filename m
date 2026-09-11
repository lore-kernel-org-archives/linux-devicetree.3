Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196AE476694
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141193; cv=none; b=atmHQ5nVQtXCGx9YLSjv9DNqTBq1+tKnADnR6szncvzyH+Xe2r+bd4IP5frp5RDk+H2jihsYIW1+2cWCNsQd6HPIMf/QJRh7G3qoLUxYbm/jNr34ZJFwBT4smLr5PQAVevKj5tNMrwYP7lps8sRNl+89AQeeP3GVgN4f9ODs+Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141193; c=relaxed/simple;
	bh=UsJdTMb6bZsLoTsBJveCZxQ70+zk9Let5j5dNFvop30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzT6/GDa/kXNQ5Fm+fs6UNigfldmukPhhbT5I6aFsa/KdYHFQVLcegNfT4w1Fz9cNGo8syOlnyVULfudoZoIeJnbhyf1xqfsAwlIOq70kUd4lAc24f5PiG4yxl1M5Uvdu7VfPHxT/nJScdiUlGoIMbEzyePVBtLozGRKfBBsDqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNMAPedB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZpqJtPu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNMAPedB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZpqJtPu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm2Wx442908
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CTqihogoF3yIPuPhTFZAPSTFdh7eb9dOeBLIBMoSAA=; b=ZNMAPedBNqVlA8Lr
	Ou5gpYxhDiC0HqQy/EQsPO5o7gYUn1tvFkbWOfd/bZW+3xBPvvgZ4RXiQcww/fwy
	53JFIOwzJVj5gQGBq0LDLohxDgBCtAxDjAgUcbP/QQiIhBiVRM2uuQ+cRsYAR8sk
	WApxk0L/HnTDo4V3tNrJrwSxk/MTZ7j2/G51kYCW//ada1Pp+JnI01kNNc1TpJmF
	eh4uEF/+ZndBgGrWJ8tj3n9Vb752K+2bKmSOIgCoejO69X28Wd0eDZCys5fPs0dT
	KxzDSPljjvkfFOD5t+/gck4yh9qSuzL3MEkxWbXeX+m6DtIPAS8osu5NDkNjVo1/
	COLgnA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2p19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:44 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-456b5122c7cso3230534fac.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141184; x=1789745984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CTqihogoF3yIPuPhTFZAPSTFdh7eb9dOeBLIBMoSAA=;
        b=cZpqJtPusWcLg2SBzVEhmtQQOg+fuDkeSRFOODMUQJwBccxLtGSeNgpLZRKqHAl8kW
         raqTjpmByH9xyRwdlVYSkjMzzhPAooG2lZ9G8biQOj00j5wJTBwJv23XnY9qeNqL0FI9
         1QhTLExR20M3c9vwYd/QLnf4kaTf4kElV4mE5faxsYA2drdRYICVj3GNvuDFmoyFuQny
         XnrlQsOit67y1Pp1nqM3WjJfw/oBQunezpSi4jXPCUZ9CEeNAfWJRSZ0SUDl3q3VnN0f
         JgHAkTrJQqEbxCa4XHGbkPlJoWBBp6UBoq6r4tMFmVwaRDpr0+cFlMvb180+ERcrT1sz
         ODyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141184; x=1789745984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CTqihogoF3yIPuPhTFZAPSTFdh7eb9dOeBLIBMoSAA=;
        b=UTA6SGJXfKKcUopuVLumGK7N0HjhGItzZwBhPipHQDECvTC/l66E3BJxGfcYDBFRWy
         ZXAVQVB7JtZ9TLU9VENW38oMMFB5Yvisd27xHbyFLp0IHa7qj/bwL+bDB2OOK25Z3XVq
         WfwPMu6Qv8GQRzSsgAx1Cbv77xAfAh2HvwPCdaCjFeWdpB12uOwfnmH1NBBT+sEX5bGO
         pGPuCnNTcftSH/8Dm1iMjw1ks6K99uoj9u850ztqAZGHEmq4YT7WP1SSXtxzt8iqgX6F
         9HwfHMhronVgi0EEcnHI1zhijCi1D6PS62hbiIc6O0kk8PdRJIOhTGoDdgZu248w4VoT
         EcDA==
X-Forwarded-Encrypted: i=1; AKwUvBxG0XJO4FYv0Xg413nJOHLCqdgNwu7gVn4RGTqc4UQzeilkLoWs1XfthtdFJ710Xbuz1w8Lqf77lzmV@vger.kernel.org
X-Gm-Message-State: AFuF++kDWVEBVTIZ0utbLBoL/27fYxrN0ht03Cnvxvq531a9JXdcgbbd
	d9L0F2I5qD+smc6joqqpqNNCZ2/T9okWvShQA1OOPnQYWoOs/27VpF8RGE21GqkW5DgccQ7dT7u
	qYrx0cRPpn60o4E7sxtrwSGxsvfTvVnwEMCER/6KQSExLrkEoXqBE+J+qoCFDjnO3
X-Gm-Gg: AYBFou0F5JZpcwXtp5sWfgbyTaOaN89UJY8kS+f1/okomdfQ/dethdeQuy20B8IAYoe
	CkHw7ACUvME2gr0rb6dv560ndHiCtzCuHqJDhMzXsODlQjw4S2zMhUtqQVfMe5dBKsdy8fpVOyG
	R46Sb1EnZZwaAU5n+GFqZ0U6GYjwyMt+MbXhKIyXcG/Dz7hS/SslmFWAQXcZ95FaFaUyu3IxrZf
	qZcXuEKcBMou8JXn0ixP0vERhQ32wYqVHE8mhWB8Ke9aJ5qKGeuCgwrXFANp8KJxBhyAxR+32u/
	rb3TRl5QIuJdWraORmNXsVmvTmcq+0P54rm0WIzNcldhsUbCng/dCyZHFoBBZfCMI5GTVyMGZUV
	LGtxgIy8VNWuu3vxJd0PGyUUrFUg=
X-Received: by 2002:a05:6870:21d4:b0:44d:2da0:fa1f with SMTP id 586e51a60fabf-47dd35f90e3mr3131531fac.10.1789141184376;
        Fri, 11 Sep 2026 08:39:44 -0700 (PDT)
X-Received: by 2002:a05:6870:21d4:b0:44d:2da0:fa1f with SMTP id 586e51a60fabf-47dd35f90e3mr3131501fac.10.1789141184024;
        Fri, 11 Sep 2026 08:39:44 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:39:43 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:48 +0530
Subject: [PATCH 17/17] phy: qcom: edp: Register qcom,nord-dp-phy OF
 compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-17-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1090;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=u2YdZt6zLxkF9NeeDFO6cI3YUG8ouytJ0A/YUYMzpN4=;
 b=1rlx3/KAdoDBmbu9KB7g/WFds2V+Ax4LJFhoRI9zajHaHZ6SisVfgNvqXrfK2Fw5H02r/Jwvq
 3GllpLpxEV+AQB0eIz4Oai2ZEMjP/Cdnf2RNtpRBg3QwvV1uRsFOCCA
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: _Kkpl2n35Khx4nlYjOjmcsEwTp_2DZwU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX3dRPayUM2FWv
 3SGJKCNxOAuhVIZbeP44Dmth8C8xz2hoPjjPAoDphv32zRJqvr+33J9rVwMVbgdex7l+Dglxkqq
 bcw5VnFv07on1KMwaNWip0Mla6ABg6w=
X-Proofpoint-GUID: _Kkpl2n35Khx4nlYjOjmcsEwTp_2DZwU
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa420c1 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=o_H2acsbjChyEWv8a_8A:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX0MGWcbU0ij8E
 cXyyhCchEXUl00FbzqfZfhNNBAKwthS7qXmQQr2RthqPL1mQfbdanmJJBDdnpFQ4+rXvKF0O1ZN
 K6k8C8zE+t84lKuVJiTH6QPdj90bexntJbevBP6omGNlKntPDxwRJqouKBT+GJM97f/kvW+85fR
 dswTLWnv+hZPKbEY1Ba3mTeKt2U0oy0AEZu3k689BwsxO4/6eGb08zhTpwBFZNl7d+yh1OCc1uf
 1LHz4TIH2DmGLiRKD6nTTRV5/2XvH3kViJqKJ6+f62RER+i0mlOMapC9XtVNeq1YzUf1+hcW+tO
 z9McDxekjRvcqsyNbENXT7/W+uCHixzjjh0LRF/K4sxp4JKfH6TZisgO5PP3hUXSBGeUAM8FjnD
 yjiBES5Rc96e3Kv2CPgI8NGAcEIH2GfRqmt/d3Y28CRsjr1T+OAYKoUVxNoung0oJGruzYyD7Z2
 abFc9m1fGyj8XDfs4+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add "qcom,nord-dp-phy" to the OF match table bound to nord_edp_phy_cfg
so the driver attaches to Nord DP PHY nodes described in device-tree.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 338f28cb404f..f9a85ae8be62 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1872,6 +1872,7 @@ static const struct qcom_edp_phy_cfg nord_edp_phy_cfg = {
 
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
+	{ .compatible = "qcom,nord-dp-phy", .data = &nord_edp_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
 	{ .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
 	{ .compatible = "qcom,sc8180x-edp-phy", .data = &sc8180x_dp_phy_cfg, },

-- 
2.34.1

