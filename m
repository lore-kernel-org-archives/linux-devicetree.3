Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19BC475355
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246423; cv=none; b=iFia5HE3kE7ZHE1QEA/Z59ZT4c772wCL6rA6/NCfCwue59WgODZiBeBHJ0GmjyDbgZyxyGU1VuXP4qHdz56PQSg/KaYUU3CVI2aULaGwD5LQqcgk12/agKPb2gmmVJFIdfCitvhySU6S0WoZOSgU1/iaVFVO0WrCGhoUwHEIBXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246423; c=relaxed/simple;
	bh=AIEXAacqyi97GA2j6N+EcGrJcdQhhv3NZwqXVRI/NxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cwUy3MTC7baOpHJgzcb1D5S9vRK9tddtc5CTepvBQUUXxj+Qhv7uTDhXGfpzK8lhIaC82mQu9NCu3MYLtOwKKf8aldKeV7O9IXMtis0jfZDdJmAggxPu7yZI0ol7VtNU/RL1Fg2LX3CGP9/7nFb/CkWQl8oabaS++8eagNrtmhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0D8pC8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUSG2ZcI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0D8pC8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUSG2ZcI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3WFx538588
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	op+i49uaIACzxUErEOBE1uvPQAYj4fTZpwGEYxYcQQY=; b=P0D8pC8PB/jdsjkZ
	3fcBkdDybu5kTZ19br9kQB+zev2vbEqM+JPdiwXlLQU5xeeOcZdkW807M21eR3QS
	2VypzCeQHoVyj2fJXrvcT7rDDK1mxKbYbA81I+gSerAd10GNzress1prJuzNGxb5
	u2zkXotEtqVN2FXXsJRZD4ffig7NKrqnm8DrjFjw8lYWobqy7hA0FIQK7laGOmws
	FQbsL41tlAZ3gVbWtyy2GNtQLyQfXquByVQBAp+iz+MSVSgd2OAeohjVp1MXCogY
	N8zYBMlHfNX5hk+va6vBOjq33E/46F9YQstOT1Z81tDUB1ji9Z1wMcxe6W08zpPl
	eTtd+w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc84c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0b66ecd9so232601285a.2
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246418; x=1790851218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=op+i49uaIACzxUErEOBE1uvPQAYj4fTZpwGEYxYcQQY=;
        b=OUSG2ZcIC90jmPndmzPUD22QdL9RFHm/L3o70TFapJneUoGuBpugqg7ecNfzB35BXU
         vsUBpCePLFXyi2Qg90rpEhjE07BJDkWJteMw/K9npO+RSBZOIqllQVA3wsIYADTxfqGK
         SReU+SEJ87TDp3ZYCQjjdn+N904N7y8dKZlLzb+0dKU8oEnhkvqSsG6AavUVBN297AIt
         R3iyE4agl4Eyo93636f5Ar/oA4NPdDy0E4EpfOZMrjCBohatU0377PYMezFx8SrJ2Qhc
         RL4/2uer2WUWD3Mcco6uPm4CgXzhQ/tz25BYvG3fc0blHVuAyv8H5Loqg20g/VF5N/XF
         IQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246418; x=1790851218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=op+i49uaIACzxUErEOBE1uvPQAYj4fTZpwGEYxYcQQY=;
        b=ndxYje/udtzTBp05bZTQBQGMI+8jyG8kbd4OQBvvzdy7Q000vh3bIE6mgf9odtfbpu
         +KbI3Ah6R/nG7io+azRuFgF0IzyUlr1cRt2sEuGvQ+DyDZOzi9/b51ktsniq07fNh/s5
         mS0Yb2OACHaRJmR7ptPuddO6uv8buhamwpZlFtLPcoPQmv8kioxYK5lVBRkGTS3E6bYt
         sG5Catj8xuBiEtTKmj+ePQqxDW1SmSe5rIEtoAu1jiGWyMIu7PVDIaOQqHJXMqO+0reL
         JsPBbiF7RKLQMn5p3f1+0dY9u4AtNHRoqToNr88DLIiEwWdcC9wsoZkdVqBODrF5QdkW
         JwlA==
X-Forwarded-Encrypted: i=1; AKwUvBxAj5PzsqxbvoeIlZWB/gZAazAgKsanFx+x0twyNfL6nIZShlxsedwECEjd1IZHF9DgTapZZVOLzUWP@vger.kernel.org
X-Gm-Message-State: AFuF++nAXrHhuG9D/h6GgpwT4xgQeNJ5bNlPh3zhmti502jSn0mH8rYm
	Zytt9k6l1QE4C7zI6Prqv3EefV324rCReXKcFa8QzG0NqDQJDrEJwIyK/+B6JN/abUi+nho2DGD
	I+H6+Qf5zchd7kqKJLrP0x+2z4atvW6deQiTBTn2T0KdbflfniGxyKVZBOVbP0k+G
X-Gm-Gg: AYBFou2CpRsAIfrQ2/fuWfQvRsGIJBBbq7Nd2csy5waJQz+IUvgZW7B/Qtc+PPK/qq5
	k0dLWPUuA6NmCLZpGFyGukZW47iSEm8IOguPcSXuN8PifPNs7FF9cZBnm1IzftITATdpNcNPBuh
	ADYRUlcWnmuvXFDz6M4VsDgZV3ZSezi2nXeA5iNjcUyiOQJyKx0ffQ3fmtiXaGB0VQk5rkjokBj
	c9ZL+JmuBLsA5klul5IKT9tfaK7LRca9Pa8mJP/x3z6jB4hSGhXOcSWOEVli7/4S79oJGp/Dld4
	uRk8b+Q922y5tzaAnc8aiO3n+edPCZZfYeQzu0KnHA3NYvxTPVio6DeB6ZFHd7tfxeeVSeyMQSJ
	y1+APsSeJ
X-Received: by 2002:a05:620a:31a4:b0:930:9585:e08e with SMTP id af79cd13be357-93c362b2742mr229041685a.10.1790246418028;
        Thu, 24 Sep 2026 03:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:31a4:b0:930:9585:e08e with SMTP id af79cd13be357-93c362b2742mr229037385a.10.1790246417381;
        Thu, 24 Sep 2026 03:40:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:19 +0300
Subject: [PATCH v5 03/42] dt-bindings: clock: qcom: gcc-sm8250: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-3-38732033e5b5@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AIEXAacqyi97GA2j6N+EcGrJcdQhhv3NZwqXVRI/NxU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3clsCNiIvFJg185U7JJHK5tk1sUx9CgEy5P
 4KDodOB4kuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT93AAKCRAbX0TJAJUV
 Vq7RD/9sJOUTon55JjkZ/j7DgzMtIgV1/oHM455+t0dGpgzXE83NIjGI/vaJlB0y/Y05PF7YyaC
 wgWto1tRRWn2goHGyvQmjAsPwKA32+qEu0U5ksP6nbO1rrvnfWw2PdsrjJ3Ye2a6iRgKQZvq0/f
 Qr638b0hLPGNbGjXmfTo1cpg+htJmCK90GUttMiNHGTQ4IdWPDSOjdG2XhA6c8J7qe2toWAS6Ce
 snR69yzvFCVi8a3vNY6xSRKIyB0o1BH/IQIoWQtP+xWnuIcoD78riQjcXZCJ/zbq2qiUVCJOMm6
 ET25okdzr2lj6eybwW8N6kGme+wUgDs6hNV6yXDCAblsMx3kRXm20oqR9qW+T6C8KGZx3jiiMxX
 x+cFh26lEI12Nrg5Mfc/mXkLWsxHIphRsc1LTSXq/SBz+A+74QfVD6W9uvTHZ0gZ+x8JdyUq+T5
 CSG3/b0+DRoLBZxDeziqmNHVxwt9X6c3fLn5wfcTrLeb/TEGEdI1mFIb9EkgtfWzjgwizm6qzkB
 YIwYkbtWXTOth/780hjpPJ/IkYRwk0sQ/I5gCwjc/kZ3k3nubsI7tQa1BN1RUav3ulH7TryWyId
 RPegPbIrIzNltlDVXdH0s6QcHukbOTHOSndVRCIhqhn1Wfg/hdMaumSXU2oVzwF9cI2iggNkYo2
 vvobIiVLcdxOeUA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: jZ3Mt4-VLIFb-E7m4K7cobVCplEMtIAp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX81+MHVGuviZD
 wKQAsd+2fwXQytUmIPK2Tt1jybbCqzvM7b8NGsryLaevUSoQUQW+4CHdTLP6fQe7h0LoULSypNM
 hvtnFPl2aXJzgMH4uDeMKKbG9Czq0Swf681n6W8LgsBMIqfmnCsvG9wO4fWaIhtEKgY+uJW+nZK
 n4a+do6MbtZO8NdU3gyOA8J/HWkkcx975lM5/LpinRI2AA14Z2/0CmHzDblM7nYfxERcUfOg7DW
 Sj/SlTlFNexEwVSnnSQV0HP6f8PD9sfwaXbhtOzi+85QamzFt1FR8pA3tawoVQvFw7TrmtwErzu
 TRoGwJdcO4bUvazfOYnLxhQNx8/Q+VgFvDVwc1aK7Ir9CyySdcOqfsHOrMQXWodZVOgVEwZ6d3N
 RQ+BQqraxRv+p3XeD6/qbRXKAz8bLVOwjJuhA1FoeY/+Kkg2M/k+AbYuyvjy7ITs8lZP3Y7NlT+
 IaYXJ63dSI2nwFk876A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXwH/ezWivAb1J
 vCvtiWQ/OjFebBgHG+mj5pR5pwzb3P5dGONN8HngHrt16IIxTNiVaqV4SKCg9jUOYcHquDrFPtN
 yB3H/LO7NNRWkPQYlOAqAyk0zYj8lrQ=
X-Proofpoint-ORIG-GUID: jZ3Mt4-VLIFb-E7m4K7cobVCplEMtIAp
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4fe13 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM8250 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index f4cd5a509c60..5f9aae728245 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -32,10 +32,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -46,6 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8250";
       reg = <0x00100000 0x1f0000>;
@@ -53,6 +59,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

