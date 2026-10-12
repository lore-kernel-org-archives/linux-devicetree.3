Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760B5376A04
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812014; cv=none; b=ISgIuI/4WLyKpvT7GG+wOx+HaFxa0DVGEneQViEsUNcypntSKbvvngzpiVcO0lkiTRSOx2PgYl22cmtxUf57OBaUUxHmV369rXcg1ISnVAsRsy1FKGUauy8iwU8Qml56bq+VEREnzqZyX1JWzCR4mT+15T8LLA+pklqslfjVYeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812014; c=relaxed/simple;
	bh=abtvE9SA+OSC44J14adMJZemnzeHPDaOOWMA7+pZgL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSQSIR3NexsrBWGP0TOgKE1ZimcH6712e2YUe2dvytP9guhm1ZIOi99d0jIVfOLvycLPEiCmDrzlniKHZpgRo63RKBhmeQGarqebb7PFYtjYaRX989gMaQYneEKHPnr35/7smt/S7Et9hWcYkkNAb3B38vaXldWC0Ihit6BEzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1g/JLZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gbte36tV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1g/JLZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gbte36tV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Ggi1236406
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BgydbxL5gnFgTs/5vZY3z8HM12JSjWAliFP2DRtg+4=; b=B1g/JLZmBYih41fz
	Fo5K7Q2TMnwJFApQt6m5QvfjJVScozrcilJYbcHVCkhIisfwOi4w+di2folhzcYh
	Ov7FMiXD6g28n5tRQ4+wtlbA2e72nP83oYW0fL3r/vAx0LjspyeuIT1Uk7OkNoJd
	JoGpGZW3/BX0oVzJSFJDHBLMDiDHpZdyeaHHHjpL38JVGBOsEx7nSjuvymgqE1/2
	E6qVBbYaHYOrcqR7MB1h1Zq5yIlXt2uqcQQO1ZQKkbA3sqIs5QX1TXj0063E3sr2
	2/P/qNTUnxp83fxpyFPel/Uk523pBuI63rE2BZg7ZRr6BZ8OAKhye3CrG52pIBLH
	YE6irg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dk6cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:33:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a0c25def6so2281618eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812011; x=1792416811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BgydbxL5gnFgTs/5vZY3z8HM12JSjWAliFP2DRtg+4=;
        b=Gbte36tVzAr9dcRpoumW33i3KvsKdCTgD+Ap7KBAsKvlsM1XHii1jqsgoY+zW9BSz2
         h/K1kSMO0loz4So3h8VWVWR1tg0IO8gUV0id8xsAN4qIFJCNaet5U9yjVdGt6yeoEJCZ
         eNAx7+m7aULMxR3tCLmMuaqpxT1Mz4ZL8brOV3GJPtradYnLTSC976R0pMKzsG2Q8Gr+
         2UjgyxSSm5sJym3sCdOYumvzy0QAabhqaKk1s2FJf7xlnC2ifYaXwvMWI5KcdwNMwsr1
         3G5I+W9N4remMCueeJDAo89YXcY3aPKr0xY+bd9+AFziaS/YoEYTCxC0z+KDTQ7HtubZ
         1y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812011; x=1792416811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BgydbxL5gnFgTs/5vZY3z8HM12JSjWAliFP2DRtg+4=;
        b=r+3kZrT25NX/V/QSJ9DPPi7qXIRv0PTtFKtyZ0uj+h25DfaLPjkhsTFePsRMkiXA6C
         fOD8FCMNpIcO8Tzd31dGHnYHL4B7wksGcV5Uc+TwVDSpN8VYFx6j7qcvs37kTQNgKg4d
         nPUzB1i5cU7B88x6eMte9gI8WP9/p75AUyb+2kPnwZtMY9gbelD6/WZzQUXDwNbua6xf
         TQd5+cJpIm941KZmr6ZUN3zgLPq6SKV+Bsh7bH4dD9plrcXjds3HtQM6qJ/TsXVRaAOL
         lJCDd6LXVwm8drpyzQDJ9oxoPUl4oFeb2rdmfOwDUKfnUoUQuzoeEGBNxpIcDJZI4qmy
         3tmA==
X-Forwarded-Encrypted: i=1; AKwUvBw/KVdofTA5bRMg227fcbKJXlPBhWNqZs+NX27Qj2A4POQene+Y5gNY8qaxgnKbc/CxpfZRyZkNCdty@vger.kernel.org
X-Gm-Message-State: AFq9FYIXJiPKVMDfNFrRkG0mDkkDC5a4m7+CIy8FJatf7lTNPobfO69v
	kXJZnYGbclEwCNhMlpgXYBoczmhSwDXsic/iiyRWFsfriCjKzE+nbTEMrpvumtuW48yMUM541ql
	vQdrqOHo4I/ypXHt58WY1QBo8tVvx8uduSB1cDJKVBwso6ngUErfBZ3GmN+I8Czm5UaOJGjGi
X-Gm-Gg: AYBFou3qPIhOIXt2UQcxxo3rLyfPGZIE0qtRBfjFELPClqwTiYNdpyoLoOpi0U2Wxsw
	SzYb5YaJyvqeeOdQ4WnURkgAet+tLnBWPUJ56nASBth/7o6WBdc9/PFWcBF9IiItdClNvVsHyvu
	vt1szmPSTFw8DeIQzxDJmexr6KBQf3po1hFACi1YaTs218RZzUHMjUlGlVjgOAyt4ViIHB1tCyq
	WiJXDqQrEF5PZmwgiBJf7Nl8hZtfRZelqaY24jqNFjousIQjgrCVrn0+PNn7NNAHUAnXQdnqess
	8zehXSHBxysf57KA2AybwMtsCfgxt1y1Rg7JKzbPx8RAydtD3422wTil8n04VyZtLmFrFe2NVVd
	Z9mJK9n5gharuvLUXawmHSNhnAOE=
X-Received: by 2002:a05:7300:cf8a:b0:351:1ec9:aa4a with SMTP id 5a478bee46e88-3537e063a23mr11970376eec.26.1791812011475;
        Mon, 12 Oct 2026 06:33:31 -0700 (PDT)
X-Received: by 2002:a05:7300:cf8a:b0:351:1ec9:aa4a with SMTP id 5a478bee46e88-3537e063a23mr11970325eec.26.1791812010749;
        Mon, 12 Oct 2026 06:33:30 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:30 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:16 +0530
Subject: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=1767;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=66JtXzji1QajcVRTK89pE3DM5ER0MuHJ654ycwA6qSI=;
 b=kB21rf3weXGt0FrypFIMvBPneNYZUAMZ7x1MMLTq7YnZY9HA3x+wh0ohqJGZrdtL8m2dfzOT3
 pR3PyqDrrXrDffe2ucAKIJJQcpIRWRlC82ciCDP7B4PXBDbbPK1pL8K
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXxhYdoMXO6rzM
 jCBVJGi/5piFrLbHLo2HwZcc3LouXuf7R4nwCZ1eFTBzxrPrL9iqJ7Kigf2TCmRlS+a1/hhWYEi
 zi9GFUfuPlKaGVnNMqmw5kpxJJsz3YkRRQWZp45P0YMs5Xjtj3jxqvM+DRqjMHiPf753wRVMQWC
 qTsLx/Yu3Iw5jLBBCNiwItv7HvkSIru+GZWW/qMVok5pBoKa2DSDzx8wRfyBC7T/49JyUnH3Rkh
 a91UW9caZmZ0D+MlF1TJ1c3xjN+AqnehQ6Sw1nk7iGe3i9o36it82SOqGfoDmfCkpj/ENBEPSMq
 o8f0zAWhxEXlSPj2MIw8IB3qcxmUcMuYvlS0wLXXrJSkcteiFrzKxJMkn7vjNqn5s/xYSP1qklU
 XyfV0pVayClkVZgiW7vmT9cgRGyhx0abGrx8NYMbZ3+LdGNX/jCRVjxb/IXxnco0tbl+oHIuxsG
 HLgUfpTiY1PuAbIswZA==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acce1ac cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=U3LaRFsynPqcHeHyg24A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: QdIajowELSj2I9TZTq72k_QuDfM0zBFW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXyToMxQVc0VcH
 PAV8s4uFEy1JDDOyaYMr5/9NSVtA8dgx/sUFVKphpXjkbTKTPoEYp+wlz7dpjYwjP+S6EwAcehB
 00h7nIP1McN+dvv0DzRJiU8+Gbdop7Q=
X-Proofpoint-ORIG-GUID: QdIajowELSj2I9TZTq72k_QuDfM0zBFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the Nord DP desc and compatible. Nord is supporting the
four DP cotnrollers, two per MDSS instance.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..7d233da396fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -103,6 +103,14 @@ static const struct msm_dp_desc msm_dp_desc_glymur[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_nord[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x08d54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x08d5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -161,6 +169,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 
 static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
+	{ .compatible = "qcom,nord-dp", .data = &msm_dp_desc_nord },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

