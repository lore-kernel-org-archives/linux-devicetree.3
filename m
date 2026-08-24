Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A6442124A
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572569; cv=none; b=OmsF5tXSv/x0vfntIgaRdfcJuLQo67ds23OQacuUzbN0gZYcR3qV1Gvpks1imq7X9x6lZomk7wWJUY4Ew0tdD2OnJfP+CRLG6Yoq5CJUvi1yddjghF1S+fDtMLbXjySW3E9bgwZbRc/nubu0Rj/HEUTl53psM7SMk1OVAir/YEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572569; c=relaxed/simple;
	bh=IIxFBk6ES86W5Uht2UYsLFSa4TN4Ihn/e3MF0K6mvIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVYFtL1w8IVB0mW0XpQaszASJBHtn8k2iuHDYOj/qB2A+L2051hC7ZE+3QfYzmOPMW1GaiYTCZ4HSqMmHymYKRDgpLnCJjbUVspvmWoK1ntbP1GgZJnh/V+mAW4IeqpMw5M5blSo0ZKZIHtGOHc/TR2RRyN1/7IjPRCO3tbc2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HL4+lyLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QN9sr45W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL4+lyLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QN9sr45W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMPVa2743033
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nqBy9mt3WozQnJzEmjl70tlvtPCUDEatMHcNTSyXQ8=; b=HL4+lyLcqcjxaZw1
	Q+8cofAPuonCdfCoO4ghl2j2X3sBIWGNcNEU0nU1Z2eE2exavoGht3qf/tHDc3xP
	t+DSaEbK1BwebhT91IFj8XDHI6aAKsBwGelx972kn/ArCfN4zqJXSvpkuDHMrgF0
	nkmcIJ7tUYaSF17UE8Negky8bjOhJ4nn2W1d6BiY4DhRH7vPdRBISpGda4AjD8bQ
	hcciJlKSzLyNQTh/Ty9IFKf6TFho02bbKPkUJ1uXReBTs3PmJ71whOAbtmZeDCM3
	N4p8QWBEQzvlgnO1qo0872lT9XVKqgpKOZAt5ul1cRD4ZSm1xyN+wMaymQuvoBV6
	eJQugg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0x08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d33c89a29so45626421cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572566; x=1788177366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nqBy9mt3WozQnJzEmjl70tlvtPCUDEatMHcNTSyXQ8=;
        b=QN9sr45W8HdDbq5sJGqDAlb80YNShPJ4FakNDXTss06IqD2BN9SiJAm5/XUgAK99pz
         02g6rY8PNG2xlVi28p9OArpYtZbHI9RO8TLcorO7szjkqxcsP49OZKg4GWg0ceimNg9n
         pm8WqdeS5HwohM6X93tTJ11CUlsVsNGIsmQxCOteXb4FvvK9H2DcHSChpVEfDJUve8ku
         Lz6G25X+UCY22mE7o1S4JkOfKh0AYj1AgG6qVG65U7JQIiM+wd07RS2jmYGAc2f4/mf9
         YpnLqPvX5deoVyzlxsXg+T+AzqgzxytHFWg5tixpodg4+apFleLVFPSYAjlB7aZfEUd6
         oIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572566; x=1788177366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nqBy9mt3WozQnJzEmjl70tlvtPCUDEatMHcNTSyXQ8=;
        b=ekXohzPlTVgXE7cquRDLu2ImsoN+gBqEutEt7zWNsvwuhAAtfFkHNU4S2zXDbS4is7
         R4xfJFGGU4SXCsYZj0KbUSU8dp5Y2il0Q5uMvjkKHJyXygrc0dpZHd9kx5ylFkNHLoBz
         AP/5wGZuLALR3iEt+agRZcX3D7pySUmHRkddjhAP87FXVPwFCCu5MlDjog3b7Rgwrslw
         GXSeO2vH516ieR96UoTjUwoAmsfDAjOBWMQ01E+ZikyUu0g+1gwxSKO5+fK62+CiHn2/
         s1leNKYB7jLW93FDG7ZWxMckJUwjDX65A+LGgLfHvkr0bmqny9qoP2iRG4RU5o+eJYaM
         apjQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDgZqMxDVSRRMNFYu1wshadYm1askLj35NOM0tNXfww0QUIXqDyY8cmetyqe3QzaoNc/rk9mPzos3l@vger.kernel.org
X-Gm-Message-State: AFuF++lEDxI5/Knf3XVZqI3rN/HXjSZK8tLF8vZ7d1jUBF8xobwfHYr4
	y5B2vsvwigtoUpPKpxGMwDzU74/76S5xL00zPs1TulE7ZnbQS+d3oZnBZuSw3K3Q4sxbNYwhcqo
	3gix4XQrPpBkXvst1FBgUe7BExT4vXMvhwSypxhWaDo4TLywsKPo6PyFmbZkVJ6qs
X-Gm-Gg: AR+sD13fhZqREeM/jyzyHOna9Ld5+k6FGD/lj6rCMmmS2SQ8Uv0J6hWq7oC+UCwkPnX
	AMwA/JtJoMPNnutAL2PO6kRIrnS2aBHqvXET7GJbUsL2u8i8RHZMeS6ycYLHhGbpEXFHgvE4ard
	UZ3zoetwjGwupy6zHrzCEX5i/hnIzQLflJ32sXIfF2Q9Nb6+a0BigzzCiSmOTiLAn65GINWDfaA
	SqhDObtvU68ZnNXhFHOsF2wNCqHrlX1e8RRWp01/1ftLfz5oyYCOQCduR3h2vjo7sydvWvmVcvX
	38yt7dUGDdLHCjIYa/m+tCZJvMq+k+BO6OMvxsDoBfgA0kdsJeuaggvcn0+17vEDwnNIisky+mk
	UfdAQMT3v
X-Received: by 2002:a05:622a:1a84:b0:51c:1967:5091 with SMTP id d75a77b69052e-52df5bb188amr233708661cf.41.1787572565634;
        Mon, 24 Aug 2026 04:56:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1a84:b0:51c:1967:5091 with SMTP id d75a77b69052e-52df5bb188amr233708231cf.41.1787572565084;
        Mon, 24 Aug 2026 04:56:05 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:14 +0300
Subject: [PATCH v3 27/47] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-27-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IIxFBk6ES86W5Uht2UYsLFSa4TN4Ihn/e3MF0K6mvIQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDv1V5Ivi5Z2KJAdZiGa2l7TJkKi5AxcX7Ye
 agzexaVtGaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww7wAKCRAbX0TJAJUV
 VvQND/wIzRRtFggyCxCkwF+PHSVCPVc6x8xhWMitauR1FU3B2oe6xgMOlpUB0PvCCR250VOiUQE
 Yti7Xq4JKg8oy0sKmRFAWFwzAfzaC+LEJLyGqK/JCvJdLhx0aCAGyaFhUqFlnKClbgMdJf6F8Vr
 Og4BtpMqrYD+bBISRmy+3HtaoqAgNkp0QOJcI8S/mnr8+N8EVLNkQP+oDI8eoWIeqp1q3cVgPBI
 ImYgwhzNKiKXQwhZUfLb+FJEl1QubjNZ5oykFWPDzy4sSKmVK4rZ9fvEESZIUX9Tx3BuJ/xQxd5
 cRlyweXccgy+IkGGkDjSHGCJTGwL8ZyRHbECGfs3fbvQEKHrQt7tceXCW1hBgvyCG5WN2bLttup
 n3GwEm+TNOPQHdqwLd/d8m8aAzuWSUKo1dPOKvaqlSJjSIlE+zON49g2VMspLF06reFm+WQbxcy
 RHRq2aIGoz6KUSibfIBeRm4hewawcssYoFbaIO1haoloUu+XhpyeanmR91kZRoi9oMj5IQ0pHdO
 gEmNumOyPjFFB0oulaSA/zMzJDRPYP6YqKaiQpgBdk69qUmA3rU2x9cvUEMRxAZW94Nfw+VMDtr
 ZLkn55HRoQOmAGZk88eLD0UqFwbXmabC5zkRHXoT2CuFDkJXz53Aa6Dqa/ERMHJtqfJtwNvHStw
 DkmsH2SRhEb1xaQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX5ca75Xggdp8z
 +tXCD9CRuQcdiy5niZQkCPia6hqF3TetNAkkxwandT1PGGjHceCfc6hhpQ6eMgtBqlcq6Up77+1
 JvT72ZQs05yq+TRJ/XnZsOCJ/iTBQ5D1JV5aUqKINC565Tum0GHdfuBQj5jXeMYF8I1f6Ybo5I6
 sJHfoesTODKJvf9KCKdyzkLPrmA5redjYVQFUOEth0DCG7NyoO1vNrmkc/ZXN4FPJPtIjeD51+I
 yNhZenb26LNZ3BmFUyUupYgYlgG50AE7naZJHE09av82IrjU68MQmgQg+NOwuCuwCrSIajadh9G
 2rEdxxSRmEW4vcwflYALzqO/mtISSAm3n74I11evTXVa6/oTt6qFctmQK9v2+OzmdBPFQCz5ITS
 YjI6eGXOnPRWtR3HJL5WLa4oz43zupsSrBWxU3/iCTdVTeTHl43BQvTvneSfENt7eGP2h/dX05m
 +Uv6v8HNv9KPkgRdHeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXy69fS989RCve
 3UH/Wdimp82EHNAjsglgYBigkF3c6+lUOWGcG27eM88PgeeXF6/JiehP6dl6tiLMgzrn8lnj0YL
 R2YvDXFpO1+UKnU+U8K81C6Hyg2vjHg=
X-Proofpoint-GUID: S9l-rH87jDwkPvI5CKH_bYM3_vLVb5wC
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c3156 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: S9l-rH87jDwkPvI5CKH_bYM3_vLVb5wC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..b3ab458048dc 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3399,6 +3399,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 	.resets = gcc_sm8450_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
 	.gdscs = gcc_sm8450_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
 };
 

-- 
2.54.0

