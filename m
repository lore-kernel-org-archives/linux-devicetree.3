Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B7647CA6E
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246515; cv=none; b=caSvyJvCGOR2r4RgkFG319ng25dd+elS4k/ODs5hFqUdZ9pnNtJGPLEiFu7UBp52BElR+HUxQWiHPxzVC0iV3cQJ4K9KkH6ZvFeAIoP9Jf/TRNKKvlIJftVwcPEQbOGV04nqMDzMknOkLRl608/4y/itrFGrRHYUaGcMj1XTaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246515; c=relaxed/simple;
	bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N01JkEmBBjQz2Ort172ccQojF2WtiJgeArpIkr24HHihiDJWHfkT3lQzCU45/JOb8P3pT23YRDR0s9Ahj9mTj3R+Wq7x2mwhTZYyWMzUiQajgHiu1WfErSQwyKyGtBbwGIoaCQs/yFvxgVasLuEG6WuUzWBHjxDFY7umyotIuYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEKdpoW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvZ3gRu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEKdpoW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvZ3gRu+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3koX2483994
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=; b=lEKdpoW9vCClAz2b
	B3Yz6DO0a/O/JO7iW1yhBnIQ/DDxcF4fiyEsfJz5z+mRSFOg5YAb+4I2eIizJf2k
	HfZIeKCuGrGbaQENAlO0bjWhIJK2Fas53eOIhSxQ7XmCTXJpYwVxXHwRC8OTMHNq
	lshxMQ7PlHjMrF9Rn5RIG/tM29wH9+sr2DIPWvtBhaGDCwQ4NbnelNXArrva1iZN
	fzV1Kr3zkH40Z1X02mYV2ilKj0EZJbcNzYTCylxdV5aV6aTLJv0UOWTA2Vl/QSo0
	DWHsZ96DgE4DxchhBcjWt/1CNhExajm+EVvbyneMIx3kpBoOnCnywhyqnYhRDHZO
	kR9bJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s904j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93903622880so139137585a.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246509; x=1790851309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=XvZ3gRu+BRy9a84HFgqAqoCjIDPuqZCOst1QSCxuB6pMDojBrRwaQ4j3Jlt23b+YE4
         1SqcVsXD7tt3v7ZzjvzYNRVGJVunmdrtuMOH9iZIYds25WO2l+O8kRUELmIomFgh9h0o
         9QAmijm/fL4yWLuVXa11b8aH/4/DMMg+10YaSYXTfJ7qQVVM2RM3+QfVVyultxswM9D1
         FOAtitzznu4Vx9mesIVMxpiveE8xcsvod2ZbYxmZ/qGXj65RAQtQI6wT9KPG29EeiOfy
         VGX/CQ9XGqy3b8fKl1YG6diHNQEEe4AvGqCVQY+qXInkSz+XBPI4vLzSaBBBnS85gvka
         Ni0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246509; x=1790851309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=xANBAVaZLLVm2WLe45Vv2+PhC5HseoFRLtDVlmwM5uCmpu8DiWoRd2f660mPqqLEyr
         pFESAECZWNUaeU3Wfmx4Zw7qBJzfI/dj/96mfe/OzzRoqy18+06gPieusAuH8CdAxi1c
         yMJQ+YwADyisrhDhYLQ9bCkmRlU6HHv2UcCTMv7lR1AgOGTJl4uTP+DRn5hFE7td9l/p
         RkcBrdjVKBJW497WWMOEYdL/Gh/8TcS+4psYWnIrOWt2dXtTSbAcZVQrVP7FkWroHwG2
         uinDE2nyZoYph8WpyTJ3SmApBf+VPcDL5iBtYVxfM5aqmVf9SCXAgNv8zPpAOWyIHT6S
         gPBQ==
X-Forwarded-Encrypted: i=1; AKwUvBydSM2t1A02oEv5tRUKT/EM/uzvGA0UikoUcjHmXdn0JABBFprO9K65hVIx4xbrdmjug7tum+tyaEXh@vger.kernel.org
X-Gm-Message-State: AFuF++kmZoQZyo+qnWh3xvPeBlau0gNI87Uxy2/CQ8tedxkKzaK8C6QO
	kW7hhi5j8HT1Ch7Bpsovmte1G/UJQ4t7boHP/Q1JmBdCgRIdaphUA4I1N2ZC4Qi+Cqk7bJ3a/KE
	XdYgN9bJ/9O2cNbGXWVrL5moNrH38o/KUvzGJHDSkARYz9CEIkhOgXxkfQ4ZXDPpK
X-Gm-Gg: AYBFou0652sO+WPZ0g5wvp9nDyX4DHHANfh5UNpqqsnSPXB/P9cCcPayUniVLe8EKh1
	Cwb8j0U3nOsCl1FfZzJNBiJyCN6xus1ftxnq41DqiROTj7wAVhWMB5EuVNtFSiTXxL2os7amz+U
	OuW5srGOfn5MJjARxIQgrQV8K0lQnlTpeqP/YG3b7eCmCKgnA0X425ClOBg/Qf038n0bxkwGiBH
	DARFxwJCEcWa5mJDGlsRl5Vk2RBDMlgtb5rkp6cMfmvQd9pyfTxtPPZMknqu4UUmmJJ/E7GHe5X
	Cipi64l+ftSciv7tguUfHCAZuJZiI6UEp/xg6Gs23hVD1D9hT0HOsLXM894UTnx7IKTf2wasC+L
	9TfXrZTSb
X-Received: by 2002:a05:620a:1724:b0:939:a9d4:7023 with SMTP id af79cd13be357-93c3665379fmr211749585a.10.1790246508904;
        Thu, 24 Sep 2026 03:41:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:939:a9d4:7023 with SMTP id af79cd13be357-93c3665379fmr211744485a.10.1790246508331;
        Thu, 24 Sep 2026 03:41:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:52 +0300
Subject: [PATCH v5 36/42] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-36-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP39F7GB+7c8svmghc71rS5Uda+C8iSb7wcby
 e/IIeQU4z+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/QAKCRAbX0TJAJUV
 VrcjD/0Y3Rk5vSg3xycnz8a6iJJCEZWCGxMEGk/RwIXgAtYDv9cS59ip/5zUBB/7Z6Rk4ep1cK8
 662UaUCwF48lNf9kNNra1Iwe/COHkekEGX336WRCY4HHC9Z7EekiS64v+TOc2NJFAQvdfN8ux2t
 97jzej2jsq4vURhfG/5h7nTtmzV7ialMG3Rgxc7G4xb+xGSeNTsyXZuRpaKdb7J7tFqJW1aVRUz
 pZHdCwviRIJe957hSAZGNpvs65LLLFiCxVytzSP0r23e45I7us9rEjW2DiLO7hAw4bA9Xk7II07
 fMD7HyJjOjuEWPPXyUzP11PxKssfOO+k7rMsKIiyV5VovzAH69TNw0r3DvsNc417WDVaU62TqMI
 mQAGYE++WJP2geA3DN/B0GIdCwnO3KbhLiB4isx4/HUiLIrREDAPTy4CiN8qudZF1vuraTOPo2/
 V9o5B60rXtO+9/fUANw7KLVi0t+a01bA5Rhf2sogiUMfZXt7A9jau8pKutlMrR9qYUwAtkux0dz
 bY4QzEpgPXbT/lswyRijn4yOs9BKw1GlK74mpPjV5I56OV4H+OQ8K3NZLKJwosCnlDqpeHAP7DC
 3vLwaNwrBzLO416OXpjk5KbYFk8OVbBrYWmsUDvGlLU08pXwN3CIBAUhA4Ce0jq+15JjcMgTs7P
 jU/YTGzHlNL4XdQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7nzAuJ+xResi
 pHwTn/r8HrNve/vpzRwHjLbPAjIC5VYbEaZE/frMpexMXGKioTR8t2fN73YpGo44HoCUL+X5nNB
 Qgpedpb6q5+m9OJAThEl/gZVGIVVh9PV3xiYRc6+67xxsqhYarlWWMEeBgWBdvVx7OMltJ6RBiF
 ajhSaTCd4xROBqa7Um14Q9E1QHwtijuWYJ5yM8FeFBaNGTWx8Ci0qGlSFUUGh1ScyFFY8L6OicO
 I5aRwBdsVESIBRlXVtIqjEtXy/wvm9lDGKKCHNR6ykFwmuhg6/5kEqkhnzpL8hnho0n0V2Au00A
 Kr/fTE6q9mgSK0vckxTsZtgibK+0HDbW8aATlM9nu+o5wTeHR7OEY2hUiVJCldbnzx6bnAGg0JC
 cRF9O6JafUy7JFkAzg+ALDQrH9+2gyq2yAl0SLJPnPbnUp5UJaOXIAoyeZxHdtGQGwHT3Crz8hj
 iBfgm72I7G1BI6AqJ3g==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab4fe6d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9NP3UxtlFvvT
 3YahUkm+DtIHU+FX+bGUmsMwpY9MYOtH3YGX6NJoSfEDJnx//FABntCLGOvUwe8oZJxjBV1yXaz
 uZe4GB3Pnwkr9wRaeL7ZAbh97SduS1s=
X-Proofpoint-ORIG-GUID: CdjtvsHFidGOnpH34zfKaU94YT4XRSil
X-Proofpoint-GUID: CdjtvsHFidGOnpH34zfKaU94YT4XRSil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8483a1bc56f4..a90e4f30d39a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -970,6 +970,7 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

