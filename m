Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBD14119F4
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572494; cv=none; b=sMStipjc1zA3tUWBx0z8xf2ag3tLcd45YCma/1yXGToUmBWsdTJ55/s4w8htyD11ULE8pFQ68W7WfG1+fVNfADwTbbEqu8Gdkx/KfqbHWZ/vwGD56oUDKLD32KZHRyJ88FA25uZb8NqNZ1mbtPSaAtensYG8dHd9VBMhJ5pNX5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572494; c=relaxed/simple;
	bh=DsmFBQ0mXMrsEdnqxRR3Hv31cdI8ww91ZStrak/wLCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knrm5sbp1ROVOv8kUMf7zhd1df0PZ08yzZDAytz6QrlsR1sbXYMNkAR6nqDvkNaWGDDb/XPzmy8+YoJbekwrOaxMLdbe9l8hDnYIKWzqwcSnu4rSEKGAZ5UTKmG0KS/r4qtl8CHQbck3Ce8mfJ2EYBova3eDb3lnRZ0Kwl9H0e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkpftLJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9Emnez7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkpftLJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9Emnez7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMdnm3194971
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pp1ES94Pbkso/WEKH/hoMsnztfMtPMYAgUha5rk30A0=; b=NkpftLJ/ZguaRGgB
	4z4a/ZROXdEF9PyldET8VGZwR8I8on37F6XjKuFPRsYJ5GosoEZgcnc4/wfInVKG
	7A3OmZQig+tkewMh+QTLyjodb/xdEEdGYPoXlvR6vCOjxAQ06LkofU3reLGyJN0m
	Ej7fdiW59YXqZE245iS3l2uxGK/dB21PoM29/uAC3qFCWhgyZXCSL2+pdt0MRFuf
	im53WrZIoNdCe76darrJih+KsaWFNVBBfjHWs6O/hhx6susN7gdIkuk3jib8cWbC
	SA3/AyFPLukScHF+3cQHlSUG2qCedpEbjpVX79P8AxO7oCfieO5Xf3z7lZ/KBIgV
	ByN1vA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs2r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:54:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso29865586d6.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572490; x=1788177290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pp1ES94Pbkso/WEKH/hoMsnztfMtPMYAgUha5rk30A0=;
        b=V9Emnez7mx+4OX0mzhBQo5UBYLTSFpWA7ES9A6C5zUbVFm0aDbbNTtz6IGk96+uefD
         EfRTDdv/JctuNWevLA2gxUjfmvnRYq/KbFsUMIOVWDvpaYpDpz0cnm0WZt1AwBstHjAa
         +K3qP5OCl5LIY2ZXF+1XndbwGWQBQdNNpQiD9cDnp7w1FVmEmmYBNtTdpaScvX4vhaR8
         0ulYHaIgPCeXo2Iwsqe1AceiKhY3IU0okXoY8stByuagBF+b/5uCSmEL0DFcE+3jv0pn
         t+ei8lYf72op2ybg6kNU4UjHWfRHjJhNuomoQC5qXaKtLIdIVFN0qQLVx2XMbQe0RXEC
         3fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572490; x=1788177290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pp1ES94Pbkso/WEKH/hoMsnztfMtPMYAgUha5rk30A0=;
        b=K2r/uJhI5uuZDER4mipV7DDjeTHQiZfiWacwyI4AFzGc5Huylf0N00m4pjs7RVRaBm
         rb3PlrxYNNYtuRXt7sNOJWsLpOcOJp63UdYc4LYL6ZxHd144OSPA/ioEPcXhXOj7ClZN
         /Q6rj9pj5NaBcVKy/yv/SwskR5mSUE18Z4qQurVlFTIxClSVMAdf2smFVsZkQSgraVEg
         1jehOtZlUVHCBPn8zvqhs5UAi0Dp8Tcw0sVG4DwlqF8wpv234xCjdqOig8WusQezlvgJ
         3zRo+B8jOYeGLhUUyQM18QbeP1P7zugSTPJvByOX8O7QopwQ/Ll+EsP0Wcln/2zw5p+W
         7txw==
X-Forwarded-Encrypted: i=1; AHgh+RpnxW97mMZgMV2dYR5ClJ+KBj8Tfh/Rdr4PQxvL7J7ztOMVfCwDo4os97xQTyBCFkGoOI/UIzOKrfgz@vger.kernel.org
X-Gm-Message-State: AFuF++nB3STsUSbpoxn9v4FwzCzyQQWUeK+hVUQce9CNF9zIJ1mm3XlO
	zQCa5oCUWrwckLXezCJH7ZObxNjcOCietQBeHLSJAAWtOYuiNCAS0HFMepwMWW7FBjY/u/4vNWS
	IoasZfohOt+bnntyLT3J3CfkH2Um49yydX8fmcB1RevHJuPlHrAG6k0nxkFQQNYaW
X-Gm-Gg: AR+sD13TNX4UvgA1wZFEKGJ5udwtlnPtpPnPvfXxrHbsr0op0f68BFrs9BJgF8UWnjv
	4tPuX61NG4x7PT9Dv/1o5AWRIb6FJ5gIGQ23CjhZStkXEiLvubpO9/+0gm8BZR0gnKTTIc9HprP
	MUU/DC2KX5i7D021wOtyK9CoYweRLNiSvkVi6/uZGBfNOZ0+60dAirzz/3beILUhBQ7f/tGc6UQ
	sC/HepBI4xi56N6rly5c0sRO4ZPQcfbIDD6NE71XDesD+K/Ym5uyinvt4Q7h2KwsMlohZJNcG0I
	mWmVpUSlxff1z3H2GAexO2I3ab6hvoZpsQ3c7owRmOc09qmSMK98IQ/54gFrAwlWVcoazeMDbof
	CuVJf7PWc
X-Received: by 2002:a05:6214:4105:b0:8f0:4e44:79e0 with SMTP id 6a1803df08f44-90c80ca4db4mr251378016d6.1.1787572490285;
        Mon, 24 Aug 2026 04:54:50 -0700 (PDT)
X-Received: by 2002:a05:6214:4105:b0:8f0:4e44:79e0 with SMTP id 6a1803df08f44-90c80ca4db4mr251377036d6.1.1787572489792;
        Mon, 24 Aug 2026 04:54:49 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:54:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:48 +0300
Subject: [PATCH v3 01/47] dt-bindings: clock: qcom: gcc-sdm845: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-1-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=DsmFBQ0mXMrsEdnqxRR3Hv31cdI8ww91ZStrak/wLCU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDWH4iTC+PrXufhuE7Sqg3ZJ4LfiQVKF7eBZ
 hcIrVxSPrKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww1gAKCRAbX0TJAJUV
 VvifD/96vOHB9XDrG77iCrQvHxW1GwzD9Iy1jz5JETcf/7C044NkDHINOXmmodZbVz6UBM+vP24
 YSClJWUvplLEErnHCitNfK6Hb0fCfJLqo7NvfuJgIgrwB4JYotbOIW9jsPOx/E6IEiCJssb9kMF
 Ev6N4dd5nd27AcoyszENZNJ5J3/+Ek5NZlV7tYWs3A/6dNDWibTS4z8rbTk4c1L4aLwSg+99/jt
 FJLN1y/lcBARWdkvguH7EAVgD2hplNzqI8TD+vNjfzOTjmgxUgbG7siuQPtCubvgjEH+3I8GvQ2
 V1qzxsjYsc7JlTwgPmoRtWKRqKUhIx98/T2whDfS0U9T9OYajHaSBtNQrhcwupfJdBJCCEmPq59
 8WXvVyGvD9MvG5N4ct6a55w0TTjOOIQJViaD+ZU/B2ZV67kGVxq+OoJeYn3qYIKoBuqO500ZQeI
 Zd3WqeUB/o76D+hp2KjiJdevo3x1pMVnawIhGRmfPMf1GmGJ1EP9OAxMjqnlvg+bVl8b9xbvaTn
 r3SoigaSLKtPEFrMlEth7Nf9WjsJZm5gti3NRob/Cbz0Od6UsoWkN1sd56ignibZ9sHUYrZfCtZ
 U/D9YBZ+CWOGBxFQfInnT2yh0le80iQRgx47pFf/y81LBoIJNj1SiaEf1CemVXjoUHk988vGu6n
 LrTs2CHahV+2Arg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX0U5jz+qtFCkb
 UKWgZhaJznNDBIC9uar/fe8aUBX/2xfaaVyshw59rkt6PNoYwosV93RFulUgkVEhnGOsEekfzTs
 rP9TbEE4pQago7pVhxEPGdvE5qfoIpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX13UOo4Gtemsj
 r84BVbkzMelaeRr1saJExHWpP0euM2pvj06kqTRNKj5EQvI3f6togA45qBj3a5DKPQyuo9gTclZ
 XRCRie2ySqtjWhbTyetpUtlpGZ1buF5nddUFW5gizkQuMHI/CGiGd+WcEzp0ejMCjcrBDIZ74Zx
 q/tPjyNMe86dnhWus5eEIf+M0j68qvYxeb0YMgKp9mYlPC9RAnhMdYks5BHJepk4tSo0jyAPVAh
 J8CcW9zYFhmRU6wy8w5T7lNJaKwAviPJV5V7Cby3c9Y6FEUgz3kcwHXvrzfqpypJ/23ZCoExIvw
 KYsmiPb/rFiMD7tvIbnka1/fffWFaSH0/9a+/G0QlINwRQQyKeL6+H7QcxnIprnL7pb22R6+D80
 F7wJPV/LJWokHNpWNadIUYmp5vbY+YsE/pnXtCOK0aM4dWMNkp+Ag+LSJMdR04mCIHse7vD90DB
 VTTSFMJ9HzMzGcHgS0g==
X-Proofpoint-ORIG-GUID: 0TkpP85TlfH2uMFlSgq6QgFH_8OUnvi2
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c310b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CHUg4piiY6QsafxEa0EA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 0TkpP85TlfH2uMFlSgq6QgFH_8OUnvi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Describe the CX power-domain dependency for SDM845 and SDM670 GCCs, and
require it for both compatibles.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index a7523a414341..980edcd244a2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -31,6 +31,8 @@ properties:
     maxItems: 5
 
   power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
     maxItems: 1
 
 required:
@@ -56,6 +58,8 @@ allOf:
             - const: bi_tcxo
             - const: bi_tcxo_ao
             - const: sleep_clk
+      required:
+        - power-domains
 
   - if:
       properties:
@@ -78,6 +82,8 @@ allOf:
             - const: sleep_clk
             - const: pcie_0_pipe_clk
             - const: pcie_1_pipe_clk
+      required:
+        - power-domains
 
 unevaluatedProperties: false
 
@@ -85,6 +91,7 @@ examples:
   # Example for GCC for SDM845:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sdm845";
       reg = <0x100000 0x1f0000>;
@@ -94,6 +101,7 @@ examples:
                <&pcie0_lane>,
                <&pcie1_lane>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk", "pcie_0_pipe_clk", "pcie_1_pipe_clk";
+      power-domains = <&rpmhpd SDM845_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

