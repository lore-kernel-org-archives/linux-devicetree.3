Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD7472F97
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246424; cv=none; b=TEHlSYkWVJ/u0VTea5sWsB0u+VO8o4PCO91ezgSJJa2XcUmhSzQjAvy56pL2MDhcXDon9K76zSwUWb7DDjHL06PrvX8V9EHrNdBPTMIOwXjfwZ72Fls8IMOgy9liuQpJb4Zj0wzKkyDOIsRVuYNFPEsoINKfraxQP1XXP63UmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246424; c=relaxed/simple;
	bh=m0szZYJt1mbtSxjTo9A0Uceju6b+r6kjiQGn8+0PRS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1a3+RBia1sOpDC3oprmEale+y1xaTZh3qOrHYvOFAdA+FZeDfCazMnAGRUtPcZspqI+TUtrtIm7BEQYsgKmzD/V05yEMJIr2LH5s6E1/PeBRCNheCGEJwap474rG0+S6H1ITw3a3Y7/ZWTuvz20b7u9S87nf199jGOy2qPAm/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QwU97f0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BFw7JypZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QwU97f0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFw7JypZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Pg1j1270206
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2HaQp9ZGyKAw5jxqgMen8LltlQ2mYbVQSpHg5kqbxuo=; b=QwU97f0bqX6a+5nE
	JzZC2ggX4DX9gRNwFY0b1OZ8NrLLIw5HWyYjjCJNgJeoUSeNGjI0Q6WN90zvjrkQ
	JI1iURlKsWdv7ANJ6k+pTzT6L09NILEDvNo97E1YrtIxOQKYoQVYb+nQFXUNB9/7
	Z+E3URSdv+S+CMM5aj3JjbcN4IsRrgVif1ewrkLAxknb8A+gHegh0Ukm168GJy5e
	ZNnvDwnGPruDlZOhdXozoy56cJVW7nOyx5zYUFGodziqH07OIFdiCYNLF0Enpij8
	LlOh44GTkoVrHv3ZUf6a8Rjy/Sh2Uv3L8k7GMG+JKrN8njyNSH9kWtRdKlEhF75k
	AO2vCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90ajrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so293226785a.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246415; x=1790851215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HaQp9ZGyKAw5jxqgMen8LltlQ2mYbVQSpHg5kqbxuo=;
        b=BFw7JypZLIEvry7aW123STXeLnkt+76nDeaYYPslDDQHnW1o/IBF3GHt56+hU4HWlI
         VFJyUI85uYiAKTeEbTRJ4zNKlv758hPQGaLuUTtxytLWMlGtn1FcIrH6yO/cLQza2bQS
         3H9VFW7d40FpnVCH5K1wLMRtZyoQzAEu5gmeQxZYJsx/6ifIo+2YKB3xfc0MtDaLphJm
         m0iYLw1XmgMKODi4K/GChGuV/APMTsqZCSlh9bgyfnd3mP2YuUdvFJfnyUb2ZfpGln8O
         2+BcQdgvmC40AqEwCOSoOQHD6DelsWipZzcYPrhA6hPkgcpjUCtt9Glo5930vYCXNxVN
         ahVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246415; x=1790851215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HaQp9ZGyKAw5jxqgMen8LltlQ2mYbVQSpHg5kqbxuo=;
        b=MElTpZao2U+DtoDXj/2Uyv6s34GdAq/iUapOuxul6xW2DZiLdhM5wSPF1Ir+zC9BMy
         /b6UbPvp7W/erq2Lphud6cnc0eJajN1W3E3sjnStBhl+CM+UI2BtICwLRR3vF2PxSEct
         lP3zTAh8Y/69HMZUZtnb3hyWUrLxZ5DVQzx7ipQbMepqUy3E3fgSMqX64da9VDGESoOr
         qw0Jd1AshT3T/B88AV8BwdIHGIoNgUQT6l9JA0X184npHxiAcq1PjN0sGkLYxEkCy5oc
         vdcGg54NIE4fQ9DjzDmfRR5NqzXrVHFqTr04PbWbpoKGAgLA4m0Yd7MTIUUBkgvBmf2G
         lnMg==
X-Forwarded-Encrypted: i=1; AKwUvBxTdXO5cnIGS2kujRvCMGPZnOKEdoUQPvbhWol8N4p1mVIWaXnevn+543Pfd/9gNjkkmnd7In14570d@vger.kernel.org
X-Gm-Message-State: AFuF++lfHupf7qY9pqM1IGCNjfTyD+8Y4nmZfi/g8xpuIKlsEv2mljij
	eRUYOSn7Pn/3G9AHHh6GDOx4HAl0ROs+RtUyrS156bmct2dHGGGKuFx7nRsedxetTjH/+PZmeeO
	0Vj9VS+tV25Kwatoraut6s9XHwCkA1dmkZg57qNZyorTkKPbXl0iY6/pXwvq52hso
X-Gm-Gg: AYBFou2059P34mpinezVBUQIFmumEsV6+EBd2jgsYkfXAmTz/HxfZO/hpbRxGtQ+LNg
	JkKudk54J6UW/jBzpwyrXPDZ3bLFOclnGbb/Uuiw48T95fALjFFPMfgGd70GdANsw0KpWrBOvxY
	lW1KzXohPBxt4wUvSCdgbk59ifUlzCWXGB5rETJPw6QcGRv7Wpgo/8VOYMI4nL4Z9IRweBPXM0b
	MZlaF0J+f7v4v1206nvr+UbDTFVT4Sot9zY2BTsMiN7ND8ADbYmfpVygwU2BCsrWzrpTMXi5TUi
	z6ButQcJ+/yqBKntw3PXoyeSFxMVMmXBu3rIFwV4uFeuPA/vSXR0tq8WpA1CxsW7FbXDMTt0naV
	usGf8kDkC
X-Received: by 2002:a05:620a:63ca:b0:93c:2184:160c with SMTP id af79cd13be357-93c3647d1dbmr209485685a.62.1790246415141;
        Thu, 24 Sep 2026 03:40:15 -0700 (PDT)
X-Received: by 2002:a05:620a:63ca:b0:93c:2184:160c with SMTP id af79cd13be357-93c3647d1dbmr209481985a.62.1790246414532;
        Thu, 24 Sep 2026 03:40:14 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:18 +0300
Subject: [PATCH v5 02/42] dt-bindings: clock: qcom: gcc-sm8150: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-2-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=m0szZYJt1mbtSxjTo9A0Uceju6b+r6kjiQGn8+0PRS0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3cUDXjYJY5EeOb+MUtc3pSZUdJ+EarQaujW
 dOw81BKfIaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT93AAKCRAbX0TJAJUV
 VtS1D/4/ov33TdIzUxsZxRdlXvmADXaQxaOgyPMnDAfyOPA4kXXm5+Y/T2DRXoHLZaxbZxuoL0n
 jEC3fLDGVA95QCD6Tonu2/5MSdSIUbA6QxuqcSVsBmBwvfEOFgGp/7mfyuJ1LdnQePEyOD6fgxo
 2KhxvxWkpx5pc7A5p//G9rA1hYm6/RUukNnfHV7JWHyuL1FvZXujia62gj2KKAZTxvd9Ub9/7C2
 0DaR0s2we3RQhURS4tUQSgcALd3wIYe0fy4VX7TOrqbuGMJHGhly6IziWbhXpo2/MebnwG3JpfC
 S8jFisFViY+sOM11BMBZBkRH56PZjA/LFUR+oUSKONBHcA+IsIzkB5j9/Ww6PKhvtDZNk1Hwt9Y
 ZIqt6jhl7ZV71F1mw7kdycuhL4FMnTWposC1U/qxHDJsYpySwCMY9mz36irZE4+G6fXbckNLEXM
 rucwch5O2NU+xS9RV5MvREDRwCJEuAE6ZXxKloeSepE9uAUxZB+dn6dp0vZAA7K+GMT6mnq8U4j
 1b6FvB5TYXn6lE9R0JHehd49rBQNp8RGgwRUe6eVUV67DyffpEXW0x9CzFR1D/yZ2l88/n+ELVf
 Wx3JkwMm1w77devgGA2PUusZ+RjLYvP3/87zZctgBhYErF7I4yZH7qLclxYoFRmrzyviGlw84KH
 XbGjO0Gtm29CLZg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4pDdWLyqOkqO
 eNMiQ/Fz8eFC9jdyAAuLf4ERiKolnKGAcvJjgbw9OEMHlQqE7emEjngs90+WqiGnZB+VsfzYs1m
 moqQjY9BnPMZH9RVo9yo7HvsRRd9ChU=
X-Proofpoint-GUID: an39ps-OK-K0NVvU5ZjlYVAwV1dCLjH6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX1y+cY7z6nRL2
 RAUg9NBtGSAdsfXxJMEbpPRB5j2QAOxnjamS4sJ5SoDg+CbJsRRKpVQ6t3353POsvg3dF05YtXU
 CrQJGq8bQ/Z0A90F3EhiUUusIBqSYpjyczVwKU2jzlTUXtmpb7TH7jYfa7N1+A4T8F54sKBZTYf
 Oabkz8Fw1OZjkwNB4EPkFq9ndNbn8WJABQq4JDSVS6I8aAnM/f2QZWc0IjLCqMw+Kpl19vdialF
 Cq/+psLbokkUfQx/LqYKi3QhXakuUH/EIsBJHi0QWGxBnAAelxzjjSv2l9Pj89QGAL4qN7Lv2EI
 ZbudEoR1GG/2+8K5KS7pIdSgJ7GbrEt9MTrD4Q7zTCRAh9IJl3m1dmX7yoR57AY9Aj6N2Pe1t05
 5a6bJxrVQFR9IVt6nCVfW4UTGvDzptogOq4kPad5KA1uv6rn2IcXe6uYJY0IIXc5a+KEe5h9Y6v
 bCMfUEaq7MW+HjfmX6w==
X-Proofpoint-ORIG-GUID: an39ps-OK-K0NVvU5ZjlYVAwV1dCLjH6
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4fe10 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pFmz-OvcvwPpwNjHdmcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Describe the CX power-domain dependency for SM8150 GCC and require it in
the binding.

Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
index 5f3f69fe9ddb..82d67b0d82d0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
@@ -30,10 +30,15 @@ properties:
       - const: bi_tcxo
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
@@ -44,12 +49,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8150";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd SM8150_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

