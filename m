Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A5476074
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141083; cv=none; b=o7E6MJRXOfyYlXmI5eWTItBuk7yaYr/oLdP/YbgN26083Vradxmqru65UKlHn8FXwhqmVGgT1blqUq54pRMPxHtXG6czKtseI6hVmX6/VJYTET0f+BZkJLrWnA3j7Iu8iHXGe/5xGcVfPraxhAuSZZJvvKJWGA3wA/nqLUA0G6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141083; c=relaxed/simple;
	bh=1tSqhaLQBJY51XwWfza8/oZ6luerxFDfp05ZePemJ+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aI3EIMqs74rTBmWZsPjpv9S4tSxEOcCGb17RVRLsoQxqiL+XAYQA+h4HTv17Du/ABiYyvZ+1hZ2NTxv5wWR4Dbtf6pGrjB5lj/LOb0BrdjQXHsIpwgpJ6XUkJIo9+sLzY1YRJVrrUol80BvJeS43WiynMB/2EeAoW1K11R1kcGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/fYRnm7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNxNeubP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/fYRnm7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNxNeubP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAaG222589
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a3b4UwBK4xHO58Q36xweSRGPLGI+zEDxQpaG3A4xvtg=; b=o/fYRnm7a8olrqzO
	vLo6+L0NqSocJR64l+gsZ0GQnTf5iHgirvyvUycTN611vwiKuzjkhVNSAkBurNwz
	t6d1xkkwWt6U8f00hSZC0Wy+lvbNE06IUUGHu/EBHjELHZvCOwA4kfMIB50VR2ti
	tFpqAc+WY7d6n0j9mkLr53xc+UwhfYGsBIgXBb37WD0mxCu3RqVgdBALezigHTHe
	c7uMw8f1WFQw25ye4yK3JKEyLqw1CV3kgS2602wUTl/4evFtNQ09Y494DBsfw8aR
	iovGI5fFFDKkTkqvuJpBmV2RV8vVPUMQhgJ/YlHBpXmshNmUxD12j7fpyHWEPes9
	hap4Yg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdrag6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:59 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-455cf15f8b5so1714907fac.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141079; x=1789745879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3b4UwBK4xHO58Q36xweSRGPLGI+zEDxQpaG3A4xvtg=;
        b=VNxNeubP/I5NiY9+x1sBYazLkIeQvek66G6CCxIF/c2eHsjIvLQ0mzJI8Mi05P5adO
         jT9b9lH2t0xcw5DkLcv5GCaa/CeC0rLr2Uo5Z9q7Z7RW4GCHBsAUSRCndrYt3rfd6x90
         yaKuSyCSQkSolLj7Ibds09oepmJ+yPbv4cMpWqSBq308ruGoQ+HhvZxeCIEgDisuBM7s
         VNm3hEVDwZKhrZ77be0w8ueIFkejssVCkQj9yzBKwvAvCcWGzDlYn9T7vvkPTRwqWMhP
         gPI6HT47ByI/QE4c9vRJXvPzICdW3VV29PaBJLyachVLT5x0xB2dMaMmPrr9WKIWhH5y
         zBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141079; x=1789745879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3b4UwBK4xHO58Q36xweSRGPLGI+zEDxQpaG3A4xvtg=;
        b=elTYwi1go3oseNOvPAREM9CBCmNMwgYhdL+MHltNOkEEq+NgW+Ge2E5TNziPhtPxTP
         1SNXZ8JjfyKzE/YhYC/aNnxBXMq6qQwLlcwC8D1eO2/K9zMAc4gj4mT24FCf55iXoOtM
         DCgM+7VO0PeFnBJIrc+w2vVgZYaKXfNTg28Xl9x5/OAtPkfCT6R87vF3yV5CdN29931/
         Zbw5RngTKOq3i6bPciZNJw7YGfXNynDbtAJwjXmSIHbRd43Q5hb33TJHjfleJ3aeP3sG
         b02iF38vPSmJ7aTx1TMBnQ/p8H7bIalCbuX3gjNgEBpivhquiNFm6tvIynGlK4xIhEoF
         woUg==
X-Forwarded-Encrypted: i=1; AKwUvBzvmqo8U0ZhXpQNXXPGO8D2On1wDoHPR0/WxKQgHemaTXJYodt+FtmW8CU3gvyIwI2r5lCeC0SKmpKS@vger.kernel.org
X-Gm-Message-State: AFuF++nY4L7WVBRxb/SaqE5cfiH1VzL73pQAZZn87ztlGAbxCkRCHFJ1
	vVFVeVDkSpMGn7KrUpnFTmF1JH3pPH6evYzojbLOvBWJgMJeqc7I8OyBuvq0gv5dvLfBKmXVx5z
	pAbNrtAEmE2jv1CII60Ad+AoSqCn+oxVNwJ8n5Cz13iHGGs24FSLoJyzA60juTH+X
X-Gm-Gg: AYBFou2L8ych01XsW3HI8/mraVRL8Apqwh4/M61f7mHAlSkPuo59URSJr9zuARb/D8s
	JMs+7ME2qtAv4+D2tIt+7U3UuP869ClihPbJLdRySHWakC1OKq4OdgBlWGhMYA2Z8nt0sXgwZYK
	yYBusqqVw8dMvcMrpZNM9OsvsmY0+7fEKdF/ZPl6l7zO/JT18adIEBwb6P63+F34ph87aPWgOCm
	fQMRC514jlYGCVjtvCHSfZzrdYfgXnqhqrQawHz3MNfKfLGL9iIsrDOR0gqvPJwBXjTr43gg4cU
	PsLhSzOMV0W6geWRUgP0zuCbC3AdvO6kOhegOJVdVPv1AUBLsSrcJdOiSHxLqh/JufR+2h+acgu
	qK7vjT4X4bYpS0kTOMGX29cNEzJU=
X-Received: by 2002:a05:6870:9599:b0:456:4c6b:773a with SMTP id 586e51a60fabf-47dd260022emr2776976fac.9.1789141079234;
        Fri, 11 Sep 2026 08:37:59 -0700 (PDT)
X-Received: by 2002:a05:6870:9599:b0:456:4c6b:773a with SMTP id 586e51a60fabf-47dd260022emr2776953fac.9.1789141078821;
        Fri, 11 Sep 2026 08:37:58 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:37:58 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:37 +0530
Subject: [PATCH 06/17] drm/msm/dp: Add support for DP controllers on Nord
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-6-e25c073cf1b6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1636;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=ZQKmc91CyQsnRW9gYuzHEpGY83cu2vNY2czx81TJ+4E=;
 b=y/qsLOGWDhcRqZYEtbq8zdeWKASA4zme6WOoFsKiY9BMi4SXhW8VaksKMG85ynnflPfDBcRfB
 xH48FZ/7pmBCZN97tZLOl7NHAZFwiJExWbDi0uVkuGFAW0WqV/8X6DA
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: cn1eWO39YKFd2yzCkWzp_rybRXArMVF3
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa42057 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rrrw5iIUSJUMZ46_DcEA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: cn1eWO39YKFd2yzCkWzp_rybRXArMVF3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX5j3CPvAn9sRq
 zDQvtceCqvkyCJldTMxYZJgDl/+JeclSV8mBjTHjl4D9MOYlI93KEuVsPYJSlq3eQ6N34DxYMy6
 k1QaR0V9EMwsaZlNoSiS+gI+rbeM9n0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXzgGsveAzjsr0
 6/EmL9liMeHUB3ofzQ0BsTMv20uiKilhpU2aNc14ok86xDe1pK1aRMoOhz1FrHOW6yOHDxPPR1O
 MaPmudEAl+zXsZJ+UMZy2b+fD2yZon+XsROKo437rTsS8atda0+dbX5/JOrofQe6/cCrkSRIo9a
 GLB+u8zsH3NAqTUZ2MWMocQSoR9pDQ+ge7LHv/gTXfYRa3fqOYjQelsp+rNqEXTKkmv6PAzLNMG
 TJZ6rscg+U/4yInR4xld3ARbeDBAYXh8WI46aMooNAKiPtzCv2xWXGY8Fu60ArOhDaE2e0sH9jU
 P52dTV1DFeXjgBUhcuTgJ7/uKTTvGObM/bzGWYf+BDjAdZwu81N+daZ8Rmn4d+vqqrxpOt+GOSq
 L8QNOTW0H+trdMAyE/og1QrxFEhK+eAJ+UZeDyO5ct79sl+dvNgZlQB+si5DsGqd5mei5unMfRw
 xyULs3BjW5wTHA2j+cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110218

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the DP controller description and compatible for the Qualcomm Nord
SoC, which provides two independent DP controllers, both wide-bus
capable.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..7e23cb2829ee 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -103,6 +103,12 @@ static const struct msm_dp_desc msm_dp_desc_glymur[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_nord[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -161,6 +167,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 
 static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
+	{ .compatible = "qcom,nord-dp", .data = &msm_dp_desc_nord },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

