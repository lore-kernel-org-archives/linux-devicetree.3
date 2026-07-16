Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F339E33F8A5
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215151; cv=none; b=fKsIEjC8MNtxnJG+TRPoBpHdnbSrgF5ZSvoXtQu1nQWaeaSOThwIqAhNEpaFItHVJm3o+XaEcHf9ik42os4K43fhHzmhbr7//W3eJc97W+qs/j37wBdprd1XTRffEiUVc4gjHBGPK4F8wfMiMIFmybFRxVAlRgfSm+RSrQAs65w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215151; c=relaxed/simple;
	bh=tlR8ecMcS5JNsMhM+OoOzlsiPwZjNOP61ke0c8v0oBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bxfnHFwGRMTnsMN6sdcvS2wXgVgfral/WZ/VfXPL8ijfyAO7nlGJDtArlLGg5hAw/q+AJbeJZlpLv4mdPmrQtXdtETKNYvN/Hz/xOLFvMDzsLofdf/QU7lPtQO20ZGFQ84eDYQ7YbZfsQCehkEhV2yylTyP1GaGQbac58tCOPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjbrCiJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vx3eBc6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjbrCiJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vx3eBc6C"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJcwb2946538
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=faEbXiZpLug
	I2WIF/WKwBdPlFd89WzCvjpK22BeDaco=; b=YjbrCiJHYel9f916/GI5NnLo5Tv
	vqXaBX8N0WeruaAy7HzdTssdqitk1owDkY9Kj9RZMJDStB6sI4A9MAQWmyJ6+RvG
	ZTl7JRgPGP48b3zJj7HZTvMjTuxQswm59Xpp2WfIP4NUazfc7kPEtSVEayQWHSBb
	GbRUclhh+o77d7Y27IYDBHcd0UAkEed68FiQF+ATbEs3ue5in0rGahOPzt7+0oRw
	pg8QaZu5nS1kr0Oy9PJEAFGKctCH2LyzRvSAO7jyvYwhB68AsNRv8+eot1d+tgvL
	1u4PasyfMMK2lXPYAawRg2myUn23HPs7z6e6WFadWbhAxy4Gp7vTjUoS6pA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wb6fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:19:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a651759a2so4869864b3a.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784215148; x=1784819948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faEbXiZpLugI2WIF/WKwBdPlFd89WzCvjpK22BeDaco=;
        b=Vx3eBc6CsgIvtn2O3cmLw+OsCewWJd4E+jAM3BBZiWAqCo5A6WEx1NLM5YE0pAEsp0
         0F6wWfGcoaf5Nhp681hxdRwVfSBNmXZjJ/Evw6VFMqj24Bkh2XenOxGfr3/tC7pNIJ/+
         sBkQkK4SVq+5fgFmS1UW1U2Y2Z3S62oAtuVNNI7y5miMo7H0tvtHEQg5E94YDfvzF9tM
         Z0WKKxpNEaRVG+7rJ18le7ucp4HsZc6rBIi/pVlojU/1c1VOB8T3Pt85BEwMw3GsaJhm
         gT11X9aTLr/jjXzsVQ/WwUBmzytFjgDYapjP/zx12RlHtePOaTz4Ai1XgRqJMD4ZZ5Na
         7ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784215148; x=1784819948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=faEbXiZpLugI2WIF/WKwBdPlFd89WzCvjpK22BeDaco=;
        b=XFHPRZhcHS2L/n+Q9HZ22RIvqVfi3GYQ0QEgqbUA/5DdO9FfHvXfIWB0+bvlqJUELq
         Ea3HWHYjVO4Fb2gWEUiY4uSvIWQcMRwLwIIdAiJ7A5RoTZAnDkyy8jVGkhlYlCyeZDxt
         mUVJ9gI6nK6pZBMDaIhAeMJKkDnMcxN/Yjr9ferq7bYypdWqj5l9guXMi22EE/XHJyxF
         lb2KrzJZNdONynZLmYczEL58ls+xPDg8f+TtsEiUtyHMC+wn3g54ncgQz9d41HhhrrJE
         QhyUogfQzDa5FY+4v1mUm2yq7yxlSMlQ/XWe5+Z1+2F/vMkU3lNhCcGJp0CDf3+aXA5a
         i29A==
X-Forwarded-Encrypted: i=1; AHgh+Rq1F9tLhFm02VrhdOIKteJGIUayx19nnB8jf6VU316krojARSMhHD6sVOLmqJ0Vgend2uHGYbepkZkm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0QN9E738SbagCAYTtiws/atTbAJUA5aN5ag0h7yACuZ/vkjCd
	jGM19+xJ2x1qHLX9FwxGVdXZ4GbGMh1izZo56wO+vngvtAstd4+xD5R0bw7hZV7fYKQ59/49nC5
	iBMdqpPUSSEvmUtxyyJOS61kSf7CEudZ9IdI0TRE7LtaU+ywy1J399e/vxy0SGzHe
X-Gm-Gg: AfdE7cmkPYWUZLAOPL7E1Cm19axWhBqfbmhjeszsJAiC3dzxJ0RgdJxZZ392wwrRiGh
	f/mn7tUbEKkhUqjaY7BXHwKKJ+FG3uRUQ2DTLy32f/e+SdL10ChTgcRyKUHdKXFgzAhdW6mMBLL
	HjTXCkf3RwgPpAsdm3XVbxSMPbXo/qXxZM38IITx321pdyOunOvQ2gnWNiujWSCv9b0XIh342CC
	5sFrMi32FZmQoyrFxQ8mopo1oDbsz4rr8JPYvyaA67nwYi/fuu/cFt4SSQ4KG1N5fu0kIR35HYH
	tQP9B7RDIKR0fFM2BauczTUNWwp3ijRTX/AmU8I8VjBySbEKY/+btHFcn6WU4gb0gGGJ55Au6Tm
	AxfFzEGleiAukaV7RbJIVZTP1HF6pCjD+b8yh
X-Received: by 2002:a05:6a00:2e06:b0:847:e4c7:8ca1 with SMTP id d2e1a72fcca58-8488970b172mr20422779b3a.43.1784215148446;
        Thu, 16 Jul 2026 08:19:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e06:b0:847:e4c7:8ca1 with SMTP id d2e1a72fcca58-8488970b172mr20422743b3a.43.1784215147907;
        Thu, 16 Jul 2026 08:19:07 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bfc2bsm4941616b3a.37.2026.07.16.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:19:07 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: qcom: lemans: enable audio ML offload memory and SMMU mappings
Date: Thu, 16 Jul 2026 20:48:53 +0530
Message-Id: <20260716151854.3041914-2-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
References: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58f66d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qtuJx3-IUi5I1-Rgc4kA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: -UrNI1qJD2S8GKi_4eopvVKVlDbu7tu4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfX97Aw2ArK/ATC
 6XLdITg9ChmrLUWvWUyJOQuPKy/c4z1Jgf6PDI/kNOtQscMExIRb5dDAuIw0hjYSN70+5VXH38l
 zFEuM9ZhVDoOWLeRohuLL/e7r7iUzbc=
X-Proofpoint-ORIG-GUID: -UrNI1qJD2S8GKi_4eopvVKVlDbu7tu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfX6wZ12BjeP2EE
 TbUFGsfgHzO8rxmNRUX6Q6CBjlExLMYPyXVlaCdOh9nzvh9AJzA/+wcy2Ocn2YEN+IdHtuZqB22
 fUWm4jolcFEJjAqaWW36Dc0kDfcWPXBZO7PS0oKB+xW+0wKRAMNJ8MfUwm7w7GYf8fviGqr2KsN
 WDmB2I/CgLZczBASr/HOX6Vtdfu7EX2h7eOaBsVAYoXIrBfE4NBwV2y6Sp4AnIsJUmsnkC9Qtnm
 ehaZ23vWkbOEYgTu2MIRLaftOjZiNhWVv+zTtm3J5gDoVWqhMImyj4ayKWsl8PO2EbwQAlpPq61
 OiLLt5x1UORdHPVK0eGQ4R6Aee1o7dL/doPNYBmToSSYKnx/XqFLtxhV2++OSQA4RxIAfE3Qmkx
 Drat5PGEefn9Q8OAaH70U3kYldKVYrKdfpnzBsL5/SL+wQomeGeXt8VmX4F/dcVc/9vp9UCd6gP
 5KVLf9BpjsE1xapAkMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160156

The audio ML (machine-learning) offload use case requires a contiguous,
physically addressable buffer shared with the audio DSP/SPF, and issues
DMA transactions through additional SMMU stream IDs that are not
covered by the existing ADSP mapping.

Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
aligned) and wire it to the q6apm DAIs node via memory-region. A
dedicated pool guarantees the alignment and contiguity the DSP expects
and isolates these allocations from the default CMA region.

Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
enforcing, so the ML transactions are otherwise blocked and faulted:

 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x3060
 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x3062

Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
remoteproc_adsp iommus property in the EL2 overlay so these buffers are
translated by the SMMU instead of being rejected.

Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 4 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi     | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
index 621ad930cf54..5b477346ef90 100644
--- a/arch/arm64/boot/dts/qcom/lemans-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -19,7 +19,9 @@ &iris {
 };
 
 &remoteproc_adsp {
-	iommus = <&apps_smmu 0x3000 0x0>;
+	iommus = <&apps_smmu 0x3000 0x0>,
+		<&apps_smmu 0x3060 0x9>,
+		<&apps_smmu 0x3062 0x1>;
 };
 
 &remoteproc_cdsp0 {
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..060565113784 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -624,6 +624,14 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		audio_cma_mem: qcom,audio-ml {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x1000000>;
+		};
+
 		sail_ss_mem: sail-ss@80000000 {
 			reg = <0x0 0x80000000 0x0 0x10000000>;
 			no-map;
@@ -8134,6 +8142,7 @@ q6apmbedai: bedais {
 						q6apmdai: dais {
 							compatible = "qcom,q6apm-dais";
 							iommus = <&apps_smmu 0x3001 0x0>;
+							memory-region = <&audio_cma_mem>;
 						};
 					};
 
-- 
2.34.1

