Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A853E4C73
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 17:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914444; cv=none; b=gIGMf1O/jJVBJPGQgAOuihM0o58ojKIyH/N09ZTKo7cYIq8XxnI27QbuVunLx7IZOElPRZSxHpMsypJjv3NMSax+ED53z1P2niR+Ld6aXCHuaj2NF/DOY5/82qgLaQQtmTojK3ZcobY2c3J4UVwsz73CCojEytkKL+CfSFkCMTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914444; c=relaxed/simple;
	bh=F2O35Uv2rMkE96sboDI/Zcq/juuR3QBkJohneNGmGtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r1Vn8+lX67xtYVhueniSSkQRCsTUVywHO6878CwbPsb19EboAr6Xq/IRjF2c09nk26Sgu5xVLCLRc3+iCcTSnxsfwD0yW3eh41aF4Nfud0A40jUxd35Zlkb9gBQeUqkaq93ADIWM4FfNMziDBZKADYEfIhJQCkgxSQ4jxFF6vBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVfGolBM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfecA1z/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVfGolBM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfecA1z/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DlClW366348
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 17:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kwYz6UWOy5b
	+OSxGK1ilKg1S5TT3o7G0l08NWn3Jakg=; b=RVfGolBMN4gJqfqNkvmdDdTqQIM
	GJgyPXBeQjwPy8s01h29d2mdmNFvMRS39L/4cgTxh4+sEDVpZk+7EOmxjQRXiulF
	OCMuSV4OiupNKTxAs3TjyWNASxcepjnW1s2159YZ/jNLPYOogYzb8o4g0yWDrG0w
	Vu9UG4I6eM5WfRb7fNeHEXNnnZmaW1bOdamt9YdfHWugVM+H12/zHv12WNpaZqcB
	XQBSvmAoDEAisdTRTRxohG87bm3JBf0Lasi9IOwHp56k3R65DOzHZubt8abTHImy
	RZSc18EB2CkjtBwV9ChvzMV428MPLOfS8PelxTYSrgHVLnszMNhDoiyjGuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6rrck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 17:07:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3653e382405so1496346a91.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777914442; x=1778519242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwYz6UWOy5b+OSxGK1ilKg1S5TT3o7G0l08NWn3Jakg=;
        b=WfecA1z/B5veCYT8c+XDsowOtEcyR5gF9sFGgOveCSXPAm7cHCo8X4hrWNSskYvxu2
         Jn0VhKJ4o5DhPJJ9U/PjRoRdFEDW3+TmlX9ScKKprx2t4egiDEfKHkSQlcvABRQ1yi1t
         0dbub/sAzaTmKZGUmGSCZGG89kfsdg0joXF8LMaZJuRTXvfoW2KvudEtK/R/4QdpRcpb
         LOMvmkslMKv0g1cEU0aQrAiL7wzNkCZ/Y2EMMyHw8kCrROptHPRh2nslOdWJKpYmQvED
         XpwQAh6jdNtEoE3qylitO4lQd+jFFhitxtSyjx70hdIPvcyPamSDhAm38DntWS4F/LwU
         gEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914442; x=1778519242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kwYz6UWOy5b+OSxGK1ilKg1S5TT3o7G0l08NWn3Jakg=;
        b=cWlP+68g0m4S7qTKuikDROILR1MnNgnKCRJfqccXpZSv6gOmrJ801CniswgwJw/59e
         rGMYzzDBKk3kpf0PVz1kDrhF7LXqCVjqJH7HTICtWxXE//YMpJqSOw5EMECv4q7mcLwT
         KM5tDILwnd8X9qyvmw8f0bPAGxbcYrAVDRyow9sYqHkrPNfr2srvkhcensHACTEeiXPK
         CkZx/MxdgyeZw+o0b9ievCEnLBvVX8Zj+86JfbWNqZ7UbkoZdnY54eh3g89QdZUnjitC
         l0ELv10+SvqJoBMJ/dadaOnK8qpxVJ2BYkQtOv2ap45QdFSBUt1tIwYiEWCxOFf9HcCW
         ysSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+ka3xk574aH2yn1uwjEF9e8twgLz3FQhs/RnzkQ9E/fVZZ882YE0YXhQnVmsLlrYp+AK2/KE9o71U@vger.kernel.org
X-Gm-Message-State: AOJu0YzWid23mgSzOAR8ETy31M3gVdi2vYnFjRUvWMOTp81d4Gqk8f8t
	0pE9elCwJyXWsStStOW1lNLUzKsRQsz94gsQWNjvZZANAgEROMbBhMOnAHkliq0V1EVG1gpHHUN
	KaoWy49Aa8fJ+VCyYMOIu6BB8hgwKZAt2Rgp9PUEmeOYCFyhf+213wSQBQ+jZxJHO
X-Gm-Gg: AeBDieuhdVANIPeP9edRWZpJmUd/DczJZI56J7mqaVHCQB2ACZIze5BEiBcqc6ga6I4
	BWGLljU9DTVMMawsQdCAc+I56czWHTYVUxMSbkUqr+Uu5OIUzczhS30D/YZ4oANn5rNqsBx8WAA
	qcFmfBRLVIbpx54qA6yC9oB62iYavvcdR/DptxtpDv97XPNlMls/G1uV2ax0mrQokUVxIItKCX0
	6sHIH1KzKBBY3TRVEHdDyQ+DUYZfp5cg/PT3W+96ke378sd7k3QCRf1O8YUCch3F9Gs50TOVP4O
	cY9pGugGw8jAUlZsDOUrc/e8/lNDl+ClIH6LpayvCF8W30NlWxU/Q7sn1A9PBGiK80hW9NCicrX
	drIRgpR0tZsHBdyjE/43yQfHw7VQn6qXWWVw7BcC1+M9z3LqhWP6geEtpXQZpook15nTV19LggG
	Xu7fYqlt6yvzcaOBZgALg2cihIjQ==
X-Received: by 2002:a17:90b:17d0:b0:35f:9ab2:a5b4 with SMTP id 98e67ed59e1d1-3650cda4881mr11081074a91.6.1777914441607;
        Mon, 04 May 2026 10:07:21 -0700 (PDT)
X-Received: by 2002:a17:90b:17d0:b0:35f:9ab2:a5b4 with SMTP id 98e67ed59e1d1-3650cda4881mr11081020a91.6.1777914441127;
        Mon, 04 May 2026 10:07:21 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm6256847a91.2.2026.05.04.10.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:07:20 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for Shikra
Date: Mon,  4 May 2026 22:36:57 +0530
Message-Id: <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oWl1GHyR-MZ4XDysNgS_2DtedQJOhAI8
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f8d24a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=a8DDbfJ14wVBhdYpEPQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: oWl1GHyR-MZ4XDysNgS_2DtedQJOhAI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NiBTYWx0ZWRfX7LwXZV753PD3
 rly1jal0C+N3k5cQjpySgoLV6k5VWVQJNUKP7VARsC948L7v8cvkg5fQvguqpN3GhEtpT/yUKTM
 pfKJxbTTRX2cYok1JMWdrbtRg2cnUfAD7tAauUzIbtID4TcnLXXf7ZAh7vkkkO/F1iWoYOu6CXo
 p2/GP/NNHZExIrSXKvtIetvA2KCMkSXlE8kaHv0AuysQBiel7o77CgaBdgDjROqidD727IrTOWt
 YO8vcBMjRYUx5EWTPhwdeRaR0LjYxYcXFfyumjUlGtjEUAlDFRkRuwF2/sIiYlhO1eepnj/Lsnn
 t0GbWlc39xEP9uKoT+e/YKdrIwm/X0BE4HJ37G1xJdpf0cHBqBbV0eB2Gg/6U1hasmv4vhNqVlT
 BIS9KvlHTu2XGpX9A7RaJfgrMlsp+3yqhZjF3YDTbTcQvDpISHrZ9SoC4am3JR+rcH4I6RyN6C2
 s/ureSlMKAlgRfitmNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040156

Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index 1636285fbe53..8402fe4a96e0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,qcm2290-qmp-usb3-phy
       - qcom,qcs615-qmp-usb3-phy
       - qcom,sdm660-qmp-usb3-phy
+      - qcom,shikra-qmp-usb3-phy
       - qcom,sm6115-qmp-usb3-phy
 
   reg:
@@ -116,6 +117,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qmp-usb3-phy
+              - qcom,shikra-qmp-usb3-phy
               - qcom,sm6115-qmp-usb3-phy
     then:
       properties:
-- 
2.34.1

