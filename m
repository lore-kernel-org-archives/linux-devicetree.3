Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA233AFD1E
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908516; cv=none; b=cM9dsSoJoaBAcGT80pv/sn/MqI7RUOBXsdbHISKf9Hj6lesXAoyRfwFGk6FXrZytCp/IIKwQvmsot+4xSgUm7FewVutakqW4SGvwT7wcj//gUIxDMk/eODgnkQKg1dttV6bRcQCjrzI6Tvy0RV1mieSUlMqEFCZ7gDb0g/wxC8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908516; c=relaxed/simple;
	bh=yBHjoToyEmvpw9ZOHDr7MPJDwbB2Fu203G+gPC/yC/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJ1y5lc4sSnscTjJfkqUDpICshF0i238p5AdtCjf/Vd1vytvT2y6rHPcxv5ruu512xeVG/MrFsJj/t9DMYeyjj1lqb7l0m4ZtC0FD78iPr+Fq6odsOFatmMqdKPoKFYAbH3864MqfLTscV2pofgEcbWteGWUY1lCfqgx5xapylA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzFUuDSH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/xiUZie; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzFUuDSH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/xiUZie"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586RgiT2833997
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 08:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxRVdQ5578eayqXtMEmKyb3yUdHj+2MNMKPNvNzYGdA=; b=UzFUuDSHOKVTAHEX
	C3MQLfRoKXwN7wPbIUalvwzdpcV7Qo0tw3uzdOCRwgkUR/LCZMn1kWatXYEm9IhT
	4+0sxzeEhhrCRasemxBli/kPa5KnC6IjXByVMsVoAaKMe/Psyi0jUMXuCM6frzvE
	C598hFKYqkeytwU7cySJegBfVXziE8x8SUf90Xe074Vw7wH5UdsJnhNbY3ac76bN
	Gu4pf75slYDWpGPrnkQ1WuvzP4h4RAjPO23mcYCJrvQWw7u21zrxGFDWVldfc1Dz
	/yQB+DGqF6OisBAlUZtmbb8CwcKmpJNKPFTDGg6QduAHx2VgpFk8yR4uVSIO4s4A
	RA7Kcg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4y6qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 08:48:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bb6c41341so4717736a91.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908513; x=1781513313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxRVdQ5578eayqXtMEmKyb3yUdHj+2MNMKPNvNzYGdA=;
        b=J/xiUZiedk0BTeI6G+FhafGAXffPWv8mlEJyCnwctnRJxrfAFA2AAPbOrsaPazUJXb
         NLvG6xgsbc/JqAiWtRuCOHjHgXt5UGKuOohAtmw4gq2lfccErDzWKO1Nb7t+4obEH6bT
         GW7T3CorRx7ZbZ/NRQYaDs0F/Du/bMeNjtwp0n4u1UXocumkHqRd4CJUF428GBeEUoHX
         wj4z9hRhKZULDq2n6cF+qieB4sxC3TLIu/pz/fGjofQmULfLvyJlG8R9bg1zci8UsP6C
         36wz2nL+y5Ov4rF2leb/ossYCCDB/EEPIxXvtA9aQ6/1ewWvHopChU3CEAWvjc62Fpja
         6tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908513; x=1781513313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jxRVdQ5578eayqXtMEmKyb3yUdHj+2MNMKPNvNzYGdA=;
        b=a55EU1kMsuFTSzVwDfowY32hGKcDThS/tAxQxW6rrbu/XebzQZSeuxa6lz2N2kNqoE
         l1SFqpfZ/NKPeAt2gcfvVrs5hsTyenRKCpixlj1eWR5wlxBKrm2CPN0pmaAjv9i9hIsv
         OS2g5TbszFI3UVyHjUMDMMDCV828ewAbN/im6ueJ6o8sVty4fwUPyLkB8NdzvIO0KuZm
         X4CowRVD/7BxZM5RmkoNE09tJrHxDOktv9h6l3k9SIPULnq3/JBJXU0VUqQgtf54Y25S
         +vR3aLU6gq1/QoD2cp7YptSeGVWmRLYT2xNVkM4BS4cbhmanvh+bhUmPIkNOBo9eI+e3
         RXWg==
X-Forwarded-Encrypted: i=1; AFNElJ/VgwDYBcaT0AP1yTjelLZ/JQdZSzSyhvwU/28FB2jggRkv20exE8YYRCNjiVo7D5R/mFwYe9Om+w2j@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv+qNLWx4EUn0wVbRk2L4tQDokedyGzoy709E3wvBQVHWuqaBm
	0zy5Wp1Awp65G34c9xCz+DpFMsB+7VD0B3CYNynXbaWHem6BWOtW9Wz2uwhZeUb2dzbT1R0/mR2
	l/VcO/IYRgaqB0Y1t43Dx6d85rEQaktYvvrsC0hH0kYHHL5rd1ZD+MHey4oE6MBbJ
X-Gm-Gg: Acq92OE1N99DaKTQhASxgROvr/uPYiy/YZUXH5/ascVmoIhdY7USLRhkeWqdwYa92fA
	9OznCZUGBHPBCBoLjMuV4UHt9yjV98NKNdQ9ji5hvlO/Ybd7Rvz8gq1HaXoZe6+DkVQxYk4G5Gn
	E97slyHRanjgFoj/2YVc81XZKGSr9BuB8iBdmYwI7DLPmpY90mDAONAgYzPYfbfQj/bSwTOccT0
	0umscx/y0FWc6Oud6U2yVc3QVjK+v2Z/CQ9q0MvSp09+Rh2HZ10m4D+ctAKP+3Dh9QPQuPTm2FK
	JIsAKJrdaZWoP6THx3bhxLK+mjZOzYSbfYopVG026U5UIAMyqKjIFHrFZQo0kn2qfcdp+4fq/+B
	wZMpVRRM9q+vXdK/lzgggsWqX7VVNh3zia7SzkKytGScvK18lYg2O6FSj6E5pCMMN6r8=
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr17913272a91.19.1780908513517;
        Mon, 08 Jun 2026 01:48:33 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr17913246a91.19.1780908513113;
        Mon, 08 Jun 2026 01:48:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f712de91asm15070198a91.16.2026.06.08.01.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:48:32 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 14:18:14 +0530
Subject: [PATCH v3 2/3] dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-eliza-v3-2-9bdeb7434b28@oss.qualcomm.com>
References: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
In-Reply-To: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780908496; l=2136;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yBHjoToyEmvpw9ZOHDr7MPJDwbB2Fu203G+gPC/yC/U=;
 b=ja/5LGBZqLE+1Wu1sWlNlGqoDr6Lswt20oAcZyryoiw0HvM5vhjXHVza1wvnRC82kNBi3B9tV
 2OVNAra8hVGBs8SJerwHkz3+2x1CyINSKLNh7WzLfrR18UDw5xxuDYQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: sys6WkyS9mSsrm4qTg9kSPN7CMXh8R8d
X-Proofpoint-GUID: sys6WkyS9mSsrm4qTg9kSPN7CMXh8R8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MSBTYWx0ZWRfX4dTGlVg0RHoX
 ccza7m0attfj/ITIJkBffOHbCIiJR9kd85S315OXn7A1HJkjiscMff8rT6yZ9jGjWj3h537P1Sl
 tgnaxUCtL19QRUWRYR73TZtKMK9cp/gmWCHs0tlKGW1xLSl34Kv2pJN2rsHsPQD/qC0prMZmzic
 IALzTwoybhNNj0EHilGWIe2ect+jDZy1o5Ri/SUrToklre01vA57EfAIj7st/suiulyE6b03yK6
 jFLluSkJUQJmIp7rjPm+pDAoDgo/PXy8jn40LijwQ28jDULyFYjWOEzMNxbPGs8T0//vc3ZaWex
 snF6oTdeFoqPJ0DLEVrsElge7Gq7P8n0J7ogCAWWzoyewxEX9bI8rNk5b/McXhr51vLulsrkIY+
 KzRQYXAG4+BLXHXCgnZ4dNs8pQes5xsb1FgrZHvIUAxabzWGxv4O11bmihydBVCHhYODR2sXxlG
 ML2wiR8xW1F5QW99v5A==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a2681e2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FC_8z62UfPBbNpSbB3cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080081

PCIe controller present in Eliza SoC is backwards compatible with the
controller present in SM8550 SoC. Hence, add the compatible with SM8550
fallback.

Eliza requires 6 reg entries, 8 clocks and 9 interrupts, so add the
corresponding allOf constraints.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-sm8550.yaml  | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
index 3a94a9c1bb15..fb706b1397a3 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sm8550
       - items:
           - enum:
+              - qcom,eliza-pcie
               - qcom,kaanapali-pcie
               - qcom,sar2130p-pcie
               - qcom,pcie-sm8650
@@ -91,6 +92,55 @@ required:
 
 allOf:
   - $ref: qcom,pcie-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,eliza-pcie
+    then:
+      properties:
+        reg:
+          minItems: 6
+        reg-names:
+          minItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,eliza-pcie
+    then:
+      properties:
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clock-names:
+          minItems: 8
+          maxItems: 8
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,eliza-pcie
+    then:
+      properties:
+        interrupts:
+          minItems: 9
+        interrupt-names:
+          minItems: 9
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,eliza-pcie
+    then:
+      properties:
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
 
 unevaluatedProperties: false
 

-- 
2.34.1

