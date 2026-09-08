Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720223A7189
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851472; cv=none; b=qVi05BgLHEfNF6z3hPk/HSof4Az2ExfPRNudBlq8+ef6ATqFW9rM/seTklSJrdcNHQPHNsoUuUZh7h55Da1gArRcR/BIuXNMzrHJE+PRevU/MuMfnhgO4clP6VZVeRCPBGZHDT7SDa11fhWpYvXTm861a28gAKirMNiH1IPmL/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851472; c=relaxed/simple;
	bh=Wpzp/cK3JYV/8SlC8t8vd470HwV9IihYSTjTRLAsIu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJsXlY+wIXE6yNwnvFRFvon7pgytoU7DGopfschUDSY+JNc9met2TjzqcnysqdgEUG0WmaiPSxzqB2lCOPL3L8/WsXlBhhaO6bIHeqORDkrmpzQ5Ldb5ZP8C5+8PXS2ytu4P5mtV5JsYwpPciyWM1MX8IxlIiyyMIhEADMS/UEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGcKJ0ca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ii3JAsts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGcKJ0ca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ii3JAsts"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LlBR1645936
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5f4iUpOb3yH3JsFpfvQ0KdsnnuKnbeOttiwhu6PZwtc=; b=WGcKJ0caoM3MNYsI
	kTAtfJAYbYZ7Eywwr4p9/VhHn1ihucM02V/Q1eKF7bxhvo7wVjWFP4Y/5ZkNGcWv
	8U9UhRXBx/XeDfDp147sptkMKZG3rOQufbQLDyj6rRlwG5y/i7QOUYN5ImD+qJzp
	eOLJdf0amU8mKWoB4wCmXH8exhs6+soAY7PaaoQXt3oScaEPmPDqHC6+vY5SA3oE
	wkHMRze+q/VquDCRIQ+Fa2e6Wbq3bvz4eKplzRBa6IGcm9j4OeuPs3/y88rO2wEm
	iHxYf3zkq+AMlBHMobx/U7nzlUnE9S5J+1Us991otwt+6XPh37GB9ewLmlHnSYAB
	o/kCsQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvug7q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:11:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e53b8a302so795160085a.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851468; x=1789456268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5f4iUpOb3yH3JsFpfvQ0KdsnnuKnbeOttiwhu6PZwtc=;
        b=Ii3JAstsp6qUZglM6MRK0z0pIBk+idLRQlmEDux9hGo/gdyR/aA7YHx1POcbUqnikY
         +kHBg43ixHigCM+7ooiRxiFnAW9z8cDGq/9bajkcV7i6D/nnCZ6tTqpvCil3zhskb4+1
         deos4t5k22U+gFBrjzNFhgGLWgErBshFXhKKMnGONoAlyRpC5vYd2q7uTVhSZLDyGR6/
         oKuNfDiR6RAk1qBM5Ozyawf2BhAgRHS/SvJkQzjAGZsvTdrc3RRFhZBM1z/8SCrlb2ih
         2UI7SPbmlnDa7K4GWuS1LasuHcIOWC2KVjKme6Cf9x77zSFCUXbLWwEZTm838vDo32tf
         z8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851468; x=1789456268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5f4iUpOb3yH3JsFpfvQ0KdsnnuKnbeOttiwhu6PZwtc=;
        b=cf+IJmRmWJ28myBqbJaZ2YnGMmPS81WvRXi6cU7cdXsjBmOGerC7BkkS4R38/TQad5
         WZJSJXBvkMZr1fOeWVOMhRj258fSJzY+h9dhTGDUBVugajmtAmH+Et42uVXr+VM3Pz0H
         XRK98X1o2OjDNJDR2rwh9dmsv5+tARJ0NfaoJxraFyKOn+WKfsJzVoaHnhx5WVkIIwYS
         9VgTnKLtJD1cqaw0WoF7U8x9QcDLHU30tngJZO2182IkrLABYoWGaOgS16GaBA3bO++a
         rajk1HqE938W9NL0S9/q4eZ9yiIWMeh0BX7GjdYtCA4AuaGDP6s5DsPLjEdXrWfdYHlA
         WfJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuVoyHLybd1+MYC30MAKYPioNJXL7LlEhLWur8fk+/mPvVWxnBYQXbAKGF3ea9fYqKg57dZ4lFC5mH@vger.kernel.org
X-Gm-Message-State: AFuF++ndv92k8PlkRxWtzWx/OOONmOewYrfOslYQSLA0NOCG9txXv8EQ
	YiJR/52GuOAi7IrQz9sn9cSX+LskNtYhq1bYiMAdU0w2Tcx+Xv/1FgHNVzv+91RCk9ns4voDtx9
	0wMCXvabhE8RNe3EF1UwM6OzYV+pr8fiI4HUiHUwq3o5f59TWDOgfn8cPp2VXZH7d
X-Gm-Gg: AYBFou1sjGL/1kXanZ/ZoFsDrM3yoOqcHqPh7+tCQ+yGl2cH9DbH/g1ELVIBdjjm4dd
	rnvbX8kJmbKwx2S5mDv/86rB7i9MeB03FZN9qBs8Biq1Uhzh/a7VSYEQY0SxeMeStjrouuUi+Pf
	3/83XIjD4Uah5KlhHhG4duH73J4OTqf/Glbv+VMt4GxN2eA5BjeUE5CfmutlYPDFzE/PnNZt6xN
	+TF//1XG4xrNYTwaaMMdZZKughAwO2X2y23qXPfVPV0unSOGGxBAbylgoBL7Y21ENNc1N5sjDlq
	YLCowkNpvCo093ChtjlWoOuV5kCkjGOxF18H0jY2wypAl+4JGrIEgEjSkk0jyklH9dzNqF4CFh5
	Nl30GhjCcHbbIRAur0KDyTu0=
X-Received: by 2002:a05:620a:6413:b0:939:5cd5:e243 with SMTP id af79cd13be357-93980324c12mr3025894685a.6.1788851468434;
        Tue, 08 Sep 2026 00:11:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6413:b0:939:5cd5:e243 with SMTP id af79cd13be357-93980324c12mr3025888785a.6.1788851467992;
        Tue, 08 Sep 2026 00:11:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:11:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 09:10:45 +0200
Subject: [PATCH v3 5/7] drm/msm: Properly handle msm_ioremap() without name
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-5-dcf8956878ca@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wpzp/cK3JYV/8SlC8t8vd470HwV9IihYSTjTRLAsIu0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7T7GoYekeeNs936mhSqK6BTQzcjxgH/n/DP4
 3PSvBcLAmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+0+wAKCRDBN2bmhouD
 1y4FD/92yv8+hHdjHnG5SA81WkyDML6FYcE9zaxhdIMgyRMN20VVvPLGmh5cuUShIvlbKsq0TzI
 T/b6Rel4LYsz/QtZJB9DcGki+3k1DHDpmiEbqtINZk3dNhqdABLTPi2rCHYg5zkIxsMrkqRcNjo
 vTWdv/fEFpNC7n9dJ75Y1AJiaktcoC+M1Rup9bmEREZvW1tZr/KlCy++WCr8Jtsoz6sYpZz5kYE
 lAUaHlfFX4wc62YvBCalhyctCQMw2PD9Jb/wo9AMLkGNrb/lnj1OzNP3q77oKAuYOflY+G+neZ2
 UqNObT2Is4xuc2WVqtqSMaLRnKtAGEeNMDWj2H5EvJw3U2Wx4WZ9OX372zgSTBnAcy67PS9ybH9
 rRDzT4QnCDLkVjo/5wJkIOw/TILMPymDK/VBd9ZJH77AZxWckUmAWO7zASl2neMk78F3rHZOaYW
 kyuQMR17A8mrJqbYxD+ZUKNKKIfiee+HcBabo94KkSu77Ul8XX2E+rotqFI4dKU0DPwqQNmW1qo
 nGly+iA47fok9w04upya8/OmXgpgyObpaTLxUTJAyqYQnAyGfwx5A8OO4lqHHs39Xfdh+TOJ5H/
 40Yp6xcWuRpphG6oucHjBPUpQPZgBnzWAtr/VhhrpSLMNS85SwRBjVEhcVhbKUJ77L8XusVizD5
 dMPXziW8Ml1jDsQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fb50d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=or9nyMeYumr6D7LEzWYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 9FT4TWUCp-MWT0d_QueIjzVP_GlZFjpC
X-Proofpoint-ORIG-GUID: 9FT4TWUCp-MWT0d_QueIjzVP_GlZFjpC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX5bKjecJMloIC
 /ySOg99d2ioPSuNqCqMBQ9NPzZp3Xi/S0IzoikEAsXBR2D/yBqKtCegt51G99Pn+Or5Pvqw2Bm2
 rqY7JBYwhVKJkkKdDutjb5yC/q2jxCrTSHQl2PxAQcHLb/PqfGCLJDM3/Aqxp3r6IdipIJgMDlF
 Z8Zw41nabLLXcd74939d6hTER3tIbsSou381ztxA1MPDgfvkGa7AVJLXGPvP0xehEplZs6LkQ3H
 G6TAuHwir9IWdZBgCgSl7C/DDHkBXk/5idhkwRdLx/2Ha2qcjq6zbALwHpVNkY1zj0BZVxCh27Z
 L7F2gCBzIAizMiQkuKERhJcHa5/ViijSWPUXTg2NGDLIDgKO1qiNWj9+eGKeJJYEkxaTk6QQsmm
 N0ld2CG2upHv6dqIDe3FP9V1LA2sGLDFmpKWbVrQNkAiRpkRJ9jSOOUDXf6EOAHgpEw058/QY53
 Rzlxxa/cr5von31pUHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX6eZIS6vHaHt/
 1HJ2WtC2xFX8X2q6o5QiEmGT+E/T8PlwC1W8WDiLkox1TacAC2+4Upu7vLZ+VEBwaGawy8rXI0R
 3pcu9mE3F1hxFIeGHXVZIgRLMCjf2yg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080072

msm_ioremap() accepts being called without name of the region to map and
in such case maps by index 0.  However error paths still use the name in
error message.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index a6efe1eac271..0a4ac0fc5fb5 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	if (!res) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
+				      (name ? name : "#0"));
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
+				      (name ?: "#0"));
 		return ERR_PTR(-ENOMEM);
 	}
 

-- 
2.53.0

