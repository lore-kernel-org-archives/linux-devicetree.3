Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69726435AA6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357019; cv=none; b=IkxpnGDZHcGkH3lsOqS47xhxQwJJMeI4oJQYUwnBitcyc5Oxvp7WOlB41csBuIYJOP5BtbcBIMgKA1SZEuyyDWht+MAz/bnAJ9oKtV3stO32Uos6DS9RtuZ1fNOS1u2yPYqpvC4Hs5Ar9YXHA8/DfzgWODGgs4JDBn12hZ+iqS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357019; c=relaxed/simple;
	bh=G2Cd/UHUeBLQN2fTTAlASpH57IU25h8iXlFD+D/JrHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BsYQV2NV4z99CA3sBgq53zyRt0UFiuBLDg3bCJH6KzFcoSwwA9In96H8Hn9T6JBRPguIqVJzV5eaSoKUpP2RD9BXUOpikfir67l+clYpnRXtzuVERZF6w8/vd0Ii8+byUGEDjTpwUpcdYwqr4sLE0W4G+WA3drHs2pUo9elHIzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmrSm8gl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dxcmgj8x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmrSm8gl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dxcmgj8x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF60o982432
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWfEfDHzBncv/pi9+AyhHfHT0HYBarl4vGu6Az/nXSM=; b=AmrSm8glcCZwplQ2
	kXIAQik2uvZ8/h3mi703MpqxLdCkgdpqj1ps0GSiQyIGlGTn0ILnu18URKd/cjRN
	WhQZDRhT2cVSrva2EAxPk2xZP81Agj+1fimUphBuOFAiKoQnp01kDhjrOK46meEw
	S4dcBYQUWmfSSaFR/m4dcpcv8XF2EnRsqSaG4utXvWnk4IlsBEEabnY91FaI61rJ
	qUzixP3cwI4PFsj5kjjunutZP/QojESs6+VU5mT+bfeQtciFL7utXbucj7TSXDPZ
	9n3eB0rgxHhTl+tF+I7xnbUrC69sNC9h0fQdsxDZGShXeEPU+OevA5uFf9R4QleN
	BuJ0Gg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpj1rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:56:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so4668039a12.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357013; x=1783961813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWfEfDHzBncv/pi9+AyhHfHT0HYBarl4vGu6Az/nXSM=;
        b=Dxcmgj8x5W9BqCwYc+iPlQgVUaM6v5IozHe5T1bPL0BQG8P/IPoF/6vj8SqYLJ22zI
         3PzpynLCKpSWHmcMx/pXe32W6SkYh9a8n3XPYuMwjdvHPLFu9F5zPfyNDZd2XXltwqfj
         JOfEFFQBRh2kz40Uv46xbGruyzXKTG5T7QqEr2K8qWXA8BCP/KB7B+18vROsnwZbiKwJ
         gp75ShQIu8QcThoO5hL101TjPB+znNQbSkhccITjgAnSLlQxFYurqo81qkSo2YJf9/Ql
         Z4YT6eSk6AkjSPvl3UVxz/d3fc88qWsJYTiGwrHBNehjkzQVo7yeX3ksitWQhpKdzXAg
         bO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357013; x=1783961813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWfEfDHzBncv/pi9+AyhHfHT0HYBarl4vGu6Az/nXSM=;
        b=GsTLHA7Qce95pncNDwn4jqftcPB+DV79ZEIUthXrgZ07H9VsSuIYIH2ASMpGbxCAp4
         sUiQvaApe2JaNlQFO+OlvpjJXA23qpoCM6fPu7Zl1hkKptQwC1k323bvQpS9N3VD3HUa
         qWA34W8XOUuBnRFpxMZImyAVvYdjwBdDMrX1DCayGjnKWw0WTEwKsaA9llXiFrXSmtjJ
         VMGIG6PJHQsbGtgk/AXFlITGHR5OzQQ7z30pDWjGRp9GRTspvSl5E2IZvd6d4ZRIHMqc
         PgTe51Eg1Oh8ZF2W8Xxve4wd1TEIF7VCbNPq4atiAWgv2KsRLasXpLD8nyo9jL8TF85Y
         MgYg==
X-Forwarded-Encrypted: i=1; AHgh+RpmGZXhgTDp0y1l5py1XTsc9LYElSbcgMIemWJzc02NHpRwyvkuvO/8uvzKRWiX6wWSh5aiNZoShRe8@vger.kernel.org
X-Gm-Message-State: AOJu0YyyJwNcYecdTx/mpsnggcbEHK6pIhWWdElp+cIXSoyB9DdQNbGE
	FkYV7YpU6KLOWTsXcWov2vqxh5xycVkTkZWEUFmEqpRxYdXq1+3q4INhVXCHrc/Kd7gTWvynzyE
	3XBtuU3QGfOrsjLCQjpBF+pQJuh6sjHjlt53PnNNpzCjcaePslE6Wa9gJy/jamaoOCEqce7uf
X-Gm-Gg: AfdE7cndMBBcjucdnFd5XdBgjCXyBooS6Po/lNdrwdfDirMtMWtrGxrPdIxWnqWfiLL
	S1u63LPtg9ZizA1UoBzQ0MTGpnbn/m1DTH9XPXW/BEkyC4on/tRWZXWCJCoc6dXAatb8gdU/Z3I
	uQnGwKLIlvaIQPqN1oOXGnjfVVg7izzgeLyNJkFWQ1L47qPDzCd1q8xGfW8qSwptaznh/XRbQdv
	WNSbP+5reCRhvZMiryykqNPTYEt0Ic0N/Fo5LQf74tJg0KbmXWMKic3nhDxLJ3+dlqG/srIMZ1c
	0NbExk03B65nGq7ASlrT6Vi9SAv4B6Oy+fbovczFiqVI3wrn9ojD8HfD+rRm5EKFMGVkbHqeqyC
	AgnhYsRs1TnUNFgJxfo+1bvZFTXfXYhi4mM2gfSbsdw==
X-Received: by 2002:a05:6a21:9206:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3c08f00256bmr1778671637.59.1783357013399;
        Mon, 06 Jul 2026 09:56:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3c08f00256bmr1778641637.59.1783357012962;
        Mon, 06 Jul 2026 09:56:52 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:52 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:34 +0530
Subject: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=1911;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=G2Cd/UHUeBLQN2fTTAlASpH57IU25h8iXlFD+D/JrHk=;
 b=E3aaeHiOrUd5FHK/d5Be0RRksYkwbu7lJwMG6vthS+PW3jji0kN6C6H0hq9Gx21ucOO1ddRs4
 U/2VitKxsIsDyjaUbkpDSupX0WqV+pJUrxlFbLlgxX6WmpHhkLtmKX0
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bde56 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h2u_PYqE-o0iKWOXq5gA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: BfkkknkuUmKMI79nFZbUdD0vhFO9X21t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXzJiM+H01KOgS
 am7t8OL9KiPhAsGxw22JRnUXcyJ3HB4thAv8xQLqGPqLHm6aTAwEYFwwfXRcVh2rk4yL2Ruo830
 2E3S9ZH33pPDvTeSKiP3HNiOsT+w6sqhNYvb3z9PfUEr2lDrsYufPy+fUb5n6KvFI819rWnVm31
 22LeiaPY3aZclw63aCSIlTsD616TzeKQVj14dI7Lm5gKBZjrp3VrZO2jRDU+31S8X/87kEf3X1U
 xegtgqMyHv2eKuXozzKJkflKe8oQzTIRhoT3jiopUCBI3SJWo1NyyC3Apfx6ICETZxRqKiAoA9b
 Odvx8/IUmU11htaCceBbGdoj3fZe9yiP1F3oG3EVRlELEx8pCoCigFr3tpeLBUJXR55dGAcHOyD
 wmO35EcXfFFxUoBqxIZQ4nikNTLiSCDXUh3UQgGjdDaw9W2Tm27lDCymADsRXQV3y1KaADyigsw
 p+QruOdqtFJ9VGmmkVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX9mCvg8u/K8if
 XAY+RDkPxYX/EpkefZQ7rdZ9BXQBB0E4n+1GntjBpHk6oOdBo8FlOaTxtuUbssINl0imvsP8ONY
 eWwFdVx0OLkBHLF4hN1VfwKasAnC3jI=
X-Proofpoint-GUID: BfkkknkuUmKMI79nFZbUdD0vhFO9X21t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060170

Some SoC implementations require a bandwidth vote on an interconnect
path before the SMMU register space is accessible. Add the optional
'interconnects' property to the binding to allow platform DT nodes
to describe this path.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..fab8944d7b63 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -246,6 +246,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -644,6 +651,26 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+                - qcom,qcs615-smmu-500
+                - qcom,qcs8300-smmu-500
+                - qcom,sa8775p-smmu-500
+                - qcom,sc7280-smmu-500
+            - const: qcom,adreno-smmu
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1

