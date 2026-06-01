Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DD4313283
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335056; cv=none; b=eq9Wf1dzf10X9F1bZNFIIWA7Zddn8NPr4aKTl5ECN3w3cupAYd1cRFl+m2syeNgdNigzD0Iec4REqkU22AUMsDnSKTNyX7jEGiV4T5NhErbwX4SGDXJukBZrrJRxQrHnzufEAXI1e5Y1LvQ+uqVrIqzn4REM0ohMC1vSHgz8TU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335056; c=relaxed/simple;
	bh=xeSQHPitzN8ohDKs18l6esrdselqsjwFIBvIjhevBqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLDnE0IHXg5YlRMaGo3CYmDumFTxj42MIHFMsiocdDw1V+JEC75UGhild+baXt7HilhMhxb5Z30KbN3DdsGZ86OSsa5mMX6kRytwBWIry8QL6qzgcDQFigAhcRLi2D6KIWZXKGuqFJGdQKgP4031cd/ug1E+DJoEtqJ5eFihpcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkhQyHZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhRZKKgF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkhQyHZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhRZKKgF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EfmmR2740405
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 17:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVm4TdG5n8U+Jqzsg6ytMrzaYYKYP9UWAt7EIHGxQss=; b=CkhQyHZdGEBq93G+
	F+4LsLU7U3kU9GOaCii62iiYuleaUcKScBEsMd2EUdp+zua5G7oRDwJlpYwb8aYx
	R9EToc4ZAPD/eSF7SMEo9N1eDKvavn/Jvitp/gw2W4fXcTUeTKwROq0UcV+8b44U
	aQfK+rt/hNXmzZrfIPpHAgDHVxi6gJbYqcvwbcLG9HyCzM686vR8ROeFTWGolFxQ
	u9CMWAVmhPzlgKuw115/x5CoQKJYiyrOn59iYqJnoo0ynXM5ZY/RmJ78X9iVpcfd
	Ur3DiX9XjIhs5TUnUanyUEKwHtFkeRD29WC6URQ7mMrWU2S3w19xuLKb1s9ULjLk
	mImkXA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqj7yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 17:30:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c10cd7df22so1732305ad.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780335054; x=1780939854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVm4TdG5n8U+Jqzsg6ytMrzaYYKYP9UWAt7EIHGxQss=;
        b=FhRZKKgFNtgqCgLGDezBbLWRGMrpPwM2hozO5AikxaAriC0H1CynzUo7VaKTdRfzeI
         mIH3Ry1u6bFYiENErG+6QNP5fWTG5i/FJEE8jwP8cdfqgUbwusnN/hOnhQw6uG8jFMbA
         6Ewvhtwr+azd5skp2HWOkAns2Gz+srz/fGwiCPqLF97IBjuhohb475fQkrmagVC3m14f
         gesAwJ47KE90l6cxA/pVqB1Btns/086PTmfg/LEPtPGcZg993GQRFLMCETFoYcjOSd/5
         TVCg/2eGClyFw0xg9vc57S8zCKP1OydktHja+Xl8LxSIGY6H716/f0J97GjTIN4+eSJi
         FNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335054; x=1780939854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVm4TdG5n8U+Jqzsg6ytMrzaYYKYP9UWAt7EIHGxQss=;
        b=jzMHUG3XZjfjR1DPaNfQDwgWFHtJeNekazGf3mg57I33itW/efKQlFZliY9uCVb+uA
         9xV04NNOa0U4wQt2Or1ZCTx7yMzvldDDixX+XRUedGbp7PR12/IAr59KBeu+ZJe1VXfS
         0BJLhOB9ENXAr4sB6A75Zv1Zi5UVsk26NaIdsTd8e9/uN+C/jO+X9uR/YBh0UJnxj6Co
         ayA1r+jSfD9wjmFMmGo/cjHKc77sYz7jh1mbqKfHQnDkAEBYvfvFzoURqK6ZGrdWzhGb
         4jvKj5eFyPPyasGTE0T4Q4C7fr3/sPyJQc6fhwdy3GuDjxbl85KKYDZmmxx97pOEIG+6
         8ZAw==
X-Forwarded-Encrypted: i=1; AFNElJ/TeMBDlZ7B6M59UlfLGUIQQoR4XcSSAA7k5V2CX4P7wuSITXgDn+dQw8uq8KaWmx8/i6Mx3qs/CjqN@vger.kernel.org
X-Gm-Message-State: AOJu0YyGRdP8QyJ7en+G/GgzddQud78JT6HmZgq2I8O5euKtJ6jy0+Wd
	F968pxOE/pYQ32mhwah9xr+URHpeSPwQBvEAb+LA+gvuZrw+nMW0mrA2caAEtlHgR4/So7durxm
	ItjUm/kZ7RSi7QAwyrrOA9DuO5h0MXrfd39JmNTx0z8f9vzl3qBoutInoiWrGkIBn
X-Gm-Gg: Acq92OGD9cwBor9YOT4CtIWxt7EEuxkRgi5z9X6w1CpwQElNuc6ML+WwI+Ofd7mz79L
	KxhwkTuy7RN0YaT578DpeEjvQPuiSEsI3SoM4AgIYGmHWtbs2NPpKma7VmcDK+7jt3QRkTY88EQ
	uoPTpiKB7Xj12xuN0rkqcz9Sne/Jqylt0AY66P8RHpTv2ZTiiiXGBXXSmgQHvFg69ml7IL2PpMf
	Q8GKsRyIi6n2qs5MDtun1ubiXKe+9Rjomc5sqMzNHxFRY+yyi4Z/HoOqS5L3kFqmS1CvsNC9EST
	G7kBDbtgoyaSj7+1psRvCcuatvO/6MqBrFXrIXKUptWs3nfQoyWHWVYUJ48uTxFpYR34eAJWoQO
	D81qes8YhV1AsM/MXX5yzOKfTsfeGwYMBy+gXIec1Ytws2pCQfx2wcgsNwehuYfpaaRA=
X-Received: by 2002:a17:903:2f05:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2bf367b1670mr141503365ad.2.1780335053962;
        Mon, 01 Jun 2026 10:30:53 -0700 (PDT)
X-Received: by 2002:a17:903:2f05:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2bf367b1670mr141502805ad.2.1780335053501;
        Mon, 01 Jun 2026 10:30:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm149136085ad.41.2026.06.01.10.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:30:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 22:59:44 +0530
Subject: [PATCH v2 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza
 PCIe phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-eliza-v2-1-6b44c9c23d5e@oss.qualcomm.com>
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
In-Reply-To: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780335042; l=1706;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=xeSQHPitzN8ohDKs18l6esrdselqsjwFIBvIjhevBqI=;
 b=8TAw6i9HWaMl9TKddGR6bg7RHnpwPvMpNjH6kopEup+runXShivaFDIsfa7BjAa+eov0bpYQ1
 II6sIgMEXd1Bu/kukcd7mvNZ06W518oWDz9OnjtqH2oUbJ9YU6iA2qF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: se42-6-yJcY4wPjDTWxFZtM3kEmS7W6S
X-Proofpoint-GUID: se42-6-yJcY4wPjDTWxFZtM3kEmS7W6S
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1dc1ce cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=d5_U1CTwwdyySJRbjq4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE3MyBTYWx0ZWRfX0/xRbwmva7Bn
 lHMuaOwXYZawSTcFMmXjy1yRMgs6y5kAryWn++ZGfuPQAGZCaAizqmtjavyWqTrqZ+ZgTJhpM19
 eFUSH3TtjguPbzR1qipTwlzLy14pkrEXjc1kQGCbsTs4pTkYwcbasQMncN99LKZdfYJ7iItp0f2
 Ay27s9KUFn1e3gjnaysOWZRniahlM2KvGAEL3dK5/SuYD7BTjQ8b9tyCM1MnXwRurBj4diOvmFw
 BGIKXJzciy6OOvBq+L2XREj5K8XCtcoiNlotxQNt9DgE/CDz8xapRTcepMR/22Ub/xJk7PdIr10
 ci7BhzGiy7CQdIPssjVh1LdMdp4YMBgoO3cL+J8JRa98Wibw6kUELB9LXaAl4TiGCtlfHJ/MbCV
 xPa5qe2SKc3Z1864AxqQtP927ZJwdTOJUkdXUxNKq1mZzdk0HEabOVuaBFwzy+Trmq0ETNW9gdc
 xKhi38i8grG7XoLHf5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010173

Add compatibles for the Eliza PCIe QMP PHY's, which supports Gen3x1 and
Gen3x2 configurations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..be4bbc327982 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,8 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,eliza-qmp-gen3x1-pcie-phy
+      - qcom,eliza-qmp-gen3x2-pcie-phy
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
@@ -181,6 +183,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-qmp-gen3x1-pcie-phy
+              - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -206,6 +210,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-qmp-gen3x1-pcie-phy
+              - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy

-- 
2.34.1

