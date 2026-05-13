Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E13ACF13
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697630; cv=none; b=pfBE9Ic0ucxZ4TFhPbIr+KDeMaj7SCVtjNXnNANFVI2t3cm27de0Ksih6jRxuBp/YQpNLUhi17BV2Z2Ltt8lNnD1gvbPqQ0AEme6CkA7dEjLQK6nxeoP0+myX8a0Xd6gf9pwDhHyeob3AvU4lUJY8QInnqJEWL6mzwjP+Ks6Euk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697630; c=relaxed/simple;
	bh=z4FbzAvY5pZ8H9vX/hG/UlmCYedeJ/87e4jZmsMaSQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPM0lnyKfV2IgndsHEa5mMumZ1kps2tWhvKomM/eBzNa+kwLFi4kL7BTt26gB1qoUqhhe9+5Iz5AVDPOhOw9FYk+AyCJrizxyEWjw8Jw7gjWpIZoLvHjilEU5ioGtvyId3OJFWMKXCitKcEFu9+1OML3R8s/4LRERIpdPjYNUrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwsWYV/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxtC1vRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwsWYV/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxtC1vRP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DG4tHE3007654
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=; b=pwsWYV/Q630UJTGl
	viB2bEpkDaLz8eeQDVZwmwwbH1eCG2vGGMu9Jq36NSB1bmwFeH9NhWE/K6EpFQnt
	IRjOHLo568lfwTdE9mZZT9KUpwKRGyQh17TcCLvR0VAFvDUcfuzGcGBD+5+xp3ai
	K3dZt5WQN+hnvWkzRf9nk4fvjKvKoQ5Z/d35zktLlIMb8CdnwizBVrRbBW0k3ipH
	MqAKg1Uwyn/9GJ7HJhOplLYDP2gWSbkIFnd+/bR9Ykeuam4YNgt7G0HcSi+tL2IJ
	HXjFKfN0+JO7kI4LcWlYpG1KWBMjYaKUetdNR55+R/xur1hESaAfjPYCWPuUpxix
	AZVIrA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0j4d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8292e18166so2063995a12.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778697626; x=1779302426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=;
        b=BxtC1vRPwIcEH9vvyP0QQgTG3OByI79Epzt4oKGI1/bw7k7H1J2PadWQ7Ey5n5cxTS
         AOn2ffdPOgknnzOxy2I+0gFw52Yff2M7AhYU6t47ft3535gyfqUJq/OnAYRG42mokKKN
         0YfPWVrGEm06YUUyJ7quQCggbbYCIn10aF2/rF2FgzMnpq3ayo9IggJV1U3m4eeJ3ckA
         18Vkiti5Bn7wHmrW7+h3ClUP1ImsJS1ze3jj/3voWjqi6utdCrAxt7HXfLAywPGezOwK
         NoOY7g/yDZeChRmbS02LWwW6gplJTB5G3YFkZzIDI+wY342siTuDCpk4K7JQob16UMNJ
         +a7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697626; x=1779302426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=;
        b=ovFqc0OhesSRv6IxjJyci1FDyI6ExjjIaG/QoX7iy2SJmvyTv5rYgZAD0ajMw2CRmE
         0RbMIwQNNW7bvtQXiNBoA2MCIWrIqdnJmDG4nSKF2JhpXDyFeniNDkHQysckUDOfZIMn
         G9oRYCpsPL0WFsp49rXMghSjmh14rWc9BA0bcr1k7AHOA+6Us9+2oy96nEExAp2wsoTZ
         HG1k9gNf90TqhuLBKCv/nalObqIIxn1DYwwzRqmI+HuhVXAolN4+hJSaDwQMbOaymoNr
         +NgDsXx5KnPZj2s5VwDnmpJPj9sZUF7QrF0u8YnfOxzSeVaS2SbuGVjq77WyD6DjWZte
         FQRw==
X-Forwarded-Encrypted: i=1; AFNElJ/hZMw57if9WSifxY1wlQlNYF0TZFnuZDCZRtcwifTnCOpmDcUE42ZrPZ82myiGvUXKJzSzeUF5eNvy@vger.kernel.org
X-Gm-Message-State: AOJu0YyTOrzTrLvmu/MFQPNzDTSSxA+TE5rGjkzAm9SJY1i4XlHN/zf3
	4VF5pyyU57TntkG/n2Y5yybmeCazMLJLn4hwCOgzt49HzwFL5TybLXPkOc2nyyq1Wy+Sqhc4Nnf
	+t8lfqyZ9GpTaSFVtB2dsuPO89o/oO+NMQ9h52ggCH+LlN8rY/21979uMbHl/TRMW
X-Gm-Gg: Acq92OEPbBGh4S+tNlNa3SsWs6Y7f5xWmDZfGM5qWkLZTtfibf7V+LXlCvcoLJ50TlP
	XYetRlWsQcUDnA9IfDJPitWRiCGfSA4EPP4BB1yl7yM+1cTzQHwPVhCn9e28lCzqKnfbT8dn4bl
	j00fcKpUh88eECiMmnNvqTCaHeWkHvCnJ5gyo/3qez9VbI8APjQWodHBo2tXjpIbi11i7mNfJkZ
	PQbcsSB5uWRsPkYzuJkvMTHo2PUnEzwpo3etSIvY5NjpkV/TVHADjPDxD1zFqhG03gRq0zUhvZg
	In91YF8/zj+RY+zAnwVWrxYDPCS3mbQ9NTWd8UWRAd6XX/ZYf8AYDsKaKnp9NqLaEtekncX+XEf
	hisOkTR8ZIaEbQnfR9PtHZbcNrjk1Yz/EL120SrtKnQggER8BH2/hmbI=
X-Received: by 2002:a05:6a20:748f:b0:3a3:21db:8ee8 with SMTP id adf61e73a8af0-3af7fb6dd28mr5381430637.1.1778697625594;
        Wed, 13 May 2026 11:40:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:748f:b0:3a3:21db:8ee8 with SMTP id adf61e73a8af0-3af7fb6dd28mr5381389637.1.1778697625081;
        Wed, 13 May 2026 11:40:25 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm15271009a12.24.2026.05.13.11.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:40:24 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:10:03 +0530
Subject: [PATCH 1/3] dt-bindings: dma: qcom,bam-dma: Document BAM v2.0.0
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-knp_qce-v1-1-0ebdac98e50c@oss.qualcomm.com>
References: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NSBTYWx0ZWRfX7YgcNkrj/rE7
 Qo3oUHTDQQMyh5CJZ4M6bQkAEd4dOivMr0yRlfJ6JjXqMYRHDeydQZKiVNpXUs+RE/kT9ff9bFF
 Ii/mg9Oofi7cAI6yc6K8126+6C55SYmsYvNM1QSx1F9q24eLDX0PjzKXPgU0eoQ3jX8mXwNtc9A
 9zO2bR+/ZTErYOk8XJBbrAHPIQNR/AyAVeQrwiFwSyMN8hh4itA+Bw97Dy8gxoO5jAyuYZmR0Cm
 pX1JhoSBsE75eFqWfgxJvAyf5WBcVr4Nyy+ak5duPP+5I/EZQFaPfLAineMCxOYn6vyvfRGb5oL
 8LdEsybU5MKnB9I0oVVKpVroebqgIVyBZvcA+0DCetJVz0RMWRH4wOQeS9SGSorPccBgG0hQhJJ
 sp6tMzyiyv4GieDwG/t/HYeKV7K8AmtH50Zc8q/x+/wSHUobMEEeps7hUFiyE535A6wf8JJaFl0
 vKLQ+bRix6ZQEti0vbw==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04c59a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QMZoEd0Ms9iLIoMSFykA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: tYf-I1jfy7BqDMWv2rDQAreA650qR1RB
X-Proofpoint-GUID: tYf-I1jfy7BqDMWv2rDQAreA650qR1RB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130185

Document compatible string for bam v2.0.0 version found on kaanapali.
BAM v2.0.0 differs from the earlier v1.7.X revision in terms of register
layout and offsets, requiring a distinct compatible for correct hardware
description.

Also add a new example for BAM v2.0.0 to illustrate a more complete
configuration than the existing v1.4 example. The new example covers
64-bit address and size cells, IOMMU bindings and execution
environment–related properties required on newer platforms.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../devicetree/bindings/dma/qcom,bam-dma.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 6493a6968bb4..0923fb189ada 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -23,6 +23,8 @@ properties:
           - qcom,bam-v1.4.0
           # MSM8916, SDM630
           - qcom,bam-v1.7.0
+          # Kaanapali
+          - qcom,bam-v2.0.0
       - items:
           - enum:
               # SDM845, SM6115, SM8150, SM8250 and QCM2290
@@ -118,4 +120,23 @@ examples:
         #dma-cells = <1>;
         qcom,ee = <0>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@1dc4000 {
+            compatible = "qcom,bam-v2.0.0";
+            reg = <0x0 0x01dc4000 0x0 0x22000>;
+            interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+            #dma-cells = <1>;
+            iommus = <&apps_smmu 0xc0 0>, <&apps_smmu 0xc1 0>;
+            qcom,ee = <0>;
+            qcom,num-ees = <4>;
+            num-channels = <20>;
+            qcom,controlled-remotely;
+        };
+    };
 ...

-- 
2.34.1

