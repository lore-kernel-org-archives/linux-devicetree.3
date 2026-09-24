Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B5647532F
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246420; cv=none; b=J0JJMvwMOaOAlB0ze+2rhOh6Eq1ExlYGrM6Y7NVNWJnRxCrGxb6XHxfDUPOdZHpIWOowSMSZXps74VvUdLWFLYbBBwAJS0kHaDNBc6j48Fz5pmBLwmRDnWyIaGRgylSuTsdzWcLnuu2TscS5qYvSOJcbWVobBHXg9NvhOoSe4+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246420; c=relaxed/simple;
	bh=nMD6xMrn6lL5iJ8IxikWl8h53ZFdj13HahcbJwWFnFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBnrK+uAVm9nPX2m9IcK3/+FVQJty6dW7c7lOIvIZrEZIBOXOtEJqq2MjLo+e8/qDzz1kvxSFqIleqjYlB3lss4IkAqUjqkqj3pww1Y3CIO2bJVrByhLPoBmqs7eHOto7B9lDn6AP1BR+Do9kIS+FwieC07jLJ/onMaTumiC1kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIgTYuOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj9zxYC8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIgTYuOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gj9zxYC8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PLTb2919200
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=; b=VIgTYuOInlVmn0v5
	vWolzsXHUFJcM8DIsM3mHsWebas2M91suV5pqqp2d4wskUbqKjTKvzvWMHkI/6OY
	fJ/JHFIzAUtWVShfkg9lEDaycTDswi96RwBlXur/e1eTOO/Ji0e+xfXkVafG9l+g
	Cc9BcfNRnhTa0AI4xxFgWC6kaHJnYLq+4fyRiC+6VxuWwgfqqV9Cn5lJ8wcdL849
	JWt1A48I0pGjGA/HRmEzHhC8wuY8dJTpmMnGg1onovrN8N7frnqcr/RIMBEzTyWx
	Ia8m+kRh6ZBgGTQOLPysxTAoyj6RCnmg7jJzvzANy+28Ax0uTSvIfrQycV7bo5H3
	AOuT9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuj4a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so388326085a.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246412; x=1790851212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=;
        b=gj9zxYC8fToRU1Z9W5VKKve2npkJZP6jpkzTTUViUkbA59FmlyTfzL998/xROHc3zL
         Z6Ft8A8sm47LS0erPprnyw8zISVfOr5X7+5gt3xwqIkD25PJlM5hjfPztiNqsGBQpPJg
         7cD4sIcpje1aJxoAnzKlb0sx/49YDKDEg7bOS60YvsJv2SE1TFSXX6sXdnKhANdDP+fO
         qE/zLkgJb5Z93KwDlUAYYKDgIbd79U3KV71alixV0QCKj715rStFh1j5VAwE2KZM3hjt
         5uARLnFB7uWPFxvjziRlTYpVSlP1okmmGghvAaeCwma/qmlTp6KhpqGhV0jSJt3kxGuq
         3bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246412; x=1790851212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=;
        b=olsQQ+Usn1w9QMundYGECMXRhE2LW1+Aq6wDKV3zb8vaIRPyBmZrSQxQltj6vSqm0G
         queGSvWDsAWG7ez7zRpaerQfWhLpmBFw66VJaB7H2tlm36IXnMpPW2f5k6SxD1z35NIP
         iI9KzKxQDMopyqS1rLR/5PJK0OnZ2ceHMmUkIYYqQZoWFrVQWLxTzykNHDxzgldvqriQ
         OjokcRLpNPjOYJD8CQmsTTiD0NnEcpnUoGO3hFrlBamuKuYHjvp1fk+2hG2RrHdpZ/t5
         uhYC773WJ4ANookkcgKgjdNcX+Q1pgwCmOZ/yKWNfUNtXmMrnSBcsbyIzsev7oJIVdWm
         hXMg==
X-Forwarded-Encrypted: i=1; AKwUvBzspBDACpraNdAhY7lCa6Z+/XboFw96XYRq51+oamzB5fQJnfd9t7FmUqoyaOmWqn4a+Ni7hZLUToqj@vger.kernel.org
X-Gm-Message-State: AFuF++nlax8Z6yujil/6cy6z7Yixgn/xIxNvKRgJEjM/6QTwlLGsRrS0
	xe2hMIub+fhSN4aYsmjntwJt8WtRVWqxSiBOr2fytum7MI7PFQs+S8CA/zhEU6OSfxXAiR/Oxru
	UikCInRY/tH6lkU6531sj+uovbwgHg3YpZVD2HKL4xgGve2fHMfZ01gTpR3M9L15QY9c20azm
X-Gm-Gg: AYBFou2lsXmkOfrQoo8cW88YkSD+3C2iy8lHmcOL6kjKFOSSv/dj/ZM7VagxPxeHuTr
	2p/FZvaRubf2CSjl6JHK3x7Uz8ak01ByEAYBfmhr6N+zZW2HOq6CUg2tyTjAKC4aozd05bcpIQh
	+g7SzbFmJ4JszGp1kzHqA/gNGL1UPDZuep3s1bOTCgY8FbyRo0sBEjWZGpUIwZJvh2dzRoDLmSf
	p3ZRqJGELhAtQqTjqSw3pNWvvEDcrj/TfQRp1vsSKXgLMcvQ+GiVe+i29c9Pn2N6BJN61Xktlln
	x1FFFaUNxfgQGUAXxhK0zmAAWDI99LK/wVt3iDiyYf8qyS3YYSa+zZMk/4MWAJ954yxQMlvZcGb
	O3rTSKzAK
X-Received: by 2002:a05:620a:7003:b0:93a:1264:7f46 with SMTP id af79cd13be357-93c36442915mr235563385a.46.1790246411654;
        Thu, 24 Sep 2026 03:40:11 -0700 (PDT)
X-Received: by 2002:a05:620a:7003:b0:93a:1264:7f46 with SMTP id af79cd13be357-93c36442915mr235557585a.46.1790246411058;
        Thu, 24 Sep 2026 03:40:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:17 +0300
Subject: [PATCH v5 01/42] dt-bindings: clock: qcom: gcc-sdm845: Require CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-1-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=nMD6xMrn6lL5iJ8IxikWl8h53ZFdj13HahcbJwWFnFg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3b/+b7gJiKtrDdjdFve5kosHdjQ+34O3bxT
 AdYnfc3QSuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT92wAKCRAbX0TJAJUV
 Vq64D/0dSCCMNOo7QYQhn1N7bo1qPxyeX8nsejB0rbRoNBN3uo5tb+ma4SL7EhatXCvbMl4Jzs6
 BK48ttMnL1f8DnEwCJuZlQPofw+daMtRnR9GVIVo+6xlQ4Ya/kYTmq+8+Wzsrq/+CI/80h0ySRO
 N7hGyyM34lvh/QkMXGEEzxBH/v9IBKlzMz1Sj67aM6xl35NMYYYFfD6NezKgzw8h9GdCrHMA95J
 S5TBQ+JDGWtcfqwdvGqWuZBtfd+/vZWV1NaQuvymdBSIOsQ1IvARKpXvMVWzUMPoy+orBuImIeb
 oKo0+fesxKQ1HWoOi83SrMgGditQO1/RhAx1/SOcSxziwNfgONkurd86HhXmT6fv/SzbxpW6vri
 O1NEGW1IiELBKTinxKIiPWmupxopbpIOkljWRNdkTPiXHBMrPfCuNG6IRlprkT8Xkdqoyr8GKfD
 uLCCVCLtySpAkGOtQtVUMVuwTNCDT1RsHi7JsVH3ZZkB9RUpp1DNt26Zdyoah+qJ4pX8uTf6YXc
 a4bLi4/6/i8V9w56fdBAdED93DC6ZcWFqFfYTP48TdthJEYPnyF24JP257iNOTVikT4CB+FO2Te
 zCbLD7QGJNTj+lL+pMrkjMwG3EVXgpCuuJRP4C/a64uOYw1C07Q2VfatCYGRZFXTnnYoKJGAqWY
 f46ChGcOidCSW4g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXx61s77MCdY3W
 XJGH//PIz7bPoIuhC6uFiJpiqY5CTD/5aWlVKQMMbPa5lwnKLLagoXGbLW4qk3eVsghpl+wQyu2
 mBLI2rFaG+eTSG5J6zvnQiXq/i7VwdM=
X-Proofpoint-ORIG-GUID: CIFdBsu56FANOAhj3nUk0Zh6NbYJ9Mn9
X-Proofpoint-GUID: CIFdBsu56FANOAhj3nUk0Zh6NbYJ9Mn9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+roFNOEFXo2e
 7+WiPZ6dvvyX1Bnb9itvlcf/yr3C/ER2KFlAvZN1ciQYskLyXH9GXURpT77uiMsAKi6i7ujf25Z
 1egut6i4MfmmbRvTy/NdJzXBw4EG0XE/5Pu57hB0wUeXLEf+IhmhvO9oLwOZCrymLR+P6UwNzpQ
 fw8OqU4qXQ0z4+C3W3Y1dCqT0QBz78JVPtBcSe4Muxn7r5U31xeI9D81/1PrdOeYNEliKgEOWrd
 LDTN7izSAY974bPcSYi6t0Zb31V9dMgakPFqC2wt3AtBpaq+vGEtIJH4S0uouKcZmlON1R3Ah/u
 AawCFfpSIwJ/fkSaX5U6tTnuSmXvMqGsHV92fy21U6w8LIZYJZaWbPS/oJ5hsl8FzrrsYNpk3Z1
 2G0+FnNkycP0S3vfrZIRSwcwFdRWAtNyVwH6FBtmGw67M+DGgIKqhE8sVh3t5j+/0qNysc/mYqa
 wrRRLifTDmJdRj7kJgw==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4fe0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ic6PIZLzPb63q0Q4sZMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Require the CX power-domain dependency for SDM845 and SDM670 GCCs.

Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index a7523a414341..41767eb11651 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -31,11 +31,13 @@ properties:
     maxItems: 5
 
   power-domains:
-    maxItems: 1
+    items:
+      - description: CX power domain
 
 required:
   - compatible
   - '#power-domain-cells'
+  - power-domains
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -85,6 +87,7 @@ examples:
   # Example for GCC for SDM845:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sdm845";
       reg = <0x100000 0x1f0000>;
@@ -94,6 +97,7 @@ examples:
                <&pcie0_lane>,
                <&pcie1_lane>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk", "pcie_0_pipe_clk", "pcie_1_pipe_clk";
+      power-domains = <&rpmhpd SDM845_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

