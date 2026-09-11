Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6F44780F
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141073; cv=none; b=NZHiIv/wncNtd1kYwBvjxfHEuIGM55htk9xMT1Bg6rroy73MxlSXuI7ZKFtgzzupLALpOLi0gou3kLbo9Gp5jjyjt14v1/K8dhxEAzf6Y+4sEVeiejeFarQa3DYo5F9QJQGaTZb4uKQSS5skV4T8S5+kjB+vyOKxJ7QN4irIeHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141073; c=relaxed/simple;
	bh=VJu6MRwBVHsoAfluthDJbEmZwi5CrZjFQXXrpc/s6FM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJQ74U2rvdRCD5xkPEEQHCC7bOnQUv2OShPwym/k3utl6e+rKBG/oBIHR2swxzXY+FTcX+hQN0PVW7jVNLst+cT3qBO2hctxIqo41O11yB4QY3fI+5jD/FTF79sMn/qP5I+Ue1oeODy3+jB3+cE9MoUeQfEbKYVFvrH+/F1w+hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQFT4JWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFoJwIwK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQFT4JWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFoJwIwK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAsg1090942
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYhdb2mrR8nU9aigfyRID84GWgE0PGCAeGyhWEowOUM=; b=NQFT4JWxD+1csMZw
	ESk1TX6Fhzc3vBHA16zM/ySR1/pGO9JtHUtWv5Yi0YuuBHPcd5QO726I4J/D7yPH
	5gz11IHQNNI958H5RP6ItWVF+ua12yg9fDDD7WBIa8nZtFPa96o0pzLjOTOSpwKE
	3azZWpz6ZRBCIl2Y/4udZ1p3+4XD5f7amVejkCQo/fTY8iV76XJLqZopreRtxD77
	9XRuF4BxM/9sBT5nO+XZLlCaB4C/IqbhxawfKYuKKvhMbaZjb1LXd1FoOqaWts4W
	4r1+2wDNG+GhbKBZA4Pmr53Sx3YFT845zFabXet0Uy2RE8T49awBPLHZfLNxKAzf
	axps6Q==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3ajw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:50 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c18e7d53b9so555090eaf.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141070; x=1789745870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYhdb2mrR8nU9aigfyRID84GWgE0PGCAeGyhWEowOUM=;
        b=KFoJwIwKDtvb+v5dX+9tUehvbWCn4jk+yk/N97LW+zD7v0StEcOmeSRZ7Jp+pByyhF
         pS1QtTg1CcM9cn4J9C0K+MPHOXSAopgL0ngXbMOUy2HUl1Z/kXnowDdPa/CJj9Cw89fG
         w3a9/b1rkLyfBPWx8cKTAjVuKfXadaJMoVKKKmTgIGDCjrjL9l6myZoqatJ8pxME1q0n
         YkMdjvZgowLarZYJ4UMWRaLpwpjrNRBiigLqN0QevjIr1slOHGkloM1y0fFifkEIga4T
         Orjnri36aKMrXw1CEN6WhSMDZNkNpjDzi8b5Uaz+saX4d1djpzofYy3duaUpFZVznwXI
         HChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141070; x=1789745870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYhdb2mrR8nU9aigfyRID84GWgE0PGCAeGyhWEowOUM=;
        b=ebGd1+vEnPwscSypXZiaHco0VJHCXtXOfyVsFWszXi2dlicAXZnU/9STJLATOAH+Gj
         GmDpj+oD9d6pqjFmJaOffgfgot8nYSbGQp23/GphOHmOCCkFoG3A4y2daRcR0jSxtOae
         LadGyayEqxo+pDT+M3fvQs3mXHjZc+uky5i8Zukmij10xG3wDjWRjpmqMWwbv3wpaW5C
         Pz6mRb/ERMWs3Y0WrDTKVzeRvl4MpQg9saHkD2U2yLa6soQwJg1lCzps54mTQCs5bucL
         icxscDpeXl+oISpzIy+O3CwXsKONW8ANv/sxVmuwN0IqQEW1R3WbVR6pEDQfiTIe0gcm
         QetA==
X-Forwarded-Encrypted: i=1; AKwUvBwRvEUs/r+HhwtRXHYqBeAisZjt/15F7+2SD/LfHIxFI81QB0JJwYOCBBnVxqxsOdYt+1YhvI3LBTJo@vger.kernel.org
X-Gm-Message-State: AFuF++kvb2x9FRQblAByNafX3uci+sfjH+Zik+hsxDx0GTECx28Eyhnz
	0WpUPGBD563yzUH2RQHk+XoYhPfvchsHccCjZHkBcpH7rr+V1UHQVu5ItTYziN2kQsaAYWLGNIZ
	nltR6Sm6o0pqFYfUdw3WMkirpbEyvCYiX68aHPBdiU5TGG/vRz/JXlKBldPtw8yYD
X-Gm-Gg: AYBFou0FEdY3WsJenlgOI/ZzqzWPNOpuYdQjgczy1zNyw63rR/bYnqNLAhfo4l52QA8
	jfCJBnKSQjTa8cbSB+KDP+1M41aku9phQvDcJ53cabOC6hRZiQFPzeIceryT19J1Gl2fLq4XMjt
	B86V9RSdWT+I/g8UWqxzqJnZ5JSIpZ1QdQYCOgnCu/nOAx9Q637tlRojb3ztD3mx9i0Wn8+VYlu
	7j+pTkXeWCULM4GpsuG3+fzMuINRgVqQKzSI4421j8sWicPWG+H7UUVCOZH2q4qoBrdhEIPg/8E
	IdLc9sjvuBZ+XbFkZGtWZ9JZBoekncYLOnD8Wwe7DZl0n8LBx3DWLxuSmOMK/TLwkOOUEOLRbQm
	VJP8I9BCMzlS5uxA8/aCXB7EzzR8=
X-Received: by 2002:a05:6820:f005:b0:6be:7d9:b05 with SMTP id 006d021491bc7-6bf43d77bf7mr4867238eaf.9.1789141070040;
        Fri, 11 Sep 2026 08:37:50 -0700 (PDT)
X-Received: by 2002:a05:6820:f005:b0:6be:7d9:b05 with SMTP id 006d021491bc7-6bf43d77bf7mr4867217eaf.9.1789141069612;
        Fri, 11 Sep 2026 08:37:49 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:37:49 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:36 +0530
Subject: [PATCH 05/17] drm/msm: mdss: Add support for MDSS on Nord
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-5-e25c073cf1b6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1053;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=WJisw/+zpwludqPzeBDoVioQTucO9qU4qbNXUeHxKlM=;
 b=hHol8Y26136yGC56A15G8+99pmm0imVUMZrkON09gKnyKhZyWkvuSsE1wnklhdgr/TgMl5aFo
 LUoP58xTe3yDUgCeCcV0N8aIyNtvHvGVIvyQl7IeHl1K38J5/hl1Xk0
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa4204e cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=p9I9VcFEeIzhw9_517AA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: MgMMdPCaigHRFAFuzS721jgPQnaxB7DB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX2kjPexCiHNjp
 YoYYNP6Gn1z1jJkKbsSv+Hp6u0Ybu/HY0BqZPgzbmo95NETxIwBgg1LN9eK2tyV+cAm/T1N2cwN
 vZhaAydTeU07Ee5RRDWE/F8adIA+TDo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX1apdOJ2o9W1Y
 OgsRNGPo42bBcOiirZgH7ZfSgnEH//ODygm8zc18zdTxB2Go4ch8HIBejemLQxWDTJioN3F5tqn
 5fyAzgC24DEqjys4FTr61E25xKo+vib/HXbnjQsF+/qWvl1fIIx8n6wZs5+dvmP2okixTXcLNr4
 KUmMWQYX832DLhzXMpDBpKnzHRoeGhb0Bu5xyO0mPMu8MEARGPnkxGvgJcFKmY1vT2FuxlKbmcb
 YJJfx6vU5khvHqsEyevgiSWC30p7dCp2Zoew5Q5TrP2AJlKTPZutO5Qc4hmhuHDAf++7RlsCGVf
 ge8f9o5plhZEt6qpOSg1R02R42pSD6o621p5Wlf1xFz7CgOJc+PC5HHf0NQNdR2ttadgtEcGNiV
 GDvzYHkfZpq/Vuig+1WCQ0lEqjsIYnQd6xHU7KXRmGQ+XYCRpi+oVh2fN2RgkWvk3K7JUobHtCH
 gg07UWJu6dprtIHz5iQ==
X-Proofpoint-ORIG-GUID: MgMMdPCaigHRFAFuzS721jgPQnaxB7DB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the MDSS compatible for the Qualcomm Nord SoC, reusing the 57 MBps
register bus bandwidth setting shared with the other recent platforms.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..90bcc8c28dc2 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -531,6 +531,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,nord-mdss", .data = &data_57k },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.34.1

