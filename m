Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72A376494
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504138; cv=none; b=m+ouz3s+B6oLncscXizRyuyvnE77k0LrzmKt3qfGCNkjoXcR5JiJNtVJLvdJNRqMkcpeMmx3GwFLkjAA9fI/qeMPH4efn6NLqRmQHCYaomvEVT3xphGiLoJJ32aF7t5X4fWGIWgTw6Im9LKU/ufHYzHfVNv1oaiDiQBC+6MkceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504138; c=relaxed/simple;
	bh=DUCkIYN7PQkTM1Z9PLNYL/td1wrOWsEdF8BGqnRG1II=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHlcrGiA8WAQZTSJK/pwBgEAJhoyfx0wuHkjnHE8BSPA9KtWRDYw2Z75LxrwVXeE5tY4yS24q9EclM9CDOHr9y6RwHLFujkKqm06BXMC78EAlXdURnCl8TjMh3yLyaTUx/CsI8QEuPPqUKhCGbK8M+jSVN1J89OC+BVXC1u7Cr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xmr/u2CV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ajf60TrZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xmr/u2CV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ajf60TrZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66888onH2204069
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 09:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NfrOlsB1y8lyJQu9e9mmNVo0JQXdK5wllEvg99o1ksg=; b=Xmr/u2CV7AYMxoIO
	NcpABX5ooZNdazgBQQgNK7M7obN3e7QUPg45MfKpiczO3QKeRrVvsji04B0RJc3g
	aaZSQzoKIiJFT0uaFbsRNUSn5sbgCmj+qxCbEThpUeurFltPLJzNj8gW0G74XOrO
	Sub8Me9gtv3WQY01yyI5uuKOIgPmI4b/439iL7hJUO6/2Kz9ObX2yoWowABmVKiP
	hcODWJRUBsWHKCGNbUqyoHs0Tx8w5rWGJQ29LKMmgDn+o2Q8jeMcj09hm8x/9jFl
	WtI2VHgDImivocqr330lcRVpWpZoAD5FY1KaXlJShcvmP+lW6fTfpnZIrSGKq77B
	RQDZtQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv0pxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:48:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso9822051cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504136; x=1784108936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfrOlsB1y8lyJQu9e9mmNVo0JQXdK5wllEvg99o1ksg=;
        b=Ajf60TrZD2Hxn0Mz75+QDLODyOVIOChlaTO1WkIRFewhHLuWjuMxGs/e+gR3siAaxK
         Nr7pE35LxzZFN6OzyCNj5T0ATfwiOBn6JFA3/Tm0jA7ga2mK86m+Rc9boCoeg7YYiwG6
         jxNuaJWwDheDDrLICXie3Yxy8KM+P9jPDtOK8rZ0W/lvtbYCxsAFDemljKu2OW8PhWSb
         M2vEVrA4vUIjbJuNfGS76Q8Wj0rRJ3v7J9uxHEOAGr/erpVmtknSLw9uBxRzKZT82Blf
         bzjuOo40XzAd5yGWklVUOxSJZ6ksvSJzO5j7wWFVStn0mmgo9IFe+zjSim6D1egbxv4v
         S+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504136; x=1784108936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfrOlsB1y8lyJQu9e9mmNVo0JQXdK5wllEvg99o1ksg=;
        b=o1WOL81PPtUS2tCUpPFoTA5O+IJZ7QH5hF/hWiSIeuUXReSRa/ZbES5g2ehTVGWnqZ
         K70B1tklRE+v3DWxEOgbEHVFOWM7BU+Xk6rFqFB4NsVBqaOhQf/Q+CefxsfDcrWpBrc1
         fnzt00NNcDHrcTSgDWv1pqglF7pG0Mrxc61T6Y7QJuIjjO84EZ4x4uEhq3YXt5m/VA+z
         EkRjgXRw9i/epKV8kVCJtXtn0dlGufyUgoL3OBoJF8x9CkXKrh3A8VQgw1Hmpo7elL1v
         Zjn/hD2MrEDUt+jzrFxpAk6UZ5wtI5FqxCMHLECm49lgdXZuqJTcqHFi6VRutYx5ol+7
         w3yw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8R9TrmLIFQF3wgKE58nN9tRDagRWvrOB4bWjFjUjWfHnEQ1XCuSMkEmRxfiZPb+oobxuJ1vEhY/0y@vger.kernel.org
X-Gm-Message-State: AOJu0YwrtBZJAYLdNsIzi8bP8l4TzNDvEliSthPSxRF438vJASaZ2ks6
	mrAq5guQHtSCFJPicZPsIZDO26qrujS5suxO65YLgyJHXWYG3XnyuAwomyR4YFyAKc5q3RjJkSh
	z3WD8OHEWkY6o1kA5WUUocOY1nIHwR3v3GRnYs7pd1HrdaNvZyWiJDJjOVhUG2ZzT
X-Gm-Gg: AfdE7cnb3wsdPII7WLK/cEo5ZRDSdpi+unI0mWeGpxIU4FGqb8+hDccqVMlktiViHjV
	aemzfU/0KYU+4bHx2foH9gWuVNymAo9LoZi9zjB5RTtMqmIN89ntM9x2FMoe6+s61MQVc5ThpBF
	qBVPwOX9POkkzmHDfKYHClfMGLeLoVuBT/1+gWBaqth/Lkk1JwnNpdLql4XeWkbanFb6tJvtT3T
	s9zO2sPb9FkrUs0laOgKmFrGl/TbLiBJ7zdXzx785WHHme4PnjtjvV904MDhkdbxBQkRsOtxYPq
	ldxhaJDxterqO3hbHH0M3n2fAQ2dx4lBI5IWdvLPgHtUGcu9T49E6u0JBMWW3Y1YqiW73haUkYL
	2l4ATGEkXb3TF6kLi+6N+bcX6PLZ2mvG1ETc=
X-Received: by 2002:ac8:7d8b:0:b0:51c:7b12:5fd7 with SMTP id d75a77b69052e-51c8b438724mr17568181cf.83.1783504135633;
        Wed, 08 Jul 2026 02:48:55 -0700 (PDT)
X-Received: by 2002:ac8:7d8b:0:b0:51c:7b12:5fd7 with SMTP id d75a77b69052e-51c8b438724mr17567941cf.83.1783504135213;
        Wed, 08 Jul 2026 02:48:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:48:40 +0200
Subject: [PATCH 2/3] dt-bindings: clock: qcom,sm8450-camcc: Require
 required-opps on SM8750
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-2-ae0871774210@oss.qualcomm.com>
References: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
In-Reply-To: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUCkIYN7PQkTM1Z9PLNYL/td1wrOWsEdF8BGqnRG1II=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz84lfe5YIROdN1BkCabPVaylWxdjZk8huJk
 GAQiw4ed7OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c/AAKCRDBN2bmhouD
 10LqD/9EmH31v0Aydhx1ojz+rGogtFufmKVPX/qiw0CFJ55LtN32yqnEPTdkMLzMWby6WXtuof4
 6ANqHckjMiE5xQVQEG3KjhBWSLGhkyle821xM+L4GhLZux1g53gs5lxNntEEy3WN052nifX+MDJ
 +A/AbvEr89rsUyrp2A/v0UMzcZdLGC8z6PFgkPhDnCKzwixPl+aBeqenIbGWo5iq6/9QcjDbeP1
 UUL+w7VBd7SUMpyu50Q2Kix/DxSZk8NfgHZ+iGQuh+sC3ojzwG4N4ymMi7rhx3Bqpq99bwx/wBc
 S1LObrsa5TxLxHjNluGIVRjEyR463uQyRFSgbr/JPpL3Q/QI8SrGMVCnSnsv7eppkCWrxzlGQWh
 oJd5EK5wQ0kr6FqdwzSfq1WodACqhqiFnZQY6FRpg9D5L0J8xMfFh8TJIMQeegS0OPKDKuORXcC
 KTxX836gN3R/t8t9vAUl2ONdiBlSQY6ML5Fa9jqSpZuW9Zews2dl/9COaDFAIZAmepxdPqWyD+5
 iVZU9qFmBLbdOprBOk9nDxYb7MW69RFe0/y/CAnLy9WZ6EZ5c9v0/kY7iq5y9YBqmIeVNfbmJo0
 D3DHQSlAojj8USu89YqOfeFzb3qhhtbqmFoemr9mOsRDmElHIbT4Tj/vQ4F6Z72T52BaaLLI0Bp
 WjOGkvm0Z2rZHyw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e1d08 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-4LXpn4-ZKuGKnfTux4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX8CJIkZJxFwtR
 pEyvYRdhc1WIH0X7HSVdrg6WrhcEmEHwSWAia00JYwH6ei78X79xSBlnqZml8HefFVz/qHecoDx
 VAOLvK6cTpcHLzm7XFjZtqU07A7TGh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX7eylwZOebRnv
 PYEIRpOQq2OW0kViqrppdCItq7LYdOe54rmewkDiXr4ynJvlrgsDrPxofHvHiAme84uaYpXiBKe
 RkEyueVE//EwimBXbFbf5nAutpHh9lBTiLUYpDD6CnxkA3eqstIMFBFO+7fpZBGY2ShmlAofh7R
 Oo2KFbjm1BGjica5GAFEmKmWKoyYoUTZXJPOT5OwBrCxxzckHcNi/UrtFJ9gpTWlg01pT+ioQIh
 wx4QRoFf/3SmmBDBpRwm9TL7KjyYroLP4qj28NsC/bmsQsVGa3K9CNQrc+S0I1tMCR+m+wK6I/+
 N3JW9gWthmq99dCb2PvpN9CyXpH4gq1iH/ddhNAyX24qxk3U7UtlvtBZo5UOsnV4PwpsglJc6nb
 FeUWGQrJjQCGsMxci27y8pBIdfAo/LhBhbR+So7R6Scs4Yz2bomeU5izyQi6qvABVYkPtzFiVmJ
 PznkCSXlqrjyURorzPA==
X-Proofpoint-ORIG-GUID: gpczYLeosxIRPvNjSKjYN1AanD_65fre
X-Proofpoint-GUID: gpczYLeosxIRPvNjSKjYN1AanD_65fre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080094

Reverse the logic within "if:then:" when expecting "required-opps"
property to have negative list of only variants which do not require
these.  CAMCC on SM8650 does not need "required-opps" as explained in
the commit db30c1160ca5 ("dt-bindings: clock: qcom: Drop required-opps
in required on SM8650 camcc").  Requirement on CAMCC on SM8475 is not
known.

Reverting the logic in "if:" part has two impacts:

1. Adds requirement of "required-opps" on CAMCC on SM8750 to match
   hardware expectation, because it needs minimum voltage levels of MMCX
   rail (already expressed in DTS).

2. Reduces the chances of forgetting to update constraints when adding
   new compatibles (like for SM8750).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e6ffacc81d0a..b41247b257b1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -70,12 +70,11 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            enum:
-              - qcom,kaanapali-cambistmclkcc
-              - qcom,kaanapali-camcc
-              - qcom,sm8450-camcc
-              - qcom,sm8550-camcc
+          not:
+            contains:
+              enum:
+                - qcom,sm8475-camcc
+                - qcom,sm8650-camcc
     then:
       required:
         - required-opps

-- 
2.53.0

