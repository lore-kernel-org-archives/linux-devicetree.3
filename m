Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172828;
	b=RbbnUfozmC9kVwhCy/+/DfZ3Ms2LIiIGidLcvt5hdKUJREK8g2VeZaOJKNoyioYx0YMp
	 5DOCQQyiVnY1AVnl9e/rOVC9os8TRyRWvlZPXGOSGeYih3eU/XJD0qpQHHhMAztywlDnh
	 cLq+VYDOx7cVAwMBOYz75FQYRo9DdQtBTZky8paKolT4cGsHA4zlubNIFTEOHhDz14h0e
	 8NTDjAFsG7Tbg1mkEYqDUaEPljTJThL7hEWlzII1nL13Hvw7UfV8J0fWXYkle5VeXNgck
	 Jc1jafwdwU/EWsUuje8SE+J4bnvt4alqTqg1b4dGSeggbvorabgm7SpSVcqmF8ZYMTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
	b=u45dkHr51UGf6O8X8JMVX1x9IhgxWn4tMaySuGQTjmueOBB0TgjFjDSaXQqZFw/aEsBE
	 wafbeiQ2ftWefh4nrJ7vMuTOfz8cFKZafWl36Pf0xRuGUAnW1z3YLnxLNCDMWx6T1wUoR
	 RJP2i7y9gCTf9HFXTliWPgomzsOkuuGFYNq0w3uXBOD/J/sxGHmZqdK2LK+dLiJ8Y3F3R
	 KlMmXI6cax9tMfRIggzaW2fKmDNHZRMG1nvpaKZT+EH+ZO6inWaPZnDnA/YyOy3TV7Zpg
	 cBo6Hks98SMAUClHcyRgp7xCzNXfubp86tl7WpNoezHlWgS9dN19c1DZ10viYDRWxpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blpj9S3j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VgeuW6J+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C889606A332
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C889606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blpj9S3j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VgeuW6J+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjv1v2155197
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=; b=Blpj9S3jBEpimAqR
	kcnxRQbtKRqltk8V1M9qtQpYbyVMXPlKJNXCkEk4qw6pHhw3kOBmuiHQorn6HDfi
	stMDbLOtYugmbrzXfUN7ks5CaHgJFmia9ruy5rydRPVgKmZ/ujFWUwQXwOQ4vcBr
	MJ5F3/7/Jh/xiwAdKF8J1tcu7YfgggUB6om0hBMGWvXd+wQNWY1xYzY0by7QKZpE
	b/IXdF2sSKg7lSq5Kdo7G4qRGGgkYd4GiTGz+rm9u7NWo7/OkuGFbx+3+a7yTXwi
	uzv/bbd+qZK92CSrYPZ7TLYAW6EwtMuZwh19jFHDuvbZnbWuoVVsAZcmMkSWiaEa
	3Go6aw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhk29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so591640eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172826; x=1795777626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=VgeuW6J+EpSR2zAUlJWkLgweV6C0zFVl/6Yd8fym1MmZwVSUt5Uij3FRoU9zrYGuje
         JKZsnZIlhRb0UELh7tjEm46FKZW+zLsXMHGZnet9lj9ZT6mkYoeo678O8nNPLdmjlq7t
         y8eIZb1QH+rtJXfFnqjJQlFkgHgVmB5yVEWgt8xM11gcwKOaoWeQPUFecIrx+Dx0ox3R
         8xGe3BHd6fsBpSbyNZXjoyx50vyMkVlCWNekMHPhyPtq+wTsCyUIxX8MrHUTRMMTFI3t
         mrRSp+JOJFEgg9plKePZYv3IuF+nhDBrYg84IvL1C6zN/9lJ0LHq1w7bMlhtlFJsH6O3
         i0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172826; x=1795777626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=YRB/QNafPVMMWkjsQZXCmSINsdGxQxdhpZqrbFyXBkLVWj0JkdbYeRhvBnaAUZZ6X2
         8DJmFYHadI40j2LwHce01lxrtw7xNa1ClR3ayYFihc8BAG2Id7m2VDbZJtYj1oUXoW7P
         js1doUYSzxeNAgEVQs6hKrdTU6oEaezHCBbtYQoTEN4mSQsMU1ZVKZu07lkAbTBNnaND
         osPyBTV8AieYw/LvgYzYby73QS9qEdyQWr31qb8MwDR8cWwUn6JlOouOdkL6vblXtqVa
         B47mLS6feS5ziH9CS7CjALkO/m/JyewRR1HwN33Oy2iVdOaSO+H2WTfJ3D1J+b6MU3pc
         Gc6g==
X-Forwarded-Encrypted: i=1; AL+hErEOAJU+7nTvsAbLpITguYzpe5r34vqRmga7mSCVslk/ctpx8dymEOj7STNdY2cXmgMa/memOD+RWynX@vger.kernel.org
X-Gm-Message-State: APuU4Z/MOAIsduTwYMXgePCzB6YkKhoqIiMYoHhSiEzh2qcDMn9RPYEB
	HM2nxz5XfVT/UWSMBLBQV04DHxPLwR+eT1su1z9m0wuH7LXp3eSAY3Ekfd0uDGdCgqUTpDX4Xq6
	qmNa62z6QznVY+q7tN7Cee9OK8Da2ZE5CyEJxfrMpk1UHNjeeSFoE317af9QkSx0v
X-Gm-Gg: AZFdTZfZYTIACqSwG4Q/ol0PQjHTe9fXkT/iUk1OWDfF3lUUq1GvR4kaoVV50xJ1fRO
	ec7Su7lOAcNmco3LuvLGUMM9qx5OTP9zKVRqa1uIgVXxFU7vGkACTdxH0C3qCP0fmy8+k6owTma
	907smO7Pd6o9Q1VQqRAcARxE474uqWRuawMJfiO5Szr/Qam1z2dep2Ku0ah+DSPJOaEI930vgGt
	yWxIenEli3qed173blEc5s5F/V1st7hnPF4GzO5s9vyK8Kiemil3/veTdAPXUHjYJLT9xtQeXKA
	XEikrEGgBMBDseB9gduEUPer52tNbHyoBzGeiDuZxXmgXK+ybcOtVl1WZrBsispv0zudFJfV+Kv
	hcpHqibZ9um4htCcEs9FgemItLvqYoBHoPbm2uyfQIEkv+oSWQ4exo4omLvm5vPdnfdWknfofag
	pX6WfA
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id 5a478bee46e88-3856c6b00fdmr2845766eec.2.1795172825826;
        Fri, 20 Nov 2026 03:07:05 -0800 (PST)
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id 5a478bee46e88-3856c6b00fdmr2845713eec.2.1795172825017;
        Fri, 20 Nov 2026 03:07:05 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:04 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:44 +0530
Subject: [PATCH v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-3-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1065;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nfp8+SD9J7PQP1TIlHLZz6YXOr5xoEhGVTCZWtBdhd4=;
 b=9enQAwhrtiAROoFA0A0yXkaYWGcoYyy6fPoNMJULacdk9ULbL9BFKhSfPzmdlWfAc50CSpTuM
 BXgU2EZNUdlAiuErjAsMTVcYGtW9zxqDvZf9rLcNWXZVHqRoHeGmXEN
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b0029da cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyFlmi7/sgMAA
 GBgYTfMoRvr4lREEOqr9JLMTvKuZlXbyUcr8K0pP0Bb8F4Q5VWZQL2ZSQdejmVtwyDY1+o2vRIh
 fWWnpbANXCbttKCrgh+nYJAeVwiCIyEeYTGNNqRWgpzdcLRapu3yXMxZ84Nom59ghUNCm9eL+H3
 BJl6yQxj4WAowYfsZwSfseP/SVGD/mDEMKK1ZjU1o6wiSZHcFUsFaRfVFuory60anHGwIAu3/Y+
 xmeZLczYy3OuoyLW0puwfIrQlhlTcJ30CwYVAVZ1c4GfK49oczoUXfEFD5EsOjvg/qf91Yxh3Tm
 uPs2EkTdR9n56PPsioQEq0WA0jVjRSQdujl4boUonOuOLj5rHntMR3ZsOeyxEEqeq8H4CpaJZyV
 jfLOV6/OybFRbrfskj684xFLhr6Osmyy3aTSZXKOmJSN1VPXfIXgaLUeZgy+V9PM3EM917fK0Ip
 htIgQC+qsZjts7UWyGw==
X-Proofpoint-GUID: tR2EdTcHtQS66EAv_9_EWp8PCjfRwLkI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2YpBQ5bH/QRt
 B/f+ge0s+z5HJYdOuo06HwSPkmslM8XZQ+SzJAb9sQCckKmvVnujnMno+lOOrtVjzHFPBSlS6Xs
 lREA0jARTpiDDQhaBiM5OjQtGEMKw3Q=
X-Proofpoint-ORIG-GUID: tR2EdTcHtQS66EAv_9_EWp8PCjfRwLkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed6..c142c7cb509f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3413,6 +3413,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1

