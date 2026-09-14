Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A4F4908D0
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390206; cv=none; b=ePMoBICj1SuZPs2EJzhcBaferskg45CD6OY98uSTY6gT1XMMr9EwcfWGDqCidQ+G3bpjnprHkV+mtEUr42YZe+55E2HasT9TqsMds+qMc8uy9WyM7sj9UZmjw4j5NweoDKRHuBfhc5KLKZCkxRaeME3aH7cmgKKreHoPSWFSEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390206; c=relaxed/simple;
	bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WeOAutIuAPqDDpQX940K+OeZHbOzhJ/vRFUwwK7JQKc/sMISaF/zXkJXGia+f4XrWoisuoG8XeZvs1lXtP6rjYpc8TLhuecDOCtZLbhm5PitDwb0KLfDwE8TqTuqCowzQeV+zGAiwKz6d0pVN/WQLmeJ3HzhVZOw4sGLQmAnzLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0Ocopqi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1+qBJnq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0Ocopqi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1+qBJnq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm2Z4901934
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=; b=o0OcopqinWuPjMCu
	PSIDgVyD2b7/zp7XO3eRDHHtmAqGk7yZlJP+YgLwPBUVGCFXKk+aVYobqdYcOrHx
	Tqkq8mq9lDS/3JpUowWpxkBd9X5uWnKuLUuH7triqusXwd6q1J8saecHeoFT+c3r
	rGZk1l1vXp430mA5uoSUkt1oEEiIiwrICz3aWA+v8N1fcI3qogooz1cG6hCq7JHB
	nq8M25BG3ZoiLG4VRJuU0ZbTSHCwVwqUFRboFZVfx5Of+5Tpsvd9v7G45ch1wv+R
	DeSCugRq4Yee/2YD14ADXeELQ9E65iF0LISlDkoiKkKtrA2/vKaNkF0Wdc3lD/xe
	hdfFfw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrwes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79630cb8723so183050137.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390202; x=1789995002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=I1+qBJnqWDyROPv19OfVzunUjW8XCBLKPhzOcOFKNJTbUABf6pynIEf8OgiUNlKODD
         CtSobUXgNiTUC714fJPIyui0iKX1TZj9Ws5FpLi+r+CUNOKw9yzUUIW+gzmogcAg8LP7
         gUGvxYBOsnfgEpeIsCzJN618+A01hKy2BOSjJcoetlhjcBcdxoKdMcXbk3MLY6/6Paol
         B/voeSAyiInZBpHS2HrA14FuWgS4Z2w6ITU4fhz/k5q0ZD/79CDttWsDjM0GZ6blOpg4
         xghjoM+AAiCFHODbq/OGEIgfAemL6lOBKYr401I4JruUf1w6ktOtVZxtTRXgm3S+QWtY
         RKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390202; x=1789995002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=niXxPRFsrKMD/iwMqkU9IyKS4MqJFfaiS/zcI9mZr0lhmu+/cxuYSPL18elxPInPRC
         QGpoV1ko/3sEjWg1TJHk2caO+dX8vp6JC9M3YcUhBNQ0lAmKlGDa1kRDQW4velKbag57
         Uz7EeKJB8K+A4YKHcW6AyWsquBpeh3GmTZEAb6NpJNan5WRbVmpVg0eqH1FzsZ7L+H4I
         grVJxY+Y25UHTP9TQu+6C11/4TMqNaSR6ZyMUuGLcd1aBOvzAK+pfUPFATNaC+aOPOnO
         F7Hyj+XUmX9SqVmmOQZKWQVLmx3yBWMtQOxnOJcoTFcVd8pc4yIHq4SurLPazoYVcl9w
         pR6g==
X-Forwarded-Encrypted: i=1; AKwUvBx8Zsnts8gLVQDpUNOFjB1rqnpgD+5lmIpNMttb2I6WQOiOlYTLIqk2exUw+eUG6rB6wf1BRNdCrDU3@vger.kernel.org
X-Gm-Message-State: AFuF++mZIs2afKWRRGdq040VfkuXI4fakM/zkNHJrWNwrJnx0oa/KAgp
	BTMUlPxJsuCoj/VpggyVKMXt5brsd1asnZ13I8dpcZYsgS2hX7Ce/bs9zKT0A8TMvMqe0A5oTV+
	zCkj8GwZcH3jcjAVPho5rKopWodilcwJ2223FbqE5UcbBzDf1Bw2yw9rwNkdPEm0klCE3+3Ti
X-Gm-Gg: AYBFou1AsGF0iIZzLlpscBM4mTOBuXkkC8TWK2UhLytsZ92uKkEM/lx5BFJeIB6OHIv
	z3CRKC1ZG1wJhz0X/iiPFj/goNW3We0vCgNJEwxAYDpfqKE/z3sAkEEU214nej7u+762wiDWo/x
	TButW/8zkJgySJ1ekn654qmcB5eGnMvmGRetwfFPqLfe+RB4a2f4a8u/FHSluSjEoOuU3V+5F5M
	Ocs5HwJZHSEUAAX+ahYnpyCHwwshZwp/7XgeZtQ4TB9COrY+wL7eltHEKFzB6QNBfTbZSQFWASQ
	c2aOEOgZg1EPZ900jUUlFEaDFN8e6p2wTeYVWJS0JdzVb/nZ7ORVYM0mDyoVCmcM+gwhHeYjZdu
	3X/WgOHPr
X-Received: by 2002:a05:6102:511f:b0:785:d308:cc0a with SMTP id ada2fe7eead31-79b5b2909fbmr1191177137.9.1789390202057;
        Mon, 14 Sep 2026 05:50:02 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:785:d308:cc0a with SMTP id ada2fe7eead31-79b5b2909fbmr1191142137.9.1789390201576;
        Mon, 14 Sep 2026 05:50:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:44 +0300
Subject: [PATCH v4 45/52] arm64: dts: qcom: sm8150: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-45-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z3elpHIph3aGwtkFU2GPTI5uNMv30x5e8kO
 tcNu6SoVHSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs9wAKCRAbX0TJAJUV
 VsekD/0RYUseKEoxSiROvcS17R6+RML8qwyeFu/EBlf+XFSbnb5a2MBYUoM0jcufqy8ISBnSZjf
 ObcwCz7F2BGq7NzmbJicvfNMI6dC0dCgncYoXuSe75ZOqxGv1H5hhKVNrveHet1IryTD3PsxuNa
 eBsGIX8WmZmxoXKIgvtzDAmUHPazCGN5j1qMyXINXzLH0/6SOAYp4DNQyM56Y+bKmBzLoFd8WC7
 26h6ilRJ994+GZ3Iw1q0HT2DHLZGp3c//9Mwwvc5OK5akMgIx0S+bTySTK7Hj9Fxkkit6/UXS5/
 IC4gY1LDqrGMhJ3i1jAue4TQjk2k0eByXsKo7Qk9X8oX5/AQyeq9Wv+bTPR/vdowrbkR8E0gH09
 M9V44gq1r8UwhiHNmvqzxjF7LfCeCJCcM9Uj3wtdwEze3VVr64ATmJO0fRzk3vs86gGsK6vAN93
 XmIJBPc2p+NFbJSDr9UxlJ1OfOfaPKWOXaYQ8LghyKbWCCLBQJ0DNv+D/PZfT2tDsla7wHFaJIu
 9REmeHQhHsFBROV1vNsqeQj475p0H4iY5lZkIlYLp4y032fIR8KNukhTdxe9dJ+p/2GaZJCtcOT
 f0vzXv3Z9v8qwyrbv1w7Ei/OdoABWY6sWQAfErNNDDgP2gw9AFq8ojV5+B7vSJllQMKg+8ALS9S
 CCz0BRW4imGoi5Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: WSZSFKguzvWfecx_-tejd_bjFtulMFh1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2qp3viIMJVk/
 8W2aU7P7bMcNOf3VL00ETcaetj3KANTLZe6dRZ1aqKk/vKpYdDJOmit0Ssj6/iblRwUf/ScA5C0
 izLWQzXAuDWoDCUIIhWcB/T3Yl3hcsM=
X-Proofpoint-GUID: WSZSFKguzvWfecx_-tejd_bjFtulMFh1
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7ed7a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXz14jcxwqY8rQ
 m+1ZxBT3HHpddDH0y+4402swx9PYmWCzvUfbbR/3aTZyzzgEubhddVEb/WPpUlEhEXKQuo2nzH5
 lnG7aWYULVacAMkREeAZQG0XFTNI2N62/WcRxvGxW7uySq+KovMBHVQfoe8gJgCs9t/QW7s9EVD
 RPdwflpLiYzjB7dUp4gZOnRXYMYsqhLDnq+VBHtq17klYPymYEh50ToMGwh9o5I2LqAX0fDiTQU
 FjxLUL/PTH7F5zTL2QE5Vvc2KW+njA2YhHWrmpCES2cjeTo3c8pWWN/DV4g0vmU2t3NOaWV4jGf
 zm3UFN5PPhogdcjo5oDtm+6/kn6ryUghjkar0uzzJyXt7ho+oT4xkjVzc3Aoxi/gvppsEPZesv3
 252OLmiCPhL/JCiUz6PH1I3nFyfGAtHKA8Rjt3rRVshscb/YBbZtxuC2ju4gm4TMIUVaiEVAxB6
 yd5ajHZ+6x1V3nASTBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on SM8150 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..397c0142ea57 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
 				      "sleep_clk";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd SM8150_CX>;
 		};
 
 		gpi_dma0: dma-controller@800000 {

-- 
2.54.0

