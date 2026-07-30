Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F04449990
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434092; cv=none; b=aubClLMbNIprtXqFEWjeS2bYgoDHoaxv1MK26ACP/vV7HDIxyU9t7PgcUXZJyRf/jk2Wu5pbE8SedGfan9LxwfGlViWqCrVugfei2LfCrw+nVCWmc96KRs7aE9af2Fxa4AjDxPRqBxdfgq5fonrWz3CJYLLZrzuwp2EVZ4s9PmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434092; c=relaxed/simple;
	bh=3MohiFJRk7R/WUpguwJ0RoRbuy1k8TNuGFgJUfVj4ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NfG0qQfZGcwIJ4A0qG810ZJh0iHSQexVrSnPwFWqBlLqP8iQzrff0VKTrVEvCxT3IgVItVjlTPSu1+aZw3IqFNcdYAgRSndPuiAXv6znUg2XMjgk9Tc5x2zRFTJH9kTlwOq/NiQuh5Hom3x4u2oCuINcUMn4qIAIiRMoil9Vk0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2qMrdOj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQkz0Msf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2qMrdOj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQkz0Msf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UHfQfo1459166
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=; b=f2qMrdOjnZco1mVv
	BY2+zwXdMPjh8UCH3TqbRatdDXhsRx8mPFiPxW0mpuA/k+y309EhgDqtX64ZGX6i
	FkXjnPaJLe4GuYSRLe2X1DFYhWtmjfwBkSWGu34+Hx3QBsOkkIfsjijVPqHZDQHf
	mJaKl5q8vwk4HmrJiKDjY6TD7Jiz06y7KLNh2o29XJvTnguU0avGya/XpPlwePrP
	30idazc2wzKDiQewU0JTuYIZ+B2G/kHHh5gWveHYvxpes6zkCpMOrBnFqrKDKvP9
	ihDTZBNX4A4t4AbvkEipV4Glo5Sg/DbQPKHtYjepHA6pg5fuzHVV5x2zAg9UyyJQ
	mgPDnA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frb7wg213-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:54:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so58297a12.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434090; x=1786038890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=BQkz0MsfWAr3cM0Wx2gZL6n0TAYCcCcQ8KbRS4J+rpbeNcrU93LIFIa0SfGI7wnA+n
         aIsjAPahvhs+uEMT7nMvtPgXrsv/JFJA0uic3wi/nc6bA6tSewJoTzSCNqwicOSdEEgm
         kWZpxmztdkZpiGXeYHs18vzY252Ddvx75oZCmWUoJIsTce5SxJGU6Uu33A99prFPQrTr
         M9ejDhX23UtBUEwylUejcSRAmBiSDiPowfBb0aJV6HxcVWA2PDB7iFGZqhrFaYWI5Ds0
         0x/MA/nb0pQWTiM9lC1KXaX7xhotb5IbkCeV5iPSWed1sA58JWAymzpEpAVSa4L7kmua
         rKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434090; x=1786038890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=IXDt/4OJfqMxnwyoxJMUYDLmZm4Y0zJ1c34nP+FRtG6SxSq2DPhSuzDaGLUV8YssSg
         zQVnLFbHfTOVLhpnB4rJdiAO93I6t/wlVc8SZT9rgYWOIJr2pXpuX7o6LqQTkiQRHOG3
         wFc0B6TJP9rn2kvbFsDe1vLKTXxBucEs7oZFJaKFSuLp3Awmp4oUHqohzfzZFLUeUgra
         IcB884krnX2v4jQ2BWEsW3Sa/bqF+avyNOAilb5il8VWuqGn6sLA7ZIxMluusg8vTfKl
         uk6+CmtUMzwpQNchjPL8k+Vghm8yt7Mxnp6pOL52wIEAUhxKGv8cQzsQUHLB+0BH50JV
         23+w==
X-Forwarded-Encrypted: i=1; AHgh+Rq0xsRzcLQ+bVo7hX8zywzNFf/KxkyPYIlrhfBNPyAtVI5a+FPZzOLu6HAh8oXZ+3VwHL6J6WQftHfU@vger.kernel.org
X-Gm-Message-State: AOJu0YxCmHXxAlHvMrdok01M7mlR2xdyLTuby5/euy0Hffrqz04kfK6M
	WcQUewdVxw38bn6M6TUtEAY8g/GIRYyf8V8Y/D17/NvUY9v5keUhVIkcsZX/68LdZoyeC6g/ku0
	wExpjARe6Bj5e4/JsJMz3FCw7UBPawGrbZ/kAsGzGrn/uDjbBWDAdYDK1Ik+Rz5Ir
X-Gm-Gg: AR+sD135U0qhklQBk5fyln154ySYGoLTVX+JDCz0kEDSnQU2EjDevPbp1lC8jrN5NSO
	BXaVcn7YK4OgsG4cw+Tj24/WnMw6IL3DwUZu8EwOLuIdXXSb8ZobvjTOR1phmXELKxqdvGbH8P4
	jHEZS72wUBmIwSE0HiAqrVaIkQv6iekt5FiNRsOpy3ha4APmR66zcy4McmW+2krPvuenjZoDee7
	1ooBDsv7BxU8GRnIOKrEsKxBWrDzRbxFfYj9G0YEGL8fFwYHR/SX4u5LYAR6arUs54n5RNJqspN
	7YscVoNaR/Me61Zlcaa+fNlxKS4o7FxUeJqriJMeTF5/zPktXI+kG/o3Q5uwLOtQcmnSAQsAqpS
	SYykgVrWb7Dq2QlgWoc32qX86
X-Received: by 2002:a05:6a20:7f96:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c90067a725mr3688109637.11.1785434089876;
        Thu, 30 Jul 2026 10:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f96:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c90067a725mr3688086637.11.1785434089454;
        Thu, 30 Jul 2026 10:54:49 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm36444098c88.5.2026.07.30.10.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:54:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:24:34 +0530
Subject: [PATCH v4 1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock
 controller for Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-maili_initial_clock-v4-1-ed52ade264f0@oss.qualcomm.com>
References: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
In-Reply-To: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: ly3wPFDeZmjQtFlcOPkW7lCy_Ge4mxqQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX09vru9SYcfXE
 J4Jl2J5DppDk3ssTul91YDH7dJ1pDC21H5jsupNytRgKCB0nktNAfgZMsxJ8S1MmL/b8fLBykGo
 JEBTtMbEqBkcPW0O0beUMzxJLa6h3sw=
X-Proofpoint-ORIG-GUID: ly3wPFDeZmjQtFlcOPkW7lCy_Ge4mxqQ
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=6a6b8fea cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OozyDhJeiyY2DhU_uTUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX7esMW4Vfa51E
 vIRJHwb4lpwWromzzng3MFRx06/uIOTcOAT+/m7P7N0mv9n6nOX4bkwv1vmqZzNhqrNABNSMBxT
 GvS+rOrQazeVfymUBbzCnuL2Uf56hwoh8KQRbdRxk0CnpK2jHlYiNYPX06wTuA5EpTq0fjx6u3j
 mJMJn+xCc2yrsIPAOH+vFHYoy9k3AZN79QgX5UylEQbHzOMQyK5XQXQoDqJ0R7n6hWCbvydZfvq
 /Kwi/2T4kWSAkZHt+N8IXDu5qrZOJ7AqptSujmzpWpdDNjcODJ4SUgyUnMQLX/gImTb+lCGcN2P
 oKGjYuvrMfw9yojRFeFgxoY684tJ0rFglzUpytVAYaW+jDMtOUD8MC9+zcn+WosCBceC5JtsMAP
 GgcIR/kihBAahvUkZolAzZN3pSUsFXHMqZqXg44k5m6+L/v+41pcmXZQ2A+jPDC87d6YjKHVJ2p
 VR39EehVaEP3v2+pl7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300133

Document the RPMH clock controller for the Qualcomm Maili SoC.

Maili SoC is a derivative of the Hawi SoC and the rpmh clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi rpmhcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b33860429527246484560823074f52a9159d..2b446aca5207c9cc2922635b0539f2d2f926ea0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -16,36 +16,41 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-rpmh-clk
-      - qcom,glymur-rpmh-clk
-      - qcom,hawi-rpmh-clk
-      - qcom,kaanapali-rpmh-clk
-      - qcom,milos-rpmh-clk
-      - qcom,nord-rpmh-clk
-      - qcom,qcs615-rpmh-clk
-      - qcom,qdu1000-rpmh-clk
-      - qcom,sa8775p-rpmh-clk
-      - qcom,sar2130p-rpmh-clk
-      - qcom,sc7180-rpmh-clk
-      - qcom,sc7280-rpmh-clk
-      - qcom,sc8180x-rpmh-clk
-      - qcom,sc8280xp-rpmh-clk
-      - qcom,sdm670-rpmh-clk
-      - qcom,sdm845-rpmh-clk
-      - qcom,sdx55-rpmh-clk
-      - qcom,sdx65-rpmh-clk
-      - qcom,sdx75-rpmh-clk
-      - qcom,sm4450-rpmh-clk
-      - qcom,sm6350-rpmh-clk
-      - qcom,sm8150-rpmh-clk
-      - qcom,sm8250-rpmh-clk
-      - qcom,sm8350-rpmh-clk
-      - qcom,sm8450-rpmh-clk
-      - qcom,sm8550-rpmh-clk
-      - qcom,sm8650-rpmh-clk
-      - qcom,sm8750-rpmh-clk
-      - qcom,x1e80100-rpmh-clk
+    oneOf:
+      - enum:
+          - qcom,eliza-rpmh-clk
+          - qcom,glymur-rpmh-clk
+          - qcom,hawi-rpmh-clk
+          - qcom,kaanapali-rpmh-clk
+          - qcom,milos-rpmh-clk
+          - qcom,nord-rpmh-clk
+          - qcom,qcs615-rpmh-clk
+          - qcom,qdu1000-rpmh-clk
+          - qcom,sa8775p-rpmh-clk
+          - qcom,sar2130p-rpmh-clk
+          - qcom,sc7180-rpmh-clk
+          - qcom,sc7280-rpmh-clk
+          - qcom,sc8180x-rpmh-clk
+          - qcom,sc8280xp-rpmh-clk
+          - qcom,sdm670-rpmh-clk
+          - qcom,sdm845-rpmh-clk
+          - qcom,sdx55-rpmh-clk
+          - qcom,sdx65-rpmh-clk
+          - qcom,sdx75-rpmh-clk
+          - qcom,sm4450-rpmh-clk
+          - qcom,sm6350-rpmh-clk
+          - qcom,sm8150-rpmh-clk
+          - qcom,sm8250-rpmh-clk
+          - qcom,sm8350-rpmh-clk
+          - qcom,sm8450-rpmh-clk
+          - qcom,sm8550-rpmh-clk
+          - qcom,sm8650-rpmh-clk
+          - qcom,sm8750-rpmh-clk
+          - qcom,x1e80100-rpmh-clk
+      - items:
+          - enum:
+              - qcom,maili-rpmh-clk
+          - const: qcom,hawi-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1

