Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B3D401A27
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089284; cv=none; b=Rqv/M5ijQDthBT+l6acwhXDZirGT1sz7hfVVgp1PtEXq/mRfDJT0zYpe+7vzvMYKOHAsNtV6QEsqPUu209QSO5nmVja+eWtMm5ME0gatlKyQ32qTp5tBTse0HAQcjZHE7pActs/3z74J+t6jitc3zxlQvJl4WWbvbBRNxXrz/Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089284; c=relaxed/simple;
	bh=kv+0+DQsZ+5rw3Z+LZdvu6rOcLL66oeZLjzWJ4X0ekw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TMyOcqCEqQ+FyCSr2guIxO9hnq+EOYF7yf3f6Of+TWeQDlp8JflpPXPYqJzYP6cKD3PDlBtomhDRO5z3LfQ/InF2XNUf9AkR0DZqqjtNk8KAuz8iq6P02FrvfDMsfWZetnqR4m0YQ+Pofon6hUZA3T4FR45MhGxsbysPiRGkIHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhJ+FBb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+fAAFo9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhJ+FBb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+fAAFo9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hjUO530210
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mztJEPWEdcGLc1Up2sWWykyke71b1U01clS63f8eofE=; b=XhJ+FBb7BtferQl1
	oUZpCLII+p7dopAMttFCpFINWfIWXT/FZ5D3dnbqLCCsGtkVEQ4+bT6uGTA7pzOm
	gwVn0nSBMtizyLv9skycrp3niT7SxYzgwKg1akf2H2Lg1aUj4dmuhnoXEcazr1At
	plyROk17Pu9kQEvkzq7Q9d7Q4H/zA3segJjvacKAnoJZdYRAKKr50pvJOBwdkToy
	8NmT0HzWsx22skpLTHRtiK1SgaXm/yR/+DwgJNAO7rSaL/K10PffFupQoaV9x/Yl
	dzMJUp0vdtoh1b9GmyEJY9E0ia0WDl0K32KQjE53BgGUBM15DINaKCw9eRc4CKA/
	kT7UQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2j370-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:01:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bc5e97950so7491241a91.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781089274; x=1781694074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mztJEPWEdcGLc1Up2sWWykyke71b1U01clS63f8eofE=;
        b=P+fAAFo9oooVd+7DQCaNyrtll4Eq3gU1j9u2SFWZX6LkO/UvbmnWqxAgksGV1DAA9s
         HCii51XZ7FAaterUqoptuFsUXHnswbyNKsStpgvRpy4I12zqGK1m6NN369g/1LsS7SK2
         EW+BKL2arjohIMGx6gU7MC5FnvFIsQj95xyKbBJb0NI8oJt+o5ZKxSQ1XbK11PUwhkAA
         KHBVNldHeMJkuk/s0O57JYDXXvAAQqMcTmYQx9GI+NIYOj/xMmri88ywQKHaVb4lK1E4
         QUmZFAABEBpvzroW+She3Ym6hHs0jEi2n2Dmx4nBjt5jwj1PLNJ3641B4G9iI/9bnEBs
         j6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089274; x=1781694074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mztJEPWEdcGLc1Up2sWWykyke71b1U01clS63f8eofE=;
        b=lAOEx1pehsXgZsaTC3SPJlHzm1BQ1QoMrvuPI9dtVsBVHiYwfaQcWuThppq/HNn+mO
         UQMaRBh1XJkolsbS8K65MPFsvXhjoR823nsgymhinkatNRS1TINwIjwdfey5bs6ir3wi
         BVcnQU83IhP2h3Em9wUrbqEeuMaJtBcPEo+oQYVHrlQ4b3dAJmAAiF8tKKudEwMpwd0Z
         hjh02TDnytb46vVktLf4WVh02TNmpPz6WPQUuG3G1iWLYyHQ7hODfpIncCP1SHCvBlJJ
         DCkCxZ+HtOJbj7oT77i+BIVViYFCPpcTZZ9efEIURRJlQlzqZsSzLf5jlA2soZTJUUlw
         mOPg==
X-Forwarded-Encrypted: i=1; AFNElJ+o5LQjNVskzIBzx9ZhW+4a7Es0zth8QbaeMAOFDz7aG6+SuHliCMQqwmgyv9jvkTduVzGMLfeIrikP@vger.kernel.org
X-Gm-Message-State: AOJu0YzsaKbBUvzjvocjLRPYJ0N8jt8FF+w2WdpFMUWzeg/p3QMZQWJ0
	STHvm+xVOMWFC1JplOKP2GM4Pzf6WYGrS0LZoW1Sik12yF+wQHCIqwW5KZhwJBSxNY2dIXe3Y9Y
	qGs1ZPRxvUVkdREKInFSOPGRz3TLaoQFUIcV9afpEMp1H2wVuxMD6gpDjl729CYu7
X-Gm-Gg: Acq92OGDPKUWXs9tECsZvrwer12vfdHpJMvLGyG0mNiUrOGrAhOMcPN0NkOGZCkFZkJ
	nnYLGHj3Grw/asz44dufe8h2T92U//LLquB/5tY56m3qs07Tjl7+PkTeYzsziDHWjsTjgEQ9Yq6
	Qdlfi32tUasMYnDScDlum/Yu9v8ViEKEQ2PBZTdyuka53IpABvpJxrHChplkbbZLH1ih007TuBf
	Ws3Pbj6LKq7SONkSKxjRCi4ibkeihUskvJ4aQMhlSGaEr9Qu6AHc42hwWE/CToSUSqLqPzw92EP
	pLPhvQj0stqs9nXndBw2sftNYn0jLHxYWMkpT7NcjqOg8gmo2Ypn6MW7oZfVHBrnpmRvZSugX1T
	WJMh8qYwk1cJawgQnE2MznPEgp3IMhvLmty6Z2uexl2US8k2AwuBvL193LKlheoJk2h5+S6SI8r
	tWCM4+sxUwxFc6Dqb2WRKguRKFw/jqayTStsNlCnmKx8bvGJAf8zLDJmiwN8d1zkbrDgo=
X-Received: by 2002:a17:90b:3512:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-370ee82fa3cmr24460671a91.1.1781089273997;
        Wed, 10 Jun 2026 04:01:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3512:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-370ee82fa3cmr24460390a91.1.1781089271724;
        Wed, 10 Jun 2026 04:01:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376246afe17sm3535131a91.11.2026.06.10.04.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:01:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:30:54 +0530
Subject: [PATCH v2 2/2] dt-bindings: PCI: qcom,pcie-ipq9574: Document the
 ipq5210 pcie controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-ipq9650_pcie_binding-v2-2-69e27a1fbf1c@oss.qualcomm.com>
References: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
In-Reply-To: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a2943fa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dAbVbwp_SXptH7tlJ5MA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNCBTYWx0ZWRfXw9pDukt5zXyC
 8qadV7jHsS/9/UuTC6zt8qVS/UEiCL3oZGA+wWlbBpgSiQ7GULS8XyuUKX+tH+Rh64J3IXfNTVI
 VYvFBOW9/Y8u1DXEKY16WSXhbVKfafe8EpNVhRhWIpgyGlwn6dP2MA8moPzAmw1dqY8Jd/TOeTl
 hDW2uNft7mZvSd9t+YFFlGRwzfCDS5lf+lcEQVIYrNvsadnIFD75ObAoLvYJpwCNL6F3G9wEi01
 YfFgYC3gvJsBPUoPygbVt22JE7sHT6yqCx6NMn1PEsQ2mYCh/hMfRK1nDdUi54HJkeAsVvm+1Qa
 Ub21nNP8JBswE3lScdaBuzwb2JF61PLlNGYWYAQRLNr952RUm+0FKj+XHPqcjYC98c59UJb6uVI
 LTxdm2sPfxlENowxtkkPmOOQztSMdpLKIMv9m3XgDF1M5M5X6gH+KwFCGZrkSw6ZSPWwtIzNg5U
 mBhcgpdlDPikGG7poWQ==
X-Proofpoint-ORIG-GUID: zTjiCyGJFbtfPIGIdVNz1uRezuXgunsi
X-Proofpoint-GUID: zTjiCyGJFbtfPIGIdVNz1uRezuXgunsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100104

From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Document the ipq5210 PCIe controller using ipq9574 as fallback compatible.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
index e92acddb969e..533079811881 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,pcie-ipq9574
       - items:
           - enum:
+              - qcom,pcie-ipq5210
               - qcom,pcie-ipq5332
               - qcom,pcie-ipq5424
               - qcom,pcie-ipq9650
@@ -88,6 +89,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pcie-ipq5210
               - qcom,pcie-ipq9650
     then:
       properties:

-- 
2.34.1

