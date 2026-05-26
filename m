Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9238F401496
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806540; cv=none; b=S9upcU4fRK7Ch7HOIFIZK2bcMB8IhoLC4lA8Kj0vsVtdG8qf6Mz9Mv78sKwhZqe8SOsJ8am3CDbMDgH8/CMjWgHJpZHgPBITALS+QPCtc0A0ShqnDZgy4pbAZY+epYsFOQihCgbNOOibn+FpeP2Gb280LR6Voq5YRb9No7DewyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806540; c=relaxed/simple;
	bh=hEmrpLF0MW67gYArKBeGVtgmYcIX/5PJzRk7wSNO0Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iziXotLOeGNdTfCXiYD8I2p+297G8wNO0fP/eJITQKtaBlxinJa6nIgURUTxk4nbIN8pgWHQy9XZSO+xExmeNFw6ljupqIis988ffk8XREl8ABwpQVZwW6TnedpvaoSKkF3TXXhQ40wcvqBbAlnWJHtnkwd2UPPvSHhvVj3mToA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXlAaWIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6TdwSPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXlAaWIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6TdwSPf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QEIE2f1361263
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjfO9SOxMjcqAbIgumxNQ0k4LXx/d2l2hM63+y8xMpo=; b=VXlAaWIwmJK5EYUI
	UkNs+7BBkpbO1UL0oXq+c0lLegdgaJC9cDD9iveZQAs9x6GLbsP5WmM2BPtNjjXy
	5qT+hqq/dxwDAMLR1hapv6QISvpJfbyEqH/IWvx0Bhs1UcvyKfDvUwhnONr5tTBe
	dRsll0eVDUw/4IJ6v6MB1l9TpZ1mKvTi4YLholuJbaP+Od02RhQB5H156G844wWh
	gF4H/8Xtbe1YlMIgtBzaArJFbdiYcq0AQ/1qLdJ+j4EGd0JOuaROltR/+NufQlFC
	XfsOQV3/aZ/IS1FhlxFbnEjXBjgxJKqCRAlF38KVdGgZr9frKMiGuH2esQksf5wS
	zL5GQw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edd5ng35k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so5285679b3a.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806536; x=1780411336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjfO9SOxMjcqAbIgumxNQ0k4LXx/d2l2hM63+y8xMpo=;
        b=Z6TdwSPfSdb7+NHSSQYN6/4UyvafeCcKPiLgmkQXdYTrVn/UNyhEuuL9V4h+lLd4SQ
         y4I4ieIDvjJieC070FTc4ycH3eJKa4rSM6G1m1P6rbUziJ4Ih8ZRruPAmxWt+B8u5U4D
         9o7+oqQ559+Vo+3rP8h64hPhEzjW43Y0asvvwZsk0bntf/cGiiIONWndwhvI048zyrJB
         CPm3WYmkxJXXWkG3vzpJfoVr4ZVQjWXXSQNBITLMf/N/3Afgy23gfMVXlFx/ezs6PVkZ
         Of15gbJLb0c+8+i9eOO+SfY6/nod+JtHdfvrYXuQ/0L3ptOWKxb3oQNmO1EacJP6I+Ba
         Is4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806536; x=1780411336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjfO9SOxMjcqAbIgumxNQ0k4LXx/d2l2hM63+y8xMpo=;
        b=SBvwkmyGNjR2Rq8rcydClSa4tv0lmeFaCBLIFSmNjL7TX4KVH/0LxPnAgRuefP0xvb
         cFj5E7g1lhD87cuqiL1t4yhj/Po5T2KuDs1t+Tx8iTWS+wL5pinh0IRCFhj7r77hUOpv
         IDVdkD4TMKqtoHsQG1lVv0UHKERADsxjCrvWeFKRdyKsAfEarCmw7X+ClWGygBz86xlv
         nACMDZ7aqLwjCCRsRkssy3u7iqfZVz80Vs2aAHSZvI9QgEVWNUfRIbu/Re/h/jsk8twl
         b7wmmg0Bc1qZ1M4eeQgqstAZQ8uRyjuHARy+yMMIDz5KDNdjmAQfNZC5TPwBPEkgoHXM
         ZYHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6OJDvyGqHve30Z3LRFS0fLDRLu0RaLhtNO6iO4jNGfi9F5H4pCMjB/FiPyxAss+g2CyalErH7RKWc@vger.kernel.org
X-Gm-Message-State: AOJu0YwgPk5FPQyZKYr5wxwiOAUN5IeLufJ959lY/+4RRguttwQ884ns
	dh6ktF6mDyEH34FKZx24tPQO4Nfnwqpi9BIXrz0qmo6AGGbk/4S3cOcJdmdbc8TnQ/vh5XEq4ou
	Z9cqMktucGrQPHiHRRbrM7osd9PEn92rGdbHuL+Sx4CvDRV/l21g4p+Ug7xxqtvv9
X-Gm-Gg: Acq92OFTlG6jCSPH0j0LWLEH4gul+eFPbdsppcdtK7F5CMX4qHgtyF5S3jByicMfA2u
	TqrBqOc3KXdjaEP/L9m/pgf7gYVRQY8vtHrGVE03YKYcrAdPIHy9Gawsvciy8e49z2giaUHjcxI
	Tv/fUkeI+MpGcChEliEF0GCOy6n5OYrjoh5bM93WqxcHupQmMoBff/ZEOygFZkOOFFAbrOkPMua
	6zKKn2q2mI+Ka7rYA1SNKtj6RfEGjGh9GY5H+7dhr2mvndLfuhYhV6b81251l0CWBbNAUZU6qi6
	GGNcy2105GfeGcO9Jp/o+dK4ylaBRkMh693E/A1octo5Yr3y/0wi148fyiOwyWlJXjUAzbw1KDZ
	dXqTJggepTBdmE4J8T1jt+8tPYyVrYofEYiwtg/DFtNX+09+UkC+l
X-Received: by 2002:a05:6a00:8c12:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8415f32e8c8mr19004463b3a.27.1779806536445;
        Tue, 26 May 2026 07:42:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c12:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8415f32e8c8mr19004412b3a.27.1779806535918;
        Tue, 26 May 2026 07:42:15 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:15 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:02 +0530
Subject: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806526; l=1894;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=hEmrpLF0MW67gYArKBeGVtgmYcIX/5PJzRk7wSNO0Vc=;
 b=gaaHTeaT5YX7h0T0xeiCVH4zAimV20AfMBwiZOwwyrQIHqghXmhre0IZwn4uUza43qcyBi++z
 8neeKvagCaEDa8iau4fEqoE+egqDn/IUaoJFNmaGYUy3FbRK4uKdxQq
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-GUID: 04D8slHq86xewWdvsBRS7aL2K1gLzdVV
X-Authority-Analysis: v=2.4 cv=TZ+mcxQh c=1 sm=1 tr=0 ts=6a15b149 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h2u_PYqE-o0iKWOXq5gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 04D8slHq86xewWdvsBRS7aL2K1gLzdVV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX/COuaj4dLcRV
 BpRhse68UOPwfNjUhqMR0wFvx9jcMa2sewLV8JgQ16XgukzX/CYsNXo9LOft367sp1isn5XwfrO
 EnZHpzeBac7/d+9XZZh6JLmmZxRArOwk+Vgxcnxr1uHtrNTScE3G8f1hBeN7ywqBEPf9gbr3GhW
 pZh19j/bhuGqKG22tSaCQ8KKwmS61lVyhIO4Gu1H3cb0IM03vJ6DkBvVJi8UWVxZkBgzOZ/1qsH
 EHK1VSyo8qJqJaiET4n/TZaahEtVoq19RqNenatFiJr5J4RaNCIlHVGk4GLX+s63E2euao0xQlR
 BIR58906UQEgU/i8bkAdWFTHrsYzDZLytj11EHt3XQsDGhIFcsre+atLTxd2LPBUnmGkGFyL1oC
 s/s2uBXajY+nn7GGjIfUoVubeUmcv0HkYPMC/SV8uhQy5Vk7jpSJEfPSYgJ05/RPHgwkm1KSLqD
 mAgLN4MhWDmhyWcByOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126

Some SoC implementations require a bandwidth vote on an interconnect
path before the SMMU register space is accessible. Add the optional
'interconnects' property to the binding to allow platform DT nodes
to describe this path.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -243,6 +243,13 @@ properties:
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
@@ -602,6 +609,26 @@ allOf:
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

