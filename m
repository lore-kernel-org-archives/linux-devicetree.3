Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71643475355
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141147; cv=none; b=fRIb3T8UyT4Uv1z7dSE1mTiChxqzxoJhMDSOCSlBcnWPwbpk1lNAjFesyLfaEnPQ6a9TeNG3K+qPXil+r3T4AFyZk3D6N+HquurKVG3MGzMwhmBQvV9Xj5a/whF0zrwhjlAmUg1MDfXcTlCNePYK43ReMT+MavL3e2LTzxFqvEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141147; c=relaxed/simple;
	bh=VIDvYmpBYjxc5zZ8k83mGf8RxzGtGsb7NxMu+ao14lM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgCuuu6of+QipVHpawjZch1EBZc5ybxlQyO0HVbHQoQlAv8T3aDn2ZXe37bIK0v8IdBhvjMW96QzWTmGnK3oG9s/saXjDo4xa5s9tG6me6TVZZozZmqtaH8+Ij3Y9CnqdIjzT/8uy+XXX02ZDFJ+NxkP5GOQ/nD9QuW++yA19fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9RMnlMi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2Mgq9OX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9RMnlMi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2Mgq9OX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmEUZ3780627
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKaBjoBGU4g+MPA/QMDjAFsVj4rZ70kS5n2KtwM4AkE=; b=l9RMnlMiGOkxW+pa
	4Ss2zASx45Ad2B0m4MI1wJgI6cx4LhDELtFRKnDAvF8xgAHTLtdZ8LM0iwXy9Hur
	2QkAiWqqfs4ppobzZ2pjg5SNRQy6ijn06uaipg9m22bi3yZ8UkAvM0p4lbSanym9
	wAlHdpokJ7ffsjUx2iMuqac9USBA7fq8Ca0stkNE3dIrlR+5Foehw2ypdhzjaLTl
	ft5VMmJkqGxyO25MzFoC22yW0nqc18oaqDMkghNjkI2Znyi090yREDVo25kLsD/T
	T2feXCdUC98mRqE6av9RooZx6PYC/ScCreKWyvRPz3FY8B4wnOvyE+wmm9ixiLf6
	95a0PQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfj7uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:59 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b26d8d2498so1342748b6e.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141138; x=1789745938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKaBjoBGU4g+MPA/QMDjAFsVj4rZ70kS5n2KtwM4AkE=;
        b=Q2Mgq9OXkiZ9WANheNdhyH6M5JXnFGXv9tOi3fjF/uv2hmOxmxxbvCwve1e0Qr67sS
         3H59KpVzxrVTnIiuAXi0qT3JDZYHyLPpJcznCATbgWv8mrF/+wbKaRfNQF3HmHYrph2X
         0urafSU8449FlC6t7XZquvi/f2Qzy80/bs4mJYB0MLi7tO2irbsXf71XCxB7a+z3hS9w
         Z9U1cTWT2l9JjZEEDp4oPn+pz/FKF7kEecPexikX3qGgpdRrF3KJyWJFK0I5qUoMERf6
         VFLOBCawpuI9Wjwm7+3VcaP9WcswEzDDiNdw5R9lKU8mT2CiffHyTzhQqk2rJqPtrhl0
         Ilgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141138; x=1789745938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKaBjoBGU4g+MPA/QMDjAFsVj4rZ70kS5n2KtwM4AkE=;
        b=FKr3hStJYJfIh+Aq+ZCRshAWsXc50x+HNwHfaWLtO7X/lNuc6TPiU/tQTHM/hrhsSe
         zxbDxa+VmWXERnT5w60cfMfCmhmdf7sCAwK34enYFqmN+ywhD56wiSc58XfzWjKI9Oar
         oUwT2Zslh8A4Yi3rsUdDhuh8YN+IzlPYt6ZHcOxqc5xlMVgSBn0JYXLBjKTI6Z8EY2dE
         RYmHmaYSakhqU17QSrUr6Wk/SyjLMPJjJUMfuB0JwbjBO5c/+mw/mQc+1SefP3UdDOZ9
         KWjc9c6GWKe5jccm0SupJEsmtflUbfg57Kfhk0LpXab13ey79gSnh7wA5/m5pZiu4/tj
         hJkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwl6Z+xvCwrMCxJ9Vh6YlkbDy/q4CqSCoqVu7OSqZBYCpCcXuT+22QPjCFc19ykbBrL6vmCtfowWJdK@vger.kernel.org
X-Gm-Message-State: AFuF++necnAd/UnyhkK51HNozS3ZOlYiA/OzTZ8bwfqDXu/yyWa2LMjD
	Pz2veTbb16mLn5N5lGKNFUeo7PU6LZu9g1DgjUA37rsMpkvmccmiqs8X1HlqQVsvRxfInuoaew1
	ATbPv4Ceofmggwye9Zl8EWQXTAsSWstWBBgiVB5v/wt9Hy+JbgXvpF8yLDk3LHFze
X-Gm-Gg: AYBFou0LjpKDaswOjY7l+rz1Z0XgdTQ0EJu/gilo9EcaCnXH8GnPxv18E2ca0IV7K4l
	HbzF8w96yCrVQTj2MarSvERxAb98mqvwmsZxLac5wnD0nlYlWbbNQqBE8fZ1oZ73RTnVm7RQigT
	yYWLh9a4dbnduoaj8YJ2LopXrXw6U5LVxgeW4nQ4IWTsMbltXtXHD5vK9wchxyRnE+9vEBb+Z0/
	c3/J4I+kM/Tap8+h3HFKxT443lAzThQWTmu/AZ8B/GBaBCQCB7cWbaqj53xXCEnOcJ9uHM3a8X9
	7OirCFD8NtdKcZLwotkM1RlcU79kBsOfRw4Vhf1tppDTAoZsYWfDLvtJPIkcF6+FQIL6JsOOO+u
	R7eNNKbt+CH6lPSWuNi21ETlh4p4=
X-Received: by 2002:a05:6808:4f60:b0:4b9:e5fa:890b with SMTP id 5614622812f47-4c31b9f16eemr4174514b6e.30.1789141138651;
        Fri, 11 Sep 2026 08:38:58 -0700 (PDT)
X-Received: by 2002:a05:6808:4f60:b0:4b9:e5fa:890b with SMTP id 5614622812f47-4c31b9f16eemr4174468b6e.30.1789141138155;
        Fri, 11 Sep 2026 08:38:58 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:38:55 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:43 +0530
Subject: [PATCH 12/17] phy: qcom: edp: Add Nord bias and clock buffer
 enable callback
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-12-e25c073cf1b6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1163;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=TJ+MFSHUURH7gOS+pdGimYtOjH3VbFvgcOMzvr6FrkY=;
 b=H1xeQ4VQYRjCAdIOLL7ZZUQ8aeKbS2ViYdolASdA7VKj8S9mICvGiaBIYo7Fsv/BUIAOeWESp
 e8cjF4dHeaOChbU8dcgjgs3RnwXdzjlRc66uRQZhPDgmgXF+iNiD/rq
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX5qQt9aAq+t7m
 2Pjk4M/xOkZbaMIZwazQrm/XSIOU2httYl6lF/Bd6UZYxSOZpoWKG9/XRJnFSVU1A8lbx73ui0i
 esufmd7yn+f3af8Ut1n+bs1+L4M+wMqrWv1+ey/CAiu40V2i+b8ICZuY9poF4sNWWDC1WUNd+vZ
 rAm2xzewC7CDbSYNBIr2AwdzkSW2lU1IwikjJ+fwq68+vCghhbeKgpyprsxXAhYN3Ko9YgDzp++
 ghGaLEaRfrUi8Y/FSd1AHunvXTbN67QULPK6vmdw8S972GJmiZHImRqiv3qt+UROOR4SELvIsbc
 MEshw3mBcxok+XrOyv23h2OAnaRGgPbumRsRhUrOzVLNsrwT4nHxFkf5r/F8y+Ot/8nb326IFv8
 d2NzIG1M6UEiLZh2TwZmbF55b8Ve/MOjr9CKvDt9NzvGp8C86JnNzNUVc9SVKJVubxexGpdgayx
 OJiRQ0zFMR2XKaI0zKQ==
X-Proofpoint-GUID: WICoN0VSD8JewUcURlRnzrQkkyyplTAL
X-Proofpoint-ORIG-GUID: WICoN0VSD8JewUcURlRnzrQkkyyplTAL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX2lXbzzO5tXW9
 /WuiUnckmZL13bjcyGOOAjBmhj0POFXW85T2xOGWhFADilNP8gZDXTX2eOVwdtLkwZxW0te3a4v
 /GsFJHY7jV7SVnQp295BcdvV9bhO65E=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa42093 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UH4Y3tt_PtaHL7u5GSsA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord requires BIAS_EN_CLKBUFLR_EN to be set to 0x1f to enable the
internal bias generator and clock buffer, which differs from the value
used on existing SoCs.  Add qcom_edp_com_bias_en_clkbuflr_nord() per
HPG Table 2-1-d.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 6cac4b55b66f..ec4220cffe69 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1637,6 +1637,14 @@ static int qcom_edp_phy_com_resetsm_cntrl_nord(const struct qcom_edp *edp)
 }
 
 
+static int qcom_edp_com_bias_en_clkbuflr_nord(const struct qcom_edp *edp)
+{
+	writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
+
+	return 0;
+}
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

