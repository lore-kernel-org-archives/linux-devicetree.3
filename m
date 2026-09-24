Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A2C47534E
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246478; cv=none; b=Edt71MlcN3bvKVP/lJxhEdbr1cab7NvdqsKOplzuWcWrqDDV+hiAIHRCc7PhMAuHCl73/r9gNN3MJAo+Bh5XirlVKtamjbn8IhH06dSuoUCSxQuhDbLAQMfN4y9O4CwY0Iv5QmbaYX770gvOewLpDBdCOtjsaybYsDNLkmNC1LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246478; c=relaxed/simple;
	bh=cN+HDeANXO2WMlU60A41XyfjL+9PDn2q1Gybx6k4qRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NU47RHL0ZymqdNHqeV1odaKF/qRL4I2npukawTEHBAXvJZzQnkSC7GjlMtQmndNW1/u59GNjHb1E8cu9itDDOxrqbrTbjJsC206cYqU1/zS65gSePzsYG9O8BiwMVSjQuqpcUn3/jXNEBQEHaKz2DdnoAzXG5GiSrTfTjsq3AIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyRfroev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JN0iw6nm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyRfroev";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JN0iw6nm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1Ohw2857939
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgGhTlb+jOQvs3aXlU2sxM2hnoUQkPlVacNowvYv6vM=; b=kyRfroevuffqI4M8
	JU8qnhtyKW2ae6PQ/eD37krOHEoQ1kL1wUeSM6UCDCGjd/iyMfZeov6u9E03oyv7
	UqsesDVg5XHvIPwZdFT2fJwqjckEVSMOJ+YXI8u46vMhdP3JSUmIq9R6wfNzMi/K
	365jWVKhV9x3RIeR75coeJ31pU2jpkUdj/Lq4+7rtzeY4AY8qlu3ng2MRru7XS+n
	hxn+As61DVPlfiS9qehlnnSjrfw0xNcyFJl9Sv6iD+YKb73q3kI4bq9I5ldTDHaS
	Hqjixu0W0sXZqe+jhbUXQhjZul/HTBJGS3vKEi/AYRa88LOwRv5bh3yDl9qUXYCg
	BjQATg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag599-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bd22160bbso392854585a.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246474; x=1790851274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgGhTlb+jOQvs3aXlU2sxM2hnoUQkPlVacNowvYv6vM=;
        b=JN0iw6nmd3uyr+lkVuUDIGb3nj1Pqnnh5o3vnSN13wx4tBRTADhSaEuE+K4kIgvAyj
         ZyMeWqQ09jDIiOG1BVVWnEs4hl03mz2+K7lkvVrPqw0lLiWrPN0fJ6OsmmA/NHoISHBA
         Cr9DOXjHTpktYtOwZgfejxBJz6M2AG4+JgAH8u27HLXcy4te/UK58QU8o7Fzr7q8QICJ
         K4QXErLbtaKOHNcGfx/7W/n+t/icuEkWpvLU0jrEr3t6HAgG8lU5Lz6Bfs+UB4JOhHjm
         FXl/BSeywJlUBnLGk9GzXW6tmq95vio0uzEbySdzlVVuFWCGUxDBkhzn3aWSxcqaArTh
         Uf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246474; x=1790851274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgGhTlb+jOQvs3aXlU2sxM2hnoUQkPlVacNowvYv6vM=;
        b=t5Sdg8872Zgc9jgc2CFmb0MdrToEob7CgheJaGp/I+D1ZG8Gk92+b5ec6LjGrP4Rvh
         q3spHHyGl7qWxC/X59YChcmokDJ8dIwsAvoAGyhUYl8VcMn9NQ7q/ugLrweDnMqqQHvG
         8ZicoZPttk00CpN+nhSX/jbfAETV7IGJ2LeR6UJ0wrlnUKZG3e+H0+Z5ExENFCHtieAt
         QCzHek/DsDPtpgwbOboWLaxbYb4i6XIONdUG6jig6qB9xhpozwq/AGMmND+3IDFxsvEK
         DCL+l66E4kCHFuiKe7VAZ4q9BXZ9Ixq/X/o8H6H2A77aT+yIq799rXBsBZ5zfS7GJmba
         1aFQ==
X-Forwarded-Encrypted: i=1; AKwUvByYx8U2PAgXhBk/pAaNWiXgdrThBDxaLB5HksumGei4+DXmg95h4gHA5SRr9b7QwAeUlLTAlX5utcwc@vger.kernel.org
X-Gm-Message-State: AFuF++lgC6GKrpRR9d5WHUrOW6UKFvbihDoQjzczLmu4YGlS8ALKh6bB
	UMk3opoMGalehN+24KJiqI0a9+CZAjq7u8mrlGiqjW8Jh2Mu2FzWnIXC66vd/UjZgaj2VQLq6ta
	T9ebhFX2La0KNHp0f8GIT3vAdCHdZv+fIId0TnyGXsWlLSkXIM7pqzP7WVt/TOBgS
X-Gm-Gg: AYBFou3HFE3EJAE9grHDfD1XZ24emAPtv97CRyAdNZEDAR732VCer1UM2Ft78zQl831
	qqsfbeUiooxHu9An0YHtKPUvXZzEUAK7/kHrzhh3dCoRA3x1+EfIsBfIbWtCxFkgbgx+tLB2hk+
	RhB6lbrcBBbyV57ITvbNlUFr1/aKYw3DkT0TUKKkSD3YtNuvn6Zp7+ToctCQ3a6QdkSOzVAsx3z
	Xxg996kCw5qXIQzAAbQsWOqfXiFDfP2elWjkSpOVyOef49543axAn1U1exlCImfZl7SIxLqQDJZ
	ofpP7l5iPOuMMU71NHGeY8D/6BZvG8ka+BRiqp2Hl2IuUgJHEuXnyCiVSM1hSCsdFJ+jG3382/3
	1I2vyW89s
X-Received: by 2002:a05:620a:3197:b0:939:6de9:4cfb with SMTP id af79cd13be357-93c363f1ffbmr217302385a.46.1790246473670;
        Thu, 24 Sep 2026 03:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3197:b0:939:6de9:4cfb with SMTP id af79cd13be357-93c363f1ffbmr217296585a.46.1790246473108;
        Thu, 24 Sep 2026 03:41:13 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:39 +0300
Subject: [PATCH v5 23/42] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-23-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cN+HDeANXO2WMlU60A41XyfjL+9PDn2q1Gybx6k4qRg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3wt1xyqUBo2XBfdgM8ZCn/ydcNwR/CfFReq
 vWUiEPSp+SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT98AAKCRAbX0TJAJUV
 VpsxD/wJvaS5lYxddqVjRTQxsuOLEJxo72VVG9JcJ0mYkRyZgG9EtyyWRh27kbmYkXNwlgKGeez
 Wjh4lIkprw4IOUga4RtOAGnaI9s63+pzPPSOF10elrmZPd1ctd8HJr7Rht11AIhJeSPW+vxs1Tl
 cr+kVWayORHubPM67hM4BJStPb+KAjdHbIs/HVzSUsb88U/zYAJDfp8l1iQCDYJQ7zf2p+iZkHA
 j7MhFRopnpZrHdbKBEWO/tNPEOpjrdaFscsWwAdB/ASvChiN5GRntGcPZ92jpQvPlDHwMcD9IQ+
 +jlBngbiDVTz6v30S7xQzo5QZbtnkuiyAiW8VZFMDU4epTZQYwmIsMF4fWsS0uSxMZdSv21sxFU
 2Av2xR78Apz8syXTlQ/3R43zaND796H1g3XRRYZ+ys9qn07RuF2FqjXT4/mrfn+AFbSAIHky2QU
 aWY2NG8drgoaQ5EOPObKb7iVRbilnAkP3eXGPzUcJaczWGpyA3aQkmbyfVW/bfNRMQNnDYGoMCh
 iS5OxYNplOgrmSES+T+JlyWaO0csNvDgLwX9qsMa9vuUI2/mv9Raoi5o5vxex8ZsK2QpWpzOqbN
 XjYZeYCEpgnSpskY63fQT32AL58Ct17zR1jm9kr7zaR1mvyIR6QJuKOFw9bR601RjtrIya3AeFT
 EuiWgnwoXoCyt1Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0U+vRVJ5gMA9
 Nml629sMpMf3kT1zUe/A4GJg8W3drWJOLLDLR/i7KJu+aZiyoHi6cxGTvgwOBOCqQtBXfQiPIky
 +NFo0q4kIF4Sazm1ouofNpFudL3SFyt4qSrtka3nijDsUePXOMPKVnAQgLVpol9KI1gnMXDdo4w
 Kli+5SMtWLkZSPO6XHRaxN417SUWmrtkHwVCm+k66u5WYEgZIuZ8M4277ArXy8SOmiRGFQvEOXi
 p9DpCtfOaopl8yvINwcz983BX+jQ7Rki3PGYl5TtenxkwiqjtpBjG/k3i8omkYAbjp4FbhrGv+H
 MMl21mYez3h4ZqmOXr1RKYsHSTCz/O5Mt0r3D8HV8OFiQiUE799GxMMYq6TtdVAdheOssuwrh18
 0bx9i6tRuIque2PyfzOgoj9PKoNCiyiKK9wPdZOLtWFISJvediBZfRRkNoBu5g2OACqyE5gk4PM
 4yt+YTIsUU/geU094nQ==
X-Proofpoint-ORIG-GUID: 8rxjya9yRJyth8aYkpOYNVHP1hoU5e9g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6MAfJDy6kGm0
 5mmbRy+nkhg3YnM5yB1/X4ITC07I1tymey/bPkVv3VgWpzLIXpwJHLAMPOyVqQ5xZCm0FWojNpd
 KNTCwlwoncshFjVjRX08W50znzHE31g=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe4a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8rxjya9yRJyth8aYkpOYNVHP1hoU5e9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index d473a95bef92..9f4672277932 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3400,6 +3400,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
 	.gdscs = gcc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8450_match_table[] = {

-- 
2.54.0

