Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E6C32B9A8
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110955; cv=none; b=lVsWqRKA2w2eoFMarHJf2YFB6dDB6PRJ7BZrsyq6eRJ+vR6qCbHCHfxorvxEr5gsMVAK41C+8ZVfKgRxC1+vbC4SlIYQqz15T5riVrqN4xUuv8jWqj3cceITvMfYw8a/kH9PfHjC2qwrBObExVMXvm8JPqgFCELOy8u/0KeQxTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110955; c=relaxed/simple;
	bh=yGsij9VKWI7rB/vT0J8nK7LauF77nPjz0MJTy7VKUkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uQ+UD4+d70v4ULxNTvr9ZtC4xifD99iARfAhYF/dMXrd6Vj5KKO73m5mUlNjWwTlPk+LnjmhuRaPHiy7a/VuX1dTcAESB1tEEduPXN97NaRD+YJZyjn+hFI664/SVA/+4dOKALcyv1/pVWeI+OwS0igsMd6iaVjvJVadKQUoNbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbXCX3Zf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rc7IlFYk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbXCX3Zf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rc7IlFYk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPjMv888586
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 20:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=kbXCX3ZfPE8xGbMt
	vMJtWU22XsCFV4p57+53pKeA3sF8erE5WGjuAIJ4v446eiEkXE9zyhh9NUiRUtAV
	vtfMB12w8Zz7nIM3aJN8gA/DmwzV0BKfCjhOp3EVC4ygnbJAzWsHakrDG4oyQqt+
	nG3cBLf8FbOA6iGXzcsCDQbwZYAI67JatbACMAOe+6vCX0AyEq7EJrxcz3AGLtfo
	qBoQg8XhoCRmU5wJTrTsMd1eqsCOXQpB9KeAyrASJwukltn14xq18TPfZY57Z0Bi
	b7pMwGhGFFb5tNuFjx1PGGYtj9SN/GmngMJfETIFQlcjhqyyIifDM1pqW3uDuvwz
	HJ+mog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btv61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:35:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38001e788d6so1188159a91.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110953; x=1783715753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=Rc7IlFYkb9+8eZZY24ij04dvTj1us+7Ym8AQsXkT+3AHOdv39GWAXrtOoigyvZsZM2
         MQW8ypyjScl1zwIp81vpup2t+c6fHpOm96IW+OKx1tcMYZTgx9lyggr49VcTKkjJviUt
         XSc6v09Pr38WG3e0c1jAp6lAkcnh7E7uaRoQSzcvon1dGOlSJaOJgTN5iNEc13XRRdXG
         Z5ufD3hUdO3BtbemVfFP7JSGBejjrWufTtkEz5giM4tIEdLSIL/I0LNeZNxAN41d72pK
         hue7GXbsv+2o5J0gdQj6KU+sClnO8lyAnqSWSxdu1DCh1SqJ1DLve+rXKZk0SsfOXoQO
         evpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110953; x=1783715753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=Z8wzwbOVjXZbbnshX4z/l8wzaO3iMgWm2+Q/SmtfvCemivYmfDSq3Epj8nHAPIBJS4
         kUCIBWSyb/XpUkCmMfTacvLM7EU4eWMcbOSRWBGcAXQd0ohV58dOUj+h6klRneFJbqkF
         K6JDkuoxonBJq+qUanyD1F5/UTR4m4ZxjwXfb5R78hGtyDvUp5EntCA6DqqxQ+ta/Pio
         qTf/M49hw0bgHWwFTSGpUbC9jhYf67rsgIPnqje0ZAVRPurIGp1LqGLhj10V3uzXdzke
         9/vUZpxKYqYF/OXnIJay+B3yjNpBPLIlPZ9YNhRh8UkiVOHNHjjwSyLaoTg7Jh+PrkzD
         tZbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rom71XOXToi0l13/Lcr3kwGumKapgxPVtm25/c8txrYOJqgoQEuFWhby1gpTCfrATNbPdo/BVe+a7vj@vger.kernel.org
X-Gm-Message-State: AOJu0YzIYYmU18O6EX3/ktOhvkPb3qF6gsiX99pA1jlANKMeXSVBbCqU
	dqXKh7wsN51BQXRsBSsCDbizbJ8qBkGTvLNtO5SfWj+rAm39inT5c9rPcFmkWHUSlnr1n3YARdl
	33NIBNItdl3GvVYXpDeLBf6O+Ir6OC5/IjIJ9oQEk//Si3yq2uQbvM53SRdiDaXEDJtutNBUk
X-Gm-Gg: AfdE7ckD0uBKUutOecC52SQ+RIIydrDhXGfK+Bt5xO+2A7b8sfX6K53qynEQVfDh3CI
	eSPSqrRSF0gnLvWSVF6UpXkABRaht3+dJpb0/OVTRwQ1mrU927CXWeLs6xgu4lxYTMcZDXuH+8C
	3Sf80760dFUpName18lUvpCnAJ1Hl3rSnCB/wJmHat9XZ7rfOs1X9N00sZepefe1ma8H3O8F6MY
	yI+9qvQkjy0oWTTFP7GIBBnxnSzdu7spQl2fj7BlYO19FJkHWgMmQ6A+0Km2lvkRaPkXfYAcy0w
	zoSTmhyG2wnjhgYXv8nChJF1Mmy6IdS+ZsZyUS/8OWZN52D5JrzYJMvb5ALzSnHKAO23fOuAhFZ
	px2sCFnq5i6Gg5kjUxl4ZuudaVAeJ6uPyzSU=
X-Received: by 2002:a17:90b:51:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-3829f7e86c6mr859251a91.25.1783110953168;
        Fri, 03 Jul 2026 13:35:53 -0700 (PDT)
X-Received: by 2002:a17:90b:51:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-3829f7e86c6mr859230a91.25.1783110952611;
        Fri, 03 Jul 2026 13:35:52 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:52 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:30 +0530
Subject: [PATCH v4 4/9] arm64: dts: qcom: shikra: Add Adreno SMMU node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-4-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYNcq3OFs2Ql/wREKtEM5ji0GMxwTnKnJ9RpGAjMe6E=;
 b=VV53sBo/O5fZ+NGsyhq4LtyFTf/b+WQ8uGjvE91A7dZXdXWNqRQAjopFaqZ2FFIMEKi2ZmO1b
 iWCZ4r056a9Aa6iGB0aED9govTFpDOH8j0BvDycAX5GdmmELVWBCWVb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX7GF24oSKGCaB
 vCxnMq0z1YGDV905kRaRzOepKXlF7Ga5LOxWsXsnKL7NglVAY1Z4aYXPwKXif0njSrqKjgPMzsC
 HEnMTrB1NnPWxTE9mM44Doc3mD7gcEuPk8I4IHpg1BZWcF+50k4wBwfoIHRKYDDIgUgBF7LwTvI
 aNyjAcGF2ztKc1z2SXYt60rsGp9LHnE2ehm28VqTEUyD2WwucVxOcOtiyygdAYgUe58QqEO4psj
 MzZaQP1t87bxOAQef7ys4K0Nd+Wi8StwgCZk1LiClzt1eg7KOBOCc12JzQUPeTPuxXSEDsAk8C1
 vqBOP2LbGm8llbLJNr2ev1sjvdqtME3aE9D6ZMWUU03pMeqi/U1ZY5kyjQXbLJy/cC1QOf0GaR0
 Bp50uhhAcSluYn1dsKyzFi/SYIaeNZn0/cphbhtWiWTE9vaD8xbdUQjE9rpyc3JEs0FCIVMbjFl
 66CnnnOlZ/1PC3owV8g==
X-Proofpoint-ORIG-GUID: 2CX_BqiLaoK9Zaubo4tdOs36EDwAlqGc
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a481d29 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX3j5ebMNRgimr
 /V5K9rrkduzZ2PbTA0l/YQ6x8eve51xQbyZfH1xx5xhDOUD9f1mxurqvWA5p+53sGEGntG3uwyM
 SVH+1xREER2K18RBW8+1Wv1y0zUCZO0=
X-Proofpoint-GUID: 2CX_BqiLaoK9Zaubo4tdOs36EDwAlqGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index be443b362576..bb11e832d9a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2005,6 +2005,35 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.54.0

