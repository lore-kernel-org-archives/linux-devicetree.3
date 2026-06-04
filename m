Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1B7477993
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576304; cv=none; b=UxhvHEmXOpYOwEuDqy9Fp8ya3cyqrY2uCRPhuoz+LkCLzrsj9DGww7Wai8jUStx4RnW6YMzk/dZSc1aOZashpbcjIEhS8Ktz5uqEgE5CMA0M1svdglCx0hKBai568KFyqYT3QGawT4CxhCphtnkPUC725iuNyhBfJIEBRZKMonk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576304; c=relaxed/simple;
	bh=RszZ82isccZ6HTay6fmDewNiy8+hVMevI+lNe+sJbQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPnPSmgv9QvWkTpYvtBDn8zCeRLLORyTvITBRAoFm4afFqM2N0QHyt79tulBGJ06ZRiWDnTHUetBwuvzT5f3nK9LzaiHMBw2PuQQ9UsLjV62KTce8+gfP059il3ae3wD3rlpBLfiAgIJr66ZIsSDaIQjhWMgr0pfcB6hijkFvoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKKcfbiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcQrXFMv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKKcfbiQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcQrXFMv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548AkPI140442
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 12:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5uBWSpIKAMT49XBoIDUyB5FAbxKelakvTHVeHNdNyM=; b=IKKcfbiQd4EX/21Z
	A6rxQE9bFiAjZalDxu5w+ZGExnX8akdriSFl4molN+SrcgB++6I0Zz4D6csgi/sQ
	CkVNQzKtcspqMHIMbZ/1Ew+/EPoQHgjinFCqn/7pMn4rSYhCZnRQq9rB+syYX4Hn
	U8bahJGzatQZUYPRngyTONXjAYU/hdaPQwlJkXUdaL49+8OZ5OUWTawcJv1AzgiO
	wzfdrfbmomKfTVnyK+YMhzJ624xZi+WLOnryrOe3b/ytmmDLFIndfHD2AG6xJSma
	FpzkfAznOuLB+XGDmEH92xNcfq2iYNYcc+4yQqPVOd71y51JDa3IluqYyS57nmUv
	KFKbvg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyenaab6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 12:31:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85868c32b6so766402a12.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576297; x=1781181097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5uBWSpIKAMT49XBoIDUyB5FAbxKelakvTHVeHNdNyM=;
        b=WcQrXFMv9NNxGZqw6Nm8TQJZ8MvSKP+H7FJXIa0DhXlV1ddGODGSDcgvUU6+NpakYl
         QJrx49/ULlh0YckZ6KRJCf2Yf4CuVOauDqLjEzpHjhvrvnYxDVKEND+u/fkWFCDiTFHc
         1jBqXXb78EkkGGl9ZVBnV9rnw9Ix3Hv7t0k0FRnJ25zcZklMBRLTtpBt529r5deUMGKE
         I5qIW5A39hALfZQ2AuyCDFF3pQKqMNPgu6S3/K+cHknoOaiL0dATBMv8fn9nS4CdQnZV
         8TXykLdSOt4ZjwAG8ZQT+z0xVxTpvoICjxwI11uk/J0vkgliEiLNBjk4glRfQbhOscD8
         KS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576297; x=1781181097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q5uBWSpIKAMT49XBoIDUyB5FAbxKelakvTHVeHNdNyM=;
        b=RE9LY5fBSMrZefP91SOg6E8XTVDj/sqjjXtR/f1oE0EmXIodad8O9UvERDiTeB4G09
         H4Z7xx8u0K5q949LKtQQkEcTVZmmXGmAWEKCedg46FCLDDwUIrvaj/knWb9LSipSC9En
         4RMhzKk1mF5ezsKPfLN9g/zXwJJ8m/JiZcL+2XOPUCSm/2KPgBiOOV804JSWGawZ+Pq/
         HOqtdFFmRP8IB8LPtagcS/MTxBbInlcpsIQTXTZjjDXg39rz7erCn+k6hoj4m3NUR8dS
         Pvy3qCDVNIfKPlh511zGMVot0E0+zLmxrDjm22LoMbHvbJsfdHm2INtruZQF+FX5ml0E
         u9UA==
X-Forwarded-Encrypted: i=1; AFNElJ9RsJHhX8r4tIMI6oE6XZGcBsDePw3EXggnJgcl/Fg8+B2vKH0FhggwwQiWukqGOp8BlC+TiSvLHDog@vger.kernel.org
X-Gm-Message-State: AOJu0YwekkgcBWHAkqvd4xpbPmDa+Sip9gRiAivLV0AHPybpK1/fhZVT
	wdblUbHAxrvzdiRpNLjOJS9e+/rIWpcGDbT6gtWyenIY7XNpyFZiXbUWx0kMA2EDjkzBf4kLnr/
	6cFHdmAE2hgnpR21/IjKBaiP5WCqoUsADPBuQtqxVa9MlOXaH9+cMNbVDyhpD+uCv
X-Gm-Gg: Acq92OGtvPqFHpHP+ldfY5im+mbpwAtrnWEGYcvneG9bQWqnk59cSeIJYrVx0HMVVam
	wiMnQ1voHm7yfLbjOVOcuChnpFvxbylFcVizG3KCxegtrk0SS3QKsq85mimiQOikG3tPAZYq2bJ
	FOeWHGT1JJaLH1Iwqrhzt171m0u26ThZc55rynkewgN4H5EfUooDVO9rzQLI2Um1Vm5bYleoq6K
	Nbz7az1uxSYgZyRzPktdm5S+9e1YKdySOYFNX13sAPa8P07w58g/sydS0uh/QSCSw40ra4/0YkU
	jpfQwKbXJNmpGBC1ZpQJjIP/cxqCIvDa52l8HCJYa102qsLvqGEs1NN2jrk6YNdXEeZhW630bCV
	HP8HNHfoTyn/IHIsjv8T2jsY3mWeS9avrz9Lx95nUBBWQp5k4abDhlCV/BNk=
X-Received: by 2002:aa7:8887:0:b0:82f:355a:857e with SMTP id d2e1a72fcca58-84284f19a34mr7916008b3a.47.1780576296723;
        Thu, 04 Jun 2026 05:31:36 -0700 (PDT)
X-Received: by 2002:aa7:8887:0:b0:82f:355a:857e with SMTP id d2e1a72fcca58-84284f19a34mr7915977b3a.47.1780576296198;
        Thu, 04 Jun 2026 05:31:36 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:35 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 18:00:49 +0530
Subject: [PATCH v2 3/3] soc: qcom: ubwc: Add Shikra UBWC config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-display-v2-3-b3c1b2b67edc@oss.qualcomm.com>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=1005;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=RszZ82isccZ6HTay6fmDewNiy8+hVMevI+lNe+sJbQQ=;
 b=b49w/HlsBNCONlirsUpO5rkEIu3aZiKg8UbSER51g6trjxtIHBA3pBF3VltP4RNl+n6X4WcDy
 tWxKEYVttzaCry/mB9JVehbo1q/1hFQVEJvE8KFVIUyofFNpmhHZ2ea
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a217029 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vtxxaatxrD0BdpsZsnUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: CYq8LOZY-Inswgg_rBc3Azt_Uqrh07Es
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMiBTYWx0ZWRfXxUTLa8PUAY/M
 BiZSmoNYQcbx1bNChH1SorHMwUdRK+scc95gPQpElKaoylZXk9HcUsPJftxwl1bJn/HBtVfgKHE
 iOK8Qs4vpA3/JelRaVShmXD70O8o5NTQ8IngBRB7lLyy4QhdTSIb26OsFw4cRfwUIY5MyPbFIBQ
 dExZtyN24NKkbndeTMEco5K2xhK5P6lRHjlYhWC1Uamq5R2/qyuYz5Cj4O7EaKk556oRdk5w1M7
 9aTxKILckheX05ZWXjr1Vl0NUN43bfdoo0QU3n9Gze/0yNSrSB+JesTlo+IdHqSl/qAD4LSxQAk
 HanMstL3heQrTDd7rsxn0XSF+2Z7WbVJkIThdZGhib4XYo4f/2Eu1/xPV73Jv+Tsq+jWx2jOnMA
 w/+K3TtTgtsOtaGD0hSvcLCgp5UWPMs0pEyPLqaBAwzLmiF1rc+QHS8F4VuEGoATSqD/inAtugI
 fr2bITKZbBPt5lXfiEQ==
X-Proofpoint-GUID: CYq8LOZY-Inswgg_rBc3Azt_Uqrh07Es
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040122

Add UBWC configuration for the Shikra platform. Shikra shares the
same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
UBWC settings

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1a2e54c6480d 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &qcm2290_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1

